Terminalizer：一个记录您终端活动并且生成 Gif 图像的工具
====

今天我们要讨论一个广为人知的主题，我们也围绕这个主题写过许多的文章，因此我不会针对这个如何记录终端会话流程给出太多具体的资料。

我们可以使用脚本命令来记录 Linux 的终端会话，这也是大家公认的一种办法。不过今天我们将来介绍一个能起到相同作用的工具 —— Terminalizer。

这个工具可以帮助我们记录用户的终端活动，以帮助我们从输出的文件中找到有用的信息。

### 什么是 Terminlizer

用户可以用 Terminlizer 记录他们的终端活动并且生成一个 Gif 图像。它是一个允许高度定制的 CLI 工具。用户可以在网络播放器、在线播放器上用链接分享他们记录下的文件。

**推荐阅读：**

 - [Script – 一个记录您终端对话的简单工具][1]
 - [在 Linux 上自动记录/捕捉所有用户的终端对话][2]
 - [Teleconsole – 一个能立即与任何人分享您终端对话的工具][3]
 - [tmate – 立即与任何人分享您的终端对话][4]
 - [Peek – 在 Linux 里制造一个 Gif 记录器][5]
 - [Kgif – 一个能生成 Gif 图片，以记录窗口活动的简单 Shell 脚本][6]
- [Gifine – 在 Ubuntu/Debian 里快速制造一个 Gif 视频][7]

目前没有发行版拥有官方软件包来安装此实用程序，不过我们可以用 Node.js 来安装它。

### 如何在 Linux 上安装 Node.js

安装 Node.js 有许多种方法。我们在这里将会教您一个常用的方法。

在 Ubuntu/LinuxMint 上可以使用 [APT-GET 命令][8] 或者 [APT 命令][9] 来安装 Node.js。
 
```
$ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
$ sudo apt-get install -y nodejs
```
 
在 Debian 上使用 [APT-GET 命令][8] 或者 [APT 命令][9] 来安装 Node.js。
 
```
# curl -sL https://deb.nodesource.com/setup_8.x | bash -
# apt-get install -y nodejs 
```
 
在 RHEL/CentOS 上，使用 [YUM 命令][10] 来安装。
 
```
$ sudo curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
$ sudo yum install epel-release
$ sudo yum -y install nodejs
```
 
在 Fedora 上，用 [DNF 命令][11] 来安装 tmux。
 
```
$ sudo dnf install nodejs
```

在 Arch Linux 上，用 [Pacman 命令][12] 来安装 tmux。

```
$ sudo pacman -S nodejs npm
```
 
在 openSUSE 上，用 [Zypper Command][13] 来安装 tmux。
 
```
$ sudo zypper in nodejs6
```
 
### 如何安装 Terminalizer
 
您已经安装了 Node.js 这个先决软件包，现在是时候在您的系统上安装 Terminalizer 了。简单执行如下的 `npm` 命令即可安装。
 
```
$ sudo npm install -g terminalizer
```

### 如何使用 Terminalizer

您只需要执行如下的命令，即可使用 Terminalizer 记录您的终端会话活动。您可以敲击 `CTRL+D` 来结束并且保存记录。
 
```
# terminalizer record 2g-session

defaultConfigPath
The recording session is started
Press CTRL+D to exit and save the recording
```

这将会将您记录的会话保存成一个 YAML 文件，在这个例子里，我的文件名将会是 2g-session-activity.yml。

![][15]
 
```
# logout
Successfully Recorded
The recording data is saved into the file:
/home/daygeek/2g-session.yml
You can edit the file and even change the configurations.
```
 
![][16]

### 如何播放记录下来的文件

使用以下命令来播放您记录的 YAML 文件。在以下操作中，请确保您已经用了您的文件名来替换 “2g-session”。

```
# terminalizer play 2g-session
```

将记录的文件渲染成 Gif 图像。
 
```
# terminalizer render 2g-session
```

注意： 以下的两个命令在此版本尚且不可用，或许在下一版本这两个命令将会付诸使用。
 
如果您想要将记录的文件分享给其他人，您可以将您的文件上传到在线播放器，并且将链接分享给对方。
 
```
terminalizer share 2g-session
```
 
为记录的文件生成一个网络播放器。
 
```
# terminalizer generate 2g-session
```

 --------------------------------------------------------------------------------

via: https://www.2daygeek.com/terminalizer-a-tool-to-record-your-terminal-and-generate-animated-gif-images/
 
作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[thecyanbird](https://github.com/thecyanbird)
校对：[wxy](https://github.com/wxy)
 
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
 
[a]: https://www.2daygeek.com/author/prakash/
[1]: https://www.2daygeek.com/script-command-record-save-your-terminal-session-activity-linux/
[2]: https://www.2daygeek.com/automatically-record-all-users-terminal-sessions-activity-linux-script-command/
[3]: https://www.2daygeek.com/teleconsole-share-terminal-session-instantly-to-anyone-in-seconds/
[4]: https://www.2daygeek.com/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds/
[5]: https://www.2daygeek.com/peek-create-animated-gif-screen-recorder-capture-arch-linux-mint-fedora-ubuntu/
[6]: https://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/
[7]: https://www.2daygeek.com/gifine-create-animated-gif-vedio-recorder-linux-mint-debian-ubuntu/
[8]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[10]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[11]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[12]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[13]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[14]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[15]: https://www.2daygeek.com/wp-content/uploads/2018/10/terminalizer-record-2g-session-1.gif
[16]: https://www.2daygeek.com/wp-content/uploads/2018/10/terminalizer-play-2g-session.gif
