JavaScript 路由器
======
构建单页面应用有许多的框架/库，但是我希望它们能少一些。我有一个解决方案，我想共享给大家。🙂
```
class Router {
    constructor() {
        this.routes = []
    }

    handle(pattern, handler) {
        this.routes.push({ pattern, handler })
    }

    exec(pathname) {
        for (const route of this.routes) {
            if (typeof route.pattern === 'string') {
                if (route.pattern === pathname) {
                    return route.handler()
                }
            } else if (route.pattern instanceof RegExp) {
                const result = pathname.match(route.pattern)
                if (result !== null) {
                    const params = result.slice(1).map(decodeURIComponent)
                    return route.handler(...params)
                }
            }
        }
    }
}
const router = new Router()

router.handle('/', homePage)
router.handle(/^\/users\/([^\/]+)$/, userPage)
router.handle(/^\//, notFoundPage)

function homePage() {
    return 'home page'
}

function userPage(username) {
    return `${username}'s page`
}

function notFoundPage() {
    return 'not found page'
}

console.log(router.exec('/')) // home page
console.log(router.exec('/users/john')) // john's page
console.log(router.exec('/foo')) // not found page

```

使用它为一个 URL 模式添加处理程序。这个模式可能是一个简单的字符串或一个正则表达式。使用一个字符串将精确匹配它，但是如果使用一个正则表达式将允许你做一些更复杂的事情，比如，从用户页面上看到的 URL 中获取其中的一部分，或者匹配任何没有找到页面的 URL。

我将详细解释这个 `exec` 方法 … 正如我前面说的，URL 模式既有可能是一个字符串，也有可能是一个正则表达式，因此，我首先来检查它是否是一个字符串。如果模式与给定的路径名相同，它返回运行处理程序。如果是一个正则表达式，我们与给定的路径名进行匹配。如果匹配成功，它将获取的参数传递给处理程序，并返回运行这个处理程序。

### 工作示例

那个例子正好记录到了控制台。我们尝试将它整合到一个页面，看看它是什么样的。
```
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Router Demo</title>
 <link rel="shortcut icon" href="data:,">
 <script src="/main.js" type="module"></script>
</head>
<body>
 <header>
 <a href="/">Home</a>
 <a href="/users/john_doe">Profile</a>
 </header>
 <main></main>
</body>
</html>

```

这是 `index.html`。对于单页面应用程序来说，你必须在服务器侧做一个特别的工作，因为所有未知的路径都将返回这个 `index.html`。在开发时，我们使用了一个 npm 工具调用了 [serve][1]。这个工具去提供静态内容。使用标志 `-s`/`--single`，你可以提供单页面应用程序。

使用 [Node.js][2] 和安装的 npm（它与 Node 一起安装），运行：
```
npm i -g serve
serve -s

```

那个 HTML 文件将脚本 `main.js` 加载为一个模块。在我们渲染的相关页面中，它有一个简单的 `<header>` 和一个 `<main>` 元素。

在 `main.js` 文件中：
```
const main = document.querySelector('main')
const result = router.exec(location.pathname)
main.innerHTML = result

```

我们调用传递了当前路径名为参数的 `router.exec()`，然后将 `result` 设置为 main 中的 HTML 元素。

如果你去 `localhost` 并运行它，你将看到它能够正常工作，但不是预期中的来自一个单页面应用程序。当你点击链接时，单页面应用程序将不会被刷新。

我们将在每个点击的链接的锚点上附加事件监听器，防止出现缺省行为，并做出正确的渲染。因为一个单页面应用程序是一个动态的东西，你预期要创建的锚点链接是动态的，因此要添加事件监听器，我使用的是一个叫 [事件委托][3] 的方法。

我给整个文档附加一个点击事件监听器，然后去检查在锚点上（或内部）是否有点击事件。

在 `Router` 类中，我有一个注册回调的方法，在我们每次点击一个链接或者一个 “popstate” 事件发生时，这个方法将被运行。每次你使用浏览器的返回或者前进按钮时，`popstate` 事件将被发送。

为了方便其见，我们给回调传递与 `router.exec(location.pathname)` 相同的参数。
```class Router {
    // ...
    install(callback) {
        const execCallback = () => {
            callback(this.exec(location.pathname))
        }

        document.addEventListener('click', ev => {
            if (ev.defaultPrevented
                || ev.button !== 0
                || ev.ctrlKey
                || ev.shiftKey
                || ev.altKey
                || ev.metaKey) {
                return
            }

            const a = ev.target.closest('a')

            if (a === null
                || (a.target !== '' && a.target !== '_self')
                || a.hostname !== location.hostname) {
                return
            }

            ev.preventDefault()

            if (a.href !== location.href) {
                history.pushState(history.state, document.title, a.href)
                execCallback()
            }
        })

        addEventListener('popstate', execCallback)
        execCallback()
    }
}
```

对于链接的点击事件，除调用了回调之外，我们还使用 `history.pushState()` 去更新 URL。

我们将前面的 `main` 元素中的渲染移动到 `install` 回调中。
```
router.install(result => {
 main.innerHTML = result
})

```

#### DOM

你传递给路由器的这些处理程序并不需要返回一个 `string`。如果你需要更多的东西，你可以返回实际的 DOM。如：
```
const homeTmpl = document.createElement('template')
homeTmpl.innerHTML = `
 <div class="container">
 <h1>Home Page</h1>
 </div>
`

function homePage() {
 const page = homeTmpl.content.cloneNode(true)
 // You can do `page.querySelector()` here...
 return page
}

```

现在，在 `install` 回调中，你可以去检查 `result` 是一个 `string` 还是一个 `Node`。
```
router.install(result => {
    if (typeof result === 'string') {
        main.innerHTML = result
    } else if (result instanceof Node) {
        main.innerHTML = ''
        main.appendChild(result)
    }
})
```

这些就是基本的功能。我希望将它共享出来，因为我将在下篇文章中使用到这个路由器。

我已经以一个 [npm 包][4] 的形式将它发布了。

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/js-router/

作者：[Nicolás Parada][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://nicolasparada.netlify.com/
[1]:https://npm.im/serve
[2]:https://nodejs.org/
[3]:https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events#Event_delegation
[4]:https://www.npmjs.com/package/@nicolasparada/router
