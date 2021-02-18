[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13129-1.html)
[#]: subject: (A new way to build cross-platform UIs for Linux ARM devices)
[#]: via: (https://opensource.com/article/20/5/linux-arm-ui)
[#]: author: (Bruno Muniz https://opensource.com/users/brunoamuniz)

一种为 Linux ARM 设备构建跨平台 UI 的新方法
======

> AndroidXML 和 TotalCross 的运用为树莓派和其他设备创建 UI 提供了更简单的方法。

![](https://img.linux.net.cn/data/attachment/album/202102/18/123715oomfuuz94ioi41ii.jpg)

为应用程序创建良好的用户体验（UX）是一项艰巨的任务，尤其是在开发嵌入式应用程序时。今天，有两种图形用户界面（GUI）工具通常用于开发嵌入式软件：它们要么涉及复杂的技术，要么非常昂贵。

然而，我们已经创建了一个概念验证（PoC），它提供了一种新的方法来使用现有的、成熟的工具为运行在桌面、移动、嵌入式设备和低功耗 ARM 设备上的应用程序构建用户界面（UI）。我们的方法是使用 Android Studio 绘制 UI；使用 [TotalCross][2] 在设备上呈现 Android XML；采用被称为 [KnowCode][4] 的新 [TotalCross API][3]；以及使用 [树莓派 4][5] 来执行应用程序。

### 选择 Android Studio

可以使用 TotalCross API 为应用程序构建一个美观的响应式用户体验，但是在 Android Studio 中创建 UI 缩短了制作原型和实际应用程序之间的时间。

有很多工具可以用来为应用程序构建 UI，但是 [Android Studio][6] 是全世界开发者最常使用的工具。除了它被大量采用以外，这个工具的使用也非常直观，而且它对于创建简单和复杂的应用程序都非常强大。在我看来，唯一的缺点是使用该工具所需的计算机性能，它比其他集成开发环境 （IDE） 如 VSCode 或其开源替代方案 [VSCodium][7] 要庞大得多。

通过思考这些问题，我们创建了一个概念验证，使用 Android Studio 绘制 UI，并使用 TotalCross 直接在设备上运行 AndroidXML。

### 构建 UI

对于我们的 PoC，我们想创建一个家用电器应用程序来控制温度和其他东西，并在 Linux ARM 设备上运行。

![Home appliance application to control thermostat][8]

我们想为树莓派开发我们的应用程序，所以我们使用 Android 的 [ConstraintLayout][10] 来构建 848x480（树莓派的分辨率）的固定屏幕大小的 UI，不过你可以用其他布局构建响应性 UI。

Android XML 为 UI 创建增加了很多灵活性，使得为应用程序构建丰富的用户体验变得容易。在下面的 XML 中，我们使用了两个主要组件：[ImageView][11] 和 [TextView][12]。

```
<ImageView
android:id="@+id/imageView6"
android:layout_width="273dp"
android:layout_height="291dp"
android:background="@drawable/Casa"
tools:layout_editor_absoluteX="109dp"
tools:layout_editor_absoluteY="95dp" />
<TextView
android:id="@+id/insideTempEdit"
android:layout_width="94dp"
android:layout_height="92dp"
android:background="#F5F5F5"
android:text="20"
android:textAlignment="center"
android:gravity="center"
android:textColor="#000000"
android:textSize="67dp"
android:textStyle="bold"
tools:layout_editor_absoluteX="196dp"
tools:layout_editor_absoluteY="246dp" />
```

TextView 元素用于向用户显示一些数据，比如建筑物内的温度。大多数 ImageView 都用作用户与 UI 交互的按钮，但它们也需要实现屏幕上组件提供的事件。

### 用 TotalCross 整合

这个 PoC 中的第二项技术是 TotalCross。我们不想在设备上使用 Android 的任何东西，因为：

  1。我们的目标是为 Linux ARM 提供一个出色的 UI。
  2。我们希望在设备上实现低占用。
  3。我们希望应用程序在低计算能力的低端硬件设备上运行（例如，没有 GPU、 低 RAM 等）。

首先，我们使用 [VSCode 插件][13] 创建了一个空的 TotalCross 项目。接下来，我们保存了 `drawable` 文件夹中的图像副本和 `xml` 文件夹中的 Android XML 文件副本，这两个文件夹都位于 `resources` 文件夹中：

![Home Appliance file structure][14]

为了使用 TotalCross 模拟器运行 XML 文件，我们添加了一个名为 KnowCode 的新 TotalCross API 和一个主窗口来加载 XML。下面的代码使用 API 加载和呈现 XML：

```
public void initUI() {
    XmlScreenAbstractLayout xmlCont = XmlScreenFactory.create("xml / homeApplianceXML.xml");
    swap(xmlCont);
}
```

就这样！只需两个命令，我们就可以使用 TotalCross 运行 Android XML 文件。以下是 XML 如何在 TotalCross 的模拟器上执行：

![TotalCross simulator running temperature application][15]

完成这个 PoC 还有两件事要做：添加一些事件来提供用户交互，并在树莓派上运行它。

### 添加事件

KnowCode API 提供了一种通过 ID（`getControlByID`） 获取 XML 元素并更改其行为的方法，如添加事件、更改可见性等。

例如，为了使用户能够改变家中或其他建筑物的温度，我们在 UI 底部放置了加号和减号按钮，并在每次单击按钮时都会出现“单击”事件，使温度升高或降低一度：

```
Button plus = (Button) xmlCont.getControlByID("@+id/plus");
Label insideTempLabel = (Label) xmlCont.getControlByID("@+id/insideTempLabel");
plus.addPressListener(new PressListener() {
    @Override
    public void controlPressed(ControlEvent e) {
        try {
            String tempString = insideTempLabel.getText();
            int temp;
            temp = Convert.toInt(tempString);
            insideTempLabel.setText(Convert.toString(++temp));
        } catch (InvalidNumberException e1) {
            e1.printStackTrace();
        }
    }
});
```

### 在树莓派 4 上测试

最后一步！我们在一台设备上运行了应用程序并检查了结果。我们只需要打包应用程序并在目标设备上部署和运行它。[VNC][19] 也可用于检查设备上的应用程序。

整个应用程序，包括资源（图像等）、Android XML、TotalCross 和 Knowcode API，在 Linux ARM 上大约是 8MB。

下面是应用程序的演示：

![Application demo][20]

在本例中，该应用程序仅为 Linux ARM 打包，但同一应用程序可以作为 Linux 桌面应用程序运行，在Android 设备 、Windows、windows CE 甚至 iOS 上运行。

所有示例源代码和项目都可以在 [HomeApplianceXML GitHub][21] 存储库中找到。

### 现有工具的新玩法

为嵌入式应用程序创建 GUI 并不需要像现在这样困难。这种概念证明为如何轻松地完成这项任务提供了新的视角，不仅适用于嵌入式系统，而且适用于所有主要的操作系统，所有这些系统都使用相同的代码库。

我们的目标不是为设计人员或开发人员创建一个新的工具来构建 UI 应用程序；我们的目标是为使用现有的最佳工具提供新的玩法。

你对这种新的应用程序开发方式有何看法？在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/linux-arm-ui

作者：[Bruno Muniz][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brunoamuniz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://totalcross.com/
[3]: https://yourapp.totalcross.com/knowcode-app
[4]: https://github.com/TotalCross/KnowCodeXML
[5]: https://www.raspberrypi.org/
[6]: https://developer.android.com/studio
[7]: https://vscodium.com/
[8]: https://opensource.com/sites/default/files/uploads/homeapplianceapp.png (Home appliance application to control thermostat)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://codelabs.developers.google.com/codelabs/constraint-layout/index.html#0
[11]: https://developer.android.com/reference/android/widget/ImageView
[12]: https://developer.android.com/reference/android/widget/TextView
[13]: https://medium.com/totalcross-community/totalcross-plugin-for-vscode-4f45da146a0a
[14]: https://opensource.com/sites/default/files/uploads/homeappliancexml.png (Home Appliance file structure)
[15]: https://opensource.com/sites/default/files/uploads/totalcross-simulator_0.png (TotalCross simulator running temperature application)
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+button
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+label
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[19]: https://tigervnc.org/
[20]: https://opensource.com/sites/default/files/uploads/application.gif (Application demo)
[21]: https://github.com/TotalCross/HomeApplianceXML
