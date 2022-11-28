[#]: subject: "Fixing the “Pending Update of Firefox snap” Error in Ubuntu"
[#]: via: "https://itsfoss.com/pending-update-firefox-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14908-1.html"

修复 Ubuntu 中的 “Pending Update of Firefox snap” 错误
======

![](https://img.linux.net.cn/data/attachment/album/202208/08/154842wquoflgffwyyn2cw.jpg)

如果你使用的是 Ubuntu 22.04，你可能已收到过此通知。

![Notification about pending Firefox app][1]

它会通知你 Firefox 更新正在等待中，并要求你关闭应用以避免中断。

因此，就像一个听话的 Ubuntu 用户一样，你在保存或完成工作后关闭了 Firefox 浏览器。

你认为 Firefox 已在后台更新，重启浏览器将运行较新版本。

只是，并非如此。

**即使在你重启浏览器甚至计算机后，它仍可能显示相同的 “pending update of Firefox” 通知**。

令人沮丧么？我可以告诉你发生了什么。

让我解释一下为什么会发生这种情况，以及你可以做些什么来“修复”它。

### 修复 “pending update of Firefox snap” 问题

早些时候，Firefox 曾经在后台更新，然后要求你重启浏览器。在你重启浏览器之前 [不能][2] 打开任何网站。

![Firefox forced restart in the past][3]

在将 [Firefox 浏览器切换为默认 Snap 包格式][4] 后，Ubuntu 团队对更新流程进行了一些改动。

此通知是“改进的用户体验”的一部分。现在，Firefox 不再阻止你浏览。你可以在方便时重新启动浏览器以进行更新。

但是为什么即使在你重新启动浏览器或系统后它仍然显示这个通知？

因为这是一条糟糕的通知消息，无法为你提供完整的信息。

#### Firefox 更新还没有开始

当你看到 “pending Firefox update” 时，你错误地认为应用已在后台更新，重启会将其升级到较新的版本。

而对于现在这种情况，Ubuntu 中的 Snap 包每天会自动刷新（更新）一次或几次。为了避免在重新启动安装更新之前 Firefox 不允许你浏览任何内容而导致工作中断，Ubuntu 甚至不会在后台更新 Firefox Snap 包。

相反，当 Snap 包刷新时，**它会显示通知并希望你立即关闭浏览器**，以便可以使用其他 Snap 包进行更新。

但像你我这样的用户不能这样做，对吧？看到通知，立即关闭浏览器？并不是很方便。

而当你有时间关闭浏览器时，Snap 刷新却不会马上更新浏览器。

你可以看到更新的 Snap 版本的 Firefox 可用，但只要 Firefox 正在运行，它就不会自动安装。

![Firefox snap won’t be updated automatically if the browser is running][5]

#### 更新 Firefox Snap

这是你摆脱每天不断出现的更新通知所需要做的事情。

* 关闭 Firefox 浏览器
* 手动运行 Snap 刷新（更新已安装的 Snap 包）

确保你在 Firefox 浏览器中的工作已保存。现在，使用鼠标关闭所有 Firefox 浏览器或在终端中运行以下命令：

```
sudo killall firefox
```

现在 Firefox 不再运行，更新 Snap 软件包：

```
sudo snap refresh
```

你会看到它开始下载更新的 Firefox 包。

![Firefox is being updated with Snap][6]

更新完成后，你将看到 Firefox 已升级到更新版本的摘要信息。

![Updated Firefox snap version][7]

### 总结

安装非 Snap 版本的 Firefox 也可能是个解决方案，但不是每个人都可以走这条路。

Firefox 和 Snap 的开发人员必须齐心协力改进这个模棱两可的更新过程。他们应该提供更好的机制，不仅显示待处理更新的通知，还提供启动更新的选项。

这是我们最近在 Ubuntu 上看到的许多奇怪的事情之一。这必须改变才能使 Ubuntu （再次）成为一个对初学者友好的发行版。

--------------------------------------------------------------------------------

via: https://itsfoss.com/pending-update-firefox-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/pending-update-firefox-ubuntu.png
[2]: https://news.itsfoss.com/mozilla-annoying-new-tab/
[3]: https://itsfoss.com/wp-content/uploads/2022/07/firefox-restart.webp
[4]: https://news.itsfoss.com/ubuntu-firefox-snap-default/
[5]: https://itsfoss.com/wp-content/uploads/2022/07/pending-Firefox-update-issue-Ubuntu.png
[6]: https://itsfoss.com/wp-content/uploads/2022/07/updating-firefox-snap-package-ubuntu.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/firefox-snap-update-ubuntu.png
