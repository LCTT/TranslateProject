[#]: collector: (lujun9972)
[#]: translator: (CN-QUAN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14171-1.html)
[#]: subject: (NIST aims to make frequency sharing more efficient for wireless networks)
[#]: via: (https://www.networkworld.com/article/3561618/nist-aims-to-make-frequency-sharing-more-efficient-for-wireless-networks.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

NIST 的目标是使无线网络的频率共享更加有效
======

> 机器学习方案将帮助不同的无线电协议，如 Wi-Fi 和 LTE，在同一的无线频谱中更有效地协同工作。

![](https://img.linux.net.cn/data/attachment/album/202201/12/130824n8rkw1iwiveadcgr.jpg)

美国国家标准与技术研究所（[NIST][1]）开发的机器学习方案有可能显著改善 [5G][2] 和其他无线网络选择和共享通信频率的方式。研究人员声称，与试错法相比，NIST 的方案可以使共享通信频率的过程的效率提高多达 5000 倍。

NIST 系统的理念是，无线电设备可以从经验中学习其网络环境，而不是像现在这样，简单地根据试错法选择频率信道。

NIST 在 [其网站上的一篇文章][3] 中说，在特定的环境条件下，“该算法可以学习哪个信道提供最好的结果”。

该团队说:“该方案可以被编程到现实世界中许多 [不同] 类型网络的发射机软件中。”

从本质上讲，这个计算机模拟的算法是一个映射环境射频条件的先前经验的公式。例如，这些条件可以包括在一个信道（一组相邻的频率）内运行的发射机的数量。

文章说：“……如果发射机选择了一个未被占用的信道，那么成功传输的概率就会上升，从而导致更高的数据速率。”同样地，当发射机选择一个没有太多干扰的信道时，信号会更强，你也会得到更好的数据速率。发射机会记住哪个信道提供了最佳结果，并学会在下次需要清晰信号时学会选择那个位置。

这与今天的工作方式不同。也就是说，无线电只是试图找到一个开放频率，然后与类似协议的无线电进行通信。在复杂的情况下，使用诸如 Wi-Fi、跳频和 [波束成形][4] 等技术来优化信道。

研究人员解释说，NIST 的机器学习技术的亮点在于共享频谱，比如通过授权频谱辅助接入（LAA）共享 Wi-Fi。LAA 是非授权频谱中的 LTE 频谱，称为 LTE-U，频率为 5GHz。在相同频率下的 Wi-Fi 与 LAA 的组合中，协议是不同的：无线电之间不能相互通信以协调工作，而且频带越繁忙就可能出现混乱 —— 传输会遇到其他传输。但是，如果所有的无线电接收机都能更好地选择它们的占位，通过学习哪些有效，哪些无效，那么这将会更好。

NIST 工程师 Jason Coder 在文章中说：“这可能会使非授权频段的通信更加高效。”

事实上，NIST 声称，它“可以帮助 5G 和其他无线网络选择和共享通信频率，其效率大约是试错法的 5000 倍。”

这里的关键词是“共享”，因为为了在有限的频谱内增加通信，必须进行更多的共享 —— 物联网或媒体流等用户都在争夺同样的隐喻资产。随着物联网和数字技术的不断发展，非授权和授权频段的结合，就像 LAA 中的情况一样，可能会变得更加普遍。（非授权的频段是指那些没有分配给特定用户的频段，比如移动网络运营商；授权频段是在拍卖中中标并分配的。）

在 NIST 场景中，相互竞争的发射机“各自学习在不相互通信的情况下最大化网络数据速率”。因此，多种协议和数据类型，如视频或传感器数据，或 Wi-Fi 和移动网络，可以相互协作。

NIST 的方案大大简化了为发射机分配最佳信道的过程，根据这篇文章研究发现，穷尽努力 [使用试错法] 来确定最佳解决方案需要大约 45600 次试验，而这个方案只需要尝试 10 个渠道就可以选择类似的解决方案，仅仅付出 0.02% 的努力。”

NIST 的研究人员在 IEEE 第 91 届车辆技术会议上展示了他们的研究成果。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561618/nist-aims-to-make-frequency-sharing-more-efficient-for-wireless-networks.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[CN-QUAN](https://github.com/CN-QUAN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.nist.gov/
[2]: https://www.networkworld.com/article/3330603/5g-versus-4g-how-speed-latency-and-application-support-differ.html
[3]: https://www.nist.gov/news-events/news/2020/05/nist-formula-may-help-5g-wireless-networks-efficiently-share-communications
[4]: https://www.networkworld.com/article/3445039/beamforming-explained-how-it-makes-wireless-communication-faster.html
[5]: https://events.vtsociety.org/vtc2020-spring/conference-sessions/program/
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
