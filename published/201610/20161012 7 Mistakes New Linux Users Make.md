7 个 Linux 新手容易犯的错误
===================

换操作系统对每个人来说都是一件大事——尤其是许多用户根本不清楚操作系统是什么。

然而，从 Windows 切换到 Linux 特别地困难。这两个操作系统有着不同的前提和优先级，以及不同的处理方式。结果导致 Linux 新手容易混淆，因为他们在 Windows 上面得到经验不再适用。

例如，这里有 7 个 Windows “难民”开始使用 Linux 的时候会犯的错误（没有先后顺序）：

### 7. 选择错误的 Linux 发行版

Linux 有几百个不同的版本，或者按他们的称呼叫做发行版（distributions）。其中许多是专门针对不同的版本或用户的。选择了错误的版本，你与 Linux 的第一次亲密体验将很快变成一个噩梦。

如果你是在朋友的帮助下切换的话，确认他们的建议是适合你，而不是他们。有大量的文章可以帮助到你，你只需要关注前 20 名左右的或者列在 [Distrowatch][46] 的即可，就不太可能会搞错。

更好的做法是，在你安装某个发行版之前先试试它的 [Live DVD][45]。Live DVD 是在外设上运行发行版的，这样可以允许你在不对硬盘做任何改动的情况下对其进行测试。事实上，除非你知道怎么让硬盘在 Linux 下可访问，否则你是不会看到你的硬盘的。

### 6. 期待什么都是一样的

由于经验有限，许多 Windows 用户不知道新的操作系统意味着新的程序和新的处理方式。事实上你的 Windows 程序是无法在 Linux 上运行的，除非你用 [WINE][44] 或者 Windows 虚拟机。而且你还不能用 MS Office 或者 PhotoShop —— 你必须要学会使用 LibreOffice 和 Krita。经过这些年，这些应用可能会有和 Windows 上的应用类似的功能，但它们的功能可能具有不同的名称，并且会从不同的菜单或工具栏获得。

就连很多想当然的都不一样了。Windows 用户会特别容易因为他们有多个桌面环境可以选择而大吃一惊——至少有一个主要的和很多次要的桌面环境。

### 5. 安装软件的时候不知所措

在 Windows 上，新软件是作为一个完全独立的程序来安装的。通常它囊括了其它所需的依赖库。

有两种叫做 [Flatpak][43] 和 [Snap][42] 的软件包服务目前正在 Linux 上引进类似的安装系统，但是它们对于移动设备和嵌入式设备来说太大了。更多情况下，Linux 依赖于包管理系统，它会根据已安装的包来判断软件的依赖包是否是必需的，从而提供其它所需的依赖包。

笔记本和工作站上的包管理本质上相当于手机或平板电脑上的 Google Play：它速度很快，并且不需要用于安装的物理介质。不仅如此，它还可以节省 20%-35% 的硬盘空间，因为依赖包不会重复安装。

### 4. 假想软件会自动更新好

Linux 用户认为控制权很重要。Linux 提供更新服务，不过默认需要用户手动运行。例如，大多数发行版会让你知道有可用的软件更新，但是你需要选择安装这些更新。

如果你选择更新的话，你甚至可以单独决定每一个更新。例如，你可能不想更新到新的内核，因为你安装了一些东西需要使用当前的内核。又或者你想要安装所有的安全性更新，但不想把发行版更新到一个新的版本。一切都由你来选择。

### 3. 忘记密码

许多 Windows 用户因为登录不方便而忘记密码。又或者为了方便起见，经常运行一个管理账户。

在 Linux 上这两种做法都不容易。许多发行版使用 [sudo][41] 来避免以 root 登录，特别是那些基于 Ubuntu 的发行版，而其它发行版大多数是安装为禁止 root 运行图形界面。但是，如果你在 Linux 上成功绕开了这些限制，请注意你的大部分 Linux 安全性优势都会无效（其实在 Windows 上也不推荐这样做）。

对了，你是不是在安装程序上看到一个自动登录的选项？那是在不常用的情景下使用的，例如不包含隐私信息的虚拟机。

### 2. 担心没有碎片整理和杀毒软件

