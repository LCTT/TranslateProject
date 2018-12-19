使用 gorilla/mux 进行 HTTP 请求路由和验证
======

> gorilla/mux 包以直观的 API 提供了 HTTP 请求路由、验证和其它服务。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

Go 网络库包括 `http.ServeMux` 结构类型，它支持 HTTP 请求多路复用（路由）：Web 服务器将托管资源的 HTTP 请求与诸如 `/sales4today` 之类的 URI 路由到代码处理程序；处理程序在发送 HTTP 响应（通常是 HTML 页面）之前执行适当的逻辑。 这是该体系的草图：

```
             +-----------+     +--------+     +---------+
HTTP 请求---->| web 服务器 |---->| 路由   |---->| 处理程序  |
             +-----------+     +--------+     +---------+
```

调用 `ListenAndServe` 方法后启动 HTTP 服务器：

```
http.ListenAndServe(":8888", nil) // args: port & router
```

第二个参数 `nil` 意味着 `DefaultServeMux` 用于请求路由。

`gorilla/mux` 库包含 `mux.Router` 类型，可替代 `DefaultServeMux` 或自定义请求多路复用器。 在 `ListenAndServe` 调用中，`mux.Router` 实例将代替 `nil` 作为第二个参数。 下面的示例代码很好的说明了为什么 `mux.Router`如此吸引人：

### 1、一个简单的 CRUD web 应用程序

crud web 应用程序（见下文）支持四种 CRUD（创建/读取/更新/删除）操作，它们分别对应四种 HTTP 请求方法：POST、GET、PUT 和 DELETE。 在这个 CRUD 应用程序中，所管理的资源是套话与反套话的列表，每个都是套话及其反面的的套话，例如这对：

```
Out of sight, out of mind. Absence makes the heart grow fonder.
```

可以添加新的套话对，可以编辑或删除现有的套话对。

CRUD web 应用程序：

