[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install pip to manage PyPI packages easily)
[#]: via: (https://opensource.com/article/20/3/pip-linux-mac-windows)
[#]: author: (Vijay Singh Khatri https://opensource.com/users/vijaytechnicalauthor)

How to install pip to manage PyPI packages easily
======
Install the pip package manager on older versions of Python on Linux,
Mac, and Windows that don't come preinstalled with pip.
![Person typing on a 1980's computer][1]

Python is a powerful and popular programming language with many packages that are useful for general programming, data science, and many other things. These packages are not included with the Python installation, so you have to download, install, and manage them separately. All of these packages (libraries and frameworks) are stored in a central repository called the Python Package Index, or [PyPI][2] for short. This is where pip (short for Preferred Installer Program), Python's package manager, comes into the picture.

Installing Python pip on your system allows you to manage PyPI packages easily. Many of these packages can be installed just by typing **python -m pip install &lt;package-name&gt;** into a terminal or command-line.

Newer versions of Python 3 (3.4 and higher) and Python 2 (2.7.9 and higher) come preloaded with pip. Older versions of Python didn't include pip, but it can be installed retroactively.

In this article, I explain how to install pip on Linux, Mac, and Windows computers. You can also check the [pip.pypa][3] documentation for more information.

### Make sure Python is installed

If you don't already have Python installed on your system, do that first; otherwise, the pip installer won't understand any commands. To check whether you have Python, enter **python** in your command line, Bash, or terminal window and see what happens. If the command is not recognized, then you need to [download Python][4]. If you have Python installed, you will see a lot of commands and other stuff that will indicate you can install pip.

### Install Python pip on Linux

The command you use to install pip on Linux depends on the distribution you use.

On Fedora, RHEL, and CentOS:


```
`$ sudo dnf install python3`
```

For Debian or Ubuntu, use the Apt package:


```
`$ sudo apt install python3-pip`
```

Other distributions may have their own package manager. For example, Arch Linux uses pacman:


```
`$ sudo pacman -S python-pip`
```

To find out whether pip is installed properly, check the version using the **\--version** option.

That's all you need. You can skip down to the [using pip][5] section of this article.

### Install Python pip on Mac

MacOS comes with Python installed by default, but the version provided by Apple is almost always outdated, even right an OS release. If you're working with Python, you should [use a custom install of Python 3][6].

To install Python 3 on a Mac, use [homebrew][7]:


```
`$ brew update && brew upgrade python`
```

Because you've installed a recent version of Python3, pip is also installed. ****You can verify it with:


```
`$ python3 -m pip --version`
```

That's all you need. You can skip down to the [using pip][5] section of this article.

### Install Python pip on Windows

To install pip, you must have Windows 8 or 10. The screenshots below are from Windows 10 (but the same commands work for Windows 8).

Once you confirm you have [Python installed][8].

If you want the same luxuries as Linux users have with a package manager, you can use the [Chocolatey][9] package manager for Windows. This provides easy access to Python but also easy updates. You can use it in the open source PowerShell application to make amazing things happen in just a few commands.


```
`PS> choco install python`
```

That's it! You can now use pip to install any package you need.

### Using Python pip

Python pip works exactly the same way on each platform: Linux, BSD, Windows, Mac, and so on.

To install the imaginary library **foo**, use:


```
`python3 -m pip install foo --user`
```

To uninstall it:


```
`python3 -m pip uninstall foo`
```

To search for a package:


```
`python3 -m pip search foo`
```

To upgrade to a new version of pip:


```
`$ sudo pip install --upgrade pip`
```

On Windows, omit the **sudo** command (Windows has its own method of privilege management, so you may need to [create an exception to your execution policy][10]).


```
`python -m pip install --upgrade pip`
```

I hope you tried the installation methods described in this article and that they helped you. Please share your experience in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/pip-linux-mac-windows

作者：[Vijay Singh Khatri][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vijaytechnicalauthor
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://pypi.org/
[3]: https://pip.pypa.io/en/stable/installing/
[4]: https://www.python.org/downloads/
[5]: tmp.u1JOYd3gs9#usage
[6]: https://opensource.com/article/19/5/python-3-default-mac
[7]: https://brew.sh
[8]: https://opensource.com/article/19/8/how-install-python-windows
[9]: https://opensource.com/article/20/3/chocolatey
[10]: https://opensource.com/article/20/3/chocolatey#admin
