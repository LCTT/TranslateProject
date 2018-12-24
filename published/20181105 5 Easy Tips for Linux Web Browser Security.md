提高 Linux 的网络浏览器安全性的 5 个建议
======
> 这些简单的步骤可以大大提高您的在线安全性。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cyber-security-20.jpg?itok=IkNDVnJr)

如果你使用 Linux 桌面但从来不使用网络浏览器，那你算得上是百里挑一。网络浏览器是绝大多数人最常用的工具之一，无论是工作、娱乐、看新闻、社交、理财，对网络浏览器的依赖都比本地应用要多得多。因此，我们需要知道如何使用网络浏览器才是安全的。一直以来都有不法的犯罪分子以及他们建立的网页试图窃取私密的信息。正是由于我们需要通过网络浏览器收发大量的敏感信息，安全性就更是至关重要。

对于用户来说，需要采取什么措施呢？在下文中，我会提出一些基本的建议，让你的重要数据不会被他人轻易窃取。尽管我用于演示的是 Firefox 网络浏览器，但其中大部分建议在任何一种网络浏览器当中都可以适用。

### 正确选择浏览器

尽管我提出的建议具有普适性，但是正确选择网络浏览器也是很必要的。网络浏览器的更新频率是它安全性的一个重要体现。网络浏览器会不断暴露出新的问题，因此版本越新的网络浏览器修复的问题就越多，也越安全。在主流的网络浏览器当中，2017 年版本更新的发布量排行榜如下：

1. Chrome 发布了 8 个更新（Chromium 全年跟进发布了大量安全补丁）。
2. Firefox 发布了 7 个更新。
3. Edge 发布了 2 个更新。
4. Safari 发布了 1 个更新（苹果也会每年发布 5 到 6 个安全补丁）。

网络浏览器会经常发布更新，同时用户也要及时升级到最新的版本，否则毫无意义了。尽管大部分流行的 Linux 发行版都会自动更新网络浏览器到最新版本，但还是有一些 Linux 发行版不会自动进行更新，所以最好还是手动保持浏览器更新到最新版本。这就意味着你所使用的 Linux 发行版对应的标准软件库中存放的很可能就不是最新版本的网络浏览器，在这种情况下，你可以随时从网络浏览器开发者提供的最新版本下载页中进行下载安装。

如果你是一个勇于探索的人，你还可以尝试使用测试版或者<ruby>每日构建<rt>daily build</rt></ruby>版的网络浏览器，不过，这些版本将伴随着不能稳定运行的可能性。在基于 Ubuntu 的发行版中，你可以使用到每日构建版的 Firefox，只需要执行以下命令添加所需的存储库：

```
sudo apt-add-repository ppa:ubuntu-mozilla-daily/ppa
```

按照以下命令更新 `apt` 并安装每日构建版 Firefox：

```
sudo apt-get update
sudo apt-get install firefox
```

最重要的事情就是永远不要让你的网络浏览器版本过时，必须使用最新版本的网络浏览器。就是这样。如果你没有跟上版本更新的脚步，你使用的将会是一个暴露着各种问题的浏览器。

### 使用隐私窗口

将网络浏览器更新到最新版本之后，又该如何使用呢？答案是使用隐私窗口，如果你确实很重视安全的话。隐私窗口不会保存你的数据：密码？cookie？缓存？历史？什么都不会保存。因此隐私窗口的一个显著缺点就是每次访问常用的网站或者服务时，都得重新输入密码才能登录使用。当然，如果你认为网络浏览器的安全性很重要，就永远都不要保存任何密码。

说到这里，我觉得每一个人都需要让自己的密码变得更强。事实上，大家都应该使用强密码，然后通过管理器来存储。而我的选择是[<ruby>通用密码管理器<rt>Universal Password Manager</rt></ruby>][1]。

### 保护好密码

有的人可能会认为，每次都需要重复输入密码，这样的操作太麻烦了。在 Firefox 中，如果你既想保护好自己的密码，又不想经常输入密码，就可以通过<ruby>主密码<rt>Master Password</rt></ruby>这一款内置的工具来实现你的需求。起用了这个工具之后，需要输入正确的主密码，才能后续使用保存在浏览器中的其它密码。你可以按照以下步骤进行操作：

