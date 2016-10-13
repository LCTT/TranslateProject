Translating by Yinr

The cost of small modules
小模块的成本
====

About a year ago I was refactoring a large JavaScript codebase into smaller modules, when I discovered a depressing fact about Browserify and Webpack:  
大约一年之前，我在将一个大型 JavaScript 代码库重构为小模块时发现了 Browserify 和 Webpack 中一个令人沮丧的事实：

> “The more I modularize my code, the bigger it gets. ”– Nolan Lawson  
> “代码越模块化，代码体积就越大。”- Nolan Lawson

Later on, Sam Saccone published some excellent research on [Tumblr][1] and [Imgur][2]'s page load performance, in which he noted:  
过了一段时间，Sam Saccone 发布了一些关于 [Tumblr][1] 和 [Imgur][2] 页面加载性能的出色的研究。其中指出：

> “Over 400ms is being spent simply walking the Browserify tree.”– Sam Saccone  
> “超过 400 ms 的时间单纯的花费在了遍历 Browserify 树上。”- Sam Saccone

In this post, I’d like to demonstrate that small modules can have a surprisingly high performance cost depending on your choice of bundler and module system. Furthermore, I’ll explain why this applies not only to the modules in your own codebase, but also to the modules within dependencies, which is a rarely-discussed aspect of the cost of third-party code.  
在本篇文章中，我将演示小模块可能会根据你选择的打包器（bundler）和模块系统（module system）而出现高得惊人的性能开销。此外，我还将解释为什么这种方法不但影响你自己代码的模块，也会影响依赖项中的模块，这也正是第三方代码在性能开销上很少提及的方面。

### Web perf 101

The more JavaScript included on a page, the slower that page tends to be. Large JavaScript bundles cause the browser to spend more time downloading, parsing, and executing the script, all of which lead to slower load times.  
一个页面中包含的 JavaScript 脚本越多，页面加载也将越慢。庞大的 JavaScript 包会导致浏览器花费更多的时间去下载、解析和执行，这些都将加长载入时间。

Even when breaking up the code into multiple bundles – Webpack [code splitting][3], Browserify [factor bundles][4], etc. – the cost is merely delayed until later in the page lifecycle. Sooner or later, the JavaScript piper must be paid.  
即使当你使用如 Webpack [code splitting][3]、Browserify [factor bundles][4] 等工具将代码分解为多个包，时间的花费也仅仅是被延迟到页面生命周期的晚些时候。JavaScript 迟早都将有一笔开销。

Furthermore, because JavaScript is a dynamic language, and because the prevailing [CommonJS][5] module system is also dynamic, it’s fiendishly difficult to extract unused code from the final payload that gets shipped to users. You might only need jQuery’s $.ajax, but by including jQuery, you pay the cost of the entire library.  
此外，由于 JavaScript 是一门动态语言，同时流行的 [CommonJS][5] 模块也是动态的，所以这就使得在最终分发给用户的代码中剔除无用的代码变得异常困难。譬如你可能只使用到 jQuery 中的 $.ajax，但是通过载入 jQuery 包，你将以整个包为代价。

The JavaScript community has responded to this problem by advocating the use of [small modules][6]. Small modules have a lot of [aesthetic and practical benefits][7] – easier to maintain, easier to comprehend, easier to plug together – but they also solve the jQuery problem by promoting the inclusion of small bits of functionality rather than big “kitchen sink” libraries.  
JavaScript 社区对这个问题提出的解决办法是提倡 [小模块][6] 的使用。小模块不仅有许多 [美好且实用的好处][7] 如易于维护，易于理解，易于集成等，而且还可以通过鼓励包含小巧的功能而不是庞大的库来解决之前提到的 jQuery 的问题。

So in the “small modules” world, instead of doing:  
所以在小模块下，你将不需要这样：

```
var _ = require('lodash')
_.uniq([1,2,2,3])
```

You might do:  
而是可以如此：

```
var uniq = require('lodash.uniq')
uniq([1,2,2,3])
```

### Packages vs modules
### 包与模块

It’s important to note that, when I say “modules”, I’m not talking about “packages” in the npm sense. When you install a package from npm, it might only expose a single module in its public API, but under the hood it could actually be a conglomeration of many modules.  
需要强调的是这里我提到的“模块”并不同于 npm 中的“包”的概念。当你从 npm 安装一个包时，它会将该模块通过公用 API 展现出来，但是在这之下其实是一个许多模块的聚合物。

