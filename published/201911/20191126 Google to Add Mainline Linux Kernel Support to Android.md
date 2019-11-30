[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11616-1.html)
[#]: subject: (Google to Add Mainline Linux Kernel Support to Android)
[#]: via: (https://itsfoss.com/mainline-linux-kernel-android/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

谷歌为安卓添加主线 Linux 内核支持
======

当前的安卓生态系统被数百种不同版本的安卓所污染，每种版本都运行着 Linux 内核的不同变体。每个版本均针对不同的手机和不同的配置而设计。谷歌试图通过将主线 Linux 内核添加到安卓来解决该问题。
 
### 当前在安卓中是如何处理 Linux 内核的

在到达你的手机之前，你手机上的 Linux 内核经历了[三个主要步骤][1]。

首先，谷歌采用了 Linux 内核的 LTS（长期支持）版本，并添加了所有的安卓专用代码。这将成为“安卓通用内核”。

然后，谷歌将此代码发送给创建可运行在手机的片上系统（SoC）的公司。这通常是高通公司。

SoC 制造商添加了支持 CPU 和其他芯片的代码后，便会将该内核传递给实际的设备制造商，例如三星和摩托罗拉。然后，设备制造商添加代码以支持手机的其余部分，例如显示屏和摄像头。

每个步骤都需要一段时间才能完成，并且会导致该内核无法与其他任何设备一起使用。这也意味着内核会非常旧，通常是大约两年前的内核。例如，上个月交付的谷歌 Pixel 4 带有来自 2017 年 11 月的内核，而且它将永远不会得到更新。

谷歌承诺会为较旧的设备创建安全补丁，这意味着他们会一直盯着大量的旧代码。

### 将来

![][2]

去年，谷歌宣布[计划][3]解决此问题。今年，他们在 2019 Linux Plumbers Conference 上展示了他们取得的进展。

> “我们知道运行安卓需要什么，但不一定是在任何给定的硬件上。因此，我们的目标是从根本上找出所有这些，然后将其交给上游，并尝试尽可能接近主线。”
>
> Sandeep Patil，[安卓内核团队负责人][1]

他们确实炫耀了运行带有合适的 Linux 内核的小米 Poco F1。但是，有些东西[似乎没有工作][4]，例如电池电量百分比一直留在 0％。

那么，谷歌计划如何使其工作呢？从他们的 [Treble 项目][5]计划中摘录。在 Treble 项目之前，与设备和安卓本身交互的底层代码是一大堆代码。Treble 项目将两者分开，并使它们模块化，以便可以更快地交付安卓更新，并且在更新时，这些低级代码可以保持不变。

谷歌希望为内核带来同样的模块化。他们的[计划][1]“涉及稳定 Linux 的内核 ABI，并为 Linux 内核和硬件供应商提供稳定的接口来进行写入。谷歌希望将 Linux 内核与其硬件支持脱钩。”

因此，这意味着谷歌将交付一个内核，而硬件驱动程序将作为内核模块加载。目前，这只是一个草案。仍然有很多技术问题有待解决。因此，这不会很快有结果。

### 来自开源的反对意见

开源社区不会对将专有代码放入内核的想法感到满意。[Linux 内核准则][6]指出，驱动程序必须具有 GPL 许可证才能包含在内核中。他们还指出，如果驱动程序的更改导致错误，应由导致该错误的人来解决。从长远来看，这意味着设备制造商的工作量将减少。

### 关于将主线内核包含到安卓中的最终想法

到目前为止，这只是一个草案。谷歌有很大的可能会开始进行该项目，除非他们意识到这将需要多少工作后才会放弃。看看谷歌[已经放弃][7]了多少个项目！

[Android Police][4] 指出谷歌正在开发其 [Fuchsia 操作系统][8]，这似乎是为了有一天取代安卓。

那么，问题是谷歌会尝试完成那些艰巨的任务，使安卓以主线 Linux 内核运行，还是完成他们统一的安卓替代产品的工作？只有时间可以回答。

你对此话题有何看法？请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mainline-linux-kernel-android/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://arstechnica.com/gadgets/2019/11/google-outlines-plans-for-mainline-linux-kernel-support-in-android/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/mainline_linux_kernel_android.png?ssl=1
[3]: https://lwn.net/Articles/771974/
[4]: https://www.androidpolice.com/2019/11/19/google-wants-android-to-use-regular-linux-kernel-potentially-improving-updates-and-security/
[5]: https://www.computerworld.com/article/3306443/what-is-project-treble-android-upgrade-fix-explained.html
[6]: https://www.kernel.org/doc/Documentation/process/stable-api-nonsense.rst
[7]: https://killedbygoogle.com/
[8]: https://itsfoss.com/fuchsia-os-what-you-need-to-know/
[9]: https://reddit.com/r/linuxusersgroup
