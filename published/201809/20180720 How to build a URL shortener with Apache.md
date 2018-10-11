如何使用 Apache 构建 URL 缩短服务
======
> 用 Apache HTTP 服务器的 mod_rewrite 功能创建你自己的短链接。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG)

很久以前，人们开始在 Twitter 上分享链接。140 个字符的限制意味着 URL 可能消耗一条推文的大部分（或全部），因此人们使用 URL 缩短服务。最终，Twitter 加入了一个内置的 URL 缩短服务（[t.co][1]）。

字符数现在不重要了，但还有其他原因要缩短链接。首先，缩短服务可以提供分析功能 —— 你可以看到你分享的链接的受欢迎程度。它还简化了制作易于记忆的 URL。例如，[bit.ly/INtravel][2] 比<https://www.in.gov/ai/appfiles/dhs-countyMap/dhsCountyMap.html>更容易记住。如果你想预先共享一个链接，但还不知道最终地址，这时 URL 缩短服务可以派上用场。。

与任何技术一样，URL 缩短服务并非都是正面的。通过屏蔽最终地址，缩短的链接可用于指向恶意或冒犯性内容。但是，如果你仔细上网，URL 缩短服务是一个有用的工具。

我们之前在网站上[发布过缩短服务的文章][3]，但也许你想要运行一些由简单的文本文件支持的缩短服务。在本文中，我们将展示如何使用 Apache HTTP 服务器的 mod_rewrite 功能来设置自己的 URL 缩短服务。如果你不熟悉 Apache HTTP 服务器，请查看 David Both 关于[安装和配置][4]它的文章。

### 创建一个 VirtualHost

在本教程中，我假设你购买了一个很酷的域名，你将它专门用于 URL 缩短服务。例如，我的网站是 [funnelfiasco.com][5]，所以我买了 [funnelfias.co][6] 用于我的 URL 缩短服务（好吧，它不是很短，但它可以满足我的虚荣心）。如果你不将缩短服务作为单独的域运行，请跳到下一部分。

第一步是设置将用于 URL 缩短服务的 VirtualHost。有关 VirtualHost 的更多信息，请参阅 [David Both 的文章][7]。这步只需要几行：

```
    <VirtualHost *:80>
        ServerName funnelfias.co
    </VirtualHost>
```

### 创建重写规则

此服务使用 HTTPD 的重写引擎来重写 URL。如果你在上面的部分中创建了 VirtualHost，则下面的配置跳到你的 VirtualHost 部分。否则跳到服务器的 VirtualHost 或主 HTTPD 配置。

```
    RewriteEngine on
    RewriteMap shortlinks txt:/data/web/shortlink/links.txt
    RewriteRule ^/(.+)$ ${shortlinks:$1} [R=temp,L]
```

第一行只是启用重写引擎。第二行在文本文件构建短链接的映射。上面的路径只是一个例子。你需要使用系统上使用有效路径（确保它可由运行 HTTPD 的用户帐户读取）。最后一行重写 URL。在此例中，它接受任何字符并在重写映射中查找它们。你可能希望重写时使用特定的字符串。例如，如果你希望所有缩短的链接都是 “slX”（其中 X 是数字），则将上面的 `(.+)` 替换为 `(sl\d+)`。

我在这里使用了临时重定向（HTTP 302）。这能让我稍后更新目标 URL。如果希望短链接始终指向同一目标，则可以使用永久重定向（HTTP 301）。用 `permanent` 替换第三行的 `temp`。

### 构建你的映射

编辑配置文件 `RewriteMap` 行中的指定文件。格式是空格分隔的键值存储。在每一行上放一个链接：

```
    osdc https://opensource.com/users/bcotton
    twitter https://twitter.com/funnelfiasco
    swody1 https://www.spc.noaa.gov/products/outlook/day1otlk.html
```

### 重启 HTTPD

最后一步是重启 HTTPD 进程。这是通过 `systemctl restart httpd` 或类似命令完成的（命令和守护进程名称可能因发行版而不同）。你的链接缩短服务现已启动并运行。当你准备编辑映射时，无需重新启动 Web 服务器。你所要做的就是保存文件，Web 服务器将获取到差异。

### 未来的工作

此示例为你提供了基本的 URL 缩短服务。如果你想将开发自己的管理接口作为学习项目，它可以作为一个很好的起点。或者你可以使用它分享容易记住的链接到那些容易忘记的 URL。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/apache-url-shortener

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:http://t.co
[2]:http://bit.ly/INtravel
[3]:https://opensource.com/article/17/3/url-link-shortener
[4]:https://opensource.com/article/18/2/how-configure-apache-web-server
[5]:http://funnelfiasco.com
[6]:http://funnelfias.co
[7]:https://opensource.com/article/18/3/configuring-multiple-web-sites-apache
