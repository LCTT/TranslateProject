[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: Access Page)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-access-page/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: Access Page
======

This post is the 7th on a series:

  * [Part 1: Schema][1]
  * [Part 2: OAuth][2]
  * [Part 3: Conversations][3]
  * [Part 4: Messages][4]
  * [Part 5: Realtime Messages][5]
  * [Part 6: Development Login][6]



Now that we’re done with the backend, lets move to the frontend. I will go with a single-page application.

Lets start by creating a file `static/index.html` with the following content.

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messenger</title>
    <link rel="shortcut icon" href="data:,">
    <link rel="stylesheet" href="/styles.css">
    <script src="/main.js" type="module"></script>
</head>
<body></body>
</html>
```

This HTML file must be server for every URL and JavaScript will take care of rendering the correct page.

So lets go the the `main.go` for a moment and in the `main()` function add the following route:

```
router.Handle("GET", "/...", http.FileServer(SPAFileSystem{http.Dir("static")}))

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

We use a custom file system so instead of returning `404 Not Found` for unknown URLs, it serves the `index.html`.

### Router

In the `index.html` we loaded two files: `styles.css` and `main.js`. I leave styling to your taste.

Lets move to `main.js`. Create a `static/main.js` file with the following content:

```
import { guard } from './auth.js'
import Router from './router.js'

let currentPage
const disconnect = new CustomEvent('disconnect')
const router = new Router()

router.handle('/', guard(view('home'), view('access')))
router.handle('/callback', view('callback'))
router.handle(/^\/conversations\/([^\/]+)$/, guard(view('conversation'), view('access')))
router.handle(/^\//, view('not-found'))

router.install(async result => {
    document.body.innerHTML = ''
    if (currentPage instanceof Node) {
        currentPage.dispatchEvent(disconnect)
    }
    currentPage = await result
    if (currentPage instanceof Node) {
        document.body.appendChild(currentPage)
    }
})

function view(pageName) {
    return (...args) => import(`/pages/${pageName}-page.js`)
        .then(m => m.default(...args))
}
```

If you are follower of this blog, you already know how this works. That router is the one showed [here][7]. Just download it from [@nicolasparada/router][8] and save it to `static/router.js`.

We registered four routes. At the root `/` we show the home or access page whether the user is authenticated. At `/callback` we show the callback page. On `/conversations/{conversationID}` we show the conversation or access page whether the user is authenticated and for every other URL, we show a not found page.

We tell the router to render the result to the document body and dispatch a `disconnect` event to each page before leaving.

We have each page in a different file and we import them with the new dynamic `import()`.

### Auth

`guard()` is a function that given two functions, executes the first one if the user is authenticated, or the sencond one if not. It comes from `auth.js` so lets create a `static/auth.js` file with the following content:

```
export function isAuthenticated() {
    const token = localStorage.getItem('token')
    const expiresAtItem = localStorage.getItem('expires_at')
    if (token === null || expiresAtItem === null) {
        return false
    }

    const expiresAt = new Date(expiresAtItem)
    if (isNaN(expiresAt.valueOf()) || expiresAt <= new Date()) {
        return false
    }

    return true
}

export function guard(fn1, fn2) {
    return (...args) => isAuthenticated()
        ? fn1(...args)
        : fn2(...args)
}

export function getAuthUser() {
    if (!isAuthenticated()) {
        return null
    }

    const authUser = localStorage.getItem('auth_user')
    if (authUser === null) {
        return null
    }

    try {
        return JSON.parse(authUser)
    } catch (_) {
        return null
    }
}
```

`isAuthenticated()` checks for `token` and `expires_at` from localStorage to tell if the user is authenticated. `getAuthUser()` gets the authenticated user from localStorage.

When we login, we’ll save all the data to localStorage so it will make sense.

### Access Page

![access page screenshot][9]

Lets start with the access page. Create a file `static/pages/access-page.js` with the following content:

```
const template = document.createElement('template')
template.innerHTML = `
    <h1>Messenger</h1>
    <a href="/api/oauth/github" onclick="event.stopPropagation()">Access with GitHub</a>
`

export default function accessPage() {
    return template.content
}
```

Because the router intercepts all the link clicks to do its navigation, we must prevent the event propagation for this link in particular.

Clicking on that link will redirect us to the backend, then to GitHub, then to the backend and then to the frontend again; to the callback page.

### Callback Page

Create the file `static/pages/callback-page.js` with the following content:

```
import http from '../http.js'
import { navigate } from '../router.js'

export default async function callbackPage() {
    const url = new URL(location.toString())
    const token = url.searchParams.get('token')
    const expiresAt = url.searchParams.get('expires_at')

    try {
        if (token === null || expiresAt === null) {
            throw new Error('Invalid URL')
        }

        const authUser = await getAuthUser(token)

        localStorage.setItem('auth_user', JSON.stringify(authUser))
        localStorage.setItem('token', token)
        localStorage.setItem('expires_at', expiresAt)
    } catch (err) {
        alert(err.message)
    } finally {
        navigate('/', true)
    }
}

function getAuthUser(token) {
    return http.get('/api/auth_user', { authorization: `Bearer ${token}` })
}
```

The callback page doesn’t render anything. It’s an async function that does a GET request to `/api/auth_user` using the token from the URL query string and saves all the data to localStorage. Then it redirects to `/`.

### HTTP

There is an HTTP module. Create a `static/http.js` file with the following content:

