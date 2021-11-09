[#]: subject: "How to package your Python code"
[#]: via: "https://opensource.com/article/21/11/packaging-python-setuptools"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to package your Python code
======
Use setuptools to deliver Python code to users.
![Python programming language logo with question marks][1]

You've spent weeks perfecting your code. You've tested it and sent it to some close developer friends for quality assurance. You've posted all the source code on [your personal Git server][2], and you've received helpful bug reports from a few brave early adopters. And now you're ready to make your Python code available to the world.

And that's when it hits you. You have no idea how to deliver the product.

Delivering code to its target is a big deal. It's a whole branch of software development, it's the "D" in CI/CD, and yet many people forget all about, at least until the end. I've written articles about [Autotools][3] and [Cmake][4], but some languages have their own methods to help you make your code readily available to users. For Python, a common way to deliver code to users is with `setuptools`.

### Install setuptools

The easiest way to install and update `setuptools` is with `pip`:


```
`$ sudo python -m pip install --upgrade setuptools`
```

### Example library

Create a simple Python library called `myhellolib` for some example code in need of packaging. This library accepts a string and then prints the string in capital letters.
It's two lines of code, but project structure is important, so first create the directory tree:


```
`$ mkdir -p myhellolib.git/myhellolib`
```

To confirm that this project is an importable library (a Python "module"), create the empty file `__init__.py` in the code directory, along with the file that contains the code:


```


$ touch myhellolib.git/myhellolib/__init__.py
$ touch myhellolib.git/myhellolib/myhellolib.py

```

In the `myhellolib.py` file, enter this simple Python code:


```


def greeter(s):
    print(s.upper())

```

That's the library written.

### Test it

Before packaging it up, test your library. Create a `myhellolib.git/test.py` file and enter this code:


```


import myhellolib.myhellolib as hello

hello.greeter("Hello Opensource.com.")

```

Run the script:


```


$ cd myhellolib.git
$ python ./test.py
HELLO OPENSOURCE.COM

```

It works, so now you can package it up.

### Setuptools

To package a project with `setuptools`, you must create a `.toml` file identifying `setuptools` as the build system. Place this text in a file called `myhellolib.toml` in your project directory:


```


[build-system]
requires = ["setuptools", "wheel"]
build-backend = "setuptools.build_meta"

```

Next, create a file called `setup.py`, containing metadata about your project:


```


from setuptools import setup

setup(
    name='myhellolib',
    version='0.0.1',
    packages=['myhellolib'],
    install_requires=[
        'requests',
        'importlib; python_version == "3.8"',
    ],
)

```

Believe it or not, that's all the setup `setuptools` requires. Your project is ready for packaging.

### Packaging Python

To create your Python package, you need a builder. A common tool is `build`, which you can install with `pip`:


```
`$ python -m pip install build --user`
```

Build your project:


```
`$ python -m build`
```

After a few moments, the build completes, and there's a new directory in your project folder called `dist`. This folder contains a `.tar.gz` and a `.whl` file.
Your very first Python package! Here's what each one contains:


```


$ tar --list --file dist/myhellolib-0.0.1.tar.gz
myhellolib-0.0.1/
myhellolib-0.0.1/PKG-INFO
myhellolib-0.0.1/myhellolib/
myhellolib-0.0.1/myhellolib/__init__.py
myhellolib-0.0.1/myhellolib/myhellolib.py
myhellolib-0.0.1/myhellolib.egg-info/
myhellolib-0.0.1/myhellolib.egg-info/PKG-INFO
myhellolib-0.0.1/myhellolib.egg-info/SOURCES.txt
myhellolib-0.0.1/myhellolib.egg-info/dependency_links.txt
myhellolib-0.0.1/myhellolib.egg-info/requires.txt
myhellolib-0.0.1/myhellolib.egg-info/top_level.txt
myhellolib-0.0.1/setup.cfg
myhellolib-0.0.1/setup.py

$ unzip -l dist/myhellolib-0.0.1-py3-none-any.whl 
Archive:  dist/myhellolib-0.0.1-py3-none-any.whl
Name
\----
myhellolib/__init__.py
myhellolib/myhellolib.py
myhellolib-0.0.1.dist-info/METADATA
myhellolib-0.0.1.dist-info/WHEEL
myhellolib-0.0.1.dist-info/top_level.txt
myhellolib-0.0.1.dist-info/RECORD
\-------
6 files

```

### Making it available

Now that you know how easy it is to package up your Python package, you can either automate the process using Git hooks, GitLab webhooks, Jenkins, or a similar automation tool. You can even upload your project to PyPi, the popular repository for Python modules. Once it's on PyPi, users can install it using `pip`, the same way you installed `setuptools` and `build` for this article!

It's not often the first thing you think about when sitting down to develop an application or library, but packaging code is an important aspect of programming. Python developers put a lot of thought into how programmers can make their work available to the world, and it doesn't get much easier than `setuptools`. Try it out, use it, and keep coding in Python!

Python is a popular language for many applications. Those that run as backend services, now in the...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/packaging-python-setuptools

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[3]: https://opensource.com/article/19/7/introduction-gnu-autotools
[4]: https://opensource.com/article/21/5/cmake