```
package main

import (
   "gorilla/mux"
   "net/http"
   "fmt"
   "strconv"
)

const GETALL string = "GETALL"
const GETONE string = "GETONE"
const POST string   = "POST"
const PUT string    = "PUT"
const DELETE string = "DELETE"

type clichePair struct {
   Id      int
   Cliche  string
   Counter string
}

// Message sent to goroutine that accesses the requested resource.
type crudRequest struct {
   verb     string
   cp       *clichePair
   id       int
   cliche   string
   counter  string
   confirm  chan string
}

var clichesList = []*clichePair{}
var masterId = 1
var crudRequests chan *crudRequest

// GET /
// GET /cliches
func ClichesAll(res http.ResponseWriter, req *http.Request) {
   cr := &crudRequest{verb: GETALL, confirm: make(chan string)}
   completeRequest(cr, res, "read all")
}

// GET /cliches/id
func ClichesOne(res http.ResponseWriter, req *http.Request) {
   id := getIdFromRequest(req)
   cr := &crudRequest{verb: GETONE, id: id, confirm: make(chan string)}
   completeRequest(cr, res, "read one")
}

// POST /cliches
func ClichesCreate(res http.ResponseWriter, req *http.Request) {
   cliche, counter := getDataFromRequest(req)
   cp := new(clichePair)
   cp.Cliche = cliche
   cp.Counter = counter
   cr := &crudRequest{verb: POST, cp: cp, confirm: make(chan string)}
   completeRequest(cr, res, "create")
}

// PUT /cliches/id
func ClichesEdit(res http.ResponseWriter, req *http.Request) {
   id := getIdFromRequest(req)
   cliche, counter := getDataFromRequest(req)
   cr := &crudRequest{verb: PUT, id: id, cliche: cliche, counter: counter, confirm: make(chan string)}
   completeRequest(cr, res, "edit")
}

// DELETE /cliches/id
func ClichesDelete(res http.ResponseWriter, req *http.Request) {
   id := getIdFromRequest(req)
   cr := &crudRequest{verb: DELETE, id: id, confirm: make(chan string)}
   completeRequest(cr, res, "delete")
}

func completeRequest(cr *crudRequest, res http.ResponseWriter, logMsg string) {
   crudRequests<-cr
   msg := <-cr.confirm
   res.Write([]byte(msg))
   logIt(logMsg)
}

func main() {
   populateClichesList()

   // From now on, this gorountine alone accesses the clichesList.
   crudRequests = make(chan *crudRequest, 8)
   go func() { // resource manager
      for {
         select {
         case req := <-crudRequests:
         if req.verb == GETALL {
            req.confirm<-readAll()
         } else if req.verb == GETONE {
            req.confirm<-readOne(req.id)
         } else if req.verb == POST {
            req.confirm<-addPair(req.cp)
         } else if req.verb == PUT {
            req.confirm<-editPair(req.id, req.cliche, req.counter)
         } else if req.verb == DELETE {
            req.confirm<-deletePair(req.id)
         }
      }
   }()
   startServer()
}

func startServer() {
   router := mux.NewRouter()

   // Dispatch map for CRUD operations.
   router.HandleFunc("/", ClichesAll).Methods("GET")
   router.HandleFunc("/cliches", ClichesAll).Methods("GET")
   router.HandleFunc("/cliches/{id:[0-9]+}", ClichesOne).Methods("GET")

   router.HandleFunc("/cliches", ClichesCreate).Methods("POST")
   router.HandleFunc("/cliches/{id:[0-9]+}", ClichesEdit).Methods("PUT")
   router.HandleFunc("/cliches/{id:[0-9]+}", ClichesDelete).Methods("DELETE")

   http.Handle("/", router) // enable the router

   // Start the server.
   port := ":8888"
   fmt.Println("\nListening on port " + port)
   http.ListenAndServe(port, router); // mux.Router now in play
}

// Return entire list to requester.
func readAll() string {
   msg := "\n"
   for _, cliche := range clichesList {
      next := strconv.Itoa(cliche.Id) + ": " + cliche.Cliche + "  " + cliche.Counter + "\n"
      msg += next
   }
   return msg
}

// Return specified clichePair to requester.
func readOne(id int) string {
   msg := "\n" + "Bad Id: " + strconv.Itoa(id) + "\n"

   index := findCliche(id)
   if index >= 0 {
      cliche := clichesList[index]
      msg = "\n" + strconv.Itoa(id) + ": " + cliche.Cliche + "  " + cliche.Counter + "\n"
   }
   return msg
}

// Create a new clichePair and add to list
func addPair(cp *clichePair) string {
   cp.Id = masterId
   masterId++
   clichesList = append(clichesList, cp)
   return "\nCreated: " + cp.Cliche + " " + cp.Counter + "\n"
}

// Edit an existing clichePair
func editPair(id int, cliche string, counter string) string {
   msg := "\n" + "Bad Id: " + strconv.Itoa(id) + "\n"
   index := findCliche(id)
   if index >= 0 {
      clichesList[index].Cliche = cliche
      clichesList[index].Counter = counter
      msg = "\nCliche edited: " + cliche + " " + counter + "\n"
   }
   return msg
}

// Delete a clichePair
func deletePair(id int) string {
   idStr := strconv.Itoa(id)
   msg := "\n" + "Bad Id: " + idStr + "\n"
   index := findCliche(id)
   if index >= 0 {
      clichesList = append(clichesList[:index], clichesList[index + 1:]...)
      msg = "\nCliche " + idStr + " deleted\n"
   }
   return msg
}

//*** utility functions
func findCliche(id int) int {
   for i := 0; i < len(clichesList); i++ {
      if id == clichesList[i].Id {
         return i;
      }
   }
   return -1 // not found
}

func getIdFromRequest(req *http.Request) int {
   vars := mux.Vars(req)
   id, _ := strconv.Atoi(vars["id"])
   return id
}

func getDataFromRequest(req *http.Request) (string, string) {
   // Extract the user-provided data for the new clichePair
   req.ParseForm()
   form := req.Form
   cliche := form["cliche"][0]    // 1st and only member of a list
   counter := form["counter"][0]  // ditto
   return cliche, counter
}

func logIt(msg string) {
   fmt.Println(msg)
}

func populateClichesList() {
   var cliches = []string {
      "Out of sight, out of mind.",
      "A penny saved is a penny earned.",
      "He who hesitates is lost.",
   }
   var counterCliches = []string {
      "Absence makes the heart grow fonder.",
      "Penny-wise and dollar-foolish.",
      "Look before you leap.",
   }

   for i := 0; i < len(cliches); i++ {
      cp := new(clichePair)
      cp.Id = masterId
      masterId++
      cp.Cliche = cliches[i]
      cp.Counter = counterCliches[i]
      clichesList = append(clichesList, cp)
   }
}
```

为了专注于请求路由和验证，CRUD 应用程序不使用 HTML 页面作为请求响应。 相反，请求会产生明文响应消息：套话对的列表是对 GET 请求的响应，确认新的套话对已添加到列表中是对 POST 请求的响应，依此类推。 这种简化使得使用命令行实用程序（如 [curl][1]）可以轻松地测试应用程序，尤其是 `gorilla/mux` 组件。

