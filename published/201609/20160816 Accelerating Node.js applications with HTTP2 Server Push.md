使用 HTTP/2 服务端推送技术加速 Node.js 应用
=========================================================

四月份，我们宣布了对 [HTTP/2 服务端推送技术][3]的支持，我们是通过 HTTP 的 [Link 头部](https://www.w3.org/wiki/LinkHeader)来实现这项支持的。我的同事 John 曾经通过一个例子演示了[在 PHP 里支持服务端推送功能][4]是多么的简单。

![](https://blog.cloudflare.com/content/images/2016/08/489477622_594bf9e3d9_z.jpg)

我们想让现今使用 Node.js 构建的网站能够更加轻松的获得性能提升。为此，我们开发了 [netjet][1] 中间件，它可以解析应用生成的 HTML 并自动添加 Link 头部。当在一个示例的 Express 应用中使用这个中间件时，我们可以看到应用程序的输出多了如下 HTTP 头：

![](https://blog.cloudflare.com/content/images/2016/08/2016-08-11_13-32-45.png)

[本博客][5]是使用 [Ghost](https://ghost.org/)（LCTT 译注：一个博客发布平台）进行发布的，因此如果你的浏览器支持 HTTP/2，你已经在不知不觉中享受了服务端推送技术带来的好处了。接下来，我们将进行更详细的说明。

netjet 使用了带有定制插件的 [PostHTML](https://github.com/posthtml/posthtml) 来解析 HTML。目前，netjet 用它来查找图片、脚本和外部 CSS 样式表。你也可以用其它的技术来实现这个。

在响应过程中增加 HTML 解析器有个明显的缺点：这将增加页面加载的延时（到加载第一个字节所花的时间)。大多数情况下，所新增的延时被应用里的其他耗时掩盖掉了，比如数据库访问。为了解决这个问题，netjet 包含了一个可调节的 LRU 缓存，该缓存以 HTTP 的 ETag 头部作为索引，这使得 netjet 可以非常快的为已经解析过的页面插入 Link 头部。

不过，如果我们现在从头设计一款全新的应用，我们就应该考虑把页面内容和页面中的元数据分开存放，从而整体地减少 HTML 解析和其它可能增加的延时了。

任意的 Node.js HTML 框架，只要它支持类似 Express 这样的中间件，netjet 都是能够兼容的。只要把 netjet 像下面这样加到中间件加载链里就可以了。

```javascript
var express = require('express');
var netjet = require('netjet');
var root = '/path/to/static/folder';

express()
  .use(netjet({
    cache: {
      max: 100
    }
  }))
  .use(express.static(root))
  .listen(1337);
```

稍微加点代码，netjet 也可以摆脱 HTML 框架，独立工作：

```javascript
var http = require('http');
var netjet = require('netjet');

var port = 1337;
var hostname = 'localhost';
var preload = netjet({
  cache: {
    max: 100
  }
});

var server = http.createServer(function (req, res) {
  preload(req, res, function () {
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/html');
      res.end('<!doctype html><h1>Hello World</h1>');
  });
});

server.listen(port, hostname, function () {
  console.log('Server running at http://' + hostname + ':' + port+ '/');
});
```

[netjet 文档里][1]有更多选项的信息。

### 查看推送了什么数据

![](https://blog.cloudflare.com/content/images/2016/08/2016-08-02_10-49-33.png)

访问[本文][5]时，通过 Chrome 的开发者工具，我们可以轻松的验证网站是否正在使用服务器推送技术（LCTT 译注： Chrome 版本至少为 53）。在“Network”选项卡中，我们可以看到有些资源的“Initiator”这一列中包含了`Push`字样，这些资源就是服务器端推送的。

不过，目前 Firefox 的开发者工具还不能直观的展示被推送的资源。不过我们可以通过页面响应头部里的`cf-h2-pushed`头部看到一个列表，这个列表包含了本页面主动推送给浏览器的资源。

希望大家能够踊跃为 netjet 添砖加瓦，我也乐于看到有人正在使用 netjet。

### Ghost 和服务端推送技术

Ghost 真是包罗万象。在 Ghost 团队的帮助下，我把 netjet 也集成到里面了，而且作为测试版内容可以在 Ghost 的 0.8.0 版本中用上它。

如果你正在使用 Ghost，你可以通过修改 config.js、并在`production`配置块中增加 `preloadHeaders` 选项来启用服务端推送。

```javascript
production: {
  url: 'https://my-ghost-blog.com',
  preloadHeaders: 100,
  // ...
}
```

Ghost 已经为其用户整理了[一篇支持文档][2]。

### 总结

使用 netjet，你的 Node.js 应用也可以使用浏览器预加载技术。并且 [CloudFlare][5] 已经使用它在提供了 HTTP/2 服务端推送了。

--------------------------------------------------------------------------------

via: https://blog.cloudflare.com/accelerating-node-js-applications-with-http-2-server-push/

作者：[Terin Stock][a]
译者：[echoma](https://github.com/echoma)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.cloudflare.com/author/terin-stock/
[1]: https://www.npmjs.com/package/netjet
[2]: http://support.ghost.org/preload-headers/
[3]: https://www.cloudflare.com/http2/server-push/
[4]: https://blog.cloudflare.com/using-http-2-server-push-with-php/
[5]: https://blog.cloudflare.com/accelerating-node-js-applications-with-http-2-server-push/