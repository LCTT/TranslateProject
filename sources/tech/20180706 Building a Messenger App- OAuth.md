[#]: collector: (lujun9972)
[#]: translator: (PsiACE)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: OAuth)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-oauth/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: OAuth
======

[Previous part: Schema][1].

In this post we start the backend by adding social login.

This is how it works: the user click on a link that redirects him to the GitHub authorization page. The user grant access to his info and get redirected back logged in. The next time he tries to login, he won’t be asked to grant permission, it is remembered so the login flow is as fast as a single click.

Internally, the history is more complex tho. First we need the register a new [OAuth app on GitHub][2].

The important part is the callback URL. Set it to `http://localhost:3000/api/oauth/github/callback`. On development we are on localhost, so when you ship the app to production, register a new app with the correct callback URL.

This will give you a client id and a secret key. Don’t share them with anyone 👀

With that off of the way, lets start to write some code. Create a `main.go` file:

```
package main

import (
    "database/sql"
    "fmt"
    "log"
    "net/http"
    "net/url"
    "os"
    "strconv"

    "github.com/gorilla/securecookie"
    "github.com/joho/godotenv"
    "github.com/knq/jwt"
    _ "github.com/lib/pq"
    "github.com/matryer/way"
    "golang.org/x/oauth2"
    "golang.org/x/oauth2/github"
)

var origin *url.URL
var db *sql.DB
var githubOAuthConfig *oauth2.Config
var cookieSigner *securecookie.SecureCookie
var jwtSigner jwt.Signer

func main() {
    godotenv.Load()

    port := intEnv("PORT", 3000)
    originString := env("ORIGIN", fmt.Sprintf("http://localhost:%d/", port))
    databaseURL := env("DATABASE_URL", "postgresql://root@127.0.0.1:26257/messenger?sslmode=disable")
    githubClientID := os.Getenv("GITHUB_CLIENT_ID")
    githubClientSecret := os.Getenv("GITHUB_CLIENT_SECRET")
    hashKey := env("HASH_KEY", "secret")
    jwtKey := env("JWT_KEY", "secret")

    var err error
    if origin, err = url.Parse(originString); err != nil || !origin.IsAbs() {
        log.Fatal("invalid origin")
        return
    }

    if i, err := strconv.Atoi(origin.Port()); err == nil {
        port = i
    }

    if githubClientID == "" || githubClientSecret == "" {
        log.Fatalf("remember to set both $GITHUB_CLIENT_ID and $GITHUB_CLIENT_SECRET")
        return
    }

    if db, err = sql.Open("postgres", databaseURL); err != nil {
        log.Fatalf("could not open database connection: %v\n", err)
        return
    }
    defer db.Close()
    if err = db.Ping(); err != nil {
        log.Fatalf("could not ping to db: %v\n", err)
        return
    }

    githubRedirectURL := *origin
    githubRedirectURL.Path = "/api/oauth/github/callback"
    githubOAuthConfig = &oauth2.Config{
        ClientID:     githubClientID,
        ClientSecret: githubClientSecret,
        Endpoint:     github.Endpoint,
        RedirectURL:  githubRedirectURL.String(),
        Scopes:       []string{"read:user"},
    }

    cookieSigner = securecookie.New([]byte(hashKey), nil).MaxAge(0)

    jwtSigner, err = jwt.HS256.New([]byte(jwtKey))
    if err != nil {
        log.Fatalf("could not create JWT signer: %v\n", err)
        return
    }

    router := way.NewRouter()
    router.HandleFunc("GET", "/api/oauth/github", githubOAuthStart)
    router.HandleFunc("GET", "/api/oauth/github/callback", githubOAuthCallback)
    router.HandleFunc("GET", "/api/auth_user", guard(getAuthUser))

    log.Printf("accepting connections on port %d\n", port)
    log.Printf("starting server at %s\n", origin.String())
    addr := fmt.Sprintf(":%d", port)
    if err = http.ListenAndServe(addr, router); err != nil {
        log.Fatalf("could not start server: %v\n", err)
    }
}

func env(key, fallbackValue string) string {
    v, ok := os.LookupEnv(key)
    if !ok {
        return fallbackValue
    }
    return v
}

func intEnv(key string, fallbackValue int) int {
    v, ok := os.LookupEnv(key)
    if !ok {
        return fallbackValue
    }
    i, err := strconv.Atoi(v)
    if err != nil {
        return fallbackValue
    }
    return i
}
```

Install dependencies:

```
go get -u github.com/gorilla/securecookie
go get -u github.com/joho/godotenv
go get -u github.com/knq/jwt
go get -u github.com/lib/pq
ge get -u github.com/matoous/go-nanoid
go get -u github.com/matryer/way
go get -u golang.org/x/oauth2
```

We use a `.env` file to save secret keys and other configurations. Create it with at least this content:

```
GITHUB_CLIENT_ID=your_github_client_id
GITHUB_CLIENT_SECRET=your_github_client_secret
```

The other enviroment variables we use are:

  * `PORT`: The port in which the server runs. Defaults to `3000`.
  * `ORIGIN`: Your domain. Defaults to `http://localhost:3000/`. The port can also be extracted from this.
  * `DATABASE_URL`: The Cockroach address. Defaults to `postgresql://root@127.0.0.1:26257/messenger?sslmode=disable`.
  * `HASH_KEY`: Key to sign cookies. Yeah, we’ll use signed cookies for security.
  * `JWT_KEY`: Key to sign JSON web tokens.



Because they have default values, your don’t need to write them on the `.env` file.

After reading the configuration and connecting to the database, we create an OAuth config. We use the origin to build the callback URL (the same we registered on the github page). And we set the scope to “read:user”. This will give us permission to read the public user info. That’s because we just need his username and avatar. Then we initialize the cookie and JWT signers. Define some endpoints and start the server.

Before implementing those HTTP handlers lets write a couple functions to send HTTP responses.

```
func respond(w http.ResponseWriter, v interface{}, statusCode int) {
    b, err := json.Marshal(v)
    if err != nil {
        respondError(w, fmt.Errorf("could not marshal response: %v", err))
        return
    }
    w.Header().Set("Content-Type", "application/json; charset=utf-8")
    w.WriteHeader(statusCode)
    w.Write(b)
}

func respondError(w http.ResponseWriter, err error) {
    log.Println(err)
    http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
}
```

The first one is to send JSON and the second one logs the error to the console and return a `500 Internal Server Error` error.

### OAuth Start

So, the user clicks on a link that says “Access with GitHub”… That link points the this endpoint `/api/oauth/github` that will redirect the user to github.

```
func githubOAuthStart(w http.ResponseWriter, r *http.Request) {
    state, err := gonanoid.Nanoid()
    if err != nil {
        respondError(w, fmt.Errorf("could not generte state: %v", err))
        return
    }

    stateCookieValue, err := cookieSigner.Encode("state", state)
    if err != nil {
        respondError(w, fmt.Errorf("could not encode state cookie: %v", err))
        return
    }

    http.SetCookie(w, &http.Cookie{
        Name:     "state",
        Value:    stateCookieValue,
        Path:     "/api/oauth/github",
        HttpOnly: true,
    })
    http.Redirect(w, r, githubOAuthConfig.AuthCodeURL(state), http.StatusTemporaryRedirect)
}
```

OAuth2 uses a mechanism to prevent CSRF attacks so it requires a “state”. We use nanoid to create a random string and use that as state. We save it as a cookie too.

### OAuth Callback

Once the user grant access to his info on the GitHub page, he will be redirected to this endpoint. The URL will come with the state and a code on the query string `/api/oauth/github/callback?state=&code=`

```
const jwtLifetime = time.Hour * 24 * 14

type GithubUser struct {
    ID        int     `json:"id"`
    Login     string  `json:"login"`
    AvatarURL *string `json:"avatar_url,omitempty"`
}

type User struct {
    ID        string  `json:"id"`
    Username  string  `json:"username"`
    AvatarURL *string `json:"avatarUrl"`
}

func githubOAuthCallback(w http.ResponseWriter, r *http.Request) {
    stateCookie, err := r.Cookie("state")
    if err != nil {
        http.Error(w, http.StatusText(http.StatusTeapot), http.StatusTeapot)
        return
    }

    http.SetCookie(w, &http.Cookie{
        Name:     "state",
        Value:    "",
        MaxAge:   -1,
        HttpOnly: true,
    })

    var state string
    if err = cookieSigner.Decode("state", stateCookie.Value, &state); err != nil {
        http.Error(w, http.StatusText(http.StatusTeapot), http.StatusTeapot)
        return
    }

    q := r.URL.Query()

    if state != q.Get("state") {
        http.Error(w, http.StatusText(http.StatusTeapot), http.StatusTeapot)
        return
    }

    ctx := r.Context()

    t, err := githubOAuthConfig.Exchange(ctx, q.Get("code"))
    if err != nil {
        respondError(w, fmt.Errorf("could not fetch github token: %v", err))
        return
    }

    client := githubOAuthConfig.Client(ctx, t)
    resp, err := client.Get("https://api.github.com/user")
    if err != nil {
        respondError(w, fmt.Errorf("could not fetch github user: %v", err))
        return
    }

    var githubUser GithubUser
    if err = json.NewDecoder(resp.Body).Decode(&githubUser); err != nil {
        respondError(w, fmt.Errorf("could not decode github user: %v", err))
        return
    }
    defer resp.Body.Close()

    tx, err := db.BeginTx(ctx, nil)
    if err != nil {
        respondError(w, fmt.Errorf("could not begin tx: %v", err))
        return
    }

    var user User
    if err = tx.QueryRowContext(ctx, `
        SELECT id, username, avatar_url FROM users WHERE github_id = $1
    `, githubUser.ID).Scan(&user.ID, &user.Username, &user.AvatarURL); err == sql.ErrNoRows {
        if err = tx.QueryRowContext(ctx, `
            INSERT INTO users (username, avatar_url, github_id) VALUES ($1, $2, $3)
            RETURNING id
        `, githubUser.Login, githubUser.AvatarURL, githubUser.ID).Scan(&user.ID); err != nil {
            respondError(w, fmt.Errorf("could not insert user: %v", err))
            return
        }
        user.Username = githubUser.Login
        user.AvatarURL = githubUser.AvatarURL
    } else if err != nil {
        respondError(w, fmt.Errorf("could not query user by github ID: %v", err))
        return
    }

    if err = tx.Commit(); err != nil {
        respondError(w, fmt.Errorf("could not commit to finish github oauth: %v", err))
        return
    }

    exp := time.Now().Add(jwtLifetime)
    token, err := jwtSigner.Encode(jwt.Claims{
        Subject:    user.ID,
        Expiration: json.Number(strconv.FormatInt(exp.Unix(), 10)),
    })
    if err != nil {
        respondError(w, fmt.Errorf("could not create token: %v", err))
        return
    }

    expiresAt, _ := exp.MarshalText()

    data := make(url.Values)
    data.Set("token", string(token))
    data.Set("expires_at", string(expiresAt))

    http.Redirect(w, r, "/callback?"+data.Encode(), http.StatusTemporaryRedirect)
}
```

First we try to decode the cookie with the state we saved before. And compare it with the state that comes in the query string. In case they don’t match, we return a `418 I'm teapot` error.

Then we exchange the code for a token. This token is used to create an HTTP client to make requests to the GitHub API. So we do a GET request to `https://api.github.com/user`. This endpoint will give us the current authenticated user info in JSON format. We decode it to get the user ID, login (username) and avatar URL.

Then we try to find a user with that GitHub ID on the database. If none is found, we create one using that data.

Then, with the newly created user, we issue a JSON web token with the user ID as Subject and redirect to the frontend with the token, along side the expiration date in the query string.

The web app will be for another post, but the URL you are being redirected is `/callback?token=&expires_at=`. There we’ll have some JavaScript to extract the token and expiration date from the URL and do a GET request to `/api/auth_user` with the token in the `Authorization` header in the form of `Bearer token_here` to get the authenticated user and save it to localStorage.

### Guard Middleware

To get the current authenticated user we use a middleware. That’s because in future posts we’ll have more endpoints that requires authentication, and a middleware allow us to share functionality.

```
type ContextKey struct {
    Name string
}

var keyAuthUserID = ContextKey{"auth_user_id"}

func guard(handler http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        var token string
        if a := r.Header.Get("Authorization"); strings.HasPrefix(a, "Bearer ") {
            token = a[7:]
        } else if t := r.URL.Query().Get("token"); t != "" {
            token = t
        } else {
            http.Error(w, http.StatusText(http.StatusUnauthorized), http.StatusUnauthorized)
            return
        }

        var claims jwt.Claims
        if err := jwtSigner.Decode([]byte(token), &claims); err != nil {
            http.Error(w, http.StatusText(http.StatusUnauthorized), http.StatusUnauthorized)
            return
        }

        ctx := r.Context()
        ctx = context.WithValue(ctx, keyAuthUserID, claims.Subject)

        handler(w, r.WithContext(ctx))
    }
}
```

First we try to read the token from the `Authorization` header or a `token` in the URL query string. If none found, we return a `401 Unauthorized` error. Then we decode the claims in the token and use the Subject as the current authenticated user ID.

Now, we can wrap any `http.handlerFunc` that needs authentication with this middleware and we’ll have the authenticated user ID in the context.

```
var guarded = guard(func(w http.ResponseWriter, r *http.Request) {
    authUserID := r.Context().Value(keyAuthUserID).(string)
})
```

### Get Authenticated User

```
func getAuthUser(w http.ResponseWriter, r *http.Request) {
    ctx := r.Context()
    authUserID := ctx.Value(keyAuthUserID).(string)

    var user User
    if err := db.QueryRowContext(ctx, `
        SELECT username, avatar_url FROM users WHERE id = $1
    `, authUserID).Scan(&user.Username, &user.AvatarURL); err == sql.ErrNoRows {
        http.Error(w, http.StatusText(http.StatusTeapot), http.StatusTeapot)
        return
    } else if err != nil {
        respondError(w, fmt.Errorf("could not query auth user: %v", err))
        return
    }

    user.ID = authUserID

    respond(w, user, http.StatusOK)
}
```

We use the guard middleware to get the current authenticated user id and do a query to the database.

* * *

That will cover the OAuth process on the backend. In the next part we’ll see how to start conversations with other users.

[Souce Code][3]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-oauth/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[PsiACE](https://github.com/PsiACE)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://nicolasparada.netlify.com/posts/go-messenger-schema/
[2]: https://github.com/settings/applications/new
[3]: https://github.com/nicolasparada/go-messenger-demo
