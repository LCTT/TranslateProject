爱Vim的7个原因
====================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUS_OpenSourceExperience_520x292_cm.png?itok=APna2N9Y)

当我刚刚开始用vi文本编辑器的时候，我厌恶它。我认为这是最痛苦和反人类的设计。但我决定我必须学习使用它，因为如果你使用的是Unix，vi无处不在并且是唯一一个保证你会使用的编辑器。在1998年是如此，但是直到今天vi也仍然是可用的，几乎每个现有的发行版中，vi基本上都是基础安装的一部分。

在我学会能使用任何功能前，我花费了1个月在Vi上，我仍然不喜欢它。但那时我意识到有个强大的编辑器隐藏在这个奇特的外表后面。所以我坚持使用它，并且最终发现一旦你知道你在干什么，它就是一个快的令人难以置信的编辑器。

“vi”这个名称是“visual”的缩写。在vi出现的时候，行编辑器是很普遍的，能共同显示和编辑多行是非同寻常的。Vim，“Vi IMproved”的缩写，最初由Bram Moolenaar发布于1991年，它成为了仿vi的主导软件并且扩展了这个强大的编辑器已有的功能。vim的强大的正则表达式和“：”命令行语法开始于行编辑和打印设备的世界。

Vim，有40年的历史了，有足够的时间发展一个巨大而又复杂的技巧，甚至最有知识的用户还不能完全掌握。这里列出了一些爱Vim的理由

1. 配色方案：你可能知道Vim有彩色语法高亮。但你知道可以下载数百个配色方案么？[在这找到些更好的][1]
2. 你再也不需要让你的手离开键盘或者去碰触鼠标
3. Vi或者Vim存在任何地方，甚至在[OpenWRT]也有vi（好吧，是其实是在[BusyBox][3]中，它挺好用的）。
4. Vimscript：你可能会想重映射几个键，但是你知道Vim有自己的编程语言么？你可以重写自己的编辑行为，或者创造特定语言的编辑器扩展。（最近我在和Ansible一起定制Vim的行为。）学习这个语言最佳的切入点是看Steve Losh著名的书[Learn Vimscript the Hard Way][4]。
5. Vim插件。使用[vundle][5]（我的选择）或者[Pathogen][6]来管理你的插件来增加你Vim的功能。
6. 可以将集成git（或者你选择的VCS）的插件插入到Vim。
7. 有庞大和活跃的在线社区，如果你在线上提问关于Vim的问题，它将很快被回答

我一开始讨厌vi的可笑之处在于，这5年来不断的尝试新的编辑器，总是想找到“一些更好的”。我Vi是我最讨厌的编辑器，现在我已经使用它17年了，因为我想象不到一个更好的编辑器。额，或许有稍微好一点的：可以尝试下Neovim-这是未来的主流。看起来Bram Moolenaar将会吧Neovim融入到Vim第8版中，这意味着将会在现有的代码基础上减少30%，更好的代码补全功能，真正的异步，内置终端，内置鼠标支持，完全兼容。

在他于多伦多的 [LinuxCon 演讲][7]中（译者注：LinuxCon 是Linux基金会举办的年度会议），Giles解释了一些在你可能错过的，过去四十年混乱的扩展和改进。这类不适合初学者，所以如果你不知道为什么“hjklia:wq”是很重要的，这就可能不是讲给你听的。它还会涉及一点关于vi的历史，因为知道一些历史能帮助我们理解我们现在所停留在的地方。参加他的演讲能帮助你使你最喜欢的编辑器更好更快。



--------------------------------------------------------------------------------

via: https://opensource.com/business/16/8/7-reasons-love-vim

作者：[Giles Orr][a]
译者：[hkurj](https://github.com/hkurj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gilesorr
[1]: http://www.gilesorr.com/blog/vim-colours.html
[2]: https://www.openwrt.org/
[3]: https://busybox.net/
[4]: http://learnvimscriptthehardway.stevelosh.com/
[5]: https://github.com/VundleVim/Vundle.vim
[6]: https://github.com/tpope/vim-pathogen
[7]: http://sched.co/7JWz
