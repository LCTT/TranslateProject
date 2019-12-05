[#]: collector: (lujun9972)
[#]: translator: (hanwckf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11648-1.html)
[#]: subject: (curl exercises)
[#]: via: (https://jvns.ca/blog/2019/08/27/curl-exercises/)
[#]: author: (Julia Evans https://jvns.ca/)
 
21 个 curl 命令练习
======

最近，我对人们如何学习新事物感兴趣。我正在读 Kathy Sierra 的好书《[Badass: Making Users Awesome][1]》，它探讨了有关“刻意练习”的想法。这个想法是，你找到一个可以用三节 45 分钟课程内能够学会的小技能，并专注于学习这项小技能。因此，作为一项练习，我尝试考虑一项能够在三节 45 分钟课程内学会的计算机技能。

我认为使用 `curl` 构造 HTTP 请求也许就是这样的一项技能，所以这里有一些 `curl` 练习作为实验！

### 什么是 curl ?

`curl` 是用于构造 HTTP 请求的命令行工具。我喜欢使用 `curl`，因为它能够很轻松地测试服务器或 API 的行为是否符合预期，但是刚开始接触它的时候会让你感到一些困惑！

下面是一幅解释 `curl` 常用命令行参数的漫画 （在我的 [Bite Size Networking][2] 杂志的第 6 页）。

![](https://jvns.ca/images/curl.jpeg)

### 熟能生巧

对于任何命令行工具，我认为熟练使用是很有帮助的，能够做到只输入必要的命令真是太好了。例如，最近我在测试 Gumroad API，我只需要输入：

```
curl https://api.gumroad.com/v2/sales \
                         -d "access_token=<SECRET>" \
                         -X GET  -d "before=2016-09-03"
```

就能从命令行中得到想要的结果。

### 21 个 curl 练习
 
这些练习是用来理解如何使用 `curl` 构造不同种类的 HTTP 请求的，它们是故意有点重复的，基本上包含了我需要 `curl` 做的任何事情。

为了简单起见，我们将对 https://httpbin.org 发起一系列 HTTP 请求，httpbin 接受 HTTP 请求，然后在响应中回显你所发起的 HTTP 请求。

  1. 请求 <https://httpbin.org>
  2. 请求 <https://httpbin.org/anything>，它将会解析你发起的请求，并且在响应中回显。`curl` 默认发起的是 GET 请求
  3. 向 <https://httpbin.org/anything> 发起 GET 请求
  4. 向 <https://httpbin.org/anything> 发起 GET 请求，但是这次需要添加一些查询参数（设置 `value=panda`）
  5. 请求 Google 的 `robots.txt` 文件 ([www.google.com/robots.txt][3])
  6. 向 <https://httpbin.org/anything> 发起 GET 请求，并且设置请求头为 `User-Agent: elephant`
  7. 向 <https://httpbin.org/anything> 发起 DELETE 请求
  8. 请求 <https://httpbin.org/anything> 并获取响应头信息
  9. 向 <https://httpbin.com/anything> 发起请求体为 JSON `{"value": "panda"}` 的 POST 请求
  10. 发起与上一次相同的 POST 请求，但是这次要把请求头中的 `Content-Type` 字段设置成 `application/json`（因为 POST 请求需要一个与请求体相匹配的 `Content-Type` 请求头字段）。查看响应体中的 `json` 字段，对比上一次得到的响应体
  11. 向 <https://httpbin.org/anything> 发起 GET 请求，并且在请求头中设置 `Accept-Encoding: gzip`（将会发生什么？为什么会这样？）
  12. 将一些 JSON 放在文件中，然后向 <https://httpbin.org/anything> 发起请求体为该文件的 POST 请求
  13. 设置请求头为 `Accept: image/png` 并且向 <https://httpbin.org/image> 发起请求，将输出保存为 PNG 文件，然后使用图片浏览器打开。尝试使用不同的 `Accept:` 字段去请求此 URL
  14. 向 <https://httpbin.org/anything> 发起 PUT 请求
  15. 请求 <https://httpbin.org/image/jpeg> 并保存为文件，然后使用你的图片编辑器打开这个文件
  16. 请求 <https://www.twitter.com>，你将会得到空的响应。让 `curl` 显示出响应头信息，并尝试找出响应内容为空的原因
  17. 向 <https://httpbin.org/anything> 发起任意的请求，同时设置一些无意义的请求头（例如：`panda: elephant`）
  18. 请求 <https://httpbin.org/status/404> 和 <https://httpbin.org/status/200>，然后再次请求它们并且让 curl 显示响应头信息
  19. 请求 <https://httpbin.org/anything> 并且设置用户名和密码（使用 `-u username:password`）
  20. 设置 `Accept-Language: es-ES` 的请求头用以下载 Twitter 的西班牙语主页 (<https://twitter.com>)
  21. 使用 `curl` 向 Stripe API 发起请求（请查看 <https://stripe.com/docs/development> 了解如何使用，他们会给你一个测试用的 API key）。尝试向 <https://httpbin.org/anything> 发起相同的请求



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/08/27/curl-exercises/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[hanwckf](https://github.com/hanwckf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/Badass-Making-Awesome-Kathy-Sierra/dp/1491919019
[2]: https://wizardzines.com/zines/bite-size-networking
[3]: http://www.google.com/robots.txt
