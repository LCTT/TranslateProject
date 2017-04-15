3 个开源的链接缩短器
============================================================

> 想要构建你自己的 URL 缩短器？这些开源项目使这个变得简单。

![3 open source link shorteners](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/links.png?itok=AumNmse7 "3 open source link shorteners") 

>图片提供： [Paul Lewin][2]。Opensource.com 修改。[CC BY-SA 2.0][3]

没有人喜欢一个非常长的 URL。

它们很难解析。但有时候，站点的深层目录结构还有最后加上的大量参数使得 URL 开始变得冗长。在 Twitter 添加自己的链接缩短服务之前的那些日子里，一个长的 URL 意味着不得不削减推文中珍贵的字符。

如今，因为很多原因，人们开始使用链接缩短器。这样人们可以更容易地输入或记住另一个冗长的网址。它们可以为社交媒体帐户带来一贯的品牌建设。它们使对一组网址进行分析变得更轻松。它们使得为频繁变化的网站 URL 提供统一的入口成为可能。

URL 缩短器确实有一些不足。在点击之前很难知道链接实际指向哪里，而且如果提供短网址服务消失，就会导致 [烂链（linkrot）][4]。但是尽管面临这些挑战，URL 缩短器不会消失。

但是，既然已经有这么多免费链接缩短服务，为什么还要自己构建？简而言之：方便控制。虽然有些服务可以让你选择自己的域名来使用，但得到的定制级别不同。使用自托管服务，你可以自己决定服务的运行时间、URL 的格式以及决定谁可以访问你的分析。这是你自己拥有并且可以操作的。

幸运的是，如果你想建立下一个 bit.ly、goo.gl 或 ow.ly，你可以有很多开源选项。你可以考虑下面几个。

### Lessn More

[Lessn More][5] 是一个个人 URL 缩短器，用 PHP 写成，并从一个名为 Buttered URL 的较旧项目 fork 而来，而 Buttered URL 又是从一个名为 Lessn 的项目的分支衍生而来。Lessn More 能提供你对 URL 缩短器所预期的大部分功能：API 和书签支持、自定义 URL 等。还有一些有用的功能，比如可以让 Lessn More 使用单词黑名单来避免不小心创建不适当的 URL、避免“看着相似”的字符来使 URL 更易读、能够选择是否使用混合大小写的字符，以及一些其它有用的功能。

[Lessn More][6] 在 GitHub 上以三句版 [BSD][8] 许可证公布了[源代码][7]。

### Polr

[Polr][9] 将自己描述为“现代、强大、可靠的 URL 缩短器”。它具有相当直接但现代化的界面，像我们这里详细介绍的其他选择那样，还提供了一个 API 来允许你从其他程序中使用它。在这三个可选品中，它在功能上是最轻量级的，但如果你正在寻找一个简单但功能完整的选择，那么这可能是你不错的选择。下载之前你可以查看[在线演示][10]。

Polr 的[源代码][11] 在 GitHub 中以 [GPLv2][12] 许可证公布。

### YOURLS

[YOURLS][13]，是 “Your Own URL Shortener”（你自己的 URL 缩短器）的缩写，它是我最熟悉的选择。我在个人网站上已经运行了好几年，并且对其功能非常满意。

它是用 PHP 编写的，YOURLS 功能非常丰富并且可以很好地开箱即用。你可以将其配置为任何人可公开使用，或只允许某些用户使用它。它支持自定义 URL，拥有书签功能，使得共享很容易，它还具有非常强大的内置统计信息，并支持可插拔的架构，以允许其他人添加功能。它还有一个 API，可以轻松地用它创建其他程序。

你可以在 Github 中找到 [MIT 许可证][15]下的 YOURLS [源代码][14]。

* * *

这些选择都不喜欢么？看下互联网，你会发现还有其他几个选择：[shuri][16]、[Nimbus][17]、[Lstu][18] 等等。除了这些选择外，构建链接缩短器可以作为帮助了解新语言或 Web 框架的第一次编程项目。毕竟，它的核心功能非常简单：以 URL 作为输入，并重定向到另一个 URL。除此之外，它取决于你自己想要添加的功能。

你有喜欢但没有在这里列出的 URL 缩短器吗？请在评论栏中让我们知道你的想法。

--------------------------------------------------------------------------------

作者简介：

Jason Baker - Jason 热衷于使用技术使世界更加开放，从软件开发到阳光政府行动。Linux 桌面爱好者、地图/地理空间爱好者、树莓派工匠、数据分析和可视化极客、偶尔的码农、云本土主义者。在 Twitter 上关注他 @jehb。

------------

via: https://opensource.com/article/17/3/url-link-shortener

作者：[Jason Baker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/article/17/3/url-link-shortener?rate=5EGysFmjsUsxCc74bffDni4sFxxaIYiGRUG3UPznav8
[2]:https://www.flickr.com/photos/digypho/7905320090
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://en.wikipedia.org/wiki/Linkrot
[5]:https://lessnmore.net/
[6]:https://lessnmore.net/
[7]:https://github.com/alanhogan/lessnmore
[8]:https://github.com/alanhogan/lessnmore/blob/master/LICENSE.txt
[9]:https://project.polr.me/
[10]:http://demo.polr.me/
[11]:https://github.com/cydrobolt/polr
[12]:https://github.com/cydrobolt/polr/blob/master/LICENSE
[13]:https://yourls.org/
[14]:https://github.com/YOURLS/YOURLS
[15]:https://github.com/YOURLS/YOURLS/blob/master/LICENSE.md
[16]:https://github.com/pips-/shuri
[17]:https://github.com/ethanal/nimbus
[18]:https://github.com/ldidry/lstu
[19]:https://opensource.com/user/19894/feed
[20]:https://opensource.com/article/17/3/url-link-shortener#comments
[21]:https://opensource.com/users/jason-baker
