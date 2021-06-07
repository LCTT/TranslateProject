Flash Player 的两种开源替代方案
======
> Adobe 将于 2020 年终止对 Flash 媒体播放器的支持，但仍有很多人们希望访问的 Flash 视频。这里有两个开源的替代品或许可以帮到你。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bulb-light-energy-power-idea.png?itok=zTEEmTZB)

2017 年 7 月，Adobe 为 Flash Media Player 敲响了[丧钟][1]，宣布将在 2020 年终止对曾经无处不在的在线视频播放器的支持。但事实上，在一系列损害了其声誉的零日攻击后，Flash 的份额在过去的 8 年一直在下跌。苹果公司在 2010 年宣布它不会支持这项技术后，其未来趋于黯淡，并且在谷歌停止在 Chrome 浏览器中默认启用 Flash（支持 HTML5）后，它的消亡在 2016 年进一步加速。

即便如此，Adobe 仍然每月发布该软件的更新，截至 2018 年 8 月，它在网站的使用率从 2011 年的 28.5% 下降到[仅 4.4％] [2]。还有更多证据表明 Flash 的下滑：谷歌工程总监 [Parisa Tabriz 说][3]通过浏览器访问 Flash 内容的 Chrome 用户数量从 2014 年的 80％ 下降到 2018 年的 8％。

尽管如今很少有视频创作者以 Flash 格式发布，但仍有很多人们希望在未来几年内访问的 Flash 视频。鉴于官方支持的日期已经屈指可数，开源软件创建者有很好的机会涉足 Adobe Flash 媒体播放器的替代品。这其中两个应用是 Lightspark 和 GNU Gnash。它们都不是完美的替代品，但来自贡献者的帮助可以使它们成为可行的替代品。

### Lightspark

[Lightspark][4] 是 Linux 上的 Flash Player 替代品。虽然它仍处于 alpha 状态，但自从 Adobe 在 2017 宣布废弃 Adobe 以来，开发速度已经加快。据其网站称，Lightspark 实现了 60% 的 Flash API，可在许多流行网站包括 BBC 新闻、Google Play 音乐和亚马逊音乐上[使用][5]。

Lightspark 是用 C++/C 编写的，并在 [LGPLv3][6] 下许可。该项目列出了 41 个贡献者，并正在积极征求错误报告和其他贡献。有关更多信息，请查看其 [GitHub 仓库][5]。

### GNU Gnash

[GNU Gnash][7] 是一个用于 GNU/Linux 操作系统，包括 Ubuntu、Fedora 和 Debian 的 Flash Player。它作为独立软件和插件可用于 Firefox 和 Konqueror 浏览器中。

Gnash 的主要缺点是它不支持最新版本的 Flash 文件 —— 它支持大多数 Flash SWF v7 功能，一些 v8 和 v9 功能，不支持 v10 文件。它处于测试阶段，由于它在 [GNU GPLv3 或更高版本][8]下许可，因此你可以帮助实现它的现代化。访问其[项目页面][9]获取更多信息。

### 想要创建 Flash 吗？

仅因为大多数人都不会发布 Flash 视频，但这并不意味着永远不需要创建 SWF 文件。如果你发现自己需要，这两个开源工具可能会有所帮助：

* [Motion-Twin ActionScript 2 编译器][10]（MTASC）：一个命令行编译器，它可以在没有 Adobe Animate（Adobe 当前的视频创建软件）的情况下生成 SWF 文件。
* [Ming][11]：用 C 编写的可以生成 SWF 文件的库。它还包含一些可用于处理 Flash 的[程序][12]。


--------------------------------------------------------------------------------

via: https://opensource.com/alternatives/flash-media-player

作者：[Opensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com
[1]: https://theblog.adobe.com/adobe-flash-update/
[2]: https://w3techs.com/technologies/details/cp-flash/all/all
[3]: https://www.bleepingcomputer.com/news/security/google-chrome-flash-usage-declines-from-80-percent-in-2014-to-under-8-percent-today/
[4]: http://lightspark.github.io/
[5]: https://github.com/lightspark/lightspark/wiki/Site-Support
[6]: https://github.com/lightspark/lightspark/blob/master/COPYING
[7]: https://www.gnu.org/software/gnash/
[8]: http://www.gnu.org/licenses/gpl-3.0.html
[9]: http://savannah.gnu.org/projects/gnash/
[10]: http://tech.motion-twin.com/mtasc.html
[11]: http://www.libming.org/
[12]: http://www.libming.org/WhatsIncluded
