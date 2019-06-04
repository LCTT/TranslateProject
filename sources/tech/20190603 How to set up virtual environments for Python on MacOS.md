[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up virtual environments for Python on MacOS)
[#]: via: (https://opensource.com/article/19/6/virtual-environments-python-macos)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg/users/moshez/users/mbbroberg/users/moshez)

How to set up virtual environments for Python on MacOS
======
Save yourself a lot of confusion by managing your virtual environments
with pyenv and virtualwrapper.
![][1]

If you're a Python developer and a MacOS user, one of your first tasks upon getting a new computer is to set up your Python development environment. Here is the best way to do it (although we have written about [other ways to manage Python environments on MacOS][2]).

### Preparation

First, open a terminal and enter **xcode-select --install** at its cold, uncaring prompt. Click to confirm, and you'll be all set with a basic development environment. This step is required on MacOS to set up local development utilities, including "many commonly used tools, utilities, and compilers, including make, GCC, clang, perl, svn, git, size, strip, strings, libtool, cpp, what, and many other useful commands that are usually found in default Linux installations," according to [OS X Daily][3].

Next, install [Homebrew][4] by executing the following Ruby script from the internet:


```
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
```

If you, like me, have trust issues with arbitrarily running scripts from the internet, click on the script above and take a longer look to see what it does.

Once this is done, congratulations, you have an excellent package management tool in Homebrew. Naively, you might think that you next **brew install python** or something. No, haha. Homebrew will give you a version of Python, but the version you get will be out of your control if you let the tool manage your environment for you. You want [pyenv][5], "a tool for simple Python version management," that can be installed on [many operating systems][6]. Run:


```
`$ brew install pyenv`
```

You want pyenv to run every time you open your prompt, so include the following in your configuration files (by default on MacOS, this is **.bash_profile** in your home directory):


```
$ cd ~/
$ echo 'eval "$(pyenv init -)"' >> .bash_profile
```

By adding this line, every new terminal will initiate pyenv to manage the **PATH** environment variable in your terminal and insert the version of Python you want to run (as opposed to the first one that shows up in the environment. For more information, read "[How to set your $PATH variable in Linux][7].") Open a new terminal for the updated **.bash_profile** to take effect.

Before installing your favorite version of Python, you'll want to install a couple of helpful tools:


```
`$ brew install zlib sqlite`
```

The [zlib][8] compression algorithm and the [SQLite][9] database are dependencies for pyenv and often [cause build problems][10] when not configured correctly. Add these exports to your current terminal window to ensure the installation completes:


```
$ export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
$ export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
```

Now that the preliminaries are done, it's time to install a version of Python that is fit for a modern person in the modern age:


```
`$ pyenv install 3.7.3`
```

Go have a cup of coffee. From beans you hand-roast. After you pick them. What I'm saying here is it's going to take some time.

### Adding virtual environments

Once it's finished, it's time to make your virtual environments pleasant to use. Without this next step, you will effectively be sharing one Python development environment for every project you work on. Using virtual environments to isolate dependency management on a per-project basis will give us more certainty and reproducibility than Python offers out of the box. For these reasons, install **virtualenvwrapper** into the Python environment:


```
$ pyenv global 3.7.3
# Be sure to keep the $() syntax in this command so it can evaluate
$ $(pyenv which python3) -m pip install virtualenvwrapper
```

Open your **.bash_profile** again and add the following to be sure it works each time you open a new terminal:


```
# We want to regularly go to our virtual environment directory
$ echo 'export WORKON_HOME=~/.virtualenvs' >> .bash_profile
# If in a given virtual environment, make a virtual environment directory
# If one does not already exist
$ echo 'mkdir -p $WORKON_HOME' >> .bash_profile
# Activate the new virtual environment by calling this script
# Note that $USER will substitute for your current user
$ echo '. ~/.pyenv/versions/3.7.3/bin/virtualenvwrapper.sh' >> .bash_profile
```

Close the terminal and open a new one (or run **exec /bin/bash -l** to refresh the current terminal session), and you'll see **virtualenvwrapper** initializing the environment:


```
$ exec /bin/bash -l
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/premkproject
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/postmkproject
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/initialize
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/premkvirtualenv
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/postmkvirtualenv
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/prermvirtualenv
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/postrmvirtualenv
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/predeactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/postdeactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/preactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/postactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/get_env_details
```

From now on, all your work should be in a virtual environment, allowing you to use temporary environments to play around with development safely. With this toolchain, you can set up multiple projects and switch between them, depending upon what you're working on at that moment:


```
$ mkvirtualenv test1
Using base prefix '/Users/moshe/.pyenv/versions/3.7.3'
New python executable in /Users/moshe/.virtualenvs/test1/bin/python3
Also creating executable in /Users/moshe/.virtualenvs/test1/bin/python
Installing setuptools, pip, wheel...
done.
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test1/bin/predeactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test1/bin/postdeactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test1/bin/preactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test1/bin/postactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test1/bin/get_env_details
(test1)$ mkvirtualenv test2
Using base prefix '/Users/moshe/.pyenv/versions/3.7.3'
New python executable in /Users/moshe/.virtualenvs/test2/bin/python3
Also creating executable in /Users/moshe/.virtualenvs/test2/bin/python
Installing setuptools, pip, wheel...
done.
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test2/bin/predeactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test2/bin/postdeactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test2/bin/preactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test2/bin/postactivate
virtualenvwrapper.user_scripts creating /Users/moshe/.virtualenvs/test2/bin/get_env_details
(test2)$ ls $WORKON_HOME
get_env_details postmkvirtualenv premkvirtualenv
initialize postrmvirtualenv prermvirtualenv
postactivate preactivate test1
postdeactivate predeactivate test2
postmkproject premkproject
(test2)$ workon test1
(test1)$
```

The **deactivate** command exits you from the current environment.

### Recommended practices

You may already set up your long-term projects in a directory like **~/src**. When you start working on a new project, go into this directory, add a subdirectory for the project, then use the power of Bash interpretation to name the virtual environment based on your directory name. For example, for a project named "pyfun":


```
$ mkdir -p ~/src/pyfun && cd ~/src/pyfun
$ mkvirtualenv $(basename $(pwd))
# we will see the environment initialize
(pyfun)$ workon
pyfun
test1
test2
(pyfun)$ deactivate
$
```

Whenever you want to work on this project, go back to that directory and reconnect to the virtual environment by entering:


```
$ cd ~/src/pyfun
(pyfun)$ workon .
```

Since initializing a virtual environment means taking a point-in-time copy of your Python version and the modules that are loaded, you will occasionally want to refresh the project's virtual environment, as dependencies can change dramatically. You can do this safely by deleting the virtual environment because the source code will remain unscathed:


```
$ cd ~/src/pyfun
$ rmvirtualenv $(basename $(pwd))
$ mkvirtualenv $(basename $(pwd))
```

This method of managing virtual environments with pyenv and virtualwrapper will save you from uncertainty about which version of Python you are running as you develop code locally. This is the simplest way to avoid confusion—especially when you're working with a larger team.

If you are just beginning to configure your Python environment, read up on how to use [Python 3 on MacOS][2]. Do you have other beginner or intermediate Python questions? Leave a comment and we will consider them for the next article.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/virtual-environments-python-macos

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg/users/moshez/users/mbbroberg/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_snake_file_box.jpg?itok=UuDVFLX-
[2]: https://opensource.com/article/19/5/python-3-default-macos
[3]: http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/
[4]: https://brew.sh/
[5]: https://github.com/pyenv/pyenv
[6]: https://github.com/pyenv/pyenv/wiki
[7]: https://opensource.com/article/17/6/set-path-linux
[8]: https://zlib.net/
[9]: https://www.sqlite.org/index.html
[10]: https://github.com/pyenv/pyenv/wiki/common-build-problems#build-failed-error-the-python-zlib-extension-was-not-compiled-missing-the-zlib
