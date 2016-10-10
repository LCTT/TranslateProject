内容安全策略（CSP）（这种用法在 https://www.w3.org/html/ig/zh/wiki/CSP 的介绍那部分有，其它地方似乎不作翻译，个人认为这样更合适些），你未来最好的助手
=====

很久之前，我的个人网站被攻击了。我不知道它是如何发生的，但它确实发生了。幸运的是，攻击带来的破坏是很小的：一小段 JavaScript 被注入到了某些页面的底部。我更新了 FTP 和其它的凭证，清理了一些文件，事情就这样结束了。

有一点使我很恼火：在当时，还没有一种简便的方案能够使我知道那里有问题，更重要的是能够保护网站的访客不被这段恼人的代码所扰。

现在有一种方案出现了，这种技术在两方面都十分的成功。它就是内容安全策略（CSP）。

### 什么是 CSP?

这个想法十分简单：网站通过发送一个 CSP 头部，来告诉浏览器什么是被授权执行的与什么是需要被禁止的。

这里有一个 PHP 的例子：

```
<?php
    header("Content-Security-Policy: <your directives>");
?>
```

#### 一些指令

你可以定义一些全局规则或者定义一些涉及某一类资源的规则：

```
default-src 'self' ;
     # self = 同端口，同域名，同协议 => 允许
```

基础参数是 default-src：如果没有为某一类资源设置指令规则，那么浏览器就会使用这个参数值。

```
script-src 'self' www.google-analytics.com ;
     # 从这些域名来的 JS 文件 => 允许
```

在这个例子中，我们已经授权了 www.google-analytics.com 这个域名来源的 JavaScript 文件使用到我们的网站上。我们也添加了 'self' 这个关键词;如果我们通过 script-src 来重新设置其它的规则指令，它将会覆盖 default-src 规则。

如果协议或端口没有被指明（这里的 scheme 从下文来看指的应该是 http https 这样的协议，所以这样翻，不知道是否合适），它就会强制选择与当前页面相同的协议或端口执行。这样做防止了混合内容（这个翻译的话 https://developer.mozilla.org/zh-CN/docs/Security/MixedContent 在这个内容中我可以看到有相关的翻译方式，但是这里要说的是这个概念和之前的 scheme 一样可能会包含较为丰富的内容，不清楚是否要添加一些注释）。如果页面是 https://example.com，那么你将无法加载 http://www.google-analytics.com/file.js 因为它已经被禁止了（协议不匹配）。然而，有一个例外就是协议的提升是被允许的。如果 http://example.com 尝试加载 https://www.google-analytics.com/file.js，接着协议或端口允许被更改以便协议的提升。

```
style-src 'self' data: ;
     # Data-Uri 嵌入 CSS => 允许
```

在这个例子中，关键词 data：授权了在 CSS 文件中内嵌内容。

在 CSP 1 规范下，你可能也会设置如下规则：

- `img-src`

有效的图片来源

- `connect-src`

应用于 XMLHttpRequest（AJAX），WebSocket 或 EventSource

- `font-src`

有效的字体来源

- `object-src`

有效的插件来源（例如，`<object>，<embed>，<applet>`）

- `media-src`

有效的 `<audio> 和 <video>` 来源


CSP 2 包含了如下规则：

- `child-src`

有效的 web workers 和 元素来源，如 `<frame>` 和 `<iframe>` （这个指令用来替代 CSP 1 中不建议使用的 frame-src 指令）

- `form-action`

可以作为 HTML `<form>` action （这里 action 没有翻译是鉴于这是一个属性，也没有更好的处理方式）的有效来源

- `frame-ancestors`

使用 `<frame>，<iframe>，<object>，<embed> 或 <applet>` 内嵌资源的有效来源

- `upgrade-insecure-requests`

命令用户代理来重写 URL 的协议（这里又把 schemes 翻成了协议，还是没有找到更好的方法，这里的 user agents 指的应该是如浏览器之类的工具，不知是否需要注明一下），将 HTTP 改到 HTTPS （为一些需要重写大量陈旧 URL 的网站提供了方便）。

为了更好的向后兼容一些不被建议使用的属性，你可以简单的复制当前指令的内容同时为那个不被建议的指令创建一个相同的副本。例如，你可以复制 child-src的内容同时在 frame-src 中添加一份相同的副本。

CSP 2 允许你添加路径到白名单中（CSP 1 只允许域名被添加到白名单中）。因此，相较于将整个 www.foo.com 域添加到白名单，你可以通过添加 www.foo.com/some/folder 这样的路径到白名单中来作更多的限制。这个需要浏览器中 CSP 2 的支持，但它很明显更安全。

