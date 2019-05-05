[#]: collector: (lujun9972)
[#]: translator: (Moelf)
[#]: reviewer: (acyanbird, wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10714-1.html)
[#]: subject: (A Look Back at the History of Firefox)
[#]: via: (https://itsfoss.com/history-of-firefox)
[#]: author: (John Paul https://itsfoss.com/author/john/)

回顾 Firefox 历史
======

从很久之前开始，火狐浏览器就一直是开源社区的一根顶梁柱。这些年来它几乎是所有 Linux 发行版的默认浏览器，并且曾是阻挡微软彻底争霸浏览器界的最后一块磐石。这款浏览器的起源可以一直回溯到互联网创生的时代。本周（LCTT 译注：此文发布于 2019.3.14）是互联网成立 30 周年的纪念日，趁这个机会回顾一下我们熟悉并爱戴的火狐浏览器实在是再好不过了。

### 发源

在上世纪 90 年代早期，一个叫 [Marc Andreessen][1] 的年轻人正在伊利诺伊大学攻读计算机科学学士学位。在那里，他开始为[国家超算应用中心（NCSA）][2]工作。就在这段时间内，<ruby>[蒂姆·伯纳斯·李][3]<rt>Tim Berners-Lee</rt></ruby> 爵士发布了今天已经为我们所熟知的 Web 的早期标准。Marc 在那时候[了解][4]到了一款叫 [ViolaWWW][5] 的化石级浏览器。Marc 和 Eric Bina 看到了这种技术的潜力，他们开发了一个易于安装的基于 Unix 平台的浏览器，并取名 [NCSA Mosaic][6]。第一个 alpha 版本发布于 1993 年 6 月。到 9 月的时候，浏览器已经有 Windows 和 Macintosh 移植版本了。因为比当时其他任何浏览器软件都易于使用，Mosaic 很快变得相当流行。

1994 年，Marc 毕业并移居到加州。一个叫 Jim Clark 的人结识了他，Clark 那时候通过卖电脑软硬件赚了点钱。Clark 也用过 Mosaic 浏览器并且看到了互联网的经济前景。Clark 创立了一家公司并且雇了 Marc 和 Eric 专做互联网软件。公司一开始叫 “Mosaic 通讯”，但是伊利诺伊大学并不喜欢他们用 [Mosaic 这个名字][7]。所以公司转而改名为 “<ruby>网景<rt>Netscape</rt></ruby>通讯”。

该公司的第一个项目是给任天堂 64 开发在线对战网络，然而不怎么成功。他们第一个以公司名义发布的产品是一款叫做 Mosaic Netscape 0.9 的浏览器，很快这款浏览器被改名叫 Netscape Navigator。在内部，浏览器的开发代号就是 mozilla，意即 “Mosaic 杀手”。一位员工还创作了一幅[哥斯拉风格的][8]卡通画。他们当时想在竞争中彻底胜出。

![Early Firefox Mascot][9]

*早期 Mozilla 在 Netscape 的吉祥物*

他们取得了辉煌的胜利。那时，Netscape 最大的优势是他们的浏览器在各种操作系统上体验极为一致。Netscape 将其宣传为给所有人平等的互联网体验。

随着越来越多的人使用 Netscape Navigator，NCSA Mosaic 的市场份额逐步下降。到了 1995 年，Netscape 公开上市了。[上市首日][10]，股价从开盘的 $28，直窜到 $78，收盘于 $58。Netscape 那时所向披靡。

但好景不长。在 1994 年的夏天，微软发布了 Internet Explorer 1.0，这款浏览器基于 Spyglass Mosaic，而后者又直接基于 NCSA Mosaic。[浏览器战争][11] 就此展开。

在接下来的几年里，Netscape 和微软就浏览器霸主地位展开斗争。他们各自加入了很多新特性以取得优势。不幸的是，IE 有和 Windows 操作系统捆绑的巨大优势。更甚于此，微软也有更多的程序员和资本可以调动。在 1997 年年底，Netscape 公司开始遇到财务问题。

### 迈向开源

![Mozilla Firefox][12]

1998 年 1 月，Netscape 开源了 Netscape Communicator 4.0 软件套装的代码。[旨在][13] “集合互联网成千上万的程序员的才智，把最好的功能加入 Netscape 的软件。这一策略旨在加速开发，并且让 Netscape 在未来能向个人和商业用户免费提供高质量的 Netscape Communicator 版本”。

这个项目由新创立的 Mozilla 机构管理。然而，Netscape Communicator 4.0 的代码由于大小和复杂程度而很难开发。雪上加霜的是，浏览器的一些组件由于第三方的许可证问题而不能被开源。到头来，他们决定用新兴的 [Gecko][14] 渲染引擎重新开发浏览器。

到了 1998 年的 11 月，Netscape 被美国在线（AOL）以[价值 42 亿美元的股权][15]收购。

从头来过是一项艰巨的任务。Mozilla Firefox（最初名为 Phoenix）直到 2002 年 6 月才面世，它同样可以运行在多种操作系统上：Linux、Mac OS、Windows 和 Solaris。

1999 年，AOL 宣布他们将停止浏览器开发。随后创建了 Mozilla 基金会，用于管理 Mozilla 的商标和项目相关的融资事宜。最早 Mozilla 基金会从 AOL、IBM、Sun Microsystems 和红帽（Red Hat）收到了总计 200 万美金的捐赠。

到了 2003 年 3 月，因为套件越来越臃肿，Mozilla [宣布][16] 计划把该套件分割成单独的应用。这个单独的浏览器一开始起名 Phoenix。但是由于和 BIOS 制造企业凤凰科技的商标官司，浏览器改名 Firebird（火鸟） —— 结果和火鸟数据库的开发者又起了冲突。浏览器只能再次被重命名，才有了现在家喻户晓的 Firefox（火狐）。

那时，[Mozilla 说][17]，”我们在过去一年里学到了很多关于起名的技巧（不是因为我们愿意才学的）。我们现在很小心地研究了名字，确保不会再有什么夭蛾子了。我们已经开始向美国专利商标局注册我们新商标”。

![Mozilla Firefox 1.0][18]

*Firefox 1.0 : [图片致谢][19]*

第一个正式的 Firefox 版本是 [0.8][20]，发布于 2004 年 2 月 8 日。紧接着 11 月 9 日他们发布了 1.0 版本。2.0 和 3.0 版本分别在 06 年 10 月 和 08 年 6 月问世。每个大版本更新都带来了很多新的特性和提升。从很多角度上讲，Firefox 都领先 IE 不少，无论是功能还是技术先进性，即便如此 IE 还是有更多用户。

一切都在 Google 发布 Chrome 浏览器的时候改变了。在 Chrome 发布（2008 年 9 月）的前几个月，Firefox 占有 30% 的[浏览器份额][21] 而 IE 有超过 60%。而在 StatCounter 的 [2019 年 1 月][22]报告里，Firefox 有不到 10% 的份额，而 Chrome 有超过 70%。

> 趣味知识点

> 和大家以为的不一样，火狐的 logo 其实没有狐狸。那其实是个 <ruby>[小熊猫][23]<rt>Red Panda</rt></ruby>。在中文里，“火狐狸”是小熊猫的另一个名字。

### 展望未来

如上文所说的一样，Firefox 正在经历很长一段以来的份额低谷。曾经有那么一段时间，有很多浏览器都基于 Firefox 开发，比如早期的 [Flock 浏览器][24]。而现在大多数浏览器都基于谷歌的技术了，比如 Opera 和 Vivaldi。甚至连微软都放弃开发自己的浏览器而转而[加入 Chromium 帮派][25]。

这也许看起来和 Netscape 当年的辉煌形成鲜明的对比。但让我们不要忘记 Firefox 已经有的许多成就。一群来自世界各地的程序员，就这么开发出了这个星球上第二大份额的浏览器。他们在微软垄断如日中天的时候还占据这 30% 的份额，他们可以再次做到这一点。无论如何，他们都有我们。开源社区坚定地站在他们身后。

抗争垄断是我使用 Firefox [的众多原因之一][26]。随着 Mozilla 在改头换面的 [Firefox Quantum][27] 上赢回了一些份额，我相信它将一路向上攀爬。

你还想了解 Linux 和开源历史上的什么其他事件？欢迎在评论区告诉我们。

如果你觉得这篇文章不错，请在社交媒体上分享！比如 Hacker News 或者 [Reddit][28]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/history-of-firefox

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[Moelf](https://github.com/Moelf)
校对：[acyanbird](https://github.com/acyanbird), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Marc_Andreessen
[2]: https://en.wikipedia.org/wiki/National_Center_for_Supercomputing_Applications
[3]: https://en.wikipedia.org/wiki/Tim_Berners-Lee
[4]: https://www.w3.org/DesignIssues/TimBook-old/History.html
[5]: http://viola.org/
[6]: https://en.wikipedia.org/wiki/Mosaic_(web_browser)
[7]: http://www.computinghistory.org.uk/det/1789/Marc-Andreessen/
[8]: http://www.davetitus.com/mozilla/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/Mozilla_boxing.jpg?ssl=1
[10]: https://www.marketwatch.com/story/netscape-ipo-ignited-the-boom-taught-some-hard-lessons-20058518550
[11]: https://en.wikipedia.org/wiki/Browser_wars
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/mozilla-firefox.jpg?resize=800%2C450&ssl=1
[13]: https://web.archive.org/web/20021001071727/wp.netscape.com/newsref/pr/newsrelease558.html
[14]: https://en.wikipedia.org/wiki/Gecko_(software)
[15]: http://news.cnet.com/2100-1023-218360.html
[16]: https://web.archive.org/web/20050618000315/http://www.mozilla.org/roadmap/roadmap-02-Apr-2003.html
[17]: https://www-archive.mozilla.org/projects/firefox/firefox-name-faq.html
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/firefox-1.jpg?ssl=1
[19]: https://www.iceni.com/blog/firefox-1-0-introduced-2004/
[20]: https://en.wikipedia.org/wiki/Firefox_version_history
[21]: https://en.wikipedia.org/wiki/Usage_share_of_web_browsers
[22]: http://gs.statcounter.com/browser-market-share/desktop/worldwide/#monthly-201901-201901-bar
[23]: https://en.wikipedia.org/wiki/Red_panda
[24]: https://en.wikipedia.org/wiki/Flock_(web_browser)
[25]: https://www.windowscentral.com/microsoft-building-chromium-powered-web-browser-windows-10
[26]: https://itsfoss.com/why-firefox/
[27]: https://itsfoss.com/firefox-quantum-ubuntu/
[28]: http://reddit.com/r/linuxusersgroup
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/mozilla-firefox.jpg?fit=800%2C450&ssl=1
