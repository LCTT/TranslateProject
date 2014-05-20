如何在Windows 8 & 8.1上禁用UEFI安全验证
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_UEFI.jpeg)

现在，如果你买了预装Windows的电脑，一般都是Windows8或Windows8.1。从Windows8开始，微软用UEFI取代了BIOS。尽管UEFI不是微软发明的，在Windows8之前他就已经存在。比如某些Mac设备就已经使用UEFI有一段时间了。

UEFI有“安全启动”这个特点，引导程序只会启动那些得到UEFI固件签署的引导装载程序。此安全功能可以防止Rootkit类的恶意软件，并提供了额外的安全层。但它有一个缺点，如果你想在Linux的电脑上启动Windows8，安全机制将会制止他。因此，我们建议**禁用安全启动，来让Windows 8支持Linux的双系统启动**。

### 在Windows 8 & 8.1上禁用UEFI安全验证 ###

现在在关于安全启动，充斥着各种各样的杂音。由于这些传闻，有些人几乎认为在预装Windows8的电脑上启动到Linux是不可能的，虽然在ARM上这是真的。但是安全引导可以在基于Intel的系统上被禁用。老实说，**禁用UEFI安全启动**不是一个艰巨的任务，同样的双启动的Linux与Windows 8 也不是。

虽然在当年BIOS时，这是相当简单的，在启动的时候按F10或F12键即可。但是在UEFI的世界里，就不一样了。要访问UEFI设置，你就必须到Windows中去。让我们来看看如何访问UEFI设置禁用Windows8安全启动。

#### Step 1: 进入PC设置 ####

点击 Windows+I 按钮进入Windows设置界面。在底部，你会看到更改电脑设置的选项。点击它。

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_1.jpeg)

#### Step 2: 进入高级启动 ####


在Windows 8和Windows8.1上，PC设置有一个细微的差别。依照你使用的系统，你需要分别按照下面介绍的各个步骤进行操作：

Windows 8的：在Windows 8中，你需要进入一般的PC设置，并选择**高级启动**，然后点击**立即重新启动：**

![](http://itsfoss.com/wp-content/uploads/2014/05/Change_PC_Settings_Windows8.jpg)

**Window 8.1**的：在Windows8.1，从左侧边栏点击**更新和恢复**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_2.jpeg)

然后单击**立即重新启动**下的**高级启动**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8_3.jpeg)

不要担心！这之后也不会立刻重新启动，而是会提供一些​​选项，你将在下次开机看到的。

#### Step 4: 进入UEFI设置 ####

当您单击立即重新启动按钮，你将会看到一些选项从下一屏幕选择。选择**疑难解答**这里：

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8.jpg)

在**疑难解答**菜单中，选择**高级选项**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_1.jpg)

在高级选项菜单中，选择** UEFI固件设置**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_2.jpg)

接下来，在在UEFI设置里，点击**重新启动**按钮重新启动您的系统，就像之前在BIOS中做的一样。

![](http://itsfoss.com/wp-content/uploads/2014/05/Troubleshoot_Windows8_3.jpg)

#### Step 5: 在 UEFI 中禁用安全启动 ####

这个时候，你必须已经启动到UEFI工具。你可以在这里更改各种设置，但所有我们想要做的，就是禁用安全启动选项，允许的Ubuntu的双启动或任何其他的Linux。

移动到启动选项卡，在那里你会发现**安全引导**选项被设置为启用。使用箭头键进入安全引导选项，然后按**进入**来选择它。 *使用+或 - 来改变它的值。**确认提示时。按** F10键保存更改**并退出UEFI设置。

![](http://itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8.jpg)

接下来，您将到Windows正常开机。现在，你应该可以双启动的Windows8与Ubuntu或其他Linux操作系统。我会在未来的日子里写关于如何双启动的Ubuntu与Windows 8 UEFI。敬请关注。

我希望这个教程可以帮助你禁用Windows8和Windows8.1的安全引导。任何疑问或建议，随时欢迎。随时给意见。

--------------------------------------------------------------------------------

via: http://itsfoss.com/disable-uefi-secure-boot-in-windows-8/ 

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
