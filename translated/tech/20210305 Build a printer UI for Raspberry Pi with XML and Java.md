[#]: subject: (Build a printer UI for Raspberry Pi with XML and Java)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-totalcross)
[#]: author: (Edson Holanda Teixeira Junior https://opensource.com/users/edsonhtj)
[#]: collector: (lujun9972)
[#]: translator: (CoWave-Fall)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

用 XML 和 Java 构建树莓派打印机的用户界面（UI）
======
使用 TotalCross 来快速构建嵌入式系统程序的用户界面。

![Tips and gears turning][1]

从头开始构建 GUI 是一个非常耗时的过程，处理代码中的位置和对齐对于一些程序员来说确实很困难。所以在本文中，我将演示如何使用 XML 加快这一过程。


本项目使用 [TotalCross][2] 作为目标框架。 TotalCross 是一个开源的跨平台软件开发工具包 (SDK)，旨在更快地为嵌入式设备创建 GUI。 TotalCross 无需在设备上运行 Java 即可提供 Java 的开发优势，因为它使用自己的字节码和虚拟机（ <ruby>TC 字节码<rt>TC bytecode</rt></ruby> 和 TCVM）来增强性能。

我还使用了 Knowcode-XML，这是一个用于 TotalCross 框架的开源 XML 解析器，它可以将 XML 文件转换为 TotalCross 组件。


### 项目需求

要重现此项目，您需要：

   * [KnowCode-XML][3]
   * [VSCode][4] [或 VSCodium][5]
   * [一个 Android 开发环境][6]
   * [用于 VSCode 的 TotalCross 插件][7]
   * 适用于您的开发平台（[Linux][8]、[Mac][9] 或 [Windows][10]）的 Java，需要 Java 11（或更高版本）
   * [Git][11]



### 制作嵌入式应用程序

该应用程序包含一个具有基本打印功能的嵌入式 GUI，例如扫描、打印和复印。

![打印机初始化画面][12]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

构建这个 GUI 需要几个步骤，包括使用 Android-XML 生成 GUI，然后使用 Knowcode-XML 解析器在 TotalCross 框架上运行它。

#### 1\. 生成 Android XML

要创建 XML 文件，首先构建一个简单的 Android 屏幕，然后对其进行自定义。 如果你不知道如何编写 Android-XM，或者你只是想简单尝试一下，你可以从这个 [GitHub 项目][14] 中下载这个应用程序的 XML。 该项目还包含渲染 GUI 要用到的图片。

#### 2\. 调整 XML

生成 XML 文件后，您需要进行一些微调以确保所有内容都已经对齐、比例正确并且图像的路径正确。

将 XML 布局添加到 **Layouts** 文件夹，将所有资源添加到 **Drawable** 文件夹。然后您就可以开始自定义 XML 了。

例如，如果想要更改 XML 对象的背景，可以更改 `android:background` 属性：


```
`android:background="@drawable/scan"`
```

您也可以使用 `tools:layout_editor_absoluteX` 和 `tools:layout_editor_absoluteY` 更改对象的位置：


```
tools:layout_editor_absoluteX="830dp"
tools:layout_editor_absoluteY="511dp"
```

或者使用 `android:layout_width` 和 `android:layout_height` 更改对象的大小：


```
android:layout_width="70dp"
android:layout_height="70dp"
```

如果要在对象上放置文本，可以使用 `android:textSize`、`android:text`、`android:textStyle` 和 `android:textColor`：


```
android:textStyle="bold"
android:textColor="#000000"
android:textSize="20dp"
android:text="2:45PM"
```

下面是一个完整的 XML 对象的示例：


```
    <ImageButton
           android:id="@+id/ImageButton"
           android:layout_width="70dp"
           android:layout_height="70dp"
           tools:layout_editor_absoluteX="830dp"
           tools:layout_editor_absoluteY="511dp"
           android:background="@drawable/home_config" 
/>;
```

#### 3\. 在 TotalCross 上运行 GUI

完成所有 XML 调整后，就可以在 TotalCross 上运行它了。 在 TotalCross 扩展（译注：在 VSCode 里面）上创建一个新项目，并将 **XML** 和 **Drawable** 文件夹添加到 **Main** 文件夹里。 如果您仍然不确定如何创建 TotalCross 项目，请参阅我们的 [入门指南][15]。

配置好环境后，使用 `totalcross.knowcode.parse.XmlContainerFactory` 和 `import totalcross.knowcode.parse.XmlContainerLayout` 在 TotalCross 框架上使用 XML GUI。 您可以在其 [GitHub 页面][3] 上找到更多关于使用 KnowCode-XML 的信息。

#### 4\. 添加过渡效果

这个项目的平滑过渡效果是由 `SlidingNavigator` 类创建的，它使用TotalCross的 `ControlAnimation` 类从一个屏幕滑到另一个屏幕。

在 `XMLpresenter` 类上调用 `SlidingNavigator`：


```
`new SlidingNavigator(this).present(HomePresenter.class);`
```

在 `SlidingNavigator` 类上实现 `present` 函数：


```
public void present(Class&lt;? extends XMLPresenter&gt; presenterClass)
         throws [InstantiationException][16], [IllegalAccessException][17] {
      final XMLPresenter presenter = cache.containsKey(presenterClass) ? cache.get(presenterClass)
            : presenterClass.newInstance();
      if (!cache.containsKey(presenterClass)) {
         cache.put(presenterClass, presenter);
      }

      if (presenters.isEmpty()) {
         window.add(presenter.content, LEFT, TOP, FILL, FILL);
      } else {
         XMLPresenter previous = presenters.lastElement();

         window.add(presenter.content, AFTER, TOP, SCREENSIZE, SCREENSIZE, previous.content);
```

使用动画控件中的 `PathAnimation` 来创建从一个屏幕到另一个屏幕的滑动动画：


```
         PathAnimation.create(previous.content, -Settings.screenWidth, 0, new ControlAnimation.AnimationFinished() {
            @Override
            public void onAnimationFinished(ControlAnimation anim) {
               window.remove(previous.content);
            }
         }, 1000).with(PathAnimation.create(presenter.content, 0, 0, new ControlAnimation.AnimationFinished() {
            @Override
            public void onAnimation Finished(Control Animation anim) {
               presenter.content.setRect(LEFT, TOP, FILL, FILL);
            }
         }, 1000)).start();
      }
      presenter.setNavigator(this);
      presenters.push(presenter);
      presenter.bind2();
      if (presenter.isFirstPresent) {
         presenter.onPresent();
         presenter.isFirstPresent = false;
      }
```

#### 5\. 加载 <ruby> 环形进度条 <rt>spinner</rt> </ruby>

打印机应用程序的另一个不错的功能是显示进度的加载屏幕动画。它包括文本和旋转动画。

![加载环形进度条][18]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

通过添加定时器和定时器监听器来更新进度标签，然后调用函数 `spinner.start()` 来实现此功能。所有的动画都是由 TotalCross 和 KnowCode 自动生成的：


```
public void startSpinner() {
        time = content.addTimer(500);
        content.addTimerListener((e) -> {
            try {
                progress(); // Updates the Label
            } catch (InstantiationException | IllegalAccessException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        });
        Spinner spinner = (Spinner) ((XmlContainerLayout) content).getControlByID("@+id/spinner");
        spinner.start();
    }
```

这里的环形进度条被实例化为对 XML 文件中描述的 `XmlContainerLayout` <ruby> 环形进度条 <rt>spinner</rt> </ruby>的引用：


```
<ProgressBar
android:id="@+id/spinner"
android:layout_width="362dp"
android:layout_height="358dp"
tools:layout_editor_absoluteX="296dp"
tools:layout_editor_absoluteY="198dp"
   android:indeterminateTint="#2B05C7"
style="?android:attr/progressBarStyle" />
```

#### 6\. 构建应用程序

是时候构建应用程序了。 您可以在 `pom.xml` 中查看和更改<ruby>目标系统<rt>target systems</rt></ruby>。 请确保 **Linux Arm** 目标可用。

如果您使用的是 VSCode，请按下键盘上的 **F1** 键，选择 **TotalCross: Package** 并等待完成。 然后就可以在 **Target** 文件夹中看到安装文件了。

#### 7\. 在树莓派上部署和运行应用程序

要使用 SSH 协议在 [树莓派][19] 上部署应用程序，请按键盘上的 **F1**。 选择 **TotalCross: Deploy&amp;Run** 并提供有关您的 SSH 连接的信息，如：用户名、IP地址、密码和应用程序路径。

![TotalCross：部署与运行][20]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

![配置 SSH 用户名][21]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

![配置 IP 地址][22]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

![输入密码][23]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

![配置路径][24]

(图片提供：Edson Holanda Teixeira Jr，遵循[CC BY-SA 4.0][13]协议)

这是应用程序在机器上运行的样子。

<video height="480" src="https://drive.google.com/file/d/1Reubm-B7E7MniAjsuLYw2Egqdt5Sq2IG/preview" width="640"></iframe>

### 总结

KnowCode 让使用 Java 创建和管理应用程序屏幕变得更加容易。 Knowcode-XML 将您的 XML 转换为 TotalCross GUI 界面，然后生成二进制文件以在您的树莓派上运行。

将 KnowCode 技术与 TotalCross 相结合，使您能够更快地创建嵌入式应用程序。 您可以访问我们在 GitHub 上的 [嵌入式示例][25] 并编辑您自己的应用程序，了解您还可以做什么。

如果您有问题、需要帮助，或者只是想与其他嵌入式 GUI 开发人员互动，请随时加入我们的 [Telegram][26] 小组，讨论任何框架上的嵌入式应用程序。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-totalcross

作者：[Edson Holanda Teixeira Junior][a]
选题：[lujun9972][b]
译者：[CoWave-Fall](https://github.com/CoWave-Fall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/edsonhtj
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://opensource.com/article/20/7/totalcross-cross-platform-development
[3]: https://github.com/TotalCross/knowcode-xml
[4]: https://code.visualstudio.com/
[5]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[6]: https://developer.android.com/studio
[7]: https://marketplace.visualstudio.com/items?itemName=totalcross.vscode-totalcross
[8]: https://opensource.com/article/19/11/install-java-linux
[9]: https://opensource.com/article/20/7/install-java-mac
[10]: http://adoptopenjdk.net
[11]: https://opensource.com/life/16/7/stumbling-git
[12]: https://opensource.com/sites/default/files/uploads/01_printergui.png (printer init screen)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://github.com/TotalCross/embedded-samples/tree/main/printer-application/src/main/resources/layout
[15]: https://totalcross.com/get-started/?utm_source=opensource&utm_medium=article&utm_campaign=printer
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+instantiationexception
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+illegalaccessexception
[18]: https://opensource.com/sites/default/files/uploads/03progressspinner.png (Loading Spinner)
[19]: https://www.raspberrypi.org/products/raspberry-pi-4-model-b/
[20]: https://opensource.com/sites/default/files/uploads/04_totalcross-deployrun.png (TotalCross: Deploy&Run)
[21]: https://opensource.com/sites/default/files/uploads/05_ssh.png (SSH user)
[22]: https://opensource.com/sites/default/files/uploads/06_ip.png (IP address)
[23]: https://opensource.com/sites/default/files/uploads/07_password.png (Password)
[24]: https://opensource.com/sites/default/files/uploads/08_path.png (Path)
[25]: https://github.com/TotalCross/embedded-samples
[26]: https://t.me/totalcrosscommunity
