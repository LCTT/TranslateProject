[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12680-1.html)
[#]: subject: (Building a Messenger App: Messages)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-messages/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（四）：消息
======

![](https://img.linux.net.cn/data/attachment/album/202010/04/114458z1p1188epequ686p.jpg)

本文是该系列的第四篇。

  * [第一篇: 模式][1]
  * [第二篇: OAuth][2]
  * [第三篇: 对话][3]

在这篇文章中，我们将对端点进行编码，以创建一条消息并列出它们，同时还将编写一个端点以更新参与者上次阅读消息的时间。 首先在 `main()` 函数中添加这些路由。

```
router.HandleFunc("POST", "/api/conversations/:conversationID/messages", requireJSON(guard(createMessage)))
router.HandleFunc("GET", "/api/conversations/:conversationID/messages", guard(getMessages))
router.HandleFunc("POST", "/api/conversations/:conversationID/read_messages", guard(readMessages))
```

消息会进入对话，因此端点包含对话 ID。

### 创建消息

该端点处理对 `/api/conversations/{conversationID}/messages` 的 POST 请求，其 JSON 主体仅包含消息内容，并返回新创建的消息。它有两个副作用：更新对话 `last_message_id` 以及更新参与者 `messages_read_at`。

```
func createMessage(w http.ResponseWriter, r *http.Request) {
	var input struct {
		Content string `json:"content"`
	}
	defer r.Body.Close()
	if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	errs := make(map[string]string)
	input.Content = removeSpaces(input.Content)
	if input.Content == "" {
		errs["content"] = "Message content required"
	} else if len([]rune(input.Content)) > 480 {
		errs["content"] = "Message too long. 480 max"
	}
	if len(errs) != 0 {
		respond(w, Errors{errs}, http.StatusUnprocessableEntity)
		return
	}

	ctx := r.Context()
	authUserID := ctx.Value(keyAuthUserID).(string)
	conversationID := way.Param(ctx, "conversationID")

	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		respondError(w, fmt.Errorf("could not begin tx: %v", err))
		return
	}
	defer tx.Rollback()

	isParticipant, err := queryParticipantExistance(ctx, tx, authUserID, conversationID)
	if err != nil {
		respondError(w, fmt.Errorf("could not query participant existance: %v", err))
		return
	}

	if !isParticipant {
		http.Error(w, "Conversation not found", http.StatusNotFound)
		return
	}

	var message Message
	if err := tx.QueryRowContext(ctx, `
		INSERT INTO messages (content, user_id, conversation_id) VALUES
			($1, $2, $3)
		RETURNING id, created_at
	`, input.Content, authUserID, conversationID).Scan(
		&message.ID,
		&message.CreatedAt,
	); err != nil {
		respondError(w, fmt.Errorf("could not insert message: %v", err))
		return
	}

	if _, err := tx.ExecContext(ctx, `
		UPDATE conversations SET last_message_id = $1
		WHERE id = $2
	`, message.ID, conversationID); err != nil {
		respondError(w, fmt.Errorf("could not update conversation last message ID: %v", err))
		return
	}

	if err = tx.Commit(); err != nil {
		respondError(w, fmt.Errorf("could not commit tx to create a message: %v", err))
		return
	}

	go func() {
		if err = updateMessagesReadAt(nil, authUserID, conversationID); err != nil {
			log.Printf("could not update messages read at: %v\n", err)
		}
	}()

	message.Content = input.Content
	message.UserID = authUserID
	message.ConversationID = conversationID
	// TODO: notify about new message.
	message.Mine = true

	respond(w, message, http.StatusCreated)
}
```

首先，它将请求正文解码为包含消息内容的结构。然后，它验证内容不为空并且少于 480 个字符。

```
var rxSpaces = regexp.MustCompile("\\s+")

func removeSpaces(s string) string {
	if s == "" {
		return s
	}

	lines := make([]string, 0)
	for _, line := range strings.Split(s, "\n") {
		line = rxSpaces.ReplaceAllLiteralString(line, " ")
		line = strings.TrimSpace(line)
		if line != "" {
			lines = append(lines, line)
		}
	}
	return strings.Join(lines, "\n")
}
```

这是删除空格的函数。它遍历每一行，删除两个以上的连续空格，然后回非空行。

验证之后，它将启动一个 SQL 事务。首先，它查询对话中的参与者是否存在。

```
func queryParticipantExistance(ctx context.Context, tx *sql.Tx, userID, conversationID string) (bool, error) {
	if ctx == nil {
		ctx = context.Background()
	}
	var exists bool
	if err := tx.QueryRowContext(ctx, `SELECT EXISTS (
		SELECT 1 FROM participants
		WHERE user_id = $1 AND conversation_id = $2
	)`, userID, conversationID).Scan(&exists); err != nil {
		return false, err
	}
	return exists, nil
}
```

我将其提取到一个函数中，因为稍后可以重用。

如果用户不是对话参与者，我们将返回一个 `404 NOT Found` 错误。

然后，它插入消息并更新对话 `last_message_id`。从这时起，由于我们不允许删除消息，因此 `last_message_id` 不能为 `NULL`。

接下来提交事务，并在 goroutine 中更新参与者 `messages_read_at`。

```
func updateMessagesReadAt(ctx context.Context, userID, conversationID string) error {
	if ctx == nil {
		ctx = context.Background()
	}

	if _, err := db.ExecContext(ctx, `
		UPDATE participants SET messages_read_at = now()
		WHERE user_id = $1 AND conversation_id = $2
	`, userID, conversationID); err != nil {
		return err
	}
	return nil
}
```

在回复这条新消息之前，我们必须通知一下。这是我们将要在下一篇文章中编写的实时部分，因此我在那里留一了个注释。

### 获取消息

这个端点处理对 `/api/conversations/{conversationID}/messages` 的 GET 请求。 它用一个包含会话中所有消息的 JSON 数组进行响应。它还具有更新参与者 `messages_read_at` 的副作用。

```
func getMessages(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	authUserID := ctx.Value(keyAuthUserID).(string)
	conversationID := way.Param(ctx, "conversationID")

	tx, err := db.BeginTx(ctx, &sql.TxOptions{ReadOnly: true})
	if err != nil {
		respondError(w, fmt.Errorf("could not begin tx: %v", err))
		return
	}
	defer tx.Rollback()

	isParticipant, err := queryParticipantExistance(ctx, tx, authUserID, conversationID)
	if err != nil {
		respondError(w, fmt.Errorf("could not query participant existance: %v", err))
		return
	}

	if !isParticipant {
		http.Error(w, "Conversation not found", http.StatusNotFound)
		return
	}

	rows, err := tx.QueryContext(ctx, `
		SELECT
			id,
			content,
			created_at,
			user_id = $1 AS mine
		FROM messages
		WHERE messages.conversation_id = $2
		ORDER BY messages.created_at DESC
	`, authUserID, conversationID)
	if err != nil {
		respondError(w, fmt.Errorf("could not query messages: %v", err))
		return
	}
	defer rows.Close()

	messages := make([]Message, 0)
	for rows.Next() {
		var message Message
		if err = rows.Scan(
			&message.ID,
			&message.Content,
			&message.CreatedAt,
			&message.Mine,
		); err != nil {
			respondError(w, fmt.Errorf("could not scan message: %v", err))
			return
		}

		messages = append(messages, message)
	}

	if err = rows.Err(); err != nil {
		respondError(w, fmt.Errorf("could not iterate over messages: %v", err))
		return
	}

	if err = tx.Commit(); err != nil {
		respondError(w, fmt.Errorf("could not commit tx to get messages: %v", err))
		return
	}

	go func() {
		if err = updateMessagesReadAt(nil, authUserID, conversationID); err != nil {
			log.Printf("could not update messages read at: %v\n", err)
		}
	}()

	respond(w, messages, http.StatusOK)
}
```

首先，它以只读模式开始一个 SQL 事务。检查参与者是否存在，并查询所有消息。在每条消息中，我们使用当前经过身份验证的用户 ID 来了解用户是否拥有该消息（`mine`）。 然后，它提交事务，在 goroutine 中更新参与者 `messages_read_at` 并以消息响应。

### 读取消息

该端点处理对 `/api/conversations/{conversationID}/read_messages` 的 POST 请求。 没有任何请求或响应主体。 在前端，每次有新消息到达实时流时，我们都会发出此请求。

```
func readMessages(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	authUserID := ctx.Value(keyAuthUserID).(string)
	conversationID := way.Param(ctx, "conversationID")

	if err := updateMessagesReadAt(ctx, authUserID, conversationID); err != nil {
		respondError(w, fmt.Errorf("could not update messages read at: %v", err))
		return
	}

	w.WriteHeader(http.StatusNoContent)
}
```

它使用了与更新参与者 `messages_read_at` 相同的函数。

* * *

到此为止。实时消息是后台仅剩的部分了。请等待下一篇文章。

- [源代码][4]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-messages/

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
[4]: https://github.com/nicolasparada/go-messenger-demo
