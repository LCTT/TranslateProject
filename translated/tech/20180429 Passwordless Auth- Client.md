无密码验证：客户端
======

我们继续 [无密码验证][1] 的文章。上一篇文章中，我们用 Go 写了一个 HTTP 服务，用这个服务来做无密码验证 API。今天，我们为它再写一个 JavaScript 客户端。

我们将使用 [这里的][2] 这个单页面应用程序（SPA）来展示使用的技术。如果你还没有读过它，请先读它。

记住流程：

- 用户输入其 email。
- 用户收到一个带有魔法链接的邮件。
- 用户点击该链接、
- 用户验证成功。

对于根 URL（`/`），我们将根据验证的状态分别使用两个不同的页面：一个是带有访问表单的页面，或者是已验证通过的用户的欢迎页面。另一个页面是验证回调的重定向页面。

### 伺服

我们将使用相同的 Go 服务器来为客户端提供服务，因此，在我们前面的  `main.go` 中添加一些路由：

```
router.Handle("GET", "/...", http.FileServer(SPAFileSystem{http.Dir("static")}))
```

```
type SPAFileSystem struct {
	fs http.FileSystem
}

func (spa SPAFileSystem) Open(name string) (http.File, error) {
	f, err := spa.fs.Open(name)
	if err != nil {
		return spa.fs.Open("index.html")
	}
	return f, nil
}
```

这个伺服文件放在 `static` 下，配合 `static/index.html` 作为回调。

你可以使用你自己的服务器，但是你得在服务器上启用 [CORS][3]。

### HTML

我们来看一下那个 `static/index.html` 文件。

```
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Passwordless Demo</title>
 <link rel="shortcut icon" href="data:,">
 <script src="/js/main.js" type="module"></script>
</head>
<body></body>
</html>
```

单页面应用程序的所有渲染由 JavaScript 来完成，因此，我们使用了一个空的 body 部分和一个 `main.js` 文件。

我们将使用 [上篇文章][2] 中的 Router。

### 渲染

现在，我们使用下面的内容来创建一个 `static/js/main.js` 文件：

```
import Router from 'https://unpkg.com/@nicolasparada/router'
import { isAuthenticated } from './auth.js'

const router = new Router()

router.handle('/', guard(view('home')))
router.handle('/callback', view('callback'))
router.handle(/^\//, view('not-found'))

router.install(async resultPromise => {
    document.body.innerHTML = ''
    document.body.appendChild(await resultPromise)
})

function view(name) {
    return (...args) => import(`/js/pages/${name}-page.js`)
        .then(m => m.default(...args))
}

function guard(fn1, fn2 = view('welcome')) {
    return (...args) => isAuthenticated()
        ? fn1(...args)
        : fn2(...args)
}
```

与上篇文章不同的是，我们实现了一个 `isAuthenticated()` 函数和一个 `guard()` 函数，使用它去渲染两种验证状态的页面。因此，当用户访问 `/` 时，它将根据用户是否通过了验证来展示主页或者是欢迎页面。

### 验证

现在，我们来编写 `isAuthenticated()` 函数。使用下面的内容来创建一个 `static/js/auth.js` 文件：

```
export function getAuthUser() {
    const authUserItem = localStorage.getItem('auth_user')
    const expiresAtItem = localStorage.getItem('expires_at')

    if (authUserItem !== null && expiresAtItem !== null) {
        const expiresAt = new Date(expiresAtItem)

        if (!isNaN(expiresAt.valueOf()) && expiresAt > new Date()) {
            try {
                return JSON.parse(authUserItem)
            } catch (_) { }
        }
    }

    return null
}

export function isAuthenticated() {
    return localStorage.getItem('jwt') !== null && getAuthUser() !== null
}
```

当有人登入时，我们将保存 JSON 格式的 web 令牌、它的过期日期，以及在 `localStorage` 上的当前已验证用户。这个模块就是这个用处。

  * `getAuthUser()` 用于从 `localStorage` 获取已认证的用户，以确认 JSON 格式的 Web 令牌没有过期。
  * `isAuthenticated()` 在前面的函数中用于去检查它是否没有返回 `null`。

### 获取

在继续这个页面之前，我将写一些与服务器 API 一起使用的 HTTP 工具。

我们使用以下的内容去创建一个 `static/js/http.js` 文件：

```
import { isAuthenticated } from './auth.js'

function get(url, headers) {
    return fetch(url, {
        headers: Object.assign(getAuthHeader(), headers),
    }).then(handleResponse)
}

function post(url, body, headers) {
    return fetch(url, {
        method: 'POST',
        headers: Object.assign(getAuthHeader(), { 'content-type': 'application/json' }, headers),
        body: JSON.stringify(body),
    }).then(handleResponse)
}

function getAuthHeader() {
    return isAuthenticated()
        ? { authorization: `Bearer ${localStorage.getItem('jwt')}` }
        : {}
}

export async function handleResponse(res) {
    const body = await res.clone().json().catch(() => res.text())
    const response = {
        statusCode: res.status,
        statusText: res.statusText,
        headers: res.headers,
        body,
    }
    if (!res.ok) {
        const message = typeof body === 'object' && body !== null && 'message' in body
            ? body.message
            : typeof body === 'string' && body !== ''
                ? body
                : res.statusText
        const err = new Error(message)
        throw Object.assign(err, response)
    }
    return response
}

export default {
    get,
    post,
}
```

