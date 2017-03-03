translating---geekpi

Compile-time assertions in Go
============================================================


This post is about a little-known way to make compile-time assertions in Go. You probably shouldn’t use it, but it is interesting to know about.

As a warm-up, here’s a fairly well-known form of compile-time assertions in Go: Interface satisfaction checks.

In this code ([playground][1]), the `var _ =` line ensures that type `W` is a `stringWriter`, as checked for by [`io.WriteString`][2].

```
package main

import "io"

type W struct{}

func (w W) Write(b []byte) (int, error)       { return len(b), nil }
func (w W) WriteString(s string) (int, error) { return len(s), nil }

type stringWriter interface {
	WriteString(string) (int, error)
}

var _ stringWriter = W{}

func main() {
	var w W
	io.WriteString(w, "very long string")
}
```

If you comment out `W`’s `WriteString` method, the code will not compile:

```
main.go:14: cannot use W literal (type W) as type stringWriter in assignment:
	W does not implement stringWriter (missing WriteString method)
```

This is useful. For most types that satisfy both `io.Writer` and `stringWriter`, if you eliminate the `WriteString` method, everything will continue to work as it did before, but with worse performance.

Rather than trying to write a fragile test for a performance regression using [`testing.T.AllocsPerRun`][3], you can simply protect your code with a compile-time assertion.

Here’s [a real world example of this technique from package io][4].

* * *

OK, onward to obscurity!

Interface satisfaction checks are great. But what if you wanted to check a plain old boolean expression, like `1+1==2`?

Consider this code ([playground][5]):

```
package main

import "crypto/md5"

type Hash [16]byte

func init() {
	if len(Hash{}) < md5.Size {
		panic("Hash is too small")
	}
}

func main() {
	// ...
}
```

`Hash` is perhaps some kind of abstracted hash result. The `init` function ensures that it will work with [crypto/md5][6]. If you change `Hash` to be (say) `[8]byte`, it’ll panic when the process starts. However, this is a run-time check. What if we wanted it to fail earlier?

Here’s how. (There’s no playground link, because this doesn’t work on the playground.)

```
package main

import "C"

import "crypto/md5"

type Hash [16]byte

func hashIsTooSmall()

func init() {
	if len(Hash{}) < md5.Size {
		hashIsTooSmall()
	}
}

func main() {
	// ...
}
```

Now if you change `Hash` to be `[8]byte`, it will fail during compilation. (Actually, it fails during linking. Close enough for our purposes.)

```
$ go build .
# demo
main.hashIsTooSmall: call to external function
main.init.1: relocation target main.hashIsTooSmall not defined
main.init.1: undefined: "main.hashIsTooSmall"
```

What’s going on here?

`hashIsTooSmall` is [declared without a function body][7]. The compiler assumes that someone else will provide an implementation, perhaps an assembly routine.

When the compiler can prove that `len(Hash{}) < md5.Size`, it eliminates the code inside the if statement. As a result, no one uses the function `hashIsTooSmall`, so the linker eliminates it. No harm done. As soon as the assertion fails, the code inside the if statement is preserved.`hashIsTooSmall` can’t be eliminated. The linker then notices that no one else has provided an implementation for the function and fails with an error, which was the goal.

One last oddity: Why `import "C"`? The go tool knows that in normal Go code, all functions must have bodies, and instructs the compiler to enforce that. By switching to cgo, we remove that check. (If you run `go build -x` on the code above, without the `import "C"` line, you will see that the compiler is invoked with the `-complete` flag.) An alternative to adding `import "C"` is to [add an empty file called `foo.s` to the package][8].

I know of only one use of this technique, in the [compiler test suite][9]. There are other [imaginable places to apply it][10], but no one has bothered.

And that’s probably how it should be. :)


--------------------------------------------------------------------------------

via: http://commaok.xyz/post/compile-time-assertions

作者：[Josh Bleecher Snyder][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/commaok
[1]:https://play.golang.org/p/MJ6zF1oNsX
[2]:https://golang.org/pkg/io/#WriteString
[3]:https://golang.org/pkg/testing/#AllocsPerRun
[4]:https://github.com/golang/go/blob/go1.8rc2/src/io/multi.go#L72
[5]:https://play.golang.org/p/mjIMWsWu4V
[6]:https://golang.org/pkg/crypto/md5/
[7]:https://golang.org/ref/spec#Function_declarations
[8]:https://github.com/golang/go/blob/go1.8rc2/src/os/signal/sig.s
[9]:https://github.com/golang/go/blob/go1.8rc2/test/fixedbugs/issue9608.dir/issue9608.go
[10]:https://github.com/golang/go/blob/go1.8rc2/src/runtime/hashmap.go#L261
