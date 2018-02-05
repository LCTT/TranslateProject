Genymotion vs Android 模拟器
============================================================

> Android 模拟器是否改善到足以取代 Genymotion

一直以来有关于选择 android 模拟器或者 Genymotion 的争论，我看到很多讨论最后以赞成 Genymotion 而告终。我根据我周围最常见的情况收集了一些数据，基于此，我将连同 Genymotion 全面评估 android 模拟器。

结论剧透：配置正确时，Android 模拟器比 Genymotion 快。

使用带 Google API 的 x86（32位）镜像、3GB RAM、四核CPU。

> - 哈，很高兴我们知道了最终结果
> - 现在，让我们深入

免责声明：我已经测试了我看到的一般情况，即运行测试。所有的基准测试都是在 2015 年中期的 MacBook Pro 上完成的。无论何时我提及 Genymotion 指的都是 Genymotion Desktop。他们还有其他产品，如 Genymotion on Cloud＆Genymotion on Demand，但这里没有考虑。我不是说 Genymotion 是不合适的，但运行测试比某些 Android 模拟器慢。

关于这个问题的一点背景，然后我们将转到具体内容上去。

_过去：我有一些基准测试，继续下去。_

很久以前，Android 模拟器是唯一的选择。但是它们太慢了，这是架构改变的原因。对于在 x86 机器上运行的 ARM 模拟器，你能期待什么？每个指令都必须从 ARM 转换为 x86 架构，这使得它的速度非常慢。

随之而来的是 Android 的 x86 镜像，随着它们摆脱了 ARM 到 x86 平台转化，速度更快了。现在，你可以在 x86 机器上运行 x86 Android 模拟器。

> - _问题解决了！！！_ 
> - 没有！

Android 模拟器仍然比人们想要的慢。随后出现了 Genymotion，这是一个在 virtual box 中运行的 Android 虚拟机。与在 qemu 上运行的普通老式 android 模拟器相比，它相当稳定和快速。

我们来看看今天的情况。

我在持续集成的基础设施上和我的开发机器上使用 Genymotion。我手头的任务是摆脱持续集成基础设施和开发机器上使用 Genymotion。

> - 你问为什么？
> - 授权费钱。

在快速看了一下以后，这似乎是一个愚蠢的举动，因为 Android 模拟器的速度很慢而且有 bug，它们看起来适得其反，但是当你深入的时候，你会发现 Android 模拟器是优越的。

我们的情况是对它们进行集成测试（主要是 espresso）。我们的应用程序中只有 1100 多个测试，Genymotion 需要大约 23 分钟才能运行所有测试。

在 Genymotion 中我们面临的另一些问题是：

*   有限的命令行工具（[GMTool][1]）。
*   由于内存问题，它们需要定期重新启动。这是一个手动任务，想象在配有许多机器的持续集成基础设施上进行这些会怎样。

**进入 Android 模拟器**

首先是尝试在它给你这么多的选择中设置一个，这会让你会觉得你在赛百味餐厅一样。最大的问题是 x86 或 x86_64 以及是否有 Google API。

我用这些组合做了一些研究和基准测试，这是我们所想到的。

鼓声……

> - 比赛的获胜者是带 Google API 的 x86 
> - 但是如何胜利的？为什么？

嗯，我会告诉你每一个问题。

x86_64 比 x86 慢

> - 你问慢多少。
> - 28.2% 多！！！

使用 Google API 的模拟器更加稳定，没有它们容易崩溃。

这使我们得出结论：最好的是带 Google API 的x86。

在我们抛弃 Genymotion 开始使用模拟器之前。有下面几点重要的细节。

*   我使用的是带 Google API 的 Nexus 5 镜像。
*   我注意到，给模拟器较少的内存会造成了很多 Google API 崩溃。所以为模拟器设定了 3GB 的 RAM。
*   模拟器有四核。
*   HAXM 安装在主机上。

**基准测试的时候到了**

![Genymotion and Android Emulator Espresso Benchmark](https://d33wubrfki0l68.cloudfront.net/5ffb16e99dbccd5f6e4848d7a1b6b92646fea15f/1356a/assets/images/genymotion-vs-android-emulator/espressobenchmark.png)

![Linpack](https://d33wubrfki0l68.cloudfront.net/e5c28d737abf8dee69333f83657928c362157b4e/ede85/assets/images/genymotion-vs-android-emulator/linpack.png)

![Geekbench 4](https://d33wubrfki0l68.cloudfront.net/b5af78db6d6eddd090d601fcf32c11e7622759f0/b00c1/assets/images/genymotion-vs-android-emulator/geekbench4.png)

从基准测试上你可以看到除了 Geekbench4，Android 模拟器都击败了 Genymotion，我感觉更像是virtual box 击败了 qemu。

> 欢呼模拟器之王

我们现在有更快的测试执行时间、更好的命令行工具。最新的 [Android 模拟器][2]创下的新的记录。更快的启动时间之类。

Goolgle 一直努力让

> Android 模拟器变得更好

如果你没有在使用 Android 模拟器。我建议你重新试下，可以节省一些钱。

我尝试的另一个但是没有成功的方案是在 AWS 上运行 [Android-x86][3] 镜像。我能够在 vSphere ESXi Hypervisor 中运行它，但不能在 AWS 或任何其他云平台上运行它。如果有人知道原因，请在下面评论。

PS：[VMWare 现在可以在 AWS 上使用][4]，在 AWS 上使用 [Android-x86][5] 毕竟是有可能的。

--------------------------------------------------------------------------------

作者简介：

嗨，我的名字是 Sumit Gupta。我是来自印度古尔冈的软件/应用/网页开发人员。我做这个是因为我喜欢技术，并且一直迷恋它。我已经工作了 3 年以上，但我还是有很多要学习。他们不是说如果你有知识，让别人点亮他们的蜡烛。

当在编译时，我阅读很多文章，或者听音乐。

如果你想联系，下面是我的社交信息和 [email][6]。

----
via: https://www.plightofbyte.com/android/2017/09/03/genymotion-vs-android-emulator/

作者：[Sumit Gupta][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.plightofbyte.com/about-me
[1]:https://docs.genymotion.com/Content/04_Tools/GMTool/GMTool.htm
[2]:https://developer.android.com/studio/releases/emulator.html
[3]:http://www.android-x86.org/
[4]:https://aws.amazon.com/vmware/
[5]:http://www.android-x86.org/
[6]:thesumitgupta@outlook.com
