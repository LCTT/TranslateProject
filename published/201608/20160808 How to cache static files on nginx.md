如何在 nginx 中缓存静态文件
===========================

这篇教程说明你应该怎样配置 nginx、设置 HTTP 头部过期时间，用 Cache-Control 中的 max-age 标记为静态文件（比如图片、 CSS 和 Javascript 文件）设置一个时间，这样用户的浏览器就会缓存这些文件。这样能节省带宽，并且在访问你的网站时会显得更快些（如果用户第二次访问你的网站，将会使用浏览器缓存中的静态文件）。

### 1、准备事项

我想你需要一个正常工作的 nginx 软件，就像这篇教程里展示的：[在 Ubuntu 16.04 LTS 上安装 Nginx，PHP 7 和 MySQL 5.7 (LEMP)](1)。

### 2 配置 nginx

可以参考 [expires](2) 指令手册来设置 HTTP 头部过期时间，这个标记可以放在 `http {}`、`server {}`、`location {}` 等语句块或者 `location {}` 语句块中的条件语句中。一般会在 `location` 语句块中用 `expires` 指令控制你的静态文件，就像下面一样：

```
location ~*  \.(jpg|jpeg|png|gif|ico|css|js)$ {
   expires 365d;
}
```

在上面的例子中，所有后缀名是 `.jpg`、 `.jpeg`、 `.png`、 `.gif`、 `.ico`、 `.css` 和 `.js` 的文件会在浏览器访问该文件之后的 365 天后过期。因此你要确保 `location {}` 语句块仅仅包含能被浏览器缓存的静态文件。

然后重启 nginx 进程：

```
/etc/init.d/nginx reload
```

你可以在 `expires` 指令中使用以下的时间设置：

- `off` 让 `Expires` 和 `Cache-Control` 头部不能被更改。
- `epoch` 将 `Expires` 头部设置成 1970 年 1 月 1 日 00:00:01。
- `max` 设置 `Expires` 头部为 2037 年 12 月 31 日 23:59:59，设置 `Cache-Control` 的最大存活时间为 10 年
- 没有 `@` 前缀的时间意味着这是一个与浏览器访问时间有关的过期时间。可以指定一个负值的时间，就会把 Cache-Control 头部设置成 no-cache。例如：`expires 10d` 或者 `expires 14w3d`。
- 有 `@` 前缀的时间指定在一天中的某个时间过期，格式是 Hh 或者 Hh:Mm，H 的范围是 0 到 24，M 的范围是 0 到 59，例如：`expires @15:34`。

你可以用以下的时间单位：

- `ms`: 毫秒
- `s`: 秒
- `m`: 分钟
- `h`: 小时
- `d`: 天
- `w`: 星期
- `M`: 月 (30 天)
- `y`: 年 (365 天)

例如：`1h30m` 表示一小时三十分钟，`1y6m` 表示一年六个月。

注意，要是你用一个在将来很久才会过期的头部，当组件修改时你就要改变组件的文件名。因此给文件指定版本是一个不错的方法。例如，如果你有个 javascript.js 文件 并且你要修改它，你可以在修改的文件名字后面添加一个版本号。这样浏览器就要下载这个文件，如果你没有更改文件名，浏览器将从缓存里面加载（旧的）文件。

除了把基于浏览器访问时间设置 `Expires` 头部（比如 `expires 10d`）之外，也可以通过在时间前面的 `modified` 关键字，将 `Expires` 头部的基准设为文件修改的时间（请注意这仅仅对存储在硬盘的实际文件有效）。

```
expires modified 10d;
```

### 3 测试

要测试你的配置是否有效，可以用火狐浏览器的开发者工具中的网络分析功能，然后用火狐访问一个静态文件（比如一张图片）。在输出的头部信息里，应该能看到 `Expires` 头部和有 `max-age` 标记的 `Cache-Control` 头部（`max-age` 标记包含了一个以秒为单位的值，比如 31536000 就是指今后的一年）

![](https://www.howtoforge.com/images/how-to-cache-static-files-on-nginx/accept_headers.png)

### 4 链接

nginx 的 Http 头部模块（HttpHeadersModule）: <http://wiki.nginx.org/HttpHeadersModule>

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-cache-static-files-on-nginx/

作者：[Falko Timme][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/how-to-cache-static-files-on-nginx/
[1]: https://linux.cn/article-7551-1.html
[2]:http://nginx.org/en/docs/http/ngx_http_headers_module.html#expires
