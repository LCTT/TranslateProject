[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: Conversation Page)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-conversation-page/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: Conversation Page
======

This post is the 9th and last in a series:

  * [Part 1: Schema][1]
  * [Part 2: OAuth][2]
  * [Part 3: Conversations][3]
  * [Part 4: Messages][4]
  * [Part 5: Realtime Messages][5]
  * [Part 6: Development Login][6]
  * [Part 7: Access Page][7]
  * [Part 8: Home Page][8]



In this post we’ll code the conversation page. This page is the chat between the two users. At the top we’ll show info about the other participant, below, a list of the latest messages and a message form at the bottom.

### Chat heading

![chat heading screenshot][9]

Let’s start by creating the file `static/pages/conversation-page.js` with the following content:

```
import http from '../http.js'
import { navigate } from '../router.js'
import { avatar, escapeHTML } from '../shared.js'

export default async function conversationPage(conversationID) {
    let conversation
    try {
        conversation = await getConversation(conversationID)
    } catch (err) {
        alert(err.message)
        navigate('/', true)
        return
    }

    const template = document.createElement('template')
    template.innerHTML = `
        <div>
            <a href="/">← Back</a>
            ${avatar(conversation.otherParticipant)}
            <span>${conversation.otherParticipant.username}</span>
        </div>
        <!-- message list here -->
        <!-- message form here -->
    `
    const page = template.content
    return page
}

function getConversation(id) {
    return http.get('/api/conversations/' + id)
}
```

This page receives the conversation ID the router extracted from the URL.

First it does a GET request to `/api/conversations/{conversationID}` to get info about the conversation. In case of error, we show it and redirect back to `/`. Then we render info about the other participant.

### Conversation List

![chat heading screenshot][10]

We’ll fetch the latest messages too to display them.

```
let conversation, messages
try {
    [conversation, messages] = await Promise.all([
        getConversation(conversationID),
        getMessages(conversationID),
    ])
}
```

Update the `conversationPage()` function to fetch the messages too. We use `Promise.all()` to do both request at the same time.

```
function getMessages(conversationID) {
    return http.get(`/api/conversations/${conversationID}/messages`)
}
```

A GET request to `/api/conversations/{conversationID}/messages` gets the latest messages of the conversation.

```
<ol id="messages"></ol>
```

Now, add that list to the markup.

```
const messagesOList = page.getElementById('messages')
for (const message of messages.reverse()) {
    messagesOList.appendChild(renderMessage(message))
}
```

So we can append messages to the list. We show them in reverse order.

```
function renderMessage(message) {
    const messageContent = escapeHTML(message.content)
    const messageDate = new Date(message.createdAt).toLocaleString()

    const li = document.createElement('li')
    if (message.mine) {
        li.classList.add('owned')
    }
    li.innerHTML = `
        <p>${messageContent}</p>
        <time>${messageDate}</time>
    `
    return li
}
```

Each message item displays the message content itself with its timestamp. Using `.mine` we can append a different class to the item so maybe you can show the message to the right.

### Message Form

![chat heading screenshot][11]

```
<form id="message-form">
    <input type="text" placeholder="Type something" maxlength="480" required>
    <button>Send</button>
</form>
```

Add that form to the current markup.

```
page.getElementById('message-form').onsubmit = messageSubmitter(conversationID)
```

Attach an event listener to the “submit” event.

```
function messageSubmitter(conversationID) {
    return async ev => {
        ev.preventDefault()

        const form = ev.currentTarget
        const input = form.querySelector('input')
        const submitButton = form.querySelector('button')

        input.disabled = true
        submitButton.disabled = true

        try {
            const message = await createMessage(input.value, conversationID)
            input.value = ''
            const messagesOList = document.getElementById('messages')
            if (messagesOList === null) {
                return
            }

            messagesOList.appendChild(renderMessage(message))
        } catch (err) {
            if (err.statusCode === 422) {
                input.setCustomValidity(err.body.errors.content)
            } else {
                alert(err.message)
            }
        } finally {
            input.disabled = false
            submitButton.disabled = false

            setTimeout(() => {
                input.focus()
            }, 0)
        }
    }
}

function createMessage(content, conversationID) {
    return http.post(`/api/conversations/${conversationID}/messages`, { content })
}
```

We make use of [partial application][12] to have the conversation ID in the “submit” event handler. It takes the message content from the input and does a POST request to `/api/conversations/{conversationID}/messages` with it. Then prepends the newly created message to the list.

### Messages Subscription

To make it realtime we’ll subscribe to the message stream in this page also.

```
page.addEventListener('disconnect', subscribeToMessages(messageArriver(conversationID)))
```

Add that line in the `conversationPage()` function.

```
function subscribeToMessages(cb) {
    return http.subscribe('/api/messages', cb)
}

function messageArriver(conversationID) {
    return message => {
        if (message.conversationID !== conversationID) {
            return
        }

        const messagesOList = document.getElementById('messages')
        if (messagesOList === null) {
            return

        }
        messagesOList.appendChild(renderMessage(message))
        readMessages(message.conversationID)
    }
}

function readMessages(conversationID) {
    return http.post(`/api/conversations/${conversationID}/read_messages`)
}
```

We also make use of partial application to have the conversation ID here.
When a new message arrives, first we check if it’s from this conversation. If it is, we go a prepend a message item to the list and do a POST request to `/api/conversations/{conversationID}/read_messages` to updated the last time the participant read messages.

* * *

That concludes this series. The messenger app is now functional.

~~I’ll add pagination on the conversation and message list, also user searching before sharing the source code. I’ll updated once it’s ready along with a hosted demo 👨‍💻~~

[Souce Code][13] • [Demo][14]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-conversation-page/

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
[5]: https://nicolasparada.netlify.com/posts/go-messenger-realtime-messages/
[6]: https://nicolasparada.netlify.com/posts/go-messenger-dev-login/
[7]: https://nicolasparada.netlify.com/posts/go-messenger-access-page/
[8]: https://nicolasparada.netlify.com/posts/go-messenger-home-page/
[9]: https://nicolasparada.netlify.com/img/go-messenger-conversation-page/heading.png
[10]: https://nicolasparada.netlify.com/img/go-messenger-conversation-page/list.png
[11]: https://nicolasparada.netlify.com/img/go-messenger-conversation-page/form.png
[12]: https://en.wikipedia.org/wiki/Partial_application
[13]: https://github.com/nicolasparada/go-messenger-demo
[14]: https://go-messenger-demo.herokuapp.com/