For instance, consider a package like [is-array][8]. It has no dependencies and only contains [one JavaScript file][9], so it has one module. Simple enough.  
例如，我们来看一个包 [is-array][8]，它没有别的依赖，并且只包含 [一个 JavaScript 文件][9]，所以它只有一个模块。这算是足够简单的。

Now consider a slightly more complex package like [once][10], which has exactly one dependency: [wrappy][11]. [Both][12] [packages][13] contain one module, so the total module count is 2\. So far, so good.  
现在来看一个稍微复杂一点的包，如 [once][10]。它有一个依赖的包 [wrappy][11]。[两][12][个][13] 包都各自包含一个模块，所以总模块数为 2。至此，也还算好。

Now let’s consider a more deceptive example: [qs][14]. Since it has zero dependencies, you might assume it only has one module. But in fact, it has four!  
现在来一起看一个更为令人迷惑的例子：[qs][14]。因为它没有依赖的包，所以你可能就认为它只有一个模块，然而事实上，它有四个模块！

You can confirm this by using a tool I wrote called [browserify-count-modules][15], which simply counts the total number of modules in a Browserify bundle:  
你可以用一个我写的工具 [browserify-count-modules][15] 来统计一个 Browserify 包的总模块数：

```
$ npm install qs
$ browserify node_modules/qs | browserify-count-modules
4
```

This means that a given package can actually contain one or more modules. These modules can also depend on other packages, which might bring in their own packages and modules. The only thing you can be sure of is that each package contains at least one module.  
这说明了一个包可以包含一个或者多个模块。这些模块也可以依赖于其他的包，而这些包又将附带其自己所带的包与模块。由此可以确定的事就是任何一个包将包含至少一个模块。

### Module bloat  
### 模块膨胀

How many modules are in a typical web application? Well, I ran browserify-count-moduleson a few popular Browserify-using sites, and came up with these numbers:  
一个典型的网页应用中会包含多少个模块呢？我在一些流行的使用 Browserify 的网站上运行 browserify-count-moduleson 并且得到了以下结果：

*   [requirebin.com][16]: 91 modules
*   [requirebin.com][16]: 91 个模块
*   [keybase.io][17]: 365 modules
*   [keybase.io][17]: 365 个模块
*   [m.reddit.com][18]: 1050 modules
*   [m.reddit.com][18]: 1050 个模块
*   [Apple.com][19]: 1060 modules (Added. [Thanks, Max!][20])
*   [Apple.com][19]: 1060 个模块 (新增。 [感谢 Max！][20])

For the record, my own [Pokedex.org][21] (the largest open-source site I’ve built) contains 311 modules across four bundle files.  
顺带一提，我写过的最大的开原站点 [Pokedex.org][21] 包含了 4 个包，共 311 个模块。

Ignoring for a moment the raw size of those JavaScript bundles, I think it’s interesting to explore the cost of the number of modules themselves. Sam Saccone has already blown this story wide open in [“The cost of transpiling es2015 in 2016”][22], but I don’t think his findings have gotten nearly enough press, so let’s dig a little deeper.  
让我们先暂时忽略这些 JavaScript 包的实际大小，我认为去探索一下一定数量的模块本身开销回事一件有意思的事。虽然 Sam Saccone 的文章 [“2016 年 ES2015 转译的开销”][22] 已经广为流传，但是我认为他的结论还未到达最深程度，所以让我们挖掘的稍微再深一点吧。 

### Benchmark time!
### 测试环节！

I put together [a small benchmark][23] that constructs a JavaScript module importing 100, 1000, and 5000 other modules, each of which merely exports a number. The parent module just sums the numbers together and logs the result:  
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

I tested five bundling methods: Browserify, Browserify with the [bundle-collapser][24] plugin, Webpack, Rollup, and Closure Compiler. For Rollup and Closure Compiler I used ES6 modules, whereas for Browserify and Webpack I used CommonJS, so as not to unfairly disadvantage them (since they would need a transpiler like Babel, which adds its own overhead).  
我测试了五种打包方法：Browserify, 带 [bundle-collapser][24] 插件的 Browserify, Webpack, Rollup 和 Closure Compiler。对于 Rollup 和 Closure Compiler 我使用了 ES6 模块，而对于 Browserify 和 Webpack 则用的 CommonJS，目的是为了不涉及其各自缺点而导致测试的不公平（由于它们可能需要做一些转译工作，如 Babel 一样，而这些工作将会增加其自身的运行时间）。

