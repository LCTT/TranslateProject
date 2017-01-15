httpstat：一个检查网站性能的 curl 统计分析工具
============================================================

httpstat 是一个 Python 脚本，它以美妙妥善的方式反映了 curl 统计分析，它是一个单一脚本，兼容 Python 3 ，在用户的系统上不需要安装额外的软件（依赖）。

从本质上来说它是一个 cURL 工具的封装，意味着你可以在 URL 后使用几个有效的 cURL 选项，但是不包括 `-w`、 `-D`、 `-o`、 `-s` 和 `-S` 选项，这些已经被 httpstat 使用了。

[
 ![httpstat Curl Statistics Tool](http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Curl-Statistics-Tool.png) 
][5]

*httpstat Curl 统计分析工具*

你可以看到上图的一个 ASCII 表显示了每个过程消耗多长时间，对我来说最重要的一步是“服务器处理（server processing）” – 如果这个数字很高，那么你需要[优化你网站服务器来加速访问速度][6]。

网站或服务器优化你可以查看我们的文章：

1.  [5 个优化 Apache Web 服务器性能的技巧][1]
2.  [使 Apache 和 Nginx 性能提升 10 倍][2]
3.  [如何使用 Gzip 模块提高 Nginx 性能][3]
4.  [15 个优化 MySQL/MariaDB 性能的建议][4]

使用下面安装说明和用法来获取 httpstat 检查出你的网站速度。

### 在 Linux 系统中安装 httpstat

你可以使用两种合理的方法安装 httpstat ：

1. 使用 [wget 命令][7]直接从它的 Github 仓库获取如下：

```
$ wget -c https://raw.githubusercontent.com/reorx/httpstat/master/httpstat.py
```

2. 使用 `pip`（这个方法允许 httpstat 作为命令安装到你的系统中）像这样：

```
$ sudo pip install httpstat
```

注：确保 `pip` 包已经在系统上安装了，如果没使用你的发行版包管理器 [yum][8] 或 [apt][9]安装它。

### 在 Linux 中如何使用 httpstat

`httpstat` 可以根据你安装它的方式来使用，如果你直接下载了它，进入下载目录使用下面的语句运行它：

```
$ python httpstat.py url cURL_options 
```

如果你使用 `pip` 来安装它，你可以作为命令来执行它，如下表：

```
$ httpstat url cURL_options  
```

查看 `httpstat` 帮助页，命令如下：

```
$ python httpstat.py --help
或
$ httpstat --help
```

`httpstat` 帮助：

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

从上面帮助命令的输出，你可以看出 `httpstat` 已经具备了一些可以影响其行为的环境变量。

使用它们，只需输出适当的值的这些变量到 `.bashrc` 或 `.zshrc` 文件。

例如：

```
export  HTTPSTAT_SHOW_IP=false
export  HTTPSTAT_SHOW_SPEED=true
export  HTTPSTAT_SAVE_BODY=false
export  HTTPSTAT_DEBUG=true
```

你一旦添加完它们，保存文件然后运行下面的命令使改变生效：

```
$ source  ~/.bashrc
```

你可以指定使用 cURL 执行文件的路径，默认使用的是当前 shell 的 [$PATH 环境变量][10]。

下面是一些展示 `httpstat` 如何工作的例子。

```
$ python httpstat.py google.com
或
$ httpstat google.com
```
[
 ![httpstat - Showing Website Statistics](http://www.tecmint.com/wp-content/uploads/2016/12/httpstat.png) 
][11]

*httpstat – 展示网站统计分析*

接下来的命令中：

1.  `-X` 命令标记指定一个客户与 HTTP 服务器连接的请求方法。
2.  `--data-urlencode` 这个选项将会把数据（这里是 a=b）按 URL 编码的方式编码后再提交。
3.  `-v` 开启详细模式。

```
$ python httpstat.py httpbin.org/post -X POST --data-urlencode "a=b" -v 
```

[
 ![httpstat - Custom Post Request](http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Post-Request.png) 
][12]

*httpstat – 定制提交请求*

你可以查看 cURL 的帮助获取更多有用的高级选项，或者浏览 `httpstat` 的 Github 仓库：[https://github.com/reorx/httpstat][13]

这篇文章中，我们讲述了一个有效的工具，它以简单和整洁方式来查看 cURL 统计分析。如果你知道任何类似的工具，别犹豫，让我们知道，你也可以问问题或评论这篇文章或 httpstat，通过下面反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/httpstat-curl-statistics-tool-check-website-performance/

作者：[Aaron Kili][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/apache-performance-tuning/
[2]:http://www.tecmint.com/install-mod_pagespeed-to-boost-apache-nginx-performance/
[3]:http://www.tecmint.com/increase-nginx-performance-enable-gzip-compression-module/
[4]:https://linux.cn/article-5730-1.html
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Curl-Statistics-Tool.png
[6]:http://www.tecmint.com/apache-performance-tuning/
[7]:https://linux.cn/article-4129-1.html
[8]:https://linux.cn/article-2272-1.html
[9]:https://linux.cn/article-7364-1.html
[10]:http://www.tecmint.com/set-unset-environment-variables-in-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/httpstat.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/httpstat-Post-Request.png
[13]:https://github.com/reorx/httpstat
