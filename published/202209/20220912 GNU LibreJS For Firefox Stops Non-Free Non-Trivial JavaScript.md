[#]: subject: "GNU LibreJS For Firefox Stops Non-Free Non-Trivial JavaScript"
[#]: via: "https://www.opensourceforu.com/2022/09/gnu-librejs-for-firefox-stops-non-free-non-trivial-javascript/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "littlebirdnest"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15037-1.html"

屏蔽非自由软件的大型 JavaScript 脚本的浏览器扩展
======

![](https://img.linux.net.cn/data/attachment/album/202209/16/145522tybcmb2kukgxutcp.jpg)

一个名为 GNU LibreJS 的 Firefox 浏览器扩展程序旨在自动阻止非自由软件的大型 JavaScript 脚本。与 NoScript 相比，GNU LibreJS 的操作也类似。主要的区别特征之一是 NoScript 在默认情况下会阻止大多数 JavaScript 脚本，而 GNU LibreJS 针对的非自由软件的大型 JavaScript 脚本。

GNU LibreJS 源于 Richard Stallman 的一篇名为《JavaScript 陷阱》的文章。Stallman 认为，运行在浏览器上的非自由软件，主要是用 JavaScript 编写的，也有用其他语言编写的。这些应用程序有许多是专有软件或者不开源的，更有甚者其中不乏一些有害的或有问题的程序。Stallman 声称 Google 文档使用的 JavaScript 程序的大小为半兆字节。它是压缩过的，想要理解和分析这样的程序就很具有挑战性。Stallman 将监控用户的 JavaScript 代码称为恶意软件。

Stallman 建议不要运行那些复杂的或非常消耗处理能力的 JavaScript。从外部页面加载的脚本、修改 DOM 的脚本以及对 `eval` 的调用，都是符合上面描述的 JavaScript 代码的例子。GNU 网站发布了一个（符合上述描述的）列表。当 GNU LibreJS 安装在 Firefox 和其他兼容的浏览器中时，它会为用户做出这些区分。它会启用那些小型的 JavaScript，并阻止它认为非自由软件的大型 JavaScript 代码。

该扩展添加了一个工具栏图标，指示页面上存在多少被阻止的 JavaScript 引用。除了更改整个网站或特定脚本或代码段状态的控件外，单击会显示接受和阻止的 JavaScript。可以将整个网站以及特定脚本或代码片段列入白名单或黑名单。扩展程序会记住之前的设置。提供了显示 JavaScript 代码的选项，以及撤销所有自定义设置或单个自定义设置的选项。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/gnu-librejs-for-firefox-stops-non-free-non-trivial-javascript/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[littlebirdnest](https://github.com/littlebirdnest)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
