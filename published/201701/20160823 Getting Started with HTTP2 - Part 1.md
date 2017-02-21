初识 HTTP/2（一）
============================================================
 ![](https://static.viget.com/_284x284_crop_center-center/http2-pizza.png?mtime=20160822160641)

> 用披萨来说明当你订单数很大的时候 HTTP/2 是怎么打败 HTTP/1.1 的。

在建立网站和应用的方式上 HTTP/2 有些令人惊叹的改变，在 HTTP/2 发布后的一年半，几乎 [10% 的网站使用了  HTTP/2][4]。它绝对值得采用，但是这篇文章应该首先推给使用 HTTP/2 的前端开发者。这个连载的文章是指导前端开发者怎么转换到 HTTP/2。

本文涵盖了 HTTP/2 对 HTTP/1.1 来说有什么提高的内容，并且向前端开发者介绍了 HTTP/2。

### 再次让我想起什么是 HTTP ...

超文本传输协议，也就是 HTTP，这个协议决定了 web 内容怎么传输。HTTP/1.1 在 1999 年被标准化，那时候的 web 和现在有很大的不同，表格霸占了整个网络。样式通常被内联在元素中，如果网站管理员更加的细致，他们会在头部写个 `<style>`标签。 JavaScript 也被丢在文档里面，那时候完整的网站通常也不会超过几页。

HTTP/1.1 预计这种情况会持续一段时间，所以它并没有太过关注在让一个站点可以加载大量的资源方面，因为那时候的开发者并不需要这个。因此它使用了一个非常简单的方式来处理资源，你访问一个资源然后服务器去寻找它，并且返回你访问的资源，或者告诉你这个资源不存在。这种被叫作"线头堵塞"方式非常高效，但是当你需要多个资源的时候，这个进程会依次寻找每个资源。这意味着在你访问第二个资源之前，服务器必须找到你访问的第一个资源并且载入它，或者告诉你没找到。

### 大型站点的发展

在 1999 年之后的几年里，随着 php 和其他像 Rails 这样的动态语言的崛起，站点变得越来越复杂。css 文件也随着向响应式开发的转变而变的越来越大，因此像 Sass 这样的可以创造一个简单的工作环境的 CSS 编译器就应运而生。 JavaScript 也在 web 上有了更大的作用，它允许开发者编写复杂的应用，这曾经只是 C++ 开发人员的工作。随着 Retina 和高清显示屏的兴起，也让图片变得更高清。随着这些改变，文件大小呈现指数式的增长，使得本来是等待几个字节的资源变成了加载几千字节，甚至在某些情况下有几兆。当你开始载入页面的其它东西前，必须先载入数百 K 的东西，你只能乐观的假设你的用户有很快的网络接入。

想象 HTTP/1.1 是个过去的那种柜台购买式的街旁披萨店。你能自己过去并且预定一个雪碧和 2 片 Angry Hawaiian ，然后等待 3 分钟。他们可以很容易地处理这些，实际上这是一个蓬勃发展的商业模式-定单简单、处理迅速。

![](https://static.viget.com/_300xAUTO_crop_center-center/http2-pizzaorder1.png?mtime=20160823122331)

然而，一旦你决定在同样的披萨店主办一场小区域的季度颁奖典礼，事情就变的更复杂了。每个人都预定不同的东西，快速而杂乱无章让等待时间直线上升。

![](https://static.viget.com/_300xAUTO_crop_center-center/http2-pizzaorder2.png?mtime=20160823130750)

### 哪里是 HTTP/2 的舞台

HTTP/2 对前端开发者主要的承诺就是复用。意思就是资源请求能发生在同一时间，并且服务器能马上响应这些资源。在请求之间没有等待，因为它们发生在同一时间。

使用同样的比喻，HTTP/2 允许披萨店在餐馆他们自己区域举办派对。派一个服务员接受订单，并把所有已经准备好的订单交付。当其他人的比萨在制作的时候，你也不需要花 30 分钟去等待你的雪碧，它们在第一批交付的东西之中。这方式使得管理大量订单更加简单，并且防止人们等他们的订单时间太长。

复用带给我们的 web 开发的大变化是改变了文件的加载方式。帮助绕过资源加载的 HTTP/1.1 瓶颈的方式是通过连接和压缩需要被加载的文件。所有任务运行器都默认采取这样的操作方式，或者需要作一点小设置就行。和过去一样，开发人员可以将图像放在精灵拼图（sprite sheets）中，这会减少了对服务器的请求数。

### 改进 HTTP/1.1

将文件连接起来是个处理 HTTP1.1 的请求限制问题的非常聪明的方式，但是连接文件的主要问题是它要求用户第一次访问整个网站时下载所有的资源。一旦它们载入后，浏览器就会缓存所有的资源。这能提高用户每次访问网页时的速度，但是前期负载很重，对[跳出率不利][5]。此外，他们可能为所不访问的页面加载资源。期望用户访问每个页面以查看每个样式，并与每个脚本进行交互是不现实的。此外，在加拿大和欧洲以及几乎每个美国移动提供商的地方，有每月的带宽上限。不是加载额外的 54 千字节的内容就会超过每月的流量限制，而是让我们假设用户想保留这些额外的流量看 Taylor Swift 的 gif。

使用 HTTP/2 和多路复用，您可以开发一些最高效的网站，但它需要一些重新思考、甚至​​撤销之前的最佳做法。重复一次，我的目的是加快 HTTP/2 的会话，使用我们新的工具，我们可以发现这些新的最佳的做法。

在我的下一篇文章，[我将探索建设基于 HTTP/2 的网站的一些最好方式][6]。

--------------------------------------------------------------------------------

via: https://www.viget.com/articles/getting-started-with-http-2-part-1?imm_mid=0eb24a&cmp=em-web-na-na-newsltr_20161130

作者：[Ben][a]
译者：[hkurj](https://github.com/hkurj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.viget.com/about/team/btinsley
[1]:https://twitter.com/home?status=Using%20pizza%20to%20show%20how%20HTTP%2F2%20beats%20HTTP%2F1.1%20when%20your%20orders%20get%20too%20big.%20https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[2]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[3]:http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[4]:https://w3techs.com/technologies/details/ce-http2/all/all
[5]:https://blog.kissmetrics.com/speed-is-a-killer/
[6]:https://www.viget.com/articles/getting-started-with-http-2-part-2
[7]:https://www.viget.com/about/team/btinsley
