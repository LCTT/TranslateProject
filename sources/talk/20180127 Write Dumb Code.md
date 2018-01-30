Write Dumb Code
======
The best way you can contribute to an open source project is to remove lines of code from it. We should endeavor to write code that a novice programmer can easily understand without explanation or that a maintainer can understand without significant time investment.

As students we attempt increasingly challenging problems with increasingly sophisticated technologies. We first learn loops, then functions, then classes, etc.. We are praised as we ascend this hierarchy, writing longer programs with more advanced technology. We learn that experienced programmers use monads while new programmers use for loops.

Then we graduate and find a job or open source project to work on with others. We search for something that we can add, and implement a solution pridefully, using the all the tricks that we learned in school.

Ah ha! I can extend this project to do X! And I can use inheritance here! Excellent!

We implement this feature and feel accomplished, and with good reason. Programming in real systems is no small accomplishment. This was certainly my experience. I was excited to write code and proud that I could show off all of the things that I knew how to do to the world. As evidence of my historical love of programming technology, here is a [linear algebra language][1] built with a another meta-programming language. Notice that no one has touched this code in several years.

However after maintaining code a bit more I now think somewhat differently.

  1. We should not seek to build software. Software is the currency that we pay to solve problems, which is our actual goal. We should endeavor to build as little software as possible to solve our problems.
  2. We should use technologies that are as simple as possible, so that as many people as possible can use and extend them without needing to understand our advanced techniques. We should use advanced techniques only when we are not smart enough to figure out how to use more common techniques.



Neither of these points are novel. Most people I meet agree with them to some extent, but somehow we forget them when we go to contribute to a new project. The instinct to contribute by building and to demonstrate sophistication often take over.

### Software is a cost

Every line that you write costs people time. It costs you time to write it of course, but you are willing to make this personal sacrifice. However this code also costs the reviewers their time to understand it. It costs future maintainers and developers their time as they fix and modify your code. They could be spending this time outside in the sunshine or with their family.

So when you add code to a project you should feel meek. It should feel as though you are eating with your family and there isn't enough food on the table. You should take only what you need and no more. The people with you will respect you for your efforts to restrict yourself. Solving problems with less code is a hard, but it is a burden that you take on yourself to lighten the burdens of others.

### Complex technologies are harder to maintain

As students, we demonstrate merit by using increasingly advanced technologies. Our measure of worth depends on our ability to use functions, then classes, then higher order functions, then monads, etc. in public projects. We show off our solutions to our peers and feel pride or shame according to our sophistication.

However when working with a team to solve problems in the world the situation is reversed. Now we strive to solve problems with code that is as simple as possible. When we solve a problem simply we enable junior programmers to extend our solution to solve other problems. Simple code enables others and boosts our impact. We demonstrate our value by solving hard problems with only basic techniques.

Look! I replaced this recursive function with a for loop and it still does everything that we need it to. I know it's not as clever, but I noticed that the interns were having trouble with it and I thought that this change might help.

If you are a good programmer then you don't need to demonstrate that you know cool tricks. Instead, you can demonstrate your value by solving a problem in a simple way that enables everyone on your team to contribute in the future.

### But moderation, of course

That being said, over-adherence to the "build things with simple tools" dogma can be counter productive. Often a recursive solution can be much simpler than a for-loop solution and often times using a Class or a Monad is the right approach. But we should be mindful when using these technologies that we are building for ourselves our own system; a system with which others have had no experience.


--------------------------------------------------------------------------------

via: http://matthewrocklin.com/blog/work/2018/01/27/write-dumb-code

作者：[Matthew Rocklin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://matthewrocklin.com
[1]:https://github.com/mrocklin/matrix-algebra
