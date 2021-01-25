[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Namespaces are the shamash candle of the Zen of Python)
[#]: via: (https://opensource.com/article/19/12/zen-python-namespaces)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Namespaces are the shamash candle of the Zen of Python
======
This is part of a special series about the Zen of Python focusing on one
bonus principle: namespaces.
![Person programming on a laptop on a building][1]

Hanukkah famously has eight nights of celebration. The Hanukkah menorah, however, has nine candles: eight regular candles and a ninth that is always offset. It is called the **shamash** or **shamos**, which loosely translates to meaning "servant" or "janitor."

The shamos is the candle that lights all the others: it is the only candle whose fire can be used, not just watched. As we wrap up our series on the Zen of Python, I see how namespaces provide a similar service.

### Namespaces in Python

Python uses namespaces for everything. Though simple, they are sparse data structures—which is often the best way to achieve a goal.

> A _namespace_ is a mapping from names to objects.
>
> — [Python.org][2]

Modules are namespaces. This means that correctly predicting module semantics often just requires familiarity with how Python namespaces work. Classes are namespaces. Objects are namespaces. Functions have access to their local namespace, their parent namespace, and the global namespace.

The simple model, where the **.** operator accesses an object, which in turn will usually, but not always, do some sort of dictionary lookup, makes Python hard to optimize, but easy to explain.

Indeed, some third-party modules take this guideline and run with it. For example, the** [variants][3]** package turns functions into namespaces of "related functionality." It is a good example of how the [Zen of Python][4] can inspire new abstractions.

### In conclusion

Thank you for joining me on this Hanukkah-inspired exploration of [my favorite language][5]. Go forth and meditate on the Zen until you reach enlightenment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-namespaces

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://docs.python.org/3/tutorial/classes.html
[3]: https://pypi.org/project/variants/
[4]: https://www.python.org/dev/peps/pep-0020/
[5]: https://opensource.com/article/19/10/why-love-python
