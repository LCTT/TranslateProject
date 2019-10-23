[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Pylint: Making your Python code consistent)
[#]: via: (https://opensource.com/article/19/10/python-pylint-introduction)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Pylint: Making your Python code consistent
======
Pylint is your friend when you want to avoid arguing about code
complexity.
![OpenStack source code \(Python\) in VIM][1]

Pylint is a higher-level Python style enforcer. While [flake8][2] and [black][3] will take care of "local" style: where the newlines occur, how comments are formatted, or find issues like commented out code or bad practices in log formatting.

Pylint is extremely aggressive by default. It will offer strong opinions on everything from checking if declared interfaces are actually implemented to opportunities to refactor duplicate code, which can be a lot to a new user. One way of introducing it gently to a project, or a team, is to start by turning _all_ checkers off, and then enabling checkers one by one. This is especially useful if you already use flake8, black, and [mypy][4]: Pylint has quite a few checkers that overlap in functionality.

However, one of the things unique to Pylint is the ability to enforce higher-level issues: for example, number of lines in a function, or number of methods in a class.

These numbers might be different from project to project and can depend on the development team's preferences. However, once the team comes to an agreement about the parameters, it is useful to _enforce_ those parameters using an automated tool. This is where Pylint shines.

### Configuring Pylint

In order to start with an empty configuration, start your `.pylintrc` with


```
[MESSAGES CONTROL]

disable=all
```

This disables all Pylint messages. Since many of them are redundant, this makes sense. In Pylint, a `message` is a specific kind of warning.

You can check that all messages have been turned off by running `pylint`:


```
`$ pylint <my package>`
```

In general, it is not a great idea to add parameters to the `pylint` command-line: the best place to configure your `pylint` is the `.pylintrc`. In order to have it do _something_ useful, we need to enable some messages.

In order to enable messages, add to your `.pylintrc`, under the `[MESSAGES CONTROL]`.


```
enable=&lt;message&gt;,

       ...
```

For the "messages" (what Pylint calls different kinds of warnings) that look useful. Some of my favorites include `too-many-lines`, `too-many-arguments`, and `too-many-branches`. All of those limit complexity of modules or functions, and serve as an objective check, without a human nitpicker needed, for code complexity measurement.

A _checker_ is a source of _messages_: every message belongs to exactly one checker. Many of the most useful messages are under the [design checker][5]. The default numbers are usually good, but tweaking the maximums is straightfoward: we can add a section called `DESIGN` in the `.pylintrc`.


```
[DESIGN]

max-args=7

max-locals=15
```

Another good source of useful messages is the `refactoring` checker. Some of my favorite messages to enable there are `consider-using-dict-comprehension`, `stop-iteration-return` (which looks for generators which use `raise StopIteration` when `return` is the correct way to stop the iteration). and `chained-comparison`, which will suggest using syntax like `1 <= x < 5` rather than the less obvious `1 <= x && 5 > 5`

Finally, an expensive checker, in terms of performance, but highly useful, is `similarities`. It is designed to enforce "Don't Repeat Yourself" (the DRY principle) by explicitly looking for copy-paste between different parts of the code. It only has one message to enable: `duplicate-code`. The default "minimum similarity lines" is set to `4`. It is possible to set it to a different value using the `.pylintrc`.


```
[SIMILARITIES]

min-similarity-lines=3
```

### Pylint makes code reviews easy

If you are sick of code reviews where you point out that a class is too complicated, or that two different functions are basically the same, add Pylint to your [Continuous Integration][6] configuration, and only have the arguments about complexity guidelines for your project _once_.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/python-pylint-introduction

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_2.jpg?itok=4fza48WU (OpenStack source code (Python) in VIM)
[2]: https://opensource.com/article/19/5/python-flake8
[3]: https://opensource.com/article/19/5/python-black
[4]: https://opensource.com/article/19/5/python-mypy
[5]: https://pylint.readthedocs.io/en/latest/technical_reference/features.html#design-checker
[6]: https://opensource.com/business/15/7/six-continuous-integration-tools
