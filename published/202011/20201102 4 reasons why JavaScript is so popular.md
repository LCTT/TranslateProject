[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12830-1.html)
[#]: subject: (4 reasons why JavaScript is so popular)
[#]: via: (https://opensource.com/article/20/11/javascript-popular)
[#]: author: (Nimisha Mukherjee https://opensource.com/users/nimisha)

JavaScript 如此受欢迎的 4 个原因
======

> JavaScript 之所以能在编程语言中名列前茅，是有充分的理由的。

![](https://img.linux.net.cn/data/attachment/album/202011/17/102936u1hghm95bbu7xjxg.jpg)

如 GitHub 的 [The State of the Octoverse][2] 报告的这张图所示，如果按 GitHub 上项目的贡献者数量统计，[JavaScript][3] 一直是最受欢迎的编程语言。

![The State of the Octoverse 报告中的热门语言][4]

*热门语言，根据《The State of the Octoverse》（©2019，[GitHub Corp][2]）*

在本系列的 [上一篇][5] 中，我们深入了解了 JavaScript 的历史。在这篇文章中，我将分享它如此受欢迎的四个[原因][6]。

### 1、JavaScript 适合初级、中级和高级开发人员

JavaScript 不需要任何环境设置，只要打开浏览器，比如 Chrome 浏览器，导航到[开发者工具][7]，就可以开始编码。编写一个 “Hello World” 的程序，就这么简单：

```
console.log("Hello World");
```

JavaScript 的灵活性最适合中级开发人员。该语言通过让开发人员专注于解决问题来帮助你完成任务。开发者可以混合使用插件和自己的代码片段来让一个应用程序工作。

虽然 JavaScript 比较容易上手，但它也并不是一下子就能掌握的。如果你想达到高级水平，这里有一些你需要了解的概念：

  * **JavaScript 的[多范式][8]特性：** JavaScript 同时支持函数式编程和面向对象编程（OOP）。
  * **在 JavaScript 中应用[设计模式][9]：** 模型-视图-*（[MV*][10]）设计模式一直是最流行的模式之一，并促成了[多个现代框架][11]的发展。
  * **[带原型链的继承][12]：** JavaScript 由于其动态的特性，无法实现传统的 Java 基于类的模式下的 OOP。JavaScript 中的 OOP 是通过原型继承模型实现的。
  * **[闭包][13]：** 闭包可以从内部函数中访问外部函数的作用域。
  * **<ruby>[柯里化][14]<rt>Currying</rt></ruby>：** 柯里化是函数的一种转换，它将函数从 `f(a, b, c)` 的调用形式转换为 `f(a)(b)(c)` 调用形式。
  * **[Promises][15] 和 [Observables][16]：** 这些可以帮助你处理异步函数。
  * **[TypeScript][17]：** 在 JavaScript 中添加了静态类型。

### 2、全平台

JavaScript 可以在任何地方运行，包括：

  * 手机、平板电脑和笔记本电脑等设备。
  * 在客户端和服务器端。

这种在任何地方都能运行的能力使 JavaScript 成为一种通用语言。

### 3、开放标准和社区

[ECMAScript][18] 是 JavaScript 的标准化版本，也是一种开放的标准语言。公司可以使用 ECMAScript 来创建 JavaScript 的实现。根据[维基百科][19]，“ECMAScript 引擎是执行以 ECMAScript 语言标准编写的源代码（例如，JavaScript）的程序”。最流行的引擎 [V8][20] 和 [SpiderMonkey][21] 是开源项目。

JavaScript 已经存在了 25 年，背后有一个庞大的社区。开发者们简直目不暇接，社区已经构建了如此多的插件和框架，以至于创造了“[框架疲劳][22]”这个词。

### 4、现代框架

现代框架如 [React][23]、[Angular][24] 和 [Vue.js][25] 已经稳定下来，并且正在进行优化以获得更好的性能。大多数框架对开发者非常友好，有良好的社区支持。

### 未来

JavaScript 将长期存在。全栈开发和现代前端框架继续帮助 JavaScript 巩固其作为最受欢迎的编程语言之一的地位。

JavaScript 的[下一波][26]可能会将焦点放在。

  * **[Deno][27]：** JavaScript 的现代安全运行时。
  * **网络组件：** 可重复使用的自定义元素。
  * **与 AI 和 ML 的整合：** 像 [Supernova][28] 和 [BAYOU][29] 这样的项目在将 JavaScript 与人工智能和机器学习整合方面取得了实质性的突破。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/javascript-popular

作者：[Nimisha Mukherjee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nimisha
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/javascript_vim.jpg?itok=mqkAeakO (JavaScript in Vim)
[2]: https://octoverse.github.com/
[3]: https://en.wikipedia.org/wiki/JavaScript
[4]: https://opensource.com/sites/default/files/uploads/toplanguages-the_state_of_the_octoverse.png (Top Languages from The State of the Octoverse report)
[5]: https://linux.cn/article-12813-1.html
[6]: https://medium.com/paul-heintzelman/so-why-is-javascript-so-popular-f35bd6cfeb39
[7]: https://developers.google.com/web/tools/chrome-devtools
[8]: https://medium.com/javascript-in-plain-english/what-are-javascript-programming-paradigms-3ef0f576dfdb
[9]: https://addyosmani.com/resources/essentialjsdesignpatterns/book/
[10]: https://developpaper.com/javascript-mv-pattern/
[11]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel#JavaScript_frameworks
[12]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain
[13]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures
[14]: https://javascript.info/currying-partials
[15]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
[16]: https://rxjs-dev.firebaseapp.com/guide/observable
[17]: https://en.wikipedia.org/wiki/TypeScript
[18]: https://en.wikipedia.org/wiki/ECMAScript
[19]: https://en.wikipedia.org/wiki/List_of_ECMAScript_engines
[20]: https://en.wikipedia.org/wiki/V8_%28JavaScript_engine%29
[21]: https://en.wikipedia.org/wiki/SpiderMonkey
[22]: https://teropa.info/blog/2015/07/15/overcoming-javascript-framework-fatigue.html
[23]: https://en.wikipedia.org/wiki/React_%28web_framework%29
[24]: https://en.wikipedia.org/wiki/Angular_%28web_framework%29
[25]: https://en.wikipedia.org/wiki/Vue.js
[26]: https://medium.com/@rangleio/the-future-of-javascript-in-the-front-end-world-2544c1814e2
[27]: https://en.wikipedia.org/wiki/Deno_%28software%29
[28]: https://techcrunch.com/2018/03/13/supernova-studio/
[29]: https://futurism.com/military-created-ai-learned-to-program
