[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a Messenger App: Development Login)
[#]: via: (https://nicolasparada.netlify.com/posts/go-messenger-dev-login/)
[#]: author: (Nicolás Parada https://nicolasparada.netlify.com/)

Building a Messenger App: Development Login
======

This post is the 6th on a series:

  * [Part 1: Schema][1]
  * [Part 2: OAuth][2]
  * [Part 3: Conversations][3]
  * [Part 4: Messages][4]
  * [Part 5: Realtime Messages][5]



We already implemented login through GitHub, but if we want to play around with the app, we need a couple of users to test it. In this post we’ll add an endpoint to login as any user just giving an username. This endpoint will be just for development.

Start by adding this route in the `main()` function.

```
router.HandleFunc("POST", "/api/login", requireJSON(login))
```

### Login

This function handles POST requests to `/api/login` with a JSON body with just an username and returns the authenticated user, a token and expiration date of it in JSON format.

```
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

First it checks we are on localhost or it responds with `404 Not Found`. It decodes the body skipping validation since this is just for development. Then it queries to the database for a user with the given username, if none is found, it returns with `404 Not Found`. Then it issues a new JSON web token using the user ID as Subject.

```
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

The function does the same we did [previously][2]. I just moved it to reuse code.

After creating the token, it responds with the user, token and expiration date.

### Seed Users

Now you can add users to play with to the database.

```
INSERT INTO users (id, username) VALUES
    (1, 'john'),
    (2, 'jane');
```

You can save it to a file and pipe it to the Cockroach CLI.

```
cat seed_users.sql | cockroach sql --insecure -d messenger
```

* * *

That’s it. Once you deploy the code to production and use your own domain this login function won’t be available.

This post concludes the backend.

[Souce Code][6]

--------------------------------------------------------------------------------

via: https://nicolasparada.netlify.com/posts/go-messenger-dev-login/

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
[6]: https://github.com/nicolasparada/go-messenger-demo
