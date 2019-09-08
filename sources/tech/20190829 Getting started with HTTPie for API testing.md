[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with HTTPie for API testing)
[#]: via: (https://opensource.com/article/19/8/getting-started-httpie)
[#]: author: (Moshe Zadka https://opensource.com/users/moshezhttps://opensource.com/users/mkalindepauleduhttps://opensource.com/users/jamesf)

Getting started with HTTPie for API testing
======
Debug API clients with HTTPie, an easy-to-use command-line tool written
in Python.
![Raspberry pie with slice missing][1]

[HTTPie][2] is a delightfully easy to use and easy to upgrade HTTP client. Pronounced "aitch-tee-tee-pie" and run as **http**, it is a command-line tool written in Python to access the web.

Since this how-to is about an HTTP client, you need an HTTP server to try it out; in this case, [httpbin.org][3], a simple, open source HTTP request-and-response service. The httpbin.org site is a powerful way to test to test web API clients and carefully manage and show details in requests and responses, but for now we will focus on the power of HTTPie.

### An alternative to Wget and cURL

You might have heard of the venerable [Wget][4] or the slightly newer [cURL][5] tools that allow you to access the web from the command line. They were written to access websites, whereas HTTPie is for accessing _web APIs_.

Website requests are designed to be between a computer and an end user who is reading and responding to what they see. This doesn't depend much on structured responses. However, API requests make _structured_ calls between two computers. The human is not part of the picture, and the parameters of a command-line tool like HTTPie handle this effectively.

### Install HTTPie

There are several ways to install HTTPie. You can probably get it as a package for your package manager, whether you use **brew**, **apt**, **yum**, or **dnf**. However, if you have configured [virtualenvwrapper][6], you can own your own installation:


```
$ mkvirtualenv httpie
...
(httpie) $ pip install httpie
...
(httpie) $ deactivate
$ alias http=~/.virtualenvs/httpie/bin/http
$ http -b GET <https://httpbin.org/get>
{
    "args": {},
    "headers": {
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate",
        "Host": "httpbin.org",
        "User-Agent": "HTTPie/1.0.2"
    },
    "origin": "104.220.242.210, 104.220.242.210",
    "url": "<https://httpbin.org/get>"
}
```

By aliasing **http** directly to the command inside the virtual environment, you can run it even when the virtual environment is not active. You can put the **alias** command in **.bash_profile** or **.bashrc** so you can upgrade HTTPie with the command:


```
`$ ~/.virtualenvs/httpie/bin/pip install -U pip`
```

### Query a website with HTTPie

HTTPie can simplify querying and testing an API. One option for running it, **-b** (also known as **\--body**), was used above. Without it, HTTPie will print the entire response, including the headers, by default:


```
$ http GET <https://httpbin.org/get>
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Encoding: gzip
Content-Length: 177
Content-Type: application/json
Date: Fri, 09 Aug 2019 20:19:47 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

{
    "args": {},
    "headers": {
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate",
        "Host": "httpbin.org",
        "User-Agent": "HTTPie/1.0.2"
    },
    "origin": "104.220.242.210, 104.220.242.210",
    "url": "<https://httpbin.org/get>"
}
```

This is crucial when debugging an API service because a lot of information is sent in the headers. For example, it is often important to see which cookies are being sent. Httpbin.org provides options to set cookies (for testing purposes) through the URL path. The following sets a cookie titled **opensource** to the value **awesome**:


```
$ http GET <https://httpbin.org/cookies/set/opensource/awesome>
HTTP/1.1 302 FOUND
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 223
Content-Type: text/html; charset=utf-8
Date: Fri, 09 Aug 2019 20:22:39 GMT
Location: /cookies
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
Set-Cookie: opensource=awesome; Path=/
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"&gt;
&lt;title&gt;Redirecting...&lt;/title&gt;
&lt;h1&gt;Redirecting...&lt;/h1&gt;
&lt;p&gt;You should be redirected automatically to target URL:
&lt;a href="/cookies"&gt;/cookies&lt;/a&gt;.  If not click the link.
```

Notice the **Set-Cookie: opensource=awesome; Path=/** header. This shows the cookie you expected to be set is set correctly and with a **/** path. Also notice that, even though you got a **302** redirect, **http** did not follow it. If you want to follow redirects, you need to ask for it explicitly with the **\--follow** flag:


```
$ http --follow GET <https://httpbin.org/cookies/set/opensource/awesome>
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Encoding: gzip
Content-Length: 66
Content-Type: application/json
Date: Sat, 10 Aug 2019 01:33:34 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

{
    "cookies": {
        "opensource": "awesome"
    }
}
```

But now you cannot see the original **Set-Cookie** header. In order to see intermediate replies, you need to use **\--all**:


```
$ http --headers --all --follow \
GET <https://httpbin.org/cookies/set/opensource/awesome>
HTTP/1.1 302 FOUND
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Type: text/html; charset=utf-8
Date: Sat, 10 Aug 2019 01:38:40 GMT
Location: /cookies
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
Set-Cookie: opensource=awesome; Path=/
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 223
Connection: keep-alive

HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Encoding: gzip
Content-Type: application/json
Date: Sat, 10 Aug 2019 01:38:41 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 66
Connection: keep-alive
```

Printing the body is uninteresting because you are mostly interested in the cookies. If you want to see the headers from the intermediate request but the body from the final request, you can do that with:


```
$ http --print hb --history-print h --all --follow \
GET <https://httpbin.org/cookies/set/opensource/awesome>
HTTP/1.1 302 FOUND
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Type: text/html; charset=utf-8
Date: Sat, 10 Aug 2019 01:40:56 GMT
Location: /cookies
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
Set-Cookie: opensource=awesome; Path=/
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 223
Connection: keep-alive

HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Encoding: gzip
Content-Type: application/json
Date: Sat, 10 Aug 2019 01:40:56 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Content-Length: 66
Connection: keep-alive

{
  "cookies": {
    "opensource": "awesome"
  }
}
```

You can control exactly what is being printed with **\--print** and override what is printed for intermediate requests with **\--history-print**.

### Download binary files with HTTPie

Sometimes the body is non-textual and needs to be sent to a file that can be opened by a different application:


```
$ http GET <https://httpbin.org/image/jpeg>
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 35588
Content-Type: image/jpeg
Date: Fri, 09 Aug 2019 20:25:49 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

+-----------------------------------------+
| NOTE: binary data not shown in terminal |
+-----------------------------------------+
```

To get the right image, you need to save it to a file:


```
$ http --download GET <https://httpbin.org/image/jpeg>
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 35588
Content-Type: image/jpeg
Date: Fri, 09 Aug 2019 20:28:13 GMT
Referrer-Policy: no-referrer-when-downgrade
Server: nginx
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

Downloading 34.75 kB to "jpeg.jpe"
Done. 34.75 kB in 0.00068s (50.05 MB/s)
```

Try it! The picture is adorable.

### Sending custom requests with HTTPie

You can also send specific headers. This is useful for custom web APIs that require a non-standard header:


```
$ http GET <https://httpbin.org/headers> X-Open-Source-Com:Awesome
{
  "headers": {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate",
    "Host": "httpbin.org",
    "User-Agent": "HTTPie/1.0.2",
    "X-Open-Source-Com": "Awesome"
  }
}
```

Finally, if you want to send JSON fields (although it is possible to specify exact content), for many less-nested inputs, you can use a shortcut:


```
$ http --body PUT <https://httpbin.org/anything> open-source=awesome author=moshez
{
  "args": {},
  "data": "{\"open-source\": \"awesome\", \"author\": \"moshez\"}",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "application/json, */*",
    "Accept-Encoding": "gzip, deflate",
    "Content-Length": "46",
    "Content-Type": "application/json",
    "Host": "httpbin.org",
    "User-Agent": "HTTPie/1.0.2"
  },
  "json": {
    "author": "moshez",
    "open-source": "awesome"
  },
  "method": "PUT",
  "origin": "73.162.254.113, 73.162.254.113",
  "url": "<https://httpbin.org/anything>"
}
```

The next time you are debugging a web API, whether your own or someone else's, put down your cURL and reach for HTTPie, the command-line client for web APIs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/getting-started-httpie

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshezhttps://opensource.com/users/mkalindepauleduhttps://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pie-raspberry-bake-make-food.png?itok=QRV_R8Fa (Raspberry pie with slice missing)
[2]: https://httpie.org/
[3]: https://github.com/postmanlabs/httpbin
[4]: https://en.wikipedia.org/wiki/Wget
[5]: https://en.wikipedia.org/wiki/CURL
[6]: https://opensource.com/article/19/6/virtual-environments-python-macos
