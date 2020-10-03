[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: Realtime Messages)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-realtime-messages/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: Realtime Messages
======

This post is the 5th on a series:

  * [Part 1: Schema][1]
  * [Part 2: OAuth][2]
  * [Part 3: Conversations][3]
  * [Part 4: Messages][4]



For realtime messages we’ll use [Server-Sent Events][5]. This is an open connection in which we can stream data. We’ll have and endpoint in which the user subscribes to all the messages sended to him.

### Message Clients

Before the HTTP part, let’s code a map to have all the clients listening for messages. Initialize this globally like so:

```
type MessageClient struct {
    Messages chan Message
    UserID   string
}

var messageClients sync.Map
```

### New Message Created

Remember in the [last post][4] when we created the message, we left a “TODO” comment. There we’ll dispatch a goroutine with this function.

```
go messageCreated(message)
```

Insert that line just where we left the comment.

```
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

The function queries for the recipient ID (the other participant ID) and sends the message to all the clients.

### Subscribe to Messages

Lets go to the `main()` function and add this route:

```
router.HandleFunc("GET", "/api/messages", guard(subscribeToMessages))
```

This endpoint handles GET requests on `/api/messages`. The request should be an [EventSource][6] connection. It responds with an event stream in which the data is JSON formatted.

```
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

First it checks for the correct request headers and checks the server supports streaming. We create a channel of messages to make a client and store it in the clients map. Each time a new message is created, it will go in this channel, so we can read from it with a `for-select` loop.

Server-Sent Events uses this format to send data:

```
data: some data here\n\n
```

We are sending it in JSON format:

```
data: {"foo":"bar"}\n\n
```

We are using `fmt.Fprintf()` to write to the response writter in this format and flushing the data in each iteration of the loop.

This will loop until the connection is closed using the request context. We defered the close of the channel and the delete of the client, so when the loop ends, the channel will be closed and the client won’t receive more messages.

Note aside, the JavaScript API to work with Server-Sent Events (EventSource) doesn’t support setting custom headers 😒 So we cannot set `Authorization: Bearer <token>`. And that’s the reason why the `guard()` middleware reads the token from the URL query string also.

* * *

That concludes the realtime messages. I’d like to say that’s everything in the backend, but to code the frontend I’ll add one more endpoint to login. A login that will be just for development.

[Souce Code][7]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-realtime-messages/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://nicolasparada.netlify.com/posts/go-messenger-schema/
[2]: https://nicolasparada.netlify.com/posts/go-messenger-oauth/
[3]: https://nicolasparada.netlify.com/posts/go-messenger-conversations/
[4]: https://nicolasparada.netlify.com/posts/go-messenger-messages/
[5]: https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events
[6]: https://developer.mozilla.org/en-US/docs/Web/API/EventSource
[7]: https://github.com/nicolasparada/go-messenger-demo
