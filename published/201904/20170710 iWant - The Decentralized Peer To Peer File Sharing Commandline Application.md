iWant：一个去中心化的点对点共享文件的命令行工具
======

![](https://www.ostechnix.com/wp-content/uploads/2017/07/p2p-720x340.jpg)

不久之前，我们编写了一个指南，内容是一个文件共享实用程序，名为 [transfer.sh][1]，它是一个免费的 Web 服务，允许你在 Internet 上轻松快速地共享文件，还有 [PSiTransfer][2]，一个简单的开源自托管文件共享解决方案。今天，我们将看到另一个名为 “iWant” 的文件共享实用程序。它是一个基于命令行的自由开源的去中心化点对点文件共享应用程序。

你可能想知道，它与其它文件共享应用程序有什么不同？以下是 iWant 的一些突出特点。

  * 它是一个命令行应用程序。这意味着你不需要消耗内存来加载 GUI 实用程序。你只需要一个终端。
  * 它是去中心化的。这意味着你的数据不会在任何中心位置存储。因此，不会因为中心点失败而失败。
  * iWant 允许中断下载，你可以在以后随时恢复。你不需要从头开始下载，它会从你停止的位置恢复下载。
  * 共享目录中文件所作的任何更改（如删除、添加、修改）都会立即反映在网络中。
  * 就像种子一样，iWant 从多个节点下载文件。如果任何节点离开群组或未能响应，它将继续从另一个节点下载。
  * 它是跨平台的，因此你可以在 GNU/Linux、MS Windows 或者 Mac OS X 中使用它。

### 安装 iWant

iWant 可以使用 PIP 包管理器轻松安装。确保你在 Linux 发行版中安装了 pip。如果尚未安装，参考以下指南。

[如何使用 Pip 管理 Python 包](https://www.ostechnix.com/manage-python-packages-using-pip/)

安装 pip 后，确保你有以下依赖项：

  * libffi-dev
  * libssl-dev

比如说，在 Ubuntu 上，你可以使用以下命令安装这些依赖项：

```
$ sudo apt-get install libffi-dev libssl-dev
```

安装完所有依赖项后，使用以下命令安装 iWant：

```
$ sudo pip install iwant
```

现在我们的系统中已经有了 iWant，让我们来看看如何使用它来通过网络传输文件。

### 用法

首先，使用以下命令启动 iWant 服务器：

（LCTT 译注：虽然这个软件是叫 iWant，但是其命令名为 `iwanto`，另外这个软件至少一年没有更新了。）

```
$ iwanto start
```

第一次启动时，iWant 会询问想要分享和下载文件夹的位置，所以需要输入两个文件夹的位置。然后，选择要使用的网卡。

示例输出：

```
Shared/Download folder details looks empty..
Note: Shared and Download folder cannot be the same
SHARED FOLDER(absolute path):/home/sk/myshare
DOWNLOAD FOLDER(absolute path):/home/sk/mydownloads
Network interface available
1. lo => 127.0.0.1
2. enp0s3 => 192.168.43.2
Enter index of the interface:2
now scanning /home/sk/myshare
[Adding] /home/sk/myshare 0.0
Updating Leader 56f6d5e8-654e-11e7-93c8-08002712f8c1
[Adding] /home/sk/myshare 0.0
connecting to 192.168.43.2:1235 for hashdump
```

如果你看到类似上面的输出，你可以立即开始使用 iWant 了。

同样，在网络中的所有系统上启动 iWant 服务，指定有效的分享和下载文件夹的位置，并选择合适的网卡。

iWant 服务将继续在当前终端窗口中运行，直到你按下 `CTRL+C` 退出为止。你需要打开一个新选项卡或新的终端窗口来使用 iWant。

iWant 的用法非常简单，它的命令很少，如下所示。

  * `iwanto start` – 启动 iWant 服务。
  * `iwanto search <name>` – 查找文件。
  * `iwanto download <hash>` – 下载一个文件。
  * `iwanto share <path>` – 更改共享文件夹的位置。
  * `iwanto download to <destination>` – 更改下载文件夹位置。
  * `iwanto view config` – 查看共享和下载文件夹。
  * `iwanto –version` – 显示 iWant 版本。
  * `iwanto -h` – 显示帮助信息。

让我向你展示一些例子。

#### 查找文件

要查找一个文件，运行：

```
$ iwanto search <filename>

```

请注意，你无需指定确切的名称。

示例：

```
$ iwanto search command
```

上面的命令将搜索包含 “command” 字符串的所有文件。

我的 Ubuntu 系统会输出：

```
Filename Size Checksum
------------------------------------------- ------- --------------------------------
/home/sk/myshare/THE LINUX COMMAND LINE.pdf 3.85757 efded6cc6f34a3d107c67c2300459911
```

#### 下载文件

你可以在你的网络上的任何系统下载文件。要下载文件，只需提供文件的哈希（校验和），如下所示。你可以使用 `iwanto search` 命令获取共享的哈希值。

```
$ iwanto download efded6cc6f34a3d107c67c2300459911
```

文件将保存在你的下载位置，在本文中是 `/home/sk/mydownloads/` 位置。

```
Filename: /home/sk/mydownloads/THE LINUX COMMAND LINE.pdf
Size: 3.857569 MB
```

#### 查看配置

要查看配置，例如共享和下载文件夹的位置，运行：

```
$ iwanto view config
```

示例输出：

```
Shared folder:/home/sk/myshare
Download folder:/home/sk/mydownloads
```

#### 更改共享和下载文件夹的位置

你可以更改共享文件夹和下载文件夹。

```
$ iwanto share /home/sk/ostechnix
```

现在，共享位置已更改为 `/home/sk/ostechnix`。

同样，你可以使用以下命令更改下载位置：

```
$ iwanto download to /home/sk/Downloads
```

要查看所做的更改，运行命令：

```
$ iwanto view config
```

#### 停止 iWant

一旦你不想用 iWant 了，可以按下 `CTRL+C` 退出。

如果它不起作用，那可能是由于防火墙或你的路由器不支持多播。你可以在  `~/.iwant/.iwant.log` 文件中查看所有日志。有关更多详细信息，参阅最后提供的项目的 GitHub 页面。

差不多就是全部了。希望这个工具有所帮助。下次我会带着另一个有趣的指南再次来到这里。

干杯！

### 资源

-[iWant GitHub](https://github.com/nirvik/iWant)

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/iwant-decentralized-peer-peer-file-sharing-commandline-application/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/easy-fast-way-share-files-internet-command-line/
[2]:https://www.ostechnix.com/psitransfer-simple-open-source-self-hosted-file-sharing-solution/