`gorilla/mux` 包可以从 [GitHub][2] 安装。 CRUD app 无限期运行；因此，应使用 `Control-C` 或同等命令终止。 CRUD 应用程序的代码，以及自述文件和简单的 curl 测试，可以在[我的网站] [3]上找到。

### 2、请求路由

`mux.Router` 扩展了 REST 风格的路由，它赋给 HTTP 方法（例如，GET）和 URL 末尾的 URI 或路径（例如 `/cliches`）相同的权重。 URI 用作 HTTP 动词（方法）的名词。 例如，在HTTP请求中有一个起始行，例如：

```
GET /cliches
```

意味着得到所有的套话对，而一个起始线，如：

```
POST /cliches
```

意味着从 HTTP 正文中的数据创建一个套话对。

在 CRUD web 应用程序中，有五个函数充当 HTTP 请求的五种变体的请求处理程序：

```
ClichesAll(...)    # GET: 获取所有的套话对
ClichesOne(...)    # GET: 获取指定的套话对
ClichesCreate(...) # POST: 创建新的套话对
ClichesEdit(...)   # PUT: 编辑现有的套话对
ClichesDelete(...) # DELETE: 删除指定的套话对
```

每个函数都有两个参数：一个 `http.ResponseWriter` 用于向请求者发送一个响应，一个指向 `http.Request` 的指针，该指针封装了底层 HTTP 请求的信息。 使用 `gorilla/mux` 包可以轻松地将这些请求处理程序注册到Web服务器，并执行基于正则表达式的验证。

CRUD 应用程序中的 `startServer` 函数注册请求处理程序。 考虑这对注册，`router` 作为 `mux.Router` 实例：

```
router.HandleFunc("/", ClichesAll).Methods("GET")
router.HandleFunc("/cliches", ClichesAll).Methods("GET")
```

这些语句意味着对单斜线 `/` 或 `/cliches` 的 GET 请求应该路由到 `ClichesAll` 函数，然后处理请求。 例如，curl 请求（使用 `％` 作为命令行提示符）：

```
% curl --request GET localhost:8888/
```

会产生如下结果：

```
1: Out of sight, out of mind.  Absence makes the heart grow fonder.
2: A penny saved is a penny earned.  Penny-wise and dollar-foolish.
3: He who hesitates is lost.  Look before you leap.
```

这三个套话对是 CRUD 应用程序中的初始数据。

在这句注册语句中：

```
router.HandleFunc("/cliches", ClichesAll).Methods("GET")
router.HandleFunc("/cliches", ClichesCreate).Methods("POST")
```

URI 是相同的（`/cliches`），但动词不同：第一种情况下为 GET 请求，第二种情况下为 POST 请求。 此注册举例说明了 REST 样式的路由，因为仅动词的不同就足以将请求分派给两个不同的处理程序。

注册中允许多个 HTTP 方法，尽管这会影响 REST 风格路由的精髓：

```
router.HandleFunc("/cliches", DoItAll).Methods("POST", "GET")
```

除了动词和 URI 之外，还可以在功能上路由 HTTP 请求。 例如，注册

```
router.HandleFunc("/cliches", ClichesCreate).Schemes("https").Methods("POST")
```

要求对 POST 请求进行 HTTPS 访问以创建新的套话对。以类似的方式，注册可能需要具有指定的 HTTP 头元素（例如，认证凭证）的请求。

### 3、 Request validation

`gorilla/mux` 包采用简单，直观的方法通过正则表达式进行请求验证。 考虑此请求处理程序以获取一个操作：

```
router.HandleFunc("/cliches/{id:[0-9]+}", ClichesOne).Methods("GET")
```

此注册排除了 HTTP 请求，例如：

```
% curl --request GET localhost:8888/cliches/foo
```

因为 foo 不是十进制数字。该请求导致熟悉的 404（未找到）状态码。 在此处理程序注册中包含正则表达式模式可确保仅在请求 URI 以十进制整数值结束时才调用 `ClichesOne` 函数来处理请求：

```
% curl --request GET localhost:8888/cliches/3  # ok
```

另一个例子，请求如下：

```
% curl --request PUT --data "..." localhost:8888/cliches
```

此请求导致状态代码为 405（错误方法），因为 /cliches URI 在 CRUD 应用程序中仅在 GET 和 POST 请求中注册。 像 GET 请求一样，PUT 请求必须在 URI 的末尾包含一个数字 id：

```
router.HandleFunc("/cliches/{id:[0-9]+}", ClichesEdit).Methods("PUT")
```

### 4、并发问题

`gorilla/mux` 路由器作为单独的 Go 协程执行对已注册的请求处理程序的每次调用，这意味着并发性被内置于包中。 例如，如果有十个同时发出的请求，例如

```
% curl --request POST --data "..." localhost:8888/cliches
```

