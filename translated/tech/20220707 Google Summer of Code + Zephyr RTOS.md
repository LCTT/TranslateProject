[#]: subject: "Google Summer of Code + Zephyr RTOS"
[#]: via: "https://www.linux.com/news/google-summer-of-code-zephyr-rtos/"
[#]: author: "The Linux Foundation https://www.linuxfoundation.org/blog/google-summer-of-code-zephyr-rtos/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

谷歌编程之夏与 Zephyr RTOS 项目介绍
======

**谷歌编程之夏**（GSoC）是一个谷歌举办的国际年度项目，每年都在夏季举办。当贡献者们参与并完成一个 [自由开源软件][3] 的编码项目，[谷歌][1] 就会给他们发放 [津贴][2]。谷歌编程之夏于 2005 年推出，于 5 月至 8 月举行。项目创意由参与开源软件开发的主办组织提交，但学生也可以提出自己的项目创意。

今年，该项目向 18 岁或以上的任何人开放 —— 不仅限于学生和应届毕业生了。参与者通过编写软件获得报酬，其 [津贴][4] 的金额取决于他们所在国家/地区的 [购买力平价][5]。

**LCTT 译注：以往，这个活动只允许在校学生参与，今年条件放开，只需年龄 18+ 即可，对参与者的贡献时长要求也降低了，尽可能地让更多人参与进来。不过，今年的报名通道在 4 月 19 日就截止了，大家有兴趣的话明年可以关注一下。**

这也是 Zephyr 项目第一次作为 Linux 基金会的项目，参与到谷歌编程之夏中。让我们一起欢迎这些贡献者及其项目吧！

### 项目一：基于 Zephyr 的 Arduino 模块

1 个贡献者（350 小时）。

[Arduino][6] 是一个流行的框架，它为嵌入式设备编程提供了一个简化的接口。最近，Arduino 采用 mbed OS 作为其一些新设备的基础 RTOS。通过这项工作，他们将 [Arduino Core][7] 作为独立的抽象层，从 [Arduino Core for mbed][8] 中分离出来。这为在其他操作系统上利用 Arduino Core 开辟了可能性。

该项目的想法就是创建一个利用 Arduino Core 的 Zephyr 模块，以便开发人员在与 Arduino 兼容的设备上使用 Arduino 框架时，可以使用 Zephyr 作为底层操作系统。对用户的好处包括：

* 可以访问 Arduino API 以及高级 Zephyr 功能
* 得益于 Zephyrs 的设备支持，用户可以选择标准 Arduino 生态系统更广泛的设备
* 能够重复使用 Arduino 工具，如 Arduino IDE 和丰富的库

Arduino Core 使用 LGPL 下进行许可，Zephyr 使用 Apache 2 下进行许可。这意味着该项目的开发很可能需要脱离主分支，并在单独的 repo 中进行，以保持代码和许可证分离。有关这方面的历史讨论，请参阅 [#22247][9]，有关 Arduino 核心架构之前的早期尝试，请参阅 [soburi/arduino-on-zephyr][10]。

**贡献者的任务是：**

* 实现一个基于 Arduino Core 的准系统模块，可以为任何目标编译（不具备功能性，可能在 QEMU 中）
* 基于 Zephyr，使用 Arduino API 实现一个通用外围设备，例如 [Serial][11]
* 以一个物理板为目标，例如 Arduino Zero

**导师：**

[Jonathan Beri][12]– Golioth 和 Zephyr TSC 的首席执行官
[Alvaro Viebrantz][13] – Golioth 和 Google GDE 的创始工程师

**代码许可证：** LGPL

**贡献者详细信息：**

* 姓名：Dhruva Gole
* 项目博客：[https://dhruvag2000.github.io/Blog-GSoC22/][14]
* 项目海报: 

![][15]

**关于贡献者：**

![][16]

Dhruva 是一名电气工程专业的本科生。他的兴趣广泛，从嵌入式软件开发到硬件设计，在 SBC、微控制器和嵌入式 Linux 平台方面拥有丰富的工作经验。

### 项目二：Zephyr 的 Apache Thrift 模块

一个贡献者（350 hours）。

[Apache Thrift][17] 是一个 [IDL][18] 规范、[RPC][19] 框架和代码生成器，它抽象出传输和协议细节，让开发者专注于应用逻辑。它适用于所有主流操作系统，支持超过 27 种编程语言、7 种协议和 6 种底层传输方式。最初，它于 [2007 年在 Facebook 开发][20]，随后与 Apache 软件基金会共享。

![][21]

![][22]

在 Zephyr RTOS 中支持 Thrift 将使社区受益匪浅。它将带来新的软件和硬件技术、新产品以及云集成的其他方式。 Thrift 也可以用于几乎任何传输，因此，它是 Zephyr 支持的许多不同物理通信层的自然选择。该项目的想法是使概念验证 [Thrift for Zephyr 模块][23] 形成以供上游使用。为此，贡献者必须：

* 对 Thrift 功能（协议、传输）执行额外的集成
* 使用 [supported board][24] 或 [Qemu][25] 编写其他示例应用程序
* 使用 [Zephyr 测试框架][26] 编写其他测试并生成覆盖率报告
* 确保模块遵循适当的 [编码指南][27] 并满足 [模块要求][28]
* 将任何必要的改进贡献回 Apache Thrift 项目
* 将任何必要的改进贡献回 Zephyr 项目

**导师：**

* [Christopher Friedt][29] – Meta 的 SWE / ASIC FW 和 Zephyr TSC 成员
* [Stephanos Ioannidis][30] – Zephyr CXX 子系统维护者

**代码许可证：** Apache 2.0

**贡献者详细信息：**

* 姓名：Young

**关于贡献者：** Young 是一名通信工程专业的学生，他将攻读计算机工程硕士学位。他兴趣广泛，从前端开发到硬件设计，在 Web、IoT 和嵌入式平台方面拥有丰富的工作经验。2021 年他设计的一款搭载 RISC-V 64 处理器的低成本单板机被多家极客媒体报道。

本文 [Google Summer of Code + Zephyr RTOS][31] 首发于 [Linux 基金会][32]。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/google-summer-of-code-zephyr-rtos/

作者：[The Linux Foundation][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/blog/google-summer-of-code-zephyr-rtos/
[b]: https://github.com/lkxed
[1]: https://en.wikipedia.org/wiki/Google
[2]: https://en.wikipedia.org/wiki/Stipend
[3]: https://en.wikipedia.org/wiki/Free_and_open-source_software
[4]: https://en.wikipedia.org/wiki/Stipend
[5]: https://en.wikipedia.org/wiki/Purchasing_power_parity
[6]: https://www.arduino.cc/
[7]: https://github.com/arduino/ArduinoCore-API
[8]: https://github.com/arduino/ArduinoCore-mbed
[9]: https://github.com/zephyrproject-rtos/zephyr/issues/22247
[10]: https://github.com/soburi/arduino-on-zephyr
[11]: https://www.arduino.cc/reference/en/language/functions/communication/serial/
[12]: https://www.linkedin.com/in/jonathanberi/
[13]: https://www.linkedin.com/in/alvaro-viebrantz-55119048/
[14]: https://dhruvag2000.github.io/Blog-GSoC22/
[15]: https://www.linuxfoundation.org/wp-content/uploads/project-poster.png
[16]: https://www.linuxfoundation.org/wp-content/uploads/dhruva.jpeg
[17]: https://github.com/apache/thrift
[18]: https://en.wikipedia.org/wiki/Interface_description_language
[19]: https://en.wikipedia.org/wiki/Remote_procedure_call
[20]: https://thrift.apache.org/static/files/thrift-20070401.pdf
[21]: https://www.linuxfoundation.org/wp-content/uploads/apache-thrift-layered-architecture.png
[22]: https://www.linuxfoundation.org/wp-content/uploads/SPDX-license.png
[23]: https://github.com/cfriedt/thrift-for-zephyr
[24]: https://docs.zephyrproject.org/latest/boards/index.html
[25]: https://docs.zephyrproject.org/latest/guides/networking/qemu_user_setup.html
[26]: https://docs.zephyrproject.org/latest/guides/test/ztest.html
[27]: https://docs.zephyrproject.org/latest/contribute/coding_guidelines/index.html
[28]: https://docs.zephyrproject.org/latest/guides/modules.html
[29]: https://www.linkedin.com/in/christopher-friedt/
[30]: https://www.linkedin.com/in/stephanosio/
[31]: https://www.linuxfoundation.org/blog/google-summer-of-code-zephyr-rtos/
[32]: https://www.linuxfoundation.org/
