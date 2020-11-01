[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12693-1.html)
[#]: subject: (Create a mobile app with Flutter)
[#]: via: (https://opensource.com/article/20/9/mobile-app-flutter)
[#]: author: (Vitaly Kuprenko https://opensource.com/users/kooper)

使用 Flutter 创建 App
======

> 使用流行的 Flutter 框架开始你的跨平台开发之旅。

![](https://img.linux.net.cn/data/attachment/album/202010/07/112953m9g419z1gc2i07z1.jpg)

[Flutter][2] 是一个深受全球移动开发者欢迎的项目。该框架有一个庞大的、友好的爱好者社区，随着 Flutter 帮助程序员将他们的项目带入移动领域，这个社区还在继续增长。

本教程旨在帮助你开始使用 Flutter 进行移动开发。阅读之后，你将了解如何快速安装和设置框架，以便开始为智能手机、平板电脑和其他平台开发。

本操作指南假定你已在计算机上安装了 [Android Studio][3]，并且具有一定的使用经验。

### 什么是 Flutter ？

Flutter 使得开发人员能够为多个平台构建应用程序，包括：

  * Android
  * iOS
  * Web（测试版）
  * macOS（正在开发中）
  * Linux（正在开发中）

对 macOS 和 Linux 的支持还处于早期开发阶段，而 Web 支持预计很快就会发布。这意味着你可以立即试用其功能（如下所述）。

### 安装 Flutter

我使用的是 Ubuntu 18.04，但其他 Linux 发行版安装过程与之类似，比如 Arch 或 Mint。

#### 使用 snapd 安装

要使用 [Snapd][4] 在 Ubuntu 或类似发行版上安装 Flutter，请在终端中输入以下内容：

```
$ sudo snap install flutter --classic

$ sudo snap install flutter –classic
flutter 0+git.142868f from flutter Team/ installed
```

然后使用 `flutter` 命令启动它。 首次启动时，该框架会下载到你的计算机上：

```
$ flutter
Initializing Flutter
Downloading https://storage.googleapis.com/flutter_infra[...]
```

下载完成后，你会看到一条消息，告诉你 Flutter 已初始化：

![Flutter initialized][5]

#### 手动安装

如果你没有安装 Snapd，或者你的发行版不是 Ubuntu，那么安装过程会略有不同。在这种情况下，请[下载][7] 为你的操作系统推荐的 Flutter 版本。

![Install Flutter manually][8]

然后将其解压缩到你的主目录。

在你喜欢的文本编辑器中打开主目录中的 `.bashrc` 文件（如果你使用 [Z shell][9]，则打开 `.zshc`）。因为它是隐藏文件，所以你必须首先在文件管理器中启用显示隐藏文件，或者使用以下命令从终端打开它：

```
$ gedit ~/.bashrc &
```

将以下行添加到文件末尾：

```
export PATH="$PATH:~/flutter/bin"
```

保存并关闭文件。 请记住，如果在你的主目录之外的其他位置解压 Flutter，则 [Flutter SDK 的路径][10] 将有所不同。

关闭你的终端，然后再次打开，以便加载新配置。 或者，你可以通过以下命令使配置立即生效：

```
$ . ~/.bashrc
```

如果你没有看到错误，那说明一切都是正常的。

这种安装方法比使用 `snap` 命令稍微困难一些，但是它非常通用，可以让你在几乎所有的发行版上安装该框架。

#### 检查安装结果

要检查安装结果，请在终端中输入以下内容：

```
flutter doctor -v
```

你将看到有关已安装组件的信息。 如果看到错误，请不要担心。 你尚未安装任何用于 Flutter SDK 的 IDE 插件。

![Checking Flutter installation with the doctor command][11]

### 安装 IDE 插件

你应该在你的 [集成开发环境（IDE）][12] 中安装插件，以帮助它与 Flutter SDK 接口、与设备交互并构建代码。

Flutter 开发中常用的三个主要 IDE 工具是 IntelliJ IDEA（社区版）、Android Studio 和 VS Code（或 [VSCodium][13]）。我在本教程中使用的是 Android Studio，但步骤与它们在 IntelliJ Idea（社区版）上的工作方式相似，因为它们构建在相同的平台上。

首先，启动 Android Studio。打开 “Settings”，进入 “Plugins” 窗格，选择 “Marketplace” 选项卡。在搜索行中输入 “Flutter”，然后单击 “Install”。

![Flutter plugins][14]

你可能会看到一个安装 “Dart” 插件的选项；同意它。如果看不到 Dart 选项，请通过重复上述步骤手动安装它。我还建议使用 “Rainbow Brackets” 插件，它可以让代码导航更简单。

就这样！你已经安装了所需的所有插件。你可以在终端中输入一个熟悉的命令进行检查：

```
flutter doctor -v
```

![Checking Flutter plugins with the doctor command][15]

### 构建你的 “Hello World” 应用程序

要启动新项目，请创建一个  Flutter 项目：

1、选择 “New -> New Flutter project”。

![Creating a new Flutter plugin][16]

2、在窗口中，选择所需的项目类型。 在这种情况下，你需要选择 “Flutter Application”。

3、命名你的项目为 `hello_world`。 请注意，你应该使用合并的名称，因此请使用下划线而不是空格。 你可能还需要指定 SDK 的路径。

![Naming a new Flutter plugin][17]

4、输入软件包名称。

你已经创建了一个项目！现在，你可以在设备上或使用模拟器启动它。

![Device options in Flutter][18]

选择你想要的设备，然后按 “Run”。稍后，你将看到结果。

![Flutter demo on mobile device][19]

现在你可以在一个 [中间项目][20] 上开始工作了。

### 尝试 Flutter for web

在安装 Flutter 的 Web 组件之前，你应该知道 Flutter 目前对 Web 应用程序的支持还很原始。 因此，将其用于复杂的项目并不是一个好主意。

默认情况下，基本 SDK 中不启用 “Flutter for web”。 要打开它，请转到 beta 通道。 为此，请在终端中输入以下命令：

```
flutter channel beta
```

![flutter channel beta output][21]

接下来，使用以下命令根据 beta 分支升级 Flutter：

```
flutter upgrade
```

![flutter upgrade output][22]

要使 “Flutter for web” 工作，请输入：

```
flutter config --enable-web
```

重新启动 IDE；这有助于 Android Studio 索引新的 IDE 并重新加载设备列表。你应该会看到几个新设备：

![Flutter for web device options][23]

选择 “Chrome” 会在浏览器中启动一个应用程序， “Web Server” 会提供指向你的 Web 应用程序的链接，你可以在任何浏览器中打开它。

不过，现在还不是急于开发的时候，因为你当前的项目不支持 Web。要改进它，请打开项目根目录下的终端，然后输入：

```
flutter create
```

此命令重新创建项目，并添加 Web 支持。 现有代码不会被删除。

请注意，目录树已更改，现在有了一个 `web` 目录：

![File tree with web directory][24]

现在你可以开始工作了。 选择 “Chrome”，然后按 “Run”。 稍后，你会看到带有应用程序的浏览器窗口。

![Flutter web app demo][25]

恭喜你！ 你刚刚为浏览器启动了一个项目，并且可以像其他任何网站一样继续使用它。

所有这些都来自同一代码库，因为 Flutter 使得几乎无需更改就可以为移动平台和 Web 编写代码。

### 用 Flutter 做更多的事情

Flutter 是用于移动开发的强大工具，而且它也是迈向跨平台开发的重要一步。 了解它，使用它，并将你的应用程序交付到所有平台！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/mobile-app-flutter

作者：[Vitaly Kuprenko][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kooper
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://flutter.dev/
[3]: https://developer.android.com/studio
[4]: https://snapcraft.io/docs/getting-started
[5]: https://opensource.com/sites/default/files/uploads/flutter1_initialized.png (Flutter initialized)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://flutter.dev/docs/get-started/install/linux
[8]: https://opensource.com/sites/default/files/uploads/flutter2_manual-install.png (Install Flutter manually)
[9]: https://opensource.com/article/19/9/getting-started-zsh
[10]: https://opensource.com/article/17/6/set-path-linux
[11]: https://opensource.com/sites/default/files/uploads/flutter3_doctor.png (Checking Flutter installation with the doctor command)
[12]: https://www.redhat.com/en/topics/middleware/what-is-ide
[13]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[14]: https://opensource.com/sites/default/files/uploads/flutter4_plugins.png (Flutter plugins)
[15]: https://opensource.com/sites/default/files/uploads/flutter5_plugincheck.png (Checking Flutter plugins with the doctor command)
[16]: https://opensource.com/sites/default/files/uploads/flutter6_newproject.png (Creating a new Flutter plugin)
[17]: https://opensource.com/sites/default/files/uploads/flutter7_projectname.png (Naming a new Flutter plugin)
[18]: https://opensource.com/sites/default/files/uploads/flutter8_launchflutter.png (Device options in Flutter)
[19]: https://opensource.com/sites/default/files/uploads/flutter9_demo.png (Flutter demo on mobile device)
[20]: https://opensource.com/article/18/6/flutter
[21]: https://opensource.com/sites/default/files/uploads/flutter10_beta.png (flutter channel beta output)
[22]: https://opensource.com/sites/default/files/uploads/flutter11_upgrade.png (flutter upgrade output)
[23]: https://opensource.com/sites/default/files/uploads/flutter12_new-devices.png (Flutter for web device options)
[24]: https://opensource.com/sites/default/files/uploads/flutter13_tree.png (File tree with web directory)
[25]: https://opensource.com/sites/default/files/uploads/flutter14_webapp.png (Flutter web app demo)
