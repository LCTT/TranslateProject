[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12692-1.html)
[#]: subject: (Building a Messenger App: Development Login)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-dev-login/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

构建一个即时消息应用（六）：仅用于开发的登录
======

![](https://img.linux.net.cn/data/attachment/album/202010/07/101437garmhgi9aza9f9fz.jpg)

本文是该系列的第六篇。

  * [第一篇: 模式][1]
  * [第二篇: OAuth][2]
  * [第三篇: 对话][3]
  * [第四篇: 消息][4]
  * [第五篇: 实时消息][5]

我们已经实现了通过 GitHub 登录，但是如果想把玩一下这个 app，我们需要几个用户来测试它。在这篇文章中，我们将添加一个为任何用户提供登录的端点，只需提供用户名即可。该端点仅用于开发。

首先在 `main()` 函数中添加此路由。

```go
router.HandleFunc("POST", "/api/login", requireJSON(login))
```

### 登录

此函数处理对 `/api/login` 的 POST 请求，其中 JSON body 只包含用户名，并以 JSON 格式返回通过认证的用户、令牌和过期日期。

```go
func login(w http.ResponseWriter, r *http.Request) {
    if origin.Hostname() != "localhost" {
        http.NotFound(w, r)
        return
    }

    var input struct {
        Username string `json:"username"`
    }
    if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }
    defer r.Body.Close()

    var user User
    if err := db.QueryRowContext(r.Context(), `
        SELECT id, avatar_url
        FROM users
        WHERE username = $1
    `, input.Username).Scan(
        &user.ID,
        &user.AvatarURL,
    ); err == sql.ErrNoRows {
        http.Error(w, "User not found", http.StatusNotFound)
        return
    } else if err != nil {
        respondError(w, fmt.Errorf("could not query user: %v", err))
        return
    }

    user.Username = input.Username

    exp := time.Now().Add(jwtLifetime)
    token, err := issueToken(user.ID, exp)
    if err != nil {
        respondError(w, fmt.Errorf("could not create token: %v", err))
        return
    }

    respond(w, map[string]interface{}{
        "authUser":  user,
        "token":     token,
        "expiresAt": exp,
    }, http.StatusOK)
}
```

首先，它检查我们是否在本地主机上，或者响应为 `404 Not Found`。它解码主体跳过验证，因为这只是为了开发。然后在数据库中查询给定用户名的用户，如果没有，则返回 `404 NOT Found`。然后，它使用用户 ID 作为主题发布一个新的 JSON Web 令牌。

```go
func issueToken(subject string, exp time.Time) (string, error) {
    token, err := jwtSigner.Encode(jwt.Claims{
        Subject:    subject,
        Expiration: json.Number(strconv.FormatInt(exp.Unix(), 10)),
    })
    if err != nil {
        return "", err
    }
    return string(token), nil
}
```

该函数执行的操作与 [前文][2] 相同。我只是将其移过来以重用代码。

创建令牌后，它将使用用户、令牌和到期日期进行响应。

### 种子用户

现在，你可以将要操作的用户添加到数据库中。

```sql
INSERT INTO users (id, username) VALUES
    (1, 'john'),
    (2, 'jane');
```

你可以将其保存到文件中，并通过管道将其传送到 Cockroach CLI。

```bash
cat seed_users.sql | cockroach sql --insecure -d messenger
```

* * *

就是这样。一旦将代码部署到生产环境并使用自己的域后，该登录功能将不可用。

本文也结束了所有的后端开发部分。

- [源代码][6]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-dev-login/

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
[6]: https://github.com/nicolasparada/go-messenger-demo
