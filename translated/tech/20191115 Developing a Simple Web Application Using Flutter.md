[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Developing a Simple Web Application Using Flutter)
[#]: via: (https://opensourceforu.com/2019/11/developing-a-simple-web-application-using/)
[#]: author: (Jis Joe Mathew https://opensourceforu.com/author/jis-joe/)

使用 Flutter 开发简单的 Web 应用
======

[![][1]][2]

_本文指导读者如何使用 Flutter 运行和部署第一个 Web 应用。_

Flutter 在 Android 和 iOS 开发方面走了很长一段路之后，已经迈入了一个新的阶段，即 Web。Google 发布了 Flutter 1.5，同时支持 Web 应用开发。

**为 Web 配置 Flutter**
为了使用 Web 包，输入命令 _flutter upgrade_ 更新到 Flutter 1.5.4。

  * 打开终端
  * 输入 flutter upgrade
  * 输入 _flutter –version_ 检查版本



![Figure 1: Upgrading Flutter to the latest version][3]

![Figure 2: Starting a new Flutter Web project in VSC][4]

也可以将 Android Studio 3.0 或更高版本用于 Flutter Web 开发，但在本教程中，我们使用 Visual Studio Code。

**使用 Flutter Web 创建新项目**
打开 Visual Studio Code，然后按 _Shift+Ctrl+P_ 开始一个新项目。输入 flutter 并选择 _New Web Project_。
现在，为项目命名。我将其命名为 _open_source_for_you_。
在 VSC 中打开终端窗口，然后输入以下命令：

```
flutter packages pub global activate webdev

flutter packages upgrade
```

现在，使用以下命令在 localhost 上运行网站，IP 地址是 127.0.0.1。

```
flutter packages pub global run webdev serve
```

打开任何浏览器，然后输入 _<http://127.0.0.1:8080/>_。
在项目目录中有个 Web 文件夹，其中包含了 _index.html_。 _dart_ 文件被编译成 JavaScript 文件，并使用以下代码包含在 HTML 文件中：

```
<script defer src="main.dart.js" type="application/javascript"></script>
```

**编码和修改演示页面**
让我们创建一个简单的应用，它会在网页上打印 “ Welcome to OSFY”。
现在打开 Dart 文件，它位于 _lib_ 文件夹 _main.dart_（默认名）中（参见图 5）。
现在，我们可以在 _MaterialApp_ 的属性中删除调试标记，如下所示：

```
debugShowCheckedModeBanner: false
```

![Figure 3: Naming the project][5]

![Figure 4: The Flutter demo application running on port 8080][6]

![Figure 5: Location of main.dart file][7]

现在，向 Dart 中添加更多内容与在 Dart 中编写 Flutter 类似。为此，我们可以声明一个名为 _MyClass_ 的类，它继承了 _StatelessWidget_。
我们使用 _Center_ 部件将元素定位到中心。我们还可以添加 _Padding_ 部件来添加填充。使用以下代码获得图 5 所示的输出。使用刷新按钮查看更改。

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

![Figure 6: Output of MyClass][8]

![Figure 7: Final output][9]

让我们从互联网中添加一张图片，我已经从一个杂志网站选择了一张 “Open Source for You” 的 logo。我们使用 _Image.network_。

```
Image.network(
'https://opensourceforu.com/wp-content/uploads/2014/03/OSFY-Logo.jpg',
height: 100,
width: 150
),
```

最终输出如图 7 所示。

![Avatar][10]

[Jis Joe Mathew][11]

作者是喀拉拉邦卡尼拉帕利阿玛尔·乔蒂学院的计算机科学与工程助理教授。可以通过 [jisjoemathew@gmail.com][12] 与他联系。

[![][13]][14]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/developing-a-simple-web-application-using/

作者：[Jis Joe Mathew][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/jis-joe/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Screenshot-from-2019-11-15-16-20-30.png?resize=696%2C495&ssl=1 (Screenshot from 2019-11-15 16-20-30)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Screenshot-from-2019-11-15-16-20-30.png?fit=900%2C640&ssl=1
[3]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-1-Upgrading-Flutter-to-the-latest-version.jpg?resize=350%2C230&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-2-Starting-a-new-Flutter-Web-project-in-VSC.jpg?resize=350%2C93&ssl=1
[5]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-3-Naming-the-project.jpg?resize=350%2C147&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-4-The-Flutter-demo-application-running-on-port-8080.jpg?resize=350%2C111&ssl=1
[7]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-5-Location-of-main.dart-file.jpg?resize=350%2C173&ssl=1
[8]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-6-Output-of-MyClass.jpg?resize=350%2C173&ssl=1
[9]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-7-Final-output.jpg?resize=350%2C167&ssl=1
[10]: https://secure.gravatar.com/avatar/64db0e07799ae14fd1b51d0633db6593?s=100&r=g
[11]: https://opensourceforu.com/author/jis-joe/
[12]: mailto:jisjoemathew@gmail.com
[13]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[14]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
