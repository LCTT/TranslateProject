[#]: collector: (lujun9972)
[#]: translator: (CN-QUAN )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NIST aims to make frequency sharing more efficient for wireless networks)
[#]: via: (https://www.networkworld.com/article/3561618/nist-aims-to-make-frequency-sharing-more-efficient-for-wireless-networks.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

NIST的目标是使无线网络的频率共享更加有效
======
机器学习公式将帮助不同的无线电协议，如Wi-Fi和LTE，在同一的无线频谱中更有效地协同工作。
马丁·威廉姆斯/IDG


美国国家标准与技术研究所([NIST][1])开发的机器学习公式有可能显著改善[5G][2]和其他无线网络选择和共享通信频率的方式。研究人员声称，与试错法相比，NIST的公式可以使共享通信频率的过程效率提高多达5000倍。

NIST系统的理念是，无线电设备可以从经验中学习其网络环境，而不是像现在这样，简单地根据试错法选择频率信道。

NIST在[其网站上的一篇文章][3]中说，在特定的环境条件下，“该算法可以学习哪个信道提供最好的结果”。

**阅读更多内容：**[波束成形如何提高无线通信速度][4]

该团队说:“这个公式可以被编程到现实世界中许多[不同]类型网络的发射机的软件中。”

从本质上讲，计算机模拟的算法是一个公式，它映射了先前在环境射频条件下的经验。例如，这些条件可以包括在一个信道(一组相邻的频率)内运行的发射机的数量。

文章说：“…如果发射机选择了一个未被占用的信道，那么成功传输的概率就会上升，从而导致更高的数据速率。”同样地，当发射机选择一个没有太多干扰的信道时，信号会更强，你也会得到更好的数据速率。发射机记住哪个信道提供最佳结果， 并学会在下次需要清晰信号时学会选择刻度盘上的那个位置。

这与今天的工作方式不同。也就是说，无线电只是试图找到一个开放频率，然后与类似协议的无线电进行通信。在复杂的情况下，例如Wi-Fi，跳频和[波束成形][4]被用来优化信道。

研究人员解释说，NIST的机器学习技术的亮点在于共享频谱，比如通过授权频谱辅助接入(LAA)共享Wi-Fi。LAA是未经许可的LTE频谱，称为LTE-U，频率为5GHz。在相同频率下的Wi-Fi与LAA的组合中，协议是不同的：无线电之间不能相互通信以协调工作，而且频带越繁忙就可能出现混乱——传输会遇到其他传输。但是，如果所有的无线电接收机都能更好地选择他们的时段，通过学习哪些有效，哪些无效，那么这将会更好。

NIST工程师杰森·科德（Jason Coder）在文章中说：“这可能会使未经许可的频段的通信更加高效。”

事实上，NIST声称，它“可以帮助5G和其他无线网络选择和共享通信频率，其效率大约是试错法的5000倍。”

这里的关键词是“共享”，因为为了在有限的频谱内增加通信，必须进行更多的共享——物联网或媒体流媒体等用户都在争夺同样的隐喻地产。随着物联网和数字技术的不断发展，无授权和授权频段的结合，就像LAA中的情况一样，可能会变得更加普遍。(未授权的频段是指那些没有分配给特定用户的频段，比如移动网络运营商；授权的频段是在拍卖中中标并分配的。)

在NIST场景中，相互竞争的发射机“都学习在不相互通信的情况下最大化网络数据速率”。因此，多种协议和数据类型，如视频或传感器数据，或Wi-Fi和移动网络，可以相互协作。

NIST的公式大大简化了为发射机分配最佳信道的过程，根据这篇文章研究发现，穷尽努力[使用试错法]来确定最佳解决方案需要大约45600次试验，而这个公式只需要尝试10个渠道就可以选择类似的解决方案，仅仅0.02%的努力。”

NIST的研究人员最近在今年举行的IEEE第91届车辆技术会议上展示了他们的研究成果。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561618/nist-aims-to-make-frequency-sharing-more-efficient-for-wireless-networks.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[CN-QUAN](https://github.com/CN-QUAN)
校对：[校对者ID](https://github.com/校对者ID)

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
