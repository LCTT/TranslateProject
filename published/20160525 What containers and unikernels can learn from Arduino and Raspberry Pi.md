容器和 Unikernel 能从树莓派和 Arduino 学到什么？
==========================================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus-containers.png?itok=vM7_7vs0)

某一天，我和我的一个机械工程师朋友聊天的时候。 他最近在做一个给半挂卡车的电子辅助刹车系统，他提到他们公司的办公室里都是 [Arduinos][1]。这主要是方便员工可以快速的对新的想法进行实验。他也提到了，Arduinos 其实比自己画电路板更加昂贵。对此，我感到非常震惊，因为我从软件行业得到的印象是 Arduinos 比定制电路板更加便宜。

我常常把 [Arduinos][2] 和 [树莓派][3] 看做是可以制作非常有趣设备的小型、Cool、特别的组件。我主要从事于软件行业，并且总是觉得运行在 x86 和 x86-64 设备上的 Linux 才算是“常规用途”。而事实是，Arduinos 并不是特殊用途。实际上，它们是很常规的用途。它们相当的小、便宜，而且非常的灵活。这就是为什么它们像野火一样流行起来的原因。它们有全品类的输入输出设备和扩展卡。它们能让创客们快速的构建非常 Cool 的设备。它们甚至可以让公司可以快速地开发产品。

一套 Arduino 的单价比批量生产的电路板高了很多，但是，看不见的时间成本却低了很多。当电路板大规模生产的时候，价格可以控制的很低，但是，之前的研发费用却高了很多。所以，总而言之，答案就是，使用 Arduino 划得来。

### Unikernel、Rump 内核和容器主机

Unikernel、Rump 内核和迷你 Linux 发行版，这些操作系统是为了特有用途而构建的。这些特有的操作系统，某种程度上就像定制电路板。它们需要前期的投入，还需要设计，但是，当大规模部署的时候，它可以提供强大的性能。

迷你操作系统，例如：红帽企业版 Atomic 或者 CoreOS 是为了运行容器而构建的。它们很小，快速，易于在启动时配置，并且很适合于运行容器。缺点就是它需要额外的工程量来添加第三方插件，比如监控客户端或者虚拟化的工具。副作用就是载入的工具也需要重新设计为超级权限的容器。 如果你正在构建一个巨大的容器环境，这些额外的工作量是划算的。但是，如果只是想尝试下容器，那可能就没必要了。

容器提供了运行标准化的工作流程（比如使用 [glibc][4] 编译）的能力。一个好处就是你可以在你的电脑上构建和测试这个工作单元（Docker 镜像）并且在完全不同的硬件上或者云端非常顺利的部署，而保持着相同的特性。在生产环境中，容器的宿主机仍然由运维团队进行配置管理，但是应用被开发团队控制。这就是对双方来说最好的合作方式。

Unikernels 和 Rump 内核依旧是为了特定目标构建的，但是却更进一步。整个的操作系统在构建的时候就被开发或者架构师配置好了。这带来了好处，同时还有挑战。

一个好处就是，开发人员可以控制这个工作流程的运转。理论上说，一个开发者可以为了不同的特性，尝试 [不同的 TCP 协议栈][5]，并且选择最好的一个。在操作系统启动的时候，开发人也可以配置 IP 地址，而不是通过 DHCP。 开发人员也可以裁剪任何对于应用而言不需要的部分。这也是性能提升的保障，因为减少了[不必要的上下文切换][6]。

同时，Unikernel 也带来了挑战。目前，还缺失很多的工具。 现在，和画板子的世界类似，开发人员需要花费很多时间和精力在检查是否有完整的库文件存在，不然的话，他们必须改变他们应用的执行方式。在如何让这个“嵌入式”的操作系统在运行时配置的方面，也存在挑战。最后，每次操作系统的大改动，都需要[反馈到开发人员][7]来进行修改。这并没有一个在开发和运维之间明确的界限，所以我能想象，为了接受了这个开发流程，一些组织或者公司必须要改变。

### 结论

在专门的容器主机比如 Rump 内核和 Unikernel 方面也有一些有趣的传闻，因为，它们会带来一个特定工作流程的潜在变革（嵌入式、云，等等）。在这个令人激动又快速发展的领域请保持你的关注，但是也要谨慎。

目前，Unikernel 看起来和定制电路板很像。它们都需要前期的研发投资，并且都是非常独特的，可以为确定的工作流程带来好处。同时，容器甚至在常规的工作流中都非常有趣，而且它不需要那么多的投入。一个简单的例子，运维团队能方便的在容器上部署一个应用，但是在 Unikernel 上部署一个应用则需要重新设计和编码，而且业界并不能完全保证，这个工作流程就可以被部署在 Unikernel 上。

容器，Rump 内核 和 Unikernel 有一个光明的未来！

--------------------------------------
via: https://opensource.com/business/16/5/containers-unikernels-learn-arduino-raspberry-pi 

作者：[Scott McCarty][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[1]: https://opensource.com/resources/what-arduino
[2]: https://opensource.com/life/16/4/arduino-day-3-projects
[3]: https://opensource.com/resources/what-raspberry-pi
[4]: https://en.wikipedia.org/wiki/GNU_C_Library
[5]: http://www.eetasia.com/ARTICLES/2001JUN/2001JUN18_NTEK_CT_AN5.PDF
[6]: https://en.wikipedia.org/wiki/Context_switch
[7]: http://developers.redhat.com/blog/2016/05/18/3-reasons-i-should-build-my-containerized-applications-on-rhel-and-openshift/