In order to best simulate a production environment, I used Uglify with the --mangle and--compress settings for all bundles, and served them gzipped over HTTPS using GitHub Pages. For each bundle, I downloaded and executed it 15 times and took the median, noting the (uncached) load time and execution time using performance.now().  
为了更好地模拟一个生产环境，我将带 -mangle 和 -compress 参数的 Uglify 用于所有的包，并且使用 gzip 压缩后通过 GitHub Pages 用 HTTPS 协议进行传输。对于每个包，我一共下载并执行 15 次，然后取其平均值，并使用 performance.now() 函数来记录载入时间（未使用缓存）与执行时间。

### Bundle sizes
### 包大小

Before we get into the benchmark results, it’s worth taking a look at the bundle files themselves. Here are the byte sizes (minified but ungzipped) for each bundle ([chart view][25]):  
在我们查看测试结果之前，我们有必要先来看一眼我们要测试的包文件。一下是每个包最小处理后但并未使用 gzip 压缩时的体积大小（单位：Byte）：

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

The way Browserify and Webpack work is by isolating each module into its own function scope, and then declaring a top-level runtime loader that locates the proper module whenever require() is called. Here’s what our Browserify bundle looks like:  
Browserify 和 Webpack 的工作方式是隔离各个模块到各自的函数空间，然后声明一个全局载入器，并在每次 require() 函数调用时定位到正确的模块处。下面是我们的 Browserify 包的样子：

```
(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o
```

Whereas the Rollup and Closure bundles look more like what you might hand-author if you were just writing one big module. Here’s Rollup:  
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

If you understand the inherent cost of functions-within-functions in JavaScript, and of looking up a value in an associative array, then you’ll be in a good position to understand the following benchmark results.  
如果你清楚在 JavaScript 中使用嵌套函数与在关联数组查找一个值的固有开销， 那么你将很容易理解出现以下测试的结果的原因。

### Results
### 测试结果

I ran this benchmark on a Nexus 5 with Android 5.1.1 and Chrome 52 (to represent a low- to mid-range device) as well as an iPod Touch 6th generation running iOS 9 (to represent a high-end device).  
我选择在搭载 Android 5.1.1 与 Chrome 52 的 Nexus 5（代表中低端设备）和运行 iOS 9 的第 6 代 iPod Touch（代表高端设备）上进行测试。

Here are the results for the Nexus 5 ([tabular results][26]):  
这是 Nexus 5 下的测试结果（[查看表格][26]）：

[![Nexus 5 results][27]](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_5.png)
[![Nexus 5 结果][27]](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_5.png)

And here are the results for the iPod Touch ([tabular results][28]):  
这是 iPod Touch 下的测试结果（[查看表格][28]）：

