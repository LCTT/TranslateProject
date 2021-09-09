[#]: subject: "Debug a web page error from the command line"
[#]: via: "https://opensource.com/article/21/9/wget-debug-web-server"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Debug a web page error from the command line
======
One way to debug a web server is by using the wget command-line program.
![Digital creative of a browser on the internet][1]

Sometimes when managing a website, things can get messed up. You might remove some stale content and replace it with a redirect to other pages. Later, after making other changes, you find some web pages become entirely inaccessible. You might see an error in your browser that "The page isn't redirecting properly" with a suggestion to check your cookies.

![Redirect loop example in Firefox][2]

Screenshot by Jim Hall, [CC-BY SA 4.0][3]

One way to debug this situation is by using the `wget` command-line program, with the `-S` option to show all server responses. When using `wget` for debugging, I also prefer to save the output to some temporary file, using the `-O` option, in case I need to view its contents later.


```
$ wget -O /tmp/test.html -S <http://10.0.0.11/announce/>
\--2021-08-24 17:09:49--  <http://10.0.0.11/announce/>
Connecting to 10.0.0.11:80... connected.
HTTP request sent, awaiting response... 
 
HTTP/1.1 302 Found
 
Date: Tue, 24 Aug 2021 22:09:49 GMT
 
Server: Apache/2.4.48 (Fedora)
 
X-Powered-By: PHP/7.4.21
 
Location: <http://10.0.0.11/assets/>
 
Content-Length: 0
 
Keep-Alive: timeout=5, max=100
 
Connection: Keep-Alive
 
Content-Type: text/html; charset=UTF-8
Location: <http://10.0.0.11/assets/> [following]
\--2021-08-24 17:09:49--  <http://10.0.0.11/assets/>
Reusing existing connection to 10.0.0.11:80.
HTTP request sent, awaiting response... 
 
HTTP/1.1 302 Found
 
Date: Tue, 24 Aug 2021 22:09:49 GMT
 
Server: Apache/2.4.48 (Fedora)
 
X-Powered-By: PHP/7.4.21
 
Location: <http://10.0.0.11/announce/>
 
Content-Length: 0
 
Keep-Alive: timeout=5, max=99
 
Connection: Keep-Alive
 
Content-Type: text/html; charset=UTF-8
Location: <http://10.0.0.11/announce/> [following]
\--2021-08-24 17:09:49--  <http://10.0.0.11/announce/>
Reusing existing connection to 10.0.0.11:80.
.
.
.
20 redirections exceeded.
```

I've omitted a lot of repetition in this output. By reading the server responses, you can see that `http ://10.0.0.11/announce/` redirects immediately to `http ://10.0.0.11/assets/`, which then redirects back to `http ://10.0.0.11/announce/`. And so on. This is an endless loop and `wget` will exit after 20 redirections. But armed with this debugging information, you can fix the redirects and avoid the loop.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/wget-debug-web-server

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/sites/default/files/uploads/firefox-redirect-loop.png (Redirect loop example in Firefox)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
