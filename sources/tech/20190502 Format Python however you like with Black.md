[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Format Python however you like with Black)
[#]: via: (https://opensource.com/article/19/5/python-black)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez/users/moshez/users/moshez)

Format Python however you like with Black
======
Learn more about solving common Python problems in our series covering
seven PyPI libraries.
![OpenStack source code \(Python\) in VIM][1]

Python is one of the most [popular programming languages][2] in use today—and for good reasons: it's open source, it has a wide range of uses (such as web programming, business applications, games, scientific programming, and much more), and it has a vibrant and dedicated community supporting it. This community is the reason we have such a large, diverse range of software packages available in the [Python Package Index][3] (PyPI) to extend and improve Python and solve the inevitable glitches that crop up.

In this series, we'll look at seven PyPI libraries that can help you solve common Python problems. In the first article, we learned about [Cython][4]; today, we'll examine the **[Black][5]** code formatter.

### Black

Sometimes creativity can be a wonderful thing. Sometimes it is just a pain. I enjoy solving hard problems creatively, but I want my Python formatted as consistently as possible. Nobody has ever been impressed by code that uses "interesting" indentation.

But even worse than inconsistent formatting is a code review that consists of nothing but formatting nits. It is annoying to the reviewer—and even more annoying to the person whose code is reviewed. It's also infuriating when your linter tells you that your code is indented incorrectly, but gives no hint about the _correct_ amount of indentation.

Enter Black. Instead of telling you _what_ to do, Black is a good, industrious robot: it will fix your code for you.

To see how it works, feel free to write something beautifully inconsistent like:


```
def add(a, b): return a+b

def mult(a, b):
return \
a * b
```

Does Black complain? Goodness no, it just fixes it for you!


```
$ black math
reformatted math
All done! ✨ 🍰 ✨
1 file reformatted.
$ cat math
def add(a, b):
return a + b

def mult(a, b):
return a * b
```

Black does offer the option of failing instead of fixing and even outputting a **diff** -style edit. These options are great in a continuous integration (CI) system that enforces running Black locally. In addition, if the **diff** output is logged to the CI output, you can directly paste it into **patch** in the rare case that you need to fix your output but cannot install Black locally.


```
$ black --check --diff bad
\--- math 2019-04-09 17:24:22.747815 +0000
+++ math 2019-04-09 17:26:04.269451 +0000
@@ -1,7 +1,7 @@
-def add(a, b): return a + b
+def add(a, b):
\+ return a + b


def mult(a, b):
\- return \
\- a * b
\+ return a * b

would reformat math
All done! 💥 💔 💥
1 file would be reformatted.
$ echo $?
1
```

In the next article in this series, we'll look at **attrs** , a library that helps you write concise, correct code quickly.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-black

作者：[Moshe Zadka ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/moshez/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm (OpenStack source code (Python) in VIM)
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://opensource.com/article/19/4/7-python-problems-solved-cython
[5]: https://pypi.org/project/black/
