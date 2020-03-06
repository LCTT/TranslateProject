Cgo and Python
============================================================

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_hero.png?auto=format&w=1900&dpr=1)



If you look at the [new Datadog Agent][8], you might notice most of the codebase is written in Go, although the checks we use to gather metrics are still written in Python. This is possible because the Datadog Agent, a regular Go binary, [embeds][9] a CPython interpreter that can be called whenever it needs to execute Python code. This process can be made transparent using an abstraction layer so that you can still write idiomatic Go code even when there’s Python running under the hood.

[video](https://youtu.be/yrEi5ezq2-c)

There are a number of reasons why you might want to embed Python in a Go application:

*   It is useful during a port; gradually moving portions of an existing Python project to the new language without losing any functionality during the process.

*   You can reuse existing Python software or libraries without re-implementing them in the new language.

*   You can dynamically extend your software by loading and executing regular Python scripts, even at runtime.

The list could go on, but for the Datadog Agent the last point is crucial: we want you to be able to execute custom checks or change existing ones without forcing you to recompile the Agent, or in general, to compile anything.

Embedding CPython is quite easy and well documented. The interpreter itself is written in C and a C API is provided to programmatically perform operations at a very low level, like creating objects, importing modules, and calling functions.

In this article we’ll show some code examples, and we’ll focus on keeping the Go code idiomatic while interacting with Python at the same time, but before we proceed we need to address a small gap: the embedding API is C but our main application is Go, how can this possibly work?

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_1.png?auto=format&fit=max&w=847)

### Introducing cgo

There are [a number of good reasons][10] why you might not want to introduce cgo in your stack, but embedding CPython is one of those cases where you must. [Cgo][11] is not a language nor a compiler. It’s a [Foreign Function Interface][12] (FFI), a mechanism we can use in Go to invoke functions and services written in a different language, specifically C.

When we say “cgo” we’re actually referring to a set of tools, libraries, functions, and types that are used by the go toolchain under the hood so we can keep doing `go build` to get our Go binaries. An absolutely minimal example of a program using cgo looks like this:

```
package main

// #include <float.h>
import "C"
import "fmt"

func main() {
    fmt.Println("Max float value of float is", C.FLT_MAX)
}

```

The comment block right above the `import "C"` instruction is called a “preamble” and can contain actual C code, in this case an header inclusion. Once imported, the “C” pseudo-package lets us “jump” to the foreign code, accessing the `FLT_MAX` constant. You can build the example by invoking `go build`, the same as if it was plain Go.

If you want to have a look at all the work cgo does under the hood, run `go build -x`. You’ll see the “cgo” tool will be invoked to generate some C and Go modules, then the C and Go compilers will be invoked to build the object modules and finally the linker will put everything together.

You can read more about cgo on the [Go blog][13]. The article contains more examples and few useful links to get further into details.

Now that we have an idea of what cgo can do for us, let’s see how we can run some Python code using this mechanism.
![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_2.png?auto=format&fit=max&w=847)

### Embedding CPython: a primer

A Go program that, technically speaking, embeds CPython is not as complicated as you might expect. In fact, at the bare minimum, all we have to do is initialize the interpreter before running any Python code and finalize it when we’re done. Please note that we’re going to use Python 2.x throughout all the examples but everything we’ll see can be applied to Python 3.x as well with very little adaptation. Let’s look at an example:

```
package main

// #cgo pkg-config: python-2.7
// #include <Python.h>
import "C"
import "fmt"

func main() {
    C.Py_Initialize()
    fmt.Println(C.GoString(C.Py_GetVersion()))
    C.Py_Finalize()
}

```

The example above does exactly what the following Python code would do:

```
import sys
print(sys.version)

```

You can see we put a `#cgo` directive in the preamble; those directives are passed to the toolchain to let you change the build workflow. In this case, we tell cgo to invoke “pkg-config” to gather the flags needed to build and link against a library called “python-2.7” and pass those flags to the C compiler. If you have the CPython development libraries installed in your system along with pkg-config, this would let you keep using a plain `go build` to compile the example above.

Back to the code, we use `Py_Initialize()` and `Py_Finalize()` to set up and shut down the interpreter and the `Py_GetVersion` C function to retrieve the string containing the version information for the embedded interpreter.

If you’re wondering, all the cgo bits we need to put together to invoke the C Python API are boilerplate code. This is why the Datadog Agent relies on [go-python][14] for all the embedding operations; the library provides a Go friendly thin wrapper around the C API and hides the cgo details. This is another basic embedding example, this time using go-python:

```
package main

import (
    python "github.com/sbinet/go-python"
)

func main() {
    python.Initialize()
    python.PyRun_SimpleString("print 'hello, world!'")
    python.Finalize()
}

```

This looks closer to regular Go code, no more cgo exposed and we can use Go strings back and forth while accessing the Python API. Embedding looks powerful and developer friendly. Time to put the interpreter to good use: let’s try to load a Python module from disk.

