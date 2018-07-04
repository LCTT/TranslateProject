Translating by qhwdw
JavaScript Router
======
There are a lot of frameworks/libraries to build single page applications, but I wanted something more minimal. I’ve come with a solution and I just wanted to share it 🙂
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

To use it you add handlers for a URL pattern. This pattern can be a simple string or a regular expression. Using a string will match exactly that, but a regular expression allows you to do fancy things like capture parts from the URL as seen with the user page or match any URL as seen with the not found page.

I’ll explain what does that `exec` method… As I said, the URL pattern can be a string or a regular expression, so it first checks for a string. In case the pattern is equal to the given pathname, it returns the execution of the handler. If it is a regular expression, we do a match with the given pathname. In case it matches, it returns the execution of the handler passing to it the captured parameters.

### Working Example

That example just logs to the console. Let’s try to integrate it to a page and see something.
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

This is the `index.html`. For single page applications, you must do special work on the server side because all unknown paths should return this `index.html`. For development, I’m using an npm tool called [serve][1]. This tool is to serve static content. With the flag `-s`/`--single` you can serve single page applications.

With [Node.js][2] and npm (comes with Node) installed, run:
```
npm i -g serve
serve -s

```

That HTML file loads the script `main.js` as a module. It has a simple `<header>` and a `<main>` element in which we’ll render the corresponding page.

Inside the `main.js` file:
```
const main = document.querySelector('main')
const result = router.exec(location.pathname)
main.innerHTML = result

```

We call `router.exec()` passing the current pathname and setting the result as HTML in the main element.

If you go to localhost and play with it you’ll see that it works, but not as you expect from a SPA. Single page applications shouldn’t refresh when you click on links.

We’ll have to attach event listeners to each anchor link click, prevent the default behavior and do the correct rendering. Because a single page application is something dynamic, you expect creating anchor links on the fly so to add the event listeners I’ll use a technique called [event delegation][3].

I’ll attach a click event listener to the whole document and check if that click was on an anchor link (or inside one).

In the `Router` class I’ll have a method that will register a callback that will run for every time we click on a link or a “popstate” event occurs. The popstate event is dispatched every time you use the browser back or forward buttons.

To the callback we’ll pass that same `router.exec(location.pathname)` for convenience.
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

For link clicks, besides calling the callback, we update the URL with `history.pushState()`.

We’ll move that previous render we did in the main element into the install callback.
```
router.install(result => {
 main.innerHTML = result
})

```

#### DOM

Those handlers you pass to the router doesn’t need to return a `string`. If you need more power you can return actual DOM. Ex:
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

And now in the install callback you can check if the result is a `string` or a `Node`.
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

That will cover the basic features. I wanted to share this because I’ll use this router in next blog posts.

I’ve published it as an [npm package][4].

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/js-router/

作者：[Nicolás Parada][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://nicolasparada.netlify.com/
[1]:https://npm.im/serve
[2]:https://nodejs.org/
[3]:https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events#Event_delegation
[4]:https://www.npmjs.com/package/@nicolasparada/router
