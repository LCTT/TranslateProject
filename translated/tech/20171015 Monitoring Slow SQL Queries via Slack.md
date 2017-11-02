通过 Slack 监视慢 SQL 查询 
==============

> 一个获得关于慢查询、意外错误和其它重要日志通知的简单 Go 秘诀。

![](https://c1.staticflickr.com/5/4466/37053205213_2ee912141c_b.jpg)

我的 Slack bot 提示我一个运行了很长时间 SQL 查询。我应该尽快解决它。

**我们不能管理我们无法去测量的东西。**每个后台应用程序都需要我们去监视它在数据库上的性能。如果一个特定的查询随着数据量增长变慢，你必须在它变得太慢之前去优化它。

由于 Slack 已经成为我们工作的中心，它也在改变我们监视系统的方式。 虽然我们已经有非常不错的监视工具，如果在系统中任何东西有正在恶化的趋势，让 Slack 机器人告诉我们，也是非常棒的主意。比如，一个太长时间才完成的 SQL 查询，或者，在一个特定的 Go 包中发生一个致命的错误。

在这篇博客文章中，我们将告诉你，通过使用已经支持这些特性的[一个简单的日志系统][8] 和 [一个已存在的数据库库（database library）][9] 怎么去设置来达到这个目的。

### 使用记录器

[logger][10] 是一个为 Go 库和应用程序使用设计的小型库。在这个例子中我们使用了它的三个重要的特性：

*   它为测量性能提供了一个简单的定时器。
*   支持复杂的输出过滤器，因此，你可以从指定的包中选择日志。例如，你可以告诉记录器仅从数据库包中输出，并且仅输出超过 500 ms 的定时器日志。
*   它有一个 Slack 钩子，因此，你可以过滤并将日志输入到 Slack。

让我们看一下在这个例子中，怎么去使用定时器，稍后我们也将去使用过滤器：

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

运行这个程序没有输出：

```
$ go run example-01.go
Bye
```

记录器是[缺省静默的][11]，因此，它可以在库的内部使用。我们简单地通过一个环境变量去查看日志：

例如：

```
$ LOG=database@timer go run example-01.go
01:08:54.997 database(250.095587ms): Connected to database.
Bye
```

上面的示例我们使用了 `database@timer` 过滤器去查看 `database` 包中输出的定时器日志。你也可以试一下其它的过滤器，比如：

*   `LOG=*`: 所有日志
*   `LOG=users@error,database`: 所有来自 `users` 的错误日志，所有来自 `database` 的所有日志
*   `LOG=*@timer,database@info`: 来自所有包的定时器日志和错误日志，以及来自 `database` 的所有日志
*   `LOG=*,users@mute`: 除了 `users` 之外的所有日志

### 发送日志到 Slack

控制台日志是用于开发环境的，但是我们需要产品提供一个友好的界面。感谢 [slack-hook][12]， 我们可以很容易地在上面的示例中，使用 Slack 去整合它：

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

我们来解释一下，在上面的示例中我们做了什么：

*   行 #5: 设置入站 webhook url。这个 URL [链接在这里][1]。
*   行 #6: 选择流日志的入口通道。
*   行 #7: 显示的发送者的用户名。
*   行 #11: 使用流过滤器，仅输出时间超过 200 ms 的定时器日志。

希望这个示例能给你提供一个大概的思路。如果你有更多的问题，去看这个 [记录器][13]的文档。

### 一个真实的示例： CRUD

[crud][14] 是一个用于 Go 的数据库的 ORM 式的类库，它有一个隐藏特性是内部日志系统使用 [logger][15] 。这可以让我们很容易地去监视正在运行的 SQL 查询。

#### 查询

这有一个通过给定的 e-mail 去返回用户名的简单查询：

```
func GetUserNameByEmail (email string) (string, error) {
  var name string
  if err := DB.Read(&name, "SELECT name FROM user WHERE email=?", email); err != nil {
    return "", err
  }

  return name, nil
}
```

好吧，这个太短了， 感觉好像缺少了什么，让我们增加全部的上下文：

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

因此，我们有一个通过环境变量 `DATABASE_URL` 连接到 MySQL 数据库的 [crud][16] 实例。如果我们运行这个程序，将看到有一行输出：

```
$ DATABASE_URL=root:123456@/testdb go run example.go
Your username is: azer
```

正如我前面提到的，日志是 [缺省静默的][17]。让我们看一下 crud 的内部日志：

```
$ LOG=crud go run example.go
22:56:29.691 crud(0): SQL Query Executed: SELECT username FROM user WHERE email='foo@bar.com'
Your username is: azer
```

这很简单，并且足够我们去查看在我们的开发环境中查询是怎么执行的。

#### CRUD 和 Slack 整合

记录器是为配置管理应用程序级的“内部日志系统”而设计的。这意味着，你可以通过在你的应用程序级配置记录器，让 crud 的日志流入 Slack ：

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

在上面的代码中：

*   我们导入了 [logger][2] 和 [logger-slack-hook][3] 库。
*   我们配置记录器日志流入 Slack。这个配置覆盖了代码库中 [记录器][4] 所有的用法， 包括第三方依赖。
*   我们使用了流过滤器，仅输出 MySQL 包中超过 250 ms 的定时器日志。

这种使用方法可以被扩展，而不仅是慢查询报告。我个人使用它去跟踪指定包中的重要错误， 也用于统计一些类似新用户登入或生成支付的日志。

### 在这篇文章中提到的包

*   [crud][5]
*   [logger][6]
*   [logger-slack-hook][7]

[告诉我们][18] 如果你有任何的问题或建议。

--------------------------------------------------------------------------------

via: http://azer.bike/journal/monitoring-slow-sql-queries-via-slack/

作者：[Azer Koçulu][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

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