We don’t need anything complex on the Python side, the ubiquitous “hello world” will serve the purpose:

```
# foo.py
def hello():
    """
    Print hello world for fun and profit.
    """
    print "hello, world!"

```

The Go code is slightly more complex but still readable:

```
// main.go
package main

import "github.com/sbinet/go-python"

func main() {
    python.Initialize()
    defer python.Finalize()

    fooModule := python.PyImport_ImportModule("foo")
    if fooModule == nil {
        panic("Error importing module")
    }

    helloFunc := fooModule.GetAttrString("hello")
    if helloFunc == nil {
        panic("Error importing function")
    }

    // The Python function takes no params but when using the C api
    // we're required to send (empty) *args and **kwargs anyways.
    helloFunc.Call(python.PyTuple_New(0), python.PyDict_New())
}

```

Once built, we need to set the `PYTHONPATH` environment variable to the current working dir so that the import statement will be able to find the `foo.py`module. From a shell, the command would look like this:

```
$ go build main.go && PYTHONPATH=. ./main
hello, world!

```
![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_3.png?auto=format&fit=max&w=847)

### The dreadful Global Interpreter Lock

Having to bring in cgo in order to embed Python is a tradeoff: builds will be slower, the Garbage Collector won’t help us managing memory used by the foreign system, and cross compilation will be non-trivial. Whether or not these are concerns for a specific project can be debated, but there’s something I deem not negotiable: the Go concurrency model. If we couldn’t run Python from a goroutine, using Go altogether would make very little sense.

Before playing with concurrency, Python, and cgo, there’s something we need to know: it’s the Global Interpreter Lock, also known as the GIL. The GIL is a mechanism widely adopted in language interpreters (CPython is one of those) preventing more than one thread from running at the same time. This means that no Python program executed by CPython will be ever able to run in parallel within the same process. Concurrency is still possible and in the end, the lock is a good tradeoff between speed, security, and implementation simplicity. So why should this pose a problem when it comes to embedding?

When a regular, non-embedded Python program starts, there’s no GIL involved to avoid useless overhead in locking operations; the GIL starts the first time some Python code requests to spawn a thread. For each thread, the interpreter creates a data structure to store information about the current state and locks the GIL. When the thread has finished, the state is restored and the GIL unlocked, ready to be used by other threads.

When we run Python from a Go program, none of the above happens automatically. Without the GIL, multiple Python threads could be created by our Go program. This could cause a race condition leading to fatal runtime errors, and most likely a segmentation fault bringing down the whole Go application.

The solution to this problem is to explicitly invoke the GIL whenever we run multithreaded code from Go; the code is not complex because the C API provides all the tools we need. To better expose the problem, we need to do something CPU bounded from Python. Let’s add these functions to our foo.py module from the previous example:

```
# foo.py
import sys

def print_odds(limit=10):
    """
    Print odds numbers < limit
    """
    for i in range(limit):
        if i%2:
            sys.stderr.write("{}\n".format(i))

def print_even(limit=10):
    """
    Print even numbers < limit
    """
    for i in range(limit):
        if i%2 == 0:
            sys.stderr.write("{}\n".format(i))

```

We’ll try to print odd and even numbers concurrently from Go, using two different goroutines (thus involving threads):

```
package main

import (
    "sync"

    "github.com/sbinet/go-python"
)

func main() {
    // The following will also create the GIL explicitly
    // by calling PyEval_InitThreads(), without waiting
    // for the interpreter to do that
    python.Initialize()

    var wg sync.WaitGroup
    wg.Add(2)

    fooModule := python.PyImport_ImportModule("foo")
    odds := fooModule.GetAttrString("print_odds")
    even := fooModule.GetAttrString("print_even")

    // Initialize() has locked the the GIL but at this point we don't need it
    // anymore. We save the current state and release the lock
    // so that goroutines can acquire it
    state := python.PyEval_SaveThread()

    go func() {
        _gstate := python.PyGILState_Ensure()
        odds.Call(python.PyTuple_New(0), python.PyDict_New())
        python.PyGILState_Release(_gstate)

        wg.Done()
    }()

    go func() {
        _gstate := python.PyGILState_Ensure()
        even.Call(python.PyTuple_New(0), python.PyDict_New())
        python.PyGILState_Release(_gstate)

        wg.Done()
    }()

    wg.Wait()

    // At this point we know we won't need Python anymore in this
    // program, we can restore the state and lock the GIL to perform
    // the final operations before exiting.
    python.PyEval_RestoreThread(state)
    python.Finalize()
}

```

While reading the example you might note a pattern, the pattern that will become our mantra to run embedded Python code:

1.  Save the state and lock the GIL.

2.  Do Python.

3.  Restore the state and unlock the GIL.

The code should be straightforward but there’s a subtle detail we want to point out: notice that despite seconding the GIL mantra, in one case we operate the GIL by calling `PyEval_SaveThread()` and `PyEval_RestoreThread()`, in another (look inside the goroutines) we do the same with `PyGILState_Ensure()`and `PyGILState_Release()`.

