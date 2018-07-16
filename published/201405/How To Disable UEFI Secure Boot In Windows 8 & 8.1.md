如何在 Win8 上禁用 UEFI 以安装Linux
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_UEFI.jpeg)

现在，如果你买了预装 Windows 的电脑，一般都是 Windows8 或 Windows8.1。从 Windows8 开始，微软用 UEFI 取代了 BIOS。尽管 UEFI 不是微软发明的，在 Windows8 之前它就已经存在。比如某些 Mac 设备使用 UEFI 已经有一段时间了。

UEFI 有“安全启动”这个特点，引导程序只会启动那些得到 UEFI 固件签署的引导装载程序。此安全功能可以防止 Rootkit 类的恶意软件，并提供了额外的安全层。但它有一个缺点，如果你想在 Win8的电脑上双引导 Linux ，安全机制会阻止这样做。这篇文章告诉大家如何在Win8中禁用UEFI安全引导，以支持 Linux 的双系统启动。

### 在Windows 8 & 8.1上禁用UEFI安全启动 ###

关于安全启动，充斥着各种各样的说法。由于这些传闻，有些人几乎认为在预装 Windows8 的电脑上启动 Linux 是不可能的。虽然在 ARM PC上这是真的，但是在基于 Intel 的系统上安全引导是可以被禁用的。老实说，**禁用UEFI安全启动**不是一个艰巨的任务，同样的双启动的 Linux 与 Windows 8 也不是。

虽然在 BIOS 时代，访问 BIOS 是相当简单的，在启动的时候按 F10 或 F12 键即可。但是在 UEFI 的世界里，就不一样了。要访问 UEFI 设置，你就必须进入到 Windows 中去。让我们来看看如何在 Windows 8 中访问 UEFI 设置来禁用安全启动。

#### Step 1: 进入PC设置 ####

点击 Windows+I 按钮进入 Windows 设置界面。在底部，你会看到更改电脑设置的选项。点击它。

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_1.jpeg)

#### Step 2: 进入高级启动 ####

在 Windows 8 和 Windows8.1 上，PC设置有一个细微的差别。依照你使用的系统不同，分别按照下面介绍的各个步骤进行操作：

Windows 8的：在Windows 8中，你需要进入通用PC设置，并选择**高级启动**，然后点击**立即重新启动：**

![](http://itsfoss.com/wp-content/uploads/2014/05/Change_PC_Settings_Windows8.jpg)

**Window 8.1**的：在 Windows8.1，从左侧边栏点击**更新和恢复**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_2.jpeg)

然后单击**立即重新启动**下的**高级启动**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_3.jpeg)

不要担心！这之后并不会立刻重新启动，而是会在下一步看到一些选项。

#### Step 4: 进入UEFI设置 ####

当您单击了立即重新启动按钮，在下一页屏幕中，你将会看到一些可以选择的选项。这里选择**疑难解答**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8.jpg)

在**疑难解答**菜单中，选择**高级选项**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_1.jpg)

在高级选项菜单中，选择**UEFI固件设置**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_2.jpg)

接下来，在UEFI设置里，点击**重新启动**按钮重新启动您的系统，就会看到类似BIOS一样的界面。

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_3.jpg)

#### Step 5: 在 UEFI 中禁用安全启动 ####

这个时候，你一定已经启动到 UEFI 工具界面。你可以在这里更改各种设置。但我们想要做的，只是禁用安全启动选项，允许 Ubuntu 或者任何其它 Linux 版本的双启动。

移动到启动选项卡，在那里你会发现**安全引导**选项被设置为启用。使用箭头键进入安全引导选项，然后按**回车键**来选择它。 *使用+或 - 来改变它的值。按** F10 键保存更改**并退出 UEFI 设置。**提示时确认即可**。

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8.jpg)

接下来，您将会正常引导到 Windows。现在，您就支持双启动 Windows8 与 Ubuntu 或其它 Linux 操作系统了。过段时间里我会写关于如何双启动 Ubuntu 与 Windows 8 UEFI 的教程。敬请关注。

我希望这个教程可以帮助您禁用 Windows8 和 Windows8.1 的安全引导。如有任何疑问或建议，欢迎随时评论。

--------------------------------------------------------------------------------

via: http://itsfoss.com/disable-uefi-secure-boot-in-windows-8/ 

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
