[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12611-1.html)
[#]: subject: (Military looks to ultraviolet networks for secure battlefield communication)
[#]: via: (https://www.networkworld.com/article/3572372/military-looks-to-ultraviolet-networks-for-secure-battlefield-communication.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

美国军方正探索战场保密通信用紫外网络
======

> 美国军方想以开放空间传输的紫外线为载体，为士兵开发新的更安全的通讯网络。

![](https://images.idgesg.net/images/article/2018/02/security_safety_guarding_mobile_laptop_endpoint_protection_thinkstock_906578404-100750806-large.jpg)

美国军方研究者之所以探索战场环境下的紫外光通信的应用，是因为这种技术可能实现敌对方无法侦测的通信。

研究者关注的一个方面是衰减效应，即信号强度随传播距离的增加而减弱的自然现象。他们想知道是否存在一个合适的距离范围，在该范围内，信号强度足够弱，以至于敌对方几乎无法侦测，但又足够强，使得友方可以侦测并建立通信。他们说他们观察到了这种情况，但关于他们相关工作的 [研究论文][1] 并没有讲这个距离范围究竟是多少。

一份军方出版物提到，“紫外通信具有独特的传输特性，不但可以实现非视距连接，而且让敌对方难以侦测。”

这个研究由美军作战能力发展司令部 [军队研究实验室][2] 主导，其重点是开发一个基础架构，为未来研究提供可量化环境，在该环境下，己方既可以使用紫外通信，也能够避免敌对方的侦测。研究过程中他们还有另外两个发现：

  * 最差情况，即敌对方探测器与己方发射器在视线范围内，但友方接收器不在视线范围内，问题不像想象中严重。
  * 转换紫外线发射器的发射方向不是降低敌对方探测到通信信号可能性的有效方式。

研究者计划分析下面四种场景，场景中涵盖了己方紫外发射器、友方接收器、敌对方探测器相对位置关系：

  * 友方接收器、敌对方探测器都在发射器的视线范围内。
  * 友方接收器在发射器视线范围内，但敌对方探测器不在视线范围内（最佳条件）。
  * 敌对方探测器在发射器的视线范围内，但友方接收器不在视线范围内（最差条件）。
  * 友方接收器、敌对方探测器均不在视线范围内。

假定敌对方试图通过时域上的光子计数来发现相干通信信号，进而判定正在进行通信。

科学家们承认这么一个事实，即越靠近发射器，信号越容易被侦测。所以紫外通信中发射器的有效使用依赖于对敌对方探测器位置的准确感知。

“我们提供了一个基础框架，使得对紫外通信系统实际可探测性与期望性能间差距的根本限制因素的研究得以进行。” 研究者之一，Robert Drost 博士如是说。

“我们的研究确保了团队对紫外波段用于通信的潜力及有限性有了根本上的理解。我坚信这种理解将影响到未来军队网络通信能力的发展。”

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3572372/military-looks-to-ultraviolet-networks-for-secure-battlefield-communication.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.osapublishing.org/DirectPDFAccess/4516B0FD-2152-4663-9A9899BF00560B7C_433781/oe-28-16-23640.pdf?da=1&id=433781&seq=0&mobile=no
[2]: https://www.arl.army.mil
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
