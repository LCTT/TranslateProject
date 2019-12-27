[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Prioritizing simplicity in your Python code)
[#]: via: (https://opensource.com/article/19/12/zen-python-simplicity-complexity)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Prioritizing simplicity in your Python code
======
This is the second part of a special series about the Zen of Python
focusing on the third and fourth principles: simplicity and complexity.
![Person reading a book and digital copy][1]

> "Il semble que la perfection soit atteinte non quand il n'y a plus rien à ajouter, mais quand il n'y plus rien à retrancher."
>
> "It seems that perfection is finally attained not when there is no longer anything to add, but when there is no longer anything to take away."
>  —Antoine de Saint-Exupéry, _[Terre des Hommes][2]_, 1939

A common concern in programming is the struggle with complexity. It is easy for any programmer to make a program so complicated no expert can debug it or modify it. The [Zen of Python][3] would not be complete if it did not touch on this.

### Simple is better than complex.

When it is possible to choose at all, choose the simple solution. Python is rarely in the business of _disallowing_ things. This means it is possible, and even straightforward, to design baroque programs to solve straightforward problems.

It is worthwhile to remember at each point that simplicity is one of the easiest things to lose and the hardest to regain when writing code.

This can mean choosing to write something as a function, rather than introducing an extraneous class. This can mean avoiding a robust third-party library in favor of writing a two-line function that is perfect for the immediate use-case. Most often, it means avoiding predicting the future in favor of solving the problem at hand.

It is much easier to change the program later, especially if simplicity and beauty were among its guiding principles than to load the code down with all possible future variations.

### Complex is better than complicated.

This is possibly the most misunderstood principle because understanding the precise meanings of the words is crucial. Something is _complex_ when it is composed of multiple parts. Something is _complicated_ when it has a lot of different, often hard to predict, behaviors.

When solving a hard problem, it is often the case that no simple solution will do. In that case, the most Pythonic strategy is to go "bottom-up." Build simple tools and combine them to solve the problem.

This is where techniques like _object composition_ shine. Instead of having a complicated inheritance hierarchy, have objects that forward some method calls to a separate object. Each of those can be tested and developed separately and then finally put together.

Another example of "building up" is using [singledispatch][4], so that instead of one complicated object, we have a simple, mostly behavior-less object and separate behaviors.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-simplicity-complexity

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://en.wikipedia.org/wiki/Wind,_Sand_and_Stars
[3]: https://www.python.org/dev/peps/pep-0020/
[4]: https://opensource.com/article/19/5/python-singledispatch