Linux 偶尔需要进行碎片整理，不过只有在恢复分区或者分区差不多满了的时候。并且由于固态硬盘越来越火，碎片整理正在变成过去时，尽管固态硬盘确实需要在任何操作系统上定期运行 [trim][40]。

同样地，只有当你安装的 Linux 经常传输文件给 Windows 机器的时候，杀毒软件才是一个主要问题。很少有 Linux 病毒或恶意软件存在，并且日常使用非 root 用户、使用强密码、经常备份当前文件就已经足够阻止病毒了。

### 1. 认为自己没有软件可用

Windows 上的软件是收费的，大多数类别由一家公司独占——例如，办公套装 MS Office 以及图形和设计的 Adobe。这些条件鼓励用户坚持使用相同的应用程序，尽管它们错漏百出。

在 Linux 上，故事情节不一样了。只有少数高端程序是收费的，而且几乎每一类软件都有两三个替代品，所有这些可用的软件都可以在 10 分钟或者更短的时间内下载好。如果一个替代品不合你口味，你可以删掉它然后毫不费力就可以再装一个其它的。在 Linux 上，你几乎总会有选择。

### 过渡期

可能没有那么多建议可以让 Windows 用户充分准备好切换到 Linux。即使说新用户应该保持开放的心态也是没什么用的，因为他们的期望总是太高，以至于许多用户都没有意识到自己有如此高的期望。

Linux 新手可以做的最好的事情就是调整心态，并且花一点时间来适应它们。过渡期会需要一些功夫，不过，从长远来看，你的多次尝试终会得到回报。

--------------------------------------------------------------------------------

via: http://www.datamation.com/open-source/7-mistakes-new-linux-users-make.html

作者：[Bruce Byfield][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.datamation.com/author/Bruce-Byfield-6030.html
[1]: https://www.youtube.com/channel/UCOfXyFkINXf_e9XNosTJZDw
[2]: https://www.youtube.com/user/desainew
[3]: https://www.youtube.com/channel/UCEQXp_fcqwPcqrzNtWJ1w9w
[4]: http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[5]: http://twitter.com/intent/tweet/?text=Is+Open+Source+Design+a+Thing%3F&url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[6]: https://plus.google.com/share?url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F
[7]: https://atom.io/
[8]: http://froont.com/
[9]: https://webflow.com/
[10]: https://gravit.io/
[11]: http://getbootstrap.com/
[12]: https://inkscape.org/en/
[13]: https://www.gimp.org/
[14]: https://en.wikipedia.org/wiki/Free_and_open-source_software
[15]: https://medium.com/dawn-capital/why-leverage-the-power-of-open-source-to-build-a-successful-software-business-8aba6f665bc4#.ggmn2ojxp
[16]: https://github.com/majutsushi/tagbar
[17]: http://ctags.sourceforge.net/
[18]: https://github.com/majutsushi/tagbar/zipball/70fix
[19]: https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
[20]: http://www.vim.org/scripts/script.php?script_id=2332
[21]: https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/
[22]: https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-delimitmate-help.png
[23]: https://github.com/Raimondi/delimitMate
[24]: https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-visibility.png
[25]: https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-ex2.png
[26]: https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-example.png
[27]: http://www.tldp.org/LDP/intro-linux/html/sect_06_02.html
[28]: http://majutsushi.github.io/tagbar/
[29]: http://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-plugin-managers
[30]: https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-vimrc.png
[31]: http://www.vim.org/
[32]: https://github.com/scrooloose/syntastic
[33]: https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
[34]: https://www.howtoforge.com/images/3337/big/syntastic-error-all-descr.png
[35]: https://www.howtoforge.com/images/3337/big/syntastic-error-descr.png
[36]: https://www.howtoforge.com/images/3337/big/syntastic-error-highlight.png
[37]: https://github.com/scrooloose/syntastic
[38]: http://www.vim.org/
[39]: https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers/
[40]: https://en.wikipedia.org/wiki/Trim_%28computing%29
[41]: https://en.wikipedia.org/wiki/Sudo
[42]: http://snapcraft.io/
[43]: http://flatpak.org/
[44]: https://en.wikipedia.org/wiki/Wine_%28software%29
[45]: https://en.wikipedia.org/wiki/Live_CD
[46]: http://distrowatch.com/