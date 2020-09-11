[#]: collector: (lujun9972)
[#]: translator: (PsiACE)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12056-1.html)
[#]: subject: (Building a Messenger App: Conversations)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-conversations/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（三）：对话
======

![](https://img.linux.net.cn/data/attachment/album/202003/30/193824w7xsj2ixs8frsal8.jpg)

本文是该系列的第三篇。

* [第一篇：模式][1]
* [第二篇：OAuth][2]

在我们的即时消息应用中，消息表现为两个参与者对话的堆叠。如果你想要开始一场对话，就应该向应用提供你想要交谈的用户，而当对话创建后（如果该对话此前并不存在），就可以向该对话发送消息。

就前端而言，我们可能想要显示一份近期对话列表。并在此处显示对话的最后一条消息以及另一个参与者的姓名和头像。

在这篇帖子中，我们将会编写一些<ruby>端点<rt>endpoint</rt></ruby>来完成像“创建对话”、“获取对话列表”以及“找到单个对话”这样的任务。

首先，要在主函数 `main()` 中添加下面的路由。

```go
router.HandleFunc("POST", "/api/conversations", requireJSON(guard(createConversation)))
router.HandleFunc("GET", "/api/conversations", guard(getConversations))
router.HandleFunc("GET", "/api/conversations/:conversationID", guard(getConversation))
```

这三个端点都需要进行身份验证，所以我们将会使用 `guard()` 中间件。我们也会构建一个新的中间件，用于检查请求内容是否为 JSON 格式。

### JSON 请求检查中间件

```go
func requireJSON(handler http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        if ct := r.Header.Get("Content-Type"); !strings.HasPrefix(ct, "application/json") {
            http.Error(w, "Content type of application/json required", http.StatusUnsupportedMediaType)
            return
        }
        handler(w, r)
    }
}
```

如果<ruby>请求<rt>request</rt></ruby>不是 JSON 格式，那么它会返回 `415 Unsupported Media Type`（不支持的媒体类型）错误。

### 创建对话

```go
type Conversation struct {
    ID                string   `json:"id"`
    OtherParticipant  *User    `json:"otherParticipant"`
    LastMessage       *Message `json:"lastMessage"`
    HasUnreadMessages bool     `json:"hasUnreadMessages"`
}
```

就像上面的代码那样，对话中保持对另一个参与者和最后一条消息的引用，还有一个 `bool` 类型的字段，用来告知是否有未读消息。

```go
type Message struct {
    ID             string    `json:"id"`
    Content        string    `json:"content"`
    UserID         string    `json:"-"`
    ConversationID string    `json:"conversationID,omitempty"`
    CreatedAt      time.Time `json:"createdAt"`
    Mine           bool      `json:"mine"`
    ReceiverID     string    `json:"-"`
}
```

我们会在下一篇文章介绍与消息相关的内容，但由于我们这里也需要用到它，所以先定义了 `Message` 结构体。其中大多数字段与数据库表一致。我们需要使用 `Mine` 来断定消息是否属于当前已验证用户所有。一旦加入实时功能，`ReceiverID` 可以帮助我们过滤消息。

接下来让我们编写 HTTP 处理程序。尽管它有些长，但也没什么好怕的。

```go
func createConversation(w http.ResponseWriter, r *http.Request) {
    var input struct {
        Username string `json:"username"`
    }
    defer r.Body.Close()
    if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }

    input.Username = strings.TrimSpace(input.Username)
    if input.Username == "" {
        respond(w, Errors{map[string]string{
            "username": "Username required",
        }}, http.StatusUnprocessableEntity)
        return
    }

    ctx := r.Context()
    authUserID := ctx.Value(keyAuthUserID).(string)

    tx, err := db.BeginTx(ctx, nil)
    if err != nil {
        respondError(w, fmt.Errorf("could not begin tx: %v", err))
        return
    }
    defer tx.Rollback()

    var otherParticipant User
    if err := tx.QueryRowContext(ctx, `
        SELECT id, avatar_url FROM users WHERE username = $1
    `, input.Username).Scan(
        &otherParticipant.ID,
        &otherParticipant.AvatarURL,
    ); err == sql.ErrNoRows {
        http.Error(w, "User not found", http.StatusNotFound)
        return
    } else if err != nil {
        respondError(w, fmt.Errorf("could not query other participant: %v", err))
        return
    }

    otherParticipant.Username = input.Username

    if otherParticipant.ID == authUserID {
        http.Error(w, "Try start a conversation with someone else", http.StatusForbidden)
        return
    }

    var conversationID string
    if err := tx.QueryRowContext(ctx, `
        SELECT conversation_id FROM participants WHERE user_id = $1
        INTERSECT
        SELECT conversation_id FROM participants WHERE user_id = $2
    `, authUserID, otherParticipant.ID).Scan(&conversationID); err != nil && err != sql.ErrNoRows {
        respondError(w, fmt.Errorf("could not query common conversation id: %v", err))
        return
    } else if err == nil {
        http.Redirect(w, r, "/api/conversations/"+conversationID, http.StatusFound)
        return
    }

    var conversation Conversation
    if err = tx.QueryRowContext(ctx, `
        INSERT INTO conversations DEFAULT VALUES
        RETURNING id
    `).Scan(&conversation.ID); err != nil {
        respondError(w, fmt.Errorf("could not insert conversation: %v", err))
        return
    }

    if _, err = tx.ExecContext(ctx, `
        INSERT INTO participants (user_id, conversation_id) VALUES
            ($1, $2),
            ($3, $2)
    `, authUserID, conversation.ID, otherParticipant.ID); err != nil {
        respondError(w, fmt.Errorf("could not insert participants: %v", err))
        return
    }

    if err = tx.Commit(); err != nil {
        respondError(w, fmt.Errorf("could not commit tx to create conversation: %v", err))
        return
    }

    conversation.OtherParticipant = &otherParticipant

    respond(w, conversation, http.StatusCreated)
}
```

在此端点，你会向 `/api/conversations` 发送 POST 请求，请求的 JSON 主体中包含要对话的用户的用户名。

因此，首先需要将请求主体解析成包含用户名的结构。然后，校验用户名不能为空。

```go
type Errors struct {
    Errors map[string]string `json:"errors"`
}
```

这是错误消息的结构体 `Errors`，它仅仅是一个映射。如果输入空用户名，你就会得到一段带有 `422 Unprocessable Entity`（无法处理的实体）错误消息的 JSON 。

```json
{
    "errors": {
        "username": "Username required"
    }
}
```

然后，我们开始执行 SQL 事务。收到的仅仅是用户名，但事实上，我们需要知道实际的用户 ID 。因此，事务的第一项内容是查询另一个参与者的 ID 和头像。如果找不到该用户，我们将会返回 `404 Not Found`（未找到） 错误。另外，如果找到的用户恰好和“当前已验证用户”相同，我们应该返回 `403 Forbidden`（拒绝处理）错误。这是由于对话只应当在两个不同的用户之间发起，而不能是同一个。

然后，我们试图找到这两个用户所共有的对话，所以需要使用 `INTERSECT` 语句。如果存在，只需要通过 `/api/conversations/{conversationID}` 重定向到该对话并将其返回。

如果未找到共有的对话，我们需要创建一个新的对话并添加指定的两个参与者。最后，我们 `COMMIT` 该事务并使用新创建的对话进行响应。

### 获取对话列表

端点 `/api/conversations` 将获取当前已验证用户的所有对话。

```go
func getConversations(w http.ResponseWriter, r *http.Request) {
    ctx := r.Context()
    authUserID := ctx.Value(keyAuthUserID).(string)

    rows, err := db.QueryContext(ctx, `
        SELECT
            conversations.id,
            auth_user.messages_read_at < messages.created_at AS has_unread_messages,
            messages.id,
            messages.content,
            messages.created_at,
            messages.user_id = $1 AS mine,
            other_users.id,
            other_users.username,
            other_users.avatar_url
        FROM conversations
        INNER JOIN messages ON conversations.last_message_id = messages.id
        INNER JOIN participants other_participants
            ON other_participants.conversation_id = conversations.id
                AND other_participants.user_id != $1
        INNER JOIN users other_users ON other_participants.user_id = other_users.id
        INNER JOIN participants auth_user
            ON auth_user.conversation_id = conversations.id
                AND auth_user.user_id = $1
        ORDER BY messages.created_at DESC
    `, authUserID)
    if err != nil {
        respondError(w, fmt.Errorf("could not query conversations: %v", err))
        return
    }
    defer rows.Close()

    conversations := make([]Conversation, 0)
    for rows.Next() {
        var conversation Conversation
        var lastMessage Message
        var otherParticipant User
        if err = rows.Scan(
            &conversation.ID,
            &conversation.HasUnreadMessages,
            &lastMessage.ID,
            &lastMessage.Content,
            &lastMessage.CreatedAt,
            &lastMessage.Mine,
            &otherParticipant.ID,
            &otherParticipant.Username,
            &otherParticipant.AvatarURL,
        ); err != nil {
            respondError(w, fmt.Errorf("could not scan conversation: %v", err))
            return
        }

        conversation.LastMessage = &lastMessage
        conversation.OtherParticipant = &otherParticipant
        conversations = append(conversations, conversation)
    }

    if err = rows.Err(); err != nil {
        respondError(w, fmt.Errorf("could not iterate over conversations: %v", err))
        return
    }

    respond(w, conversations, http.StatusOK)
}
```

该处理程序仅对数据库进行查询。它通过一些联接来查询对话表……首先，从消息表中获取最后一条消息。然后依据“ID 与当前已验证用户不同”的条件，从参与者表找到对话的另一个参与者。然后联接到用户表以获取该用户的用户名和头像。最后，再次联接参与者表，并以相反的条件从该表中找出参与对话的另一个用户，其实就是当前已验证用户。我们会对比消息中的 `messages_read_at` 和 `created_at` 两个字段，以确定对话中是否存在未读消息。然后，我们通过 `user_id` 字段来判定该消息是否属于“我”（指当前已验证用户）。

注意，此查询过程假定对话中只有两个用户参与，它也仅仅适用于这种情况。另外,该设计也不很适用于需要显示未读消息数量的情况。如果需要显示未读消息的数量，我认为可以在 `participants` 表上添加一个`unread_messages_count` `INT` 字段，并在每次创建新消息的时候递增它，如果用户已读则重置该字段。

接下来需要遍历每一条记录，通过扫描每一个存在的对话来建立一个<ruby>对话切片<rt>slice of conversations</rt></ruby>并在最后进行响应。

### 找到单个对话

端点 `/api/conversations/{conversationID}` 会根据 ID 对单个对话进行响应。

```go
func getConversation(w http.ResponseWriter, r *http.Request) {
    ctx := r.Context()
    authUserID := ctx.Value(keyAuthUserID).(string)
    conversationID := way.Param(ctx, "conversationID")

    var conversation Conversation
    var otherParticipant User
    if err := db.QueryRowContext(ctx, `
        SELECT
            IFNULL(auth_user.messages_read_at < messages.created_at, false) AS has_unread_messages,
            other_users.id,
            other_users.username,
            other_users.avatar_url
        FROM conversations
        LEFT JOIN messages ON conversations.last_message_id = messages.id
        INNER JOIN participants other_participants
            ON other_participants.conversation_id = conversations.id
                AND other_participants.user_id != $1
        INNER JOIN users other_users ON other_participants.user_id = other_users.id
        INNER JOIN participants auth_user
            ON auth_user.conversation_id = conversations.id
                AND auth_user.user_id = $1
        WHERE conversations.id = $2
    `, authUserID, conversationID).Scan(
        &conversation.HasUnreadMessages,
        &otherParticipant.ID,
        &otherParticipant.Username,
        &otherParticipant.AvatarURL,
    ); err == sql.ErrNoRows {
        http.Error(w, "Conversation not found", http.StatusNotFound)
        return
    } else if err != nil {
        respondError(w, fmt.Errorf("could not query conversation: %v", err))
        return
    }

    conversation.ID = conversationID
    conversation.OtherParticipant = &otherParticipant

    respond(w, conversation, http.StatusOK)
}
```

这里的查询与之前有点类似。尽管我们并不关心最后一条消息的显示问题，并因此忽略了与之相关的一些字段，但是我们需要根据这条消息来判断对话中是否存在未读消息。此时，我们使用 `LEFT JOIN` 来代替 `INNER JOIN`，因为 `last_message_id` 字段是 `NULLABLE`（可以为空）的；而其他情况下，我们无法得到任何记录。基于同样的理由，我们在 `has_unread_messages` 的比较中使用了 `IFNULL` 语句。最后，我们按 ID 进行过滤。

如果查询没有返回任何记录，我们的响应会返回 `404 Not Found` 错误，否则响应将会返回 `200 OK` 以及找到的对话。

* * *

本篇帖子以创建了一些对话端点结束。

在下一篇帖子中，我们将会看到如何创建并列出消息。

- [源代码][3]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-conversations/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[PsiACE](https://github.com/PsiACE)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11396-1.html
[2]: https://linux.cn/article-11510-1.html
[3]: https://github.com/nicolasparada/go-messenger-demo
