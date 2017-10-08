探索传统 JavaScript 基准测试
============================================================

可以很公平地说，[JavaScript][22] 是当下软件工程中*最重要的技术*。对于那些深入接触过编程语言、编译器和虚拟机的人来说，这仍然有点令人惊讶，因为在语言设计者们看来，JavaScript 不是十分优雅；在编译器工程师们看来，它没有多少可优化的地方；甚至还没有一个伟大的标准库。这取决于你和谁吐槽，JavaScript 的缺点你花上数周都枚举不完，而你总会找到一些你从所未知的奇怪的东西。尽管这看起来明显困难重重，不过 JavaScript 还是成为了当今 web 的核心，并且还（通过 [Node.js][23]）成为服务器端和云端的主导技术，甚至还开辟了进军物联网领域的道路。

那么问题来了，为什么 JavaScript 如此受欢迎？或者说如此成功？我知道没有一个很好的答案。如今我们有许多使用 JavaScript 的好理由，或许最重要的是围绕其构建的庞大的生态系统，以及现今大量可用的资源。但所有这一切实际上是发展到一定程度的后果。为什么 JavaScript 变得流行起来了？嗯，你或许会说，这是 web 多年来的通用语了。但是在很长一段时间里，人们极其讨厌 JavaScript。回顾过去，似乎第一波 JavaScript 浪潮爆发在上个年代的后半段。那个时候 JavaScript 引擎加速了各种不同的任务的执行，很自然的，这可能让很多人对 JavaScript 刮目相看。

回到过去那些日子，这些加速使用了现在所谓的传统 JavaScript 基准进行测试——从苹果的 [SunSpider 基准][24]（JavaScript 微基准之母）到 Mozilla 的 [Kraken 基准][25] 和谷歌的 V8 基准。后来，V8 基准被 [Octane 基准][26] 取代，而苹果发布了新的 [JetStream 基准][27]。这些传统的 JavaScript 基准测试驱动了无数人的努力，使 JavaScript 的性能达到了本世纪初没人能预料到的水平。据报道其性能加速达到了 1000 倍，一夜之间在网站使用 `<script>` 标签不再是与魔鬼共舞，做客户端不再仅仅是可能的了，甚至是被鼓励的。

