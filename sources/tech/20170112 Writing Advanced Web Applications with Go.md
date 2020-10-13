[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Writing Advanced Web Applications with Go)
[#]: via: (https://www.jtolio.com/2017/01/writing-advanced-web-applications-with-go)
[#]: author: (jtolio.com https://www.jtolio.com/)

Writing Advanced Web Applications with Go
======

Web development in many programming environments often requires subscribing to some full framework ethos. With [Ruby][1], it’s usually [Rails][2] but could be [Sinatra][3] or something else. With [Python][4], it’s often [Django][5] or [Flask][6]. With [Go][7], it’s…

If you spend some time in Go communities like the [Go mailing list][8] or the [Go subreddit][9], you’ll find Go newcomers frequently wondering what web framework is best to use. [There][10] [are][11] [quite][12] [a][13] [few][14] [Go][15] [frameworks][16] ([and][17] [then][18] [some][19]), so which one is best seems like a reasonable question. Without fail, though, the strong recommendation of the Go community is to [avoid web frameworks entirely][20] and just stick with the standard library as long as possible. Here’s [an example from the Go mailing list][21] and here’s [one from the subreddit][22].

It’s not bad advice! The Go standard library is very rich and flexible, much more so than many other languages, and designing a web application in Go with just the standard library is definitely a good choice.

Even when these Go frameworks call themselves minimalistic, they can’t seem to help themselves avoid using a different request handler interface than the default standard library [http.Handler][23], and I think this is the biggest source of angst about why frameworks should be avoided. If everyone standardizes on [http.Handler][23], then dang, all sorts of things would be interoperable!

Before Go 1.7, it made some sense to give in and use a different interface for handling HTTP requests. But now that [http.Request][24] has the [Context][25] and [WithContext][26] methods, there truly isn’t a good reason any longer.

I’ve done a fair share of web development in Go and I’m here to share with you both some standard library development patterns I’ve learned and some code I’ve found myself frequently needing. The code I’m sharing is not for use instead of the standard library, but to augment it.

Overall, if this blog post feels like it’s predominantly plugging various little standalone libraries from my [Webhelp non-framework][27], that’s because it is. It’s okay, they’re little standalone libraries. Only use the ones you want!

If you’re new to Go web development, I suggest reading the Go documentation’s [Writing Web Applications][28] article first.

### Middleware

A frequent design pattern for server-side web development is the concept of _middleware_, where some portion of the request handler wraps some other portion of the request handler and does some preprocessing or routing or something. This is a big component of how [Express][29] is organized on [Node][30], and how Express middleware and [Negroni][17] middleware works is almost line-for-line identical in design.

Good use cases for middleware are things such as:

  * making sure a user is logged in, redirecting if not,
  * making sure the request came over HTTPS,
  * making sure a session is set up and loaded from a session database,
  * making sure we logged information before and after the request was handled,
  * making sure the request was routed to the right handler,
  * and so on.



Composing your web app as essentially a chain of middleware handlers is a very powerful and flexible approach. It allows you to avoid a lot of [cross-cutting concerns][31] and have your code factored in very elegant and easy-to-maintain ways. By wrapping a set of handlers with middleware that ensures a user is logged in prior to actually attempting to handle the request, the individual handlers no longer need mistake-prone copy-and-pasted code to ensure the same thing.

So, middleware is good. However, if Negroni or other frameworks are any indication, you’d think the standard library’s `http.Handler` isn’t up to the challenge. Negroni adds its own `negroni.Handler` just for the sake of making middleware easier. There’s no reason for this.

Here is a full middleware implementation for ensuring a user is logged in, assuming a `GetUser(*http.Request)` function but otherwise just using the standard library:

```
func RequireUser(h http.Handler) http.Handler {
  return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
    user, err := GetUser(req)
    if err != nil {
      http.Error(w, err.Error(), http.StatusInternalServerError)
      return
    }
    if user == nil {
      http.Error(w, "unauthorized", http.StatusUnauthorized)
      return
    }
    h.ServeHTTP(w, req)
  })
}
```

Here’s how it’s used (just wrap another handler!):

```
func main() {
  http.ListenAndServe(":8080", RequireUser(http.HandlerFunc(myHandler)))
}
```

Express, Negroni, and other frameworks expect this kind of signature for a middleware-supporting handler:

```
type Handler interface {
  // don't do this!
  ServeHTTP(rw http.ResponseWriter, req *http.Request, next http.HandlerFunc)
}
```

There’s really no reason for adding the `next` argument - it reduces cross-library compatibility. So I say, don’t use `negroni.Handler` (or similar). Just use `http.Handler`!

### Composability

Hopefully I’ve sold you on middleware as a good design philosophy.

Probably the most commonly-used type of middleware is request routing, or muxing (seems like we should call this demuxing but what do I know). Some frameworks are almost solely focused on request routing. [gorilla/mux][32] seems more popular than any other part of the [Gorilla][33] library. I think the reason for this is that even though the Go standard library is completely full featured and has a good [ServeMux][34] implementation, it doesn’t make the right thing the default.

So! Let’s talk about request routing and consider the following problem. You, web developer extraordinaire, want to serve some HTML from your web server at `/hello/` but also want to serve some static assets from `/static/`. Let’s take a quick stab.

```
package main

import (
  "net/http"
)

func hello(w http.ResponseWriter, req *http.Request) {
  w.Write([]byte("hello, world!"))
}

func main() {
  mux := http.NewServeMux()
  mux.Handle("/hello/", http.HandlerFunc(hello))
  mux.Handle("/static/", http.FileServer(http.Dir("./static-assets")))
  http.ListenAndServe(":8080", mux)
}
```

If you visit `http://localhost:8080/hello/`, you’ll be rewarded with a friendly “hello, world!” message.

If you visit `http://localhost:8080/static/` on the other hand (assuming you have a folder of static assets in `./static-assets`), you’ll be surprised and frustrated. This code tries to find the source content for the request `/static/my-file` at `./static-assets/static/my-file`! There’s an extra `/static` in there!

Okay, so this is why `http.StripPrefix` exists. Let’s fix it.

```
mux.Handle("/static/", http.StripPrefix("/static",
  http.FileServer(http.Dir("./static-assets"))))
```

`mux.Handle` combined with `http.StripPrefix` is such a common pattern that I think it should be the default. Whenever a request router processes a certain amount of URL elements, it should strip them off the request so the wrapped `http.Handler` doesn’t need to know its absolute URL and only needs to be concerned with its relative one.

In [Russ Cox][35]’s recent [TiddlyWeb backend][36], I would argue that every time `strings.TrimPrefix` is needed to remove the full URL from the handler’s incoming path arguments, it is an unnecessary cross-cutting concern, unfortunately imposed by `http.ServeMux`. (An example is [line 201 in tiddly.go][37].)

I’d much rather have the default `mux` behavior work more like a directory of registered elements that by default strips off the ancestor directory before handing the request to the next middleware handler. It’s much more composable. To this end, I’ve written a simple muxer that works in this fashion called [whmux.Dir][38]. It is essentially `http.ServeMux` and `http.StripPrefix` combined. Here’s the previous example reworked to use it:

```
package main

import (
  "net/http"

  "gopkg.in/webhelp.v1/whmux"
)

func hello(w http.ResponseWriter, req *http.Request) {
  w.Write([]byte("hello, world!"))
}

func main() {
  mux := whmux.Dir{
    "hello":  http.HandlerFunc(hello),
    "static": http.FileServer(http.Dir("./static-assets")),
  }
  http.ListenAndServe(":8080", mux)
}
```

There are other useful mux implementations inside the [whmux][39] package that demultiplex on various aspects of the request path, request method, request host, or pull arguments out of the request and place them into the context, such as a [whmux.IntArg][40] or [whmux.StringArg][41]. This brings us to [contexts][42].

### Contexts

Request contexts are a recent addition to the Go 1.7 standard library, but the idea of [contexts has been around since mid-2014][43]. As of Go 1.7, they were added to the standard library ([“context”][42]), but are available for older Go releases in the original location ([“golang.org/x/net/context”][44]).

First, here’s the definition of the `context.Context` type that `(*http.Request).Context()` returns:

```
type Context interface {
  Done() <-chan struct{}
  Err() error
  Deadline() (deadline time.Time, ok bool)

  Value(key interface{}) interface{}
}
```

Talking about `Done()`, `Err()`, and `Deadline()` are enough for an entirely different blog post, so I’m going to ignore them at least for now and focus on `Value(interface{})`.

As a motivating problem, let’s say that the `GetUser(*http.Request)` method we assumed earlier is expensive, and we only want to call it once per request. We certainly don’t want to call it once to check that a user is logged in, and then again when we actually need the `*User` value. With `(*http.Request).WithContext` and `context.WithValue`, we can pass the `*User` down to the next middleware precomputed!

Here’s the new middleware:

```
type userKey int

func RequireUser(h http.Handler) http.Handler {
  return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
    user, err := GetUser(req)
    if err != nil {
      http.Error(w, err.Error(), http.StatusInternalServerError)
      return
    }
    if user == nil {
      http.Error(w, "unauthorized", http.StatusUnauthorized)
      return
    }
    ctx := r.Context()
    ctx = context.WithValue(ctx, userKey(0), user)
    h.ServeHTTP(w, req.WithContext(ctx))
  })
}
```

Now, handlers that are protected by this `RequireUser` handler can load the previously computed `*User` value like this:

```
if user, ok := req.Context().Value(userKey(0)).(*User); ok {
  // there's a valid user!
}
```

Contexts allow us to pass optional values to handlers down the chain in a way that is relatively type-safe and flexible. None of the above context logic requires anything outside of the standard library.

#### Aside about context keys

There was a curious piece of code in the above example. At the top, we defined a `type userKey int`, and then always used it as `userKey(0)`.

One of the possible problems with contexts is the `Value()` interface lends itself to a global namespace where you can stomp on other context users and use conflicting key names. Above, we used `type userKey` because it’s an unexported type in your package. It will never compare equal (without a cast) to any other type, including `int`, in Go. This gives us a way to namespace keys to your package, even though the `Value()` method is still a sort of global namespace.

Because the need for this is so common, the `webhelp` package defines a [GenSym()][45] helper that will create a brand new, never-before-seen, unique value for use as a context key.

If we used [GenSym()][45], then `type userKey int` would become `var userKey = webhelp.GenSym()` and `userKey(0)` would simply become `userKey`.

#### Back to whmux.StringArg

Armed with this new context behavior, we can now present a `whmux.StringArg` example:

```
package main

import (
  "fmt"
  "net/http"

  "gopkg.in/webhelp.v1/whmux"
)

var (
  pageName = whmux.NewStringArg()
)

func page(w http.ResponseWriter, req *http.Request) {
  name := pageName.Get(req.Context())

  fmt.Fprintf(w, "Welcome to %s", name)
}

func main() {
  // pageName.Shift pulls the next /-delimited string out of the request's
  // URL.Path and puts it into the context instead.
  pageHandler := pageName.Shift(http.HandlerFunc(page))

  http.ListenAndServe(":8080", whmux.Dir{
    "wiki": pageHandler,
  })
}
```

### Pre-Go-1.7 support

Contexts let you do some pretty cool things. But let’s say you’re stuck with something before Go 1.7 (for instance, App Engine is currently Go 1.6).

That’s okay! I’ve backported all of the neat new context features to Go 1.6 and earlier in a forwards compatible way!

With the [whcompat][46] package, `req.Context()` becomes `whcompat.Context(req)`, and `req.WithContext(ctx)` becomes `whcompat.WithContext(req, ctx)`. The `whcompat` versions work with all releases of Go. Yay!

There’s a bit of unpleasantness behind the scenes to make this happen. Specifically, for pre-1.7 builds, a global map indexed by `req.URL` is kept, and a finalizer is installed on `req` to clean up. So don’t change what `req.URL` points to and this will work fine. In practice it’s not a problem.

`whcompat` adds additional backwards-compatibility helpers. In Go 1.7 and on, the context’s `Done()` channel is closed (and `Err()` is set), whenever the request is done processing. If you want this behavior in Go 1.6 and earlier, just use the [whcompat.DoneNotify][47] middleware.

In Go 1.8 and on, the context’s `Done()` channel is closed when the client goes away, even if the request hasn’t completed. If you want this behavior in Go 1.7 and earlier, just use the [whcompat.CloseNotify][48] middleware, though beware that it costs an extra goroutine.

### Error handling

How you handle errors can be another cross-cutting concern, but with good application of context and middleware, it too can be beautifully cleaned up so that the responsibilities lie in the correct place.

Problem statement: your `RequireUser` middleware needs to handle an authentication error differently between your HTML endpoints and your JSON API endpoints. You want to use `RequireUser` for both types of endpoints, but with your HTML endpoints you want to return a user-friendly error page, and with your JSON API endpoints you want to return an appropriate JSON error state.

In my opinion, the right thing to do is to have contextual error handlers, and luckily, we have a context for contextual information!

First, we need an error handler interface.

```
type ErrHandler interface {
  HandleError(w http.ResponseWriter, req *http.Request, err error)
}
```

Next, let’s make a middleware that registers the error handler in the context:

```
var errHandler = webhelp.GenSym() // see the aside about context keys

func HandleErrWith(eh ErrHandler, h http.Handler) http.Handler {
  return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
    ctx := context.WithValue(whcompat.Context(req), errHandler, eh)
    h.ServeHTTP(w, whcompat.WithContext(req, ctx))
  })
}
```

Last, let’s make a function that will use the registered error handler for errors:

```
func HandleErr(w http.ResponseWriter, req *http.Request, err error) {
  if handler, ok := whcompat.Context(req).Value(errHandler).(ErrHandler); ok {
    handler.HandleError(w, req, err)
    return
  }
  log.Printf("error: %v", err)
  http.Error(w, "internal server error", http.StatusInternalServerError)
}
```

Now, as long as everything uses `HandleErr` to handle errors, our JSON API can handle errors with JSON responses, and our HTML endpoints can handle errors with HTML responses.

Of course, the [wherr][49] package implements this all for you, and the [whjson][49] package even implements a friendly JSON API error handler.

Here’s how you might use it:

```
var userKey = webhelp.GenSym()

func RequireUser(h http.Handler) http.Handler {
  return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
    user, err := GetUser(req)
    if err != nil {
      wherr.Handle(w, req, wherr.InternalServerError.New("failed to get user"))
      return
    }
    if user == nil {
      wherr.Handle(w, req, wherr.Unauthorized.New("no user found"))
      return
    }
    ctx := r.Context()
    ctx = context.WithValue(ctx, userKey, user)
    h.ServeHTTP(w, req.WithContext(ctx))
  })
}

func userpage(w http.ResponseWriter, req *http.Request) {
  user := req.Context().Value(userKey).(*User)
  w.Header().Set("Content-Type", "text/html")
  userpageTmpl.Execute(w, user)
}

func username(w http.ResponseWriter, req *http.Request) {
  user := req.Context().Value(userKey).(*User)
  w.Header().Set("Content-Type", "application/json")
  json.NewEncoder(w).Encode(map[string]interface{}{"user": user})
}

func main() {
  http.ListenAndServe(":8080", whmux.Dir{
    "api": wherr.HandleWith(whjson.ErrHandler,
      RequireUser(whmux.Dir{
        "username": http.HandlerFunc(username),
      })),
    "user": RequireUser(http.HandlerFunc(userpage)),
  })
}
```

#### Aside about the spacemonkeygo/errors package

The default [wherr.Handle][50] implementation understands all of the [error classes defined in the wherr top level package][51].

These error classes are implemented using the [spacemonkeygo/errors][52] library and the [spacemonkeygo/errors/errhttp][53] extensions. You don’t have to use this library or these errors, but the benefit is that your error instances can be extended to include HTTP status code messages and information, which once again, provides for a nice elimination of cross-cutting concerns in your error handling logic.

See the [spacemonkeygo/errors][52] package for more details.

_**Update 2018-04-19:** After a few years of use, my friend condensed some lessons we learned and the best parts of `spacemonkeygo/errors` into a new, more concise, better library, over at [github.com/zeebo/errs][54]. Consider using that instead!_

### Sessions

Go’s standard library has great support for cookies, but cookies by themselves aren’t usually what a developer thinks of when she thinks about sessions. Cookies are unencrypted, unauthenticated, and readable by the user, and perhaps you don’t want that with your session data.

Further, sessions can be stored in cookies, but could also be stored in a database to provide features like session revocation and querying. There’s lots of potential details about the implementation of sessions.

Request handlers, however, probably don’t care too much about the implementation details of the session. Request handlers usually just want a bucket of keys and values they can store safely and securely.

The [whsess][55] package implements middleware for registering an arbitrary session store (a default cookie-based session store is provided), and implements helpers for retrieving and saving new values into the session.

The default cookie-based session store implements encryption and authentication via the excellent [nacl/secretbox][56] package.

Usage is like this:

```
func handler(w http.ResponseWriter, req *http.Request) {
  ctx := whcompat.Context(req)
  sess, err := whsess.Load(ctx, "namespace")
  if err != nil {
    wherr.Handle(w, req, err)
    return
  }
  if loggedIn, _ := sess.Values["logged_in"].(bool); loggedIn {
    views, _ := sess.Values["views"].(int64)
    sess.Values["views"] = views + 1
    sess.Save(w)
  }
}

func main() {
  http.ListenAndServe(":8080", whsess.HandlerWithStore(
    whsess.NewCookieStore(secret), http.HandlerFunc(handler)))
}
```

### Logging

The Go standard library by default doesn’t log incoming requests, outgoing responses, or even just what port the HTTP server is listening on.

The [whlog][57] package implements all three. The [whlog.LogRequests][58] middleware will log requests as they start. The [whlog.LogResponses][59] middleware will log requests as they end, along with status code and timing information. [whlog.ListenAndServe][60] will log the address the server ultimately listens on (if you specify “:0” as your address, a port will be randomly chosen, and [whlog.ListenAndServe][60] will log it).

[whlog.LogResponses][59] deserves special mention for how it does what it does. It uses the [whmon][61] package to instrument the outgoing `http.ResponseWriter` to keep track of response information.

Usage is like this:

```
func main() {
  whlog.ListenAndServe(":8080", whlog.LogResponses(whlog.Default, handler))
}
```

#### App engine logging

App engine logging is unconventional crazytown. The standard library logger doesn’t work by default on App Engine, because App Engine logs _require_ the request context. This is unfortunate for libraries that don’t necessarily run on App Engine all the time, as their logging information doesn’t make it to the App Engine request-specific logger.

Unbelievably, this is fixable with [whgls][62], which uses my terrible, terrible (but recently improved) [Goroutine-local storage library][63] to store the request context on the current stack, register a new log output, and fix logging so standard library logging works with App Engine again.

### Template handling

Go’s standard library [html/template][64] package is excellent, but you’ll be unsurprised to find there’s a few tasks I do with it so commonly that I’ve written additional support code.

The [whtmpl][65] package really does two things. First, it provides a number of useful helper methods for use within templates, and second, it takes some friction out of managing a large number of templates.

When writing templates, one thing you can do is call out to other registered templates for small values. A good example might be some sort of list element. You can have a template that renders the list element, and then your template that renders your list can use the list element template in turn.

Use of another template within a template might look like this:

```
<ul>
  {{ range .List }}
    {{ template "list_element" . }}
  {{ end }}
</ul>
```

You’re now rendering the `list_element` template with the list element from `.List`. But what if you want to also pass the current user `.User`? Unfortunately, you can only pass one argument from one template to another. If you have two arguments you want to pass to another template, with the standard library, you’re out of luck.

The [whtmpl][65] package adds three helper functions to aid you here, `makepair`, `makemap`, and `makeslice` (more docs under the [whtmpl.Collection][66] type). `makepair` is the simplest. It takes two arguments and constructs a [whtmpl.Pair][67]. Fixing our example above would look like this now:

```
<ul>
  {{ $user := .User }}
  {{ range .List }}
    {{ template "list_element" (makepair . $user) }}
  {{ end }}
</ul>
```

The second thing [whtmpl][65] does is make defining lots of templates easy, by optionally automatically naming templates after the name of the file the template is defined in.

For example, say you have three files.

Here’s `pkg.go`:

```
package views

import "gopkg.in/webhelp.v1/whtmpl"

var Templates = whtmpl.NewCollection()
```

Here’s `landing.go`:

```
package views

var _ = Templates.MustParse(`{{ template "header" . }}

   <h1>Landing!</h1>`)
```

And here’s `header.go`:

```
package views

var _ = Templates.MustParse(`<title>My website!</title>`)
```

Now, you can import your new `views` package and render the `landing` template this easily:

```
func handler(w http.ResponseWriter, req *http.Request) {
  views.Templates.Render(w, req, "landing", map[string]interface{}{})
}
```

### User authentication

I’ve written two Webhelp-style authentication libraries that I end up using frequently.

The first is an OAuth2 library, [whoauth2][68]. I’ve written up [an example application that authenticates with Google, Facebook, and Github][69].

The second, [whgoth][70], is a wrapper around [markbates/goth][71]. My portion isn’t quite complete yet (some fixes are still necessary for optional App Engine support), but will support more non-OAuth2 authentication sources (like Twitter) when it is done.

### Route listing

Surprise! If you’ve used [webhelp][27] based handlers and middleware for your whole app, you automatically get route listing for free, via the [whroute][72] package.

My web serving code’s `main` method often has a form like this:

```
switch flag.Arg(0) {
case "serve":
  panic(whlog.ListenAndServe(*listenAddr, routes))
case "routes":
  whroute.PrintRoutes(os.Stdout, routes)
default:
  fmt.Printf("Usage: %s <serve|routes>\n", os.Args[0])
}
```

Here’s some example output:

```
GET   /auth/_cb/
GET   /auth/login/
GET   /auth/logout/
GET   /
GET   /account/apikeys/
POST  /account/apikeys/
GET   /project/<int>/
GET   /project/<int>/control/<int>/
POST  /project/<int>/control/<int>/sample/
GET   /project/<int>/control/
 Redirect: f(req)
POST  /project/<int>/control/
POST  /project/<int>/control_named/<string>/sample/
GET   /project/<int>/control_named/
 Redirect: f(req)
GET   /project/<int>/sample/<int>/
GET   /project/<int>/sample/<int>/similar[/<*>]
GET   /project/<int>/sample/
 Redirect: f(req)
POST  /project/<int>/search/
GET   /project/
 Redirect: /
POST  /project/
```

### Other little things

[webhelp][27] has a number of other subpackages:

  * [whparse][73] assists in parsing optional request arguments.
  * [whredir][74] provides some handlers and helper methods for doing redirects in various cases.
  * [whcache][75] creates request-specific mutable storage for caching various computations and database loaded data. Mutability helps helper functions that aren’t used as middleware share data.
  * [whfatal][76] uses panics to simplify early request handling termination. Probably avoid this package unless you want to anger other Go developers.



### Summary

Designing your web project as a collection of composable middlewares goes quite a long way to simplify your code design, eliminate cross-cutting concerns, and create a more flexible development environment. Use my [webhelp][27] package if it helps you.

Or don’t! Whatever! It’s still a free country last I checked.

#### Update

Peter Kieltyka points me to his [Chi framework][77], which actually does seem to do the right things with respect to middleware, handlers, and contexts - certainly much more so than all the other frameworks I’ve seen. So, shoutout to Peter and the team at Pressly!

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2017/01/writing-advanced-web-applications-with-go

作者：[jtolio.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.jtolio.com/
[b]: https://github.com/lujun9972
[1]: https://www.ruby-lang.org/
[2]: http://rubyonrails.org/
[3]: http://www.sinatrarb.com/
[4]: https://www.python.org/
[5]: https://www.djangoproject.com/
[6]: http://flask.pocoo.org/
[7]: https://golang.org/
[8]: https://groups.google.com/d/forum/golang-nuts
[9]: https://www.reddit.com/r/golang/
[10]: https://revel.github.io/
[11]: https://gin-gonic.github.io/gin/
[12]: http://iris-go.com/
[13]: https://beego.me/
[14]: https://go-macaron.com/
[15]: https://github.com/go-martini/martini
[16]: https://github.com/gocraft/web
[17]: https://github.com/urfave/negroni
[18]: https://godoc.org/goji.io
[19]: https://echo.labstack.com/
[20]: https://medium.com/code-zen/why-i-don-t-use-go-web-frameworks-1087e1facfa4
[21]: https://groups.google.com/forum/#!topic/golang-nuts/R_lqsTTBh6I
[22]: https://www.reddit.com/r/golang/comments/1yh6gm/new_to_go_trying_to_select_web_framework/
[23]: https://golang.org/pkg/net/http/#Handler
[24]: https://golang.org/pkg/net/http/#Request
[25]: https://golang.org/pkg/net/http/#Request.Context
[26]: https://golang.org/pkg/net/http/#Request.WithContext
[27]: https://godoc.org/gopkg.in/webhelp.v1
[28]: https://golang.org/doc/articles/wiki/
[29]: https://expressjs.com/
[30]: https://nodejs.org/en/
[31]: https://en.wikipedia.org/wiki/Cross-cutting_concern
[32]: https://github.com/gorilla/mux
[33]: https://github.com/gorilla/
[34]: https://golang.org/pkg/net/http/#ServeMux
[35]: https://swtch.com/~rsc/
[36]: https://github.com/rsc/tiddly
[37]: https://github.com/rsc/tiddly/blob/8f9145ac183e374eb95d90a73be4d5f38534ec47/tiddly.go#L201
[38]: https://godoc.org/gopkg.in/webhelp.v1/whmux#Dir
[39]: https://godoc.org/gopkg.in/webhelp.v1/whmux
[40]: https://godoc.org/gopkg.in/webhelp.v1/whmux#IntArg
[41]: https://godoc.org/gopkg.in/webhelp.v1/whmux#StringArg
[42]: https://golang.org/pkg/context/
[43]: https://blog.golang.org/context
[44]: https://godoc.org/golang.org/x/net/context
[45]: https://godoc.org/gopkg.in/webhelp.v1#GenSym
[46]: https://godoc.org/gopkg.in/webhelp.v1/whcompat
[47]: https://godoc.org/gopkg.in/webhelp.v1/whcompat#DoneNotify
[48]: https://godoc.org/gopkg.in/webhelp.v1/whcompat#CloseNotify
[49]: https://godoc.org/gopkg.in/webhelp.v1/wherr
[50]: https://godoc.org/gopkg.in/webhelp.v1/wherr#Handle
[51]: https://godoc.org/gopkg.in/webhelp.v1/wherr#pkg-variables
[52]: https://godoc.org/github.com/spacemonkeygo/errors
[53]: https://godoc.org/github.com/spacemonkeygo/errors/errhttp
[54]: https://github.com/zeebo/errs
[55]: https://godoc.org/gopkg.in/webhelp.v1/whsess
[56]: https://godoc.org/golang.org/x/crypto/nacl/secretbox
[57]: https://godoc.org/gopkg.in/webhelp.v1/whlog
[58]: https://godoc.org/gopkg.in/webhelp.v1/whlog#LogRequests
[59]: https://godoc.org/gopkg.in/webhelp.v1/whlog#LogResponses
[60]: https://godoc.org/gopkg.in/webhelp.v1/whlog#ListenAndServe
[61]: https://godoc.org/gopkg.in/webhelp.v1/whmon
[62]: https://godoc.org/gopkg.in/webhelp.v1/whgls
[63]: https://godoc.org/github.com/jtolds/gls
[64]: https://golang.org/pkg/html/template/
[65]: https://godoc.org/gopkg.in/webhelp.v1/whtmpl
[66]: https://godoc.org/gopkg.in/webhelp.v1/whtmpl#Collection
[67]: https://godoc.org/gopkg.in/webhelp.v1/whtmpl#Pair
[68]: https://godoc.org/gopkg.in/go-webhelp/whoauth2.v1
[69]: https://github.com/go-webhelp/whoauth2/blob/v1/examples/group/main.go
[70]: https://godoc.org/gopkg.in/go-webhelp/whgoth.v1
[71]: https://github.com/markbates/goth
[72]: https://godoc.org/gopkg.in/webhelp.v1/whroute
[73]: https://godoc.org/gopkg.in/webhelp.v1/whparse
[74]: https://godoc.org/gopkg.in/webhelp.v1/whredir
[75]: https://godoc.org/gopkg.in/webhelp.v1/whcache
[76]: https://godoc.org/gopkg.in/webhelp.v1/whfatal
[77]: https://github.com/pressly/chi
