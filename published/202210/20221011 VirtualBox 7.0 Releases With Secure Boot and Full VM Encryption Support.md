[#]: subject: "VirtualBox 7.0 Releases With Secure Boot and Full VM Encryption Support"
[#]: via: "https://news.itsfoss.com/virtualbox-7-0-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15141-1.html"

VirtualBox 7.0 发布，支持安全启动和全加密虚拟机
======

> VirtualBox 7.0 是自其上次大版本更新以来的一次重大升级。有一些不错的进步！

![伴随着 VirtualBox 7.0 的发布，支持安全启动和全加密虚拟机][1]

对 VirtualBox 来说，这是一次大的升级。这个版本值得关注，因为我们在最近几年没有看到过它的大版本更新。

对于那些不熟悉 VirtualBox 的人来说，它是一个由 [甲骨文公司][2] 开发的虚拟化软件。

随着 VirtualBox 7.0 的推出，增加了许多新功能。

让我们来看看其中最关键的一些。

### VirtualBox 7.0 的新内容

![virtualbox 7.0][3]

VirtualBox 7.0 是一次有益的升级。有图标更新、主题改进，以及一些关键的亮点，包括：

* 一个显示运行中的<ruby>客体<rt>Guest</rt></ruby>的性能统计的新工具。
* 支持安全启动。
* 支持<ruby>全加密虚拟机<rt>Full VM Encryption</rt></ruby>（通过 CLI）。
* 重新设计的新建虚拟机向导。

#### 通过命令行管理的全加密虚拟机

虚拟机（VM）现在可以完全加密了，但只能通过命令行界面。

这也包括加密的配置日志和暂存状态。

截至目前，用户只能通过命令行界面对机器进行加密，未来将增加不同的方式。

#### 新的资源监控工具

![VirtualBox 7.0 的资源监控][4]

新的实用程序可以让你监控性能统计，如 CPU、内存使用、磁盘 I/O 等。它将列出所有正在运行的客体的性能统计。

这不是最吸引人的补充，但很有用。

#### 改进的主题支持

对主题的支持在所有平台上都得到了改进。在 Linux 和 macOS 上使用原生引擎，而在 Windows 上，有一个单独的实现。

#### 对安全启动的支持

VirtualBox 现在支持安全启动，增强了对恶意软件、病毒和间谍软件的安全性。

它还将防止虚拟机使用损坏的驱动程序启动，这对企业应用非常重要。

使用那些需要安全启动才能运行的操作系统的用户现在应该能够轻松创建虚拟机了。

#### 其他变化

VirtualBox 7.0 是一次重大的升级。因此，有几个功能的增加和全面的完善。

例如，新件虚拟机向导现在已经重新设计，以整合无人值守的客体操作系统安装。

![virtualbox 7.0 无人值守的发行版安装][5]

其他改进包括：

* 云端虚拟机现在可以被添加到 VirtualBox，并作为本地虚拟机进行控制。
* VirtualBox 的图标在此版本中得到了更新。
* 引入了一个新的 3D 栈，支持 DirectX 11。它使用 [DXVK][6] 来为非 Windows 主机提供同样的支持。
* 支持虚拟 TPM 1.2/2.0。
* 改进了多显示器设置中的鼠标处理。
* Vorbis 是音频录制的默认音频编解码器。

你可以查看 [发行说明][7] 以了解更多信息。

如果你正在寻找增强的功能，如更好的主题支持、加密功能、安全启动支持和类似的功能添加，VirtualBox 7.0 是一个不错的升级。

💬 *你对这次升级有什么看法？你会使用较新的版本还是暂时坚持使用旧版本的虚拟机？*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/virtualbox-7-0-release/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/10/virtualbox-7-0-release.jpg
[2]: https://www.oracle.com/in/
[3]: https://news.itsfoss.com/content/images/2022/10/VirtualBox_7.0.png
[4]: https://news.itsfoss.com/content/images/2022/10/VirtualBox_7.0_Resource_Monitor.png
[5]: https://news.itsfoss.com/content/images/2022/10/VirtualBox_7.0_Unattended_Guest_Install.png
[6]: https://github.com/doitsujin/dxvk
[7]: https://www.virtualbox.org/wiki/Changelog-7.0
