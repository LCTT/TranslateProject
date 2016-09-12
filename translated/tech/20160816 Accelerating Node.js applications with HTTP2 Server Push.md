echoma　翻译中

使用HTTP/2服务端推送技术加速Node.js应用
=========================================================

四月份，我们宣布了对[HTTP/2服务端推送技术][3]的支持，我们是通过HTTP的[Link头](https://www.w3.org/wiki/LinkHeader)来实现这项支持的。我的同事John曾经通过一个例子演示了[在PHP里支持服务端推送功能][4]是多么的简单。

![](https://blog.cloudflare.com/content/images/2016/08/489477622_594bf9e3d9_z.jpg)

我们想让使用Node.js构建的网站能够更加轻松的获得性能提升。为此，我们开发了netjet中间件，它可以解析应用生成的HTML并自动添加Link头。当结合Express框架使用这个中间件时，我们可以看到应用程序的输出多了如下HTTP头：

![](https://blog.cloudflare.com/content/images/2016/08/2016-08-11_13-32-45.png)

[本博客][5]是使用 [Ghost](https://ghost.org/)(译者注：一个博客发布平台)进行发布的, 因此如果你的浏览器支持HTTP/2，你已经在不知不觉中享受了服务端推送技术带来的好处了。接下来，我们将进行更详细的说明。

netjet使用了带有自制插件的[PostHTML](https://github.com/posthtml/posthtml)来解析HTML。目前，netjet用它来查找图片、脚本和外部样式。

在响应过程中增加HTML解析器有个明显的缺点：这将增加页面加载的时延(加载到第一个字节的所花的时间)。大多数情况下，新增的延时被应用里的其他耗时掩盖掉了，比如数据库访问。为了解决这个问题，netjet包含了一个可调节的LRU缓存，该缓存以HTTP的ETag头作为索引，这使得netjet可以非常快的为已经解析过的页面插入Link头。

在这种情况下，如果我们现在从头设计一款全新的应用，我们就需要全面的考量如何减少HTML解析和页面加载延时了。把页面内容和页面中的元数据分开存放是一种值得考虑的方法。

任意的Node.js HTML框架，只要它支持类似Express这样的中间件，netjet都是能够兼容的。只要把netjet像下面这样加到中间件加载链里就可以了。

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

稍微加点代码，netjet也可以摆脱HTML框架，独立工作：

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

[netjet文档里][1]有更多选项的信息。

### 查看推送了什么数据

![](https://blog.cloudflare.com/content/images/2016/08/2016-08-02_10-49-33.png)

访问[本文][5]时，通过Chrome的开发者工具，我们可以轻松的验证网站是否正在使用服务器推送技术（译者注：Chrome版本至少为53）。在"Network"选项卡中，我们可以看到有些图片的"Initiator"这一列中包含了`Push`字样，这些图片就是服务器端推送的。

目前Firefox的开发者工具还不能直观的展示被推送的自选。不过我们可以通过页面响应头里的`cf-h2-pushed`头看到一个列表，这个列表包含了本页面主动推送给浏览器的资源。

希望大家能够踊跃为netjet添砖加瓦，我也乐于看到有人正在使用netjet。

### Ghost和服务端推送技术

Ghost真是包罗万象。在Ghost团队的帮助下，我把netjet也集成到里面了，而且作为测试版内容可以在Ghost的0.8.0版本中用上它。

如果你正在使用Ghost，你可以通过修改config.js、并在`production`配置块中增加preloadHeaders选项来启用服务端推送。

```javascript
production: {
  url: 'https://my-ghost-blog.com',
  preloadHeaders: 100,
  // ...
}
```

Ghost已经为其用户整理了[一篇支持文档][2].

### 结论

使用netjet，你的Node.js应用也可以使用浏览器预加载技术。并且[本站][5]已经使用它在提供了HTTP/2服务端推送了。

--------------------------------------------------------------------------------

via: https://blog.cloudflare.com/accelerating-node-js-applications-with-http-2-server-push/

作者：[Terin Stock][a]
译者：[译者ID](https://github.com/echoma)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.cloudflare.com/author/terin-stock/
[1]: https://www.npmjs.com/package/netjet
[2]: http://support.ghost.org/preload-headers/
[3]: https://www.cloudflare.com/http2/server-push/
[4]: https://blog.cloudflare.com/using-http-2-server-push-with-php/
[5]: https://blog.cloudflare.com/accelerating-node-js-applications-with-http-2-server-push/