#### 一个例子

我为 Paris Web 2015 大会上以 “[CSP in Action][1]” 为题的我的发言制作了一个简单的例子。

在没有 CSP 的情况下，页面展示如下图所示：

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing1b-500.jpg)

不是十分优美。要是我们启用了如下的 CSP 指令又会怎样呢？

```
<?php
    header("Content-Security-Policy: 
      default-src 'self' ;
      script-src 'self' www.google-analytics.com stats.g.doubleclick.net ; 
      style-src 'self' data: ;
      img-src 'self' www.google-analytics.com stats.g.doubleclick.net data: ;
      frame-src 'self' ;");
?>
```

浏览器将会作什么呢？它会（非常严格的）在 CSP 基础规则之下应用这些指令，这意味着任何没有在 CSP 指令中被授权允许的都将会被禁止（“blocked” 指的是不被执行，不被显示并且不被使用在网站中）。

在 CSP 的默认设置中，内联脚本和样式是不被授权的，意味着每一个 `<script>`，onclick 或 style 属性都将会被禁止。（这里 onclick 和 style 没有翻译，应该指的是属性，使用中也是这样用的，所以没有翻译）你可以使用 style-src 'unsafe-inline' ;指令来授权内联 CSS 的使用。

在一个支持 CSP 的现代浏览器中，示例看起来如下图：

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing5-500.jpg)

发生了什么？浏览器应用了指令并且拒绝了所有没有被授权的内容。它在终端中发送了这些通知：

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing2-500.jpg)

如果你依然不确定 CSP 的价值，请看一下 Aaron Gustafson 文章 ”[More Proof We Don't Control Our Web Pages][2]“。

当然，你可以使用比我们在示例中提供的更严格的指令：

- 设置 default-src 为 'none',
- 为每条规则指定你需要的,
- 为需要的文件指定它的绝对路径,
- 等。


### 更多关于 CSP 的信息

#### 支持

CSP 不是一个需要复杂的配置才能正常工作的每日构建特性（这里没有按照字面翻译，感觉像是有什么梗，但是没有翻出来，就按意义来了）。CSP 1 和 2 是候选推荐标准！[浏览器可以非常完美的支持 CSP 1][3]。

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing3-500.jpg)

[CSP 2 是较新的规范][4]，因此对它的支持会少那么一点。

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing4-500.jpg)

现在 CSP 3 还是一个早期草案，因此还没有被支持，但是你依然可以使用 CSP 1 和 2 来做一些重大的事。

#### 其他需要考虑的因素

CSP 被设计用来降低跨站脚本执行（XSS）的风险，这就是不建议开启内联脚本和 script-src 指令的原因。Firefox 对这个问题做了和好的说明：在浏览器中，敲击 Shift + F2 并且键入 security csp，它就会向你展示指令和对应的建议。这里有一个在 Twitter 网站中应用的例子：

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing6b-500.jpg)

如果你确实需要使用内联脚本和样式的话，另一种可能就是生成一份散列值（这里的 hash value，这样翻不太确定是否合适，个人比较偏向这样吧）。例如，我们假定你需要使用如下的内联脚本：

```
<script>alert('Hello, world.');</script>
```

你应该在 script-src 指令中添加 'sha256-qznLcsROx4GACP2dm0UCKCzCG-HiZ1guq6ZZDob_Tng=' 作为有效来源。这个散列值是有下面的 PHP 脚本执行获得的结果：

```
<?php
    echo base64_encode(hash('sha256', "alert('Hello, world.');", true));
?>
```

我在前文中说过 CSP 被设计用来降低 XSS 风险，我还得加上“……与降低未经请求内容的风险。”伴随者 CSP 的使用，你必须知道你内容的来源是哪里与他们在你的前端都作了些什么（内联样式，等）。CSP 同时可以帮助你让贡献者，开发和其他人员来遵循你内容来源的规则！

现在你的问题就只是，“不错，这很好，但是我们如何在生产环境中使用它呢？”

### 如何在现实世界中使用它

想要在第一次使用 CSP 之后就失望透顶的方法就是在生产环境中测试，不要想当然的认为，“这会很简单。我的代码是完美并且相当清晰的。”不要这样作。我这样干过。相信我这相当蠢。

