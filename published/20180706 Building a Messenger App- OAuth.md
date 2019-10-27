[#]: collector: (lujun9972)
[#]: translator: (PsiACE)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11510-1.html)
[#]: subject: (Building a Messenger App: OAuth)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-oauth/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（二）：OAuth
======

[上一篇：模式](https://linux.cn/article-11396-1.html)。

在这篇帖子中，我们将会通过为应用添加社交登录功能进入后端开发。

社交登录的工作方式十分简单：用户点击链接，然后重定向到 GitHub 授权页面。当用户授予我们对他的个人信息的访问权限之后，就会重定向回登录页面。下一次尝试登录时，系统将不会再次请求授权，也就是说，我们的应用已经记住了这个用户。这使得整个登录流程看起来就和你用鼠标单击一样快。

如果进一步考虑其内部实现的话，过程就会变得复杂起来。首先，我们需要注册一个新的 [GitHub OAuth 应用][2]。

这一步中，比较重要的是回调 URL。我们将它设置为 `http://localhost:3000/api/oauth/github/callback`。这是因为，在开发过程中，我们总是在本地主机上工作。一旦你要将应用交付生产，请使用正确的回调 URL 注册一个新的应用。

注册以后，你将会收到“客户端 id”和“安全密钥”。安全起见，请不要与任何人分享他们 👀

顺便让我们开始写一些代码吧。现在，创建一个 `main.go` 文件：

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

安装依赖项：

```
go get -u github.com/gorilla/securecookie
go get -u github.com/joho/godotenv
go get -u github.com/knq/jwt
go get -u github.com/lib/pq
ge get -u github.com/matoous/go-nanoid
go get -u github.com/matryer/way
go get -u golang.org/x/oauth2
```

我们将会使用 `.env` 文件来保存密钥和其他配置。请创建这个文件，并保证里面至少包含以下内容：

```
GITHUB_CLIENT_ID=your_github_client_id
GITHUB_CLIENT_SECRET=your_github_client_secret
```

我们还要用到的其他环境变量有：

  * `PORT`：服务器运行的端口，默认值是 `3000`。
  * `ORIGIN`：你的域名，默认值是 `http://localhost:3000/`。我们也可以在这里指定端口。
  * `DATABASE_URL`：Cockroach 数据库的地址。默认值是 `postgresql://root@127.0.0.1:26257/messenger?sslmode=disable`。
  * `HASH_KEY`：用于为 cookie 签名的密钥。没错，我们会使用已签名的 cookie 来确保安全。
  * `JWT_KEY`：用于签署 JSON <ruby>网络令牌<rt>Web Token</rt></ruby>的密钥。

因为代码中已经设定了默认值，所以你也不用把它们写到 `.env` 文件中。

在读取配置并连接到数据库之后，我们会创建一个 OAuth 配置。我们会使用 `ORIGIN` 信息来构建回调 URL（就和我们在 GitHub 页面上注册的一样）。我们的数据范围设置为 “read:user”。这会允许我们读取公开的用户信息，这里我们只需要他的用户名和头像就够了。然后我们会初始化 cookie 和 JWT 签名器。定义一些端点并启动服务器。

在实现 HTTP 处理程序之前，让我们编写一些函数来发送 HTTP 响应。

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

第一个函数用来发送 JSON，而第二个将错误记录到控制台并返回一个 `500 Internal Server Error` 错误信息。

### OAuth 开始

所以，用户点击写着 “Access with GitHub” 的链接。该链接指向 `/api/oauth/github`，这将会把用户重定向到 github。

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

OAuth2 使用一种机制来防止 CSRF 攻击，因此它需要一个“状态”（`state`）。我们使用 `Nanoid()` 来创建一个随机字符串，并用这个字符串作为状态。我们也把它保存为一个 cookie。

### OAuth 回调

一旦用户授权我们访问他的个人信息，他将会被重定向到这个端点。这个 URL 的查询字符串上将会包含状态（`state`）和授权码（`code`）： `/api/oauth/github/callback?state=&code=`。

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

首先，我们会尝试使用之前保存的状态对 cookie 进行解码。并将其与查询字符串中的状态进行比较。如果它们不匹配，我们会返回一个 `418 I'm teapot`（未知来源）错误。

接着，我们使用授权码生成一个令牌。这个令牌被用于创建 HTTP 客户端来向 GitHub API 发出请求。所以最终我们会向 `https://api.github.com/user` 发送一个 GET 请求。这个端点将会以 JSON 格式向我们提供当前经过身份验证的用户信息。我们将会解码这些内容，一并获取用户的 ID、登录名（用户名）和头像 URL。

然后我们将会尝试在数据库上找到具有该 GitHub ID 的用户。如果没有找到，就使用该数据创建一个新的。

之后，对于新创建的用户，我们会发出一个将用户 ID 作为主题（`Subject`）的 JSON 网络令牌，并使用该令牌重定向到前端，查询字符串中一并包含该令牌的到期日（`Expiration`）。

这一 Web 应用也会被用在其他帖子，但是重定向的链接会是 `/callback?token=&expires_at=`。在那里，我们将会利用 JavaScript 从 URL 中获取令牌和到期日，并通过 `Authorization` 标头中的令牌以 `Bearer token_here` 的形式对 `/api/auth_user` 进行 GET 请求，来获取已认证的身份用户并将其保存到 localStorage。

### Guard 中间件

为了获取当前已经过身份验证的用户，我们设计了 Guard 中间件。这是因为在接下来的文章中，我们会有很多需要进行身份认证的端点，而中间件将会允许我们共享这一功能。

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

首先，我们尝试从 `Authorization` 标头或者是 URL 查询字符串中的 `token` 字段中读取令牌。如果没有找到，我们需要返回 `401 Unauthorized`（未授权）错误。然后我们将会对令牌中的申明进行解码，并使用该主题作为当前已经过身份验证的用户 ID。

现在，我们可以用这一中间件来封装任何需要授权的 `http.handlerFunc`，并且在处理函数的上下文中保有已经过身份验证的用户 ID。

```
var guarded = guard(func(w http.ResponseWriter, r *http.Request) {
    authUserID := r.Context().Value(keyAuthUserID).(string)
})
```

### 获取认证用户

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

我们使用 Guard 中间件来获取当前经过身份认证的用户 ID 并查询数据库。

这一部分涵盖了后端的 OAuth 流程。在下一篇帖子中，我们将会看到如何开始与其他用户的对话。

- [源代码][3]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-oauth/

作者：[Nicolás Parada][a]
选题：[lujun9972][b]
译者：[PsiACE](https://github.com/PsiACE)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nicolasparada.netlify.com/
[b]: https://github.com/lujun9972
[1]: https://nicolasparada.netlify.com/posts/go-messenger-schema/
[2]: https://github.com/settings/applications/new
[3]: https://github.com/nicolasparada/go-messenger-demo
