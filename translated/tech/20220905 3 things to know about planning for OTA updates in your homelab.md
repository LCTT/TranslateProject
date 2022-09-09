[#]: subject: "3 things to know about planning for OTA updates in your homelab"
[#]: via: "https://opensource.com/article/22/9/plan-ota-updates-edge"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在家庭实验室中规划 OTA 更新需要了解的 3 件事
======
在开始编写应用之前，为手机、物联网设备和边缘计算定义无线更新计划。

![Why and how to handle exceptions in Python Flask][1]

图片来自 Unsplash.com，CC0 协议

过去对系统的更新相对简单。当开发人员需要修改他们已经分发给公众的东西时，会发布一个更新程序供人们运行。用户将运行更新程序，允许用新文件替换旧文件并添加新文件。然而，即使有了这些“相对简单”的更新，也有一个问题。当用户的安装处于意外状态时会发生什么？升级中断时会发生什么？当各种设备都在线时，这些问题同样重要，有时需要重要的安全更新。今天的许多更新都是通过无线、空中下载技术 (OTA) 的方式提供的，连接不良、信号突然丢失或断电的可能性可能会对应该是次要更新的内容造成灾难性的影响。这些是你在计划提供 OTA 更新时需要考虑的三大策略。

### 1. 验证

TCP 协议内置了很多验证功能，因此当你[向设备发送数据包][2]时，通常可以确信每个数据包都已完好无损地收到。但是，TCP 无法报告它不知道的错误，因此由你来验证以下内容：

* 你是否已发送更新所需的所有文件？设备无法接收最初未发送的内容。
* 收到的文件和你发送的文件一样吗？至少，检查 SHA 和以验证文件完整性。
* 如果可能，请使用[数字签名][3]确保文件来自受信任的来源。
* 在允许更新开始之前，你必须验证设备能够应用更新。在提交更新之前检查权限和电池状态，并确保你的更新过程覆盖任何意外的用户事件，例如计划的重新启动或休眠。
* 最后，你必须验证声称已成功完成的更新是否已实际完成。在将更新正式标记为系统已完成之前，请检查目标设备上的文件位置和完整性。

### 2. 回退和故障状态

更新的最坏情况是设备处于损坏状态，以至于它甚至不能继续中止的更新。在这种情况下，更新程序文件存在于目标设备上，但该过程已被中断。这可能会使设备处于未知状态，其中一些文件已被更新版本替换，而其他文件尚未被触及。在最坏的情况下，已更新的文件与尚未更新的文件不兼容，因此设备无法按预期运行。

有一些策略可以解决这个问题。初始更新步骤可能是安装专用于完成更新的特殊引导镜像或环境，并在系统上设置“标志”以确认更新正在进行中。这样可以确保即使设备在更新过程中突然断电，更新过程也会在下次启动时重新启动。仅在验证更新后才删除表示更新成功的标志。

根据目标设备的安全策略和你要更新的内容，特殊的引导镜像可能不可行或不需要。不过，原理还是一样的。当启动后，更新必须建立一个环境，在这个环境中，待处理的更新是解决问题之前的唯一途径

但是，在更新被授予启动权限之前，用户（如果有的话）应该能够延迟或忽略更新。

### 3. 附加更新

在许多边缘和物联网设备中，目标设备的底层是不可变的。更新只会添加到系统的已知状态。 [Fedora Silverblue][4] 之类的项目正在证明这种模式可以在许多市场上发挥作用，因此这种奢侈可能会变得司空见惯。不过，在那之前，成功应用更新的一部分是了解你将要影响的环境。

不过，你不需要不可变的核心来应用附加更新。你可以构建一个使用相同的概念的系统，将更新作为添加库或包的一种方式，而无需修改旧版本。作为此类更新的最后一步，具有更新路径的可执行文件是你所做的唯一实际修订。

### OTA 更新

世界越来越无线化。对于手机、物联网设备和[边缘计算][5]，OTA 更新通常是唯一的选择。实施 OTA 更新策略需要仔细规划并仔细考虑不可能的情况。你最了解您的目标设备，因此请在开始编码之前规划好你的更新架构

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/plan-ota-updates-edge

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/computer_code_programming_laptop.jpg
[2]: https://www.redhat.com/sysadmin/beginners-guide-network-troubleshooting-linux
[3]: https://www.redhat.com/sysadmin/digital-signatures-gnupg
[4]: https://silverblue.fedoraproject.org
[5]: https://www.redhat.com/en/topics/edge-computing/what-is-edge-computing?intcmp=7013a000002qLH8AAM
