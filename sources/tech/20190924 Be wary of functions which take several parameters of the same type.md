[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Be wary of functions which take several parameters of the same type)
[#]: via: (https://dave.cheney.net/2019/09/24/be-wary-of-functions-which-take-several-parameters-of-the-same-type)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Be wary of functions which take several parameters of the same type
======

> APIs should be easy to use and hard to misuse.

— Josh Bloch

A good example of a simple looking, but hard to use correctly, API is one which takes two or more parameters of the same type. Let’s compare two function signatures:

```
func Max(a, b int) int
func CopyFile(to, from string) error
```

What’s the difference between these functions? Obviously one returns the maximum of two numbers, the other copies a file, but that’s not the important thing.

```
Max(8, 10) // 10
Max(10, 8) // 10
```

`Max` is _commutative_; the order of its parameters does not matter. The maximum of eight and ten is ten regardless of if I compare eight and ten or ten and eight.

However, this property does not hold true for `CopyFile`.

```
CopyFile("/tmp/backup", "presentation.md")
CopyFile("presentation.md", "/tmp/backup")
```

Which one of these statements made a backup of your presentation and which one overwrite your presentation with last week’s version? You can’t tell without consulting the documentation. A code reviewer cannot know if you’ve got the order correct without consulting the documentation.

The general advice is to try to avoid this situation. Just like long parameter lists, indistinct parameter lists are a design smell.

### A challenge

When this situation is unavoidable my solution to this class of problem is to introduce a helper type which will be responsible for calling `CopyFile` correctly.

```
type Source string

func (src Source) CopyTo(dest string) error {
    return CopyFile(dest, string(src))
}

func main() {
    var from Source = "presentation.md"
    from.CopyTo("/tmp/backup")
}
```

In this way `CopyFile` is always called correctly and, given its poor API can possibly be made private, further reducing the likelihood of misuse.

Can you suggest a better solution?

#### Related posts:

  1. [Go has both make and new functions, what gives ?][1]
  2. [Do not fear first class functions][2]
  3. [Evaluation order oddity][3]
  4. [Prefer table driven tests][4]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/09/24/be-wary-of-functions-which-take-several-parameters-of-the-same-type

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2014/08/17/go-has-both-make-and-new-functions-what-gives (Go has both make and new functions, what gives ?)
[2]: https://dave.cheney.net/2016/11/13/do-not-fear-first-class-functions (Do not fear first class functions)
[3]: https://dave.cheney.net/2013/11/15/evaluation-order-oddity (Evaluation order oddity)
[4]: https://dave.cheney.net/2019/05/07/prefer-table-driven-tests (Prefer table driven tests)
