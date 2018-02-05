Android 在物联网方面能否像在移动终端一样成功？
============================================================

![](https://cdn-images-1.medium.com/max/1000/1*GF6e6Vd-22PViWT8EDpLNA.jpeg) 

*Android Things 让 IoT 如虎添翼*

### 我在 Android Things 上的最初 24 小时

正当我在开发一个基于 Android 的运行在树莓派 3 的物联网商业项目时，一些令人惊喜的事情发生了。谷歌发布了[Android Things][1] 的第一个预览版本，他们的 SDK 专门（目前）针对 3 个 SBC（单板计算机） —— 树莓派 3、英特尔 Edison 和恩智浦 Pico。说我一直在挣扎似乎有些轻描淡写 —— 树莓派上甚至没有一个成功的 Android 移植版本，我们在理想丰满，但是实践漏洞百出的内测版本上叫苦不迭。其中一个问题，同时也是不可原谅的问题是，它不支持触摸屏，甚至连 [Element14][2] 官方销售的也不支持。曾经我认为 Android 已经支持树莓派，更早时候 “[谷歌向 AOSP 项目发起提交][3]” 中提到过树莓派曾让所有人兴奋不已。所以当 2016 年 12 月 12 日谷歌发布 “Android Things” 及其 SDK 的时候，我马上闭门谢客，全身心地去研究了……

### 问题？

关于树莓派上的谷歌 Android 我遇到很多问题，我以前用 Android 做过许多开发，也做过一些树莓派项目，包括之前提到过的一个真正参与的。未来我会尝试解决这些问题，但是首先最重要的问题得到了解决 —— 有完整的 Android Studio 支持，树莓派成为你手里的另一个常规的 ADB 可寻址设备。好极了。Android Studio 强大而便利、十分易用的功能包括布局预览、调试系统、源码检查器、自动化测试等都可以真正的应用在 IoT 硬件上。这些好处怎么说都不过分。到目前为止，我在树莓派上的大部分工作都是通过 SSH 使用运行在树莓派上的编辑器（MC，如果你真的想知道）借助 Python 完成的。这是有效的，毫无疑问铁杆的 Pi/Python 粉丝或许会有更好的工作方式，而不是当前这种像极了 80 年代码农的软件开发模式。我的项目需要在控制树莓派的手机上编写 Android 软件，这真有点痛不欲生 ——  我使用 Android Studio 做“真正的” Android 开发，借助 SSH 做剩下的。但是有了“Android Things”之后，一切都结束了。

所有的示例代码都适用于这三种 SBC，树莓派只是其中之一。 `Build.DEVICE` 常量可以在运行时确定是哪一个，所以你会看到很多如下代码：

```
 public static String getGPIOForButton() {
     switch (Build.DEVICE) {
         case DEVICE_EDISON_ARDUINO:
             return "IO12";
         case DEVICE_EDISON:
             return "GP44";
         case DEVICE_RPI3:
             return "BCM21";
         case DEVICE_NXP:
             return "GPIO4_IO20";
         default:
             throw new IllegalStateException(“Unknown Build.DEVICE “ + Build.DEVICE);
     }
 }
```

我对 GPIO 处理有浓厚的兴趣。 由于我只熟悉树莓派，我只能假定其它 SBC 工作方式相同，GPIO 只是一组引脚，可以定义为输入/输出，是连接物理外部世界的主要接口。 基于 Linux 的树莓派操作系统通过 Python 中的读取和写入方法提供了完整和便捷的支持，但对于 Android，您必须使用 NDK 编写 C++ 驱动程序，并通过 JNI 在 Java 中与这些驱动程序对接。 不是那么困难，但需要在你的构建链中维护额外的一些东西。 树莓派还为 I2C 指定了 2 个引脚：时钟和数据，因此需要额外的工作来处理它们。I2C 是真正酷的总线寻址系统，它通过串行化将许多独立的数据引脚转换成一个。 所以这里的优势是 —— Android Things 已经帮你完成了所有这一切。 你只需要 `read()`  和 `write() ` 你需要的任何 GPIO 引脚，I2C 同样容易：

```
public class HomeActivity extends Activity {
    // I2C Device Name
    private static final String I2C_DEVICE_NAME = ...;
    // I2C Slave Address
    private static final int I2C_ADDRESS = ...;

    private I2cDevice mDevice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Attempt to access the I2C device
        try {
            PeripheralManagerService manager = new PeripheralManagerService();
            mDevice = manager.openI2cDevice(I2C_DEVICE_NAME, I2C_ADDRESS)
        } catch (IOException e) {
            Log.w(TAG, "Unable to access I2C device", e);
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

        if (mDevice != null) {
            try {
                mDevice.close();
                mDevice = null;
            } catch (IOException e) {
                Log.w(TAG, "Unable to close I2C device", e);
            }
        }
    }
}
```

### Android Things 基于 Android 的哪个版本？

看起来是 Android 7.0，这样很好，因为我们可以继承 Android 所有以前版本的平板设计 UI、优化，安全加固等。它也带来了一个有趣的问题 —— 与应用程序必须单独管理不同，未来的平台应如何更新升级？请记住，这些设备可能无法连接到互联网。我们可能不便于连接蜂窝 / WiFi ，即便之前这些连接能用，但是有时不那么可靠。

另一个担心是，Android Things 仅仅是一个名字不同的 Android 分支版本，大部分都是一样的，和已经发布的  Arduino 一样，更像是为了市场营销而出现，而不是作为操作系统。不过可以放心，实际上通过[样例][4]可以看到，其中一些样例甚至使用了 SVG 图形作为资源，而不是传统的基于位图的图形（当然也能轻松处理） —— 这是一个非常新的 Android 创新。

不可避免地，与 Android Things 相比，普通的 Android 会有些不同。例如，权限问题。因为 Android Things 为固定硬件设计，在构建好之后，用户通常不会在这种设备上安装应用，所以在一定程序上减轻了这个问题，尽管当设备要求权限时是个问题 —— 因为它们没有 UI。解决方案是当应用在安装时给予所有需要的权限。 通常，这些设备只有一个应用，并且该应用从设备上电的那一刻就开始运行。

![](https://cdn-images-1.medium.com/max/800/1*pi7HyLT-BVwHQ_Rw3TDSWQ.png) 

### Brillo 怎么了？

Brillo 是谷歌以前的 IoT 操作系统的代号，听起来很像 Android Things 的前身。 实际上现在你仍然能看到很多提及 Brillo 的地方，特别是在 GitHub Android Things 源码的文件夹名字中。 然而，它已经不复存在了。新王已经登基！

### UI 指南？

谷歌针对 Android 智能手机和平板电脑应用发布了大量指南，例如屏幕按钮间距等。 当然，你最好在可行的情况下遵循这些，但这已经不是本文应该考虑的范畴了。 缺省情况下什么也没有 —— 应用程序作者决定一切，这包括顶部状态栏，底部导航栏 —— 绝对是一切。 多年来谷歌一直在告诉 Android 应用程序的作者们绝不要在屏幕上放置返回按钮，因为平台将提供一个，因为 Android Things [可能甚至没有 UI！][5]。

### 智能手机上会有多少谷歌服务？

有一些，但不是所有。第一个预览版本没有蓝牙支持、没有 NFC，这两者都对物联网革命有重大贡献。 SBC 支持它们，所以我们应该不会等待太久。由于没有通知栏，因此不支持任何通知。没有地图。缺省没有软键盘，你必须自己安装一个键盘。由于没有 Play 商店，你只能艰难地通过 ADB 做这个和许多其他操作。

当为 Android Things 开发时，我试图为运行在手机上和树莓派上使用同一个 APK。这引发了一个错误，阻止它安装在除 Android Things 设备之外的任何设备：`com.google.android.things` 库不存在。 这有点用，因为只有 Android Things 设备需要这个，但它似乎是个限制，因为不仅智能手机或平板电脑上没有，连模拟器上也没有。似乎只能在物理 Android Things 设备上运行和测试您的 Android Things 应用程序……直到谷歌在 [G+ 谷歌的 IoT 开发人员社区][6]组中回答了我的问题，并提供了规避方案。但是，躲过初一，躲不过十五。

### 可以期待 Android Thing 生态演进到什么程度？

我期望看到移植更多传统的基于 Linux 服务器的应用程序，将 Android 限制在智能手机和平板电脑上没有意义。例如，Web 服务器突然变得非常有用。已经有一些了，但没有像重量级的 Apache 或 Nginx 的。物联网设备可以没有本地 UI，但通过浏览器管理它们当然是可行的，因此需要用这种方式呈现 Web 面板。类似的那些如雷贯耳的通讯应用程序 —— 它需要的仅是一个麦克风和扬声器，而且在理论上任何视频通话应用程序，如 Duo、Skype、FB 等都可行。这个演变能走多远目前只能猜测。会有 Play 商店吗？它们会展示广告吗？我们能够确保它们不会窥探我们，或被黑客控制它们么？从消费者的角度来看，物联网应该是具有触摸屏的网络连接设备，因为每个人都已经习惯于通过智能手机工作。

我还期望看到硬件的迅速发展 —— 特别是有更多的 SBC 拥有更低的成本。看看惊人的 5 美元树莓派 Zero，不幸的是，由于其有限的 CPU 和内存，几乎可以肯定不能运行 Android Things。多久之后像这样的设备才能运行 Android Things？这是很明显的，标杆已经设定，任何有追求的 SBC 制造商将瞄准 Android Things 的兼容性，规模经济也将波及到外围设备，如 23 美元的触摸屏。没人会购买不会播放 YouTube 的微波炉，你的洗碗机会在 eBay 上购买更多的清洁粉，因为它注意到你很少使用它……

然而，我不认为我们会过于冲昏头脑。了解一点 Android 架构有助于将其视为一个包罗万象的物联网操作系统。它仍然使用 Java，其垃圾回收机制导致的所有时序问题在过去几乎把它搞死。这仅仅是问题最少的部分。真正的实时操作系统依赖于可预测、准确和坚如磐石的时序，要么它就不能被用于“关键任务”。想想医疗应用、安全监视器，工业控制器等。使用 Android，如果宿主操作系统认为它需要，理论上可以在任何时候杀死您的活动/服务。这在手机上没那么糟糕 —— 用户可以重新启动应用程序，杀死其他应用程序，或重新启动手机。但心脏监视器就完全是另一码事。如果前台的活动/服务正在监视一个 GPIO 引脚，而这个信号没有被准确地处理，我们就完了。必须要做一些相当根本的改变让 Android 来支持这一点，到目前为止还没有迹象表明它已经在计划之中了。

### 这 24 小时

所以，回到我的项目。 我认为我会接管我已经完成和尽力能为的工作，等待不可避免的路障，并向 G+ 社区寻求帮助。 除了一些在非 Android Things 设备上如何运行程序的问题之外，没有其他问题。它运行得很好！ 这个项目也使用了一些奇怪的东西，如自定义字体、高精定时器 —— 所有这些都在 Android Studio 中完美地展现。对我而言，可以打满分 —— 至少我能够开始做出实际原型，而不只是视频和截图。

### 蓝图

今天的物联网操作系统环境看起来非常零碎。 显然没有市场领导者，尽管炒作之声沸反连天，物联网仍然在草创阶段。 谷歌 Android 物联网能否像它在移动端那样取得成功？现在 Android 在移动方面的主导地位几近达到 90％。我相信如果真的如此，Android Things 的推出正是重要的一步。

记住所有的关于开放和封闭软件的战争，它们主要发生在从不授权的苹果和一直担心免费还不够充分的谷歌之间。那个老梗又来了，因为让苹果推出一个免费的物联网操作系统的构想就像让他们免费赠送下一代 iPhone 一样遥不可及。

物联网操作系统游戏是开放的，大家机遇共享，不过这个时候，封闭派甚至不会公布它们的开发工具箱……

前往 [Developer Preview][7]网站，立即获取 Android Things SDK 的副本。

--------------------------------------------------------------------------------

via: https://medium.com/@carl.whalley/will-android-do-for-iot-what-it-did-for-mobile-c9ac79d06c#.hxva5aqi2

作者：[Carl Whalley][a]
译者：[firstadream](https://github.com/firstadream)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@carl.whalley
[1]:https://developer.android.com/things/index.html
[2]:https://www.element14.com/community/docs/DOC-78156/l/raspberry-pi-7-touchscreen-display
[3]:http://www.androidpolice.com/2016/05/24/google-is-preparing-to-add-the-raspberry-pi-3-to-aosp-it-will-apparently-become-an-officially-supported-device/
[4]:https://github.com/androidthings/sample-simpleui/blob/master/app/src/main/res/drawable/pinout_board_vert.xml
[5]:https://developer.android.com/things/sdk/index.html
[6]:https://plus.google.com/+CarlWhalley/posts/4tF76pWEs1D
[7]:https://developer.android.com/things/preview/index.html
