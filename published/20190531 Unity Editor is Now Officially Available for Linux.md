[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10974-1.html)
[#]: subject: (Unity Editor is Now Officially Available for Linux)
[#]: via: (https://itsfoss.com/unity-editor-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Unity 编辑器现已正式面向 Linux 推出
======

如果你是设计师、开发者或艺术家，你可能一直在使用 Linux 上的实验性 [Unity 编辑器][1]。然而，不能一直用实验性版本 —— 开发者需要一个完整稳定的工作经验。

因此，他们最近宣布你可以在 Linux 上使用完整功能的 Unity 编辑器了。

虽然这是一个令人兴奋的消息，但它正式支持哪些 Linux 发行版？我们来谈谈更多细节……

> 非 FOSS 警告

> Linux （或任何其他平台）上的 Unity 编辑器不是开源软件。我们在这里介绍它是因为：

### 官方支持 Ubuntu 和 CentOS 7

![][2]

无论你拥有个人许可还是专业许可，如果你安装了 Unity 2019.1 或更高版本，都可以使用该编辑器。

此外，他们优先支持 Ubuntu 16.04、Ubuntu 18.04 和 CentOS 7。

在[公告][3]中，他们还提到了支持的配置：

* x86-64 架构
* 运行在 X11 窗口系统之上的 Gnome 桌面环境
* Nvidia 官方专有显卡驱动和 AMD Mesa 显卡驱动
* 桌面计算机，在没有仿真或兼容层的设备/硬件上运行

你可以尝试其他的 —— 但最好坚持官方要求以获得最佳体验。

> 关于第三方工具的说明

> 如果你碰巧在某个项目中使用了任何第三方工具，那么必须单独检查它们是否支持。

### 如何在 Linux 上安装 Unity 编辑器

现在你已经了解了，那么该如何安装？

要安装 Unity，你需要下载并安装 [Unity Hub][4]。

![Unity Hub][5]

你需要完成以下步骤：

* 从[官方论坛页面][4]下载适用于 Linux 的 Unity Hub。
* 它将下载一个 AppImage 文件。简单地说，让它可执行并运行它。如果你不了解，你应该查看关于[如何在 Linux 上使用 AppImage][6] 的指南。
* 启动 Unity Hub 后，它会要求你使用 Unity ID 登录（或注册）以激活许可证。有关许可证生效的更多信息，请参阅他们的 [FAQ 页面][7]。
* 使用 Unity ID 登录后，进入 “Installs” 选项（如上图所示）并添加所需的版本/组件。

就是这些了。这就是获取并快速安装的最佳方法。

### 总结

即使这是一个令人兴奋的消息，但官方配置支持似乎并不广泛。如果你在 Linux 上使用它，请在[他们的 Linux 论坛帖子][9]上分享你的反馈和意见。

你觉得怎么样？此外，你是使用 Unity Hub 安装它，还是有更好的方法来安装？

请在下面的评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/unity-editor-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://unity3d.com/unity/editor
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/Unity-Editor-on-Linux.png?resize=800%2C450&ssl=1
[3]: https://blogs.unity3d.com/2019/05/30/announcing-the-unity-editor-for-linux/
[4]: https://forum.unity.com/threads/unity-hub-v-1-6-0-is-now-available.640792/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/unity-hub.jpg?fit=800%2C532&ssl=1
[6]: https://itsfoss.com/use-appimage-linux/
[7]: https://support.unity3d.com/hc/en-us/categories/201268913-Licenses
[9]: https://forum.unity.com/forums/linux-editor.93/
