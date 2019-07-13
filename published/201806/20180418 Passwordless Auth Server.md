无密码验证：服务器
============================================================

无密码验证可以让你只输入一个 email 而无需输入密码即可登入系统。这是一种比传统的电子邮件/密码验证方式登入更安全的方法。

下面我将为你展示，如何在 [Go][6] 中实现一个 HTTP API 去提供这种服务。

### 流程

*   用户输入他的电子邮件地址。
*   服务器创建一个临时的一次性使用的代码（就像一个临时密码一样）关联到用户，然后给用户邮箱中发送一个“魔法链接”。
*   用户点击魔法链接。
*   服务器提取魔法链接中的代码，获取关联的用户，并且使用一个新的 JWT 重定向到客户端。
*   在每次有新请求时，客户端使用 JWT 去验证用户。

### 必需条件

*   数据库：我们为这个服务使用了一个叫 [CockroachDB][1] 的 SQL 数据库。它非常像 postgres，但它是用 Go 写的。
*   SMTP 服务器：我们将使用一个第三方的邮件服务器去发送邮件。开发的时我们使用 [mailtrap][2]。Mailtrap 发送所有的邮件到它的收件箱，因此，你在测试时不需要创建多个假邮件帐户。

从 [Go 的主页][7] 上安装它，然后使用 `go version`（1.10.1 atm）命令去检查它能否正常工作。

从 [CockroachDB 的主页][8] 上下载它，展开它并添加到你的 `PATH` 变量中。使用 `cockroach version`（2.0 atm）命令检查它能否正常工作。

### 数据库模式

现在，我们在 `GOPATH` 目录下为这个项目创建一个目录，然后使用 `cockroach start` 启动一个新的 CockroachDB 节点：

```
cockroach start --insecure --host 127.0.0.1
```

它会输出一些内容，找到 SQL 地址行，它将显示像 `postgresql://root@127.0.0.1:26257?sslmode=disable` 这样的内容。稍后我们将使用它去连接到数据库。

使用如下的内容去创建一个 `schema.sql` 文件。

```
DROP DATABASE IF EXISTS passwordless_demo CASCADE;
CREATE DATABASE IF NOT EXISTS passwordless_demo;
SET DATABASE = passwordless_demo;

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email STRING UNIQUE,
    username STRING UNIQUE
);

CREATE TABLE IF NOT EXISTS verification_codes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO users (email, username) VALUES
    ('john@passwordless.local', 'john_doe');

```

这个脚本创建了一个名为 `passwordless_demo` 的数据库、两个名为 `users` 和 `verification_codes` 的表，以及为了稍后测试而插入的一些假用户。每个验证代码都与用户关联并保存创建时间，以用于去检查验证代码是否过期。

在另外的终端中使用 `cockroach sql` 命令去运行这个脚本：

```
cat schema.sql | cockroach sql --insecure

```

### 环境配置

需要配置两个环境变量：`SMTP_USERNAME` 和 `SMTP_PASSWORD`，你可以从你的 mailtrap 帐户中获得它们。将在我们的程序中用到它们。

### Go 依赖

我们需要下列的 Go 包：

*   [github.com/lib/pq][3]：它是 CockroachDB 使用的 postgres 驱动
*   [github.com/matryer/way][4]: 路由器
*   [github.com/dgrijalva/jwt-go][5]: JWT 实现

```
go get -u github.com/lib/pq
go get -u github.com/matryer/way
go get -u github.com/dgrijalva/jwt-go

```

### 代码

#### 初始化函数

创建 `main.go` 并且通过 `init` 函数里的环境变量中取得一些配置来启动。

```
var config struct {
    port        int
    appURL      *url.URL
    databaseURL string
    jwtKey      []byte
    smtpAddr    string
    smtpAuth    smtp.Auth
}

func init() {
    config.port, _ = strconv.Atoi(env("PORT", "80"))
    config.appURL, _ = url.Parse(env("APP_URL", "http://localhost:"+strconv.Itoa(config.port)+"/"))
    config.databaseURL = env("DATABASE_URL", "postgresql://root@127.0.0.1:26257/passwordless_demo?sslmode=disable")
    config.jwtKey = []byte(env("JWT_KEY", "super-duper-secret-key"))
    smtpHost := env("SMTP_HOST", "smtp.mailtrap.io")
    config.smtpAddr = net.JoinHostPort(smtpHost, env("SMTP_PORT", "25"))
    smtpUsername, ok := os.LookupEnv("SMTP_USERNAME")
    if !ok {
        log.Fatalln("could not find SMTP_USERNAME on environment variables")
    }
    smtpPassword, ok := os.LookupEnv("SMTP_PASSWORD")
    if !ok {
        log.Fatalln("could not find SMTP_PASSWORD on environment variables")
    }
    config.smtpAuth = smtp.PlainAuth("", smtpUsername, smtpPassword, smtpHost)
}

func env(key, fallbackValue string) string {
    v, ok := os.LookupEnv(key)
    if !ok {
        return fallbackValue
    }
    return v
}

```

