[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Diamond interface composition in Go 1.14)
[#]: via: (https://dave.cheney.net/2020/05/24/diamond-interface-composition-in-go-1-14)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Diamond interface composition in Go 1.14
======

Per the [overlapping interfaces proposal][1], Go 1.14 now permits embedding of interfaces with overlapping method sets. This is a brief post explain what this change means:

Let’s start with the definition of the three key interfaces from the `io` package; `io.Reader`, `io.Writer`, and `io.Closer`:

```
package io

type Reader interface {
    Read([]byte) (int, error)
}

type Writer interface {
    Write([]byte) (int, error)
}

type Closer interface {
    Close() error
}
```

Just as embedding a type inside a struct allows the embedded type’s fields and methods to be accessed as if it were declared on the embedding type[1][2], the process is true for interfaces. Thus there is no difference between explicitly declaring

```
type ReadCloser interface {
    Read([]byte) (int, error)
    Close() error
}
```

and using embedding to compose the interface

```
type ReadCloser interface {
    Reader
    Closer
}
```

You can even mix and match

```
type WriteCloser interface {
    Write([]byte) (int, error)
    Closer
}
```

However, prior to Go 1.14, if you continued to compose interface declarations in this manner you would likely find that something like this,

```
type ReadWriteCloser interface {
    ReadCloser
    WriterCloser
}
```

would fail to compile

```
% go build interfaces.go
command-line-arguments
./interfaces.go:27:2: duplicate method Close
```

Fortunately, with Go 1.14 this is no longer a limitation, thus solving problems that typically occur with diamond-shaped embedding graphs.

However, there is a catch that I ran into attempting to demonstrate this feature to the local user group–this feature is only enabled when the Go compiler uses the 1.14 (or later) spec.

As near as I can make out the rules for which version of the Go spec is used during compilation appear to be:

  1. If your source code is stored inside `GOPATH` (or you have _disabled_ modules with `GO111MODULE=off`) then the version of the Go spec used to compile with matches the version of the compiler you are using. Said another way, if you have Go 1.13 installed, your Go version is 1.13. If you have Go 1.14 installed, your version is 1.14. No surprises here.
  2. If your source code is stored outside `GOPATH` (or you have forced modules on with `GO111MODULE=on`) then the `go` tool will take the Go version from the `go.mod` file.
  3. If there is no Go version listed in `go.mod` then the version of the spec will be the version of Go installed. This is identical to point 1.
  4. If you are in module mode, either by being outside `GOPATH` or with `GO111MODULE=on`, but there is no `go.mod` file in the current, or any parent, directory then the version of the Go spec used to compile your code defaults to Go 1.13.



The last point caught me out.

  1. It is said that embedding promotes the type’s fields and methods.[][3]



### Related posts:

  1. [Struct composition with Go][4]
  2. [term: low level serial with a high level interface][5]
  3. [Accidental method value][6]
  4. [How does the go build command work ?][7]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/05/24/diamond-interface-composition-in-go-1-14

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://github.com/golang/proposal/blob/master/design/6977-overlapping-interfaces.md
[2]: tmp.nUQHg5BP9T#easy-footnote-bottom-1-4179 (It is said that embedding promotes the type’s fields and methods.)
[3]: tmp.nUQHg5BP9T#easy-footnote-1-4179
[4]: https://dave.cheney.net/2015/05/22/struct-composition-with-go (Struct composition with Go)
[5]: https://dave.cheney.net/2014/05/08/term-low-level-serial-with-a-high-level-interface (term: low level serial with a high level interface)
[6]: https://dave.cheney.net/2014/05/19/accidental-method-value (Accidental method value)
[7]: https://dave.cheney.net/2013/10/15/how-does-the-go-build-command-work (How does the go build command work ?)
