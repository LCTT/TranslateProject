[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12555-1.html)
[#]: subject: (An example of very lightweight RESTful web services in Java)
[#]: via: (https://opensource.com/article/20/7/restful-services-java)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

一个用 Java 实现的超轻量级 RESTful Web 服务示例
======

> 通过管理一套图书的完整代码示例，来探索轻量级的 RESTful 服务。

![](https://img.linux.net.cn/data/attachment/album/202008/27/071808tt9zlno3b6lmbgl8.jpg)

Web 服务，以这样或那样的形式，已经存在了近二十年。比如，[XML-RPC 服务][2]出现在 90 年代后期，紧接着是用 SOAP 分支编写的服务。在 XML-RPC 和 SOAP 这两个开拓者之后出现后不久，REST 架构风格的服务在大约 20 年前也出现了。[REST][4] 风格（以下简称 Restful）服务现在主导了流行的网站，比如 eBay、Facebook 和 Twitter。尽管分布式计算的 Web 服务有很多替代品（如 Web 套接字、微服务和远程过程调用的新框架），但基于 Restful 的 Web 服务依然具有吸引力，原因如下：

  * Restful 服务建立在现有的基础设施和协议上，特别是 Web 服务器和 HTTP/HTTPS 协议。一个拥有基于 HTML 的网站的组织可以很容易地为客户添加 Web 服务，这些客户对数据和底层功能更感兴趣，而不是对 HTML 的表现形式感兴趣。比如，亚马逊就率先通过网站和 Web 服务（基于 SOAP 或 Restful）提供相同的信息和功能。
  * Restful 服务将 HTTP 当作 API，因此避免了复杂的软件分层，这种分层是基于 SOAP 的 Web 服务的明显特征。比如，Restful API 支持通过 HTTP 命令（POST-GET-PUT-DELETE）进行标准的 CRUD（增加-读取-更新-删除）操作；通过 HTTP 状态码可以知道请求是否成功或者为什么失败。
  * Restful Web 服务可以根据需要变得简单或复杂。Restful 是一种风格，实际上是一种非常灵活的风格，而不是一套关于如何设计和构造服务的规定。（伴随而来的缺点是，可能很难确定哪些服务不能算作 Restful 服务。）
  * 作为使用者或者客户端，Restful Web 服务与语言和平台无关。客户端发送 HTTP(S) 请求，并以适合现代数据交换的格式（如 JSON）接收文本响应。
  * 几乎每一种通用编程语言都至少对 HTTP/HTTPS 有足够的（通常是强大的）支持，这意味着 Web 服务的客户端可以用这些语言来编写。

这篇文章将通过一段完整的 Java 代码示例来探讨轻量级的 Restful 服务。

### 基于 Restful 的“小说” Web 服务

基于 Restful 的“小说” web 服务包含三个程序员定义的类：

  * `Novel` 类代表一个小说，只有三个属性：机器生成的 ID、作者和标题。属性可以根据实际情况进行扩展，但我还是想让这个例子看上去更简单一些。
  * `Novels` 类包含了用于各种任务的工具类：将一个 `Novel` 或者它们的列表的纯文本编码转换成 XML 或者 JSON；支持在小说集合上进行 CRUD 操作；以及从存储在文件中的数据初始化集合。`Novels` 类在 `Novel` 实例和 servlet 之间起中介作用。
  * `NovelsServlet` 类是从 `HttpServlet` 中继承的，`HttpServlet` 是一段健壮且灵活的代码，自 90 年代末的早期企业级 Java 就已经存在了。对于客户端的 CRUD 请求，servlet 可以当作 HTTP 的端点。 servlet 代码主要用于处理客户端的请求和生成相应的响应，而将复杂的细节留给 `Novels` 类中的工具类进行处理。

一些 Java 框架，比如 Jersey（JAX-RS）和 Restlet，就是为 Restful 服务设计的。尽管如此，`HttpServlet` 本身为完成这些服务提供了轻量、灵活、强大且充分测试过的 API。我会通过下面的“小说”例子来说明。

### 部署“小说” Web 服务

当然，部署“小说” Web 服务需要一个 Web 服务器。我的选择是 [Tomcat][5]，但是如果该服务托管在 Jetty 或者甚至是 Java 应用服务器上，那么这个服务应该至少可以工作（著名的最后一句话！）。[在我的网站上][6]有总结了如何安装 Tomcat 的 README 文件和代码。还有一个附带文档的 Apache Ant 脚本，可以用来构建“小说”服务（或者任何其他服务或网站），并且将它部署在 Tomcat 或相同的服务。

Tomcat 可以从它的[官网][7]上下载。当你在本地安装后，将 `TOMCAT_HOME` 设置为安装目录。有两个子目录值得关注：

  * `TOMCAT_HOME/bin` 目录包含了类 Unix 系统（`startup.sh` 和 `shutdown.sh`）和 Windows（`startup.bat` 和 `shutdown.bat`） 的启动和停止脚本。Tomcat 作为 Java 应用程序运行。Web 服务器的 servlet 容器叫做 Catalina。（在 Jetty 中，Web 服务器和容器的名字一样。）当 Tomcat 启动后，在浏览器中输入 `http://localhost:8080/` 可以查看详细文档，包括示例。
  * `TOMCAT_HOME/webapps` 目录是已部署的 Web 网站和服务的默认目录。部署网站或 Web 服务的直接方法是复制以 `.war` 结尾的 JAR 文件（也就是 WAR 文件）到 `TOMCAT_HOME/webapps` 或它的子目录下。然后 Tomcat 会将 WAR 文件解压到它自己的目录下。比如，Tomcat 会将 `novels.war` 文件解压到一个叫做 `novels` 的子目录下，并且保留 `novels.war` 文件。一个网站或 Web 服务可以通过删除 WAR 文件进行移除，也可以用一个新版 WAR 文件来覆盖已有文件进行更新。顺便说一下，调试网站或服务的第一步就是检查 Tomcat 已经正确解压 WAR 文件；如果没有的话，网站或服务就无法发布，因为代码或配置中有致命错误。
  * 因为 Tomcat 默认会监听 8080 端口上的 HTTP 请求，所以本机上的 URL 请求以 `http://localhost:8080/` 开始。

通过添加不带 `.war` 后缀的 WAR 文件名来访问由程序员部署的 WAR 文件：

```
http://locahost:8080/novels/
```

如果服务部署在 `TOMCAT_HOME` 下的一个子目录中（比如，`myapps`），这会在 URL 中反映出来：

```
http://locahost:8080/myapps/novels/
```

我会在靠近文章结尾处的测试部分提供这部分的更多细节。

如前所述，我的主页上有一个包含 Ant 脚本的 ZIP 文件，这个文件可以编译并且部署网站或者服务。（这个 ZIP 文件中也包含一个 `novels.war` 的副本。）对于“小说”这个例子，命令的示例（`%` 是命令行提示符）如下：

```
% ant -Dwar.name=novels deploy
```

这个命令首先会编译 Java 源代码，并且创建一个可部署的 `novels.war` 文件，然后将这个文件保存在当前目录中，再复制到 `TOMCAT_HOME/webapps` 目录中。如果一切顺利，`GET` 请求（使用浏览器或者命令行工具，比如 `curl`）可以用来做一个测试：

```
% curl http://localhost:8080/novels/
```

默认情况下，Tomcat 设置为 <ruby>热部署<rt>hot deploys</rt></ruby>：Web 服务器不需要关闭就可以进行部署、更新或者移除一个 web 应用。

### “小说”服务的代码

让我们回到“小说”这个例子，不过是在代码层面。考虑下面的 `Novel` 类：

#### 例 1：Novel 类

```java
package novels;

import java.io.Serializable;

public class Novel implements Serializable, Comparable<Novel> {
    static final long serialVersionUID = 1L;
    private String author;
    private String title;
    private int id;

    public Novel() { }

    public void setAuthor(final String author) { this.author = author; }
    public String getAuthor() { return this.author; }
    public void setTitle(final String title) { this.title = title; }
    public String getTitle() { return this.title; }
    public void setId(final int id) { this.id = id; }
    public int getId() { return this.id; }

    public int compareTo(final Novel other) { return this.id - other.id; }
}
```

这个类实现了 `Comparable` 接口中的 `compareTo` 方法，因为 `Novel` 实例是存储在一个线程安全的无序 `ConcurrentHashMap` 中。在响应查看集合的请求时，“小说”服务会对从映射中提取的集合（一个 `ArrayList`）进行排序；`compareTo` 的实现通过 `Novel` 的 ID 将它按升序排序。

`Novels` 类中包含多个实用工具函数：

#### 例 2：Novels 实用工具类

```java
package novels;

import java.io.IOException;
import java.io.File;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.nio.file.Files;
import java.util.stream.Stream;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.Collections;
import java.beans.XMLEncoder;
import javax.servlet.ServletContext; // not in JavaSE
import org.json.JSONObject;
import org.json.XML;

public class Novels {
    private final String fileName = "/WEB-INF/data/novels.db";
    private ConcurrentMap<Integer, Novel> novels;
    private ServletContext sctx;
    private AtomicInteger mapKey;

    public Novels() {
        novels = new ConcurrentHashMap<Integer, Novel>();
        mapKey = new AtomicInteger();
    }

    public void setServletContext(ServletContext sctx) { this.sctx = sctx; }
    public ServletContext getServletContext() { return this.sctx; }

    public ConcurrentMap<Integer, Novel> getConcurrentMap() {
        if (getServletContext() == null) return null; // not initialized
        if (novels.size() < 1) populate();
        return this.novels;
    }

    public String toXml(Object obj) { // default encoding
        String xml = null;
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            XMLEncoder encoder = new XMLEncoder(out);
            encoder.writeObject(obj);
            encoder.close();
            xml = out.toString();
        }
        catch(Exception e) { }
        return xml;
    }

    public String toJson(String xml) { // option for requester
        try {
            JSONObject jobt = XML.toJSONObject(xml);
            return jobt.toString(3); // 3 is indentation level
        }
        catch(Exception e) { }
        return null;
    }

    public int addNovel(Novel novel) {
        int id = mapKey.incrementAndGet();
        novel.setId(id);
        novels.put(id, novel);
        return id;
    }

    private void populate() {
        InputStream in = sctx.getResourceAsStream(this.fileName);
        // Convert novel.db string data into novels.
        if (in != null) {
            try {
                InputStreamReader isr = new InputStreamReader(in);
                BufferedReader reader = new BufferedReader(isr);

                String record = null;
                while ((record = reader.readLine()) != null) {
                    String[] parts = record.split("!");
                    if (parts.length == 2) {
                        Novel novel = new Novel();
                        novel.setAuthor(parts[0]);
                        novel.setTitle(parts[1]);
                        addNovel(novel); // sets the Id, adds to map
                    }
                }
                in.close();
            }
            catch (IOException e) { }
        }
    }
}
```

最复杂的方法是 `populate`，这个方法从一个包含在 WAR 文件中的文本文件读取。这个文本文件包括了“小说”的初始集合。要打开此文件，`populate` 方法需要 `ServletContext`，这是一个 Java 映射类型，包含了关于嵌入在 servlet 容器中的 servlet 的所有关键信息。这个文本文件有包含了像下面这样的记录：

```
Jane Austen!Persuasion
```

这一行被解析为两部分（作者和标题），由感叹号（`!`）分隔。然后这个方法创建一个 `Novel` 实例，设置作者和标题属性，并且将“小说”加到容器中，保存在内存中。

`Novels` 类也有一些实用工具函数，可以将“小说”容器编码为 XML 或 JSON，取决于发出请求的人所要求的格式。默认是 XML 格式，但是也可以请求 JSON 格式。一个轻量级的 XML 转 JSON 包提供了 JSON。下面是关于编码的更多细节。

#### 例 3：NovelsServlet 类

```java
package novels;

import java.util.concurrent.ConcurrentMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.beans.XMLEncoder;
import org.json.JSONObject;
import org.json.XML;

public class NovelsServlet extends HttpServlet {
    static final long serialVersionUID = 1L;
    private Novels novels; // back-end bean

    // Executed when servlet is first loaded into container.
    @Override
    public void init() {
        this.novels = new Novels();
        novels.setServletContext(this.getServletContext());
    }

    // GET /novels
    // GET /novels?id=1
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        String param = request.getParameter("id");
        Integer key = (param == null) ? null : Integer.valueOf((param.trim()));

        // Check user preference for XML or JSON by inspecting
        // the HTTP headers for the Accept key.
        boolean json = false;
        String accept = request.getHeader("accept");
        if (accept != null && accept.contains("json")) json = true;

        // If no query string, assume client wants the full list.
        if (key == null) {
            ConcurrentMap<Integer, Novel> map = novels.getConcurrentMap();
            Object list = map.values().toArray();
            Arrays.sort(list);

            String payload = novels.toXml(list);        // defaults to Xml
            if (json) payload = novels.toJson(payload); // Json preferred?
            sendResponse(response, payload);
        }
        // Otherwise, return the specified Novel.
        else {
            Novel novel = novels.getConcurrentMap().get(key);
            if (novel == null) { // no such Novel
                String msg = key + " does not map to a novel.\n";
                sendResponse(response, novels.toXml(msg));
            }
            else { // requested Novel found
                if (json) sendResponse(response, novels.toJson(novels.toXml(novel)));
                else sendResponse(response, novels.toXml(novel));
            }
        }
    }

    // POST /novels
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String author = request.getParameter("author");
        String title = request.getParameter("title");

        // Are the data to create a new novel present?
        if (author == null || title == null)
            throw new RuntimeException(Integer.toString(HttpServletResponse.SC_BAD_REQUEST));

        // Create a novel.
        Novel n = new Novel();
        n.setAuthor(author);
        n.setTitle(title);

        // Save the ID of the newly created Novel.
        int id = novels.addNovel(n);

        // Generate the confirmation message.
        String msg = "Novel " + id + " created.\n";
        sendResponse(response, novels.toXml(msg));
    }

    // PUT /novels
    @Override
    public void doPut(HttpServletRequest request, HttpServletResponse response) {
        /* A workaround is necessary for a PUT request because Tomcat does not
           generate a workable parameter map for the PUT verb. */
        String key = null;
        String rest = null;
        boolean author = false;

        /* Let the hack begin. */
        try {
            BufferedReader br =
                new BufferedReader(new InputStreamReader(request.getInputStream()));
            String data = br.readLine();
            /* To simplify the hack, assume that the PUT request has exactly
               two parameters: the id and either author or title. Assume, further,
               that the id comes first. From the client side, a hash character
               # separates the id and the author/title, e.g.,

                  id=33#title=War and Peace
            */
            String[] args = data.split("#");      // id in args[0], rest in args[1]
            String[] parts1 = args[0].split("="); // id = parts1[1]
            key = parts1[1];

            String[] parts2 = args[1].split("="); // parts2[0] is key
            if (parts2[0].contains("author")) author = true;
            rest = parts2[1];
        }
        catch(Exception e) {
            throw new RuntimeException(Integer.toString(HttpServletResponse.SC_INTERNAL_SERVER_ERROR));
        }

        // If no key, then the request is ill formed.
        if (key == null)
            throw new RuntimeException(Integer.toString(HttpServletResponse.SC_BAD_REQUEST));

        // Look up the specified novel.
        Novel p = novels.getConcurrentMap().get(Integer.valueOf((key.trim())));
        if (p == null) { // not found
            String msg = key + " does not map to a novel.\n";
            sendResponse(response, novels.toXml(msg));
        }
        else { // found
            if (rest == null) {
                throw new RuntimeException(Integer.toString(HttpServletResponse.SC_BAD_REQUEST));
            }
            // Do the editing.
            else {
                if (author) p.setAuthor(rest);
                else p.setTitle(rest);

                String msg = "Novel " + key + " has been edited.\n";
                sendResponse(response, novels.toXml(msg));
            }
        }
    }

    // DELETE /novels?id=1
    @Override
    public void doDelete(HttpServletRequest request, HttpServletResponse response) {
        String param = request.getParameter("id");
        Integer key = (param == null) ? null : Integer.valueOf((param.trim()));
        // Only one Novel can be deleted at a time.
        if (key == null)
            throw new RuntimeException(Integer.toString(HttpServletResponse.SC_BAD_REQUEST));
        try {
            novels.getConcurrentMap().remove(key);
            String msg = "Novel " + key + " removed.\n";
            sendResponse(response, novels.toXml(msg));
        }
        catch(Exception e) {
            throw new RuntimeException(Integer.toString(HttpServletResponse.SC_INTERNAL_SERVER_ERROR));
        }
    }

    // Methods Not Allowed
    @Override
    public void doTrace(HttpServletRequest request, HttpServletResponse response) {
        throw new RuntimeException(Integer.toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
    }

    @Override
    public void doHead(HttpServletRequest request, HttpServletResponse response) {
        throw new RuntimeException(Integer.toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
    }

    @Override
    public void doOptions(HttpServletRequest request, HttpServletResponse response) {
        throw new RuntimeException(Integer.toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
    }

    // Send the response payload (Xml or Json) to the client.
    private void sendResponse(HttpServletResponse response, String payload) {
        try {
            OutputStream out = response.getOutputStream();
            out.write(payload.getBytes());
            out.flush();
        }
        catch(Exception e) {
            throw new RuntimeException(Integer.toString(HttpServletResponse.SC_INTERNAL_SERVER_ERROR));
        }
    }
}
```

上面的 `NovelsServlet` 类继承了 `HttpServlet` 类，`HttpServlet` 类继承了 `GenericServlet` 类，后者实现了 `Servlet` 接口：

```java
NovelsServlet extends HttpServlet extends GenericServlet implements Servlet
```

从名字可以很清楚的看出来，`HttpServlet` 是为实现 HTTP(S) 上的 servlet 设计的。这个类提供了以标准 HTTP 请求动词（官方说法，<ruby>方法<rt>methods</rt></ruby>）命名的空方法：

  * `doPost` （Post = 创建）
  * `doGet` （Get = 读取）
  * `doPut` （Put = 更新）
  * `doDelete` （Delete = 删除）

其他一些 HTTP 动词也会涉及到。`HttpServlet` 的子类，比如 `NovelsServlet`，会重载相关的 `do` 方法，并且保留其他方法为<ruby>空<rt>no-ops</rt></ruby>。`NovelsServlet` 重载了七个 `do` 方法。

每个 `HttpServlet` 的 CRUD 方法都有两个相同的参数。下面以 `doPost` 为例：

```java
public void doPost(HttpServletRequest request, HttpServletResponse response) {
```

`request` 参数是一个 HTTP 请求信息的映射，而 `response` 提供了一个返回给请求者的输出流。像 `doPost` 的方法，结构如下：

  * 读取 `request` 信息，采取任何适当的措施生成一个响应。如果该信息丢失或者损坏了，就会生成一个错误。
  * 使用提取的请求信息来执行适当的 CRUD 操作（在本例中，创建一个 `Novel`），然后使用 `response` 输出流为请求者编码一个适当的响应。在 `doPost` 例子中，响应就是已经成功生成一个新“小说”并且添加到容器中的一个确认。当响应被发送后，输出流就关闭了，同时也将连接关闭了。

### 关于方法重载的更多内容

HTTP 请求的格式相对比较简单。下面是一个非常熟悉的 HTTP 1.1 的格式，注释由双井号分隔：

```
GET /novels              ## start line
Host: localhost:8080     ## header element
Accept-type: text/plain  ## ditto
...
[body]                   ## POST and PUT only
```

第一行由 HTTP 动词（在本例中是 `GET`）和以名词（在本例中是 `novels`）命名目标资源的 URI 开始。报头中包含键-值对，用冒号分隔左面的键和右面的值。报头中的键 `Host`（大小写敏感）是必须的；主机名 `localhost` 是当前机器上的本地符号地址，`8080` 端口是 Tomcat web 服务器上等待 HTTP 请求的默认端口。（默认情况下，Tomcat 在 8443 端口上监听 HTTP 请求。）报头元素可以以任意顺序出现。在这个例子中，`Accept-type` 报头的值是 MIME 类型 `text/plain`。

一些请求（特别是 `POST` 和 `PUT`）会有报文，而其他请求（特别是 `GET` 和 `DELETE`）没有。如果有报文（可能为空），以两个换行符将报头和报文分隔开；HTTP 报文包含一系列键-值对。对于无报文的请求，比如说查询字符串，报头元素就可以用来发送信息。下面是一个用 ID 2 对 `/novels` 资源的 `GET` 请求：

```
GET /novels?id=2
```

通常来说，查询字符串以问号开始，并且包含一个键-值对，尽管这个键-值可能值为空。

带有 `getParameter` 和 `getParameterMap` 等方法的 `HttpServlet` 很好地回避了有报文和没有报文的 HTTP 请求之前的差异。在“小说”例子中，`getParameter` 方法用来从 `GET`、`POST` 和 `DELETE` 方法中提取所需的信息。（处理 `PUT` 请求需要更底层的代码，因为 Tomcat 没有提供可以解析 `PUT` 请求的参数映射。）下面展示了一段在 `NovelsServlet` 中被重载的 `doPost` 方法：

```java
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response) {
   String author = request.getParameter("author");
   String title = request.getParameter("title");
   ...
```

对于没有报文的 `DELETE` 请求，过程基本是一样的：

```java
@Override
public void doDelete(HttpServletRequest request, HttpServletResponse response) {
   String param = request.getParameter("id"); // id of novel to be removed
   ...
```

`doGet` 方法需要区分 `GET` 请求的两种方式：一种是“获得所有”，而另一种是“获得某一个”。如果 `GET` 请求 URL 中包含一个键是一个 ID 的查询字符串，那么这个请求就被解析为“获得某一个”：

```
http://localhost:8080/novels?id=2  ## GET specified
```

如果没有查询字符串，`GET` 请求就会被解析为“获得所有”：

```
http://localhost:8080/novels       ## GET all
```

### 一些值得注意的细节

“小说”服务的设计反映了像 Tomcat 这样基于 Java 的 web 服务器是如何工作的。在启动时，Tomcat 构建一个线程池，从中提取请求处理程序，这种方法称为 “<ruby>每个请求一个线程<rt>one thread per request</rt></ruby>” 模型。现在版本的 Tomcat 使用非阻塞 I/O 来提高个性能。

“小说”服务是作为 `NovelsServlet` 类的单个实例来执行的，该实例也就维护了一个“小说”集合。相应的，也就会出现竞态条件，比如出现两个请求同时被处理：

  * 一个请求向集合中添加一个新“小说”。
  * 另一个请求获得集合中的所有“小说”。

这样的结果是不确定的，取决与 _读_ 和 _写_ 的操作是以怎样的顺序进行操作的。为了避免这个问题，“小说”服务使用了线程安全的 `ConcurrentMap`。这个映射的关键是生成了一个线程安全的 `AtomicInteger`。下面是相关的代码片段：

```java
public class Novels {
    private ConcurrentMap<Integer, Novel> novels;
    private AtomicInteger mapKey;
    ...
```

默认情况下，对客户端请求的响应被编码为 XML。为了简单，“小说”程序使用了以前的 `XMLEncoder` 类；另一个包含更丰富功能的方式是使用 JAX-B 库。代码很简单：

```java
public String toXml(Object obj) { // default encoding
   String xml = null;
   try {
      ByteArrayOutputStream out = new ByteArrayOutputStream();
      XMLEncoder encoder = new XMLEncoder(out);
      encoder.writeObject(obj);
      encoder.close();
      xml = out.toString();
   }
   catch(Exception e) { }
   return xml;
}
```

`Object` 参数要么是一个有序的“小说” `ArraList`（用以响应“<ruby>获得所有<rt>get all</rt></ruby>”请求），要么是一个 `Novel` 实例（用以响应“<ruby>获得一个<rt>get one</rt></ruby>”请求），又或者是一个 `String`（确认消息）。

如果 HTTP 请求报头指定 JSON 作为所需要的类型，那么 XML 就被转化成 JSON。下面是 `NovelsServlet` 中的 `doGet` 方法中的检查：

```java
String accept = request.getHeader("accept"); // "accept" is case insensitive
if (accept != null && accept.contains("json")) json = true;
```

`Novels`类中包含了 `toJson` 方法，可以将 XML 转换成 JSON：

```java
public String toJson(String xml) { // option for requester
   try {
      JSONObject jobt = XML.toJSONObject(xml);
      return jobt.toString(3); // 3 is indentation level
   }
   catch(Exception e) { }
   return null;
}
```

`NovelsServlet`会对各种类型进行错误检查。比如，`POST` 请求应该包含新“小说”的作者和标题。如果有一个丢了，`doPost` 方法会抛出一个异常：

```java
if (author == null || title == null)
   throw new RuntimeException(Integer.toString(HttpServletResponse.SC_BAD_REQUEST));
```

`SC_BAD_REQUEST` 中的 `SC` 代表的是 <ruby>状态码<rt>status code</rt></ruby>，`BAD_REQUEST` 的标准 HTTP 数值是 400。如果请求中的 HTTP 动词是 `TRACE`，会返回一个不同的状态码：

```java
public void doTrace(HttpServletRequest request, HttpServletResponse response) {
   throw new RuntimeException(Integer.toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
}
```

### 测试“小说”服务

用浏览器测试 web 服务会很不顺手。在 CRUD 动词中，现代浏览器只能生成 `POST`（创建）和 `GET`（读取）请求。甚至从浏览器发送一个 `POST` 请求都有点不好办，因为报文需要包含键-值对；这样的测试通常通过 HTML 表单完成。命令行工具，比如说 [curl][21]，是一个更好的选择，这个部分展示的一些 `curl` 命令，已经包含在我网站的 ZIP 文件中了。

下面是一些测试样例，没有展示相应的输出结果：

```
% curl localhost:8080/novels/
% curl localhost:8080/novels?id=1
% curl --header "Accept: application/json" localhost:8080/novels/
```

第一条命令请求所有“小说”，默认是 XML 编码。第二条命令请求 ID 为 1 的“小说”，XML 编码。最后一条命令通过 `application/json` 添加了 `Accept` 报头元素，作为所需要的 MIME 类型。“<ruby>获得一个<rt>get one</rt></ruby>”命令也可以用这个报头。这些请求用了 JSON 而不是 XML 编码作为响应。

下面两条命令在集合中创建了一个新“小说”，并且确认添加了进去：

```
% curl --request POST --data "author=Tolstoy&amp;title=War and Peace" localhost:8080/novels/
% curl localhost:8080/novels?id=4
```

`curl` 中的 `PUT` 命令与 `POST` 命令相似，不同的地方是 `PUT` 的报文没有使用标准的语法。在 `NovelsServlet` 中关于 `doPut` 方法的文档中有详细的介绍，但是简单来说，Tomcat 不会对 `PUT` 请求生成合适的映射。下面是一个 `PUT` 命令和确认命令的的例子：

```
% curl --request PUT --data "id=3#title=This is an UPDATE" localhost:8080/novels/
% curl localhost:8080/novels?id=3
```

第二个命令确认了集合已经更新。

最后，`DELETE` 命令会正常运行：

```
% curl --request DELETE localhost:8080/novels?id=2
% curl localhost:8080/novels/
```

这个请求是删除 ID 为 2 的“小说”。第二个命令会显示剩余的“小说”。

### web.xml 配置文件

尽管官方规定它是可选的，`web.xml` 配置文件是一个生产级别网站或服务的重要组成部分。这个配置文件可以配置独立于代码的路由、安全性，或者网站或服务的其他功能。“小说”服务的配置通过为该服务的请求分配一个 URL 模式来配置路由：

```xml
<xml version = "1.0" encoding = "UTF-8">
<web-app>
   <servlet>
     <servlet-name>novels</servlet-name>
     <servlet-class>novels.NovelsServlet</servlet-class>
   </servlet>
   <servlet-mapping>
     <servlet-name>novels</servlet-name>
     <url-pattern>/*</url-pattern>
   </servlet-mapping>
</web-app>
```

`servlet-name` 元素为 servlet 全名（`novels.NovelsServlet`）提供了一个缩写（`novels`），然后这个名字在下面的 `servlet-mapping` 元素中使用。

回想一下，一个已部署服务的 URL 会在端口号后面有 WAR 文件的文件名：

```
http://localhost:8080/novels/
```

端口号后斜杠后的 URI，是所请求资源的“路径”，在这个例子中，就是“小说”服务。因此，`novels` 出现在了第一个单斜杠后。

在 `web.xml` 文件中，`url-patter` 被指定为 `/*`，代表 “以 `/novels` 为起始的任意路径”。假设 Tomcat 遇到了一个不存在的 URL，像这样：

```
http://localhost:8080/novels/foobar/
```

`web.xml` 配置也会指定这个请求被分配到“小说” servlet 中，因为 `/*` 模式也包含 `/foobar`。因此，这个不存在的 URL 也会得到像上面合法路径的相同结果。

生产级别的配置文件可能会包含安全相关的信息，包括<ruby>连接级别<rt>wire-level</rt></ruby>和<ruby>用户角色<rt>users-roles</rt></ruby>。即使在这种情况下，配置文件的大小也只会是这个例子中的两到三倍大。

### 总结

`HttpServlet` 是 Java web 技术的核心。像“小说”这样的网站或 web 服务继承了这个类，并且根据需求重载了相应的 `do` 动词方法。像 Jersay（JAX-RS）或 Restlet 这样的 Restful 框架通过提供定制的 servlet 完成了基本相同的功能，针对框架中的 web 应用程序的请求，这个 servlet 扮演着 HTTP(S) <ruby>终端<rt>endpoint</rt></ruby>的角色。

当然，基于 servlet 的应用程序可以访问 web 应用程序中所需要的任何 Java 库。如果应用程序遵循<ruby>关注点分离<rt>separation-of-concerns</rt></ruby>原则，那么 servlet 代码仍然相当简单：代码会检查请求，如果存在缺陷，就会发出适当的错误；否则，代码会调用所需要的功能（比如，查询数据库，以特定格式为响应编码），然后向请求这发送响应。`HttpServletRequest` 和 `HttpServletReponse` 类型使得读取请求和编写响应变得简单。

Java 的 API 可以从非常简单变得相当复杂。如果你需要用 Java 交付一些 Restful 服务的话，我的建议是在做其他事情之前先尝试一下简单的 `HttpServlet`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/restful-services-java

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://xmlrpc.com/
[3]: https://en.wikipedia.org/wiki/Representational_state_transfer
[4]: https://www.redhat.com/en/topics/integration/whats-the-difference-between-soap-rest
[5]: http://tomcat.apache.org/
[6]: https://condor.depaul.edu/mkalin
[7]: https://tomcat.apache.org/download-90.cgi
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+serializable
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+object
[12]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+bytearrayoutputstream
[13]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+exception
[14]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+inputstream
[15]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+inputstreamreader
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+bufferedreader
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+ioexception
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+arrays
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+runtimeexception
[20]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+outputstream
[21]: https://curl.haxx.se/
