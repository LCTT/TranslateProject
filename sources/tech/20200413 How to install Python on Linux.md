[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Python on Linux)
[#]: via: (https://opensource.com/article/20/4/install-python-linux)
[#]: author: (Vijay Singh Khatri https://opensource.com/users/vijaytechnicalauthor)

How to install Python on Linux
======
Step-by-step instructions for installing the latest Python instead of
(or alongside) an older version on Linux.
![OpenStack source code \(Python\) in VIM][1]

[Python][2] is now the [most popular][3], most used programming language. Python's simple syntax and low learning curve make it the ultimate choice for beginners as well as professional developers. Python is also a very versatile programming language. It's used nearly everywhere—from web development to artificial intelligence—really anywhere other than mobile development.

If you're using Python, there's a good chance you're a developer (or want to become one), and Linux is a great platform for creating software. But when you're working with Python every day, you sometimes want to stay up to date with the very latest version. You may not want to replace the default install of Python on your system just to test drive the latest one, so this article explains how to install the latest version of Python 3 on Linux without replacing the version provided by your distribution.

Use the **python --version terminal** command to check whether Python is already installed and, if so, which version you have. If Python is not installed on your Linux system, or you want to install an updated version, follow the steps below.

### Step-by-step installation instructions

#### **Step 1:** First, install development packages required to build Python.

#### On Debian:


```
$ sudo apt update
$ sudo apt install build-essential zlib1g-dev \
libncurses5-dev libgdbm-dev libnss3-dev \
libssl-dev libreadline-dev libffi-dev curl
```

#### On Fedora:


```
`$ sudo dnf groupinstall development`
```

#### Step 2: Download the stable latest release of Python 3

Visit the [official Python website][4] and download the latest version of Python 3. After the download is complete, you hav a **.tar.xz** archive file (a "tarball") containing the source code of Python.

#### Step 3: Extract the tarball

Once the download is complete, extract the tarball by either using the extractor application of your choice or the [Linux **tar** command][5], for example:


```
`$ tar -xf Python-3.?.?.tar.xz`
```

#### Step 4: Configure the script

Once the Python tarball has been extracted, navigate to the configure script and execute it in your Linux terminal with:


```
$ cd Python-3.*
./configure
```

The configuration may take some time. Wait until it is successfully finishes before proceeding.

#### Step 5: Start the build process

If you already have a version of Python installed on your system and you want to install the new version alongside it, use this command:


```
`$ sudo make altinstall`
```

The build process may take some time.

If you want to replace your current version of Python with this new version, you should uninstall your current Python package using your package manager (such as **apt** or **dnf**) and then install:


```
`$ sudo make install`
```

However, it's generally preferable to install software as a package (such as a **.deb** or **.rpm** file) so your system can track and update it for you. Because this article assumes the latest Python isn't yet packaged yet, though, you probably don't have that option. In that case, you can either install Python with **altinstall** as suggested, or rebuild an existing Python package using the latest source code. That's an advanced topic and specific to your distribution, so it's out of scope for this article.

#### Step 6: Verify the installation

If you haven't encountered any errors, the latest Python is now installed on your Linux system. To verify it, write one of these commands in your terminal:


```
`python3 --version`
```

or


```
`python --version`
```

If the output says **Python 3.x**, Python 3 has been successfully installed.

### Create a virtual environment (optional)

Python provides a package known as **venv** (virtual environment), which helps you isolate a program directory or package from other ones.

To create a virtual environment, enter the following in the Python terminal (in this example, assume the version of Python you've installed is in the **3.8** series):


```
`python3.8 -m venv example`
```

This command creates a new directory (which I've named **example**), with some subdirectories.

To activate the virtual environment, enter:


```
$ source example/bin/activate
(example) $
```

Notice that your terminal prompt (**$**) is now preceeded by an environment name.

To deactivate the virtual environment, use the **deactivate** command:


```
`(example) $ deactivate`
```

### Conclusion

Python is a fun language that's developed and improved frequently. Getting familiar with new features is easy, once you understand how to install the latest release without interfering with the stable version provided from your distribution.

If you have any feedback or questions, please leave them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/install-python-linux

作者：[Vijay Singh Khatri][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vijaytechnicalauthor
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm (OpenStack source code (Python) in VIM)
[2]: https://www.python.org/
[3]: http://pypl.github.io/PYPL.html
[4]: http://python.org
[5]: https://opensource.com/article/17/7/how-unzip-targz-file