[![iPod Touch results][29]](https://nolanwlawson.files.wordpress.com/2016/08/modules_ipod.png)
[![iPod Touch 结果][29]](https://nolanwlawson.files.wordpress.com/2016/08/modules_ipod.png)

At 100 modules, the variance between all the bundlers is pretty negligible, but once we get up to 1000 or 5000 modules, the difference becomes severe. The iPod Touch is hurt the least by the choice of bundler, but the Nexus 5, being an aging Android phone, suffers a lot under Browserify and Webpack.  
在 100 个模块时，各包的差异是微不足道的，但是一旦模块数量达到 1000 个甚至 5000 个时，差异将会变得非常巨大。iPod Touch 在不同包上的差异并不明显，而对于具有一定年代的 Nexus 5 来说，Browserify 和 Webpack 明显耗时更多。

I also find it interesting that both Rollup and Closure’s execution cost is essentially free for the iPod, regardless of the number of modules. And in the case of the Nexus 5, the runtime costs aren’t free, but they’re still much cheaper for Rollup/Closure than for Browserify/Webpack, the latter of which chew up the main thread for several frames if not hundreds of milliseconds, meaning that the UI is frozen just waiting for the module loader to finish running.  
与此同时，我发现有意思的是 Rollup 和 Closure 的运行开销对于 iPod而言几乎可以忽略，并且与模块的数量关系也不大。而对于 Nexus 5 来说，运行的开销并非完全可以忽略，但它们仍比 Browserify 或 Webpack 低很多。后者若未在几百毫秒内完成加载则将会占用主线程的好几帧的时间，这就意味着用户界面将冻结并且等待直到模块载入完成。

Note that both of these tests were run on a fast Gigabit connection, so in terms of network costs, it’s really a best-case scenario. Using the Chrome Dev Tools, we can manually throttle that Nexus 5 down to 3G and see the impact ([tabular results][30]):  
值得注意的是前面这些测试都是在千兆网速下进行的，所以在网络情况来看，这只是一个最理想的状况。借助 Chrome 开发者工具，我们可以认为地将 Nexus 5 的网速限制到 3G 水平，然后来看一眼这对测试产生的影响（[查看表格][30]）：

[![Nexus 5 3G results][31]](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_53g.png)
[![Nexus 5 3G 结果][31]](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_53g.png)

Once we take slow networks into account, the difference between Browserify/Webpack and Rollup/Closure is even more stark. In the case of 1000 modules (which is close to Reddit’s count of 1050), Browserify takes about 400 milliseconds longer than Rollup. And that 400ms is no small potatoes, since Google and Bing have both noted that sub-second delays have an [appreciable impact on user engagement][32].  
一旦我们将网速考虑进来，Browserify/Webpack 和 Rollup/Closure 的差异将变得更为显著。在 1000 个模块规模（接近于 Reddit 1050 个模块的规模）时，Browserify 花费的时间比 Rollup 长大约 400 毫秒。然而 400 毫秒已经不是一个小数目了，正如 Google 和 Bing 指出的，亚秒级的延迟都会 [对用户的参与产生明显的影响][32] 。

One thing to note is that this benchmark doesn’t measure the precise execution cost of 100, 1000, or 5000 modules per se, since that will depend on your usage of require(). Inside of these bundles, I’m calling require() once per module, but if you are calling require()multiple times per module (which is the norm in most codebases) or if you are callingrequire() multiple times on-the-fly (i.e. require() within a sub-function), then you could see severe performance degradations.  
还有一件事需要指出，那就是这个测试并非测量 100 个、1000 个或者 5000 个模块的每个模块的精确运行时间。因为这还与你对 require() 函数的使用有关。在这些包中，我采用的是对每个模块调用一次 require() 函数。但如果你每个模块调用了多次 require() 函数（这在代码库中非常常见）或者你多次动态调用 require() 函数（例如在子函数中调用 require() 函数），那么你将发现明显的性能退化。 

Reddit’s mobile site is a good example of this. Even though they have 1050 modules, I clocked their real-world Browserify execution time as much worse than the “1000 modules” benchmark. When profiling on that same Nexus 5 running Chrome, I measured 2.14 seconds for Reddit’s Browserify require() function, and 197 milliseconds for the equivalent function in the “1000 modules” script. (In desktop Chrome on an i7 Surface Book, I also measured it at 559ms vs 37ms, which is pretty astonishing given we’re talking desktop.)  
Reddit 的移动站点就是一个很好的例子。虽然该站点有 1050 个模块，但是我测量了它们使用 Browserify 的实际执行时间后发现比“1000 个模块”的测试结果差好多。当使用那台运行 Chrome 的 Nexus 5 时，我测出 Reddit 的 Browserify require() 函数耗时 2.14 秒。而那个“1000 个模块”脚本中的等效函数只需要 197 毫秒（在搭载 i7 处理器的 Surface Book 上的桌面版 Chrome，我测出的结果分别为 559 毫秒与 37 毫秒，虽然给出桌面平台的结果有些令人惊讶）。

This suggests that it may be worthwhile to run the benchmark again with multiplerequire()s per module, although in my opinion it wouldn’t be a fair fight for Browserify/Webpack, since Rollup/Closure both resolve duplicate ES6 imports into a single hoisted variable declaration, and it’s also impossible to import from anywhere but the top-level scope. So in essence, the cost of a single import for Rollup/Closure is the same as the cost of n imports, whereas for Browserify/Webpack, the execution cost will increase linearly with n require()s.  
这结果提示我们有必要对每个模块使用多个 require() 函数的情况再进行一次测试。不过，我并不认为这对 Browserify 和 Webpack 会是一个公平的测试，因为 Rollup 和 Closure 都会将重复的 ES6 库导入处理为一个的顶级变量声明，同时也阻止了顶层空间以外的其他区域的导入。所以根本上来说，Rollup 和 Closure 中一个导入和多个导入的开销是相同的，而对于 Browserify 和 Webpack，运行开销随 require() 函数的数量线性增长。

For the purposes of this analysis, though, I think it’s best to just assume that the number of modules is only a lower bound for the performance hit you might feel. In reality, the “5000 modules” benchmark may be a better yardstick for “5000 require() calls.”  
为了我们这个分析的最初目的，我认为最好假设模块的数量是性能的短板。而事实上，“5000 个模块”也是一个比“5000 个 require() 函数调用”更好的度量标准。

### Conclusions

First off, the bundle-collapser plugin seems to be a valuable addition to Browserify. If you’re not using it in production, then your bundle will be a bit larger and slower than it would be otherwise (although I must admit the difference is slight). Alternatively, you could switch to Webpack and get an even faster bundle without any extra configuration. (Note that it pains me to say this, since I’m a diehard Browserify fanboy.)

However, these results clearly show that Webpack and Browserify both underperform compared to Rollup and Closure Compiler, and that the gap widens the more modules you add. Unfortunately I’m not sure [Webpack 2][33] will solve any of these problems, because although they’ll be [borrowing some ideas from Rollup][34], they seem to be more focused on the [tree-shaking aspects][35] and not the scope-hoisting aspects. (Update: a better name is “inlining,” and the Webpack team is [working on it][36].)

Given these results, I’m surprised Closure Compiler and Rollup aren’t getting much traction in the JavaScript community. I’m guessing it’s due to the fact that (in the case of the former) it has a Java dependency, and (in the case of the latter) it’s still fairly immature and doesn’t quite work out-of-the-box yet (see [Calvin’s Metcalf’s comments][37] for a good summary).

Even without the average JavaScript developer jumping on the Rollup/Closure bandwagon, though, I think npm package authors are already in a good position to help solve this problem. If you npm install lodash, you’ll notice that the main export is one giant JavaScript module, rather than what you might expect given Lodash’s hyper-modular nature (require('lodash/uniq'), require('lodash.uniq'), etc.). For PouchDB, we made a similar decision to [use Rollup as a prepublish step][38], which produces the smallest possible bundle in a way that’s invisible to users.

I also created [rollupify][39] to try to make this pattern a bit easier to just drop-in to existing Browserify projects. The basic idea is to use imports and exports within your own project ([cjs-to-es6][40] can help migrate), and then use require() for third-party packages. That way, you still have all the benefits of modularity within your own codebase, while exposing more-or-less one big module to your users. Unfortunately, you still pay the costs for third-party modules, but I’ve found that this is a good compromise given the current state of the npm ecosystem.

So there you have it: one horse-sized JavaScript duck is faster than a hundred duck-sized JavaScript horses. Despite this fact, though, I hope that our community will eventually realize the pickle we’re in – advocating for a “small modules” philosophy that’s good for developers but bad for users – and improve our tools, so that we can have the best of both worlds.

### Bonus round! Three desktop browsers

Normally I like to run performance tests on mobile devices, since that’s where you see the clearest differences. But out of curiosity, I also ran this benchmark on Chrome 52, Edge 14, and Firefox 48 on an i7 Surface Book using Windows 10 RS1\. Here are the results:

Chrome 52 ([tabular results][41])

[![Chrome results][42]](https://nolanwlawson.files.wordpress.com/2016/08/modules_chrome.png)

Edge 14 ([tabular results][43])

[![Edge results][44]](https://nolanwlawson.files.wordpress.com/2016/08/modules_edge.png)

Firefox 48 ([tabular results][45])

[![Firefox results][46]](https://nolanwlawson.files.wordpress.com/2016/08/modules_firefox.png)

The only interesting tidbits I’ll call out in these results are:

1.  bundle-collapser is definitely not a slam-dunk in all cases.
2.  The ratio of network-to-execution time is always extremely high for Rollup and Closure; their runtime costs are basically zilch. ChakraCore and SpiderMonkey eat them up for breakfast, and V8 is not far behind.

This latter point could be extremely important if your JavaScript is largely lazy-loaded, because if you can afford to wait on the network, then using Rollup and Closure will have the additional benefit of not clogging up the UI thread, i.e. they’ll introduce less jank than Browserify or Webpack.

Update: in response to this post, JDD has [opened an issue on Webpack][47]. There’s also [one on Browserify][48].

Update 2: [Ryan Fitzer][49] has generously added RequireJS and RequireJS with [Almond][50] to the benchmark, both of which use AMD instead of CommonJS or ES6.

Testing shows that RequireJS has [the largest bundle sizes][51] but surprisingly its runtime costs are [very close to Rollup and Closure][52]. Here are the results for a Nexus 5 running Chrome 52 throttled to 3G:

[![Nexus 5 (3G) results with RequireJS][53]](https://nolanwlawson.files.wordpress.com/2016/08/2016-08-20-14_45_29-small_modules3-xlsx-excel.png)



--------------------------------------------------------------------------------

via: https://nolanlawson.com/2016/08/15/the-cost-of-small-modules/?utm_source=javascriptweekly&utm_medium=email

作者：[Nolan][a]
译者：[Yinr](https://github.com/Yinr)
校对：[校对者ID](https://github.com/校对者ID)

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
