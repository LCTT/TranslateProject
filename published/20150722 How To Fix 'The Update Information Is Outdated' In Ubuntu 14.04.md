Ubuntu 14.04中修复“update information is outdated”错误
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Fix_update_information_is_outdated.jpeg)

看到过Ubuntu 14.04的顶部面板上那个显示下面这个错误的红色三角形了吗？

> 更新信息过时。该错误可能是由网络问题，或者某个仓库不再可用而造成的。请通过从指示器菜单中选择‘显示更新’来手动更新，然后查看是否存在有失败的仓库。
> 

它看起来像这样：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Update_error_Ubuntu.jpeg)

这里的粉红色感叹号标记就是原来的红色三角形，因为我使用了[最佳的Ubuntu图标主题][1]之一，Numix。让我们回到该错误中，这是一个常见的更新问题，你也许时不时地会碰到它。现在，你或许想知道的是，到底是什么导致了这个更新错误的出现。

### 引起‘update information is outdated’错误的原因 ###

导致该错误的原因在其自身的错误描述中就讲得相当明白，它告诉你“这可能是由网络问题或者某个不再可用的仓库导致的”。所以，要么是你更新了系统和某些仓库，要么是PPA不再受到支持了，或者你正面对的类似问题。

虽然错误本身就讲得很明白，而它给出了的议操作“请通过从指示器菜单选择‘显示更新’来手动更新以查看失败的仓库”却并不能很好地解决问题。如果你点击显示更新，你所能看见的仅仅是系统已经更新。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/System_updated_Ubuntu.png)

很奇怪，不是吗？我们怎样才能找出是什么出错了，哪里出错了，以及为什么出错呢？

### 修复‘update information is outdated’错误 ###

这里讨论的‘解决方案’可能对Ubuntu的这些版本有用：Ubuntu 14.04,12.04。你所要做的仅仅是打开终端（Ctrl+Alt+T），然后使用下面的命令：

    sudo apt-get update

等待命令结束，然后查看其结果。这里插个快速提示，你可以[在终端中添加通知][2]，这样当一个耗时很长的命令结束执行时就会通知你。在该命令的最后几行中，可以看到你的系统正面临什么样的错误。是的，你肯定会看到一个错误。

在我这里，我看到了有名的[GPG error: The following could not be verified][3]错误。很明显，[在Ubuntu 15.04中安装声破天][4]有点问题。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Update_error_Ubuntu_1.jpeg)

很可能你看到的不是像我一样的GPG错误，那样的话，我建议你读一读我写的这篇文章[修复Ubuntu中的各种常见更新错误][5]。

我知道有不少人，尤其是初学者，很是讨厌命令行，但是如果你正在使用Linux，你就无可避免会使用到终端。此外，那东西并没你想象的那么可怕。试试吧，你会很快上手的。

我希望这个快速提示对于你修复Ubuntu中的“update information is outdated”错误有帮助。如果你有任何问题或建议，请不吝提出，我们将无任欢迎。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-update-information-outdated-ubuntu/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[2]:http://itsfoss.com/notification-terminal-command-completion-ubuntu/
[3]:http://itsfoss.com/solve-gpg-error-signatures-verified-ubuntu/
[4]:http://itsfoss.com/install-spotify-ubuntu-1504/
[5]:https://linux.cn/article-5603-1.html
