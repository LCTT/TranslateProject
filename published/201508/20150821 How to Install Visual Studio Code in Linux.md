如何在 Linux 中安装 Visual Studio Code
================================================================================
大家好，今天我们一起来学习如何在 Linux 发行版中安装 Visual Studio Code。Visual Studio Code 是基于 Electron 优化代码后的编辑器，后者是基于 Chromium 的一款软件，用于为桌面系统发布 io.js 应用。Visual Studio Code 是微软开发的支持包括 Linux 在内的全平台代码编辑器和文本编辑器。它是免费软件但不开源，在专有软件许可条款下发布。它是可以用于我们日常使用的超级强大和快速的代码编辑器。Visual Studio Code 有很多很酷的功能，例如导航、智能感知支持、语法高亮、括号匹配、自动补全、代码片段、支持自定义键盘绑定、并且支持多种语言，例如 Python、C++、Jade、PHP、XML、Batch、F#、DockerFile、Coffee Script、Java、HandleBars、 R、 Objective-C、 PowerShell、 Luna、 Visual Basic、 .Net、 Asp.Net、 C#、 JSON、 Node.js、 Javascript、 HTML、 CSS、 Less、 Sass 和 Markdown。Visual Studio Code 集成了包管理器、库、构建，以及其它通用任务，以加速日常的工作流。Visual Studio Code 中最受欢迎的是它的调试功能，它包括流式支持 Node.js 的预览调试。

注意：请注意 Visual Studio Code 只支持 64 位的 Linux 发行版。

下面是在所有 Linux 发行版中安装 Visual Studio Code 的几个简单步骤。

### 1. 下载 Visual Studio Code 软件包 ###