*   `appURL` 将去构建我们的 “魔法链接”。
*   `port` 将要启动的 HTTP 服务器。
*   `databaseURL` 是 CockroachDB 地址，我添加 `/passwordless_demo` 前面的数据库地址去表示数据库名字。
*   `jwtKey` 用于签名 JWT。
*   `smtpAddr` 是 `SMTP_HOST` + `SMTP_PORT` 的联合；我们将使用它去发送邮件。
*   `smtpUsername` 和 `smtpPassword` 是两个必需的变量。
*   `smtpAuth` 也是用于发送邮件。

`env` 函数允许我们去获得环境变量，不存在时返回一个回退值。

#### 主函数

```
var db *sql.DB

func main() {
    var err error
    if db, err = sql.Open("postgres", config.databaseURL); err != nil {
        log.Fatalf("could not open database connection: %v\n", err)
    }
    defer db.Close()
    if err = db.Ping(); err != nil {
        log.Fatalf("could not ping to database: %v\n", err)
    }

    router := way.NewRouter()
    router.HandleFunc("POST", "/api/users", jsonRequired(createUser))
    router.HandleFunc("POST", "/api/passwordless/start", jsonRequired(passwordlessStart))
    router.HandleFunc("GET", "/api/passwordless/verify_redirect", passwordlessVerifyRedirect)
    router.Handle("GET", "/api/auth_user", authRequired(getAuthUser))

    addr := fmt.Sprintf(":%d", config.port)
    log.Printf("starting server at %s \n", config.appURL)
    log.Fatalf("could not start server: %v\n", http.ListenAndServe(addr, router))
}

```

首先，打开数据库连接。记得要加载驱动。

```
import (
    _ "github.com/lib/pq"
)

```

然后，我们创建路由器并定义一些端点。对于无密码流程来说，我们使用两个端点：`/api/passwordless/start` 发送魔法链接，和 `/api/passwordless/verify_redirect` 用 JWT 响应。

最后，我们启动服务器。

你可以创建空处理程序和中间件去测试服务器启动。

```
func createUser(w http.ResponseWriter, r *http.Request) {
    http.Error(w, http.StatusText(http.StatusNotImplemented), http.StatusNotImplemented)
}

func passwordlessStart(w http.ResponseWriter, r *http.Request) {
    http.Error(w, http.StatusText(http.StatusNotImplemented), http.StatusNotImplemented)
}

func passwordlessVerifyRedirect(w http.ResponseWriter, r *http.Request) {
    http.Error(w, http.StatusText(http.StatusNotImplemented), http.StatusNotImplemented)
}

func getAuthUser(w http.ResponseWriter, r *http.Request) {
    http.Error(w, http.StatusText(http.StatusNotImplemented), http.StatusNotImplemented)
}

func jsonRequired(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        next(w, r)
    }
}

func authRequired(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        next(w, r)
    }
}

```

接下来：

```
go build
./passwordless-demo

```

我们在目录中有了一个 “passwordless-demo”，但是你的目录中可能与示例不一样，`go build` 将创建一个同名的可执行文件。如果你没有关闭前面的 cockroach 节点，并且你正确配置了 `SMTP_USERNAME` 和 `SMTP_PASSWORD` 变量，你将看到命令 `starting server at http://localhost/ ` 没有错误输出。

#### 请求 JSON 的中间件

端点需要从请求体中解码 JSON，因此要确保请求是 `application/json` 类型。因为它是一个通用的东西，我将它解耦到中间件。

```
func jsonRequired(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        ct := r.Header.Get("Content-Type")
        isJSON := strings.HasPrefix(ct, "application/json")
        if !isJSON {
            respondJSON(w, "JSON body required", http.StatusUnsupportedMediaType)
            return
        }
        next(w, r)
    }
}

```

实现很容易。首先它从请求头中获得内容的类型，然后检查它是否是以 “application/json” 开始，如果不是则以 `415 Unsupported Media Type` 提前返回。

