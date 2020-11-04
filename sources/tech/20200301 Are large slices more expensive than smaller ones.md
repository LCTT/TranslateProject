[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Are large slices more expensive than smaller ones?)
[#]: via: (https://dave.cheney.net/2020/03/01/are-large-slices-more-expensive-than-smaller-ones)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Are large slices more expensive than smaller ones?
======

Programmers have a tendency to be superstitious. Particularly, when a programmer hears that copies are expensive, they start to see them everywhere, especially when they learn that, in Go, _every_ assignment is a copy.

Consider this code; `x` is three orders of magnitude larger than `y`, is the assignment of `x` to `a` more expensive than the assignment of `y` to `b`?

```
func f() {
       x, y := make([]byte, 9000), make([]byte, 9)
       a := x
       b := y
       // ...
 }
```

The answer is; no. `x` and `y` have the same type, `[]byte`, that is, a slice of bytes. As both variables have the same type, their assignment involves copying the same amount of data. Both assignments have the same cost.

All slices are the same size; three machine words (three `uintptrs`). The first word in the slice is a pointer to the slice’s backing array, the storage for the slice, the second word is the slice’s length, and the third is the capacity. Assigning one slice variable to another copies just three machine words.

_Further reading:_ [Go slices: usage and internals][1] (blog.golang.org)

### Related posts:

  1. [Slices from the ground up][2]
  2. [Friday pop quiz: the smallest buffer][3]
  3. [If a map isn’t a reference variable, what is it?][4]
  4. [Go has both make and new functions, what gives ?][5]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/03/01/are-large-slices-more-expensive-than-smaller-ones

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://blog.golang.org/go-slices-usage-and-internals
[2]: https://dave.cheney.net/2018/07/12/slices-from-the-ground-up (Slices from the ground up)
[3]: https://dave.cheney.net/2015/06/05/friday-pop-quiz-the-smallest-buffer (Friday pop quiz: the smallest buffer)
[4]: https://dave.cheney.net/2017/04/30/if-a-map-isnt-a-reference-variable-what-is-it (If a map isn’t a reference variable, what is it?)
[5]: https://dave.cheney.net/2014/08/17/go-has-both-make-and-new-functions-what-gives (Go has both make and new functions, what gives ?)
