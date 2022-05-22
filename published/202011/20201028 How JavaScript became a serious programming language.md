[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12813-1.html)
[#]: subject: (How JavaScript became a serious programming language)
[#]: via: (https://opensource.com/article/20/10/history-javascript)
[#]: author: (Nimisha Mukherjee https://opensource.com/users/nimisha)

JavaScript 是如何成为一门严肃的编程语言的
======

> 从最开始作为一种使网站变得漂亮的方式，JavaScript 已转变为一种严肃的编程语言。

![](https://img.linux.net.cn/data/attachment/album/202011/12/010945vezib4p1b1ti6pjt.jpg)

JavaScript 的卑微起步始于 1995 年，是由当时在 Netscape 通信公司工作的 Brendan Eich [在短短 10 天内创建的][2]。从那时起，JavaScript 已经走过了漫长的道路，从一个让网站变得漂亮的工具变成了一种严肃的编程语言。

在其早期，JavaScript 被认为是一种视觉工具，它使网站变得更有趣和更有吸引力。像 [Jakarta Server Pages][3]（即 JSP，以前称作 JavaServer Pages）这样的语言曾经用来完成渲染网页的繁重工作，而 JavaScript 则被用来创建基本的交互、视觉增强和动画。

长期以来，HTML、CSS 和 JavaScript 之间的分界并不明确。前端开发主要由 HTML、CSS 和 JavaScript 组成，形成了标准 Web 技术的“[多层蛋糕][4]”。

![标准 Web 技术的多层蛋糕][5]

*标准网络技术的“[多层蛋糕][4]”（Mozilla 开发者网络，[CC BY-SA 4.0][6]）*

HTML 和 CSS 为内容提供结构、格式和样式。一旦网页要做一些超越了显示静态内容的事情，就是 JavaScript 的用武之地。Ecma 国际部开发了 JavaScript 规范，<ruby>万维网联盟<rt>World Wide Web Consortium</rt></ruby>（W3C）开发了 HTML 和 CSS 规范。

### JavaScript 是如何获得突出地位的

JavaScript 是如何成为[最受欢迎的][8]编程语言的，背后有一段漫长的[历史][7]。早在 20 世纪 90 年代，Java 是王者，不可避免的人们会与它进行比较。许多工程师认为 JavaScript 不是一门好的编程语言，因为它缺乏对面向对象编程的支持。尽管当时并不明显，但其实 JavaScript 的对象模型和功能特性在其第一个版本中就已经出现了。

1995 年 JavaScript 匆匆发布后，网景公司将其提交给了<ruby>欧洲计算机制造商协会<rt>European Computer Manufacturers Association</rt></ruby>（ECMA）国际部进行标准化。由此产生了 [ECMAScript][9]，这是一个 JavaScript 标准，旨在确保不同 Web 浏览器之间网页的互操作性。ECMAScript 1 于 1997 年 6 月问世，帮助推进了 JavaScript 的标准化。

在此期间，PHP 和 JSP 成为了服务器端编程语言的流行选择。JSP 作为<ruby>通用网关接口<rt>Common Gateway Interface</rt></ruby>（[CGI][10]）的首选替代方案获得了突出的地位，因为它可以在 HTML 中嵌入 Java 代码。虽然它很受欢迎，但开发人员发现将 Java 嵌入 HTML 中是不自然的。此外，即使是 HTML 上最简单的文本变化，JSP 也必须经历一个耗时的生命周期。在今天的微服务世界里，面向 JSP 的页面被认为是技术债务。 

[PHP][11] 的工作原理与 JSP 类似，但 PHP 代码以一个通用网关接口（[CGI][10]）的可执行文件来处理。基于 PHP 的 Web 应用比基于 JSP 的应用更容易部署。总的来说，使用 PHP 更容易上手和运行。今天，PHP 和 JavaScript 是创建动态网站最流行的组合之一：PHP 作为服务器端脚本，JavaScript 作为客户端脚本。

伴随着 2006 年 [jQuery][12] 的发布，JavaScript 的应用越来越多。jQuery 是一个多用途的 JavaScript 库，简化了繁琐的<ruby>文档对象模型<rt>Document Object Model</rt></ruby>（DOM）管理、事件处理和 [Ajax][13]。 

2009 年 [Node.js][14] 的发布是 JavaScript 发展的转折点。开发者现在可以用 JavaScript 编写服务器端脚本了。紧随其后的是 2010 年发布的 [Backbone.js][15] 和 [AngularJS][16] 等框架。这导致了出现了使用单一语言进行全栈开发的概念。

2015 年，Ecma 国际部发布了 ECMAScript 6（ES6），它为编写复杂的应用程序增加了包括类声明在内的重要新语法。其他新特性还包括迭代器、箭头函数表达式、`let` 和 `const` 关键字、类型化数组、新的集合（映射、集合和 WeakMap）、Promise、字符串的模板字元以及许多其它很酷的特性。后来的版本又继续增加了更多的功能，使 JavaScript 更加强大、精简和可靠。

### 总结

在过去的 20 年里，JavaScript 有了长足的进步。现在大多数浏览器都在争相满足合规性，因此最新的规范推出得更快。

根据你的项目需求，有大量稳定的 JavaScript 框架可供选择，包括最流行的 [React][17]、[Angular][18] 和 [Vue.js][19] 等等。在本系列的下一篇文章中，我将深入探讨为什么 JavaScript 如此受欢迎。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/history-javascript

作者：[Nimisha Mukherjee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nimisha
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl (Javascript code close-up with neon graphic overlay)
[2]: https://en.wikipedia.org/wiki/JavaScript
[3]: https://en.wikipedia.org/wiki/Jakarta_Server_Pages
[4]: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_is_JavaScript
[5]: https://opensource.com/sites/default/files/uploads/layercakewebtech.png (Layer cake of standard web technologies)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://blog.logrocket.com/history-of-frontend-frameworks/
[8]: https://octoverse.github.com/
[9]: https://en.wikipedia.org/wiki/ECMAScript
[10]: https://en.wikipedia.org/wiki/Common_Gateway_Interface
[11]: https://en.wikipedia.org/wiki/PHP#:~:text=PHP%20development%20began%20in%201994,Interpreter%22%20or%20PHP%2FFI.
[12]: https://en.wikipedia.org/wiki/JQuery
[13]: https://en.wikipedia.org/wiki/Ajax_(programming)
[14]: https://en.wikipedia.org/wiki/Node.js
[15]: https://en.wikipedia.org/wiki/Backbone.js
[16]: https://en.wikipedia.org/wiki/AngularJS
[17]: https://reactjs.org/
[18]: https://angular.io/
[19]: https://vuejs.org/