首先，我们要从微软服务器中下载 64 位 Linux 操作系统的 Visual Studio Code 安装包，链接是 [http://go.microsoft.com/fwlink/?LinkID=534108][1]。这里我们使用 wget 下载并保存到 tmp/VSCODE 目录。

    # mkdir /tmp/vscode; cd /tmp/vscode/
    # wget https://az764295.vo.msecnd.net/public/0.3.0/VSCode-linux-x64.zip

    --2015-06-24 06:02:54-- https://az764295.vo.msecnd.net/public/0.3.0/VSCode-linux-x64.zip
    Resolving az764295.vo.msecnd.net (az764295.vo.msecnd.net)... 93.184.215.200, 2606:2800:11f:179a:1972:2405:35b:459
    Connecting to az764295.vo.msecnd.net (az764295.vo.msecnd.net)|93.184.215.200|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 64992671 (62M) [application/octet-stream]
    Saving to: ‘VSCode-linux-x64.zip’
    100%[================================================>] 64,992,671 14.9MB/s in 4.1s
    2015-06-24 06:02:58 (15.0 MB/s) - ‘VSCode-linux-x64.zip’ saved [64992671/64992671]

### 2. 提取软件包 ###

现在，下载好 Visual Studio Code 的 zip 压缩包之后，我们打算使用 unzip 命令解压它。我们要在终端或者控制台中运行以下命令。

    # unzip /tmp/vscode/VSCode-linux-x64.zip -d /opt/

注意：如果我们还没有安装 unzip，我们首先需要通过软件包管理器安装它。如果你运行的是 Ubuntu，使用 apt-get，如果运行的是 Fedora、CentOS、可以用  dnf 或 yum 安装它。

### 3. 运行 Visual Studio Code ###

展开软件包之后，我们可以直接运行一个名为 Code 的文件启动 Visual Studio Code。

    # sudo chmod +x /opt/VSCode-linux-x64/Code
    # sudo /opt/VSCode-linux-x64/Code

如果我们想通过终端在任何地方启动 Code，我们就需要创建 /opt/vscode/Code 的一个链接 /usr/local/bin/code。

    # ln -s /opt/VSCode-linux-x64/Code /usr/local/bin/code

现在，我们就可以在终端中运行以下命令启动 Visual Studio Code 了。

    # code .

### 4. 创建桌面启动 ###

下一步，成功展开 Visual Studio Code 软件包之后，我们打算创建桌面启动程序，使得根据不同桌面环境能够从启动器、菜单、桌面启动它。首先我们要复制一个图标文件到 /usr/share/icons/ 目录。

    # cp /opt/VSCode-linux-x64/resources/app/vso.png /usr/share/icons/

然后，我们创建一个桌面启动程序，文件扩展名为 .desktop。这里我们使用喜欢的文本编辑器在 /tmp/VSCODE/ 目录中创建名为 visualstudiocode.desktop 的文件。

    # vi /tmp/vscode/visualstudiocode.desktop

然后，粘贴下面的行到那个文件中。

    [Desktop Entry]
    Name=Visual Studio Code
    Comment=Multi-platform code editor for Linux
    Exec=/opt/VSCode-linux-x64/Code
    Icon=/usr/share/icons/vso.png
    Type=Application
    StartupNotify=true
    Categories=TextEditor;Development;Utility;
    MimeType=text/plain;

创建完桌面文件之后，我们会复制这个桌面文件到 /usr/share/applications/ 目录，这样启动器和菜单中就可以单击启动 Visual Studio Code 了。

    # cp /tmp/vscode/visualstudiocode.desktop /usr/share/applications/

完成之后，我们可以在启动器或者菜单中启动它。

![Visual Studio Code](http://blog.linoxide.com/wp-content/uploads/2015/06/visual-studio-code.png)

### 在 Ubuntu 中 Visual Studio Code ###

要在 Ubuntu 14.04/14.10/15.04 Linux 发行版中安装 Visual Studio Code，我们可以使用 Ubuntu Make 0.7。这是在 ubuntu 中安装 code 最简单的方法，因为我们只需要执行几个命令。首先，我们要在我们的 ubuntu linux 发行版中安装 Ubuntu Make 0.7。要安装它，首先要为它添加 PPA。可以通过运行下面命令完成。

    # add-apt-repository ppa:ubuntu-desktop/ubuntu-make

    This ppa proposes package backport of Ubuntu make for supported releases.
    More info: https://launchpad.net/~ubuntu-desktop/+archive/ubuntu/ubuntu-make
    Press [ENTER] to continue or ctrl-c to cancel adding it
    gpg: keyring `/tmp/tmpv0vf24us/secring.gpg' created
    gpg: keyring `/tmp/tmpv0vf24us/pubring.gpg' created
    gpg: requesting key A1231595 from hkp server keyserver.ubuntu.com
    gpg: /tmp/tmpv0vf24us/trustdb.gpg: trustdb created
    gpg: key A1231595: public key "Launchpad PPA for Ubuntu Desktop" imported
    gpg: no ultimately trusted keys found
    gpg: Total number processed: 1
    gpg: imported: 1 (RSA: 1)
    OK

然后，更新本地库索引并安装 ubuntu-make。

    # apt-get update
    # apt-get install ubuntu-make

在我们的 ubuntu 操作系统上安装完 Ubuntu Make 之后，我们可以在一个终端中运行以下命令来安装 Code。

    # umake web visual-studio-code

![Umake Web Code](http://blog.linoxide.com/wp-content/uploads/2015/06/umake-web-code.png)

运行完上面的命令之后，会要求我们输入想要的安装路径。然后，会请求我们允许在 ubuntu 系统中安装 Visual Studio Code。我们输入“a”（接受）。输入完后，它会在 ubuntu 机器上下载和安装 Code。最后，我们可以在启动器或者菜单中启动它。

### 总结 ###

我们已经成功地在 Linux 发行版上安装了 Visual Studio Code。在所有 linux 发行版上安装 Visual Studio Code 都和上面介绍的相似，我们也可以使用 umake 在 Ubuntu 发行版中安装。Umake 是一个安装开发工具，IDEs 和语言的流行工具。我们可以用 Umake 轻松地安装 Android Studios、Eclipse 和很多其它流行 IDE。Visual Studio Code 是基于 Github 上一个叫 [Electron][2] 的项目，它是 [Atom.io][3] 编辑器的一部分。它有很多 Atom.io 编辑器没有的改进功能。当前 Visual Studio Code 只支持 64 位 linux 操作系统平台。

如果你有任何疑问、建议或者反馈，请在下面的评论框中留言以便我们改进和更新我们的内容。非常感谢！Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-visual-studio-code-linux/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://go.microsoft.com/fwlink/?LinkID=534108
[2]:https://github.com/atom/electron
[3]:https://github.com/atom/atom