[![性能测试，JS 基准的简史](http://benediktmeurer.de/images/2016/sethcds-20161216.png)][28]

（来源： [Advanced JS performance with V8 and Web Assembly](https://www.youtube.com/watch?v=PvZdTZ1Nl5o)， Chrome Developer Summit 2016, @s3ththompson。）

现在是 2016 年，所有（相关的）JavaScript 引擎的性能都达到了一个令人难以置信的水平，web 应用像原生应用一样快（或者能够像原生应用一样快）。引擎配有复杂的优化编译器，通过收集之前的关于类型/形状的反馈来推测某些操作（例如属性访问、二进制操作、比较、调用等），生成高度优化的机器代码的短序列。大多数优化是由 SunSpider 或 Kraken 等微基准以及 Octane 和 JetStream 等静态测试套件驱动的。由于有像 [asm.js][29] 和 [Emscripten][30] 这样的 JavaScript 技术，我们甚至可以将大型 C++ 应用程序编译成 JavaScript，并在你的浏览器上运行，而无需下载或安装任何东西。例如，现在你可以在 web 上玩 [AngryBots][31]，无需沙盒，而过去的 web 游戏需要安装一堆诸如 Adobe Flash 或 Chrome PNaCl 的特殊插件。

这些成就绝大多数都要归功于这些微基准和静态性能测试套件的出现，以及与这些传统的 JavaScript 基准间的竞争的结果。你可以对 SunSpider 表示不满，但很显然，没有 SunSpider，JavaScript 的性能可能达不到今天的高度。好吧，赞美到此为止。现在看看另一方面，所有的静态性能测试——无论是<ruby>微基准<rt>micro-benchmark</rt></ruby>还是大型应用的<ruby>宏基准<rt>macro-benchmark</rt></ruby>，都注定要随着时间的推移变成噩梦！为什么？因为在开始摆弄它之前，基准只能教你这么多。一旦达到某个阔值以上（或以下），那么有益于特定基准的优化的一般适用性将呈指数级下降。例如，我们将 Octane 作为现实世界中 web 应用性能的代表，并且在相当长的一段时间里，它可能做得很不错，但是现在，Octane 与现实场景中的时间分布是截然不同的，因此即使眼下再优化 Octane 乃至超越自身，可能在现实世界中还是得不到任何显著的改进（无论是通用 web 还是 Node.js 的工作负载）。

[![基准与现实世界的时间分布对比](http://benediktmeurer.de/images/2016/verwaestblinkon-20161216.png)][32]

（来源：[Real-World JavaScript Performance](https://youtu.be/xCx4uC7mn6Y)，BlinkOn 6 conference，@tverwaes）

由于传统 JavaScript 基准（包括最新版的 JetStream 和 Octane）可能已经背离其有用性变得越来越远，我们开始在 2016 年初寻找新的方法来测量现实场景的性能，为 V8 和 Chrome 添加了大量新的性能追踪钩子。我们还特意添加一些机制来查看我们在浏览 web 时的时间究竟开销在哪里，例如，是脚本执行、垃圾回收、编译，还是什么地方？而这些调查的结果非常有趣和令人惊讶。从上面的幻灯片可以看出，运行 Octane 花费了 70% 以上的时间去执行 JavaScript 和垃圾回收，而浏览 web 的时候，通常执行 JavaScript 花费的时间不到 30%，垃圾回收占用的时间永远不会超过 5%。在 Octane 中并没有体现出它花费了大量时间来解析和编译。因此，将更多的时间用在优化 JavaScript 执行上将提高你的 Octane 跑分，但不会对加载 [youtube.com][33] 有任何积极的影响。事实上，花费更多的时间来优化 JavaScript 执行甚至可能有损你现实场景的性能，因为编译器需要更多的时间，或者你需要跟踪更多的反馈，最终在编译、垃圾回收和<ruby>运行时桶<rt>Runtime bucket</rt></ruby>等方面开销了更多的时间。

[![测速表](http://benediktmeurer.de/images/2016/speedometer-20161216.png)][34]

还有另外一组基准测试用于测量浏览器整体性能（包括 JavaScript 和 DOM 性能），最新推出的是 [Speedometer 基准][35]。该基准试图通过运行一个用不同的主流 web 框架实现的简单的 [TodoMVC][36] 应用（现在看来有点过时了，不过新版本正在研发中）以捕获更真实的现实场景的性能。上述幻灯片中的各种测试 （Angular、Ember、React、Vanilla、Flight 和 Backbone）挨着放在 Octane 之后，你可以看到，此时此刻这些测试似乎更好地代表了现实世界的性能指标。但是请注意，这些数据收集在本文撰写将近 6 个月以前，而且我们优化了更多的现实场景模式（例如我们正在重构垃圾回收系统以显著地降低开销，并且 [解析器也正在重新设计][37]）。还要注意的是，虽然这看起来像是只和浏览器相关，但我们有非常强有力的证据表明传统的峰值性能基准也不能很好的代表现实场景中 Node.js 应用性能。

[![Speedometer 和 Octane 对比](http://benediktmeurer.de/images/2016/verwaestblinkon2-20161216.png)][38]

（来源： [Real-World JavaScript Performance](https://youtu.be/xCx4uC7mn6Y)， BlinkOn 6 conference, @tverwaes.）

所有这一切可能已经路人皆知了，因此我将用本文剩下的部分强调一些具体案例，它们对关于我为什么认为这不仅有用，而且必须停止关注某一阈值的静态峰值性能基准测试对于 JavaScript 社区的健康是很关键的。让我通过一些例子说明 JavaScript 引擎怎样来玩弄基准的。

### 臭名昭著的 SunSpider 案例

一篇关于传统 JavaScript 基准测试的博客如果没有指出 SunSpider 那个明显的问题是不完整的。让我们从性能测试的最佳实践开始，它在现实场景中不是很适用：[bitops-bitwise-and.js` 性能测试][39]。

[![bitops-bitwise-and.js](http://benediktmeurer.de/images/2016/bitops-bitwise-and-20161216.png)][40]

有一些算法需要进行快速的 AND 位运算，特别是从 `C/C++` 转译成 JavaScript 的地方，所以快速执行该操作确实有点意义。然而，现实场景中的网页可能不关心引擎在循环中执行 AND 位运算是否比另一个引擎快两倍。但是再盯着这段代码几秒钟后，你可能会注意到在第一次循环迭代之后 `bitwiseAndValue` 将变成 `0`，并且在接下来的 599999 次迭代中将保持为 `0`。所以一旦你让此获得了好的性能，比如在差不多的硬件上所有测试均低于 5ms，在经过尝试之后你会意识到，只有循环的第一次是必要的，而剩余的迭代只是在浪费时间（例如 [loop peeling][41] 后面的死代码），那你现在就可以开始玩弄这个基准测试了。这需要 JavaScript 中的一些机制来执行这种转换，即你需要检查 `bitwiseAndValue` 是全局对象的常规属性还是在执行脚本之前不存在，全局对象或者它的原型上必须没有拦截器。但如果你真的想要赢得这个基准测试，并且你愿意全力以赴，那么你可以在不到 1ms 的时间内完成这个测试。然而，这种优化将局限于这种特殊情况，并且测试的轻微修改可能不再触发它。

好吧，那么 [bitops-bitwise-and.js][42] 测试彻底肯定是微基准最失败的案例。让我们继续转移到 SunSpider 中更逼真的场景——[string-tagcloud.js][43] 测试，它基本上是运行一个较早版本的 `json.js polyfill`。该测试可以说看起来比位运算测试更合理，但是花点时间查看基准的配置之后立刻会发现：大量的时间浪费在一条 `eval` 表达式（高达 20% 的总执行时间被用于解析和编译，再加上实际执行编译后代码的 10% 的时间）。

[![string-tagcloud.js](http://benediktmeurer.de/images/2016/string-tagcloud-20161216.png)][44]

仔细看看，这个 `eval` 只执行了一次，并传递一个 JSON 格式的字符串，它包含一个由 2501 个含有 `tag` 和 `popularity` 属性的对象组成的数组：

```
([
  {
    "tag": "titillation",
    "popularity": 4294967296
  },
  {
    "tag": "foamless",
    "popularity": 1257718401
  },
  {
    "tag": "snarler",
    "popularity": 613166183
  },
  {
    "tag": "multangularness",
    "popularity": 368304452任何
  },
  {
    "tag": "Fesapo unventurous",
    "popularity": 248026512
  },
  {
    "tag": "esthesioblast",
    "popularity": 179556755
  },
  {
    "tag": "echeneidoid",
    "popularity": 136641578
  },
  {
    "tag": "embryoctony",
    "popularity": 107852576
  },
  ...
])
```

显然，解析这些对象字面量，为其生成本地代码，然后执行该代码的成本很高。将输入的字符串解析为 JSON 并生成适当的对象图的开销将更加低廉。所以，加快这个基准测试的一个小把戏就是模拟 `eval`，并尝试总是将数据首先作为 JSON 解析，如果以 JSON 方式读取失败，才回退进行真实的解析、编译、执行（尽管需要一些额外的黑魔法来跳过括号）。早在 2007 年，这甚至不算是一个坏点子，因为没有 [JSON.parse][45]，不过在 2017 年这只是 JavaScript 引擎的技术债，可能会让 `eval` 的合法使用遥遥无期。

```
--- string-tagcloud.js.ORIG     2016-12-14 09:00:52.869887104 +0100
+++ string-tagcloud.js  2016-12-14 09:01:01.033944051 +0100
@@ -198,7 +198,7 @@
                     replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(:?[eE][+\-]?\d+)?/g, ']').
                     replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

-                j = eval('(' + this + ')');
+                j = JSON.parse(this);

                 return typeof filter === 'function' ? walk('', j) : j;
             }
```

事实上，将基准测试更新到现代 JavaScript 会立刻会性能暴增，正如今天的 `V8 LKGR` 从 36ms 降到了 26ms，性能足足提升了 30%！

```
$ node string-tagcloud.js.ORIG
Time (string-tagcloud): 36 ms.
$ node string-tagcloud.js
Time (string-tagcloud): 26 ms.
$ node -v
v8.0.0-pre
$
```

这是静态基准和性能测试套件常见的一个问题。今天，没有人会正儿八经地用 `eval` 解析 `JSON` 数据（不仅是因为性能问题，还出于严重的安全性考虑），而是坚持为最近五年写的代码使用 [JSON.parse][46]。事实上，使用 `eval` 解析 JSON 可能会被视作产品级代码的的一个漏洞！所以引擎作者致力于新代码的性能所作的努力并没有反映在这个古老的基准中，相反地，而是使得 `eval` 不必要地~~更智能~~复杂化，从而赢得 `string-tagcloud.js` 测试。

好吧，让我们看看另一个例子：[3d-cube.js][47]。这个基准测试做了很多矩阵运算，即便是最聪明的编译器对此也无可奈何，只能说执行而已。基本上，该基准测试花了大量的时间执行 `Loop` 函数及其调用的函数。

[![3d-cube.js](http://benediktmeurer.de/images/2016/3d-cube-loop-20161216.png)][48]

一个有趣的发现是：`RotateX`、`RotateY` 和 `RotateZ` 函数总是调用相同的常量参数 `Phi`。

[![3d-cube.js](http://benediktmeurer.de/images/2016/3d-cube-rotate-20161216.png)][49]

这意味着我们基本上总是为 [Math.sin][50] 和 [Math.cos][51] 计算相同的值，每次执行都要计算 204 次。只有 3 个不同的输入值：

* 0.017453292519943295
* 0.05235987755982989
* 0.08726646259971647

显然，你可以在这里做的一件事情就是通过缓存以前的计算值来避免重复计算相同的正弦值和余弦值。事实上，这是 V8 以前的做法，而其它引擎例如 `SpiderMonkey` 目前仍然在这样做。我们从 V8 中删除了所谓的<ruby>超载缓存<rt>transcendental cache</rt></ruby>，因为缓存的开销在实际的工作负载中是不可忽视的，你不可能总是在一行代码中计算相同的值，这在其它地方倒不稀奇。当我们在 2013 和 2014 年移除这个特定的基准优化时，我们对 SunSpider 基准产生了强烈的冲击，但我们完全相信，为基准而优化并没有任何意义，并同时以这种方式批判了现实场景中的使用案例。

[![3d-cube 基准](http://benediktmeurer.de/images/2016/3d-cube-awfy-20161216.png)][52]

（来源：[arewefastyet.com](https://arewefastyet.com/#machine=12&view=single&suite=ss&subtest=cube&start=1343350217&end=1415382608)）

显然，处理恒定正弦/余弦输入的更好的方法是一个内联的启发式算法，它试图平衡内联因素与其它不同的因素，例如在调用位置优先选择内联，其中<ruby>常量叠算<rt>constant folding</rt></ruby>可以是有益的，例如在 `RotateX`、`RotateY` 和 `RotateZ` 调用位置的案例中。但是出于各种原因，这对于 `Crankshaft` 编译器并不可行。使用 `Ignition` 和 `TurboFan` 倒是一个明智的选择，我们已经在开发更好的[内联启发式算法][53]。

#### 垃圾回收（GC）是有害的

除了这些非常具体的测试问题，SunSpider 基准测试还有一个根本性的问题：总体执行时间。目前 V8 在适当的英特尔硬件上运行整个基准测试大概只需要 200ms（使用默认配置）。<ruby>次垃圾回收<rt>minor GC</rt></ruby>在 1ms 到 25ms 之间（取决于新空间中的存活对象和旧空间的碎片），而<ruby>主垃圾回收<rt>major GC</rt></ruby>暂停的话可以轻松减掉 30ms（甚至不考虑增量标记的开销），这超过了 SunSpider 套件总体执行时间的 10%！因此，任何不想因垃圾回收循环而造成减速 10-20% 的引擎，必须用某种方式确保它在运行 SunSpider 时不会触发垃圾回收。

[![driver-TEMPLATE.html](http://benediktmeurer.de/images/2016/sunspider-driver-20161216.png)][54]

就实现而言，有不同的方案，不过就我所知，没有一个在现实场景中产生了任何积极的影响。V8 使用了一个相当简单的技巧：由于每个 SunSpider 套件都运行在一个新的 `<iframe>` 中，这对应于 V8 中一个新的本地上下文，我们只需检测快速的 `<iframe>` 创建和处理（所有的 SunSpider 测试每个花费的时间小于 50ms），在这种情况下，在处理和创建之间执行垃圾回收，以确保我们在实际运行测试的时候不会触发垃圾回收。这个技巧运行的很好，在 99.9% 的案例中没有与实际用途冲突；除了时不时的你可能会受到打击，不管出于什么原因，如果你做的事情让你看起来像是 V8 的 SunSpider 测试驱动程序，你就可能被强制的垃圾回收打击到，这有可能对你的应用导致负面影响。所以谨记一点：**不要让你的应用看起来像 SunSpider！**

我可以继续展示更多 SunSpider 示例，但我不认为这非常有用。到目前为止，应该清楚的是，为刷新 SunSpider 评分而做的进一步优化在现实场景中没有带来任何好处。事实上，世界可能会因为没有 SunSpider 而更美好，因为引擎可以放弃只是用于 SunSpider 的奇淫技巧，或者甚至可以伤害到现实中的用例。不幸的是，SunSpider 仍然被（科技）媒体大量地用来比较他们眼中的浏览器性能，或者甚至用来比较手机！所以手机制造商和安卓制造商对于让 SunSpider（以及其它现在毫无意义的基准 FWIW） 上的 Chrome 看起来比较体面自然有一定的兴趣。手机制造商通过销售手机来赚钱，所以获得良好的评价对于电话部门甚至整间公司的成功至关重要。其中一些部门甚至在其手机中配置在 SunSpider 中得分较高的旧版 V8，将他们的用户置于各种未修复的安全漏洞之下（在新版中早已被修复），而让用户被最新版本的 V8 带来的任何现实场景的性能优势拒之门外！

[![Galaxy S7 和 S7 Edge 的评价：三星的高光表现](http://benediktmeurer.de/images/2016/engadget-20161216.png)][55]

（来源：[www.engadget.com](https://www.engadget.com/2016/03/08/galaxy-s7-and-s7-edge-review/)）

作为 JavaScript 社区的一员，如果我们真的想认真对待 JavaScript 领域的现实场景的性能，我们需要让各大技术媒体停止使用传统的 JavaScript 基准来比较浏览器或手机。能够在每个浏览器中运行一个基准测试，并比较它的得分自然是好的，但是请使用一个与当今世界相关的基准，例如真实的 web 页面；如果你觉得需要通过浏览器基准来比较两部手机，请至少考虑使用 [Speedometer][56]。

#### 轻松一刻

![](http://images-cdn.9gag.com/photo/avZd9NX_700b.jpg)

我一直很喜欢这个 [Myles Borins][57] 谈话，所以我不得不无耻地向他偷师。现在我们从 SunSpider 的谴责中回过头来，让我们继续检查其它经典基准。

### 不是那么显眼的 Kraken 案例

Kraken 基准是 [Mozilla 于 2010 年 9 月 发布的][58]，据说它包含了现实场景应用的片段/内核，并且与 SunSpider 相比少了一个微基准。我不想在 Kraken 上花太多口舌，因为我认为它不像 SunSpider 和 Octane 一样对 JavaScript 性能有着深远的影响，所以我将强调一个特别的案例——[audio-oscillator.js][59] 测试。

[![audio-oscillator.js](http://benediktmeurer.de/images/2016/audio-oscillator-20161216.png)][60]

正如你所见，测试调用了 `calcOsc` 函数 500 次。`calcOsc` 首先在全局的 `sine` `Oscillator` 上调用 `generate`，然后创建一个新的 `Oscillator`，调用它的 `generate` 方法并将其添加到全局的 `sine` `Oscillator` 里。没有详细说明测试为什么是这样做的，让我们看看 `Oscillator` 原型上的 `generate` 方法。

[![audio-oscillator-data.js](http://benediktmeurer.de/images/2016/audio-oscillator-generate-20161216.png)][61]

让我们看看代码，你也许会觉得这里主要是循环中的数组访问或者乘法或者 [Math.round][62] 调用，但令人惊讶的是 `offset % this.waveTableLength` 表达式完全支配了 `Oscillator.prototype.generate` 的运行。在任何的英特尔机器上的分析器中运行此基准测试显示，超过 20% 的时间占用都属于我们为模数生成的 `idiv` 指令。然而一个有趣的发现是，`Oscillator` 实例的 `waveTableLength` 字段总是包含相同的值——2048，因为它在 `Oscillator` 构造器中只分配一次。

[![audio-oscillator-data.js](http://benediktmeurer.de/images/2016/audio-oscillator-constructor-20161216.png)][63]

如果我们知道整数模数运算的右边是 2 的幂，我们显然可以生成[更好的代码][64]，完全避免了英特尔上的 `idiv` 指令。所以我们需要获取一种信息使 `this.waveTableLength` 从  `Oscillator` 构造器到 `Oscillator.prototype.generate` 中的模运算都是 2048。一个显而易见的方法是尝试依赖于将所有内容内嵌到 `calcOsc` 函数，并让 `load/store` 消除为我们进行的常量传播，但这对于在 `calcOsc` 函数之外分配的 `sine` `oscillator` 无效。

因此，我们所做的就是添加支持跟踪某些常数值作为模运算符的右侧反馈。这在 V8 中是有意义的，因为我们为诸如 `+`、`*` 和 `%` 的二进制操作跟踪类型反馈，这意味着操作者跟踪输入的类型和产生的输出类型（参见最近的圆桌讨论中关于[动态语言的快速运算][65]的幻灯片）。当然，用 `fullcodegen` 和 `Crankshaft` 挂接起来也是相当容易的，`MOD` 的 `BinaryOpIC` 也可以跟踪右边已知的 2 的冥。

```
$ ~/Projects/v8/out/Release/d8 --trace-ic audio-oscillator.js
[...SNIP...]
[BinaryOpIC(MOD:None*None->None) => (MOD:Smi*2048->Smi) @ ~Oscillator.generate+598 at audio-oscillator.js:697]
[...SNIP...]
$
```

事实上，以默认配置运行的 V8 （带有 Crankshaft 和 fullcodegen）表明 `BinaryOpIC` 正在为模数的右侧拾取适当的恒定反馈，并正确跟踪左侧始终是一个小整数（以 V8 的话叫做 `Smi`），我们也总是产生一个小整数结果。 使用 `--print-opt-code -code-comments` 查看生成的代码，很快就显示出，`Crankshaft` 利用反馈在 `Oscillator.prototype.generate` 中为整数模数生成一个有效的代码序列：

```
[...SNIP...]
                  ;;; <@80,#84> load-named-field
0x133a0bdacc4a   330  8b4343         movl rax,[rbx+0x43]
                  ;;; <@83,#86> compare-numeric-and-branch
0x133a0bdacc4d   333  3d00080000     cmp rax,0x800
0x133a0bdacc52   338  0f85ff000000   jnz 599  (0x133a0bdacd57)
[...SNIP...]
                  ;;; <@90,#94> mod-by-power-of-2-i
0x133a0bdacc5b   347  4585db         testl r11,r11
0x133a0bdacc5e   350  790f           jns 367  (0x133a0bdacc6f)
0x133a0bdacc60   352  41f7db         negl r11
0x133a0bdacc63   355  4181e3ff070000 andl r11,0x7ff
0x133a0bdacc6a   362  41f7db         negl r11
0x133a0bdacc6d   365  eb07           jmp 374  (0x133a0bdacc76)
0x133a0bdacc6f   367  4181e3ff070000 andl r11,0x7ff
[...SNIP...]
                  ;;; <@127,#88> deoptimize
0x133a0bdacd57   599  e81273cdff     call 0x133a0ba8406e
[...SNIP...]
```

所以你看到我们加载 `this.waveTableLength`（`rbx` 持有 `this` 的引用）的值，检查它仍然是 2048（十六进制的 0x800），如果是这样，就只用适当的掩码  0x7ff（`r11` 包含循环感应变量 `i` 的值）执行一个位操作 AND ，而不是使用 `idiv` 指令（注意保留左侧的符号）。

#### 过度特定的问题

所以这个技巧酷毙了，但正如许多基准关注的技巧都有一个主要的缺点：太过于特定了！一旦右侧发生变化，所有优化过的代码就失去了优化（假设右手始终是不再处理的 2 的冥），任何进一步的优化尝试都必须再次使用 `idiv`，因为 `BinaryOpIC` 很可能以 `Smi * Smi -> Smi` 的形式报告反馈。例如，假设我们实例化另一个 `Oscillator`，在其上设置不同的 `waveTableLength`，并为 `Oscillator` 调用 `generate`，那么即使我们实际上感兴趣的 `Oscillator` 不受影响，我们也会损失 20% 的性能（例如，引擎在这里实行非局部惩罚）。

```
--- audio-oscillator.js.ORIG    2016-12-15 22:01:43.897033156 +0100
+++ audio-oscillator.js 2016-12-15 22:02:26.397326067 +0100
@@ -1931,6 +1931,10 @@
 var frequency = 344.53;
 var sine = new Oscillator(Oscillator.Sine, frequency, 1, bufferSize, sampleRate);

+var unused = new Oscillator(Oscillator.Sine, frequency, 1, bufferSize, sampleRate);
+unused.waveTableLength = 1024;
+unused.generate();
+
 var calcOsc = function() {
   sine.generate();
```

将原始的 `audio-oscillator.js` 执行时间与包含额外未使用的 `Oscillator` 实例与修改的 `waveTableLength` 的版本进行比较，显示的是预期的结果：

```
$ ~/Projects/v8/out/Release/d8 audio-oscillator.js.ORIG
Time (audio-oscillator-once): 64 ms.
$ ~/Projects/v8/out/Release/d8 audio-oscillator.js
Time (audio-oscillator-once): 81 ms.
$
```

这是一个非常可怕的性能悬崖的例子：假设开发人员编写代码库，并使用某些样本输入值进行仔细的调整和优化，性能是体面的。现在，用户读过了性能说明开始使用该库，但不知何故从性能悬崖下降，因为她/他正在以一种稍微不同的方式使用库，即特定的 `BinaryOpIC` 的某种污染方式的类型反馈，并且遭受 20% 的减速（与该库作者的测量相比），该库的作者和用户都无法解释，这似乎是随机的。

现在这种情况在 JavaScript 领域并不少见，不幸的是，这些悬崖中有几个是不可避免的，因为它们是由于 JavaScript 的性能是基于乐观的假设和猜测。我们已经花了 **大量** 时间和精力来试图找到避免这些性能悬崖的方法，而仍提供了（几乎）相同的性能。事实证明，尽可能避免 `idiv` 是很有意义的，即使你不一定知道右边总是一个 2 的幂（通过动态反馈），所以为什么 `TurboFan` 的做法有异于 `Crankshaft` 的做法，因为它总是在运行时检查输入是否是 2 的幂，所以一般情况下，对于有符整数模数，优化右手侧的（未知的） 2 的冥看起来像这样（伪代码）：

```
if 0 < rhs then
  msk = rhs - 1
  if rhs & msk != 0 then
    lhs % rhs
  else
    if lhs < 0 then
      -(-lhs & msk)
    else
      lhs & msk
else
  if rhs < -1 then
    lhs % rhs
  else
    zero
```

这产生更加一致和可预测的性能（使用 `TurboFan`）：

```
$ ~/Projects/v8/out/Release/d8 --turbo audio-oscillator.js.ORIG
Time (audio-oscillator-once): 69 ms.
$ ~/Projects/v8/out/Release/d8 --turbo audio-oscillator.js
Time (audio-oscillator-once): 69 ms.
$
```

基准和过度特定化的问题在于基准可以给你提示可以看看哪里以及该怎么做，但它不告诉你应该做到什么程度，不能保护合理优化。例如，所有 JavaScript 引擎都使用基准来防止性能回退，但是运行 Kraken 不能保护我们在 `TurboFan` 中使用的常规方法，即我们可以将 `TurboFan` 中的模优化降级到过度特定的版本的 `Crankshaft`，而基准不会告诉我们性能回退的事实，因为从基准的角度来看这很好！现在你可以扩展基准，也许以上面我们相同的方式，并试图用基准覆盖一切，这是引擎实现者在一定程度上做的事情，但这种方法不能任意缩放。即使基准测试方便，易于用来沟通和竞争，以常识所见你还是需要留下空间，否则过度特定化将支配一切，你会有一个真正的、非常好的可接受的性能，以及巨大的性能悬崖线。

Kraken 测试还有许多其它的问题，不过现在让我们继续讨论过去五年中最有影响力的 JavaScript 基准测试—— Octane 测试。

### 深入接触 Octane

[Octane][66] 基准是 V8 基准的继承者，最初由[谷歌于 2012 年中期发布][67]，目前的版本 Octane 2.0 [于 2013 年年底发布][68]。这个版本包含 15 个独立测试，其中对于 `Splay` 和 `Mandreel`，我们用来测试吞吐量和延迟。这些测试范围从 [微软 TypeScript 编译器][69] 编译自身到 `zlib` 测试测量原生的 [asm.js][70] 性能，再到 `RegExp` 引擎的性能测试、光线追踪器、2D 物理引擎等。有关各个基准测试项的详细概述，请参阅[说明书][71]。所有这些测试项目都经过仔细的筛选，以反映 JavaScript 性能的方方面面，我们认为这在 2012 年非常重要，或许预计在不久的将来会变得更加重要。

在很大程度上 Octane 在实现其将 JavaScript 性能提高到更高水平的目标方面无比的成功，它在 2012 年和 2013 年引导了良性的竞争，Octane 创造了巨大的业绩和成就。但是现在将近 2017 年了，世界看起来与 2012 年真的迥然不同了。除了通常和经常被引用的批评，Octane 中的大多数项目基本上已经过时（例如，老版本的 `TypeScript`，`zlib` 通过老版本的 [Emscripten][72] 编译而成，`Mandreel` 甚至不再可用等等），某种更重要的方式影响了 Octane 的用途：

我们看到大型 web 框架赢得了 web 种族之争，尤其是像 [Ember][73] 和 [AngularJS][74] 这样的重型框架，它们使用了 JavaScript 执行模式，不过根本没有被 Octane 所反映，并且经常受到（我们）Octane 具体优化的损害。我们还看到 JavaScript 在服务器和工具前端获胜，这意味着有大规模的 JavaScript 应用现在通常运行上数星期，如果不是运行上数年都不会被 Octane 捕获。正如开篇所述，我们有硬数据表明 Octane 的执行和内存配置文件与我们每天在 web 上看到的截然不同。

让我们来看看今天一些玩弄 Octane 基准的具体例子，其中优化不再反映在现实场景。请注意，即使这可能听起来有点负面回顾，它绝对不意味着这样！正如我已经说过好几遍，Octane 是 JavaScript 性能故事中的重要一章，它发挥了至关重要的作用。在过去由 Octane 驱动的 JavaScript 引擎中的所有优化都是善意地添加的，因为 Octane 是现实场景性能的好代理！每个年代都有它的基准，而对于每一个基准都有一段时间你必须要放手！

话虽如此，让我们在路上看这个节目，首先看看 `Box2D` 测试，它是基于 [Box2DWeb][75] （一个最初由 Erin Catto 编写的移植到 JavaScript 的流行的 2D 物理引擎）的。总的来说，很多浮点数学驱动了很多 JavaScript 引擎下很好的优化，但是，事实证明它包含一个可以肆意玩弄基准的漏洞（怪我，我发现了漏洞，并添加在这种情况下的漏洞）。在基准中有一个函数 `D.prototype.UpdatePairs`，看起来像这样：

```
D.prototype.UpdatePairs = function(b) {
    var e = this;
    var f = e.m_pairCount = 0,
        m;
    for (f = 0; f < e.m_moveBuffer.length; ++f) {
        m = e.m_moveBuffer[f];
        var r = e.m_tree.GetFatAABB(m);
        e.m_tree.Query(function(t) {
                if (t == m) return true;
                if (e.m_pairCount == e.m_pairBuffer.length) e.m_pairBuffer[e.m_pairCount] = new O;
                var x = e.m_pairBuffer[e.m_pairCount];
                x.proxyA = t < m ? t : m;
                x.proxyB = t >= m ? t : m;
                ++e.m_pairCount;
                return true
            },
            r)
    }
    for (f = e.m_moveBuffer.length = 0; f < e.m_pairCount;) {
        r = e.m_pairBuffer[f];
        var s = e.m_tree.GetUserData(r.proxyA),
            v = e.m_tree.GetUserData(r.proxyB);
        b(s, v);
        for (++f; f < e.m_pairCount;) {
            s = e.m_pairBuffer[f];
            if (s.proxyA != r.proxyA || s.proxyB != r.proxyB) break;
            ++f
        }
    }
};
```

一些分析显示，在第一个循环中传递给 `e.m_tree.Query` 的无辜的内部函数花费了大量的时间：

```
function(t) {
    if (t == m) return true;
    if (e.m_pairCount == e.m_pairBuffer.length) e.m_pairBuffer[e.m_pairCount] = new O;
    var x = e.m_pairBuffer[e.m_pairCount];
    x.proxyA = t < m ? t : m;
    x.proxyB = t >= m ? t : m;
    ++e.m_pairCount;
    return true
}
```

更准确地说，时间并不是开销在这个函数本身，而是由此触发的操作和内置库函数。结果，我们花费了基准调用的总体执行时间的 4-7% 在 [Compare` 运行时函数][76]上，它实现了[抽象关系][77]比较的一般情况。

![Box2D 比较分析](http://benediktmeurer.de/images/2016/box2d-compare-20161216.png)

几乎所有对运行时函数的调用都来自 [CompareICStub][78]，它用于内部函数中的两个关系比较：

```
x.proxyA = t < m ? t : m;
x.proxyB = t >= m ? t : m;
```

所以这两行无辜的代码要负起 99% 的时间开销的责任！这怎么来的？好吧，与 JavaScript 中的许多东西一样，[抽象关系比较][79] 的直观用法不一定是正确的。在这个函数中，`t` 和 `m` 都是 `L` 的实例，它是这个应用的一个中心类，但不会覆盖 `Symbol.toPrimitive`、`“toString”`、`“valueOf”` 或 `Symbol.toStringTag` 属性，它们与抽象关系比较相关。所以如果你写 `t < m` 会发生什么呢？

1. 调用 [ToPrimitive][12](`t`, `hint Number`)。
2. 运行 [OrdinaryToPrimitive][13](`t`, `"number"`)，因为这里没有 `Symbol.toPrimitive`。
3. 执行 `t.valueOf()`，这会获得 `t` 自身的值，因为它调用了默认的 [Object.prototype.valueOf][14]。
4. 接着执行 `t.toString()`，这会生成 `"[object Object]"`，因为调用了默认的 [Object.prototype.toString][15]，并且没有找到 `L` 的  [Symbol.toStringTag][16]。
5. 调用 [ToPrimitive][17](`m`, `hint Number`)。
6. 运行 [OrdinaryToPrimitive][18](`m`, `"number"`)，因为这里没有 `Symbol.toPrimitive`。
7. 执行 `m.valueOf()`，这会获得 `m` 自身的值，因为它调用了默认的 [Object.prototype.valueOf][19]。
8. 接着执行 `m.toString()`，这会生成 `"[object Object]"`，因为调用了默认的 [Object.prototype.toString][20]，并且没有找到 `L` 的  [Symbol.toStringTag][21]。
9. 执行比较 `"[object Object]" < "[object Object]"`，结果是 `false`。

至于 `t >= m` 亦复如是，它总会输出 `true`。所以这里是一个漏洞——使用抽象关系比较这种方法没有意义。而利用它的方法是使编译器常数折叠，即给基准打补丁：

```
--- octane-box2d.js.ORIG        2016-12-16 07:28:58.442977631 +0100
+++ octane-box2d.js     2016-12-16 07:29:05.615028272 +0100
@@ -2021,8 +2021,8 @@
                     if (t == m) return true;
                     if (e.m_pairCount == e.m_pairBuffer.length) e.m_pairBuffer[e.m_pairCount] = new O;
                     var x = e.m_pairBuffer[e.m_pairCount];
-                    x.proxyA = t < m ? t : m;
-                    x.proxyB = t >= m ? t : m;
+                    x.proxyA = m;
+                    x.proxyB = t;
                     ++e.m_pairCount;
                     return true
                 },
```

因为这样做会跳过比较以达到 13% 的惊人的性能提升，并且所有的属性查找和内置函数的调用都会被它触发。

```
$ ~/Projects/v8/out/Release/d8 octane-box2d.js.ORIG
Score (Box2D): 48063
$ ~/Projects/v8/out/Release/d8 octane-box2d.js
Score (Box2D): 55359
$
```

那么我们是怎么做呢？事实证明，我们已经有一种用于跟踪比较对象的形状的机制，比较发生于 `CompareIC`，即所谓的已知接收器映射跟踪（其中的映射是 V8 的对象形状+原型），不过这是有限的抽象和严格相等比较。但是我可以很容易地扩展跟踪，并且收集反馈进行抽象的关系比较：

```
$ ~/Projects/v8/out/Release/d8 --trace-ic octane-box2d.js
[...SNIP...]
[CompareIC in ~+557 at octane-box2d.js:2024 ((UNINITIALIZED+UNINITIALIZED=UNINITIALIZED)->(RECEIVER+RECEIVER=KNOWN_RECEIVER))#LT @ 0x1d5a860493a1]
[CompareIC in ~+649 at octane-box2d.js:2025 ((UNINITIALIZED+UNINITIALIZED=UNINITIALIZED)->(RECEIVER+RECEIVER=KNOWN_RECEIVER))#GTE @ 0x1d5a860496e1]
[...SNIP...]
$
```

这里基准代码中使用的 `CompareIC` 告诉我们，对于我们正在查看的函数中的 `LT`（小于）和 `GTE`（大于或等于）比较，到目前为止这只能看到 `RECEIVERs`（接收器，V8 的 JavaScript 对象），并且所有这些接收器具有相同的映射 `0x1d5a860493a1`，其对应于 `L` 实例的映射。因此，在优化的代码中，只要我们知道比较的两侧映射的结果都为 `0x1d5a860493a1`，并且没人混淆 `L` 的原型链（即 `Symbol.toPrimitive`、`"valueOf"` 和 `"toString"` 这些方法都是默认的，并且没人赋予过 `Symbol.toStringTag` 的访问权限），我们可以将这些操作分别常量折叠为 `false` 和 `true`。剩下的故事都是关于 `Crankshaft` 的黑魔法，有很多一部分都是由于初始化的时候忘记正确地检查 `Symbol.toStringTag` 属性：

[![Hydrogen 黑魔法](http://benediktmeurer.de/images/2016/hydrogen-compare-20161216.png)][80]

最后，性能在这个特定的基准上有了质的飞跃：

![Box2D 加速](http://benediktmeurer.de/images/2016/awfy-box2d-20161216.png)

我要声明一下，当时我并不相信这个特定的行为总是指向源代码中的漏洞，所以我甚至期望外部代码经常会遇到这种情况，同时也因为我假设 JavaScript 开发人员不会总是关心这些种类的潜在错误。但是，我大错特错了，在此我马上悔改！我不得不承认，这个特殊的优化纯粹是一个基准测试的东西，并不会有助于任何真实代码（除非代码是为了从这个优化中获益而写，不过以后你可以在代码中直接写入 `true` 或 `false`，而不用再总是使用常量关系比较）。你可能想知道我们为什么在打补丁后又马上回滚了一下。这是我们整个团队投入到 `ES2015` 实施的非常时期，这才是真正的恶魔之舞，我们需要在没有严格的回归测试的情况下将所有新特性（`ES2015` 就是个怪兽）纳入传统基准。

关于 `Box2D` 点到为止了，让我们看看 `Mandreel` 基准。`Mandreel` 是一个用来将 `C/C++` 代码编译成 JavaScript 的编译器，它并没有用上新一代的 [Emscripten][82] 编译器所使用，并且已经被弃用（或多或少已经从互联网消失了）大约三年的 JavaScript 子集 [asm.js][81]。然而，Octane 仍然有一个通过 [Mandreel][84] 编译的[子弹物理引擎][83]。`MandreelLatency` 测试十分有趣，它测试 `Mandreel` 基准与频繁的时间测量检测点。有一种说法是，由于 `Mandreel` 强制使用虚拟机编译器，此测试提供了由编译器引入的延迟的指示，并且测量检测点之间的长时间停顿降低了最终得分。这听起来似乎合情合理，确实有一定的意义。然而，像往常一样，供应商找到了在这个基准上作弊的方法。

[![Mozilla 1162272 漏洞](http://benediktmeurer.de/images/2016/bugzilla-mandreel-20161216.png)][85]

`Mandreel` 自带一个重型初始化函数 `global_init`，光是解析这个函数并为其生成基线代码就花费了不可思议的时间。因为引擎通常在脚本中多次解析各种函数，一个所谓的预解析步骤用来发现脚本内的函数。然后作为函数第一次被调用完整的解析步骤以生成基线代码（或者说字节码）。这在 V8 中被称为[懒解析][86]。V8 有一些启发式检测函数，当预解析浪费时间的时候可以立刻调用，不过对于 `Mandreel` 基准的 `global_init` 函数就不太清楚了，于是我们将经历这个大家伙“预解析+解析+编译”的长时间停顿。所以我们[添加了一个额外的启发式函数][87]以避免 `global_init` 函数的预解析。

[![MandreelLatency 基准](http://benediktmeurer.de/images/2016/awfy-mandreel-20161216.png)][88]

由此可见，在检测 `global_init` 和避免昂贵的预解析步骤我们几乎提升了 2 倍。我们不太确定这是否会对真实用例产生负面影响，不过保证你在预解析大函数的时候将会受益匪浅（因为它们不会立即执行）。

让我们来看看另一个稍有争议的基准测试：[splay.js][89] 测试，一个用于处理<ruby>伸展树<rt>splay tree</rt></ruby>（二叉查找树的一种）和练习自动内存管理子系统（也被称为垃圾回收器）的数据操作基准。它自带一个延迟测试，这会引导 `Splay` 代码通过频繁的测量检测点，检测点之间的长时间停顿表明垃圾回收器的延迟很高。此测试测量延迟暂停的频率，将它们分类到桶中，并以较低的分数惩罚频繁的长暂停。这听起来很棒！没有 GC 停顿，没有垃圾。纸上谈兵到此为止。让我们看看这个基准，以下是整个伸展树业务的核心：

[![splay.js](http://benediktmeurer.de/images/2016/splay-insertnode-20161216.png)][90]

这是伸展树结构的核心构造，尽管你可能想看完整的基准，不过这基本上是 `SplayLatency` 得分的重要来源。怎么回事？实际上，该基准测试是建立巨大的伸展树，尽可能保留所有节点，从而还原它原本的空间。使用像 V8 这样的代数垃圾回收器，如果程序违反了[代数假设][91]，会导致极端的时间停顿，从本质上看，将所有东西从新空间撤回到旧空间的开销是非常昂贵的。在旧配置中运行 V8 可以清楚地展示这个问题：

```
$ out/Release/d8 --trace-gc --noallocation_site_pretenuring octane-splay.js
[20872:0x7f26f24c70d0]       10 ms: Scavenge 2.7 (6.0) -> 2.7 (7.0) MB, 1.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       12 ms: Scavenge 2.7 (7.0) -> 2.7 (8.0) MB, 1.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       14 ms: Scavenge 3.7 (8.0) -> 3.6 (10.0) MB, 0.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       18 ms: Scavenge 4.8 (10.5) -> 4.7 (11.0) MB, 2.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       22 ms: Scavenge 5.7 (11.0) -> 5.6 (16.0) MB, 2.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       28 ms: Scavenge 8.7 (16.0) -> 8.6 (17.0) MB, 4.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       35 ms: Scavenge 9.6 (17.0) -> 9.6 (28.0) MB, 6.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       49 ms: Scavenge 16.6 (28.5) -> 16.4 (29.0) MB, 8.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       65 ms: Scavenge 17.5 (29.0) -> 17.5 (52.0) MB, 15.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       93 ms: Scavenge 32.3 (52.5) -> 32.0 (53.5) MB, 17.6 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      126 ms: Scavenge 33.4 (53.5) -> 33.3 (68.0) MB, 31.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      151 ms: Scavenge 47.9 (68.0) -> 47.6 (69.5) MB, 15.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      183 ms: Scavenge 49.2 (69.5) -> 49.2 (84.0) MB, 30.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      210 ms: Scavenge 63.5 (84.0) -> 62.4 (85.0) MB, 14.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      241 ms: Scavenge 64.7 (85.0) -> 64.6 (99.0) MB, 28.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      268 ms: Scavenge 78.2 (99.0) -> 77.6 (101.0) MB, 16.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      298 ms: Scavenge 80.4 (101.0) -> 80.3 (114.5) MB, 28.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      324 ms: Scavenge 93.5 (114.5) -> 92.9 (117.0) MB, 16.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      354 ms: Scavenge 96.2 (117.0) -> 96.0 (130.0) MB, 27.6 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      383 ms: Scavenge 108.8 (130.0) -> 108.2 (133.0) MB, 16.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      413 ms: Scavenge 111.9 (133.0) -> 111.7 (145.5) MB, 27.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      440 ms: Scavenge 124.1 (145.5) -> 123.5 (149.0) MB, 17.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      473 ms: Scavenge 127.6 (149.0) -> 127.4 (161.0) MB, 29.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      502 ms: Scavenge 139.4 (161.0) -> 138.8 (165.0) MB, 18.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      534 ms: Scavenge 143.3 (165.0) -> 143.1 (176.5) MB, 28.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      561 ms: Scavenge 154.7 (176.5) -> 154.2 (181.0) MB, 19.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      594 ms: Scavenge 158.9 (181.0) -> 158.7 (192.0) MB, 29.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      622 ms: Scavenge 170.0 (192.5) -> 169.5 (197.0) MB, 19.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      655 ms: Scavenge 174.6 (197.0) -> 174.3 (208.0) MB, 28.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      683 ms: Scavenge 185.4 (208.0) -> 184.9 (212.5) MB, 19.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      715 ms: Scavenge 190.2 (213.0) -> 190.0 (223.5) MB, 27.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      743 ms: Scavenge 200.7 (223.5) -> 200.3 (228.5) MB, 19.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      774 ms: Scavenge 205.8 (228.5) -> 205.6 (239.0) MB, 27.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      802 ms: Scavenge 216.1 (239.0) -> 215.7 (244.5) MB, 19.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      833 ms: Scavenge 221.4 (244.5) -> 221.2 (254.5) MB, 26.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      861 ms: Scavenge 231.5 (255.0) -> 231.1 (260.5) MB, 19.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      892 ms: Scavenge 237.0 (260.5) -> 236.7 (270.5) MB, 26.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      920 ms: Scavenge 246.9 (270.5) -> 246.5 (276.0) MB, 20.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      951 ms: Scavenge 252.6 (276.0) -> 252.3 (286.0) MB, 25.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      979 ms: Scavenge 262.3 (286.0) -> 261.9 (292.0) MB, 20.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1014 ms: Scavenge 268.2 (292.0) -> 267.9 (301.5) MB, 29.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1046 ms: Scavenge 277.7 (302.0) -> 277.3 (308.0) MB, 22.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1077 ms: Scavenge 283.8 (308.0) -> 283.5 (317.5) MB, 25.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1105 ms: Scavenge 293.1 (317.5) -> 292.7 (323.5) MB, 20.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1135 ms: Scavenge 299.3 (323.5) -> 299.0 (333.0) MB, 24.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1164 ms: Scavenge 308.6 (333.0) -> 308.1 (339.5) MB, 20.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1194 ms: Scavenge 314.9 (339.5) -> 314.6 (349.0) MB, 25.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1222 ms: Scavenge 324.0 (349.0) -> 323.6 (355.5) MB, 21.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1253 ms: Scavenge 330.4 (355.5) -> 330.1 (364.5) MB, 25.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1282 ms: Scavenge 339.4 (364.5) -> 339.0 (371.0) MB, 22.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1315 ms: Scavenge 346.0 (371.0) -> 345.6 (380.0) MB, 25.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1413 ms: Mark-sweep 349.9 (380.0) -> 54.2 (305.0) MB, 5.8 / 0.0 ms  (+ 87.5 ms in 73 steps since start of marking, biggest step 8.2 ms, walltime since start of marking 131 ms) finalize incremental marking via stack guard GC in old space requested
[20872:0x7f26f24c70d0]     1457 ms: Scavenge 65.8 (305.0) -> 65.1 (305.0) MB, 31.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1489 ms: Scavenge 69.9 (305.0) -> 69.7 (305.0) MB, 27.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1523 ms: Scavenge 80.9 (305.0) -> 80.4 (305.0) MB, 22.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1553 ms: Scavenge 85.5 (305.0) -> 85.3 (305.0) MB, 24.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1581 ms: Scavenge 96.3 (305.0) -> 95.7 (305.0) MB, 18.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1616 ms: Scavenge 101.1 (305.0) -> 100.9 (305.0) MB, 29.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1648 ms: Scavenge 111.6 (305.0) -> 111.1 (305.0) MB, 22.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1678 ms: Scavenge 116.7 (305.0) -> 116.5 (305.0) MB, 25.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1709 ms: Scavenge 127.0 (305.0) -> 126.5 (305.0) MB, 20.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1738 ms: Scavenge 132.3 (305.0) -> 132.1 (305.0) MB, 23.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1767 ms: Scavenge 142.4 (305.0) -> 141.9 (305.0) MB, 19.6 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1796 ms: Scavenge 147.9 (305.0) -> 147.7 (305.0) MB, 23.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1825 ms: Scavenge 157.8 (305.0) -> 157.3 (305.0) MB, 19.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1853 ms: Scavenge 163.5 (305.0) -> 163.2 (305.0) MB, 22.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1881 ms: Scavenge 173.2 (305.0) -> 172.7 (305.0) MB, 19.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1910 ms: Scavenge 179.1 (305.0) -> 178.8 (305.0) MB, 23.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1944 ms: Scavenge 188.6 (305.0) -> 188.1 (305.0) MB, 25.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1979 ms: Scavenge 194.7 (305.0) -> 194.4 (305.0) MB, 28.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2011 ms: Scavenge 204.0 (305.0) -> 203.6 (305.0) MB, 23.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2041 ms: Scavenge 210.2 (305.0) -> 209.9 (305.0) MB, 23.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2074 ms: Scavenge 219.4 (305.0) -> 219.0 (305.0) MB, 24.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2105 ms: Scavenge 225.8 (305.0) -> 225.4 (305.0) MB, 24.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2138 ms: Scavenge 234.8 (305.0) -> 234.4 (305.0) MB, 23.1 / 0.0 ms  allocation failure
[...SNIP...]
$
```

因此这里关键的发现是直接在旧空间中分配伸展树节点可基本避免在周围复制对象的所有开销，并且将次要 GC 周期的数量减少到最小（从而减少 GC 引起的停顿时间）。我们想出了一种称为<ruby>[分配场所预占][92]<rt>allocation site pretenuring</rt></ruby>的机制，当运行到基线代码时，将尝试动态收集分配场所的反馈，以决定在此分配的对象的确切部分是否存在，如果是，则优化代码以直接在旧空间分配对象——即预占对象。

```
$ out/Release/d8 --trace-gc octane-splay.js
[20885:0x7ff4d7c220a0]        8 ms: Scavenge 2.7 (6.0) -> 2.6 (7.0) MB, 1.2 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       10 ms: Scavenge 2.7 (7.0) -> 2.7 (8.0) MB, 1.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       11 ms: Scavenge 3.6 (8.0) -> 3.6 (10.0) MB, 0.9 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       17 ms: Scavenge 4.8 (10.5) -> 4.7 (11.0) MB, 2.9 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       20 ms: Scavenge 5.6 (11.0) -> 5.6 (16.0) MB, 2.8 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       26 ms: Scavenge 8.7 (16.0) -> 8.6 (17.0) MB, 4.5 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       34 ms: Scavenge 9.6 (17.0) -> 9.5 (28.0) MB, 6.8 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       48 ms: Scavenge 16.6 (28.5) -> 16.4 (29.0) MB, 8.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       64 ms: Scavenge 17.5 (29.0) -> 17.5 (52.0) MB, 15.2 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       96 ms: Scavenge 32.3 (52.5) -> 32.0 (53.5) MB, 19.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      153 ms: Scavenge 61.3 (81.5) -> 57.4 (93.5) MB, 27.9 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      432 ms: Scavenge 339.3 (364.5) -> 326.6 (364.5) MB, 12.7 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      666 ms: Scavenge 563.7 (592.5) -> 553.3 (595.5) MB, 20.5 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      825 ms: Mark-sweep 603.9 (644.0) -> 96.0 (528.0) MB, 4.0 / 0.0 ms  (+ 92.5 ms in 51 steps since start of marking, biggest step 4.6 ms, walltime since start of marking 160 ms) finalize incremental marking via stack guard GC in old space requested
[20885:0x7ff4d7c220a0]     1068 ms: Scavenge 374.8 (528.0) -> 362.6 (528.0) MB, 19.1 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]     1304 ms: Mark-sweep 460.1 (528.0) -> 102.5 (444.5) MB, 10.3 / 0.0 ms  (+ 117.1 ms in 59 steps since start of marking, biggest step 7.3 ms, walltime since start of marking 200 ms) finalize incremental marking via stack guard GC in old space requested
[20885:0x7ff4d7c220a0]     1587 ms: Scavenge 374.2 (444.5) -> 361.6 (444.5) MB, 13.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]     1828 ms: Mark-sweep 485.2 (520.0) -> 101.5 (519.5) MB, 3.4 / 0.0 ms  (+ 102.8 ms in 58 steps since start of marking, biggest step 4.5 ms, walltime since start of marking 183 ms) finalize incremental marking via stack guard GC in old space requested
[20885:0x7ff4d7c220a0]     2028 ms: Scavenge 371.4 (519.5) -> 358.5 (519.5) MB, 12.1 / 0.0 ms  allocation failure
[...SNIP...]
$
```

事实上，这完全解决了 `SplayLatency` 基准的问题，并提高我们的得分至超过 250%！

[![SplayLatency 基准](http://benediktmeurer.de/images/2016/awfy-splay-20161216.png)][93]

正如 [SIGPLAN 论文][94] 中所提及的，我们有充分的理由相信，分配场所预占机制可能真的赢得了真实世界应用的欢心，并真正期待看到改进和扩展后的机制，那时将不仅仅是对象和数组字面量。但是不久后我们意识到[分配场所预占机制对真实世界应用产生了相当严重的负面影响][97]。我们实际上听到很多负面报道，包括 `Ember.js` 开发者和用户的唇枪舌战，虽然不仅是因为分配场所预占机制，不过它是事故的罪魁祸首。

分配场所预占机制的基本问题数之不尽，这在今天的应用中非常常见（主要是由于框架，同时还有其它原因），假设你的对象工厂最初是用于创建构成你的对象模型和视图的长周期对象的，它将你的工厂方法中的分配场所转换为永久状态，并且从工厂分配的所有内容都立即转到旧空间。现在初始设置完成后，你的应用开始工作，作为其中的一部分，从工厂分配临时对象会污染旧空间，最终导致开销昂贵的垃圾回收周期以及其它负面的副作用，例如过早触发增量标记。

我们开始重新考虑基准驱动的工作，并开始寻找现实场景驱动的替代方案，这导致了 [Orinoco][98] 的诞生，它的目标是逐步改进垃圾回收器；这个努力的一部分是一个称为“<ruby>统一堆<rt>unified heap</rt></ruby>”的项目，如果页面中所有内容基本都存在，它将尝试避免复制对象。也就是说站在更高的层面看：如果新空间充满活动对象，只需将所有新空间页面标记为属于旧空间，然后从空白页面创建一个新空间。这可能不会在 `SplayLatency` 基准测试中得到相同的分数，但是这对于真实用例更友好，它可以自动适配具体的用例。我们还考虑<ruby>并发标记<rt>concurrent marking</rt></ruby>，将标记工作卸载到单独的线程，从而进一步减少增量标记对延迟和吞吐量的负面影响。

#### 轻松一刻

![](https://pbs.twimg.com/profile_images/491838225300717568/sy5AWvt1.jpeg)

喘口气。

好吧，我想这足以强调我的观点了。我可以继续指出更多的例子，其中 Octane 驱动的改进后来变成了一个坏主意，也许改天我会接着写下去。但是今天就到此为止了吧。

### 结论

我希望现在应该清楚为什么基准测试通常是一个好主意，但是只对某个特定的级别有用，一旦你跨越了<ruby>有用竞争<rt>useful competition</rt></ruby>的界限，你就会开始浪费你们工程师的时间，甚至开始损害到你的真实世界的性能！如果我们认真考虑 web 的性能，我们需要根据真实世界的性能来测评浏览器，而不是它们玩弄一个四年前的基准的能力。我们需要开始教育（技术）媒体，可能这没用，但至少请忽略他们。

[![2016 年 10 月浏览器基准之战: Chrome、Firefox 和 Edge 的决战](http://benediktmeurer.de/images/2016/venturebeat-20161216.png)][99]

没人害怕竞争，但是玩弄可能已经坏掉的基准不像是在合理使用工程时间。我们可以尽更大的努力，并把 JavaScript 提高到更高的水平。让我们开展有意义的性能测试，以便为最终用户和开发者带来有意思的领域竞争。此外，让我们再对运行在 Node.js（ V8 或 `ChakraCore`）中的服务器端和工具端代码做一些有意义的改进！

![](http://benediktmeurer.de/images/2016/measure-20161216.jpg)

结束语：不要用传统的 JavaScript 基准来比较手机。这是真正最没用的事情，因为 JavaScript 的性能通常取决于软件，而不一定是硬件，并且 Chrome 每 6 周发布一个新版本，所以你在三月份的测试结果到了四月份就已经毫不相关了。如果为手机中的浏览器做个排名不可避免，那么至少请使用一个现代健全的浏览器基准来测试，至少这个基准要知道人们会用浏览器来干什么，比如 [Speedometer 基准][100]。

感谢你花时间阅读！

--------------------------------------------------------------------------------

作者简介：

我是 Benedikt Meurer，住在 Ottobrunn（德国巴伐利亚州慕尼黑东南部的一个市镇）的一名软件工程师。我于 2007 年在锡根大学获得应用计算机科学与电气工程的文凭，打那以后的 5 年里我在编译器和软件分析领域担任研究员（2007 至 2008 年间还研究过微系统设计）。2013 年我加入了谷歌的慕尼黑办公室，我的工作目标主要是 V8 JavaScript 引擎，目前是 JavaScript 执行性能优化团队的一名技术领导。

--------------------------------------------------------------------------------

via: http://benediktmeurer.de/2016/12/16/the-truth-about-traditional-javascript-benchmarks

作者：[Benedikt Meurer][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[OneNewLife](https://github.com/OneNewLife), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://benediktmeurer.de/
[1]:https://www.youtube.com/watch?v=PvZdTZ1Nl5o
[2]:https://twitter.com/s3ththompson
[3]:https://youtu.be/xCx4uC7mn6Y
[4]:https://twitter.com/tverwaes
[5]:https://youtu.be/xCx4uC7mn6Y
[6]:https://twitter.com/tverwaes
[7]:https://arewefastyet.com/#machine=12&view=single&suite=ss&subtest=cube&start=1343350217&end=1415382608
[8]:https://www.engadget.com/2016/03/08/galaxy-s7-and-s7-edge-review/
[9]:https://arewefastyet.com/#machine=29&view=single&suite=octane&subtest=MandreelLatency&start=1415924086&end=1446461709
[10]:https://arewefastyet.com/#machine=12&view=single&suite=octane&subtest=SplayLatency&start=1384889558&end=1415405874
[11]:http://venturebeat.com/2016/10/25/browser-benchmark-battle-october-2016-chrome-vs-firefox-vs-edge/3
[12]:https://tc39.github.io/ecma262/#sec-toprimitive
[13]:https://tc39.github.io/ecma262/#sec-ordinarytoprimitive
[14]:https://tc39.github.io/ecma262/#sec-object.prototype.valueof
[15]:https://tc39.github.io/ecma262/#sec-object.prototype.toString
[16]:https://tc39.github.io/ecma262/#sec-symbol.tostringtag
[17]:https://tc39.github.io/ecma262/#sec-toprimitive
[18]:https://tc39.github.io/ecma262/#sec-ordinarytoprimitive
[19]:https://tc39.github.io/ecma262/#sec-object.prototype.valueof
[20]:https://tc39.github.io/ecma262/#sec-object.prototype.toString
[21]:https://tc39.github.io/ecma262/#sec-symbol.tostringtag
[22]:https://en.wikipedia.org/wiki/JavaScript
[23]:https://nodejs.org/
[24]:https://webkit.org/perf/sunspider/sunspider.html
[25]:http://krakenbenchmark.mozilla.org/
[26]:https://developers.google.com/octane
[27]:http://browserbench.org/JetStream
[28]:https://www.youtube.com/watch?v=PvZdTZ1Nl5o
[29]:http://asmjs.org/
[30]:https://github.com/kripken/emscripten
[31]:http://beta.unity3d.com/jonas/AngryBots
[32]:https://youtu.be/xCx4uC7mn6Y
[33]:http://youtube.com/
[34]:http://browserbench.org/Speedometer
[35]:http://browserbench.org/Speedometer
[36]:http://todomvc.com/
[37]:https://twitter.com/bmeurer/status/806927160300556288
[38]:https://youtu.be/xCx4uC7mn6Y
[39]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/bitops-bitwise-and.js
[40]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/bitops-bitwise-and.js
[41]:https://en.wikipedia.org/wiki/Loop_splitting
[42]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/bitops-bitwise-and.js
[43]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/string-tagcloud.js
[44]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/string-tagcloud.js#L199
[45]:https://tc39.github.io/ecma262/#sec-json.parse
[46]:https://tc39.github.io/ecma262/#sec-json.parse
[47]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/3d-cube.js
[48]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/3d-cube.js#L239
[49]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/3d-cube.js#L151
[50]:https://tc39.github.io/ecma262/#sec-math.sin
[51]:https://tc39.github.io/ecma262/#sec-math.cos
[52]:https://arewefastyet.com/#machine=12&view=single&suite=ss&subtest=cube&start=1343350217&end=1415382608
[53]:https://docs.google.com/document/d/1VoYBhpDhJC4VlqMXCKvae-8IGuheBGxy32EOgC2LnT8
[54]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/resources/driver-TEMPLATE.html#L70
[55]:https://www.engadget.com/2016/03/08/galaxy-s7-and-s7-edge-review/
[56]:http://browserbench.org/Speedometer
[57]:https://twitter.com/thealphanerd
[58]:https://blog.mozilla.org/blog/2010/09/14/release-the-kraken-2
[59]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator.js
[60]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator.js
[61]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator-data.js#L687
[62]:https://tc39.github.io/ecma262/#sec-math.round
[63]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator-data.js#L566
[64]:https://graphics.stanford.edu/~seander/bithacks.html#ModulusDivisionEasy
[65]:https://docs.google.com/presentation/d/1wZVIqJMODGFYggueQySdiA3tUYuHNMcyp_PndgXsO1Y
[66]:https://developers.google.com/octane
[67]:https://blog.chromium.org/2012/08/octane-javascript-benchmark-suite-for.html
[68]:https://blog.chromium.org/2013/11/announcing-octane-20.html
[69]:http://www.typescriptlang.org/
[70]:http://asmjs.org/
[71]:https://developers.google.com/octane/benchmark
[72]:https://github.com/kripken/emscripten
[73]:http://emberjs.com/
[74]:https://angularjs.org/
[75]:https://github.com/hecht-software/box2dweb
[76]:https://github.com/v8/v8/blob/5124589642ba12228dcd66a8cb8c84c986a13f35/src/runtime/runtime-object.cc#L884
[77]:https://tc39.github.io/ecma262/#sec-abstract-relational-comparison
[78]:https://github.com/v8/v8/blob/5124589642ba12228dcd66a8cb8c84c986a13f35/src/x64/code-stubs-x64.cc#L2495
[79]:https://tc39.github.io/ecma262/#sec-abstract-relational-comparison
[80]:https://codereview.chromium.org/1355113002
[81]:http://asmjs.org/
[82]:https://github.com/kripken/emscripten
[83]:http://bulletphysics.org/wordpress/
[84]:http://www.mandreel.com/
[85]:https://bugzilla.mozilla.org/show_bug.cgi?id=1162272
[86]:https://docs.google.com/presentation/d/1214p4CFjsF-NY4z9in0GEcJtjbyVQgU0A-UqEvovzCs
[87]:https://codereview.chromium.org/1102523003
[88]:https://arewefastyet.com/#machine=29&view=single&suite=octane&subtest=MandreelLatency&start=1415924086&end=1446461709
[89]:https://github.com/chromium/octane/blob/master/splay.js
[90]:https://github.com/chromium/octane/blob/master/splay.js#L85
[91]:http://www.memorymanagement.org/glossary/g.html
[92]:https://research.google.com/pubs/pub43823.html
[93]:https://arewefastyet.com/#machine=12&view=single&suite=octane&subtest=SplayLatency&start=1384889558&end=1415405874
[94]:https://research.google.com/pubs/pub43823.html
[95]:https://bugs.chromium.org/p/v8/issues/detail?id=2935
[96]:https://bugs.chromium.org/p/chromium/issues/detail?id=367694
[97]:https://bugs.chromium.org/p/v8/issues/detail?id=3665
[98]:http://v8project.blogspot.de/2016/04/jank-busters-part-two-orinoco.html
[99]:http://venturebeat.com/2016/10/25/browser-benchmark-battle-october-2016-chrome-vs-firefox-vs-edge/3/
[100]:http://browserbench.org/Speedometer
