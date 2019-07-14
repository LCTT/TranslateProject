[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10567-1.html)
[#]: subject: (Get started with gPodder, an open source podcast client)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-gpodder)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 gPodder 吧，一个开源播客客户端
======

> 使用 gPodder 将你的播客同步到你的设备上，gPodder 是我们开源工具系列中的第 17 个工具，它将在 2019 年提高你的工作效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/podcast-record-microphone.png?itok=8yUDOywf)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第 17 个工具来帮助你在 2019 年更有效率。

### gPodder

我喜欢播客。哎呀，我非常喜欢它们，因此我录制了其中的三个（你可以在[我的个人资料][1]中找到它们的链接）。我从播客那里学到了很多东西，并在我工作时在后台播放它们。但是，如何在多台桌面和移动设备之间保持同步可能会有一些挑战。

[gPodder][2] 是一个简单的跨平台播客下载器、播放器和同步工具。它支持 RSS feed、[FeedBurner][3]、[YouTube][4] 和 [SoundCloud][5]，它还有一个开源的同步服务，你可以根据需要运行它。gPodder 不直接播放播客。相反，它会使用你选择的音频或视频播放器。

![](https://opensource.com/sites/default/files/uploads/gpodder-1.png)

安装 gPodder 非常简单。安装程序适用于 Windows 和 MacOS，同时也有用于主要的 Linux 发行版的软件包。如果你的发行版中没有它，你可以直接从 Git 下载运行。通过 “Add Podcasts via URL” 菜单，你可以输入播客的 RSS 源 URL 或其他服务的 “特殊” URL。gPodder 将获取节目列表并显示一个对话框，你可以在其中选择要下载的节目或在列表上标记旧节目。

![](https://opensource.com/sites/default/files/uploads/gpodder-2.png)

它一个更好的功能是，如果 URL 已经在你的剪贴板中，gPodder 会自动将它放入播放 URL 中，这样你就可以很容易地将新的播客添加到列表中。如果你已有播客 feed 的 OPML 文件，那么可以上传并导入它。还有一个发现选项，让你可搜索 [gPodder.net][6] 上的播客，这是由编写和维护 gPodder 的人员提供的自由及开源的播客的列表网站。

![](https://opensource.com/sites/default/files/uploads/gpodder-3.png)

[mygpo][7] 服务器在设备之间同步播客。gPodder 默认使用 [gPodder.net][8] 的服务器，但是如果你想要运行自己的服务器，那么可以在配置文件中更改它（请注意，你需要直接修改配置文件）。同步能让你在桌面和移动设备之间保持列表一致。如果你在多个设备上收听播客（例如，我在我的工作电脑、家用电脑和手机上收听），这会非常有用，因为这意味着无论你身在何处，你都拥有最近的播客和节目列表而无需一次又一次地设置。

![](https://opensource.com/sites/default/files/uploads/gpodder-4.png)

单击播客节目将显示与其关联的文本，单击“播放”将启动设备的默认音频或视频播放器。如果要使用默认之外的其他播放器，可以在 gPodder 的配置设置中更改此设置。

通过 gPodder，你可以轻松查找、下载和收听播客，在设备之间同步这些播客，在易于使用的界面中访问许多其他功能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-gpodder

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/users/ksonney
[2]: https://gpodder.github.io/
[3]: https://feedburner.google.com/
[4]: https://youtube.com
[5]: https://soundcloud.com/
[6]: http://gpodder.net
[7]: https://github.com/gpodder/mygpo
[8]: http://gPodder.net
