[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dynamically scoped variables in Go)
[#]: via: (https://dave.cheney.net/2019/12/08/dynamically-scoped-variables-in-go)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Dynamically scoped variables in Go
======

This is a thought experiment in API design. It starts with the classic Go unit testing idiom:

```
func TestOpenFile(t *testing.T) {
        f, err := os.Open("notfound")
        if err != nil {
                t.Fatal(err)
        }

        // ...
}
```

What’s the problem with this code? The assertion. `if err != nil { ... }` is repetitive and in the case where multiple conditions need to be checked, somewhat error prone if the author of the test uses `t.Error` not `t.Fatal`, eg:

```
f, err := os.Open("notfound")
if err != nil {
        t.Error(err)
}
f.Close() // boom!
```

What’s the solution? DRY it up, of course, by moving the repetitive assertion logic to a helper:

```
func TestOpenFile(t *testing.T) {
        f, err := os.Open("notfound")
        check(t, err)

        // ...
}

func check(t *testing.T, err error) {
       if err != nil {
                t.Helper()
                t.Fatal(err)
        }
}
```

Using the `check` helper the code is a little cleaner, and clearer, _check the error_, and hopefully the indecision between `t.Error` and `t.Fatal` has been solved. The downside of abstracting the assertion to a helper function is now you need to pass a `testing.T` into _each and every invocation_. Worse, you need to pass a `*testing.T` to everything that needs to call `check`, transitively, just in case.

This is ok, I guess, but I will make the observation that the `t` variable is only needed _when the assertion fails_ — and even in a testing scenario, most of the time, most of the tests pass, so that means reading, and writing, all these `t`‘s is a constant overhead for the relatively rare occasion that a test fails.

What about if we did something like this instead?

```
func TestOpenFile(t *testing.T) {
        f, err := os.Open("notfound")
        check(err)

        // ...
}

func check(err error) {
        if err != nil {
                panic(err.Error())
        }
}
```

Yeah, that’ll work, but it has a few problems

```
% go test
--- FAIL: TestOpenFile (0.00s)
panic: open notfound: no such file or directory [recovered]
        panic: open notfound: no such file or directory

goroutine 22 [running]:
testing.tRunner.func1(0xc0000b4400)
        /Users/dfc/go/src/testing/testing.go:874 +0x3a3
panic(0x111b040, 0xc0000866f0)
        /Users/dfc/go/src/runtime/panic.go:679 +0x1b2
github.com/pkg/expect_test.check(...)
        /Users/dfc/src/github.com/pkg/expect/expect_test.go:18
github.com/pkg/expect_test.TestOpenFile(0xc0000b4400)
        /Users/dfc/src/github.com/pkg/expect/expect_test.go:10 +0xa1
testing.tRunner(0xc0000b4400, 0x115ac90)
        /Users/dfc/go/src/testing/testing.go:909 +0xc9
created by testing.(*T).Run
        /Users/dfc/go/src/testing/testing.go:960 +0x350
exit status 2
```

Let’s start with the good; we didn’t have to pass a `testing.T` every place we call `check`, the test fails immediately, and we get a nice message in the panic — albeit twice. But _where_ the assertion failed is hard to see. It occurred on `expect_test.go:11` but you’d be forgiven for not knowing that.

So `panic` isn’t really a good solution, but there’s something in this stack trace that is — can you see it? Here’s a hint, `github.com/pkg/expect_test.TestOpenFile(0xc0000b4400)`.

`TestOpenFile` has a `t` value, it was passed to it by `tRunner`, so there’s a `testing.T` in memory at address `0xc0000b4400`. What if we could get access to that `t` inside `check`? Then we could use it to call `t.Helper` and `t.Fatal`. Is that possible?

### Dynamic scoping

What we want is to be able to access a variable whose declaration is neither global, or local to the function, but somewhere higher in the call stack. This is called _dynamic scoping_. Go doesn’t support dynamic scoping, but it turns out, for restricted cases, we can fake it. I’ll skip to the chase:

```
// getT returns the address of the testing.T passed to testing.tRunner
// which called the function which called getT. If testing.tRunner cannot
// be located in the stack, say if getT is not called from the main test
// goroutine, getT returns nil.
func getT() *testing.T {
        var buf [8192]byte
        n := runtime.Stack(buf[:], false)
        sc := bufio.NewScanner(bytes.NewReader(buf[:n]))
        for sc.Scan() {
                var p uintptr
                n, _ := fmt.Sscanf(sc.Text(), "testing.tRunner(%v", &p)
                if n != 1 {
                        continue
                }
                return (*testing.T)(unsafe.Pointer(p))
        }
        return nil
}
```

We know that each `Test` is called by the `testing` package in its own goroutine (see the stack trace above). The `testing` package launches the test via a function called `tRunner` which takes a `*testing.T` and a `func(*testing.T)` to invoke. Thus we grab a stack trace of the current goroutine, scan through it for the line beginning with `testing.tRunner` — which can only be the `testing` package as `tRunner` is a private function — and parse the address of the first parameter, which is a pointer to a `testing.T`. With a little `unsafe` we convert the raw pointer back to a `*testing.T` and we’re done.

If the search fails then it is likely that `getT` wasn’t called from a `Test`. This is actually ok because the reason we needed the `*testing.T` was to call `t.Fatal` and the testing package already requires that `t.Fatal` be called from the [main test goroutine][1].

```
import "github.com/pkg/expect"

func TestOpenFile(t *testing.T) {
        f, err := os.Open("notfound")
        expect.Nil(err)

        // ...
}
```

Putting it all together we’ve eliminated the assertion boilerplate and possibly made the expectation of the test a little clearer to read, _after opening the file `err` is expected to be nil_.

### Is this fine?

At this point you should be asking, _is this fine?_ And the answer is, no, this is not fine. You should be screaming internally at this point. But it’s probably worth introspecting those feelings of revulsion.

Apart from the inherent fragility of scrobbling around in a goroutine’s call stack, there are some serious design issues:

  1. The `expect.Nil`‘s behaviour now depends on _who called it_. Provided with the same arguments it may have different behaviour depending on where it appears in the call stack — this is unexpected.
  2. Taken to the extreme dynamic scoping effective brings into the scope of a single function all the variables passed into any function that preceded it. It is a side channel for passing data in to and out of functions that is not explicitly documented in function declaration.



Ironically these are precisely the critiques I have of [`context.Context`][2]. I’ll leave it to you to decide if they are justified.

### A final word

This is a bad idea, no argument there. This is not a pattern you should ever use in production code. But, this isn’t production code, it’s a test, and perhaps there are different rules that apply to test code. After all, we use mocks, and stubs, and monkey patching, and type assertions, and reflection, and helper functions, and build flags, and global variables, all so we can test our code effectively. None of those, uh, _hacks_ will ever show up in the production code path, so is it really the end of the world?

If you’ve read this far perhaps you’ll agree with me that as unconventional as this approach is, not having to pass a `*testing.T` into every function that could possibly need to assert something transitively, makes for clearer test code.

So maybe, in this case, the ends do justify the means.

* * *

If you’re interested, I’ve put together a [small assertion library][3] using this pattern. _Caveat emptor_.

#### Related posts:

  1. [Go, without package scoped variables][4]
  2. [On declaring variables][5]
  3. [A whirlwind tour of Go’s runtime environment variables][6]
  4. [You shouldn’t name your variables after their types for the same reason you wouldn’t name your pets “dog” or “cat”][7]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/12/08/dynamically-scoped-variables-in-go

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://golang.org/pkg/testing/#T.FailNow
[2]: https://dave.cheney.net/2017/01/26/context-is-for-cancelation
[3]: https://github.com/pkg/expect
[4]: https://dave.cheney.net/2017/06/11/go-without-package-scoped-variables (Go, without package scoped variables)
[5]: https://dave.cheney.net/2014/05/24/on-declaring-variables (On declaring variables)
[6]: https://dave.cheney.net/2015/11/29/a-whirlwind-tour-of-gos-runtime-environment-variables (A whirlwind tour of Go’s runtime environment variables)
[7]: https://dave.cheney.net/2019/01/29/you-shouldnt-name-your-variables-after-their-types-for-the-same-reason-you-wouldnt-name-your-pets-dog-or-cat (You shouldn’t name your variables after their types for the same reason you wouldn’t name your pets “dog” or “cat”)