这个模块导出了 `get()` 和 `post()` 函数。它们是 `fetch` API 的封装。当用户是已验证的，这二个函数注入一个 `Authorization: Bearer <token_here>` 头到请求中；这样服务器就能对我们进行身份验证。

### 欢迎页

我们现在来到欢迎页面。用如下的内容创建一个 `static/js/pages/welcome-page.js` 文件：

```
const template = document.createElement('template')
template.innerHTML = `
    <h1>Passwordless Demo</h1>
    <h2>Access</h2>
    <form id="access-form">
        <input type="email" placeholder="Email" autofocus required>
        <button type="submit">Send Magic Link</button>
    </form>
`

export default function welcomePage() {
    const page = template.content.cloneNode(true)

    page.getElementById('access-form')
        .addEventListener('submit', onAccessFormSubmit)

    return page
}
```

这个页面使用一个 `HTMLTemplateElement` 作为视图。这只是一个输入用户 email 的简单表单。

为了避免干扰，我将跳过错误处理部分，只是将它们输出到控制台上。

现在，我们来写 `onAccessFormSubmit()` 函数。

```
import http from '../http.js'

function onAccessFormSubmit(ev) {
    ev.preventDefault()

    const form = ev.currentTarget
    const input = form.querySelector('input')
    const email = input.value

    sendMagicLink(email).catch(err => {
        console.error(err)
        if (err.statusCode === 404 && wantToCreateAccount()) {
            runCreateUserProgram(email)
        }
    })
}

function sendMagicLink(email) {
    return http.post('/api/passwordless/start', {
        email,
        redirectUri: location.origin + '/callback',
    }).then(() => {
        alert('Magic link sent. Go check your email inbox.')
    })
}

function wantToCreateAccount() {
    return prompt('No user found. Do you want to create an account?')
}
```

它对 `/api/passwordless/start` 发起了 POST 请求，请求体中包含 `email` 和 `redirectUri`。在本例中它返回 `404 Not Found` 状态码时，我们将创建一个用户。

```
function runCreateUserProgram(email) {
    const username = prompt("Enter username")
    if (username === null) return

    http.post('/api/users', { email, username })
        .then(res => res.body)
        .then(user => sendMagicLink(user.email))
        .catch(console.error)
}
```

这个用户创建程序，首先询问用户名，然后使用 email 和用户名做一个 `POST` 请求到 `/api/users`。成功之后，给创建的用户发送一个魔法链接。

### 回调页

这是访问表单的全部功能，现在我们来做回调页面。使用如下的内容来创建一个 `static/js/pages/callback-page.js` 文件：

```
import http from '../http.js'

const template = document.createElement('template')
template.innerHTML = `
    <h1>Authenticating you</h1>
`

export default function callbackPage() {
    const page = template.content.cloneNode(true)

    const hash = location.hash.substr(1)
    const fragment = new URLSearchParams(hash)
    for (const [k, v] of fragment.entries()) {
        fragment.set(decodeURIComponent(k), decodeURIComponent(v))
    }
    const jwt = fragment.get('jwt')
    const expiresAt = fragment.get('expires_at')

    http.get('/api/auth_user', { authorization: `Bearer ${jwt}` })
        .then(res => res.body)
        .then(authUser => {
            localStorage.setItem('jwt', jwt)
            localStorage.setItem('auth_user', JSON.stringify(authUser))
            localStorage.setItem('expires_at', expiresAt)

            location.replace('/')
        })
        .catch(console.error)

    return page
}
```

请记住……当点击魔法链接时，我们会来到 `/api/passwordless/verify_redirect`，它将把我们重定向到重定向 URI，我们将放在哈希中的 JWT 和过期日期传递给 `/callback`。

回调页面解码 URL 中的哈希，提取这些参数去做一个 `GET` 请求到 `/api/auth_user`，用 JWT 保存所有数据到 `localStorage` 中。最后，重定向到主页面。

### 主页

创建如下内容的 `static/pages/home-page.js` 文件：

```
import { getAuthUser } from '../auth.js'

export default function homePage() {
    const authUser = getAuthUser()

    const template = document.createElement('template')
    template.innerHTML = `
        <h1>Passwordless Demo</h1>
        <p>Welcome back, ${authUser.username} 👋</p>
        <button id="logout-button">Logout</button>
    `

    const page = template.content

    page.getElementById('logout-button')
        .addEventListener('click', logout)

    return page
}

function logout() {
    localStorage.clear()
    location.reload()
}
```

这个页面用于欢迎已验证用户，同时也有一个登出按钮。`logout()` 函数的功能只是清理掉 `localStorage` 并重载这个页面。

这就是全部内容了。我猜你在此之前已经看过这个 [demo][4] 了。当然，这些源代码也在同一个 [仓库][5] 中。

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/passwordless-auth-client/

作者：[Nicolás Parada][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://nicolasparada.netlify.com/
[1]:https://linux.cn/article-9748-1.html
[2]:https://linux.cn/article-9815-1.html
[3]:https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
[4]:https://go-passwordless-demo.herokuapp.com/
[5]:https://github.com/nicolasparada/go-passwordless-demo
