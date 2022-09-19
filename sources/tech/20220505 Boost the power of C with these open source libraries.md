[#]: subject: "Boost the power of C with these open source libraries"
[#]: via: "https://opensource.com/article/22/5/libsoup-gobject-c"
[#]: author: "Joël Krähemann https://opensource.com/users/joel2001k"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Boost the power of C with these open source libraries
======
GObject and libsoup do a lot of work for you, so you can turn your attention to inventing amazing applications in C.

![Why and how to handle exceptions in Python Flask][1]
（Image by: Image from Unsplash.com, Creative Commons Zero）

The [GLib Object System (GObject)][2] is a library providing a flexible and extensible object-oriented framework for C. In this article, I demonstrate using the 2.4 version of the library.

The GObject libraries extend the ANSI C standard, with typedefs for common types such as:

* gchar: a character type
* guchar: an unsigned character type
* gunichar: a fixed 32 bit width unichar type
* gboolean: a boolean type
* gint8, gint16, gint32, gint64: 8, 16, 32, and 64 bit integers
* guint8, guint16, guint32, guint64: unsigned 8, 16, 32, and 64 bit integers
* gfloat: an IEEE Standard 754 single precision floating point number
* gdouble: an IEEE Standard 754 double precision floating point number
* gpointer: a generic pointer type

### Function pointers

GObject also introduces a type and object system with classes and interfaces. This is possible because the ANSI C language understands function pointers.

To declare a function pointer, you can do this:

```c
void (*my_callback)(gpointer data);
```

But first, you need to assign the `my_callback` variable:

```c
void my_callback_func(gpointer data)
{
  //do something
}

my_callback = my_callback_func;
```

The function pointer `my_callback` can be invoked like this:

```c
gpointer data;
data = g_malloc(512 * sizeof(gint16));
my_callback(data);
```

### Object classes

The GObject base class consists of 2 structs (`GObject` and `GObjectClass` ) which you inherit to implement your very own objects.

You embed GObject and GObjectClass as the first struct field:

```c
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

The object’s implementation contains fields, which might be exposed as properties. GObject provides a solution to private fields, too. This is actually a struct in the C source file, instead of the header file. The class usually contains function pointers only.

An interface can’t be derived from another interface and is implemented as following:

```c
struct _MyInterface
{
  GInterface ginterface;
  //your interface methods
};
```

Properties are accessed by `g_object_get()` and `g_object_set()` function calls. To get a property, you must provide the return location of the specific type. It’s recommended that you initialize the return location first:

```c
gchar *str

str = NULL;

g_object_get(gobject,
  "my-name", &str,
  NULL);
```

Or you might want to set the property:

```c
g_object_set(gobject,
  "my-name", "Anderson",
  NULL);
```

### The libsoup HTTP library

The `libsoup` project provides an HTTP client and server library for GNOME. It uses GObjects and the glib main loop to integrate with GNOME applications, and also has a synchronous API for use in command-line tools. First, create a `libsoup` session with an authentication callback specified. You can also make use of cookies.

```c
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

Then you can create a HTTP GET request like the following:

```c
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

The authentication callback is called as the web server asks for authentication.

Here’s a function signature:

```c
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

### A libsoup server

For basic HTTP authentication to work, you must specify a callback and server context path. Then you add a handler with another callback.

This example listens to any IPv4 address on localhost port 8080:

```c
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

In this example code, there are two callbacks. One handles authentication, and the other handles the request itself.

Suppose you want a web server to allow a login with the credentials username **my-username** and the password **my-password**, and to set a session cookie with a random unique user ID (UUID) string.

```c
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

A handler for the context path **my-xmlrpc**:

```c
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

### A more powerful C

I hope my examples show how the GObject and libsoup projects give C a very real boost. Libraries like these extend C in a literal sense, and by doing so they make C more approachable. They do a lot of work for you, so you can turn your attention to inventing amazing applications in the simple, direct, and timeless C language.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/libsoup-gobject-c

作者：[Joël Krähemann][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/joel2001k
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/computer_code_programming_laptop.jpg
[2]: https://docs.gtk.org/gobject/concepts.html
