基于Aura的Google Chrome浏览器Linux版已提供下载
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/Screen-Shot-2014-05-21-at-00.00.22.png)

**经过似乎漫无止境的等待之后，Google近日正式发布采用Aura（它是这个	搜索巨头开发的内部图形层————译注：硬件加速窗口管理器）的Chrome浏览器 for Linux的第一个稳定版本。**

用于取代GTK+的Aura, 是用来在屏幕上绘制包括菜单和窗口框架在内的Chrome UI的主体部分（是的，它在局部窗口集成菜单和全局菜单中都能完美工作）。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/Screen-Shot-2014-05-21-at-00.18.15.png)

这个外观框架已经在Windows和Chrome OS builds中使用，因其绝大部分是跨平台的，使得Google能够更快地开发新特性以及保证特性在不同的操作系统中的一致性。

在Linux上，相比GTK+版本的Chrome/Chromium，Aura加速界面能够更加有效地利用GPU的特性。尤其是Aura能够以每个窗口一个OpenGL的方式使用openGL而不是每个标签一个OpenGL。

新版的到来带来了一些额外的特性，包括Chrome通知中心、[一个可选的应用启动器][1]以及对显示选定的Google Now卡片的支持。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/aura.jpg)

### 其它变化 ###

Chrome 35 稳定版同样带来大量的跨平台变动， 包括为开发者提供若干可用的新扩展API；新的触摸输入管理；以及未说明的‘新JavaScript特性’。

如同每个新版本，Chrome 35 同样包含大量稳定性，性能和安全更新。

点击以下链接下载Google Chrome 35 for Linux：

- [下载Google Chrome][2]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/google-chrome-35-linux-arrives-aura

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://chrome.google.com/webstore/launcher
[2]:https://www.google.com/chrome/browser/
