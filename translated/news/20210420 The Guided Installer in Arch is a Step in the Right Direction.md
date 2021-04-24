[#]: subject: (The Guided Installer in Arch is a Step in the Right Direction)
[#]: via: (https://news.itsfoss.com/arch-new-guided-installer/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (Kevin3599 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Arch Linux中的引导式安装程序是迈向正确的一步
======

20年来，Arch Linux为用户提供了完全定制和独特的系统的权限。多年来，它以牺牲用户友好性为代价赢得了在定制方面独有的声誉。

作为滚动发行版本，Arch Linux不提供任何固定发行版本，而是每月更新一次。但是，如果您在最近几周下载了Arch Linux，那么您很可能已经注意到了一个新的附加功能：archinstall。它使Arch Linux更加易于安装。

![][3]

今天，我将探讨archinstall 的发布对未来的Arch Linux项目和发行版意味着什么。

### Arch Linux新的发展方向？
![][4]

尽管很多人对此感到惊讶，但默认情况下包含官方安装程序实际上是非常明智的举动。这意味着ArchLinux的发展方向发生变化，即在保留使其知名的定制性和用户独特性的同时更加侧重用户的易用性。

在该安装程式的GitHub页面上有这样的描述：

> “引导性安装程式会给用户提供一个友好的安装方式，但是关键在于这个安装程式是选择性的，它是可选的并且永远不会强迫用户使用其进行安装。”

这意味着新的安装程式不会影响高级的进阶用户，同时也使得其可以向更广泛的受众开放，在这一改动所带来的许多优点之中，一个显著的优点即是：更广泛的用户。

更多的用户意味着更多的项目，不管其是通过网络捐赠或在Arch Linux下的开发，通过这些项目贡献，不管是新用户还是有经验的用户的使用体验都会得到提升。

### “这必然要发生”

回顾过去，我们可以看到安装介质的许多新增功能对新用户有所帮助。这些示例包括pacstrap（安装基本系统的工具）和反射器（查找最佳pacman镜像的工具）。

另外，多年来，用户一直在追求使用脚本安装的方法，新安装程序允许了用户使用安装脚本。同时能够使用Python编写脚本，这使管理员的部署更加容易，这使其成为非常有吸引力的选择。更多可定制性（以某种方式？）

尽管这看上去可能有些反直觉，但是这个安装程式很可能能够增进Arch Linux的可定制性。当前，Arch定制性的最大瓶颈是用户的技术水平，而这一问题能够通过archinstall解决。

通过由ArchLinux提供的安装程序，用户不需要掌握创建完美开发环境的技巧，安装程序可以帮助用户完成这些工作，这提供了广泛的自定义选项，是普通用户难以实现的。

###思想总结

有了这一新功能，Arch Linux似乎正在向着“用户友好”这一软件设计哲学靠近，新安装程序为新手和高级用户提供了广泛的好处。其中包括更广泛的定制性和更大的用户社区。

总而言之，这个新变动对整个ArchLinux社区都会产生积极的影响。

你对这个Arch Linux安装程式怎么看？是否已经尝试过它了呢？

###

![][7]
我不感兴趣

#### 关联

  * 通过最新的ISO刷新中的更改，现在更容易安装Arch Linux
  * ![][8] ![][9]


  * EndeavourOS的2021年第一个版本带来了Linux内核5.10 LTS，Xfce 4.16等[10]
  * ![][8] ![][11]


  * Linux Kernel 5.9终止了生命。这就是您现在应该做的！
  * ![][8] ![Linux kernel 5.9 reached end of life][13]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/arch-new-guided-installer/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[Kevin3599](https://github.com/)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/rolling-release/
[2]: https://news.itsfoss.com/arch-linux-easy-install/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQxMScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzM3MScgd2lkdGg9JzM3MScgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[5]: https://man.archlinux.org/man/pacstrap.8
[6]: https://wiki.archlinux.org/index.php/Reflector
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzI1MCcgd2lkdGg9Jzc1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[9]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/arch-linux-easy-install-feat.png?fit=1200%2C675&ssl=1&resize=350%2C200
[10]: https://news.itsfoss.com/endeavouros-2021-release/
[11]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/02/endeavouros-2021-ft.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
[12]: https://news.itsfoss.com/kernel-5-9-end-of-life/
[13]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/linux-kerne-5-9-eol.png?fit=1200%2C675&ssl=1&resize=350%2C200
