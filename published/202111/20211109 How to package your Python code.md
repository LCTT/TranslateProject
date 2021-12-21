[#]: subject: "How to package your Python code"
[#]: via: "https://opensource.com/article/21/11/packaging-python-setuptools"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13993-1.html"

如何打包你的 Python 代码
======

> 使用 setuptools 来向用户交付 Python 代码。

![](https://img.linux.net.cn/data/attachment/album/202111/17/180249s8s1cnnn18gh3fsk.jpg)

你花了几周的时间来完善你的代码。你已经对它进行了测试，并把它发送给一些亲近的开发者朋友以保证质量。你已经将所有的源代码发布在 [你的个人 Git 服务器][2] 上，并且从一些勇敢的早期使用者收到了一些有用的错误报告。现在你已经准备好将你的 Python 代码提供给全世界。

就在这时你遇到一个问题。你不知道如何交付产品。

将代码交付给它的目标用户是一件大事。这是软件开发的一个完整的分支，是 CI/CD 中的 “D”，但很多人都忘记了，至少到最后才知道。我写过关于 [Autotools][3] 和 [Cmake][4] 的文章，但有些语言有自己的方法来帮助你将你的代码提供给用户。对于 Python 来说，向用户提供代码的一个常见方法是使用 `setuptools`。

### 安装 setuptools

安装和更新 `setuptools` 的最简单方法是使用 `pip`：

```
$ sudo python -m pip install --upgrade setuptools
```

### 示例库

我创建了一个简单的 Python 库，名为 `myhellolib`，来作为需要打包的示例代码。这个库接受一个字符串，然后用大写字母打印出这个字符串。

它只有两行代码，但项目结构很重要，所以首先创建目录树：

```
$ mkdir -p myhellolib.git/myhellolib
```

为了确认这个项目是一个可导入的库（即 Python “模块”），在代码目录中创建一个空文件 `__init__.py`，同时创建一个包含代码的文件：

```
$ touch myhellolib.git/myhellolib/__init__.py
$ touch myhellolib.git/myhellolib/myhellolib.py
```

在 `myhellolib.py` 文件中，输入简单的 Python 代码：

```
def greeter(s):
    print(s.upper())
```

这就是写好的库。

### 测试它

在打包之前，测试一下你的库。创建一个 `myhellolib.git/test.py` 文件并输入以下代码：

```
import myhellolib.myhellolib as hello
hello.greeter("Hello Opensource.com.")
```

运行该脚本：

```
$ cd myhellolib.git
$ python ./test.py
HELLO OPENSOURCE.COM
```

它可以工作，所以现在你可以把它打包了。

### Setuptools

要用 `setuptools` 打包一个项目，你必须创建一个 `.toml` 文件，将 `setuptools` 作为构建系统。将这段文字放在项目目录下的 `myhellolib.toml` 文件中。

```
[build-system]
requires = ["setuptools", "wheel"]
build-backend = "setuptools.build_meta"
```

接下来，创建一个名为 `setup.py` 的文件，包含项目的元数据：

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

不管你信不信，这就是 `setuptools` 需要的所有设置。你的项目已经可以进行打包。

### 打包 Python

要创建你的 Python 包，你需要一个构建器。一个常见的工具是 `build`，你可以用 `pip` 安装它：

```
$ python -m pip install build --user
```

构建你的项目：

```
$ python -m build
```

过了一会儿，构建完成了，在你的项目文件夹中出现了一个新的目录，叫做 `dist`。这个文件夹包含一个 `.tar.gz` 和一个 `.whl` 文件。

这是你的第一个 Python 包! 下面是包的内容：

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
Archive:  dist/myhellolib-0.0.1-py3-none-any.whl
Name
----
myhellolib/__init__.py
myhellolib/myhellolib.py
myhellolib-0.0.1.dist-info/METADATA
myhellolib-0.0.1.dist-info/WHEEL
myhellolib-0.0.1.dist-info/top_level.txt
myhellolib-0.0.1.dist-info/RECORD
-------
6 files
```

### 让它可用

现在你知道了打包你的 Python 包是多么容易，你可以使用 Git 钩子、GitLab Web 钩子、Jenkins 或类似的自动化工具来自动完成这个过程。你甚至可以把你的项目上传到 PyPi，这个流行的 Python 模块仓库。一旦它在 PyPi 上，用户就可以用 `pip` 来安装它，就像你在这篇文章中安装 `setuptools` 和 `build` 一样！

当你坐下来开发一个应用或库时，打包并不是你首先想到的事情，但它是编程的一个重要方面。Python 开发者在程序员如何向世界提供他们的工作方面花了很多心思，没有比 `setuptools` 更容易的了。试用它，使用它，并继续用 Python 编码！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/packaging-python-setuptools

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[3]: https://opensource.com/article/19/7/introduction-gnu-autotools
[4]: https://opensource.com/article/21/5/cmake
