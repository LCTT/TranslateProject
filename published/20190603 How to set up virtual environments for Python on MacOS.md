[#]: collector: (lujun9972)
[#]: translator: (runningwater)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11086-1.html)
[#]: subject: (How to set up virtual environments for Python on MacOS)
[#]: via: (https://opensource.com/article/19/6/virtual-environments-python-macos)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg/users/moshez/users/mbbroberg/users/moshez)

MacOS 系统中如何设置 Python 虚拟环境
======

> 使用 pyenv 和 virtualwrapper 来管理你的虚拟环境，可以避免很多困惑。

![][1]

作为 Python 开发者和 MacOS 用户，拿到新机器首先要做的就是设置 Python 开发环境。下面是最佳实践（虽然我们已经写过 [在 MacOS 上管理 Python 的其它方法][2]）。

### 预备

首先，打开终端，在其冰冷毫无提示的窗口输入 `xcode-select --install` 命令。点击确认后，基本的开发环境就会被配置上。MacOS 上需要此步骤来设置本地开发实用工具库，根据 [OS X Daily][3] 的说法，其包括 ”许多常用的工具、实用程序和编译器，如 make、GCC、clang、perl、svn、git、size、strip、strings、libtool、cpp、what 及许多在 Linux 中系统默认安装的有用命令“。

接下来,安装 [Homebrew][4], 执行如下的 Ruby 脚本。

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

如果你像我一样，对随意就运行的来源于互联网的脚本心存疑虑的话，可以点击上面的脚本去仔细看看其具体功能。

一旦安装完成后，就恭喜了，你拥有了一个优秀的包管理工具。自然的，你可能接下来会执行 `brew install python` 或其他的命令。不要这样，哈哈！Homebrew 是为我们提供了一个 Python 的管理版本，但让此工具来管理我们的 Python 环境话，很快会失控的。我们需要 [pyenv][5]，一款简单的 Python 版本管理工具，它可以安装运行在 [许多操作系统][6] 上。运行如下命令：

```
$ brew install pyenv
```

想要每次打开命令提示框时 `pyenv` 都会运行的话，需要把下面的内容加入你的配置文件中（MacOS 中默认为 `.bash_profile`，位于家目录下）：

```
$ cd ~/
$ echo 'eval "$(pyenv init -)"' >> .bash_profile
```

添加此行内容后，每个终端都会启动 `pyenv` 来管理其 `PATH` 环境变量，并插入你想要运行的 Python 版本（而不是在环境变量里面设置的初始版本。更详细的信息，请阅读 “[如何给 Linux 系统设置 PATH 变量][7]”）。打开新的终端以使修改的 `.bash_profile` 文件生效。

在安装你中意的 Python 版本前，需要先安装一些有用的工具，如下示：

```
$ brew install zlib sqlite
```

`pyenv` 依赖于 [zlib][8] 压缩算法和 [SQLite][9] 数据库，如果未正确配置，往往会[导致构建问题][10]。将这些导出配置命令加入当前的终端窗口执行，确保它们安装完成。

```
$ export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
$ export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
```

现在准备工作已经完成，是时候安装一个适合于现代人的 Python 版本了：

```
$ pyenv install 3.7.3
```

去喝杯咖啡吧，挑些豆类，亲自烧烤，然后品尝。说这些的意思是上面的安装过程需要一段时间。

### 添加虚拟环境

一旦完成，就可以愉快地使用虚拟环境了。如没有接下来的步骤的话，你只能在你所有的工作项目中共享同一个 Python 开发环境。使用虚拟环境来隔离每个项目的依赖关系的管理方式，比起 Python 自身提供的开箱即用功能来说，更加清晰明确和更具有重用性。基于这些原因，把 `virtualenvwrapper` 安装到 Python 环境中吧： 

```
$ pyenv global 3.7.3
# Be sure to keep the $() syntax in this command so it can evaluate
$ $(pyenv which python3) -m pip install virtualenvwrapper
```

再次打开 `.bash_profile` 文件，把下面内容添加进去，使得每次打开新终端时它都有效：

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

关掉终端再重新打开（或者运行 `exec /bin/bash -l` 来刷新当前的终端会话），你会看到 `virtualenvwrapper` 正在初始化环境配置：

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

从此刻开始，你的所有工作都是在虚拟环境中的，其允许你使用临时环境来安全地开发。使用此工具链，你可以根据工作所需，设置多个项目并在它们之间切换：

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

此处，使用 `deactivate` 命令可以退出当前环境。

### 推荐实践

你可能已经在比如 `~/src` 这样的目录中添加了长期的项目。当要开始了一个新项目时，进入此目录，为此项目增加子文件夹，然后使用强大的 Bash 解释程序自动根据你的目录名来命令虚拟环境。例如，名称为 “pyfun” 的项目： 

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

当需要处理此项目时，只要进入该目录，输入如下命令重新连接虚拟环境：

```
$ cd ~/src/pyfun
(pyfun)$ workon .
```

初始化虚拟环境意味着对 Python 版本和所加载的模块的时间点的拷贝。由于依赖关系会发生很大的改变，所以偶尔需要刷新项目的虚拟环境。这种情况，你可以通过删除虚拟环境来安全的执行此操作，源代码是不受影响的，如下所示：

```
$ cd ~/src/pyfun
$ rmvirtualenv $(basename $(pwd))
$ mkvirtualenv $(basename $(pwd))
```

这种使用 `pyenv` 和 `virtualwrapper` 管理虚拟环境的方法可以避免开发环境和运行环境中 Python 版本的不一致出现的苦恼。这是避免混淆的最简单方法 - 尤其是你工作的团队很大的时候。

如果你是初学者，正准备配置 Python 环境，可以阅读下 [MacOS 中使用 Python 3][2] 文章。 你们有关于 Python 相关的问题吗，不管是初学者的还是中级使用者的？给我们留下评论信息，我们在下篇文章中会考虑讲解。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/virtual-environments-python-macos

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

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
