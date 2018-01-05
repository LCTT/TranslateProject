translating by lujun9972
How to use curl command with proxy username/password on Linux/ Unix
======

My sysadmin provided me the following proxy details:
```
IP: 202.54.1.1
Port: 3128
Username: foo
Password: bar
```

The settings worked perfectly with Google Chrome and Firefox browser. How do I use it with the curl command? How do I tell the curl command to use my proxy settings from Google Chrome browser?


Many Linux and Unix command line tools such as curl command, wget command, lynx command, and others; use the environment variable called http_proxy, https_proxy, ftp_proxy to find the proxy details. It allows you to connect text based session and applications via the proxy server with or without a userame/password. T **his page shows how to perform HTTP/HTTPS requests with cURL cli using PROXY server.**

## Unix and Linux curl command with proxy syntax


The syntax is:
```
## Set the proxy address of your uni/company/vpn network ## 
export http_proxy=http://your-ip-address:port/
 
## http_proxy with username and password 
export http_proxy=http://user:password@your-proxy-ip-address:port/
 
## HTTPS version ##
export https_proxy=https://your-ip-address:port/
export https_proxy=https://user:password@your-proxy-ip-address:port/
```


Another option is to pass the -x option to the curl command. To use the specified proxy:
```
curl -x <[protocol://][user:password@]proxyhost[:port]> url
--proxy <[protocol://][user:password@]proxyhost[:port]> url
--proxy http://user:password@Your-Ip-Here:Port url
-x http://user:password@Your-Ip-Here:Port url
```

## Linux use curl command with proxy

First set the http_proxy:
```
## proxy server, 202.54.1.1, port: 3128, user: foo, password: bar ##
export http_proxy=http://foo:bar@202.54.1.1:3128/
export https_proxy=$http_proxy
## Use the curl command ##
curl -I https://www.cyberciti.biz
curl -v -I https://www.cyberciti.biz
```
Sample outputs:

```
* Rebuilt URL to: www.cyberciti.biz/
*   Trying 202.54.1.1...
* Connected to 1202.54.1.1 (202.54.1.1) port 3128 (#0)
* Proxy auth using Basic with user 'foo'
> HEAD HTTP://www.cyberciti.biz/ HTTP/1.1
> Host: www.cyberciti.biz
> Proxy-Authorization: Basic x9VuUml2xm0vdg93MtIz
> User-Agent: curl/7.43.0
> Accept: */*
> Proxy-Connection: Keep-Alive
> 
< HTTP/1.1 200 OK
HTTP/1.1 200 OK
< Server: nginx
Server: nginx
< Date: Sun, 17 Jan 2016 11:49:21 GMT
Date: Sun, 17 Jan 2016 11:49:21 GMT
< Content-Type: text/html; charset=UTF-8
Content-Type: text/html; charset=UTF-8
< Vary: Accept-Encoding
Vary: Accept-Encoding
< X-Whom: Dyno-l1-com-cyber
X-Whom: Dyno-l1-com-cyber
< Vary: Cookie
Vary: Cookie
< Link: <http://www.cyberciti.biz/wp-json/>; rel="https://api.w.org/"
Link: <http://www.cyberciti.biz/wp-json/>; rel="https://api.w.org/"
< X-Frame-Options: SAMEORIGIN
X-Frame-Options: SAMEORIGIN
< X-Content-Type-Options: nosniff
X-Content-Type-Options: nosniff
< X-XSS-Protection: 1; mode=block
X-XSS-Protection: 1; mode=block
< X-Cache: MISS from server1
X-Cache: MISS from server1
< X-Cache-Lookup: MISS from server1:3128
X-Cache-Lookup: MISS from server1:3128
< Connection: keep-alive
Connection: keep-alive
 
< 
* Connection #0 to host 10.12.249.194 left intact
```


In this example, I'm downloading a pdf file:
```
$ export http_proxy="vivek:myPasswordHere@10.12.249.194:3128/"
$ curl -v -O http://dl.cyberciti.biz/pdfdownloads/b8bf71be9da19d3feeee27a0a6960cb3/569b7f08/cms/631.pdf
```
OR use the -x option:
```
curl -x 'http://vivek:myPasswordHere@10.12.249.194:3128' -v -O https://dl.cyberciti.biz/pdfdownloads/b8bf71be9da19d3feeee27a0a6960cb3/569b7f08/cms/631.pdf
```
Sample outputs:
[![Fig.01: curl in action \(click to enlarge\)][1]][2]

## How to use the specified proxy server with curl on Unix

```
$ curl -x http://prox_server_vpn:3128/ -I https://www.cyberciti.biz/faq/howto-nginx-customizing-404-403-error-page/
```

## How to use socks protocol?

The syntax is same:
```
curl -x socks5://[user:password@]proxyhost[:port]/ url
curl --socks5 192.168.1.254:3099 https://www.cyberciti.biz/
```

## How do I configure and setup curl to permanently use a proxy connection?

Update/edit your ~/.curlrc file using a text editor such as vim:
`$ vi ~/.curlrc`
Append the following:
```
proxy = server1.cyberciti.biz:3128
proxy-user = "foo:bar"
```

Save and close the file. Another option is create a bash shell alias in your ~/.bashrc file:
```
## alias for curl command
## set proxy-server and port, the syntax is
## alias curl="curl -x {your_proxy_host}:{proxy_port}"
alias curl = "curl -x server1.cyberciti.biz:3128"
```

Remember, the proxy string can be specified with a protocol:// prefix to specify alternative proxy protocols. Use socks4://, socks4a://, socks5:// or socks5h:// to request the specific SOCKS version to be used. No protocol specified, http:// and all others will be treated as HTTP proxies. If the port number is not specified in the proxy string, it is assumed to be 1080. The -x option overrides existing environment variables that set the proxy to use. If there's an environment variable setting a proxy, you can set proxy to "" to override it. See curl command man page [here for more info][3].


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/linux-unix-curl-command-with-proxy-username-password-http-options/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2016/01/curl-download-output-300x141.jpg
[2]:https://www.cyberciti.biz//www.cyberciti.biz/media/new/faq/2016/01/curl-download-output.jpg
[3]:https://curl.haxx.se/docs/manpage.html
