# Monitoring Slow SQL Queries via Slack

### A simple Go recipe for getting notified about slow SQL queries, unexpected errors and other important logs.

My Slack bot notifying me about a SQL query taking long time to execute. I should fix that soon.

We can't manage what we don't measure. Every backend application needs our eyes on the database performance. If a specific query gets slower as the data grows, you have to optimize it before it's too late.

As Slack has became a central to work, it's changing how we monitor our systems, too. Although there are quite nice monitoring tools existing, it's nice to have a Slack bot telling us if there is anything going wrong in the system; an SQL query taking too long to finish for example, or fatal errors in a specific Go package.

In this blog post, I'll tell how we can achieve this setup by using [a simple logging system][8], and [an existing database library][9] that already supports this feature.

Using Logger
============================================================

[logger][10] is a tiny library designed for both Go libraries and applications. It has three important features useful for this case;

*   It provides a simple timer for measuring performance.

*   Supports complex output filters, so you can choose logs from specific packages. For example, you can tell logger to output only from database package, and only the timer logs which took more than 500ms.

*   It has a Slack hook, so you can filter and stream logs into Slack.

Let's look at this example program to see how we use timers, later we'll get to filters, as well:

```
package main

import (
	"github.com/azer/logger"
    "time"
)

var (
  users = logger.New("users")
  database = logger.New("database")
)

func main () {
  users.Info("Hi!")

  timer := database.Timer()
  time.Sleep(time.Millisecond * 250) // sleep 250ms
  timer.End("Connected to database")

  users.Error("Failed to create a new user.", logger.Attrs{
    "e-mail": "foo@bar.com",
  })

  database.Info("Just a random log.")

  fmt.Println("Bye.")
}

```

Running this program will give no output:

```
$ go run example-01.go
Bye

```

Logger is [silent by default][11], so it can be used by libraries internally. We simply pass an environment variable to see the logs:

For example;

```
$ LOG=database@timer go run example-01.go
01:08:54.997 database(250.095587ms): Connected to database.
Bye

```

The above example we used `database@timer` filter to see timer logs from `database` package. You can try different filters such as;

*   `LOG=*`: enables all logs

*   `LOG=users@error,database`: enables errors from `users`, all logs from `database`.

*   `LOG=*@timer,database@info`: enables timer and error logs from all packages, any logs from `database`.

*   `LOG=*,users@mute`: Enables all logs except from `users`.

### Sending Logs to Slack

Logging in console is useful in development environment, but we need a human-friendly interface for production. Thanks to the [slack-hook][12], we can easily integrate the above example with Slack:

```
import (
  "github.com/azer/logger"
  "github.com/azer/logger-slack-hook"
)

func init () {
  logger.Hook(&slackhook.Writer{
    WebHookURL: "https://hooks.slack.com/services/...",
    Channel: "slow-queries",
    Username: "Query Person",
    Filter: func (log *logger.Log) bool {
      return log.Package == "database" && log.Level == "TIMER" && log.Elapsed >= 200
    }
  })
}

```

Let's explain what we've done in the above example:

*   Line #5: Set the incoming webhook url. You can get this URL [here][1].

*   Line #6: Choose the channel to stream the logs into.

*   Line #7: The username that will appear as sender.

*   Line #11: Filter for streaming only timer logs which took longer than 200ms.

Hope this gave you the general idea. Have a look at [logger][13]'s documentation if you got more questions.

# A Real-World Example: CRUD

One of the hidden features of [crud][14] -an ORM-ish database library for Go- is an internal logging system using [logger][15]. This allows us to monitor SQL queries being executed easily.

### Querying

Let's say you have a simple SQL query which returns username by given e-mail:

```
func GetUserNameByEmail (email string) (string, error) {
  var name string
  if err := DB.Read(&name, "SELECT name FROM user WHERE email=?", email); err != nil {
    return "", err
  }

  return name, nil
}

```

Ok, this is too short, feels like something missing here. Let's add the full context:

```
import (
  "github.com/azer/crud"
  _ "github.com/go-sql-driver/mysql"
  "os"
)

var db *crud.DB

func main () {
  var err error

  DB, err = crud.Connect("mysql", os.Getenv("DATABASE_URL"))
  if err != nil {
    panic(err)
  }

  username, err := GetUserNameByEmail("foo@bar.com")
  if err != nil {
    panic(err)
  }

  fmt.Println("Your username is: ", username)
}

```

So we have a [crud][16] instance that connects to the MySQL database passed through env variable `DATABASE_URL`. If we run this program, we'll see one-line output:

```
$ DATABASE_URL=root:123456@/testdb go run example.go
Your username is: azer

```

As I mentioned previously, logs are [silent by default][17]. Let's see internal logs of crud:

```
$ LOG=crud go run example.go
22:56:29.691 crud(0): SQL Query Executed: SELECT username FROM user WHERE email='foo@bar.com'
Your username is: azer

```

This is simple and useful enough for seeing how our queries perform in our development environment.

### CRUD and Slack Integration

Logger is designed for configuring dependencies' internal logging systems from the application level. This means, you can stream crud's logs into Slack by configuring logger in your application level:

```
import (
  "github.com/azer/logger"
  "github.com/azer/logger-slack-hook"
)

func init () {
  logger.Hook(&slackhook.Writer{
    WebHookURL: "https://hooks.slack.com/services/...",
    Channel: "slow-queries",
    Username: "Query Person",
    Filter: func (log *logger.Log) bool {
      return log.Package == "mysql" && log.Level == "TIMER" && log.Elapsed >= 250
    }
  })
}

```

In the above code:

*   We imported [logger][2] and [logger-slack-hook][3] libraries.

*   We configured the logger library to stream some logs into Slack. This configuration covers all usages of [logger][4] in the codebase, including third-party dependencies.

*   We used a filter to stream only timer logs taking longer than 250 in the MySQL package.

This usage can be extended beyond just slow query reports. I personally use it for tracking critical errors in specific packages, also statistical logs like a new user signs up or make payments.

### Packages I mentioned in this post:

*   [crud][5]

*   [logger][6]

*   [logger-slack-hook][7]

[Let me know][18] if you have any questions or comments.

--------------------------------------------------------------------------------

via: http://azer.bike/journal/monitoring-slow-sql-queries-via-slack/

作者：[Azer Koçulu ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://azer.bike/
[1]:https://my.slack.com/services/new/incoming-webhook/
[2]:https://github.com/azer/logger
[3]:https://github.com/azer/logger-slack-hook
[4]:https://github.com/azer/logger
[5]:https://github.com/azer/crud
[6]:https://github.com/azer/logger
[7]:https://github.com/azer/logger
[8]:http://azer.bike/journal/monitoring-slow-sql-queries-via-slack/?utm_source=dbweekly&utm_medium=email#logger
[9]:http://azer.bike/journal/monitoring-slow-sql-queries-via-slack/?utm_source=dbweekly&utm_medium=email#crud
[10]:https://github.com/azer/logger
[11]:http://www.linfo.org/rule_of_silence.html
[12]:https://github.com/azer/logger-slack-hook
[13]:https://github.com/azer/logger
[14]:https://github.com/azer/crud
[15]:https://github.com/azer/logger
[16]:https://github.com/azer/crud
[17]:http://www.linfo.org/rule_of_silence.html
[18]:https://twitter.com/afrikaradyo
