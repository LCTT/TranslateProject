[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11604-1.html)
[#]: subject: (Developing a Simple Web Application Using Flutter)
[#]: via: (https://opensourceforu.com/2019/11/developing-a-simple-web-application-using/)
[#]: author: (Jis Joe Mathew https://opensourceforu.com/author/jis-joe/)

使用 Flutter 开发简单的 Web 应用
======

![][2]

> 本文指导读者如何使用 Flutter 运行和部署第一个 Web 应用。

Flutter 在 Android 和 iOS 开发方面走了很长一段路之后，已经迈入了一个新的阶段，即 Web 开发。Google 发布了 Flutter 1.5，同时支持 Web 应用开发。

### 为 Web 开发配置 Flutter

为了使用 Web 包，输入命令 `flutter upgrade` 更新到 Flutter 1.5.4。

  * 打开终端
  * 输入 `flutter upgrade`
  * 输入 `flutter –version` 检查版本


![图 1: 升级 Flutter 到最新版][3]

也可以将 Android Studio 3.0 或更高版本用于 Flutter Web 开发，但在本教程中，我们使用 Visual Studio Code。

### 使用 Flutter Web 创建新项目

打开 Visual Studio Code，然后按 `Shift+Ctrl+P` 开始一个新项目。输入 `flutter` 并选择 “New Web Project”。

![图 2：在 VSC 中开始一个新的 Flatter 项目][4]

现在，为项目命名。我将其命名为 `open_source_for_you`。

![图 3: 给项目命名][5]

在 VSC 中打开终端窗口，然后输入以下命令：

```
flutter packages pub global activate webdev
flutter packages upgrade
```

现在，使用以下命令在 localhost 上运行网站，IP 地址是 127.0.0.1。

```
flutter packages pub global run webdev serve
```

打开任何浏览器，然后输入 `http://127.0.0.1:8080/`。


![图 4：运行于 8080 端口的 Flutter 演示应用][6]

在项目目录中有个 Web 文件夹，其中包含了 `index.html`。`dart` 文件被编译成 JavaScript 文件，并使用以下代码包含在 HTML 文件中：

```
<script defer src="main.dart.js" type="application/javascript"></script>
```

### 编码和修改演示页面

让我们创建一个简单的应用，它会在网页上打印 “Welcome to OSFY”。

现在打开 Dart 文件，它位于 `lib` 文件夹 `main.dart`（默认名）中（参见图 5）。

![图 5：main.dart 文件的位置][7]

现在，我们可以在 `MaterialApp` 的属性中删除调试标记，如下所示：

```
debugShowCheckedModeBanner: false
```

现在，向 Dart 中添加更多内容与用 Dart 编写 Flutter 很类似。为此，我们可以声明一个名为 `MyClass` 的类，它继承了 `StatelessWidget`。

我们使用 `Center` 部件将元素定位到中心。我们还可以添加 `Padding` 部件来添加填充。使用以下代码获得图 5 所示的输出。使用刷新按钮查看更改。

```
class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Welcome to OSFY',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

![图 6：MyClass 的输出][8]

让我们从互联网中添加一张图片，我已经从一个杂志网站选择了一张 “Open Source for You” 徽标。我们使用 `Image.network`。

```
Image.network(
  'https://opensourceforu.com/wp-content/uploads/2014/03/OSFY-Logo.jpg',
  height: 100,
  width: 150
),
```

最终输出如图 7 所示。

![图 7：最终输出][9]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/developing-a-simple-web-application-using/

作者：[Jis Joe Mathew][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/jis-joe/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Screenshot-from-2019-11-15-16-20-30.png
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Screenshot-from-2019-11-15-16-20-30.png
[3]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-1-Upgrading-Flutter-to-the-latest-version.jpg
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-2-Starting-a-new-Flutter-Web-project-in-VSC.jpg
[5]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-3-Naming-the-project.jpg
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-4-The-Flutter-demo-application-running-on-port-8080.jpg
[7]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-5-Location-of-main.dart-file.jpg
[8]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-6-Output-of-MyClass.jpg
[9]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-7-Final-output.jpg
[10]: https://secure.gravatar.com/avatar/64db0e07799ae14fd1b51d0633db6593?s=100&r=g
[11]: https://opensourceforu.com/author/jis-joe/
[12]: mailto:jisjoemathew@gmail.com
[13]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[14]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
