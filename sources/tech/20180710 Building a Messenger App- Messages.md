[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: Messages)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-messages/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: Messages
======

This post is the 4th on a series:

  * [Part 1: Schema][1]
  * [Part 2: OAuth][2]
  * [Part 3: Conversations][3]



In this post we’ll code the endpoints to create a message and list them, also an endpoint to update the last time the participant read messages. Start by adding these routes in the `main()` function.

```
router.HandleFunc("POST", "/api/conversations/:conversationID/messages", requireJSON(guard(createMessage)))
router.HandleFunc("GET", "/api/conversations/:conversationID/messages", guard(getMessages))
router.HandleFunc("POST", "/api/conversations/:conversationID/read_messages", guard(readMessages))
```

Messages goes into conversations so the endpoint includes the conversation ID.

### Create Message

This endpoint handles POST requests to `/api/conversations/{conversationID}/messages` with a JSON body with just the message content and return the newly created message. It has two side affects: it updates the conversation `last_message_id` and updates the participant `messages_read_at`.

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

First, it decodes the request body into an struct with the message content. Then, it validates the content is not empty and has less than 480 characters.

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

This is the function to remove spaces. It iterates over each line, remove more than two consecutives spaces and returns with the non empty lines.

After the validation, it starts an SQL transaction. First, it queries for the participant existance in the conversation.

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

I extracted it into a function because it’s reused later.

If the user isn’t participant of the conversation, we return with a `404 Not Found` error.

Then, it inserts the message and updates the conversation `last_message_id`. Since this point, `last_message_id` cannot by `NULL` because we don’t allow removing messages.

Then it commits the transaction and we update the participant `messages_read_at` in a goroutine.

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

Before responding with the new message, we must notify about it. This is for the realtime part we’ll code in the next post so I left a comment there.

### Get Messages

This endpoint handles GET requests to `/api/conversations/{conversationID}/messages`. It responds with a JSON array with all the messages in the conversation. It also has the same side affect of updating the participant `messages_read_at`.

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

First, it begins an SQL transaction in readonly mode. Checks for the participant existance and queries all the messages. In each message, we use the current authenticated user ID to know whether the user owns the message (`mine`). Then it commits the transaction, updates the participant `messages_read_at` in a goroutine and respond with the messages.

### Read Messages

This endpoint handles POST requests to `/api/conversations/{conversationID}/read_messages`. Without any request or response body. In the frontend we’ll make this request each time a new message arrive in the realtime stream.

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

It uses the same function we’ve been using to update the participant `messages_read_at`.

* * *

That concludes it. Realtime messages is the only part left in the backend. Wait for it in the next post.

[Souce Code][4]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-messages/

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
[4]: https://github.com/nicolasparada/go-messenger-demo