然后 `mux.Router` 启动十个 Go 协程来执行 `ClichesCreate` 处理程序。

GET all、GET one、POST、PUT 和 DELETE 中的五个请求操作中，最后三个改变了所请求的资源，即包含套话对的共享 `clichesList`。 因此，CRUD app 需要通过协调对 `clichesList` 的访问来保证安全的并发性。 在不同但等效的术语中，CRUD app 必须防止 `clichesList` 上的竞争条件。 在生产环境中，可以使用数据库系统来存储诸如 `clichesList` 之类的资源，然后可以通过数据库事务来管理安全并发。

CRUD 应用程序采用推荐的Go方法来实现安全并发：

* 只有一个 Go 协程，资源管理器在 CRUD app `startServer` 函数中启动，一旦 Web 服务器开始侦听请求，就可以访问 `clichesList`。
* 诸如 `ClichesCreate` 和 `ClichesAll` 之类的请求处理程序向 Go 通道发送（指向）`crudRequest` 实例（默认情况下是线程安全的），并且资源管理器单独从该通道读取。 然后，资源管理器对 `clichesList` 执行请求的操作。

安全并发体系结构绘制如下：

```
            crudRequest                读/写

请求处理程序 -------------> 资源托管者 ------------> 套话列表

```

在这种架构中，不需要显式锁定 `clichesList`，因为一旦 CRUD 请求开始进入，只有一个 Go 协程（资源管理器）访问 `clichesList`。

为了使 CRUD 应用程序尽可能保持并发，在一方请求处理程序与另一方的单一资源管理器之间进行有效的分工至关重要。 在这里，为了审查，是 `ClichesCreate` 请求处理程序：

```
func ClichesCreate(res http.ResponseWriter, req *http.Request) {
   cliche, counter := getDataFromRequest(req)
   cp := new(clichePair)
   cp.Cliche = cliche
   cp.Counter = counter
   cr := &crudRequest{verb: POST, cp: cp, confirm: make(chan string)}
   completeRequest(cr, res, "create")
}
```

`ClichesCreate` 调用实用函数 `getDataFromRequest`，它从 POST 请求中提取新的套话和反套话。 然后 `ClichesCreate` 函数创建一个新的 `ClichePair`，设置两个字段，并创建一个 `crudRequest` 发送给单个资源管理器。 此请求包括一个确认通道，资源管理器使用该通道将信息返回给请求处理程序。 所有设置工作都可以在不涉及资源管理器的情况下完成，因为尚未访问 `clichesList`。

请求处理程序调用实用程序函数，该函数从 POST 请求中提取新的套话和反套话。 然后，该函数创建一个新的，设置两个字段，并创建一个 crudRequest 发送到单个资源管理器。 此请求包括一个确认通道，资源管理器使用该通道将信息返回给请求处理程序。 所有设置工作都可以在不涉及资源管理器的情况下完成，因为尚未访问它。

`completeRequest` 实用程序函数在 `ClichesCreate` 函数和其他请求处理程序的末尾调用：

```
completeRequest(cr, res, "create") // shown above
```

通过将 `crudRequest` 放入 `crudRequests` 频道，使资源管理器发挥作用：

```
func completeRequest(cr *crudRequest, res http.ResponseWriter, logMsg string) {
   crudRequests<-cr          // 向资源托管者发送请求
   msg := <-cr.confirm       // 等待确认
   res.Write([]byte(msg))    // 向请求方发送确认
   logIt(logMsg)             // 打印到标准输出
}
```

对于 POST 请求，资源管理器调用实用程序函数 `addPair`，它会更改 `clichesList` 资源：

```
func addPair(cp *clichePair) string {
   cp.Id = masterId  // 分配一个唯一的 ID 
   masterId++        // 更新 ID 计数器
   clichesList = append(clichesList, cp) // 更新列表
   return "\nCreated: " + cp.Cliche + " " + cp.Counter + "\n"
}
```

资源管理器为其他 CRUD 操作调用类似的实用程序函数。 值得重复的是，一旦 Web 服务器开始接受请求，资源管理器就是唯一可以读取或写入 `clichesList` 的 goroutine。

对于任何类型的 Web 应用程序，`gorilla/mux` 包在简单直观的 API 中提供请求路由、请求验证和相关服务。 CRUD web 应用程序突出了软件包的主要功能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/http-request-routing-validation-gorillamux

作者：[Marty Kalin][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[yongshouzhang](https://github.com/yongshouzhang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mkalindepauledu
[1]:https://curl.haxx.se/
[2]:https://github.com/gorilla/mux
[3]:http://condor.depaul.edu/mkalin
