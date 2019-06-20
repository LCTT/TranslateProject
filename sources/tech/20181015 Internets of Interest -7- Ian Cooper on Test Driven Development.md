[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Internets of Interest #7: Ian Cooper on Test Driven Development)
[#]: via: (https://dave.cheney.net/2018/10/15/internets-of-interest-7-ian-cooper-on-test-driven-development)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Internets of Interest #7: Ian Cooper on Test Driven Development
======

As the tech lead on _non_ SaaS product I spend a lot of my time worrying about testing. Specifically we have tests that cover code, but what is covering the tests? Tests are important to give you certainty that what your product says on the tin is what it will do when people take it home and unwrap it, but what’s backstopping the tests? Testing lets you refactor with impunity, but what if you want to refactor your tests?

This presentation by Ian Cooper takes a little while to get going but is worth persisting with. Cooper’s observations that the unit of the _unit test_ is not a type, or a class, but the API–in Go terms, the public API of a package–was revelatory for me.

_Bonus_ : [Michael Feathers’ YOW ! 2016 presentation; _Testing Patience_.][1]

### Related posts:

  1. [Internets of interest #1: Brian Kernighan on the Elements of Programming Style][2]
  2. [Internets of Interest #12: Testing Michael Feathers’ Patience][3]
  3. [Internets of interest #0: The future of Microprocessors][4]
  4. [Internets of Interest #5: Kate Gregory on Simplicity][5]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2018/10/15/internets-of-interest-7-ian-cooper-on-test-driven-development

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=gmasnR_Cml0
[2]: https://dave.cheney.net/2018/09/15/internets-of-interest-1-brian-kernighan-on-the-elements-of-programming-style (Internets of interest #1: Brian Kernighan on the Elements of Programming Style)
[3]: https://dave.cheney.net/2019/02/20/internets-of-interest-12-testing-michael-feathers-patience (Internets of Interest #12: Testing Michael Feathers’ Patience)
[4]: https://dave.cheney.net/2018/08/19/internets-of-interest-0-the-future-of-microprocessors (Internets of interest #0: The future of Microprocessors)
[5]: https://dave.cheney.net/2018/09/28/internets-of-interest-5-kate-gregory-on-simplicity (Internets of Interest #5: Kate Gregory on Simplicity)
