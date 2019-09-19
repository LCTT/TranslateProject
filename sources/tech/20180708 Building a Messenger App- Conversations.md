[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: Conversations)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-conversations/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: Conversations
======

This post is the 3rd in a series:

  * [Part 1: Schema][1]
  * [Part 2: OAuth][2]



In our messenger app, messages are stacked by conversations between two participants. You start a conversation providing the user you want to chat with, the conversations is created (if not exists already) and you can start sending messages to that conversations.

On the front-end we’re interested in showing a list of the lastest conversations. There we’ll show the last message of it and the name and avatar of the other participant.

In this post, we’ll code the endpoints to start a conversation, list the latest and find a single one.

Inside the `main()` function add this routes.

```
router.HandleFunc("POST", "/api/conversations", requireJSON(guard(createConversation)))
router.HandleFunc("GET", "/api/conversations", guard(getConversations))
router.HandleFunc("GET", "/api/conversations/:conversationID", guard(getConversation))
```

These three endpoints require authentication so we use the `guard()` middleware. There is a new middleware that checks for the request content type JSON.

### Require JSON Middleware

```
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

If the request isn’t JSON, it responds with a `415 Unsupported Media Type` error.

### Create Conversation

```
type Conversation struct {
    ID                string   `json:"id"`
    OtherParticipant  *User    `json:"otherParticipant"`
    LastMessage       *Message `json:"lastMessage"`
    HasUnreadMessages bool     `json:"hasUnreadMessages"`
}
```

So, a conversation holds a reference to the other participant and the last message. Also has a bool field to tell if it has unread messages.

```
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

Messages are for the next post, but I define the struct now since we are using it. Most of the fields are the same as the database table. We have `Mine` to tell if the message is owned by the current authenticated user and `ReceiverID` will be used to filter messanges once we add realtime capabilities.

Lets write the HTTP handler then. It’s quite long but don’t be scared.

```
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

For this endpoint you do a POST request to `/api/conversations` with a JSON body containing the username of the user you want to chat with.

So first it decodes the request body into an struct with the username. Then it validates that the username is not empty.

```
type Errors struct {
    Errors map[string]string `json:"errors"`
}
```

This is the `Errors` struct. It’s just a map. If you enter an empty username you get this JSON with a `422 Unprocessable Entity` error.

```
{
    "errors": {
        "username": "Username required"
    }
}
```

Then, we begin an SQL transaction. We only received an username, but we need the actual user ID. So the first part of the transaction is to query for the id and avatar of that user (the other participant). If the user is not found, we respond with a `404 Not Found` error. Also, if the user happens to be the same as the current authenticated user, we respond with `403 Forbidden`. There should be two different users, not the same.

Then, we try to find a conversation those two users have in common. We use `INTERSECT` for that. If there is one, we redirect to that conversation `/api/conversations/{conversationID}` and return there.

If no common conversation was found, we continue by creating a new one and adding the two participants. Finally, we `COMMIT` the transaction and respond with the newly created conversation.

### Get Conversations

This endpoint `/api/conversations` is to get all the conversations of the current authenticated user.

```
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

This handler just does a query to the database. It queries to the conversations table with some joins… First, to the messages table to get the last message. Then to the participants, but it adds a condition to a participant whose ID is not the one of the current authenticated user; this is the other participant. Then it joins to the users table to get his username and avatar. And finally joins with the participants again but with the contrary condition, so this participant is the current authenticated user. We compare `messages_read_at` with the message `created_at` to know whether the conversation has unread messages. And we use the message `user_id` to check if it’s “mine” or not.

Note that this query assumes that a conversation has just two users. It only works for that scenario. Also, if you want to show a count of the unread messages, this design isn’t good. I think you could add a `unread_messages_count` `INT` field on the `participants` table and increment it each time a new message is created and reset it when the user read them.

Then it iterates over the rows, scan each one to make an slice of conversations and respond with those at the end.

### Get Conversation

This endpoint `/api/conversations/{conversationID}` respond with a single conversation by its ID.

```
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

The query is quite similar. We’re not interested in showing the last message, so we omit those fields, but we need the message to know whether the conversation has unread messages. This time we do a `LEFT JOIN` instead of an `INNER JOIN` because the `last_message_id` is `NULLABLE`; in other case we won’t get any rows. We use an `IFNULL` in the `has_unread_messages` comparison for that reason too. Lastly, we filter by ID.

If the query returns no rows, we respond with a `404 Not Found` error, otherwise `200 OK` with the found conversation.

* * *

Yeah, that concludes with the conversation endpoints.

Wait for the next post to create and list messages 👋

[Souce Code][3]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-conversations/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://nicolasparada.netlify.com/posts/go-messenger-schema/
[2]: https://nicolasparada.netlify.com/posts/go-messenger-oauth/
[3]: https://github.com/nicolasparada/go-messenger-demo
