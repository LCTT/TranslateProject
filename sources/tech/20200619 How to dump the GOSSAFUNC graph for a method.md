[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to dump the GOSSAFUNC graph for a method)
[#]: via: (https://dave.cheney.net/2020/06/19/how-to-dump-the-gossafunc-graph-for-a-method)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

How to dump the GOSSAFUNC graph for a method
======

The Go compiler’s SSA backend contains a facility to produce HTML debugging output of the compilation phases. This post covers how to print the SSA output for function _and_ methods.

Let’s start with a sample program which contains a function, a value method, and a pointer method:

```
package main

import (
    "fmt"
)

type Numbers struct {
    vals []int
}

func (n *Numbers) Add(v int) {
    n.vals = append(n.vals, v)
}

func (n Numbers) Average() float64 {
    sum := 0.0
    for _, num := range n.vals {
        sum += float64(num)
    }
    return sum / float64(len(n.vals))
}


func main() {
    var numbers Numbers
    numbers.Add(200)
    numbers.Add(43)
    numbers.Add(-6)
    fmt.Println(numbers.Average())
}
```

Control of the SSA debugging output is via the `GOSSAFUNC` environment variable. This variable takes the name of the function to dump. This is _not_ the functions fully qualified name. For `func main` above the name of the function is `main` _not_ `main.main`.

```
% env GOSSAFUNC=main go build
runtime
dumped SSA to ../../go/src/runtime/ssa.html
t
dumped SSA to ./ssa.html
```

In this example `GOSSAFUNC=main` matched both `main.main` and a function called `runtime.main`.[1][1] This is a little unfortunate, but in practice probably not a big deal as, if you’re performance tuning your code, it won’t be in a giant spaghetti blob in `func main`.

What is more likely is your code will be in a _method_, so you’ve probably landed on this post looking for the correct incantation to dump the SSA output for a method.

To print the SSA debug for the pointer method `func (n *Numbers) Add`, the equivalent function name is`(*Numbers).Add`:[2][2]

```
% env "GOSSAFUNC=(*Numbers).Add" go build
t
dumped SSA to ./ssa.html
```

To print the SSA debug for a value method `func (n Numbers) Average`, the equivalent function name is `(*Numbers).Average` _even though this is a value method_:

```
% env "GOSSAFUNC=(*Numbers).Average" go build
t
dumped SSA to ./ssa.html
```

  1. If you didn’t build Go from source then the path to the `runtime` package may be read only and you might receive an error. Please don’t use the `sudo` hammer to fix this.[][3]
  2. Please pay attention to the shell quoting.[][4]



### Related posts:

  1. [Accidental method value][5]
  2. [Never edit a method, always rewrite it][6]
  3. [How to find out which Go version built your binary][7]
  4. [Declaration scopes in Go][8]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/06/19/how-to-dump-the-gossafunc-graph-for-a-method

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: tmp.kLSHpQXzhr#easy-footnote-bottom-1-4188 (If you didn’t build Go from source then the path to the <code>runtime</code> package may be read only and you might receive an error. Please don’t use the <code>sudo</code> hammer to fix this.)
[2]: tmp.kLSHpQXzhr#easy-footnote-bottom-2-4188 (Please pay attention to the shell quoting.)
[3]: tmp.kLSHpQXzhr#easy-footnote-1-4188
[4]: tmp.kLSHpQXzhr#easy-footnote-2-4188
[5]: https://dave.cheney.net/2014/05/19/accidental-method-value (Accidental method value)
[6]: https://dave.cheney.net/2017/11/30/never-edit-a-method-always-rewrite-it (Never edit a method, always rewrite it)
[7]: https://dave.cheney.net/2017/06/20/how-to-find-out-which-go-version-built-your-binary (How to find out which Go version built your binary)
[8]: https://dave.cheney.net/2016/12/15/declaration-scopes-in-go (Declaration scopes in Go)