#### 响应 JSON 的函数

以 JSON 响应是非常通用的做法，因此我把它提取到函数中。

```
func respondJSON(w http.ResponseWriter, payload interface{}, code int) {
    switch value := payload.(type) {
    case string:
        payload = map[string]string{"message": value}
    case int:
        payload = map[string]int{"value": value}
    case bool:
        payload = map[string]bool{"result": value}
    }
    b, err := json.Marshal(payload)
    if err != nil {
        respondInternalError(w, fmt.Errorf("could not marshal response payload: %v", err))
        return
    }
    w.Header().Set("Content-Type", "application/json; charset=utf-8")
    w.WriteHeader(code)
    w.Write(b)
}

```

首先，对原始类型做一个类型判断，并将它们封装到一个 `map`。然后将它们编组到 JSON，设置响应内容类型和状态码，并写 JSON。如果 JSON 编组失败，则响应一个内部错误。

#### 响应内部错误的函数

`respondInternalError` 是一个响应 `500 Internal Server Error` 的函数，但是也同时将错误输出到控制台。

```
func respondInternalError(w http.ResponseWriter, err error) {
    log.Println(err)
    respondJSON(w,
        http.StatusText(http.StatusInternalServerError),
        http.StatusInternalServerError)
}

```

#### 创建用户的处理程序

下面开始编写 `createUser` 处理程序，因为它非常容易并且是 REST 式的。

```
type User struct {
    ID       string `json:"id"`
    Email    string `json:"email"`
    Username string `json:"username"`
}

```

`User` 类型和 `users` 表相似。

```
var (
    rxEmail = regexp.MustCompile("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")
    rxUsername = regexp.MustCompile("^[a-zA-Z][\\w|-]{1,17}$")
)

```

这些正则表达式是分别用于去验证电子邮件和用户名的。这些都很简单，可以根据你的需要随意去适配。

现在，在 `createUser` 函数内部，我们将开始解码请求体。

```
var user User
if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
    respondJSON(w, err.Error(), http.StatusBadRequest)
    return
}
defer r.Body.Close()

```

我们将使用请求体去创建一个 JSON 解码器来解码出一个用户指针。如果发生错误则返回一个 `400 Bad Request`。不要忘记关闭请求体读取器。

```
errs := make(map[string]string)
if user.Email == "" {
    errs["email"] = "Email required"
} else if !rxEmail.MatchString(user.Email) {
    errs["email"] = "Invalid email"
}
if user.Username == "" {
    errs["username"] = "Username required"
} else if !rxUsername.MatchString(user.Username) {
    errs["username"] = "Invalid username"
}
if len(errs) != 0 {
    respondJSON(w, errs, http.StatusUnprocessableEntity)
    return
}

```

这是我如何做验证；一个简单的 `map` 并检查如果 `len(errs) != 0`，则使用 `422 Unprocessable Entity` 去返回。

```
err := db.QueryRowContext(r.Context(), `
    INSERT INTO users (email, username) VALUES ($1, $2)
    RETURNING id
`, user.Email, user.Username).Scan(&user.ID)

if errPq, ok := err.(*pq.Error); ok && errPq.Code.Name() == "unique_violation" {
    if strings.Contains(errPq.Error(), "email") {
        errs["email"] = "Email taken"
    } else {
        errs["username"] = "Username taken"
    }
    respondJSON(w, errs, http.StatusForbidden)
    return
} else if err != nil {
    respondInternalError(w, fmt.Errorf("could not insert user: %v", err))
    return
}

```

这个 SQL 查询使用一个给定的 email 和用户名去插入一个新用户，并返回自动生成的 id，每个 `$` 将被接下来传递给 `QueryRowContext` 的参数替换掉。

因为 `users` 表在 `email` 和 `username` 字段上有唯一性约束，因此我将检查 “unique_violation” 错误并返回 `403 Forbidden` 或者返回一个内部错误。

```
respondJSON(w, user, http.StatusCreated)

```

最后使用创建的用户去响应。

#### 无密码验证开始部分的处理程序

```
type PasswordlessStartRequest struct {
    Email       string `json:"email"`
    RedirectURI string `json:"redirectUri"`
}

```

这个结构体含有 `passwordlessStart` 的请求体：希望去登入的用户 email、来自客户端的重定向 URI（这个应用中将使用我们的 API）如：`https://frontend.app/callback`。

