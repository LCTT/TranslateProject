[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12582-1.html)
[#]: subject: (Create and run Python apps on your Android phone)
[#]: via: (https://opensource.com/article/20/8/python-android-mobile)
[#]: author: (Phani Adabala https://opensource.com/users/adabala)

在你的 Android 手机上创建和运行 Python 应用
======

> 使用 Termux 和 Flask 在你的移动设备上创建、开发和运行一个网页应用。

![](https://img.linux.net.cn/data/attachment/album/202009/04/214901zsohgryndzrcs6zz.jpg)

学习和使用 Python 是很有趣的。由于它越来越受欢迎，有越来越多的方式可以让计算世界比现在更好。

想象一下，只需一个 Android 移动设备和开源工具，就可以构建和运行一个 Python 应用，无论是开发一个命令行工具从互联网上获取你最喜欢的文章，还是启动一个直接在掌上设备运行的网页服务器，所有这些都可以实现。这将完全改变你对移动设备的看法，将它从一个仅仅让你消费内容的设备变成一个帮助你发挥创造力的设备。

在本文中，我将演示运行和测试一个简单的 Python 应用所需的所有的工具、软件包、步骤和各种零零散散的东西。我使用 [Flask 框架][2]来创建一个简单的 “Hello, World!” 应用，并在一个简单而强大的网页服务器上运行。最棒的是，这一切都发生在手机上。不需要笔记本或台式机。

### 在 Android 上安装 Termux

首先，[安装 Termux 应用程序][3]。Termux 是一个强大的终端仿真器，它提供了所有最流行的 Linux 命令，加上数百个额外的包，以便于安装。它不需要任何特殊的权限，你可以使用默认的 [Google Play][4] 商店或开源应用仓库 [F-Droid][5] 来安装。

![Welcome to Termux][6]

安装 Termux 后，启动它并使用 Termux 的 `pkg` 命令执行一些必要的软件安装。

订阅附加仓库 `root-repo`：

```
$ pkg install root-repo
```

执行更新，使所有安装的软件达到最新状态。

```
$ pkg update
```

最后，安装 Python：

```
$ pkg install python
```

![Install Python][7]

安装和自动配置完成后，就可以构建你的应用了。

### 在 Android 上构建一个 Android 应用

现在你已经安装了一个终端，你可以在很大程度上像使用另一台 Linux 电脑一样使用你的 Android 手机。这很好地展示了终端到底有多强大。

首先创建一个项目目录：

```
$ mkdir Source
$ cd Source
```

接下来，创建一个 Python 虚拟环境。这是 Python 开发者的常见做法，它有助于让你的 Python 项目独立于你的开发系统（在本例中是你的手机）。在你的虚拟环境中，你将能够安装特定于你应用的 Python 模块。

```
$ python -m venv venv
```

激活你的新虚拟环境（注意，开头的两个点用空格隔开）

```
$ . ./venv/bin/activate
(env)$
```

请注意你的 shell 提示符现在以 `(env)` 开头，表示你在虚拟环境中。

现在使用 `pip` 安装 Flask Python 模块。

```
(env) $ pip install flask
```

### 在 Android 上写 Python 代码

你已经准备好了。现在你需要为你的应用编写代码。

要做到这一点，你需要有经典文本编辑器的经验。我使用的是 `vi`。如果你不熟悉 `vi`，请安装并试用 `vimtutor`，它（如其名称所暗示的）可以教你如何使用这个编辑器。如果你有其他你喜欢的编辑器，如 `jove`、`jed`、`joe` 或 `emacs`，你可以安装并使用其中一个。

现在，由于这个演示程序非常简单，你也可以直接使用 shell 的 heredoc 功能，它允许你直接在提示符中输入文本。

```
(env)$ cat << EOF >> hello_world.py
> from flask import Flask
> app = Flask(__name__)
>
> @app.route('/')
> def hello_world():
>     return 'Hello, World!'
> EOF
(env)$
```

这只有六行代码，但有了它，你可以导入 Flask，创建一个应用，并将传入流量路由到名为 `hello_world` 的函数。

![Vim on Android][8]

现在你已经准备好了网页服务器的代码。现在是时候设置一些[环境变量][9]，并在你的手机上启动一个网页服务器了。

```
(env) $ export FLASK_APP=hello_world.py
(env) $ export FLASK_ENV=development
(evn) $ python hello_world.py
```

![Running a Flask app on your phone][10]

启动应用后，你会看到这条消息:

```
serving Flask app… running on http://127.0.0.1:5000/
```

这表明你现在在 localhost（也就是你的设备）上运行着一个微型网页服务器。该服务器正在监听来自 5000 端口的请求。

打开你的手机浏览器并进入到 `http://localhost:5000`，查看你的网页应用。

![Your web app][11]

你并没有损害手机的安全性。你只运行了一个本地服务器，这意味着你的手机不接受来自外部世界的请求。只有你可以访问你的 Flask 服务器。

为了让别人看到你的服务器，你可以在 `run` 命令中加入 `--host=0.0.0.0` 来禁用 Flask 的调试模式。这会打开你的手机上的端口，所以要谨慎使用。

```
(env) $ export FLASK_ENV=””
(env) $ flask run –host=0.0.0.0
```

按 `Ctrl+C` 停止服务器（使用特殊的 `Termux` 键来作为 `Ctrl` 键）。

### 决定下一步怎么做

你的手机可能不是一个严肃的网页应用的理想服务器平台，但这个例子证明了可能性是无限的。你可能会在 Android 手机上编程，只是因为这是一种方便的实践方式，或者因为你有一个令人兴奋的本地化网页应用的新想法，或者你只是碰巧使用 Flask 应用来完成自己的日常任务。正如爱因斯坦曾经说过的“想象力比知识更重要”，对于任何一个新手编码者，或者一个经验丰富的 Linux 或 Android 爱好者来说，这是一个有趣的小项目。它可以扩展到无穷的层次，所以让你的好奇心接手，并做出一些令人兴奋的东西!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/python-android-mobile

作者：[Phani Adabala][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/adabala
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_penguin_linux_android.jpg?itok=ctgANLI7 (Tux and Android stuffed animals on shelf)
[2]: https://opensource.com/article/18/4/flask
[3]: https://opensource.com/article/20/8/termux
[4]: https://play.google.com/store/apps/details?id=com.termux
[5]: https://f-droid.org/repository/browse/?fdid=com.termux
[6]: https://opensource.com/sites/default/files/termux-flask-1_0.webp (Welcome to Termux)
[7]: https://opensource.com/sites/default/files/termux-install-python.webp (Install Python)
[8]: https://opensource.com/sites/default/files/termux-python-vim.webp (Vim on Android)
[9]: https://opensource.com/article/19/8/what-are-environment-variables
[10]: https://opensource.com/sites/default/files/termux-flask-run.webp (Running a Flask app on your phone)
[11]: https://opensource.com/sites/default/files/flask-app-android.webp (Your web app)
