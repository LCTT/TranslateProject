Go 语言日志指南
============================================================

![golang logo](https://logmatic.io/wp-content/uploads/2017/03/golang-logo.png) 

你是否厌烦了那些使用复杂语言编写的、难以部署的、总是在不停构建的解决方案？Golang 是解决这些问题的好方法，它和 C 语言一样快，又和 Python 一样简单。

但是你是如何使用 Golang 日志监控你的应用程序的呢？Golang 没有异常，只有错误。因此你的第一印象可能就是开发 Golang 日志策略并不是一件简单的事情。不支持异常事实上并不是什么问题，异常在很多编程语言中已经失去了其异常性：它们过于被滥用以至于它们的作用都被忽视了。

在进一步深入之前，我们首先会介绍 Golang 日志的基础，并讨论 Golang 日志标准、元数据意义、以及最小化 Golang 日志对性能的影响。通过日志，你可以追踪用户在你应用中的活动，快速识别你项目中失效的组件，并监控总体性能以及用户体验。

### I. Golang 日志基础

#### 1) 使用 Golang “log” 库

Golang 给你提供了一个称为 “log” 的原生[日志库][3] 。它的日志器完美适用于追踪简单的活动，例如通过使用可用的[选项][4]在错误信息之前添加一个时间戳。

下面是一个 Golang 中如何记录错误日志的简单例子：

```
package main

import (
	"log"
	"errors"
	"fmt"
	)

func main() {
   /* 定义局部变量 */
  ...

   /* 除法函数，除以 0 的时候会返回错误 */
   ret,err = div(a, b)
if err != nil {
 log.Fatal(err)
	}
	fmt.Println(ret)
}
```

如果你尝试除以 0，你就会得到类似下面的结果：

![golang 代码](https://logmatic.io/wp-content/uploads/2017/03/golang-code.png) 

为了快速测试一个 Golang 函数，你可以使用 [go playground][5]。

为了确保你的日志总是能轻易访问，我们建议你把它们写到一个文件：

```
package main
import (
        "log"
        "os"
)
func main() {
        // 按照所需读写权限创建文件
        f, err := os.OpenFile("filename", os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0644)
        if err != nil {
                log.Fatal(err)
        }   
        // 完成后延迟关闭，而不是习惯!
        defer f.Close()
        //设置日志输出到 f
        log.SetOutput(f)
        //测试用例
        log.Println("check to make sure it works")
}
```

你可以在[这里][6]找到 Golang 日志的完整指南，以及 “log” [库][7]内可用函数的完整列表。

现在你就可以记录它们的错误以及根本原因啦。

另外，日志也可以帮你将活动流拼接在一起，查找需要修复的错误上下文，或者调查在你的系统中单个请求如何影响其它应用层和 API。

为了获得更好的日志效果，你首先需要在你的项目中使用尽可能多的上下文丰富你的 Golang 日志，并标准化你使用的格式。这就是 Golang 原生库能达到的极限。使用最广泛的库是 [glog][8] 和 [logrus][9]。必须承认还有很多好的库可以使用。如果你已经在使用支持 JSON 格式的库，你就不需要再换其它库了，后面我们会解释。

### II. 为你 Golang 日志统一格式

#### 1) JSON 格式的结构优势

在一个项目或者多个微服务中结构化你的 Golang 日志可能是最困难的事情，但一旦完成就很轻松了。结构化你的日志能使机器可读（参考我们 [收集日志的最佳实践博文][10]）。灵活性和层级是 JSON 格式的核心，因此信息能够轻易被人类和机器解析以及处理。

下面是一个使用 [Logrus/Logmatic.io][11] 如何用 JSON 格式记录日志的例子：

```
package main
import (
  log "github.com/Sirupsen/logrus"
  "github.com/logmatic/logmatic-go"
)
func main() {
    // 使用 JSONFormatter
    log.SetFormatter(&logmatic.JSONFormatter{})
        // 使用 logrus 像往常那样记录事件
    log.WithFields(log.Fields{"string": "foo", "int": 1, "float": 1.1 }).Info("My first ssl event from golang")
}
```

会输出结果：

```
{	
    "date":"2016-05-09T10:56:00+02:00",
    "float":1.1,
    "int":1,
    "level":"info",
    "message":"My first ssl event from golang",
    "String":"foo"
}
```

#### 2) 标准化 Golang 日志

同一个错误出现在你代码的不同部分，却以不同形式被记录下来是一件可耻的事情。下面是一个由于一个变量错误导致无法确定 web 页面加载状态的例子。一个开发者日志格式是：

```
message: 'unknown error: cannot determine loading status from unknown error: missing or invalid arg value client'</span>
```

另一个人的格式却是：

```
unknown error: cannot determine loading status - invalid client</span>
```

强制日志标准化的一个好的解决办法是在你的代码和日志库之间创建一个接口。这个标准化接口会包括所有你想添加到你日志中的可能行为的预定义日志消息。这么做可以防止出现不符合你想要的标准格式的自定义日志信息。这么做也便于日志调查。

![接口函数](https://logmatic.io/wp-content/uploads/2017/03/functions-interface.png) 

由于日志格式都被统一处理，使它们保持更新也变得更加简单。如果出现了一种新的错误类型，它只需要被添加到一个接口，这样每个组员都会使用完全相同的信息。

最常使用的简单例子就是在 Golang 日志信息前面添加日志器名称和 id。你的代码然后就会发送 “事件” 到你的标准化接口，它会继续讲它们转化为 Golang 日志消息。

```
// 主要部分，我们会在这里定义所有消息。
// Event 结构体很简单。为了当所有信息都被记录时能检索它们，
// 我们维护了一个 Id
var (
	invalidArgMessage = Event{1, "Invalid arg: %s"}
	invalidArgValueMessage = Event{2, "Invalid arg value: %s => %v"}
	missingArgMessage = Event{3, "Missing arg: %s"}
)

// 在我们应用程序中可以使用的所有日志事件
func (l *Logger)InvalidArg(name string) {
	l.entry.Errorf(invalidArgMessage.toString(), name)
}
func (l *Logger)InvalidArgValue(name string, value interface{}) {
	l.entry.WithField("arg." + name, value).Errorf(invalidArgValueMessage.toString(), name, value)
}
func (l *Logger)MissingArg(name string) {
	l.entry.Errorf(missingArgMessage.toString(), name)
}
```

因此如果我们使用前面例子中无效的参数值，我们就会得到相似的日志信息：

```
time="2017-02-24T23:12:31+01:00" level=error msg="LoadPageLogger00003 - Missing arg: client - cannot determine loading status" arg.client=<nil> logger.name=LoadPageLogger
```

JSON 格式如下：

```
{"arg.client":null,"level":"error","logger.name":"LoadPageLogger","msg":"LoadPageLogger00003 - Missing arg: client - cannot determine loading status", "time":"2017-02-24T23:14:28+01:00"}
```

### III. Golang 日志上下文的力量

现在 Golang 日志已经按照特定结构和标准格式记录，时间会决定需要添加哪些上下文以及相关信息。为了能从你的日志中抽取信息，例如追踪一个用户活动或者工作流，上下文和元数据的顺序非常重要。

例如在 logrus 库中可以按照下面这样使用 JSON 格式添加 `hostname`、`appname` 和 `session` 参数：

```
// 对于元数据，通常做法是通过复用来重用日志语句中的字段。
  contextualizedLog := log.WithFields(log.Fields{
    "hostname": "staging-1",
    "appname": "foo-app",
    "session": "1ce3f6v"
  })
contextualizedLog.Info("Simple event with global metadata")
```

元数据可以视为 javascript 片段。为了更好地说明它们有多么重要，让我们看看几个 Golang 微服务中元数据的使用。你会清楚地看到是怎么在你的应用程序中跟踪用户的。这是因为你不仅需要知道一个错误发生了，还要知道是哪个实例以及什么模式导致了错误。假设我们有两个按顺序调用的微服务。上下文信息保存在头部（header）中传输：

```
func helloMicroService1(w http.ResponseWriter, r *http.Request) {
client := &http.Client{}
// 该服务负责接收所有到来的用户请求
// 我们会检查是否是一个新的会话还是已有会话的另一次调用
session := r.Header.Get("x-session")
if ( session == "") {
session = generateSessionId()
// 为新会话记录日志
}
// 每个请求的 Track Id 都是唯一的，因此我们会为每个会话生成一个
track := generateTrackId()
// 调用你的第二个微服务，添加 session/track
reqService2, _ := http.NewRequest("GET", "http://localhost:8082/", nil)
reqService2.Header.Add("x-session", session)
reqService2.Header.Add("x-track", track)
resService2, _ := client.Do(reqService2)
….
```

当调用第二个服务时：

```
func helloMicroService2(w http.ResponseWriter, r *http.Request) {
// 类似之前的微服务，我们检查会话并生成新的 track
session := r.Header.Get("x-session")
track := generateTrackId()
// 这一次，我们检查请求中是否已经设置了一个 track id，
// 如果是，它变为父 track
parent := r.Header.Get("x-track")
if (session == "") {
w.Header().Set("x-parent", parent)
}
// 为响应添加 meta 信息
w.Header().Set("x-session", session)
w.Header().Set("x-track", track)
if (parent == "") {
w.Header().Set("x-parent", track)
}
// 填充响应
w.WriteHeader(http.StatusOK)
io.WriteString(w, fmt.Sprintf(aResponseMessage, 2, session, track, parent))
}
```

现在第二个微服务中已经有和初始查询相关的上下文和信息，一个 JSON 格式的日志消息看起来类似如下。

在第一个微服务：

```
{"appname":"go-logging","level":"debug","msg":"hello from ms 1","session":"eUBrVfdw","time":"2017-03-02T15:29:26+01:00","track":"UzWHRihF"}
```

在第二个微服务：

```
{"appname":"go-logging","level":"debug","msg":"hello from ms 2","parent":"UzWHRihF","session":"eUBrVfdw","time":"2017-03-02T15:29:26+01:00","track":"DPRHBMuE"}
```

如果在第二个微服务中出现了错误，多亏了 Golang 日志中保存的上下文信息，现在我们就可以确定它是怎样被调用的以及什么模式导致了这个错误。

如果你想进一步深挖 Golang 的追踪能力，这里还有一些库提供了追踪功能，例如 [Opentracing][12]。这个库提供了一种简单的方式在或复杂或简单的架构中添加追踪的实现。它通过不同步骤允许你追踪用户的查询，就像下面这样：

![客户端事务](https://logmatic.io/wp-content/uploads/2017/03/client-transaction.png) 

### IV. Golang 日志对性能的影响

#### 1) 不要在 Goroutine 中使用日志

在每个 goroutine 中创建一个新的日志器看起来很诱人。但最好别这么做。Goroutine 是一个轻量级线程管理器，它用于完成一个 “简单的” 任务。因此它不应该负责日志。它可能导致并发问题，因为在每个 goroutine 中使用 `log.New()` 会重复接口，所有日志器会并发尝试访问同一个 io.Writer。

为了限制对性能的影响以及避免并发调用 io.Writer，库通常使用一个特定的 goroutine 用于日志输出。

#### 2) 使用异步库

尽管有很多可用的 Golang 日志库，要注意它们中的大部分都是同步的（事实上是伪异步）。原因很可能是到现在为止它们中没有一个会由于日志严重影响性能。

但正如 Kjell Hedström 在[他的实验][13]中展示的，使用多个线程创建成千上万日志，即便是在最坏情况下，异步 Golang 日志也会有 40% 的性能提升。因此日志是有开销的，也会对你的应用程序性能产生影响。如果你并不需要处理大量的日志，使用伪异步 Golang 日志库可能就足够了。但如果你需要处理大量的日志，或者很关注性能，Kjell Hedström 的异步解决方案就很有趣（尽管事实上你可能需要进一步开发，因为它只包括了最小的功能需求）。

#### 3）使用严重等级管理 Golang 日志

一些日志库允许你启用或停用特定的日志器，这可能会派上用场。例如在生产环境中你可能不需要一些特定等级的日志。下面是一个如何在 glog 库中停用日志器的例子，其中日志器被定义为布尔值：

```
type Log bool
func (l Log) Println(args ...interface{}) {
    fmt.Println(args...)
}
var debug Log = false
if debug {
    debug.Println("DEBUGGING")
}
```

然后你就可以在配置文件中定义这些布尔参数来启用或者停用日志器。

没有一个好的 Golang 日志策略，Golang 日志可能开销很大。开发人员应该抵制记录几乎所有事情的诱惑 - 尽管它非常有趣！如果日志的目的是为了获取尽可能多的信息，为了避免包含无用元素的日志的白噪音，必须正确使用日志。

### V. 集中化 Golang 日志

![集中化 go 日志](https://logmatic.io/wp-content/uploads/2017/03/source-selector-1024x460-1.png) 

如果你的应用程序是部署在多台服务器上的，这样可以避免为了调查一个现象需要连接到每一台服务器的麻烦。日志集中确实有用。

使用日志装箱工具，例如 windows 中的 Nxlog，linux 中的 Rsyslog（默认安装了的）、Logstash 和 FluentD 是最好的实现方式。日志装箱工具的唯一目的就是发送日志，因此它们能够处理连接失效以及其它你很可能会遇到的问题。

这里甚至有一个 [Golang syslog 软件包][14] 帮你将 Golang 日志发送到 syslog 守护进程。

### 希望你享受你的 Golang 日志之旅

在你项目一开始就考虑你的 Golang 日志策略非常重要。如果在你代码的任意地方都可以获得所有的上下文，追踪用户就会变得很简单。从不同服务中阅读没有标准化的日志是已经很痛苦的事情。一开始就计划在多个微服务中扩展相同用户或请求 id，后面就会允许你比较容易地过滤信息并在你的系统中跟踪活动。

你是在构架一个很大的 Golang 项目还是几个微服务也会影响你的日志策略。一个大项目的主要组件应该有按照它们功能命名的特定 Golang 日志器。这使你可以立即判断出日志来自你的哪一部分代码。然而对于微服务或者小的 Golang 项目，只有较少的核心组件需要它们自己的日志器。但在每种情形中，日志器的数目都应该保持低于核心功能的数目。

你现在已经可以使用 Golang 日志量化决定你的性能或者用户满意度啦！

_如果你有想阅读的特定编程语言，在 Twitter [@logmatic][2] 上告诉我们吧。_


--------------------------------------------------------------------------------

via: https://logmatic.io/blog/our-guide-to-a-golang-logs-world/

作者：[Nils][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://logmatic.io/blog/our-guide-to-a-golang-logs-world/
[1]:https://twitter.com/logmatic?lang=en
[2]:http://twitter.com/logmatic
[3]:https://golang.org/pkg/log/
[4]:https://golang.org/pkg/log/#pkg-constants
[5]:https://play.golang.org/
[6]:https://www.goinggo.net/2013/11/using-log-package-in-go.html
[7]:https://golang.org/pkg/log/
[8]:https://github.com/google/glog
[9]:https://github.com/sirupsen/logrus
[10]:https://logmatic.io/blog/beyond-application-monitoring-discover-logging-best-practices/
[11]:https://github.com/logmatic/logmatic-go
[12]:https://github.com/opentracing/opentracing-go
[13]:https://sites.google.com/site/kjellhedstrom2/g2log-efficient-background-io-processign-with-c11/g2log-vs-google-s-glog-performance-comparison
[14]:https://golang.org/pkg/log/syslog/
