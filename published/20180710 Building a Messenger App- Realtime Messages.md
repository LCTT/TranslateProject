[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12685-1.html)
[#]: subject: (Building a Messenger App: Realtime Messages)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-realtime-messages/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（五）：实时消息
======

![](https://img.linux.net.cn/data/attachment/album/202010/05/091113edbuavorm89looja.jpg)

本文是该系列的第五篇。

  * [第一篇: 模式][1]
  * [第二篇: OAuth][2]
  * [第三篇: 对话][3]
  * [第四篇: 消息][4]

对于实时消息，我们将使用 <ruby>[服务器发送事件][5]<rt>Server-Sent Events</rt></ruby>。这是一个打开的连接，我们可以在其中传输数据流。我们会有个端点，用户会在其中订阅发送给他的所有消息。

### 消息户端

在 HTTP 部分之前，让我们先编写一个<ruby>映射<rt>map</rt></ruby> ，让所有客户端都监听消息。 像这样全局初始化：

```go
type MessageClient struct {
    Messages chan Message
    UserID   string
}

var messageClients sync.Map
```

### 已创建的新消息

还记得在 [上一篇文章][4] 中，当我们创建这条消息时，我们留下了一个 “TODO” 注释。在那里，我们将使用这个函数来调度一个 goroutine。

```go
go messageCreated(message)
```

把这行代码插入到我们留注释的位置。

```go
func messageCreated(message Message) error {
    if err := db.QueryRow(`
        SELECT user_id FROM participants
        WHERE user_id != $1 and conversation_id = $2
    `, message.UserID, message.ConversationID).
    Scan(&message.ReceiverID); err != nil {
        return err
    }

    go broadcastMessage(message)

    return nil
}

func broadcastMessage(message Message) {
    messageClients.Range(func(key, _ interface{}) bool {
        client := key.(*MessageClient)
        if client.UserID == message.ReceiverID {
            client.Messages <- message
        }
        return true
    })
}
```

该函数查询接收者 ID（其他参与者 ID），并将消息发送给所有客户端。

### 订阅消息

让我们转到 `main()` 函数并添加以下路由：

```go
router.HandleFunc("GET", "/api/messages", guard(subscribeToMessages))
```

此端点处理 `/api/messages` 上的 GET 请求。请求应该是一个 [EventSource][6] 连接。它用一个事件流响应，其中的数据是 JSON 格式的。

```go
func subscribeToMessages(w http.ResponseWriter, r *http.Request) {
    if a := r.Header.Get("Accept"); !strings.Contains(a, "text/event-stream") {
        http.Error(w, "This endpoint requires an EventSource connection", http.StatusNotAcceptable)
        return
    }

    f, ok := w.(http.Flusher)
    if !ok {
        respondError(w, errors.New("streaming unsupported"))
        return
    }

    ctx := r.Context()
    authUserID := ctx.Value(keyAuthUserID).(string)

    h := w.Header()
    h.Set("Cache-Control", "no-cache")
    h.Set("Connection", "keep-alive")
    h.Set("Content-Type", "text/event-stream")

    messages := make(chan Message)
    defer close(messages)

    client := &MessageClient{Messages: messages, UserID: authUserID}
    messageClients.Store(client, nil)
    defer messageClients.Delete(client)

    for {
        select {
        case <-ctx.Done():
            return
        case message := <-messages:
            if b, err := json.Marshal(message); err != nil {
                log.Printf("could not marshall message: %v\n", err)
                fmt.Fprintf(w, "event: error\ndata: %v\n\n", err)
            } else {
                fmt.Fprintf(w, "data: %s\n\n", b)
            }
            f.Flush()
        }
    }
}
```

首先，它检查请求头是否正确，并检查服务器是否支持流式传输。我们创建一个消息通道，用它来构建一个客户端，并将其存储在客户端映射中。每当创建新消息时，它都会进入这个通道，因此我们可以通过 `for-select` 循环从中读取。

<ruby>服务器发送事件<rt>Server-Sent Events</rt></ruby>使用以下格式发送数据：

```go
data: some data here\n\n
```

我们以 JSON 格式发送：

```json
data: {"foo":"bar"}\n\n
```

我们使用 `fmt.Fprintf()` 以这种格式写入响应<ruby>写入器<rt>writter</rt></ruby>，并在循环的每次迭代中刷新数据。

这个循环会一直运行，直到使用请求上下文关闭连接为止。我们延迟了通道的关闭和客户端的删除，因此，当循环结束时，通道将被关闭，客户端不会收到更多的消息。

注意，<ruby>服务器发送事件<rt>Server-Sent Events</rt></ruby>（EventSource）的 JavaScript API 不支持设置自定义请求头😒，所以我们不能设置 `Authorization: Bearer <token>`。这就是为什么 `guard()` 中间件也会从 URL 查询字符串中读取令牌的原因。

* * *

实时消息部分到此结束。我想说的是，这就是后端的全部内容。但是为了编写前端代码，我将再增加一个登录端点：一个仅用于开发的登录。

- [源代码][7]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-realtime-messages/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11396-1.html
[2]: https://linux.cn/article-11510-1.html
[3]: https://linux.cn/article-12056-1.html
[4]: https://linux.cn/article-12680-1.html
[5]: https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events
[6]: https://developer.mozilla.org/en-US/docs/Web/API/EventSource
[7]: https://github.com/nicolasparada/go-messenger-demo
