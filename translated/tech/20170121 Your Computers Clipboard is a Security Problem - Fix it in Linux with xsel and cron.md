你计算机上的剪切板是一个安全问题 - 在 Linux 中用 xsel 和 cron 修复它
============================================================



 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/clip2-630x520.png) 


**编辑：我原文推荐的是 xsel，但几个用户报告说它禁用了他们的声音。这对我来说不是问题，但我发现了另一种方式（使用 [xclip][1] ）来实现同样的目标，这样应该就能回避这个问题。文章已更新，切换到了 xclip。**

在你的操作系统上复制/粘贴的能力是必不可少的。无论你写的是代码还是喜剧，这两个功能是在计算机上处​​理文本的核心。当你复制文本时，它会进入内存驻留的剪贴板。除非安装了可以容纳多个条目的剪贴板管理器，否则剪贴板默认情况下会保存一个_复制_事件，而在你在_复制_其他东西的时候，它之前的条目就会消失。在标准 Linux 设置中，剪贴板内容存储在控制它的程序的存储器中（通常是 Xorg）。

剪贴板是有缺陷的，因为任何程序可以读取其内容，如果让它独立，它不会忘记它知道的。此外，现代浏览器允许恶意网站以多种方式从剪贴板读取（和写入）。

虽然不是默认的，但浏览器有禁止剪贴板访问的设置。也有用于浏览器和操作系统管理剪贴板的附加组件，但是它可在链接顶部更容易、更可靠地解决问题，并使系统范围内的剪贴板安全。有很多理由只有一个剪贴板，但没有一个很好的理由让内容在那里保留一两分钟以上。

密码管理器最近变得很受欢迎，如果你使用了密码管理器，你已经了解了它们如何将密码复制到剪贴板，以便你可以将其粘贴到浏览器中并登录到你的帐户。接下来会发生什么？直到另一个复制事件或重新启动，你的密码会保留在剪贴板上。

即使你使用单独的浏览器来处理银行等事务，如果你复制密码，则通过剪贴板会将其带回其他浏览器，并将其暴露在基于 web 剪贴板的收集技术中。

我在后台处理你的问题，每分钟自动清除剪贴板的内容。它使用 xclip 这个命令行工具、一个小脚本和 [cron][2]。cron 的一分钟间隔给你足够的时间来复制密码，然后它会清空剪贴板。它会每分钟重复，提供无忧复制。

我们需要使用 [xclip][3] 工具清除终端中的剪贴板。在基于 apt 的发行版中，输入：

**sudo apt-get install xclip** 

让我们在终端中测试程序。首先从其他地方复制一些文字，复制到其他地方，并输入这两条命令：

**touch blank
xclip -selection clipboard blank** 

接着再次尝试复制文本 - 它应该就会消失了。现在把命令放在脚本中。创建一个脚本（用你的文本编辑器代替 leafpad）：

**leafpad nukeclipboard.sh** 

并在新文件中输入下面的内容：

**#!/bin/sh
touch blank && xclip -selection clipboard blank** 

保存并关闭文件，接着加上可执行权限：

**chmod +x nukeclipboard.sh** 

现在让作业每分钟运行一次。首先要小心，不同的发行版有不同的 cron 选项。以下设置适用于 Ubuntu（基于）的发行版，并且在你的发行版中过程可能不同，因此[请阅读手册][4]。

要设置cron作业，请在终端输入：

**crontab -e** 

滚到最后被注释掉的行，并输入下面的行（将 /home/user/ 替换为你的脚本位置）：

*** * * * * export DISPLAY=:0 && /home/user/nukeclipboard.sh** 

现在按下 ctrl-o 打开保存功能，然后点击回车保存你的 crontab。最后，按下 ctrl-x 退出程序。从现在起，你的剪贴板的使用寿命为一分钟。

至于上面的 cron 条目。。。cron 有环境变量的限制，当它失败时，你可能要花一整天试着一百种方法来解决它。发现[快速修复][5]建议设置 DISPLAY，且没有更多的麻烦。感谢 [Mike Q][6] 的贡献。

现在，你可能会去粘贴你复制的东西，当剪贴板被清空，没有找到任何东西，但它是一个小的价格，支付的安全碰撞它给你。 如果这是一个问题，您可以配置cron以任何适合您的间隔运行作业。 Ubuntu和kin的说明在[这个] [7]页。

我希望这个教程能帮助你把剪贴板锁定下来 - 如果你有可以工作的脚本或者更好的方法，欢迎来做评论。

--------------------------------------------------------------------------------

via: https://www.darrentoback.com/your-computer-s-clipboard-is-a-security-problem-fix-it-in-linux-with-xsel-and-cron

作者：[dmt][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.darrentoback.com/about-me
[1]:https://github.com/astrand/xclip
[2]:https://en.wikipedia.org/wiki/Cron
[3]:https://github.com/astrand/xclip
[4]:https://en.wikipedia.org/wiki/Cron
[5]:https://stackoverflow.com/questions/14296911/when-linux-system-calls-scripts-some-commands-dont-work-cron-if-up-d/24070707#24070707
[6]:https://stackoverflow.com/users/1618630/mike-q
[7]:https://help.ubuntu.com/community/CronHowto
