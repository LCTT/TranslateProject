[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10808-1.html)
[#]: subject: (This is how System76 does open hardware)
[#]: via: (https://opensource.com/article/19/4/system76-hardware)
[#]: author: (Don Watkins  https://opensource.com/users/don-watkins)

System76 是如何打造开源硬件的
================================

> 是什么让新的 Thelio 台式机系列与众不同。

![在计算机上显示度量和数据][1]

大多数人对他们电脑的硬件一无所知。作为一个长期的 Linux 用户，当我想让我的无线网卡、视频卡、显示器和其他硬件与我选择的发行版共同运行时，也一样遇到了挫折。商业品牌的硬件通常使判断这些问题变得很困难：为什么以太网驱动、无线驱动或者鼠标驱动和我们预期的不太一样？随着 Linux 发行版变得成熟，这可能不再是问题，但是我们仍能发现触控板和其它外部设备的怪异行为，尤其是当我们对底层的硬件知道的不多时。

像 [System76][2] 这样的公司致力于解决这些问题，以提升 Linux 用户体验。System76 生产了一系列的 Linux 笔记本、台式机和服务器，甚至提供了它自己的 Linux 发行版 [Pop! OS][3] 作为客户的一个选择。最近我有幸参观了 System76 在 Devnver 的工厂并揭开它的新台式机产品线 [Thelio][5] [的神秘面纱][5]。

### 关于 Thelio

System76 宣称 Thelio 的开源硬件子板（被命名为木星之后的第 5 个卫星的名字 Thelio Io）是它在市场上独特的特点之一。Thelio Io 取得了开源硬件协会的认证 [OSHWA #us000145][6]，并且有 4 个用于存储的 SATA 端口和一个控制风扇和用于电源按钮控制的嵌入式控制器。Thelio IO SAS 取得了 [OSHWA #us000146][7] 认证，并且有 4 个用于存储的 U.2 端口，没有嵌入式控制器。在展示时，System76 显示了这些组件如何调整风扇通过底盘来优化部件的性能。

该控制器还管理电源键，和围绕该电源键的 LED 光环，当被按下时它以 100% 的亮度发光。这提供了触觉和视觉上的确认：该主机已经启动电源了。当电脑在使用中，该按钮被设置为 35% 的亮度，当在睡眠模式，它的亮度在 2.35% 和 25% 之间跳动。当计算机关闭后，LED 保持朦胧的亮度，因此能够在黑暗的房间里找到电源控制。

Thelio 的嵌入式控制器是一个低功耗的 [ATmega32U4][8] 微控制器，并且控制器的设置可以使用 Arduino Micro 进行原型设计。Thelio Io 主板变化的多少取决于你购买哪种 Thelio 型号。

Thelio 可能是我见过的设计的最好的电脑机箱和系统。如果你曾经亲身体验过在一个常规的 PC 的内部进行操作的话，你可能会同意我的观点。我已经做了很多次了，因此我能以自己过往的糟糕经历来证明这点。

### 为什么做开源硬件？

该主板是在 [KiCAD][9] 设计的，你可以在 [GitHub][10] 上按 GPL 许可证访问 Thelio 所有的设计文件。因此，为什么一个与其他 PC 制造商竞争的公司会设计一个独特的接口并公开授权呢？可能是该公司认识到开源设计及根据你的需要调整和分享一个 I/O 主板设计的能力的价值，即便你是市场上的竞争者。

![在 Thelio 启动时 Don Watkins 与 System76 的 CEO Carl Richell 谈话][11]

*在 [Thelio 发布会][12] Don Watkins 与 System76 的 CEO Carl Richell 谈话。*

我问 System76 的设计者和 CEO  [Carl Richell][13]，该公司是否担心过公开许可它的硬件设计意味着有人可以采取它的独特设计并用它来将 System76 驱逐出市场。他说：

> 开源硬件对我们所有人都有益。这是我们未来提升技术的方式，并且使得每个人获取技术更容易。我们欢迎任何想要提高 Thelio 设计的人来这么做。开源该硬件不仅可以帮助我们更快的改进我们的电脑，并且能够使我们的消费者 100% 信任他们的设备。我们的目标是尽可能地移除专利功能，同时仍然能够为消费者提供一个有竞争力的 Linux 主机。
>
> 我们已经与 Linux 社区一起合作了 13 年之久，来为我们的笔记本、台式机、服务器创造一个完美顺滑的体验。我们长期专注于为 Linux 社区提供服务，提供给我们的客户高水准的服务，我们的个性使 System76 变得独特。

我还问 Carl 为什么开源硬件对 System76 和 PC 市场是有意义的。他回复道：

> System76 创立之初的想法是技术应该对每个人是开放和可获取的。我们还没有到达 100% 开源创造一个电脑的程度，但是有了开源硬件，我们迈出了接近目标的必不可少的一大步。
>
> 我们生活在技术变成工具的时代。计算机在各级教育和很多行业当中是人们的工具。由于每个人特定的需要，每个人对于如何提升电脑和软件作为他们的主要工具有他们自己的想法。开源我们的计算机可以让这些想法成为现实，从而反过来促进技术成为一个更强大的工具。在一个开源环境中，我们持续迭代来生产更好的 PC。这有点酷。

我们总结了我们讨论的关于 System76 技术路线的对话，包含了开源硬件 mini PC，甚至是笔记本。在 System76 品牌下的已售出的 mini PC 和笔记本是由其他供应商制造的，并不是基于开源硬件的（尽管它们用的是 Linux 软件，是开源的）。

设计和支持开放式硬件是 PC 产业中的变革者，也正是它造就了 System76 的新 Thelio 台式机电脑产品线的不同。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/system76-hardware

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://system76.com/
[3]: https://opensource.com/article/18/1/behind-scenes-popos-linux
[4]: /article/18/11/system76-thelio-desktop-computer
[5]: https://system76.com/desktops
[6]: https://certification.oshwa.org/us000145.html
[7]: https://certification.oshwa.org/us000146.html
[8]: https://www.microchip.com/wwwproducts/ATmega32u4
[9]: http://kicad-pcb.org/
[10]: https://github.com/system76/thelio-io
[11]: https://opensource.com/sites/default/files/uploads/don_system76_ceo.jpg (Don Watkins speaks with System76 CEO Carl Richell at the Thelio launch event.)
[12]: https://trevgstudios.smugmug.com/System76/121418-Thelio-Press-Event/i-FKWFxFv
[13]: https://www.linkedin.com/in/carl-richell-9435781


