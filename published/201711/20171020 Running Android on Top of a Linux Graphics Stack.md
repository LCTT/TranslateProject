在 Linux 图形栈上运行 Android
============================================================


![Linux graphics](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-graphics-stack.jpg?itok=qGxdvJA7 "Linux graphics")

> 根据 Collabora 的 Linux 图形栈贡献者和软件工程师 Robert Foss 的说法，你现在可以在常规的 Linux 图形处理平台上运行 Android，这是非常强大的功能。了解更多关于他在欧洲嵌入式 Linux 会议上的演讲。[Creative Commons Zero][2] Pixabay

你现在可以在常规的 Linux 图形栈之上运行 Android。以前并不能这样，根据 Collabora 的 Linux 图形栈贡献者和软件工程师 Robert Foss 的说法，这是非常强大的功能。在即将举行的[欧洲 Linux 嵌入式会议][5]的讲话中，Foss 将会介绍这一领域的最新进展，并讨论这些变化如何让你可以利用内核中的新功能和改进。

在本文中，Foss 解释了更多内容，并提供了他的演讲的预览。

**Linux.com：你能告诉我们一些你谈论的图形栈吗？**

**Foss：** 传统的 Linux 图形系统（如 X11）大都没有使用<ruby>平面图形<rt>plane</rt></ruby>。但像 Android 和 Wayland 这样的现代图形系统可以充分利用它。

Android 在 HWComposer 中最成功实现了平面支持，其图形栈与通常的 Linux 桌面图形栈有所不同。在桌面上，典型的合成器只是使用 GPU 进行所有的合成，因为这是桌面上唯一有的东西。

大多数嵌入式和移动芯片都有为 Android 设计的专门的 2D 合成硬件。这是通过将显示的内容分成不同的图层，然后智能地将图层送到经过优化处理图层的硬件。这就可以释放 GPU 来处理你真正关心的事情，同时它让硬件更有效率地做最好一件事。

**Linux.com：当你说到 Android 时，你的意思是  Android 开源项目 （AOSP） 么？**

**Foss：** Android 开源项目（AOSP）是许多 Android 产品建立的基础，AOSP 和 Android 之间没有什么区别。

具体来说，我的工作已经在 AOSP 上完成，但没有什么可以阻止将此项工作加入到已经发货的 Android 产品中。

区别更多在于授权和满足 Google 对 Android 产品的要求，而不是代码。

**Linux.com： 谁想要运行它，为什么？有什么好处？**

**Foss：** AOSP 为你提供了大量免费的东西，例如针对可用性、低功耗和多样化硬件进行优化的软件栈。它比任何一家公司自行开发的更精致、更灵活, 而不需要投入大量资源。

作为制造商，它还为你提供了一个能够立即为你的平台开发的大量开发人员。

**Linux.com：有什么实际使用情况？**

** Foss：** 新的部分是在常规 Linux 图形栈上运行 Android 的能力。可以在主线/上游内核和驱动来做到这一点，让你可以利用内核中的新功能和改进，而不仅仅依赖于来自于你的供应商的大量分支的 BSP。

对于任何有合理标准的 Linux 支持的 GPU，你现在可以在上面运行 Android。以前并不能这样。而且这样做是非常强大的。

同样重要的是，它鼓励 GPU 设计者与上游的驱动一起工作。现在他们有一个简单的方法来提供适用于 Android 和 Linux 的驱动程序，而无需额外的努力。他们的成本将会降低，维护上游 GPU 驱动变得更有吸引力。

例如，我们希望看到主线内核支持高通 SOC，我们希望成为实现这一目标的一部分。

总而言之，这将有助于硬件生态系统获得更好的软件支持，软件生态系统有更多的硬件配合。

*   它改善了 SBC/开发板制造商的经济性：它们可以提供一个经过良好测试的栈，既可以在两者之间工作，而不必提供 “Linux 栈” 和 Android 栈。
*   它简化了驱动程序开发人员的工作，因为只有一个优化和支持目标。
*   它支持 Android 社区，因为在主线内核上运行的 Android 可以让他们分享上游的改进。
*   这有助于上游，因为我们获得了一个产品级质量的栈，这些栈已经在硬件设计师的帮助下进行了测试和开发。

以前，Mesa 被视为二等栈，但现在它是最新的（完全符合 Vulkan 1.0、OpenGL 4.6、OpenGL ES 3.2）另外还有性能和产品质量。

这意味着驱动开发人员可以参与 Mesa，相信他们正在分享他人的辛勤工作，并且还有一个很好的基础。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/event/elce/2017/10/running-android-top-linux-graphics-stack

作者：[SWAPNIL BHARTIYA][a]
译者：[	](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/robert-fosspng
[4]:https://www.linux.com/files/images/linux-graphics-stackjpg
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference-europe
