[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12722-1.html)
[#]: subject: (Building a Messenger App: Home Page)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-home-page/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（八）：Home 页面
======

![](https://img.linux.net.cn/data/attachment/album/202010/15/213116evlwzdwwv66kmldj.jpg)

本文是该系列的第八篇。

  * [第一篇: 模式][1]
  * [第二篇: OAuth][2]
  * [第三篇: 对话][3]
  * [第四篇: 消息][4]
  * [第五篇: 实时消息][5]
  * [第六篇: 仅用于开发的登录][6]
  * [第七篇: Access 页面][7]

继续前端部分，让我们在本文中完成 `home` 页面的开发。 我们将添加一个开始对话的表单和一个包含最新对话的列表。

### 对话表单

![conversation form screenshot][8]

转到 `static/ages/home-page.js` 文件，在 HTML 视图中添加一些标记。

```html
<form id="conversation-form">
    <input type="search" placeholder="Start conversation with..." required>
</form>
```

将该表单添加到我们显示 “auth user” 和 “logout” 按钮部分的下方。

```js
page.getElementById('conversation-form').onsubmit = onConversationSubmit
```

现在我们可以监听 “submit” 事件来创建对话了。

```js
import http from '../http.js'
import { navigate } from '../router.js'

async function onConversationSubmit(ev) {
    ev.preventDefault()

    const form = ev.currentTarget
    const input = form.querySelector('input')

    input.disabled = true

    try {
        const conversation = await createConversation(input.value)
        input.value = ''
        navigate('/conversations/' + conversation.id)
    } catch (err) {
        if (err.statusCode === 422) {
            input.setCustomValidity(err.body.errors.username)
        } else {
            alert(err.message)
        }
        setTimeout(() => {
            input.focus()
        }, 0)
    } finally {
        input.disabled = false
    }
}

function createConversation(username) {
    return http.post('/api/conversations', { username })
}
```

在提交时，我们使用用户名对 `/api/conversations` 进行 POST 请求，并重定向到 `conversation` 页面（用于下一篇文章）。

### 对话列表

![conversation list screenshot][9]

还是在这个文件中，我们将创建 `homePage()` 函数用来先异步加载对话。

```js
export default async function homePage() {
    const conversations = await getConversations().catch(err => {
        console.error(err)
        return []
    })
    /*...*/
}

function getConversations() {
    return http.get('/api/conversations')
}
```

然后，在标记中添加一个列表来渲染对话。

```html
<ol id="conversations"></ol>
```

将其添加到当前标记的正下方。

```js
const conversationsOList = page.getElementById('conversations')
for (const conversation of conversations) {
    conversationsOList.appendChild(renderConversation(conversation))
}
```

因此，我们可以将每个对话添加到这个列表中。

```js
import { avatar, escapeHTML } from '../shared.js'

function renderConversation(conversation) {
    const messageContent = escapeHTML(conversation.lastMessage.content)
    const messageDate = new Date(conversation.lastMessage.createdAt).toLocaleString()

    const li = document.createElement('li')
    li.dataset['id'] = conversation.id
    if (conversation.hasUnreadMessages) {
        li.classList.add('has-unread-messages')
    }
    li.innerHTML = `
        <a href="/conversations/${conversation.id}">
            <div>
                ${avatar(conversation.otherParticipant)}
                <span>${conversation.otherParticipant.username}</span>
            </div>
            <div>
                <p>${messageContent}</p>
                <time>${messageDate}</time>
            </div>
        </a>
    `
    return li
}
```

每个对话条目都包含一个指向对话页面的链接，并显示其他参与者信息和最后一条消息的预览。另外，您可以使用 `.hasUnreadMessages` 向该条目添加一个类，并使用 CSS 进行一些样式设置。也许是粗体字体或强调颜色。

请注意，我们需要转义信息的内容。该函数来自于 `static/shared.js` 文件：

```js
export function escapeHTML(str) {
    return str
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;')
}
```

这会阻止将用户编写的消息显示为 HTML。如果用户碰巧编写了类似以下内容的代码：

```js
<script>alert('lololo')</script>
```

这将非常烦人，因为该脚本将被执行😅。所以，永远记住要转义来自不可信来源的内容。

### 消息订阅

最后但并非最不重要的一点，我想在这里订阅消息流。

```js
const unsubscribe = subscribeToMessages(onMessageArrive)
page.addEventListener('disconnect', unsubscribe)
```

在 `homePage()` 函数中添加这一行。

```js
function subscribeToMessages(cb) {
    return http.subscribe('/api/messages', cb)
}
```

函数 `subscribe()` 返回一个函数，该函数一旦调用就会关闭底层连接。这就是为什么我把它传递给 <ruby>“断开连接”<rt>disconnect</rt></ruby>事件的原因；因此，当用户离开页面时，事件流将被关闭。

```js
async function onMessageArrive(message) {
    const conversationLI = document.querySelector(`li[data-id="${message.conversationID}"]`)
    if (conversationLI !== null) {
        conversationLI.classList.add('has-unread-messages')
        conversationLI.querySelector('a > div > p').textContent = message.content
        conversationLI.querySelector('a > div > time').textContent = new Date(message.createdAt).toLocaleString()
        return
    }

    let conversation
    try {
        conversation = await getConversation(message.conversationID)
        conversation.lastMessage = message
    } catch (err) {
        console.error(err)
        return
    }

    const conversationsOList = document.getElementById('conversations')
    if (conversationsOList === null) {
        return
    }

    conversationsOList.insertAdjacentElement('afterbegin', renderConversation(conversation))
}

function getConversation(id) {
    return http.get('/api/conversations/' + id)
}
```

每次有新消息到达时，我们都会在 DOM 中查询会话条目。如果找到，我们会将 `has-unread-messages` 类添加到该条目中，并更新视图。如果未找到，则表示该消息来自刚刚创建的新对话。我们去做一个对 `/api/conversations/{conversationID}` 的 GET 请求，以获取在其中创建消息的对话，并将其放在对话列表的前面。

* * *

以上这些涵盖了主页的所有内容 😊。
在下一篇文章中，我们将对 conversation 页面进行编码。

- [源代码][10]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-home-page/

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
[8]: https://nicolasparada.netlify.com/img/go-messenger-home-page/conversation-form.png
[9]: https://nicolasparada.netlify.com/img/go-messenger-home-page/conversation-list.png
[10]: https://github.com/nicolasparada/go-messenger-demo
