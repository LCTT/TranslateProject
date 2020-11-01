[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12723-1.html)
[#]: subject: (Building a Messenger App: Conversation Page)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-conversation-page/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（九）：Conversation 页面
======

![](https://img.linux.net.cn/data/attachment/album/202010/15/220239arr978u7t7oulv73.jpg)

本文是该系列的第九篇，也是最后一篇。

  * [第一篇: 模式][1]
  * [第二篇: OAuth][2]
  * [第三篇: 对话][3]
  * [第四篇: 消息][4]
  * [第五篇: 实时消息][5]
  * [第六篇: 仅用于开发的登录][6]
  * [第七篇: Access 页面][7]
  * [第八篇: Home 页面][8]

在这篇文章中，我们将对<ruby>对话<rt>conversation</rt></ruby>页面进行编码。此页面是两个用户之间的聊天室。在顶部我们将显示其他参与者的信息，下面接着的是最新消息列表，以及底部的消息表单。

### 聊天标题

![chat heading screenshot][9]

让我们从创建 `static/pages/conversation-page.js` 文件开始，它包含以下内容:

```js
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

此页面接收路由从 URL 中提取的会话 ID。

首先，它向 `/api/ conversations/{conversationID}` 发起一个 GET 请求，以获取有关对话的信息。 如果出现错误，我们会将其显示，并重定向回 `/`。然后我们呈现有关其他参与者的信息。

### 对话列表

![chat heading screenshot][10]

我们也会获取最新的消息并显示它们。

```js
let conversation, messages
try {
    [conversation, messages] = await Promise.all([
        getConversation(conversationID),
        getMessages(conversationID),
    ])
}
```

更新 `conversationPage()` 函数以获取消息。我们使用 `Promise.all()` 同时执行这两个请求。

```js
function getMessages(conversationID) {
    return http.get(`/api/conversations/${conversationID}/messages`)
}
```

发起对 `/api/conversations/{conversationID}/messages` 的 GET 请求可以获取对话中的最新消息。

```html
<ol id="messages"></ol>
```

现在，将该列表添加到标记中。

```js
const messagesOList = page.getElementById('messages')
for (const message of messages.reverse()) {
    messagesOList.appendChild(renderMessage(message))
}
```

这样我们就可以将消息附加到列表中了。我们以时间倒序来显示它们。

```js
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

每个消息条目显示消息内容本身及其时间戳。使用 `.mine`，我们可以将不同的 css 类附加到条目，这样您就可以将消息显示在右侧。

### 消息表单

![chat heading screenshot][11]

```html
<form id="message-form">
    <input type="text" placeholder="Type something" maxlength="480" required>
    <button>Send</button>
</form>
```

将该表单添加到当前标记中。

```js
page.getElementById('message-form').onsubmit = messageSubmitter(conversationID)
```

将事件监听器附加到 “submit” 事件。

```js
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


我们利用 [partial application][12] 在 “submit” 事件处理程序中获取对话 ID。它 从输入中获取消息内容，并用它对 `/api/conversations/{conversationID}/messages` 发出 POST 请求。 然后将新创建的消息添加到列表中。

### 消息订阅

为了实现实时，我们还将订阅此页面中的消息流。

```js
page.addEventListener('disconnect', subscribeToMessages(messageArriver(conversationID)))
```

将该行添加到 `conversationPage()` 函数中。

```js
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

在这里我们仍然使用这个应用的部分来获取会话 ID。
当新消息到达时，我们首先检查它是否来自此对话。如果是，我们会将消息条目预先添加到列表中，并向 `/api/conversations/{conversationID}/read_messages` 发起 POST 一个请求，以更新参与者上次阅读消息的时间。

* * *

本系列到此结束。 消息应用现在可以运行了。

- [源代码][13]
- [演示][14]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-conversation-page/

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
[5]: https://linux.cn/article-12685-1.html
[6]: https://linux.cn/article-12692-1.html
[7]: https://linux.cn/article-12704-1.html
[8]: https://linux.cn/article-12722-1.html
[9]: https://nicolasparada.netlify.com/img/go-messenger-conversation-page/heading.png
[10]: https://nicolasparada.netlify.com/img/go-messenger-conversation-page/list.png
[11]: https://nicolasparada.netlify.com/img/go-messenger-conversation-page/form.png
[12]: https://en.wikipedia.org/wiki/Partial_application
[13]: https://github.com/nicolasparada/go-messenger-demo
[14]: https://go-messenger-demo.herokuapp.com/