```
var magicLinkTmpl = template.Must(template.ParseFiles("templates/magic-link.html"))

```

我们将使用 golang 模板引擎去构建邮件，因此需要你在 `templates` 目录中，用如下的内容创建一个 `magic-link.html` 文件：

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Magic Link</title>
</head>
<body>
    Click <a href="{{ .MagicLink }}" target="_blank">here</a> to login.
    <br>
    <em>This link expires in 15 minutes and can only be used once.</em>
</body>
</html>

```

这个模板是给用户发送魔法链接邮件用的。你可以根据你的需要去随意调整它。

现在， 进入 `passwordlessStart` 函数内部：

```
var input PasswordlessStartRequest
if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
    respondJSON(w, err.Error(), http.StatusBadRequest)
    return
}
defer r.Body.Close()

```

首先，我们像前面一样解码请求体。

```
errs := make(map[string]string)
if input.Email == "" {
    errs["email"] = "Email required"
} else if !rxEmail.MatchString(input.Email) {
    errs["email"] = "Invalid email"
}
if input.RedirectURI == "" {
    errs["redirectUri"] = "Redirect URI required"
} else if u, err := url.Parse(input.RedirectURI); err != nil || !u.IsAbs() {
    errs["redirectUri"] = "Invalid redirect URI"
}
if len(errs) != 0 {
    respondJSON(w, errs, http.StatusUnprocessableEntity)
    return
}

```

我们使用 golang 的 URL 解析器去验证重定向 URI，检查那个 URI 是否为绝对地址。

```
var verificationCode string
err := db.QueryRowContext(r.Context(), `
    INSERT INTO verification_codes (user_id) VALUES
        ((SELECT id FROM users WHERE email = $1))
    RETURNING id
`, input.Email).Scan(&verificationCode)
if errPq, ok := err.(*pq.Error); ok && errPq.Code.Name() == "not_null_violation" {
    respondJSON(w, "No user found with that email", http.StatusNotFound)
    return
} else if err != nil {
    respondInternalError(w, fmt.Errorf("could not insert verification code: %v", err))
    return
}

```

这个 SQL 查询将插入一个验证代码，这个代码通过给定的 email 关联到用户，并且返回一个自动生成的 id。因为有可能会出现用户不存在的情况，那样的话子查询可能解析为 `NULL`，这将导致在 `user_id` 字段上因违反 `NOT NULL` 约束而导致失败，因此需要对这种情况进行检查，如果用户不存在，则返回 `404 Not Found` 或者一个内部错误。

```
q := make(url.Values)
q.Set("verification_code", verificationCode)
q.Set("redirect_uri", input.RedirectURI)
magicLink := *config.appURL
magicLink.Path = "/api/passwordless/verify_redirect"
magicLink.RawQuery = q.Encode()

```

现在，构建魔法链接并设置查询字符串中的 `verification_code` 和 `redirect_uri` 的值。如：`http://localhost/api/passwordless/verify_redirect?verification_code=some_code&redirect_uri=https://frontend.app/callback`。

```
var body bytes.Buffer
data := map[string]string{"MagicLink": magicLink.String()}
if err := magicLinkTmpl.Execute(&body, data); err != nil {
    respondInternalError(w, fmt.Errorf("could not execute magic link template: %v", err))
    return
}

```

我们将得到的魔法链接模板的内容保存到缓冲区中。如果发生错误则返回一个内部错误。

```
to := mail.Address{Address: input.Email}
if err := sendMail(to, "Magic Link", body.String()); err != nil {
    respondInternalError(w, fmt.Errorf("could not mail magic link: %v", err))
    return
}

```

现在来写给用户发邮件的 `sendMail` 函数。如果发生错误则返回一个内部错误。

```
w.WriteHeader(http.StatusNoContent)

```

最后，设置响应状态码为 `204 No Content`。对于成功的状态码，客户端不需要很多数据。

#### 发送邮件函数

```
func sendMail(to mail.Address, subject, body string) error {
    from := mail.Address{
        Name:    "Passwordless Demo",
        Address: "noreply@" + config.appURL.Host,
    }
    headers := map[string]string{
        "From":         from.String(),
        "To":           to.String(),
        "Subject":      subject,
        "Content-Type": `text/html; charset="utf-8"`,
    }
    msg := ""
    for k, v := range headers {
        msg += fmt.Sprintf("%s: %s\r\n", k, v)
    }
    msg += "\r\n"
    msg += body

    return smtp.SendMail(
        config.smtpAddr,
        config.smtpAuth,
        from.Address,
        []string{to.Address},
        []byte(msg))
}

```

