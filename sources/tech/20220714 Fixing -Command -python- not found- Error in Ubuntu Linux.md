[#]: subject: "Fixing “Command ‘python’ not found” Error in Ubuntu Linux"
[#]: via: "https://itsfoss.com/python-not-found-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing “Command ‘python’ not found” Error in Ubuntu Linux
======

How do you run a Python program in the Linux terminal? Like this, right?

```
python program.py
```

However, if you try to use the `python` command in Ubuntu (and some other distributions), it will throw an error.

Command ‘python’ not found, did you mean:command ‘python3’ from deb python3command ‘python’ from deb python-is-python3

If you pay attention to the error message, it clears a lot of things. **The python command is actually python3 here.**

If you don’t understand it, no worries. I’ll explain things in detail here.

### Why there is no python command found on Ubuntu?

It’s because the Python language is not installed as python but python3 or python2 (in some older Ubuntu versions).

At some point in time in the distant past, Python was actually available as `python` package/executable. When Python released version 2, Ubuntu and other distros had to provide support for both Python version 1.x and 2.x.

So, they named the newer Python version `python2` to distinguish between the two. Other applications or libraries also specified python or python2 in their code.

Eventually, Python version 1 was discontinued completely but the package continued to be named python2.

Similarly, when Python version 3 was released, distributions started providing both `python2` and `python3` packages.

Python 2 is no longer supported and Python 3.x is what you get on Ubuntu. The package is still named python3.

**To summarize, you have Python installed on Ubuntu already. It is available as python3 package.**

So, what are your options when you see Python [command not found error on Ubuntu][1]? Let me go over them.

### Make sure you have Python installed on your system

It should already be installed but no harm in double checking.

Ubuntu 18.04 had Python 2 as well but 20.04 and higher versions have Python 3 only. Still, which version(s) you have with:

```
type python python2 python3
```

As you can see in the screenshot below, I have Python version 3 installed on my system.

![Checking Python version in Ubuntu][2]

If you don’t have any Python version installed, you may install Python version 3 with the following command:

```
sudo apt install python3
```

### Use python3 instead of python

If it’s not too much of a trouble for you, use python3 command instead of python wherever required.

Want to check the installed python version? Use it like this:

```
python3 --version
```

And you get the version details in the output:

```
[email protected]:~$ python3 --version
Python 3.10.4
```

If you have to run a Python program, execute it like this:

```
python3 program.py
```

This should work for you in most cases. However, if you are using some (old) Python application that expects to run the python executable in its code, you’ll have issues. Don’t worry, you can get around it as well.

### Link python3 as python

You can create a permanent alias in your .bashrc file like this:

```
alias python='python3'
```

This way, you can run the `python` command and your system runs `python3`.

It will work in most cases unless some program expects to run /usr/bin/python. Now, you may create symlink between /usr/bin/python and /usr/bin/python3 but there exists a simpler option for Ubuntu users.

For Ubuntu 20.04 and higher versions, you have a package that does all link creation automatically if you install the python-is-python3 package. This is what the original error message has also suggested.

```
sudo apt install python-is-python3
```

![install python is python3 ubuntu][3]

You can see that symlinks have been created and you can use the python command (which actually runs python3) without any issues.

![checking python ubuntu][4]

I hope this clears the air on the Python package in Ubuntu. Let me know if you have any questions or suggestions.

#### Read More Articles

--------------------------------------------------------------------------------

via: https://itsfoss.com/python-not-found-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/bash-command-not-found/
[2]: https://itsfoss.com/wp-content/uploads/2022/07/check-python-version-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/07/install-python-is-python3-ubuntu.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/checking-python-ubuntu.png
