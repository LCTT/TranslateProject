[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10629-1.html)
[#]: subject: (How To Fix “Network Protocol Error” On Mozilla Firefox)
[#]: via: (https://www.ostechnix.com/how-to-fix-network-protocol-error-on-mozilla-firefox/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何修复 Mozilla Firefox 中出现的 “Network Protocol Error” 
======

![](https://www.ostechnix.com/wp-content/uploads/2019/03/firefox-logo-1-720x340.png)

Mozilla Firefox 多年来一直是我的默认 Web 浏览器，我每天用它来进行日常网络活动，例如访问邮件，浏览喜欢的网站等。今天，我在使用 Firefox 时遇到了一个奇怪的错误。我试图在 Reddit 平台上分享我们的一个指南时，在 Firefox 上出现了以下错误消息：

> Network Protocol Error

> Firefox has experienced a network protocol violation that cannot be repaired.

> The page you are trying to view cannot be shown because an error in the network protocol was detected.

> Please contact the website owners to inform them of this problem.

![](https://www.ostechnix.com/wp-content/uploads/2019/03/firefox.png)

老实说，我有点慌，我以为可能是我的系统受到了某种恶意软件的影响。哈哈！但是我发现我错了。我在 Arch Linux 桌面上使用的是最新的 Firefox 版本，我在 Chromium 浏览器中打开了相同的链接，它正确显示了，我猜这是 Firefox 相关的错误。在谷歌上搜索后，我解决了这个问题，如下所述。

出现这种问题主要是因为“浏览器缓存”，如果你遇到此类错误，例如 “Network Protocol Error” 或 “Corrupted Content Error”，遵循以下任何一种方法。

**方法 1：**

要修复 “Network Protocol Error” 或 “Corrupted Content Error”，你需要在重新加载网页时绕过缓存。为此，按下 `Ctrl + F5` 或 `Ctrl + Shift + R` 快捷键，它将从服务器重新加载页面，而不是从 Firefox 缓存加载。这样网页就应该可以正常工作了。

**方法 2：**

如果方法 1 不起作用，尝试以下方法。

打开 “Edit - > Preferences”，在 “Preferences” 窗口中，打开左窗格中的 “Privacy & Security” 选项卡，单击 “Clear Data” 选项清除 Firefox 缓存。

![](https://www.ostechnix.com/wp-content/uploads/2019/03/firefox-1.png) 

确保你选中了 “Cookies and Site Data” 和 “Cached Web Content” 选项，然后单击 “Clear”。

![](https://www.ostechnix.com/wp-content/uploads/2019/03/firefox-2.png)

完成！现在 Cookie 和离线内容将被删除。注意，Firefox 可能会将你从登录的网站中注销，稍后你可以重新登录这些网站。最后，关闭 Firefox 浏览器并重新启动系统。现在网页加载没有任何问题。

希望这对你有帮助。更多好东西要来了，敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-fix-network-protocol-error-on-mozilla-firefox/

作者：[SK][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
