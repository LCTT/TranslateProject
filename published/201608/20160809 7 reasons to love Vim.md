爱 Vim 的七个理由
====================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUS_OpenSourceExperience_520x292_cm.png?itok=APna2N9Y)

当我刚刚开始用 vi 文本编辑器的时候，我憎恨它！我认为这是有史以来设计上最痛苦和反人类的编辑器。但我还是决定我必须学会它，因为如果你使用的是 Unix，vi 无处不在并且是唯一一个保证你可以使用的编辑器。在 1998 年是如此，但是直到今天 vi 也仍然是可用的，现有的几乎每个发行版中，vi 基本上都是基础安装的一部分。

在我学会能使用任何功能前，我已经在 vi 上花费差不多 1 个月的时间，但是我仍然不喜欢它。不过那时我已经意识到有个强大的编辑器隐藏在这个古怪的外表后面。所以我坚持使用它，并且最终发现一旦你知道你在干什么，它就是一个快的令人难以置信的编辑器。

“vi” 这个名称是 “可视（visual）” 的缩写。在 vi 出现的时候，行编辑器是很普遍的，能一次性显示并编辑多个行是非同寻常的。Vim，来自“Vi IMproved”的缩写，最初由 Bram Moolenaar 发布于 1991 年，它成为了主要的仿 vi 软件，并且扩展了这个强大的编辑器已有的功能。Vim 强大的正则表达式和“:”命令行语法开始于行编辑和电传打字机时代。

Vim，有 40 年的历史了，有足够的时间发展出海量而复杂的技巧，即使是懂得最多的用户都不能完全掌握它。这里列出了一些爱 Vim 的理由：

1. 配色方案：你可能知道 Vim 有彩色语法高亮。但你知道可以下载数以百计的配色方案么？[在这找到些更好的][1]。
2. 你再也不需要让你的手离开键盘或者去碰触鼠标。
3. Vi 或者 Vim 存在任何地方，甚至在 [OpenWRT][2] 里面也有 vi（好吧，其实是在 [BusyBox][3]中，它挺好用的）。
4. Vimscript：你可能会想重映射几个键，但是你知道 Vim 有自己的编程语言么？你可以重新定义你的编辑器的行为，或者创造特定语言的编辑器扩展。（最近我在定制 Vim 用于 Ansible 的行为。）学习这个语言最佳的切入点是看 Steve Losh 著名的书《[Learn Vimscript the Hard Way][4]》。
5. Vim 有插件。使用 [vundle][5]（我用的就是它）或者 [Pathogen][6] 来管理你的插件来提升 Vim 的功能。
6. 插件可以将 git（或者你选择的 VCS）集成到 Vim 中。
7. 有庞大而活跃的线上社区，如果你在线上提问关于 Vim 的问题，肯定会有人回答。

我一开始讨厌 vi 的可笑之处在于，这 5 年来不断的在尝试新的编辑器中碰壁，总是想找到“一些更好的”。我从来没有像讨厌 vi 一样讨厌过其它的编辑器，现在我已经使用它 17 年了，因为我想象不出一个更好的编辑器。额，或许有稍微好一点的：可以尝试下 Neovim -这是未来的主流。看起来 Bram Moolenaar 将会把 Neovim 的大部分融入到 Vim 第 8 版中，这意味着将会在现有的代码基础上减少 30%、更好的代码补全功能、真正的异步、内置终端、内置鼠标支持、完全兼容。

*在本文作者在多伦多的 [LinuxCon 演讲][7]中（LCTT 译注：LinuxCon 是 Linux 基金会举办的年度会议），他解释了一些在你可能错过的、过去四十年增加的杂乱的扩展和改进。这个内容不适合初学者，所以如果你不知道为什么“hjklia:wq”是很重要的，这就可能不是讲给你听的。它还会涉及一点关于 vi 的历史，因为知道一些历史能帮助我们理解我们的处境。关注他的演讲能让你知道如何使你最喜欢的编辑器更好更快。*

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/8/7-reasons-love-vim

作者：[Giles Orr][a]
译者：[hkurj](https://github.com/hkurj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gilesorr
[1]: http://www.gilesorr.com/blog/vim-colours.html
[2]: https://www.openwrt.org/
[3]: https://busybox.net/
[4]: http://learnvimscriptthehardway.stevelosh.com/
[5]: https://github.com/VundleVim/Vundle.vim
[6]: https://github.com/tpope/vim-pathogen
[7]: http://sched.co/7JWz
