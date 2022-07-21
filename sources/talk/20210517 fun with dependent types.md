[#]: subject: "fun with dependent types"
[#]: via: "https://jao.io/blog/2021-05-17-the-little-typer.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

fun with dependent types
======

![][1]

It had been a while since i last had this much fun with a programming languages book, and learnt so much in the process. It sure helped that i am a complete neophyte on the subject matter of dependent types: i had recently started playing with [Idris][2], but reading this book really clarified the basics for me. I still remember how, after _The little schemer_ kindled my love for parenthesis, _The seasoned schemer_ made me finally grasp the meaning of continuations. I've got the feeling that the _typer_ has done again the trick, this time giving me the jump start i needed on Curry-Howard, programs as proofs and the beauty of dependent types. As with continuations back in the day, i had read a lot about those things, and thought i had understood them, only to realise that i had not really.

The authors, Daniel P. Friedman and David Thrane Christiansen, have also created a language, Pie, and implemented it in Racket and [in Haskell][3]. I've used the latter in a couple of ways: first, it's a very fun learning experience as a weak haskeller (or as a fading racketeer, for that matter) to go over the code (make sure to check [Checking Dependent Types with Normalization by Evaluation: A Tutorial][4], by David himself, if you're interested in how these things are implemented). And, second, the Haskell-based REPL has been my constant companion while reading the book, thanks to [a little package that i put together][5] to use it in Emacs, complete with syntax highlighting and a bit of completion for the predefined forms of Pie (it might have a couple of rough corners, but the plan is to submit it to MELPA at some point).

Or you can also use the DrRacket interface if that's your thing, but, be it as it may, don't miss this book!

[Tags][6]: [books][7] [programming][8] [emacs][9]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-05-17-the-little-typer.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://jao.io/img/the-little-typer.jpg
[2]: https://www.idris-lang.org/
[3]: https://github.com/david-christiansen/pie-hs
[4]: http://www.davidchristiansen.dk/tutorials/nbe/
[5]: https://codeberg.org/jao/epie
[6]: https://jao.io/blog/tags.html
[7]: https://jao.io/blog/tag-books.html
[8]: https://jao.io/blog/tag-programming.html
[9]: https://jao.io/blog/tag-emacs.html
