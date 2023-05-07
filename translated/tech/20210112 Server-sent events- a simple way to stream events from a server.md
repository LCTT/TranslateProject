[#]: collector: (lujun9972)
[#]: translator: (Drwhooooo)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Server-sent events: a simple way to stream events from a server)
[#]: via: (https://jvns.ca/blog/2021/01/12/day-36--server-sent-events-are-cool--and-a-fun-bug/)
[#]: author: (Julia Evans https://jvns.ca/)

服务器推送事件：一种自服务器流式推送事件的简易方法
======

哈喽！昨天我见识到了一种我以前从没见过的从服务器推送事件的炫酷方法：[服务器推送事件][1]！如果你只需要让服务器发送事件，相较于 websockets，他们或许是一个更简便的选择。

我会聊一聊他们的用途、运作原理，以及我昨日在试着运行他们的过程中发现的几个 bug。

### 问题：自服务器传送更新数据

现在我有一个启动了虚拟机的网络服务，并且唯有虚拟机启动后用户才能轮询服务器。但我并不想进行轮询。

相反，我想流式推送来自服务器的更新数据。我跟 Kamal 说我要用 websockets 来实现它，而他建议实用服务器推送数据不失为一个更简便的选择！

我登时就愣住了——那什么玩意？？？听起来像是些我从来没见过的稀罕玩意儿。于是乎我就查了查。

### 服务器推送事件就是个 HTTP 请求协议

下文便是服务器推送事件的运作流程。我 很 高 兴 能了解到他们只是 HTTP 请求协议。

  1.客户端提出一个 GET 请求（举个例子）`https://yoursite.com/events`
  2.客户端设置 `Connection: keep-alive`，这样我们就能有一个长连接
  3.服务器设置设置一个  `Content-Type: text/event-stream` 响应头 
  4.服务器开始推送事件，就比如下文这样：



```
event: status
data: one
```

举个例子，这里是当我借助 curl 发送请求时，一些服务器推送事件的状态：

```
$ curl -N 'http://localhost:3000/sessions/15/stream'
event: panda
data: one

event: panda
data: two

event: panda
data: three

event: elephant
data: four
```

服务器可以根据时间推移缓慢推送事件，并且用户也能够在他们到来时读取它们。你也可以将 JSON 带入到事件当中，就比如 `data: {'name': 'ahmed'}`

有线协议真的很简单 (只需要设置 `event:` 和 `data:` 或者如果你愿意，可设置为 `id:` 和 `retry:`)，所以你并不需要任何花里胡哨的服务器库来实现服务器推送事件。

### Javascript 的代码也超级简单 (仅使用 `事件源`)

以下是用于传送服务器推送数据的浏览器上的 javascript 的代码。 (我从 [服务器推送事件的 MND 页面][2] 得到的这个范例)

你可以订阅所有事件，也可以为不同类型的事件使用不同的处理程序。 这里我有一个只接受类型为 `panda` 的事件的处理程序 (就像我们的服务器在前一部分中推送的那样)。

```
const evtSource = new EventSource("/sessions/15/stream", { withCredentials: true })
evtSource.addEventListener("panda", function(event) {
  console.log("status", event)
});
```

### 客户端在中途不能推送更新数据

不同于 websockets，服务器推送事件不允许大量反复的事件交流。（这体现在它的字眼中 —— **服务器** 推送所有事件)。 初始的时候用户创造一个请求，然后服务器发出一连串响应。

### 如果 HTTP连接结束，它会自动重连

使用 '事件源' 发出的 HTTP 请求和常规 HTTP 请求有一个很大的区别，这里 MDN 文档中对此有所赘述：

> 默认情况下，如果客户端和服务器之间的连接断开，则连接会重启。使用 .close() 方法来终止连接。

很奇怪，一开始我真的和它断开了：我打开了一个连接，然后在服务器端将其关闭，然后两秒过后客户端向我的传送终端发送了另一条请求！

我觉得这里可能是因为连接在完成之前意外断开了，所以客户端自动重新打开了它以防止类似情况再发生。

所以如果你不想让客户端继续重试，你就得通过调用 `.close()` 直截了当地关闭连接。

### 这里还有些其他特性

你还能在服务器推送事件中设置 `id:` 和 `retry:` 字段。似乎，如果你在服务器推送事件上设置，那么当重新连接时，客户端将发送带有它收到的最后一个id的 `Last-Event-ID` 响应头。酷!

我发现 [服务器推送事件的 W3C 页面][3] 可读性意外得好。

### 在设置服务器推送事件的时候我遇到了两个 bug 

我在 Rails 中使用服务器推送事件时遇到了几个问题，我认为这些问题挺有趣的。其中一个缘于 nginx，另一个是由 rails 引起的。

**问题一：我没法在事件推送的过程中暂停**

这个奇怪的 bug 在我做以下操作时出现：

```
def handler
    # SSE is Rails' built in server-sent events thing
    sse = SSE.new(response.stream, event: "status")
    sse.write('event')
    sleep 1
    sse.write('another event')
end
```

它会写入第一个事件，而不是第二个事件。我对此 非 常 困 惑，然后放开脑洞，试着理解 Ruby 中的 `sleep` 是如何运作的。 但是 Cass （另一个 Recurser）将我引领到一个与我有着相同困惑的 [Stack Overflow 问答帖]，而这里包含了让我为之震惊的回答！

事实证明，问题出在我的 Rails 服务器这里，它处在 nginx 之后，似乎 nginx 默认使用 HTTP/1.0 向上游服务器发起请求（为啥？都2021年了，还这么干？我相信这其中一定有合乎情理的解释，也许是为了向下兼容之类的）。

所以客户端（nginx）会在服务器推送第一个事件之后关闭连接。我觉得如果在我推送第二个事件的过程中 _没有_ 暂停，它继续正常工作，那么就是服务器在连接关闭之前和客户端之间在争速度，争着推送第二部分响应，如果我这边推送速度足够快那就是客户端拔得头筹。

我不确定为什么使用 HTTP/1.0 会使客户端的连接关闭（可能是因为服务器在每个事件结尾写入了两个换行符？），但因为服务器推送事件是一个比较新的玩意儿，HTTP/1.0 （这种老旧协议）不支持它一点都会不意外。

设置 `proxy_http_version 1.1` 从而解决那个麻烦。 好欸！

**问题二：事件受到缓冲**

这个事情解决完，第二个麻烦接踵而至。不过这个问题相较之非常好解决因为 Cass 已经建议将 [stackoverflow 里另一篇帖的回答][5] 作为前一个问题的解决方案，虽然它并没有是导致问题一出现的源头，但它 解 释 了 问题二。

问题在本示例代码中：

```
def handler
    response.headers['Content-Type'] = 'text/event-stream'
    # Turn off buffering in nginx
    response.headers['X-Accel-Buffering'] = 'no'
    sse = SSE.new(response.stream, event: "status")
    10.times do
        sse.write('event')
        sleep 1
    end
end
```

我本来期望它每秒返回1个事件，持续10秒，但实际上它等了10秒才把10个事件一起返回。这不是我们想要的流式传输方式！

原来这是因为 Rack ETag 中间件想要计算 ETag（响应的哈希值），为此它需要整个响应为它服务。因此，我需要禁用 ETag 生成。

Stack Overflow 的回答建议完全禁用 Rack ETag 中间件，但我不想这样做，于是我去看了 [链接至 Github 上的议题][6]。

那个 github 问题建议我可以针对仅流式传输终端应用一个解决方法，即  `Last-Modified` 响应头，显然，这么做可以绕过 ETag 中间件。

所以我设置为：

```
headers['Last-Modified'] = Time.now.httpdate
```

然后它起作用了!!!

我还通过设置响应头 `X-Accel-Buffering: no` 关闭了位于 nginx 中的缓冲区。我并没有百分百确定我要那样做，但这么做似乎更安全。

### stack overflow 里很棒

起初，我全身心致力于从头开始调试这两个 bug。Cass（另一个Recurser）为我指向了那两个 Stack Overflow 帖子，一开始我对那些帖下提出的解决方案持怀疑态度（我想：“我没有使用 HTTP/1.0 啊！ETag 响应头什么玩意，跟这一切有关系吗？？”）。

但结果证明，我确实无意中使用 _了_ HTTP / 1.0，并且 Rack ETag 中间件确实给我带来了问题。

因此，也许这个故事告诉我有时候计算机就是会以奇怪的方式相互作用，其他人在过去也遇到过计算机以完全相同的奇怪方式相互作用的问题，而 Stack Overflow 有时会提供关于为什么会发生这些情况的答案 :)

我认为重要的是不要随意从 Stack Overflow 中尝试各种解决方案（当然，在这种情况下不会有人建议这样做！）。对于这两个问题，我确实需要去仔细思考，了解发生了什么，还有为什么更改这些设置会起作用。

### 就是这样！

今天我要继续着手实现服务器推送事件，因为昨天一整天我都沉浸在上述这些 bug 里。好在我学到了一个以前从未听说过的易学易用的网络技术，心里还是很高心的。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/01/12/day-36--server-sent-events-are-cool--and-a-fun-bug/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://html.spec.whatwg.org/multipage/server-sent-events.html
[2]: https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events
[3]: https://html.spec.whatwg.org/multipage/server-sent-events.html#event-stream-interpretation
[4]: https://stackoverflow.com/questions/25660399/sse-eventsource-closes-after-first-chunk-of-data-rails-4-puma-nginx
[5]: https://stackoverflow.com/questions/63432012/server-sent-events-in-rails-not-delivered-asynchronously/65127528#65127528
[6]: https://github.com/rack/rack/issues/1619
