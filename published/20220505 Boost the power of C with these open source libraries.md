[#]: subject: "Boost the power of C with these open source libraries"
[#]: via: "https://opensource.com/article/22/5/libsoup-gobject-c"
[#]: author: "Joël Krähemann https://opensource.com/users/joel2001k"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15065-1.html"

使用开源库 GObject 和 libsoup 提升 C 语言编程能力
======

![](https://img.linux.net.cn/data/attachment/album/202209/24/145218s1s1xk6s1mm2kg1x.jpg)

> 开源库 GObject 和 libsoup 做了很多工作，因此你可以专注于使用 C 语言开发神奇的应用。
<ruby>[GLib 对象系统][2]<rt>Object System</rt></ruby>（GObject）是一个为 C 语言提供灵活且可扩展的面向对象框架的库。在这篇文章中，我将使用该库的 2.4 版本进行演示。

GObject 库继承了 ANSI C 标准，拥有一些常见的数据类型，例如：

* `gchar`：字符型
* `guchar`：无符号字符型
* `gunichar`：32 位定宽 Unicode 字符型
* `gboolean`：布尔型
* `gint8`、`gint16`、`gint32`、`gint64`：有符号 8、16、32 和 64 位整数
* `guint8`、`guint16`、`guint32`、`guint64`：无符号 8、16、32 和 64 位整数
* `gfloat`：IEEE 754 标准单精度浮点数
* `gdouble`：IEEE 754 标准双精度浮点数
* `gpointer`：泛指针

### 函数指针

GObject 库还引入了类和接口的类型和对象体系。之所以可以，是因为 ANSI C 语言可以理解函数指针。

你可以这样做来声明函数指针：

```
void (*my_callback)(gpointer data);
```

首先，你需要给变量 `my_callback` 赋值：

```
void my_callback_func(gpointer data)
{
  //do something
}

my_callback = my_callback_func;
```

函数指针 `my_callback` 可以这样来调用：

```
gpointer data;
data = g_malloc(512 * sizeof(gint16));
my_callback(data);
```

### 对象类

`GObject` 基类由 2 个结构（`GObject` 和 `GObjectClass`）组成，你可以继承它们以实现你自己的对象。

你需要在结构体中先嵌入 `GObject` 和 `GObjectClass`：

```
struct _MyObject
{
  GObject gobject;
  //your fields
};

struct _MyObjectClass
{
  GObjectClass gobject;
  //your class methods
};

GType my_object_get_type(void);
```

对象的实现包含了公有成员。GObject 也提供了私有成员的方法。这实际上是 C 源文件中的一个结构，而不是在头文件。该类通常只包含函数指针。

一个接口不能派生自另一个接口，比如：

```
struct _MyInterface
{
  GInterface ginterface;
  //your interface methods
};
```

通过调用 `g_object_get()` 和 `g_object_set()` 函数来访问属性。若要获取属性，你必须提供特定类型的返回位置。建议先初始化返回位置：

```
gchar *str

str = NULL;

g_object_get(gobject,
  "my-name", &str,
  NULL);
```

或者你想要设置属性：

```
g_object_set(gobject,
  "my-name", "Anderson",
  NULL);
```

### libsoup HTTP 库

`libsoup` 项目为 GNOME 提供了 HTTP 客服端和服务端使用的库。它使用 GObjects 和 glib 主循环与集成到 GNOME 应用，并且还具有用于命令行的同步 API。

首先，创建一个特定身份验证回调的 `libsoup` 会话。你也可以使用 cookie。

```
SoupSession *soup_session;
SoupCookieJar *jar;

soup_session = soup_session_new_with_options(SOUP_SESSION_ADD_FEATURE_BY_TYPE, SOUP_TYPE_AUTH_BASIC,
  SOUP_SESSION_ADD_FEATURE_BY_TYPE, SOUP_TYPE_AUTH_DIGEST,
  NULL);

jar = soup_cookie_jar_text_new("cookies.txt",
  FALSE);     

soup_session_add_feature(soup_session, jar);
g_signal_connect(soup_session, "authenticate",
  G_CALLBACK(my_authenticate_callback), NULL);
```

然后你可以像这样创建一个 HTTP GET 请求：

```
SoupMessage *msg;
SoupMessageHeaders *response_headers;
SoupMessageBody *response_body;
guint status;
GError *error;

msg = soup_form_request_new("GET",
  "http://127.0.0.1:8080/my-xmlrpc",
  NULL);

status = soup_session_send_message(soup_session,
  msg);

response_headers = NULL;
response_body = NULL;

g_object_get(msg,
  "response-headers", &response_headers,
  "response-body", &response_body,
  NULL);

g_message("status %d", status);
cookie = NULL;
soup_message_headers_iter_init(&iter,
response_headers);

while(soup_message_headers_iter_next(&iter, &name, &value)){    
  g_message("%s: %s", name, value);
}

g_message("%s", response_body->data);
if(status == 200){
  cookie = soup_cookies_from_response(msg);
  while(cookie != NULL){
    char *cookie_name;
    cookie_name = soup_cookie_get_name(cookie->data);
    //parse cookies
    cookie = cookie->next;
  }
}
```

当网络服务器进行身份认证时，会调用身份认证回调函数。

这是一个函数签名：

```
#define MY_AUTHENTICATE_LOGIN "my-username"
#define MY_AUTHENTICATE_PASSWORD "my-password"

void my_authenticate_callback(SoupSession *session,
  SoupMessage *msg,
  SoupAuth *auth,
  gboolean retrying,
  gpointer user_data)
{
  g_message("authenticate: ****");
  soup_auth_authenticate(auth,
                         MY_AUTHENTICATE_LOGIN,
                         MY_AUTHENTICATE_PASSWORD);
}
```

### 一个 libsoup 服务器

想要基础的 HTTP 身份认证能够运行，你需要指定回调函数和服务器上下文路径。然后再添加一个带有另一个回调的处理程序。

下面这个例子展示了在 8080 端口监听任何 IPv4 地址的消息：

```
SoupServer *soup_server;
SoupAuthDomain *auth_domain;
GSocket *ip4_socket;
GSocketAddress *ip4_address;
MyObject *my_object;
GError *error;

soup_server = soup_server_new(NULL);
auth_domain = soup_auth_domain_basic_new(SOUP_AUTH_DOMAIN_REALM, "my-realm",
  SOUP_AUTH_DOMAIN_BASIC_AUTH_CALLBACK, my_xmlrpc_server_auth_callback,
  SOUP_AUTH_DOMAIN_BASIC_AUTH_DATA, my_object,
  SOUP_AUTH_DOMAIN_ADD_PATH, "my-xmlrpc",
  NULL);

soup_server_add_auth_domain(soup_server, auth_domain);
soup_server_add_handler(soup_server,
  "my-xmlrpc",
  my_xmlrpc_server_callback,
  my_object,
  NULL);

ip4_socket = g_socket_new(G_SOCKET_FAMILY_IPV4,
  G_SOCKET_TYPE_STREAM,
  G_SOCKET_PROTOCOL_TCP,
  &error);

ip4_address = g_inet_socket_address_new(g_inet_address_new_any(G_SOCKET_FAMILY_IPV4),
  8080);
error = NULL;
g_socket_bind(ip4_socket,
  ip4_address,
  TRUE,
  &error);
error = NULL;
g_socket_listen(ip4_socket, &error);

error = NULL;
soup_server_listen_socket(soup_server,
  ip4_socket, 0, &error);
```

示例代码中，有两个回调函数。一个处理身份认证，另一个处理对它的请求。

假设你想要网页服务器允许用户名为 `my-username` 和口令为 `my-password` 的凭证登录，并且用一个随机且唯一的用户 ID 字符串设置会话 cookie。

```
gboolean my_xmlrpc_server_auth_callback(SoupAuthDomain *domain,
  SoupMessage *msg,
  const char *username,
  const char *password,
  MyObject *my_object)
{
  if(username == NULL || password == NULL){
    return(FALSE);
  }

  if(!strcmp(username, "my-username") &&
     !strcmp(password, "my-password")){
    SoupCookie *session_cookie;
    GSList *cookie;
    gchar *security_token;
    cookie = NULL;

    security_token = g_uuid_string_random();
    session_cookie = soup_cookie_new("my-srv-security-token",
      security_token,
      "localhost",
      "my-xmlrpc",
      -1);

     cookie = g_slist_prepend(cookie,
       session_cookie);  
     soup_cookies_to_request(cookie,
       msg);
    return(TRUE);
  }
  return(FALSE);
}
```

对上下文路径 `my-xmlrpc` 进行处理的函数：

```
void my_xmlrpc_server_callback(SoupServer *soup_server,
  SoupMessage *msg,
  const char *path,
  GHashTable *query,
  SoupClientContext *client,
  MyObject *my_object)
{
  GSList *cookie;
  cookie = soup_cookies_from_request(msg);
  //check cookies
}
```

### 更加强大的 C 语言

希望我的示例展现了 GObject 和 libsoup 项目给 C 语言带来了真正的提升。像这样在字面意义上扩展 C 语言，可以使 C 语言更易于使用。它们已经为你做了许多工作，这样你可以专注于用 C 语言开发简单、直接的应用程序了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/libsoup-gobject-c

作者：[Joël Krähemann][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/joel2001k
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/computer_code_programming_laptop.jpg
[2]: https://docs.gtk.org/gobject/concepts.html