We said when multithreading is operated from Python, the interpreter takes care of creating the data structure needed to store the current state, but when the same happens from the C API, we’re responsible for that.

When we initialize the interpreter with go-python, we’re operating in a Python context. So when `PyEval_InitThreads()` is called it initializes the data structure and locks the GIL. We can use `PyEval_SaveThread()` and `PyEval_RestoreThread()` to operate on already existing state.

Inside the goroutines, we’re operating from a Go context and we need to explicitly create the state and remove it when done, which is what `PyGILState_Ensure()` and `PyGILState_Release()` do for us.
![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_4.png?auto=format&fit=max&w=847)

### Unleash the Gopher

At this point we know how to deal with multithreading Go code executing Python in an embedded interpreter but after the GIL, another challenge is right around the corner: the Go scheduler.

When a goroutine starts, it’s scheduled for execution on one of the `GOMAXPROCS`threads available—[see here][15] for more details on the topic. If a goroutine happens to perform a syscall or call C code, the current thread hands over the other goroutines waiting to run in the thread queue to another thread so they can have better chances to run; the current goroutine is paused, waiting for the syscall or the C function to return. When this happens, the thread tries to resume the paused goroutine, but if this is not possible, it asks the Go runtime to find another thread to complete the goroutine and goes to sleep. The goroutine is finally scheduled to another thread and it finishes.

With this in mind, let’s see what can happen to a goroutine running some Python code when a goroutine is moved to a new thread::

1.  Our goroutine starts, performs a C call, and pauses. The GIL is locked.

2.  When the C call returns, the current thread tries to resume the goroutine, but it fails.

3.  The current thread tells the Go runtime to find another thread to resume our goroutine.

4.  The Go scheduler finds an available thread and the goroutine is resumed.

5.  The goroutine is almost done and tries to unlock the GIL before returning.

6.  The thread ID stored in the current state is from the original thread and is different from the ID of the current thread.

7.  Panic!

Luckily for us, we can force the Go runtime to always keep our goroutine running on the same thread by calling the LockOSThread function from the runtime package from within a goroutine:

```
go func() {
    runtime.LockOSThread()

    _gstate := python.PyGILState_Ensure()
    odds.Call(python.PyTuple_New(0), python.PyDict_New())
    python.PyGILState_Release(_gstate)
    wg.Done()
}()

```

This will interfere with the scheduler and might introduce some overhead, but it’s a price that we’re willing to pay to avoid random panics.

### Conclusions

In order to embed Python, the Datadog Agent has to accept a few tradeoffs:

*   The overhead introduced by cgo.

*   The task of manually handling the GIL.

*   The limitation of binding goroutines to the same thread during execution.

We’re happy to accept each of these for the convenience of running Python checks in Go. But by being conscious of the tradeoffs, we’re able to minimize their effect. Regarding other limitations introduced to support Python, we have few countermeasures to contain potential issues:

*   The build is automated and configurable so that devs have still something very similar to `go build`.

*   A lightweight version of the agent can be built stripping out Python support entirely simply using Go build tags.

*   Such a version only relies on core checks hardcoded in the agent itself (system and network checks mostly) but is cgo free and can be cross compiled.

We’ll re-evaluate our options in the future and decide whether keeping around cgo is still worth it; we could even reconsider whether Python as a whole is still worth it, waiting for the [Go plugin package][16] to be mature enough to support our use case. But for now the embedded Python is working well and transitioning from the old Agent to the new one couldn’t be easier.

Are you a polyglot who loves mixing different programming languages? Do you love learning about the inner workings of languages to make your code more performant? [Join us at Datadog!][17]

--------------------------------------------------------------------------------

via: https://www.datadoghq.com/blog/engineering/cgo-and-python/

作者：[ Massimiliano Pippi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/masci
[1]:http://twitter.com/share?url=https://www.datadoghq.com/blog/engineering/cgo-and-python/
[2]:http://www.reddit.com/submit?url=https://www.datadoghq.com/blog/engineering/cgo-and-python/
[3]:https://www.linkedin.com/shareArticle?mini=true&url=https://www.datadoghq.com/blog/engineering/cgo-and-python/
[4]:https://www.datadoghq.com/blog/category/under-the-hood
[5]:https://www.datadoghq.com/blog/tag/agent
[6]:https://www.datadoghq.com/blog/tag/golang
[7]:https://www.datadoghq.com/blog/tag/python
[8]:https://github.com/DataDog/datadog-agent/
[9]:https://docs.python.org/2/extending/embedding.html
[10]:https://dave.cheney.net/2016/01/18/cgo-is-not-go
[11]:https://golang.org/cmd/cgo/
[12]:https://en.wikipedia.org/wiki/Foreign_function_interface
[13]:https://blog.golang.org/c-go-cgo
[14]:https://github.com/sbinet/go-python
[15]:https://morsmachine.dk/go-scheduler
[16]:https://golang.org/pkg/plugin/
[17]:https://www.datadoghq.com/careers/