1. 打开 Firefox。
2. 点击菜单按钮。
3. 点击“偏好设置”。
4. 在偏好设置页面，点击“隐私与安全”。
5. 在页面中勾选“使用主密码”选项（图 1）。
6. 确认以后，输入新的主密码（图 2）。
7. 重启 Firefox。

![Master Password][3]

*图 1： Firefox 偏好设置页中的主密码设置。*

![Setting password][6]

*图 2：在 Firefox 中设置主密码。*

### 了解你使用的扩展和插件

大多数网络浏览器在保护隐私方面都有很多扩展，你可以根据自己的需求选择不同的扩展。而我自己则选择了一下这些扩展：

* [Firefox Multi-Account Containers][7] —— 允许将某些站点配置为在容器化选项卡中打开。
* [Facebook Container][8] —— 始终在容器化选项卡中打开 Facebook（这个扩展需要 Firefox Multi-Account Containers）。
* [Avast Online Security][9] —— 识别并拦截已知的钓鱼网站，并显示网站的安全评级（由超过 4 亿用户的 Avast 社区支持）。
* [Mining Blocker][10] —— 拦截所有使用 CPU 的挖矿工具。
* [PassFF][11] —— 通过集成 `pass` （一个 UNIX 密码管理器）以安全存储密码。
* [Privacy Badger][12] —— 自动拦截网站跟踪。
* [uBlock Origin][13] —— 拦截已知的网站跟踪。

除此以外，以下这些浏览器还有很多安全方面的扩展：

+ [Firefox][2]
+ [Chrome、Chromium,、Vivaldi][5]
+ [Opera][14]

但并非每一个网络浏览器都会向用户提供扩展或插件。例如 Midoria 就只有少量可以开启或关闭的内置插件（图 3），同时这些轻量级浏览器的第三方插件也相当缺乏。

![Midori Browser][15]

*图 3：Midori 浏览器的插件窗口。*

### 虚拟化

如果担心数据在本地存储会被窃取，也可以在虚拟机上运行网络浏览器。只需要安装诸如 [VirtualBox][16] 的软件并安装 Linux 系统，然后就可以在虚拟机中运行任何一款浏览器了。再结合以上几条建议，基本可以保证一定的安全性。

### 事情的真相

实际上，如果你的机器连接到互联网，就永远不能保证 100% 的安全。当然，只要你正确地使用网络浏览器，你的安全系数会更高，数据也不会轻易被窃取。Linux 的一个好处是被安装恶意软件的几率比其它操作系统要低得多。另外，请记住要使用最新版本的网络浏览器、保持更新操作系统，并且谨慎访问一切网站。

你还可以通过 Linux 基金会和 edX 开办的 “[Linux 介绍][17]” 公开课学习到更多这方面的内容。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/11/5-easy-tips-linux-web-browser-security

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: http://upm.sourceforge.net/
[2]: https://addons.mozilla.org/en-US/firefox/search/?q=security
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/browsersecurity_1.jpg?itok=gHMPKEvr "Master Password"
[4]: https://www.linux.com/licenses/category/used-permission
[5]: https://chrome.google.com/webstore/search/security
[6]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/browsersecurity_2.jpg?itok=4L7DR2Ik "Setting password"
[7]: https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?src=search
[8]: https://addons.mozilla.org/en-US/firefox/addon/facebook-container/?src=search
[9]: https://addons.mozilla.org/en-US/firefox/addon/avast-online-security/?src=search
[10]: https://addons.mozilla.org/en-US/firefox/addon/miningblocker/?src=search
[11]: https://addons.mozilla.org/en-US/firefox/addon/passff/?src=search
[12]: https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/
[13]: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?src=search
[14]: https://addons.opera.com/en/search/?query=security
[15]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/browsersecurity_3.jpg?itok=hdNor0gw "Midori Browser"
[16]: https://www.virtualbox.org/
[17]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