正如我之前说明的，CSP 指令由 CSP 头来激活，其中没有中间地带。你恰恰就是其中的薄弱环节。你可能会忘记授权某些东西或者遗忘了你网站中的一小段代码。CSP 不会饶恕你的疏忽。然而，CSP 的两个特性将这个问题变得相当的简单。

#### REPORT-URI（这个也是指令，所以没有翻译，保留）

还记得 CSP 发送到终端中的那些通知么？report-uri 指令可以被用来告诉浏览器发送那些通知到指定的地址。报告以 JSON 格式送出。

```
report-uri /csp-parser.php ;
```

因此，我们可以在 csp-parser.php 文件中处理有浏览器送出的数据。这里有一个由 PHP 实现的最基础的例子：

```
$data = file_get_contents('php://input');

    if ($data = json_decode($data, true)) {
     $data = json_encode(
      $data,
      JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES
      );
     mail(EMAIL, SUBJECT, $data);
    }
```

这个通知将会被转换成为一封邮件。在开发过程中，你可能不会需要比这更复杂的其它东西。

对于一个生产环境（或者是一个有较多访问的开发环境），你应该使用一种比邮件更好的收集信息的方式，因为这种方式在节点上没有验证和速率限制，并且 CSP 可能变得乱哄哄的。只需想像一个会产生 100 个 CSP 通知（例如，一个从未授权来源展示图片的脚本）并且每天会被浏览 100 次的页面，那你就会每天收到 10,000 个通知啊！

例如 report-uri.io 这样的服务可以用来简化你的报告管理（感觉这里将 reporting 翻译成报告似乎有点不太通）。你也可以在 GitHub上看一些另外的使用 report-uri （与数据库搭配，添加一些优化，等）的简单例子。

### REPORT-ONLY（这也是个属性，所以没有翻译）

正如我们所见的，最大的问题就是在使用和不使用 CSP 之间没有中间地带。然而，一个名为 report-only 的特性会发送一个稍有不同的头部：

```
<?php
    header("Content-Security-Policy-Report-Only: <your directives>");
?>
```

总的来说，这个头部就是告诉浏览器，“表现得似乎所有的 CSP 指令都被应用了，但是不禁止任何东西。只是发送通知给自己。”这是一种相当棒的测试指令的方式，避免了任何有价值的东西被禁止的风险。

在 report-only 和 report-uri 的帮助下你可以毫无风险的测试 CSP 指令，并且可以实时的监控网站上一切与 CSP 相关的内容。这两个特性对部署和维护 CSP 来说真是相当的有用！

### 结论

#### 为什么 CSP 很酷

CSP 对你的用户来说是尤其重要的：他们在你的网站上不再需要遭受任何的未经请求的脚本，内容或 XSS 的威胁了。（感觉这句话好夸张，不知是不是我的理解有误，感觉有必要注释一下，不代表本站观点这样类似的东西）

对于网站维护者来说 CSP 最重要的优势就是可感知。如果你对图片来源设置了严格的规则，这时一个脚本小子尝试在你的网站上插入一张未授权来源的图片，那么这张图片就会被禁止，并且你会在第一时间收到提醒。

开发者也需要确切的知道他们的前端代码都在做些什么，CSP 可以帮助他们掌控一切。会促使他们去重构他们代码中的某些部分（避免内联函数和样式，等）并且促使他们遵循最佳实践。

#### 如何让 CSP 变得更酷

讽刺的是，CSP 在一些浏览器中过分的高效了，在和书签栏小程序一起使用时会产生一些 bug（这里的 bug 和 bookmarklet 的翻译拿不准）。因此，不要更新你的 CSP 指令来允许书签栏小程序。我们无法单独的责备任何一个浏览器;它们都有些问题：

- Firefox
- Chrome (Blink)
- WebKit

大多数情况下，这些 bug 都是禁止通知中的误报。所有的浏览器提供者都在努力解决这些问题，因此我们可以期待很快就会被解决。无论怎样，这都不会成为你使用 CSP 的绊脚石。

--------------------------------------------------------------------------------

via: https://www.smashingmagazine.com/2016/09/content-security-policy-your-future-best-friend/?utm_source=webopsweekly&utm_medium=email

作者：[Nicolas Hoffmann][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.smashingmagazine.com/author/nicolashoffmann/
[1]: https://rocssti.net/en/example-csp-paris-web2015
[2]: https://www.aaron-gustafson.com/notebook/more-proof-we-dont-control-our-web-pages/
[3]: http://caniuse.com/#feat=contentsecuritypolicy
[4]: http://caniuse.com/#feat=contentsecuritypolicy2

