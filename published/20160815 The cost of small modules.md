JavaScript 小模块的开销
====

更新（2016/10/30）：我写完这篇文章之后，我在[这个基准测试中发了一个错误](https://github.com/nolanlawson/cost-of-small-modules/pull/8)，会导致 Rollup 比它预期的看起来要好一些。不过，整体结果并没有明显的不同（Rollup 仍然击败了 Browserify 和 Webpack，虽然它并没有像 Closure 十分好），所以我只是更新了图表。该基准测试包括了 [RequireJS 和 RequireJS Almond 打包器](https://github.com/nolanlawson/cost-of-small-modules/pull/5)，所以文章中现在也包括了它们。要看原始帖子，可以查看[历史版本](https://web.archive.org/web/20160822181421/https://nolanlawson.com/2016/08/15/the-cost-of-small-modules/)。

大约一年之前，我在将一个大型 JavaScript 代码库重构为更小的模块时发现了 Browserify 和 Webpack 中一个令人沮丧的事实：

> “代码越模块化，代码体积就越大。:< ”- Nolan Lawson

过了一段时间，Sam Saccone 发布了一些关于 [Tumblr][1] 和 [Imgur][2] 页面加载性能的出色的研究。其中指出：

> “超过 400 ms 的时间单纯的花费在了遍历 Browserify 树上。”- Sam Saccone

在本篇文章中，我将演示小模块可能会根据你选择的打包器（bundler）和模块系统（module system）而出现高得惊人的性能开销。此外，我还将解释为什么这种方法不但影响你自己代码的模块，也会影响依赖项中的模块，这也正是第三方代码在性能开销上很少提及的方面。

### 网页性能（Web perf 101）

一个页面中包含的 JavaScript 脚本越多，页面加载也将越慢。庞大的 JavaScript 包会导致浏览器花费更多的时间去下载、解析和执行，这些都将加长载入时间。

即使当你使用如 Webpack [code splitting][3]、Browserify [factor bundles][4] 等工具将代码分解为多个包，该开销也仅仅是被延迟到页面生命周期的晚些时候。JavaScript 迟早都将有一笔开销。

此外，由于 JavaScript 是一门动态语言，同时流行的 [CommonJS][5] 模块也是动态的，所以这就使得在最终分发给用户的代码中剔除无用的代码变得异常困难。譬如你可能只使用到 jQuery 中的 $.ajax，但是通过载入 jQuery 包，你将付出整个包的代价。

JavaScript 社区对这个问题提出的解决办法是提倡 [小模块][6] 的使用。小模块不仅有许多 [美好且实用的好处][7] 如易于维护，易于理解，易于集成等，而且还可以通过鼓励包含小巧的功能而不是庞大的库来解决之前提到的 jQuery 的问题。

所以在小模块下，你将不需要这样：

```
var _ = require('lodash')
_.uniq([1,2,2,3])
```

而是可以如此：

```
var uniq = require('lodash.uniq')
uniq([1,2,2,3])
```

### 包与模块

需要强调的是这里我提到的“模块”并不同于 npm 中的“包”的概念。当你从 npm 安装一个包时，它会将该模块通过公用 API 展现出来，但是在这之下其实是一个许多模块的聚合物。

例如，我们来看一个包 [is-array][8]，它没有别的依赖，并且只包含 [一个 JavaScript 文件][9]，所以它只有一个模块。这算是足够简单的。

现在来看一个稍微复杂一点的包，如 [once][10]。它有一个依赖的包 [wrappy][11]。[两][12] [个][13] 包都各自包含一个模块，所以总模块数为 2。至此，也还算好。

现在来一起看一个更为令人迷惑的例子：[qs][14]。因为它没有依赖的包，所以你可能就认为它只有一个模块，然而事实上，它有四个模块！

你可以用一个我写的工具 [browserify-count-modules][15] 来统计一个 Browserify 包的总模块数：

```
$ npm install qs
$ browserify node_modules/qs | browserify-count-modules
4
```

这说明了一个包可以包含一个或者多个模块。这些模块也可以依赖于其他的包，而这些包又将附带其自己所依赖的包与模块。由此可以确定的事就是任何一个包将包含至少一个模块。

### 模块膨胀

一个典型的网页应用中会包含多少个模块呢？我在一些流行的使用 Browserify 的网站上运行 browserify-count-moduleson 并且得到了以下结果：

*   [requirebin.com][16]: 91 个模块
*   [keybase.io][17]: 365 个模块
*   [m.reddit.com][18]: 1050 个模块
*   [Apple.com][19]: 1060 个模块 (新增。 [感谢 Max！][20])

顺带一提，我写过的最大的开源站点 [Pokedex.org][21] 包含了 4 个包，共 311 个模块。

让我们先暂时忽略这些 JavaScript 包的实际大小，我认为去探索一下一定数量的模块本身开销会是一件有意思的事。虽然 Sam Saccone 的文章 [“2016 年 ES2015 转译的开销”][22] 已经广为流传，但是我认为他的结论还未到达足够深度，所以让我们挖掘的稍微再深一点吧。 

### 测试环节！

我构造了一个能导入 100、1000 和 5000 个其他小模块的测试模块，其中每个小模块仅仅导出一个数字。而父模块则将这些数字求和并记录结果：

```
// index.js
var total = 0
total += require('./module_0')
total += require('./module_1')
total += require('./module_2')
// etc.
console.log(total)


// module_1.js
module.exports = 1
```

我测试了五种打包方法：Browserify、带 [bundle-collapser][24] 插件的 Browserify、Webpack、Rollup 和 Closure Compiler。对于 Rollup 和 Closure Compiler 我使用了 ES6 模块，而对于 Browserify 和 Webpack 则用的是 CommonJS，目的是为了不涉及其各自缺点而导致测试的不公平（由于它们可能需要做一些转译工作，如 Babel 一样，而这些工作将会增加其自身的运行时间）。

为了更好地模拟一个生产环境，我对所有的包采用带 `-mangle` 和 `-compress` 参数的 `Uglify` ，并且使用 gzip 压缩后通过 GitHub Pages 用 HTTPS 协议进行传输。对于每个包，我一共下载并执行 15 次，然后取其平均值，并使用 `performance.now()` 函数来记录载入时间（未使用缓存）与执行时间。

### 包大小

在我们查看测试结果之前，我们有必要先来看一眼我们要测试的包文件。以下是每个包最小处理后但并未使用 gzip 压缩时的体积大小（单位：Byte）：

|  | 100 个模块 | 1000 个模块 | 5000 个模块 |
| --- | --- | --- | --- |
| browserify | 7982 | 79987 | 419985 |
| browserify-collapsed | 5786 | 57991 | 309982 |
| webpack | 3954 | 39055 | 203052 |
| rollup | 671 | 6971 | 38968 |
| closure | 758 | 7958 | 43955 |

|  | 100 个模块 | 1000 个模块 | 5000 个模块 |
| --- | --- | --- | --- |
| browserify | 1649 | 13800 | 64513 |
| browserify-collapsed | 1464 | 11903 | 56335 |
| webpack | 693 | 5027 | 26363 |
| rollup | 300 | 2145 | 11510 |
| closure | 302 | 2140 | 11789 |

Browserify 和 Webpack 的工作方式是隔离各个模块到各自的函数空间，然后声明一个全局载入器，并在每次 `require()` 函数调用时定位到正确的模块处。下面是我们的 Browserify 包的样子：

```
(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o
```

而 Rollup 和 Closure 包看上去则更像你亲手写的一个大模块。这是 Rollup 打包的包：

```
(function () {
        'use strict';
        var total = 0
        total += 0
        total += 1
        total += 2
// etc.
```

如果你清楚在 JavaScript 中使用嵌套函数与在关联数组查找一个值的固有开销， 那么你将很容易理解出现以下测试的结果的原因。

### 测试结果

我选择在搭载 Android 5.1.1 与 Chrome 52 的 Nexus 5（代表中低端设备）和运行 iOS 9 的第 6 代 iPod Touch（代表高端设备）上进行测试。

这是 Nexus 5 下的测试结果（[查看表格][26]）：

[![Nexus 5 结果][27]](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_5.png)

这是 iPod Touch 下的测试结果（[查看表格][28]）：

[![iPod Touch 结果][29]](https://nolanwlawson.files.wordpress.com/2016/08/modules_ipod.png)

在 100 个模块时，各包的差异是微不足道的，但是一旦模块数量达到 1000 个甚至 5000 个时，差异将会变得非常巨大。iPod Touch 在不同包上的差异并不明显，而对于具有一定年代的 Nexus 5 来说，Browserify 和 Webpack 明显耗时更多。

与此同时，我发现有意思的是 Rollup 和 Closure 的运行开销对于 iPod 而言几乎可以忽略，并且与模块的数量关系也不大。而对于 Nexus 5 来说，运行的开销并非完全可以忽略，但 Rollup/Closure 仍比 Browserify/Webpack 低很多。后者若未在几百毫秒内完成加载则将会占用主线程的好几帧的时间，这就意味着用户界面将冻结并且等待直到模块载入完成。

值得注意的是前面这些测试都是在千兆网速下进行的，所以在网络情况来看，这只是一个最理想的状况。借助 Chrome 开发者工具，我们可以认为地将 Nexus 5 的网速限制到 3G 水平，然后来看一眼这对测试产生的影响（[查看表格][30]）：

[![Nexus 5 3G 结果][31]](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_53g.png)

一旦我们将网速考虑进来，Browserify/Webpack 和 Rollup/Closure 的差异将变得更为显著。在 1000 个模块规模（接近于 Reddit 1050 个模块的规模）时，Browserify 花费的时间比 Rollup 长大约 400 毫秒。然而 400 毫秒已经不是一个小数目了，正如 Google 和 Bing 指出的，亚秒级的延迟都会 [对用户的参与产生明显的影响][32] 。

还有一件事需要指出，那就是这个测试并非测量 100 个、1000 个或者 5000 个模块的每个模块的精确运行时间。因为这还与你对 `require()` 函数的使用有关。在这些包中，我采用的是对每个模块调用一次 `require()` 函数。但如果你每个模块调用了多次 `require()` 函数（这在代码库中非常常见）或者你多次动态调用 `require()` 函数（例如在子函数中调用 `require()` 函数），那么你将发现明显的性能退化。 

Reddit 的移动站点就是一个很好的例子。虽然该站点有 1050 个模块，但是我测量了它们使用 Browserify 的实际执行时间后发现比“1000 个模块”的测试结果差好多。当使用那台运行 Chrome 的 Nexus 5 时，我测出 Reddit 的 Browserify require() 函数耗时 2.14 秒。而那个“1000 个模块”脚本中的等效函数只需要 197 毫秒（在搭载 i7 处理器的 Surface Book 上的桌面版 Chrome，我测出的结果分别为 559 毫秒与 37 毫秒，虽然给出桌面平台的结果有些令人惊讶）。

这结果提示我们有必要对每个模块使用多个 `require()` 函数的情况再进行一次测试。不过，我并不认为这对 Browserify 和 Webpack 会是一个公平的测试，因为 Rollup 和 Closure 都会将重复的 ES6 库导入处理为一个的顶级变量声明，同时也阻止了顶层空间以外的其他区域的导入。所以根本上来说，Rollup 和 Closure 中一个导入和多个导入的开销是相同的，而对于 Browserify 和 Webpack，运行开销随 `require()` 函数的数量线性增长。

为了我们这个分析的目的，我认为最好假设模块的数量是性能的短板。而事实上，“5000 个模块”也是一个比“5000 个 `require()` 函数调用”更好的度量标准。

### 结论

首先，bundle-collapser 对 Browserify 来说是一个非常有用的插件。如果你在产品中还没使用它，那么你的包将相对来说会略大且运行略慢（虽然我得承认这之间的差异非常小）。另一方面，你还可以转换到 Webpack 以获得更快的包而不需要额外的配置（其实我非常不愿意这么说，因为我是个顽固的 Browserify 粉）。

不管怎样，这些结果都明确地指出 Webpack 和 Browserify 相较 Rollup 和 Closure Compiler 而言表现都稍差，并且性能差异随着模块大小的增大而增大。不幸的是，我并不确定 [Webpack 2][33] 是否能解决这些问题，因为尽管他们将 [从 Rollup 中借鉴一些想法][34]，但是看起来他们的关注点更多在于 [tree-shaking 方面][35] 而不是在于 scope-hoisting 方面。（更新：一个更好的名字称为内联（inlining），并且 Webpack 团队 [正在做这方面的工作][36]。）

给出这些结果之后，我对 Closure Compiler 和 Rollup 在 JavaScript 社区并没有得到过多关注而感到惊讶。我猜测或许是因为（前者）需要依赖 Java，而（后者）仍然相当不成熟并且未能做到开箱即用（详见 [Calvin’s Metcalf 的评论][37] 中作的不错的总结）。

即使没有足够数量的 JavaScript 开发者加入到 Rollup 或 Closure 的队伍中，我认为 npm 包作者们也已准备好了去帮助解决这些问题。如果你使用 npm 安装 lodash，你将会发其现主要的导入是一个巨大的 JavaScript 模块，而不是你期望的 Lodash 的超模块（hyper-modular）特性（`require('lodash/uniq')`，`require('lodash.uniq')` 等等）。对于 PouchDB，我们做了一个类似的声明以 [使用 Rollup 作为预发布步骤][38]，这将产生对于用户而言尽可能小的包。

同时，我创建了 [rollupify][39] 来尝试将这过程变得更为简单一些，只需拖动到已存在的 Browserify 工程中即可。其基本思想是在你自己的项目中使用导入（import）和导出（export）（可以使用 [cjs-to-es6][40] 来帮助迁移），然后使用 require() 函数来载入第三方包。这样一来，你依旧可以在你自己的代码库中享受所有模块化的优点，同时能导出一个适当大小的大模块来发布给你的用户。不幸的是，你依旧得为第三方库付出一些代价，但是我发现这是对于当前 npm 生态系统的一个很好的折中方案。

所以结论如下：**一个大的 JavaScript 包比一百个小 JavaScript 模块要快**。尽管这是事实，我依旧希望我们社区能最终发现我们所处的困境————提倡小模块的原则对开发者有利，但是对用户不利。同时希望能优化我们的工具，使得我们可以对两方面都有利。

### 福利时间！三款桌面浏览器

通常来说我喜欢在移动设备上运行性能测试，因为在这里我们能更清楚的看到差异。但是出于好奇，我也分别在一台搭载 i7 的 Surface Book 上的 Chrome 52、Edge 14 和 Firefox 48 上运行了测试。这分别是它们的测试结果：

Chrome 52 ([查看表格][41])

[![Chrome 结果][42]](https://nolanwlawson.files.wordpress.com/2016/08/modules_chrome.png)

Edge 14 ([查看表格][43])

[![Edge 结果][44]](https://nolanwlawson.files.wordpress.com/2016/08/modules_edge.png)

Firefox 48 ([查看表格][45])

[![Firefox 结果][46]](https://nolanwlawson.files.wordpress.com/2016/08/modules_firefox.png)

我在这些结果中发现的有趣的地方如下：

1.  bundle-collapser 总是与 slam-dunk 完全不同。
2.  Rollup 和 Closure 的下载时间与运行时间之比总是非常高，它们的运行时间基本上微不足道。ChakraCore 和 SpiderMonkey 运行最快，V8 紧随其后。

如果你的 JavaScript 非常大并且是延迟加载，那么第二点将非常重要。因为如果你可以接受等待网络下载的时间，那么使用 Rollup 和 Closure 将会有避免界面线程冻结的优点。也就是说，它们将比 Browserify 和 Webpack 更少出现界面阻塞。

更新：在这篇文章的回应中，JDD 已经 [给 Webpack 提交了一个 issue][47]。还有 [一个是给 Browserify 的][48]。

更新 2：[Ryan Fitzer][49] 慷慨地增加了 RequireJS 和包含 [Almond][50] 的 RequireJS 的测试结果，两者都是使用 AMD 而不是 CommonJS 或者 ES6。

测试结果表明 RequireJS 具有 [最大的包大小][51] 但是令人惊讶的是它的运行开销 [与 Rollup 和 Closure 非常接近][52]。这是在运行 Chrome 52 的 Nexus 5 下限制网速为 3G 的测试结果：

[![Nexus 5 (3G) RequireJS 结果][53]](https://nolanwlawson.files.wordpress.com/2016/08/2016-08-20-14_45_29-small_modules3-xlsx-excel.png)

更新 3: 我写了一个 [optimize-js](http://github.com/nolanlawson/optimize-js) ，它会减少一些函数内的函数的解析成本。

--------------------------------------------------------------------------------

via: https://nolanlawson.com/2016/08/15/the-cost-of-small-modules/

作者：[Nolan][a]
译者：[Yinr](https://github.com/Yinr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nolanlawson.com/
[1]: https://docs.google.com/document/d/1E2w0UQ4RhId5cMYsDcdcNwsgL0gP_S6SDv27yi1mCEY/edit
[2]: https://github.com/perfs/audits/issues/1
[3]: https://webpack.github.io/docs/code-splitting.html
[4]: https://github.com/substack/factor-bundle
[5]: http://www.commonjs.org/
[6]: http://substack.net/how_I_write_modules
[7]: http://dailyjs.com/2015/07/02/small-modules-complexity-over-size/
[8]: https://www.npmjs.com/package/is-array
[9]: https://github.com/retrofox/is-array/blob/d79f1c90c824416b60517c04f0568b5cd3f8271d/index.js#L6-L33
[10]: https://www.npmjs.com/package/once
[11]: https://www.npmjs.com/package/wrappy
[12]: https://github.com/isaacs/once/blob/2ad558657e17fafd24803217ba854762842e4178/once.js#L1-L21
[13]: https://github.com/npm/wrappy/blob/71d91b6dc5bdeac37e218c2cf03f9ab55b60d214/wrappy.js#L6-L33
[14]: https://www.npmjs.com/package/qs
[15]: https://www.npmjs.com/package/browserify-count-modules
[16]: http://requirebin.com/
[17]: https://keybase.io/
[18]: http://m.reddit.com/
[19]: http://images.apple.com/ipad-air-2/
[20]: https://twitter.com/denormalize/status/765300194078437376
[21]: https://pokedex.org/
[22]: https://github.com/samccone/The-cost-of-transpiling-es2015-in-2016#the-cost-of-transpiling-es2015-in-2016
[23]: https://github.com/nolanlawson/cost-of-small-modules
[24]: https://www.npmjs.com/package/bundle-collapser
[25]: https://nolanwlawson.files.wordpress.com/2016/08/min.png
[26]: https://gist.github.com/nolanlawson/e84ad060a20f0cb7a7c32308b6b46abe
[27]: https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_5.png?w=570&h=834
[28]: https://gist.github.com/nolanlawson/45ed2c7fa53da035dfc1e153763b9f93
[29]: https://nolanwlawson.files.wordpress.com/2016/08/modules_ipod.png?w=570&h=827
[30]: https://gist.github.com/nolanlawson/6269d304c970174c21164288808392ea
[31]: https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_53g.png?w=570&h=834
[32]: http://radar.oreilly.com/2009/06/bing-and-google-agree-slow-pag.html
[33]: https://gist.github.com/sokra/27b24881210b56bbaff7
[34]: http://www.2ality.com/2015/12/webpack-tree-shaking.html
[35]: http://www.2ality.com/2015/12/bundling-modules-future.html
[36]: https://github.com/webpack/webpack/issues/2873#issuecomment-240067865
[37]: https://github.com/rollup/rollup/issues/552
[38]: http://pouchdb.com/2016/01/13/pouchdb-5.2.0-a-better-build-system-with-rollup.html
[39]: https://github.com/nolanlawson/rollupify
[40]: https://github.com/nolanlawson/cjs-to-es6
[41]: https://gist.github.com/nolanlawson/4f79258dc05bbd2c14b85cf2196c6ef0
[42]: https://nolanwlawson.files.wordpress.com/2016/08/modules_chrome.png?w=570&h=831
[43]: https://gist.github.com/nolanlawson/726fa47e0723b45e4ee9ecf0cf2fcddb
[44]: https://nolanwlawson.files.wordpress.com/2016/08/modules_edge.png?w=570&h=827
[45]: https://gist.github.com/nolanlawson/7eed17e6ffa18752bf99a9d4bff2941f
[46]: https://nolanwlawson.files.wordpress.com/2016/08/modules_firefox.png?w=570&h=830
[47]: https://github.com/webpack/webpack/issues/2873
[48]: https://github.com/substack/node-browserify/issues/1379
[49]: https://github.com/nolanlawson/cost-of-small-modules/pull/5
[50]: https://github.com/requirejs/almond
[51]: https://gist.github.com/nolanlawson/511e0ce09fed29fed040bb8673777ec5
[52]: https://gist.github.com/nolanlawson/4e725df00cd1bc9673b25ef72b831c8b
[53]: https://nolanwlawson.files.wordpress.com/2016/08/2016-08-20-14_45_29-small_modules3-xlsx-excel.png?w=570&h=829