这个函数创建一个基本的 HTML 邮件结构体并使用 SMTP 服务器去发送它。邮件的内容你可以随意定制，我喜欢使用比较简单的内容。

#### 无密码验证重定向的处理程序

```
var rxUUID = regexp.MustCompile("^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$")

```

首先，这个正则表达式去验证一个 UUID（即验证代码）。

现在进入 `passwordlessVerifyRedirect` 函数内部：

```
q := r.URL.Query()
verificationCode := q.Get("verification_code")
redirectURI := q.Get("redirect_uri")

```

`/api/passwordless/verify_redirect` 是一个 `GET` 端点，以便于我们从查询字符串中读取数据。

```
errs := make(map[string]string)
if verificationCode == "" {
    errs["verification_code"] = "Verification code required"
} else if !rxUUID.MatchString(verificationCode) {
    errs["verification_code"] = "Invalid verification code"
}
var callback *url.URL
var err error
if redirectURI == "" {
    errs["redirect_uri"] = "Redirect URI required"
} else if callback, err = url.Parse(redirectURI); err != nil || !callback.IsAbs() {
    errs["redirect_uri"] = "Invalid redirect URI"
}
if len(errs) != 0 {
    respondJSON(w, errs, http.StatusUnprocessableEntity)
    return
}

```

类似的验证，我们保存解析后的重定向 URI 到一个 `callback` 变量中。

```
var userID string
if err := db.QueryRowContext(r.Context(), `
    DELETE FROM verification_codes
    WHERE id = $1
        AND created_at >= now() - INTERVAL '15m'
    RETURNING user_id
`, verificationCode).Scan(&userID); err == sql.ErrNoRows {
    respondJSON(w, "Link expired or already used", http.StatusBadRequest)
    return
} else if err != nil {
    respondInternalError(w, fmt.Errorf("could not delete verification code: %v", err))
    return
}

```

这个 SQL 查询通过给定的 id 去删除相应的验证代码，并且确保它创建之后时间不超过 15 分钟，它也返回关联的 `user_id`。如果没有检索到内容，意味着代码不存在或者已过期，我们返回一个响应信息，否则就返回一个内部错误。

```
expiresAt := time.Now().Add(time.Hour * 24 * 60)
tokenString, err := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.StandardClaims{
    Subject:   userID,
    ExpiresAt: expiresAt.Unix(),
}).SignedString(config.jwtKey)
if err != nil {
    respondInternalError(w, fmt.Errorf("could not create JWT: %v", err))
    return
}

```

这些是如何去创建 JWT。我们为 JWT 设置一个 60 天的过期值，你也可以设置更短的时间（大约 2 周），并添加一个新端点去刷新令牌，但是不要搞的过于复杂。

```
expiresAtB, err := expiresAt.MarshalText()
if err != nil {
    respondInternalError(w, fmt.Errorf("could not marshal expiration date: %v", err))
    return
}
f := make(url.Values)
f.Set("jwt", tokenString)
f.Set("expires_at", string(expiresAtB))
callback.Fragment = f.Encode()

```

我们去规划重定向；你可使用查询字符串去添加 JWT，但是更常见的是使用一个哈希片段。如：`https://frontend.app/callback#jwt=token_here&expires_at=some_date`.

过期日期可以从 JWT 中提取出来，但是这样做的话，就需要在客户端上实现一个 JWT 库来解码它，因此为了简化，我将它加到这里。

```
http.Redirect(w, r, callback.String(), http.StatusFound)

```

最后我们使用一个 `302 Found` 重定向。

* * *

无密码的流程已经完成。现在需要去写 `getAuthUser` 端点的代码了，它用于获取当前验证用户的信息。你应该还记得，这个端点使用了 `guard` 中间件。

#### 使用 Auth 中间件

在编写 `guard` 中间件之前，我将编写一个不需要验证的分支。目的是，如果没有传递 JWT，它将不去验证用户。

