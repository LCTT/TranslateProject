httpstat – A Curl Statistics Tool to Check Website Performance
============================================================

httpstat is a Python script that reflects curl statistics in a fascinating and well-defined way, it is a single file which is compatible with Python 3 and requires no additional software (dependencies) to be installed on a users system.

It is fundamentally a wrapper of cURL tool, means that you can use several valid cURL options after a URL(s), excluding the options -w, -D, -o, -s, and -S, which are already employed by httpstat.

[
 ![httpstat Curl Statistics Tool ](http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Curl-Statistics-Tool.png) 
][5]

httpstat Curl Statistics Tool

You can see in the above image an ASCII table displaying how long each process took, and for me the most important step is “server processing” – if this number is higher, then you need to [tune your server to speed up website][6].

For website or server tuning you can check our articles here:

1.  [5 Tips to Tune Performance of Apache Web Server][1]
2.  [Speed Up Apache and Nginx Performance Upto 10x][2]
3.  [How to Boost Nginx Performance Using Gzip Module][3]
4.  [15 Tips to Tune MySQL/MariaDB Performance][4]

Grab httpstat to check out your website speed using following instillation instructions and usage.

### Install httpstat in Linux Systems

You can install httpstat utility using two possible methods:

1. Get it directly from its Github repo using the [wget command][7] as follows:

```
$ wget -c https://raw.githubusercontent.com/reorx/httpstat/master/httpstat.py
```

2. Using pip (this method allows httpstat to be installed on your system as a command) like so:

```
$ sudo pip install httpstat
```

Note: Make sure pip package installed on the system, if not install it using your distribution package manager [yum][8] or [apt][9].

### How to Use httpstat in Linux

httpstat can be used according to the way you installed it, if you directly downloaded it, run it using the following syntax from within the download directory:

```
$ python httpstat.py url cURL_options 
```

In case you used pip to install it, you can execute it as a command in the form below:

```
$ httpstat url cURL_options  
```

To view the help page for httpstat, issue the command below:

```
$ python httpstat.py --help
OR
$ httpstat --help
```
httpstat help
```
Usage: httpstat URL [CURL_OPTIONS]
httpstat -h | --help
httpstat --version
Arguments:
URL     url to request, could be with or without `http(s)://` prefix
Options:
CURL_OPTIONS  any curl supported options, except for -w -D -o -S -s,
which are already used internally.
-h --help     show this screen.
--version     show version.
Environments:
HTTPSTAT_SHOW_BODY    Set to `true` to show response body in the output,
note that body length is limited to 1023 bytes, will be
truncated if exceeds. Default is `false`.
HTTPSTAT_SHOW_IP      By default httpstat shows remote and local IP/port address.
Set to `false` to disable this feature. Default is `true`.
HTTPSTAT_SHOW_SPEED   Set to `true` to show download and upload speed.
Default is `false`.
HTTPSTAT_SAVE_BODY    By default httpstat stores body in a tmp file,
set to `false` to disable this feature. Default is `true`
HTTPSTAT_CURL_BIN     Indicate the curl bin path to use. Default is `curl`
from current shell $PATH.
HTTPSTAT_DEBUG        Set to `true` to see debugging logs. Default is `false`
```

From the output of the help command above, you can see that httpstat has a collection of useful environmental variables that influence its behavior.

To use them, simply export the variables with the appropriate value in the `.bashrc` or `.zshrc` file.

For instance:

```
export  HTTPSTAT_SHOW_IP=false
export  HTTPSTAT_SHOW_SPEED=true
export  HTTPSTAT_SAVE_BODY=false
export  HTTPSTAT_DEBUG=true
```

Once your are done adding them, save the file and run the command below to effect the changes:

```
$ source  ~/.bashrc
```

You can as well specify the cURL binary path to use, the default is curl from current shell [$PATH environmental variable][10].

Below are a few examples showing how httpsat works.

```
$ python httpstat.py google.com
OR
$ httpstat google.com
```
[
 ![httpstat - Showing Website Statistics](http://www.tecmint.com/wp-content/uploads/2016/12/httpstat.png) 
][11]

httpstat – Showing Website Statistics

In the next command:

1.  `-x` command flag specifies a custom request method to use while communicating with the HTTP server.
2.  `--data-urlencode` data posts data (a=b in this case) with URL-encoding turned on.
3.  `-v` enables a verbose mode.

```
$ python httpstat.py httpbin.org/post -X POST --data-urlencode "a=b" -v 
```
[
 ![httpstat - Custom Post Request](http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Post-Request.png) 
][12]

httpstat – Custom Post Request

You can look through the cURL man page for more useful and advanced options or visit the httpstatGithub repository: [https://github.com/reorx/httpstat][13]

In this article, we have covered a useful tool for monitoring cURL statistics is a simple and clear way. If you know of any such tools out there, do not hesitate to let us know and you can as well ask a question or make a comment about this article or httpstat via the feedback section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/httpstat-curl-statistics-tool-check-website-performance/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/apache-performance-tuning/
[2]:http://www.tecmint.com/install-mod_pagespeed-to-boost-apache-nginx-performance/
[3]:http://www.tecmint.com/increase-nginx-performance-enable-gzip-compression-module/
[4]:http://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Curl-Statistics-Tool.png
[6]:http://www.tecmint.com/apache-performance-tuning/
[7]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[8]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[9]:http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[10]:http://www.tecmint.com/set-unset-environment-variables-in-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/httpstat.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Post-Request.png
[13]:https://github.com/reorx/httpstat
