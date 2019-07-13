如何创建适合移动设备的文档
=====

> 帮助用户在智能手机或平板上快速轻松地找到他们所需的信息。

![配图](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd)

我并不是完全相信[移动为先][1]的理念，但是我确实发现更多的人使用智能手机和平板电脑等移动设备来获取信息。这包括在线的软件和硬件文档，但它们大部分都是冗长的，不适合小屏幕。通常情况下，它的伸缩性不太好，而且很难导航。

当用户使用移动设备访问文档时，他们通常需要迅速获取信息以了解如何执行任务或解决问题，他们不想通过看似无尽的页面来寻找他们需要的特定信息。幸运的是，解决这个问题并不难。以下是一些技巧，可以帮助你构建文档以满足移动阅读器的需求。

### 简短一点

这意味着简短的句子，简短的段落和简短的流程。你不是在写一部长篇小说或一段长新闻。使你的文档简洁。尽可能使用少量的语言来获得想法和信息。

以广播新闻报道为示范：关注关键要素，用简单直接的语言对其进行解释。不要让你的读者在屏幕上看到冗长的文字。

另外，直接切入重点。关注读者需要的信息。在线发布的文档不应该像以前厚厚的手册一样。不要把所有东西都放在一个页面上，把你的信息分成更小的块。接下来是怎样做到这一点：

### 主题

在技术写作的世界里，主题是独立的，独立的信息块。每个主题都由你网站上的单个页面组成。读者应该能从特定的主题中获取他们需要的信息 -- 并且只是那些信息。要做到这一点，选择哪些主题要包含在文档中并决定如何组织它们：

### DITA

<ruby>[达尔文信息类型化体系结构][2]<rt>Darwin Information Typing Architecture</rt></ruby> （DITA） 是用于编写和发布的一个 XML 模型。它[广泛采用][3]在技术写作中，特别是作为较长的文档集中。

我并不是建议你将文档转换为 XML（除非你真的想）。相反，考虑将 DITA 的不同类型主题的概念应用到你的文档中：

* 一般：概述信息
* 任务：分步骤的流程
* 概念：背景或概念信息
* 参考：API 参考或数据字典等专用信息
* 术语表：定义术语
* 故障排除：有关用户可能遇到的问题以及如何解决问题的信息

你会得到很多单独的页面。要连接这些页面：

### 链接

许多内容管理系统、维基和发布框架都包含某种形式的导航 —— 通常是目录或[面包屑导航][4]，这是一种在移动设备上逐渐消失的导航。

为了加强导航，在主题之间添加明确的链接。将这些链接放在每个主题末尾的标题**另请参阅**或**相关主题**。每个部分应包含两到五个链接，指向与当前主题相关的概述、概念和参考主题。

如果你需要指向文档集之外的信息，请确保链接在浏览器新的选项卡中打开。这将把读者送到另一个网站，同时也将读者继续留你的网站上。

这解决了文本问题，那么图片呢？

### 不使用图片

除少数情况之外，不应该加太多图片到文档中。仔细查看文档中的每个图片，然后问自己：

* 它有用吗？
* 它是否增强了文档？
* 如果删除它，读者会错过这张图片吗？

如果回答否，那么移除图片。

另一方面，如果你绝对不能没有图片，就让它变成[响应式的][5]。这样，图片就会自动调整以适应更小的屏幕。

如果你仍然不确定图片是否应该出现，Opensource.com 社区版主 Ben Cotton 提供了一个关于在文档中使用屏幕截图的[极好的解释][6]。

### 最后的想法

通过少量努力，你就可以构建适合移动设备用户的文档。此外，这些更改也改进了桌面计算机和笔记本电脑用户的文档体验。


--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/think-mobile

作者：[Scott Nesbitt][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/chrisshort
[1]:https://www.uxmatters.com/mt/archives/2012/03/mobile-first-what-does-it-mean.php
[2]:https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture
[3]:http://dita.xml.org/book/list-of-organizations-using-dita
[4]:https://en.wikipedia.org/wiki/Breadcrumb_(navigation)
[5]:https://en.wikipedia.org/wiki/Responsive_web_design
[6]:https://opensource.com/business/15/9/when-does-your-documentation-need-screenshots
