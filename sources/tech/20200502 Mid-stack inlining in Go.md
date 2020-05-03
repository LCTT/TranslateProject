[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mid-stack inlining in Go)
[#]: via: (https://dave.cheney.net/2020/05/02/mid-stack-inlining-in-go)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Mid-stack inlining in Go
======

In the [previous post][1] I discussed how leaf inlining allows the Go compiler to reduce the overhead of function calls and extend optimisation opportunities across function boundaries. In this post I’ll discuss the limits of inlining and leaf vs mid-stack inlining.

### The limits of inlining

Inlining a function into its caller removes the call’s overhead and increases the opportunity for the compiler to apply additional optimisations so the question should be asked, if some inlining is good, would more be better, _why not inline as much as possible?_

Inlining trades possibly larger program sizes for potentially faster execution time. The main reason to limit inlining is creating many inlined copies of a function can increase compile time and result in larger binaries for marginal gain. Even taking into account the opportunities for further optimisation, aggressive inlining tends to increase the size of, and the time too compile, the resulting binary.

Inlining works best for [small functions][2] that do relatively little work compared to the overhead of calling them. As the size of a function grows, the time saved avoiding the call’s overhead diminishes relative to the work done inside the function. Larger functions tend to be more complex, thus the benefits of optimising their inlined forms vs in situ are reduced.

### Inlining budget

During compilation each function’s inlineabilty is calculated using what is known as the _inlining budget_[1][3]. The cost calculation can tricky too internalise but is broadly one unit per node in the AST for simple things like unary and binary operations but can be higher for complex operations like `make`. Consider this example:

```
package main

func small() string {
    s := "hello, " + "world!"
    return s
}

func large() string {
    s := "a"
    s += "b"
    s += "c"
    s += "d"
    s += "e"
    s += "f"
    s += "g"
    s += "h"
    s += "i"
    s += "j"
    s += "k"
    s += "l"
    s += "m"
    s += "n"
    s += "o"
    s += "p"
    s += "q"
    s += "r"
    s += "s"
    s += "t"
    s += "u"
    s += "v"
    s += "w"
    s += "x"
    s += "y"
    s += "z"
    return s
}

func main() {
    small()
    large()
}
```

Compiling this function with `-gcflags=-m=2` allows us to see the cost the compiler assigns to each function.

```
% go build -gcflags=-m=2 inl.go
# command-line-arguments
./inl.go:3:6: can inline small with cost 7 as: func() string { s := "hello, world!"; return s }
./inl.go:8:6: cannot inline large: function too complex: cost 82 exceeds budget 80
./inl.go:38:6: can inline main with cost 68 as: func() { small(); large() }
./inl.go:39:7: inlining call to small func() string { s := "hello, world!"; return s }
```

The compiler determined that `func small()` can be inlined due to its cost of 7. `func large()` was determined to be too expensive. `func main()`has been marked as eligable and assigned a cost of 68; 7 from the body of `small`, 57 from the function call to `small` and the remainder in its own overhead.

The inlining budget can be controlled to some degree with the `-gcflag=-l` flag. Currently the values that apply are:

  * `-gcflags=-l=0` is the default level of inlining.
  * `-gcflags=-l` (or `-gcflags=-l=1`) disables inlining.
  * `-gcflags=-l=2` and `-gcflags=-l=3` are currently unused and have no effect over `-gcflags=-l=0`
  * `-gcflags=-l=4` reduces the cost for inlining non-leaf functions and calls through interfaces.[2][4]



#### Hairy optimisations

Some functions with a relatively low inlining cost may be ineligible because of their complexity. This is known as the function’s hairiness as the semantics of some operations are hard to reason about once inlined, for example `recover`, `break`. Others, like `select` and `go`, involve co-ordination with the runtime so the extra effort of inlining doesn’t pay for itself.

The list of hairy statements also includes things like `for `and `range` which don’t have an inherently large cost, but simply haven’t been optimised yet.

### Mid stack inlining

Historically the Go compiler only performed leaf inlining–only functions which did not call other functions were eligible. In the context of the hairiness discussion previously, a function call would disqualify the function from being inlined.

Enter mid stack inlining which, as its name implies, allows functions in the middle of a call stack to be inlined without requiring everything below them to be eligible. Mid stack inlining was introduced by David Lazar in Go 1.9 and improved in subsequent releases. [This presentation][5] goes into some of the difficulties with retaining the behaviour of stack traces and `runtime.Callers` in code paths that had been heavily inlined.

We see an example of mid-stack inlining in the previous example. After inlining, `func main()` contains the body of `func small()` and a call to `func large()`, thus it is considered a non-leaf function. Historically this would have prevented it from being further inlined even though its combined cost was less than the inlining budget.

The primary use case for mid stack inlining is to reduce the overhead of a path through the call stack. Consider this example:

```
package main

import (
    "fmt"
    "strconv"
)

type Rectangle struct {}

//go:noinline
func (r *Rectangle) Height() int {
    h, _ := strconv.ParseInt("7", 10, 0)
    return int(h)
}

func (r *Rectangle) Width() int {
    return 6
}

func (r *Rectangle) Area() int { return r.Height() * r.Width() }

func main() {
    var r Rectangle
    fmt.Println(r.Area())
}
```

In this example `r.Area()` is a simple function which calls two others. `r.Width()` can be inlined while `r.Height()`, simulated here with the `//go:noinline` annotation, cannot. [3][6]

```
% go build -gcflags='-m=2' square.go
# command-line-arguments
./square.go:12:6: cannot inline (*Rectangle).Height: marked go:noinline
./square.go:17:6: can inline (*Rectangle).Width with cost 2 as: method(*Rectangle) func() int { return 6 }
./square.go:21:6: can inline (*Rectangle).Area with cost 67 as: method(*Rectangle) func() int { return r.Height() * r.Width() }                       ./square.go:21:61: inlining call to (*Rectangle).Width method(*Rectangle) func() int { return 6 }
./square.go:23:6: cannot inline main: function too complex: cost 150 exceeds budget 80
./square.go:25:20: inlining call to (*Rectangle).Area method(*Rectangle) func() int { return r.Height() * r.Width() }
./square.go:25:20: inlining call to (*Rectangle).Width method(*Rectangle) func() int { return 6 }
```

As the multiplication performed by `r.Area()` is cheap compared to the overhead of calling it, inlining `r.Area()`‘s single expression is a net win even if its downstream caller to `r.Height()` remains ineligible.

#### Fast path inlining

The most startling example of the power of mid-stack inlining comes from 2019 when [Carlo Alberto Ferraris improved the performance][7] of `sync.Mutex.Lock()` by allowing the fast path of the lock–the uncontended case–to be inlined into its caller. Prior to this change `sync.Mutex.Lock()` was a large function containing many hairy conditions which made it ineligible to be inlined. Even in the case where the lock was available, the caller had to pay the overhead of calling `sync.Mutex.Lock()`.

Carlo’s change split `sync.Mutex.Lock()` into two functions (a process he dubbed _outlining_). The outer `sync.Mutex.Lock()` method now calls `sync/atomic.CompareAndSwapInt32()` and returns to the caller immediately if the CAS succeeds. If not, the function falls through to `sync.Mutex.lockSlow()` which handles the slow path required to register interest on the lock and park the goroutine.[4][8]

```
% go build -gcflags='-m=2 -l=0' sync 2>&1 | grep '(*Mutex).Lock'
../go/src/sync/mutex.go:72:6: can inline (*Mutex).Lock with cost 69 as: method(*Mutex) func() { if "sync/atomic".CompareAndSwapInt32(&m.state, 0, mutexLocked) { if race.Enabled {  }; return  }; m.lockSlow() }
```

By splitting the function into an easily inalienable outer function, falling through to a complex inner function to handle the slow path Carlo’s combined mid stack inlining and the [compiler’s support for intrinsic operations][9] to reduce the cost of an uncontended lock by 14%. Then he repeated the trick for an additional 9% saving in `sync.RWMutex.Unlock()`.

  1. The budget the Go compiler applies to each function when considering if it is eligible for inlining changes release to release.[][10]
  2. Keep in mind that the compiler authors warn that “[Additional levels of inlining (beyond -l) may be buggy and are not supported”][11]. Caveat emptor.[][12]
  3. The compiler is powerful enough that it can inline complex functions like `strconv.ParseInt`. As a experiment, try removing the `//go:noinline` annotation and observe the result with `-gcflags=-m=2`.[][13]
  4. The expression `race.Enable` is a constant controlled by the `-race` flag passed to the `go` tool. It is `false` for normal builds which allows the compiler to elide those code paths entirely.[][14]



#### Related posts:

  1. [Inlining optimisations in Go][15]
  2. [Why is a Goroutine’s stack infinite ?][16]
  3. [Stack traces and the errors package][17]
  4. [What is the zero value, and why is it useful?][18]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/05/02/mid-stack-inlining-in-go

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2020/04/25/inlining-optimisations-in-go
[2]: https://medium.com/@joshsaintjacque/small-functions-considered-awesome-c95b3fd1812f
[3]: tmp.FyRthF1bbF#easy-footnote-bottom-1-4076 (The budget the Go compiler applies to each function when considering if it is eligible for inlining changes release to release.)
[4]: tmp.FyRthF1bbF#easy-footnote-bottom-2-4076 (Keep in mind that the compiler authors warn that “<a href="https://github.com/golang/go/blob/be08e10b3bc07f3a4e7b27f44d53d582e15fd6c7/src/cmd/compile/internal/gc/inl.go#L11">Additional levels of inlining (beyond -l) may be buggy and are not supported”</a>. Caveat emptor.)
[5]: https://docs.google.com/presentation/d/1Wcblp3jpfeKwA0Y4FOmj63PW52M_qmNqlQkNaLj0P5o/edit#slide=id.p
[6]: tmp.FyRthF1bbF#easy-footnote-bottom-3-4076 (The compiler is powerful enough that it can inline complex functions like <code>strconv.ParseInt</code>. As a experiment, try removing the <code>//go:noinline</code> annotation and observe the result with <code>-gcflags=-m=2</code>.)
[7]: https://go-review.googlesource.com/c/go/+/148959
[8]: tmp.FyRthF1bbF#easy-footnote-bottom-4-4076 (The expression <code>race.Enable</code> is a constant controlled by the <code>-race</code> flag passed to the <code>go</code> tool. It is <code>false</code> for normal builds which allows the compiler to elide those code paths entirely.)
[9]: https://dave.cheney.net/2019/08/20/go-compiler-intrinsics
[10]: tmp.FyRthF1bbF#easy-footnote-1-4076
[11]: https://github.com/golang/go/blob/be08e10b3bc07f3a4e7b27f44d53d582e15fd6c7/src/cmd/compile/internal/gc/inl.go#L11
[12]: tmp.FyRthF1bbF#easy-footnote-2-4076
[13]: tmp.FyRthF1bbF#easy-footnote-3-4076
[14]: tmp.FyRthF1bbF#easy-footnote-4-4076
[15]: https://dave.cheney.net/2020/04/25/inlining-optimisations-in-go (Inlining optimisations in Go)
[16]: https://dave.cheney.net/2013/06/02/why-is-a-goroutines-stack-infinite (Why is a Goroutine’s stack infinite ?)
[17]: https://dave.cheney.net/2016/06/12/stack-traces-and-the-errors-package (Stack traces and the errors package)
[18]: https://dave.cheney.net/2013/01/19/what-is-the-zero-value-and-why-is-it-useful (What is the zero value, and why is it useful?)
