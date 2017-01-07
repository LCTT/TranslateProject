初识 HTTP/2（第一部分）
============================================================
 ![](https://static.viget.com/_284x284_crop_center-center/http2-pizza.png?mtime=20160822160641)

用披萨来说明当你订单数很大的时候HTTP/2是怎么打败HTTP/1.1的。

在建立网站和应用上 _HTTP/2 有些令人惊叹的改变，在 HTTP/2 发布后的一年半，几乎[10%的网站使用了 HTTP/2][4]。它是绝对值得被采用的，但是这篇博文应该首推给使用 HTTP/2 的前端开发者。这是个连载的博文是指导前端开发者怎么转换到 HTTP/2。_

_这个推送涵盖了 HTTP/2 对 HTTP/1.1 来说有什么提高，并且向前端开发者介绍了 HTTP/2_。

### 再次让我想起什么是HTTP...

超文本传输协议，也就是 HTTP，这个协议决定了 web 内容怎么传输。HTTP/1.1 在1999年被标准化，那时候的 web 和现在有很大的不同，表格霸占了整个网络。样式通常被内联在元素中，如果网站管理员更加的细致，他们会在头部写个 '<style>' 标签。 JavaScript 也被使用在文档上，那时候完整的网站通常也不会超过几页。

HTTP/1.1 假设这种情况会持续一段时间，所以它并没有太过关注允许一个站点加载大量的资源，因为那时候的开发者并不需要这个。因此它使用了一个非常简单的方式来处理资源，你访问一个资源然后服务器去寻找它并且返回你访问的或者告诉你这个资源不存在。这被叫作"线头堵塞"并且非常高效的，但是当你需要多个资源的时候，这个进程会依次寻找每个资源。这意味着在你访问第二个资源之前，服务器必须找到你访问的第一个并且载入它或者告诉你没找到。

### 大型站点的发展

在1999年后的几年里，随着php和其他Rails等动态语言的崛起，站点变得越来越复杂。css文件也随着向响应式开发的转变变的越来越大，因此CSS编译器就，比如Sass，就创造了一个简单的工作环境。 JavaScript 也在 web 上有了更大的作用，允许开发者编写复杂的应用，这曾经只是才c++ 开发人员的工作。Retina和高清显示屏的兴起，也让图片可以定义更多的属性。随着这些改变，文件大小呈现指数式的增长，使用本来是等待几个字节的资源变成了加载几千字节，甚至在某些情况下有几兆。当你开始载入这页面的其他东西前必须先载入数百个千字节的东西，你只能乐观的假设你的用户有很快的网络。

想象 HTTP/1.1 是个精巧的订单在柜台里附近的披萨店。你能自己过去并且预定一个雪碧和2片 Angry Hawaiian 然后等待3分钟。他们很简单的处理这些，实际上这是个蓬勃发展的商业模式-快速插入简单的定单。
 ![](https://static.viget.com/_300xAUTO_crop_center-center/http2-pizzaorder1.png?mtime=20160823122331)

然而，一旦你决定主办小区域的季度颁奖典礼在同样的披萨店，事情就变的更复杂了。每个人都预定不同的东西，杂乱无章的快会让等待时间加长。

 ![](https://static.viget.com/_300xAUTO_crop_center-center/http2-pizzaorder2.png?mtime=20160823130750)

### 哪里是HTTP/2的舞台

HTTP/2对前端开发者主要的承诺就是复用。意思就是资源请求能发生在同一时间并且服务器能马上响应这些资源。在请求之间没有等待，因为它们发生在同一时间。

使用一样的比喻，HTTP/2 允许披萨店在餐馆举办他们自己这区域的派对。派一个服务员接受订单并带出所有已经准备好的订单。当其他人的比萨在制作的时候，你也不需要花30分钟去等待你的雪碧，所以这成为了第一个项目之一。这方式使管理大量订单更加简单并且防止人们等他们的订单时间太长。

复用带给我们 web 开发的大变化是我们改变文件的加载方式。帮助绕过资源加载的 HTTP/1.1 瓶颈的方式是通过连接和缩小立即加载的文件。所有任务运行器都默认执行这操作或者需要作一点小设置。通常，开发人员也会将图像放在精灵表单中，这也减少了对服务器的请求数。

### 改进 HTTP/1.1

连接文件是个非常聪明的方式来处理 HTTP1.1 的请求限制问题，但是主要的连接文件问题是它要求用户第一次访问整个网站时下载所有的资源。一旦它们载入浏览器会缓存所有的资源。能提高用户每次访问这网页时的速度，但是前期负载很重，对[跳出率不利][5]。此外，他们可能为他们不访问的页面加载资源。期望用户访问每个页面以查看每个样式并与每个脚本进行交互是不现实的。此外，在加拿大和欧洲以及几乎每个美国移动提供商的地方，每月的带宽上限。不是加载额外的54千字节的内容会超过每月的流量限制，而是让我们假设用户想保留这些额外的字节看Taylor Swift的gif。

使用HTTP/2和多路复用，您可以运行一些最高效的网站，但它需要一些重新思考甚至​​撤销之前的最佳做法。重复一次，我的目的是加快HTTP/2的会话，使用我们新的工具，我们可以发现这些新的最佳的做法。

在我的下一篇文章，[我将探索一些最好的方式来处理一个基于HTTP/2的网站][6]

--------------------------------------------------------------------------------

via: https://www.viget.com/articles/getting-started-with-http-2-part-1?imm_mid=0eb24a&cmp=em-web-na-na-newsltr_20161130

作者：[Ben][a]
译者：[译者ID](https://github.com/hkurj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.viget.com/about/team/btinsley
[1]:https://twitter.com/home?status=Using%20pizza%20to%20show%20how%20HTTP%2F2%20beats%20HTTP%2F1.1%20when%20your%20orders%20get%20too%20big.%20https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[2]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[3]:http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[4]:https://w3techs.com/technologies/details/ce-http2/all/all
[5]:https://blog.kissmetrics.com/speed-is-a-killer/
[6]:https://www.viget.com/articles/getting-started-with-http-2-part-2
[7]:https://www.viget.com/about/team/btinsley
