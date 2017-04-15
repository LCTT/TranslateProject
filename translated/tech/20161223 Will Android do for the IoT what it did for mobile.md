
安卓IoT能否像在移动终端一样成功？
============================================================

 ![](https://cdn-images-1.medium.com/max/1000/1*GF6e6Vd-22PViWT8EDpLNA.jpeg) 
Android Things让IoT如虎添翼

###我在Android Things上的最初24小时
正当我在开发一个基于Android的运行在树莓派3的物联网商业项目时，一些令人惊喜的事情发生了。谷歌发布了[Android Things] [1]的第一个预览版本，他们的SDK专门针对（最初）3个SBC（单板计算机） - 树莓派 3，英特尔Edison和恩智浦Pico。说我一直在挣扎似乎有些轻描淡写 - 没有成功的移植树莓派安卓可以参照，我们在理想丰满，但是实践漏洞百出的内测版本上叫苦不迭。其中一个问题，同时也是不可原谅的问题是，它不支持触摸屏，甚至连[Element14][2]官方销售的也不支持。曾经我认为安卓已经支持树莓派，更早时候[commi tto AOSP project from Google][3]提到过Pi曾让所有人兴奋不已。所以当2016年12月12日谷歌发布"Android Things"和其SDK的时候，我马上闭门谢客，全身心地去研究了……

### 问题？
安卓扩展的工作和Pi上做过的一些项目，包括之前提到的，当前正在开发中的Pi项目，使我对谷歌安卓产生了许多问题。未来我会尝试解决它们，但是最重要的问题可以马上解答 -  有完整的Android Studio支持，Pi成为列表上的另一个常规的ADB可寻址设备。好极了。Android Atudio强大的，便利的，纯粹的易用的功能包括布局预览，调试系统，源码检查器，自动化测试等可以真正的应用在IoT硬件上。这些好处怎么说都不过分。到目前为止，我在Pi上的大部分工作都是在python中使用SSH运行在Pi上的编辑器（MC，如果你真的想知道）。这是有效的，毫无疑问硬核Pi / Python头可以指出更好的工作方式，而不是当前这种像极了80年代码农的软件开发模式。我的项目涉及到在控制Pi的手机上编写Android软件，这有点像在伤口狂妄地撒盐 -  我使用Android Studio做“真正的”Android工作，用SSH做剩下的。但是有了"Android Things"之后，一切都结束了。

所有的示例代码都适用于3个SBC，Pi 只是其中之一。 Build.DEVICE常量在运行时确定，所以你会看到很多如下代码：

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

我对GPIO处理有浓厚的兴趣。 由于我只熟悉Pi，我只能假定其他SBC工作方式相同，GPIO只是一组引脚，可以定义为输入/输出，是连接物理外部世界的主要接口。 基于Pi Linux的操作系统发行版通过Python中的读取和写入方法提供了完整和便捷的支持，但对于Android，您必须使用NDK编写C ++驱动程序，并通过JNI在Java中与这些驱动程序对接。 不是那么困难，但需要在你的构建链中维护额外的一些东西。 Pi还为I2C指定了2个引脚，时钟和数据，因此需要额外的工作来处理它们。 I2C是真正酷的总线寻址系统，它通过串行化将许多独立的数据引脚转换成一个。 所以这里的优势是 - Android Things已经帮你完成了所有这一切。 你只需要_read（）_和_write（）_to /from你需要的任何GPIO引脚，I2C同样容易：

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
### Android Things基于Android的哪个版本？
看起来是Android 7.0，这样很好，因为我们可以继承Android以前的所有版本的文档，优化，安全加固等。它也提出了一个有趣的问题 - 与应用程序必须单独管理不同，未来的平台应如何更新升级？请记住，这些设备可能无法连接到互联网。我们可能不在蜂窝/ WiFi连接的舒适空间，虽然之前这些连接至少可用，即使有时不那么可靠。

另一个担心是，Android Things仅仅是一个名字不同的分支版本的Android，如何选择它们的共同特性，就像启动Arduino（已经发布的一个更像市场营销而不是操作系统的操作系统）这种简单特性。实际上，通过查看[samples] [4]，一些功能可能永不再用 - 比如一个最近的Android创新，甚至使用SVG图形作为资源，而不是传统的基于位图的图形，当然Andorid Things也可以轻松处理。

不可避免地，与Android Things相比，普通的Android会抛出问题。例如，权限问题。因为Android Things为固定硬件设计，用户通常不会在这种设备上安装App，所以在一定程序上减轻了这个问题。另外，在没有图形界面的设备上请求权限通常不是问题，我们可以在安装时开放所有权限给App。 通常，这些设备只有一个应用程序，该应用程序从设备上电的那一刻就开始运行。

 ![](https://cdn-images-1.medium.com/max/800/1*pi7HyLT-BVwHQ_Rw3TDSWQ.png) 

### Brillo怎么了？

Brillo是谷歌以前的IoT操作系统的代号，听起来很像Android的前身。 实际上现在你仍然能看到很多Brillo引用，特别是在GitHub Android Things源码的例子中。 然而，它已经不复存在了。新王已经登基！

### UI指南？
Google针对Android智能手机和平板电脑应用发布了大量指南，例如屏幕按钮间距等。 当然，你最好在可行的情况下遵循这些，但这已经不是本文应该考虑的范畴了。 缺省情况下什么也没有- 应用程序作者决定一切。 这包括顶部状态栏，底部导航栏 - 绝对一切。 多年来谷歌一直叮咛Android应用程序作者不要去渲染屏幕上的返回按钮，因为平台将提供一个抛出异常，因为对于Android Things，[可能甚至不是一个UI！] [5]

### 多少智能手机上的服务可以期待？
有些，但不是所有。第一个预览版本没有蓝牙支持。没有NFC，两者都对物联网革命有重大贡献。 SBC支持他们，所以我们应该不会等待太久。由于没有通知栏，因此不支持任何通知。没有地图。缺省没有软键盘，你必须自己安装一个。由于没有Play商店，你只能屈尊通过 ADB做这个和许多其他操作。

当开发Android Things时我试图和Pi使用同一个APK。这引发了一个错误，阻止它安装在除Android Things设备之外的任何设备：库“_com.google.android.things_”不存在。 Kinda有意义，因为只有Android Things设备需要这个，但它似乎是有限的，因为不仅智能手机或平板电脑不会出现，任何模拟器也不会。似乎只能在物理Android Things设备上运行和测试您的Android Things应用程序...直到Google在[G + Google的IoT开发人员社区] [6]组中回答了我的问题，并提供了规避方案。但是，躲过初一，躲不过十五 。

### 让我如何期待Android Thing生态演进？

我期望看到移植更多传统的基于Linux服务器的应用程序，这对Android只有智能手机和平板电脑没有意义。例如，Web服务器突然变得非常有用。一些已经存在，但没有像重量级的Apache，或Nginx。物联网设备可能没有本地UI，但通过浏览器管理它们当然是可行的，因此需要用这种方式呈现Web面板。类似的那些如雷贯耳的通讯应用程序 - 它需要的仅是一个麦克风和扬声器，在理论上对任何视频通话应用程序，如Duo，Skype，FB等都可行。这个演变能走多远目前只能猜测。会有Play商店吗？他们会展示广告吗？我们可以确定他们不会窥探我们，或让黑客控制他们？从消费者的角度来看，物联网应该是具有触摸屏的网络连接设备，因为每个人都已经习惯于通过智能手机工作。

我还期望看到硬件的迅速发展 - 特别是更多的SBC并且拥有更低的成本。看看惊人的5美元 树莓派0，不幸的是，由于其有限的CPU和RAM，几乎肯定不能运行Android Things。多久之后像这样的设备才能运行Android Things？这是很明显的，标杆已经设定，任何自重的SBC制造商将瞄准Android Things的兼容性，规模经济也将波及到外围设备，如23美元的触摸屏。没人购买不会播放YouTube的微波炉，你的洗碗机会在eBay上购买更多的粉末商品，因为它注意到你很少使用它……

然而，我不认为我们会失去掌控力。了解一点Android架构有助于将其视为一个包罗万象的物联网操作系统。它仍然使用Java，并几乎被其所有的垃圾回收机制导致的时序问题锤击致死。这仅仅是问题最少的部分。真正的实时操作系统依赖于可预测，准确和坚如磐石的时序，或者它不能被描述为“mission critical”。想想医疗应用程序，安全监视器，工业控制器等。使用Android，如果主机操作系统认为它需要，理论上可以在任何时候杀死您的活动/服务。在手机上不是那么糟糕 - 用户可以重新启动应用程序，杀死其他应用程序，或重新启动手机。心脏监视器完全是另一码事。如果前台Activity / Service正在监视一个GPIO引脚，并且信号没有被准确地处理，我们已经失败了。必须要做一些相当根本的改变让Android来支持这一点，到目前为止还没有迹象表明它已经在计划之中了。

###这24小时
所以，回到我的项目。 我认为我会接管我已经完成和尽力能为的工作，等待不可避免的路障，并向G+社区寻求帮助。 除了一些在非Android Things上如何运行程序 的问题之外 ，没有其他问题。 它运行得很好！ 这个项目也使用了一些奇怪的东西，自定义字体，高精定时器 - 所有这些都在Android Studio中完美地展现。对我而言，可以打满分 - 最后我可以开始给出实际原型，而不只是视频和截图。

### 蓝图
今天的物联网操作系统环境看起来非常零碎。 显然没有市场领导者，尽管炒作之声沸反连天，物联网仍然在草创阶段。 谷歌Android物联网能否像它在移动端那样，现在Android在那里的主导地位非常接近90％？ 我相信果真如此，Android Things的推出正是重要的一步。

记住所有的关于开放和封闭软件的战争，它们主要发生在从不授权的苹果和一直担心免费还不够充分的谷歌之间？ 那个老梗又来了，因为让苹果推出一个免费的物联网操作系统的构想就像让他们免费赠送下一代iPhone一样遥不可及。

物联网操作系统游戏是开放的，大家机遇共享，不过这个时候，封闭派甚至不会公布它们的开发工具箱……

转到[Developer Preview] [7]网站，立即获取Android Things SDK的副本。

--------------------------------------------------------------------------------

via: https://medium.com/@carl.whalley/will-android-do-for-iot-what-it-did-for-mobile-c9ac79d06c#.hxva5aqi2

作者：[Carl Whalley][a]
译者：[firstadream](https://github.com/firstadream)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@carl.whalley
[1]:https://developer.android.com/things/index.html
[2]:https://www.element14.com/community/docs/DOC-78156/l/raspberry-pi-7-touchscreen-display
[3]:http://www.androidpolice.com/2016/05/24/google-is-preparing-to-add-the-raspberry-pi-3-to-aosp-it-will-apparently-become-an-officially-supported-device/
[4]:https://github.com/androidthings/sample-simpleui/blob/master/app/src/main/res/drawable/pinout_board_vert.xml
[5]:https://developer.android.com/things/sdk/index.html
[6]:https://plus.google.com/+CarlWhalley/posts/4tF76pWEs1D
[7]:https://developer.android.com/things/preview/index.html