```
type ContextKey struct {
    Name string
}

var keyAuthUserID = ContextKey{"auth_user_id"}

func withAuth(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        a := r.Header.Get("Authorization")
        hasToken := strings.HasPrefix(a, "Bearer ")
        if !hasToken {
            next(w, r)
            return
        }
        tokenString := a[7:]

        p := jwt.Parser{ValidMethods: []string{jwt.SigningMethodHS256.Name}}
        token, err := p.ParseWithClaims(
            tokenString,
            &jwt.StandardClaims{},
            func (*jwt.Token) (interface{}, error) { return config.jwtKey, nil },
        )
        if err != nil {
            respondJSON(w, http.StatusText(http.StatusUnauthorized), http.StatusUnauthorized)
            return
        }

        claims, ok := token.Claims.(*jwt.StandardClaims)
        if !ok || !token.Valid {
            respondJSON(w, http.StatusText(http.StatusUnauthorized), http.StatusUnauthorized)
            return
        }

        ctx := r.Context()
        ctx = context.WithValue(ctx, keyAuthUserID, claims.Subject)

        next(w, r.WithContext(ctx))
    }
}
```

JWT 将在每次请求时以 `Bearer <token_here>` 格式包含在 `Authorization` 头中。因此，如果没有提供令牌，我们将直接通过，进入接下来的中间件。

我们创建一个解析器来解析令牌。如果解析失败则返回 `401 Unauthorized`。

然后我们从 JWT 中提取出要求的内容，并添加 `Subject`（就是用户 ID）到需要的地方。

#### Guard 中间件

```
func guard(next http.HandlerFunc) http.HandlerFunc {
    return withAuth(func(w http.ResponseWriter, r *http.Request) {
        _, ok := r.Context().Value(keyAuthUserID).(string)
        if !ok {
            respondJSON(w, http.StatusText(http.StatusUnauthorized), http.StatusUnauthorized)
            return
        }
        next(w, r)
    })
}
```

现在，`guard` 将使用 `withAuth` 并从请求内容中提取出验证用户的 ID。如果提取失败，它将返回 `401 Unauthorized`，提取成功则继续下一步。

#### 获取 Auth 用户

在 `getAuthUser` 处理程序内部：

```
ctx := r.Context()
authUserID := ctx.Value(keyAuthUserID).(string)

user, err := fetchUser(ctx, authUserID)
if err == sql.ErrNoRows {
    respondJSON(w, http.StatusText(http.StatusTeapot), http.StatusTeapot)
    return
} else if err != nil {
    respondInternalError(w, fmt.Errorf("could not query auth user: %v", err))
    return
}

respondJSON(w, user, http.StatusOK)

```

首先，我们从请求内容中提取验证用户的 ID，我们使用这个 ID 去获取用户。如果没有获取到内容，则发送一个 `418 I'm a teapot`，或者一个内部错误。最后，我们将用这个用户去响应。

#### 获取 User 函数

下面你看到的是 `fetchUser` 函数。

```
func fetchUser(ctx context.Context, id string) (User, error) {
    user := User{ID: id}
    err := db.QueryRowContext(ctx, `
        SELECT email, username FROM users WHERE id = $1
    `, id).Scan(&user.Email, &user.Username)
    return user, err
}

```

我将它解耦是因为通过 ID 来获取用户是个常做的事。

* * *

以上就是全部的代码。你可以自己去构建它和测试它。[这里][9] 还有一个 demo 你可以试用一下。

如果你在 mailtrap 上点击之后出现有关 `脚本运行被拦截，因为文档的框架是沙箱化的，并且没有设置 'allow-scripts' 权限` 的问题，你可以尝试右键点击 “在新标签中打开链接“。这样做是安全的，因为邮件内容是 [沙箱化的][10]。我在 `localhost` 上有时也会出现这个问题，但是我认为你一旦以 `https://` 方式部署到服务器上应该不会出现这个问题了。

如果有任何问题，请在我的 [GitHub repo][11] 留言或者提交 PRs 

以后，我为这个 API 写了一个客户端作为这篇文章的[第二部分][13]。

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/passwordless-auth-server/

作者：[Nicolás Parada][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://nicolasparada.netlify.com/
[1]:https://www.cockroachlabs.com/
[2]:https://mailtrap.io/
[3]:https://github.com/lib/pq
[4]:https://github.com/matryer/way
[5]:https://github.com/dgrijalva/jwt-go
[6]:https://golang.org/
[7]:https://golang.org/dl/
[8]:https://www.cockroachlabs.com/docs/stable/install-cockroachdb.html
[9]:https://go-passwordless-demo.herokuapp.com/
[10]:https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox
[11]:https://github.com/nicolasparada/go-passwordless-demo
[12]:https://twitter.com/intent/retweet?tweet_id=986602458716803074
[13]:https://nicolasparada.netlify.com/posts/passwordless-auth-client/