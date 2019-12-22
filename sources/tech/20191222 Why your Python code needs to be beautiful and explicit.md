[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why your Python code needs to be beautiful and explicit)
[#]: via: (https://opensource.com/article/19/12/zen-python-beauty-clarity)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Why your Python code needs to be beautiful and explicit
======
Welcome to Pythonukkah, a special series about the Zen of Python. On the
first day, we celebrate the first two principles: beauty and
explicitness.
![Searching for code][1]

Python contributor Tim Peters introduced us to the [Zen of Python][2] in 1999. Twenty years later, its 19 guiding principles continue to be relevant within the community. We start our Pythonukkah celebration—like Hanukkah, a festival of lights—with the first two principles in the Zen of Python: on beauty and explicitness.

> "Hanukkah is the Festival of Lights,
>  Instead of one day of presents, we get eight crazy nights."
>  —Adam Sandler, [_The Hanukkah Song_][3]

### Beautiful is better than ugly.

It was in _[Structure and Interpretation of Computer Programs][4]_ (_SICP_) that the point was made: "Programs must be written for people to read and only incidentally for machines to execute." Machines do not care about beauty, but people do.

A beautiful program is one that is enjoyable to read. This means first that it is consistent. Tools like [Black][5], [flake8][6], and [Pylint][7] are great for making sure things are reasonable on a surface layer.

But even more important, only humans can judge what humans find beautiful. Code reviews and a collaborative approach to writing code are the only realistic way to build beautiful code. Listening to other people is an important skill in software development.

Finally, all the tools and processes are moot if the _will_ is not there. Without an appreciation for the importance of beauty, there will never be an emphasis on writing beautiful code.

This is why this is the first principle: it is a way of making "beauty" a value in the Python community. It immediately answers: "Do we _really_ care about beauty?" We do.

### Explicit is better than implicit.

We humans celebrate light and fear the dark. Light helps us make sense of vague images. In the same way, programming with more explicitness helps us make sense of abstract ideas. It is often tempting to make things implicit.

"Why is **self** explicitly there as the first parameter of methods?"

There are many technical explanations, but all of them are wrong. It is almost a Python programmer's rite of passage to write a metaclass that makes explicitly listing **self** unnecessary. (If you have never done this before, do so; it makes a great metaclass learning exercise!)

The reason **self** is explicit is not because the Python core developers did not want to make a metaclass like that the "default" metaclass. The reason it is explicit is because there is one less special case to teach: the first argument is _explicit_.

Even when Python does allow non-explicit things, such as context variables, we must always ask: Are we sure we need them? Could we not just pass arguments explicitly? Sometimes, for many reasons, this is not feasible. But prioritizing explicitness means, at the least, asking the question and estimating the effort.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-beauty-clarity

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://en.wikipedia.org/wiki/The_Chanukah_Song
[4]: https://en.wikipedia.org/wiki/Structure_and_Interpretation_of_Computer_Programs
[5]: https://opensource.com/article/19/5/python-black
[6]: https://opensource.com/article/19/5/python-flake8
[7]: https://opensource.com/article/19/10/python-pylint-introduction
