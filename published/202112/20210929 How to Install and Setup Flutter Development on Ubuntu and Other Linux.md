[#]: subject: "How to Install and Setup Flutter Development on Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/install-flutter-linux/"
[#]: author: "Marco Antonio Carmona Galván https://itsfoss.com/author/itsfoss/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14054-1.html"

如何在 Linux 上安装和设置 Flutter 开发环境
======

![](https://img.linux.net.cn/data/attachment/album/202112/06/115835fdjlxmd55mxew1nn.jpg)

谷歌的 UI 工具包 Flutter 在创建移动、网页和桌面的跨平台应用程序方面越来越受欢迎。

[Flutter][1] 不是一种编程语言，而是一个软件开发工具包。[Dart][2] 是 Flutter SDK 下面使用的编程语言。

Flutter 是谷歌开源的 Fuchsia OS、谷歌 STADIA 以及许多其他软件和移动应用背后的主要框架。

如果你想使用 Flutter 进行开发，本教程将帮助你在 Ubuntu 和其他类似 Linux 发行版上搭建好你的环境。

### 在 Ubuntu 和其他 Linux 上用 Snap 安装 Flutter

在 Linux 上安装 Flutter 最简单的方法是使用 Snap。如果你使用的是 Ubuntu，你已经有了 Snap。**对于其他发行版，请确保 [启用 Snap 支持][3]**。

[打开终端][4] 并在终端中使用以下命令来安装 Flutter：

```
sudo snap install flutter --classic
```

你会在你的终端上看到类似这样的东西：

![][5]

一旦安装完成，就是验证它的时候了。不仅仅是 Flutter 的安装，还要验证 Flutter 正常运行所需满足的每一个依赖关系。

#### 验证 Flutter 的依赖项

为了验证 Flutter 正确工作所需的每一个依赖项，Flutter 有一个内置选项：

```
Flutter doctor
```

这个过程开始看起来像这样：

![][6]

而它完成时像这样：

![][7]

正如你所看到的，我们需要 Android Studio 来工作。所以让我们来安装它。我们该怎么做呢？用 Snap [在 Linux 上安装 Android Studio][8] 也是毫不费力的。

#### 安装并设置好 Android Studio

在终端中，使用下面的命令来安装 Android Studio：

```
sudo snap install android-studio --classic
```

![][9]

安装完毕后，从我们的操作系统菜单中打开 Android Studio。

![][10]

就快完成了。现在是配置 Android Studio 的时候了。

![][11]

点击下一步，如果你不想让事情复杂化，就选择“<ruby>标准<rt>standard</rt></ruby>”。

![][12]

选择你喜欢的主题（我喜欢“<ruby>暗色<rt>Darcula</rt></ruby>”的）。

![][13]

确认一切正常，然后点击“<ruby>下一步<rt>Next</rt></ruby>”。

![][14]

最后，点击“<ruby>完成<rt>Finish</rt></ruby>”按钮。

![][15]

然后等待，直到下载完成。

![][16]

### 创建一个 Hello World Flutter 应用样本

在 Android Studio 中，进入项目，选择“<ruby>新建 Flutter 项目<rt>New Flutter Project</rt></ruby>”。Flutter SDK 路径会默认设置。

![][17]

在这里，神奇的事情开始出现了，这是你设置你的项目名称的地方，在这个例子中，它将被称为 “hello_world”。

让我们选择三个可用的平台。**Android、iOS 和 Web**。最后，点击“<ruby>完成<rt>Finish</rt></ruby>”。

![][18]

项目中的主文件位于 `lib/main.dart`，如下图所示：

![][19]

选定后，擦除文件中包含的所有内容，并将其改为本示例代码：

```
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

重要的是，这只是向你展示 Flutter 是如何工作的，如果你确信要学习这种美丽而不可思议的语言，这里有 [文档][20] 可以看到更多关于它的信息。**尝试**它！

最后，选择 “Chome Web” 设备，并点击“<ruby>运行<rt>Run</rt></ruby>”按钮，如下图所示；并看到神奇的效果！

![][21]

你可以如此快速地创建一个 Flutter 项目，真是不可思议。跟你的 Hello World 项目打个招呼吧。

![][22]

### 最后...

如果你想在短时间内做出漂亮的移动和网页界面的贡献，Flutter 和 Dart 是完美的。

现在你知道了如何在 Ubuntu Linux 上安装 Flutter，以及如何用它创建你的第一个应用程序。我很高兴可以为你写这篇文章，希望对你有所帮助，如果你有任何问题，请通过留言或给我发邮件来告诉我，祝你好运!

本教程由 Marco Antonio Carmona Galván 提供，他是物理学和数据科学专业的学生。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-flutter-linux/

作者：[Marco Antonio Carmona Galván][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://flutter.dev/
[2]: https://dart.dev/
[3]: https://itsfoss.com/install-snap-linux/
[4]: https://itsfoss.com/open-terminal-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-flutter-ubuntu.png?resize=786%2C195&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/verify-flutter-install.png?resize=786%2C533&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/Flutter-verification-completes.png?resize=786%2C533&ssl=1
[8]: https://itsfoss.com/install-android-studio-ubuntu-linux/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-android-studio-linux-snap.png?resize=786%2C187&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/Open_Android_Studio.webp?resize=800%2C450&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-1.png?resize=800%2C603&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-2.png?resize=800%2C603&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-3.png?resize=800%2C603&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-4.png?resize=800%2C603&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-5.png?resize=800%2C603&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/Setting-Up-Android-Studio-6.png?resize=800%2C603&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/New_flutter_project.png?resize=800%2C639&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project.png?resize=800%2C751&ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project-1.png?resize=800%2C435&ssl=1
[20]: https://flutter.dev/docs
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project-2.png?resize=800%2C450&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sample-flutter-project-3.png?resize=800%2C549&ssl=1
[23]: https://itsfoss.com/cdn-cgi/l/email-protection
