[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10404-1.html)
[#]: subject: (A Tale of HTTP/2)
[#]: via: (https://veronneau.org/a-tale-of-http2.html)
[#]: author: (Louis-Philippe Véronneau https://veronneau.org/)

一个 HTTP/2 的故事
======

大约一个月前，有人在我所在的 IRC 频道中提到了 [HTTP/2][1]。由于某种原因，我从未听说过它，而且新协议的一些功能（比如无需打开多个 TCP 连接就能复用请求）似乎很酷。

说实话，我刚刚重写了管理我们备份程序的 Puppet 代码，启用 HTTP/2 似乎是一种转向另一个大型项目之前有效的拖延方式。这有多难？

结果我花了大约 25 个小时来完成。坐下来穿上舒适的拖鞋，听听这个 HTTP/2 的故事！

[![The Yule Log][2]][3]

### 被诅咒的 HTTP/1.1

当我第一次看到如何在 Apache 上启用 HTTP/2 时，这似乎是一项非常简单的任务。文档提到加载 `http2` 模块并通过如下配置文件确保新协议优先：

```
Protocols h2 h2c http/1.1

H2Push          on
H2PushPriority  *                       after
H2PushPriority  text/css                before
H2PushPriority  image/jpeg              after   32
H2PushPriority  image/png               after   32
H2PushPriority  application/javascript  interleaved
```

这当然很容易。即使 Apache 中的所有内容都已正确设置，网站仍然使用的是 HTTP/1.1。不过，显然我做得没错，因为我的网站现在发送了一个新的 HTTP 头：`Upgrade: h2, h2c`。

在浪费了大量时间调试 TLS 密钥（HTTP/2 [与 TLS 1.1 不兼容][4]）之后，我终于发现问题是没有使用正确的 Apache 多进程处理模块。

事实证明，在使用 `mpm_prefork`（默认 MPM）时，Apache 不会使用 HTTP/2，因为 `mod_http2` 不支持它。尽管 Apache 还有两个其他的 MPM，但只有 `mpm_prefork` 支持 `mod_php`。突然之间，添加对 HTTP/2 的支持意味着我们将要把所有的 PHP 网站切换到 PHP-FPM。

### 掉进兔子洞

![A clip from Alice in Wonderlands][5]

在很长一段时间里，一位好友一直试图让我相信 [PHP-FPM][6] 的优点。虽然表面上看起来很好，但我从来没有真正试过。它看起来很复杂。常规的 `mod_php` 做得很好，还有其他事情需要我注意。

事实上，这次的 HTTP/2 事件是让我钻研它的一个契机。在我理解了 FPM 池的工作原理后，它实际上很容易设置。由于我不得不重写我们用于部署网站的 Puppet 配置文件，我也借此机会巩固了一堆东西。

PHP-FPM 允许你在不同的 Unix 用户下运行网站来增加隔离性。最重要的是，我决定是时候让我们服务器上的 PHP 代码以只读模式运行，并且不得不为我们的 Wordpress、Nextcloud、KanBoard 和 Drupal 实例调整一些东西来减少报错。

过了很长时间通过 Puppet 的自动任务后，我终于能够全部关闭 `mod_php` 和 `mpm_prefork` 并启用 `mpm_event` 和 `mod_http2`。PHP-FPM 和 HTTP/2 带来的速度提升不错，但更让我感到高兴的是这次磨练增强了我们的 Apache 处理 PHP 的能力。

![Victory!][7]

--------------------------------------------------------------------------------

via: https://veronneau.org/a-tale-of-http2.html

作者：[Louis-Philippe Véronneau][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://veronneau.org/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/HTTP/2
[2]: https://veronneau.org/media/blog/2018-12-22/yule_log.jpg (The Yule Log)
[3]: https://commons.wikimedia.org/wiki/File:The_Yule_Log.jpg
[4]: https://http2.github.io/http2-spec/#TLSUsage
[5]: https://veronneau.org/media/blog/2018-12-22/mod_php.gif (A clip from Alice in Wonderlands)
[6]: https://wiki.apache.org/httpd/PHP-FPM
[7]: https://veronneau.org/media/blog/2018-12-22/victory.png (Victory!)
