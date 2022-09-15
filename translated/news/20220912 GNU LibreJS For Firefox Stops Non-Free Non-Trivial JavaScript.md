[#]: subject: "GNU LibreJS For Firefox Stops Non-Free Non-Trivial JavaScript"
[#]: via: "https://www.opensourceforu.com/2022/09/gnu-librejs-for-firefox-stops-non-free-non-trivial-javascript/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "littlebirdnest"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Firefox 的 扩展GNU LibreJS 能屏蔽不开源的 JavaScript
======
一个名为 GNU LibreJS（Firefox 的浏览器扩展程序）旨在自动阻止不开源的 JavaScript。与 NoScript 相比，GNU LibreJS 的操作也类似。主要的区别特征之一是 NoScript 在默认情况下会阻止大多数 JavaScript，而 GNU LibreJS 区分了开源 JavaScript 和不开源的 JavaScript。

GNU LibreJS存在，源于一篇名为《JavaScript陷阱》的文章，作者****Richard Stallman****。Stallman 认为，非开源的软件，主要是用 JavaScript 编写的，也可以用其他语言编写，是由浏览器运行的。这些大多数应用程序是私人的或者不开源的，更有甚者其中不乏一些是有害的或有问题的程序。Stallman 声称 Google文档使用的 JavaScript 程序的大小为半兆字节。它是压缩过的，想要理解和分析这里面的程序就很具有挑战性。Stallman 将监控用户的 JavaScript 代码称为恶意软件。

Stallman 建议不要运行那些有复杂进程或非常消耗进程的 JavaScript。从外部页面加载的脚本、修改 DOM 的脚本以及对 eval 的调用这些都适用于对javaScript的描述 。GNU 网站发布了完整列表。当 GNU LibreJS 安装在 Firefox 和其他兼容的浏览器中时，它会为用户做出这些区分。它启用它认为微不足道的 JavaScript，并阻止它认为非微不足道的所有 JavaScript。

该扩展添加了一个工具栏图标，指示页面上存在多少被阻止的 JavaScript 引用。除了更改整个网站或特定脚本或代码段状态的控件外，单击会显示接受和阻止的 JavaScript。可以将整个网站以及特定脚本或代码片段列入白名单或黑名单。扩展程序会记住之前的会话。提供了显示 JavaScript 代码的选项，以及忘记所有自定义设置或单个自定义设置的选项。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/gnu-librejs-for-firefox-stops-non-free-non-trivial-javascript/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[littlebirdnest](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