```
import { isAuthenticated } from './auth.js'

async function handleResponse(res) {
    const body = await res.clone().json().catch(() => res.text())

    if (res.status === 401) {
        localStorage.removeItem('auth_user')
        localStorage.removeItem('token')
        localStorage.removeItem('expires_at')
    }

    if (!res.ok) {
        const message = typeof body === 'object' && body !== null && 'message' in body
            ? body.message
            : typeof body === 'string' && body !== ''
                ? body
                : res.statusText
        throw Object.assign(new Error(message), {
            url: res.url,
            statusCode: res.status,
            statusText: res.statusText,
            headers: res.headers,
            body,
        })
    }

    return body
}

function getAuthHeader() {
    return isAuthenticated()
        ? { authorization: `Bearer ${localStorage.getItem('token')}` }
        : {}
}

export default {
    get(url, headers) {
        return fetch(url, {
            headers: Object.assign(getAuthHeader(), headers),
        }).then(handleResponse)
    },

    post(url, body, headers) {
        const init = {
            method: 'POST',
            headers: getAuthHeader(),
        }
        if (typeof body === 'object' && body !== null) {
            init.body = JSON.stringify(body)
            init.headers['content-type'] = 'application/json; charset=utf-8'
        }
        Object.assign(init.headers, headers)
        return fetch(url, init).then(handleResponse)
    },

    subscribe(url, callback) {
        const urlWithToken = new URL(url, location.origin)
        if (isAuthenticated()) {
            urlWithToken.searchParams.set('token', localStorage.getItem('token'))
        }
        const eventSource = new EventSource(urlWithToken.toString())
        eventSource.onmessage = ev => {
            let data
            try {
                data = JSON.parse(ev.data)
            } catch (err) {
                console.error('could not parse message data as JSON:', err)
                return
            }
            callback(data)
        }
        const unsubscribe = () => {
            eventSource.close()
        }
        return unsubscribe
    },
}
```

This module is a wrapper around the [fetch][10] and [EventSource][11] APIs. The most important part is that it adds the JSON web token to the requests.

### Home Page

![home page screenshot][12]

So, when the user login, the home page will be shown. Create a `static/pages/home-page.js` file with the following content:

```
import { getAuthUser } from '../auth.js'
import { avatar } from '../shared.js'

export default function homePage() {
    const authUser = getAuthUser()
    const template = document.createElement('template')
    template.innerHTML = `
        <div>
            <div>
                ${avatar(authUser)}
                <span>${authUser.username}</span>
            </div>
            <button id="logout-button">Logout</button>
        </div>
        <!-- conversation form here -->
        <!-- conversation list here -->
    `
    const page = template.content
    page.getElementById('logout-button').onclick = onLogoutClick
    return page
}

function onLogoutClick() {
    localStorage.clear()
    location.reload()
}
```

For this post, this is the only content we render on the home page. We show the current authenticated user and a logout button.

When the user clicks to logout, we clear all inside localStorage and do a reload of the page.

### Avatar

That `avatar()` function is to show the user’s avatar. Because it’s used in more than one place, I moved it to a `shared.js` file. Create the file `static/shared.js` with the following content:

```
export function avatar(user) {
    return user.avatarUrl === null
        ? `<figure class="avatar" data-initial="${user.username[0]}"></figure>`
        : `<img class="avatar" src="${user.avatarUrl}" alt="${user.username}'s avatar">`
}
```

We use a small figure with the user’s initial in case the avatar URL is null.

You can show the initial with a little of CSS using the `attr()` function.

```
.avatar[data-initial]::after {
    content: attr(data-initial);
}
```

### Development Login

![access page with login form screenshot][13]

In the previous post we coded a login for development. Lets add a form for that in the access page. Go to `static/pages/access-page.js` and modify it a little.

```
import http from '../http.js'

const template = document.createElement('template')
template.innerHTML = `
    <h1>Messenger</h1>
    <form id="login-form">
        <input type="text" placeholder="Username" required>
        <button>Login</button>
    </form>
    <a href="/api/oauth/github" onclick="event.stopPropagation()">Access with GitHub</a>
`

export default function accessPage() {
    const page = template.content.cloneNode(true)
    page.getElementById('login-form').onsubmit = onLoginSubmit
    return page
}

async function onLoginSubmit(ev) {
    ev.preventDefault()

    const form = ev.currentTarget
    const input = form.querySelector('input')
    const submitButton = form.querySelector('button')

    input.disabled = true
    submitButton.disabled = true

    try {
        const payload = await login(input.value)
        input.value = ''

        localStorage.setItem('auth_user', JSON.stringify(payload.authUser))
        localStorage.setItem('token', payload.token)
        localStorage.setItem('expires_at', payload.expiresAt)

        location.reload()
    } catch (err) {
        alert(err.message)
        setTimeout(() => {
            input.focus()
        }, 0)
    } finally {
        input.disabled = false
        submitButton.disabled = false
    }
}

function login(username) {
    return http.post('/api/login', { username })
}
```

I added a login form. When the user submits the form. It does a POST requets to `/api/login` with the username. Saves all the data to localStorage and reloads the page.

Remember to remove this form once you are done with the frontend.

* * *

That’s all for this post. In the next one, we’ll continue with the home page to add a form to start conversations and display a list with the latest ones.

[Souce Code][14]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-access-page/

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
[7]: https://nicolasparada.netlify.com/posts/js-router/
[8]: https://unpkg.com/@nicolasparada/router
[9]: https://nicolasparada.netlify.com/img/go-messenger-access-page/access-page.png
[10]: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
[11]: https://developer.mozilla.org/en-US/docs/Web/API/EventSource
[12]: https://nicolasparada.netlify.com/img/go-messenger-access-page/home-page.png
[13]: https://nicolasparada.netlify.com/img/go-messenger-access-page/access-page-v2.png
[14]: https://github.com/nicolasparada/go-messenger-demo
