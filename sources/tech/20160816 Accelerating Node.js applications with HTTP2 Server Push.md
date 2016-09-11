Accelerating Node.js applications with HTTP/2 Server Push
=========================================================

In April, we [announced support for HTTP/2 Server][3] Push via the HTTP Link header. My coworker John has demonstrated how easy it is to [add Server Push to an example PHP application][4].

![](https://blog.cloudflare.com/content/images/2016/08/489477622_594bf9e3d9_z.jpg)

We wanted to make it easy to improve the performance of contemporary websites built with Node.js. we developed the netjet middleware to parse the generated HTML and automatically add the Link headers. When used with an example Express application you can see the headers being added:

![](https://blog.cloudflare.com/content/images/2016/08/2016-08-11_13-32-45.png)

We use Ghost to power this blog, so if your browser supports HTTP/2 you have already benefited from Server Push without realizing it! More on that below.

In netjet, we use the PostHTML project to parse the HTML with a custom plugin. Right now it is looking for images, scripts and external stylesheets. You can implement this same technique in other environments too.

Putting an HTML parser in the response stack has a downside: it will increase the page load latency (or "time to first byte"). In most cases, the added latency will be overshadowed by other parts of your application, such as database access. However, netjet includes an adjustable LRU cache keyed by ETag headers, allowing netjet to insert Link headers quickly on pages already parsed.

If you are designing a brand new application, however, you should consider storing metadata on embedded resources alongside your content, eliminating the HTML parse, and possible latency increase, entirely.

Netjet is compatible with any Node.js HTML framework that supports Express-like middleware. Getting started is as simple as adding netjet to the beginning of your middleware chain.

```
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

With a little more work, you can even use netjet without frameworks.

```
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

See the [netjet documentation][1] for more information on the supported options.

### Seeing what’s pushed

![](https://blog.cloudflare.com/content/images/2016/08/2016-08-02_10-49-33.png)

Chrome's Developer Tools makes it easy to verify that your site is using Server Push. The Network tab shows pushed assets with "Push" included as part of the initiator.

Unfortunately, Firefox's Developers Tools don't yet directly expose if the resource pushed. You can, however, check for the cf-h2-pushed header in the page's response headers, which contains a list of resources that CloudFlare offered browsers over Server Push.

Contributions to improve netjet or the documentation are greatly appreciated. I'm excited to hear where people are using netjet.

### Ghost and Server Push

Ghost is one such exciting integration. With the aid of the Ghost team, I've integrated netjet, and it has been available as an opt-in beta since version 0.8.0.

If you are running a Ghost instance, you can enable Server Push by modifying the server's config.js file and add the preloadHeaders option to the production configuration block.


```
production: {  
  url: 'https://my-ghost-blog.com', 
  preloadHeaders: 100, 
  // ... 
}
```

Ghost has put together [a support article][2] for Ghost(Pro) customers.

### Conclusion

With netjet, your Node.js applications can start to use browser preloading and, when used with CloudFlare, HTTP/2 Server Push today.

At CloudFlare, we're excited to make tools to help increase the performance of websites. If you find this interesting, we are hiring in Austin, Texas; Champaign, Illinois; London; San Francisco; and Singapore.


--------------------------------------------------------------------------------

via: https://blog.cloudflare.com/accelerating-node-js-applications-with-http-2-server-push/?utm_source=nodeweekly&utm_medium=email

作者：[Terin Stock][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.cloudflare.com/author/terin-stock/
[1]: https://www.npmjs.com/package/netjet
[2]: http://support.ghost.org/preload-headers/
[3]: https://www.cloudflare.com/http2/server-push/
[4]: https://blog.cloudflare.com/using-http-2-server-push-with-php/
