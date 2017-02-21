如何在 Apache 中重定向 URL 到另外一台服务器
============================================================

如我们前面两篇文章（[使用 mod_rewrite 执行内部重定向][1]和[基于浏览器来显示自定义内容][2]）中提到的，在本文中，我们将解释如何在 Apache 中使用 mod_rewrite 模块重定向对已移动到另外一台服务器上的资源的访问。

假设你正在重新设计公司的网站。你已决定将内容和样式（HTML文件、JavaScript 和 CSS）存储在一个服务器上，将文档存储在另一个服务器上 - 这样可能会更稳健。

**建议阅读：** [5 个提高 Apache Web 服务器性能的提示][3] 。

但是，你希望这个更改对用户是透明的，以便他们仍然能够通过之前的网址访问文档。

在下面的例子中，名为 `assets.pdf` 的文件已从 `192.168.0.100`（主机名：`web`）中的 `/var/www/html` 移动到`192.168.0.101`（主机名：`web2`）中的相同位置。

为了让用户在浏览到 `192.168.0.100/assets.pdf` 时可以访问到此文件，请打开 `192.168.0.100` 上的 Apache 配置文件并添加以下重写规则（或者也可以将以下规则添加到 [.htaccess 文件][4]）中：

```
RewriteRule "^(/assets\.pdf$)" "http://192.168.0.101$1"  [R,L]
```

其中 `$1` 占位符，代表与括号中的正则表达式匹配的任何内容。

现在保存更改，不要忘记重新启动 Apache，让我们看看当我们打开 `192.168.0.100/assets.pdf`，尝试访问 `assets.pdf` 时会发生什么：

**建议阅读：** [25 个有用的网站 .htaccess 技巧] [5]

在下面我们就可以看到，为 `192.168.0.100` 上的 `assets.pdf` 所做的请求实际上是由 `192.168.0.101` 处理的。

```
# tail -n 1 /var/log/apache2/access.log
```
[
 ![Check Apache Logs](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Apache-Logs.png) 
][6]

*检查 Apache 日志*

在本文中，我们讨论了如何对已移动到其他服务器的资源进行重定向。 总而言之，我强烈建议你看看 [mod_rewrite][7] 指南和 [Apache 重定向指南][8]，以供将来参考。

一如既往那样，如果您对本文有任何疑虑，请随时使用下面的评论栏回复。 我们期待你的回音！

--------------------------------------------------------------------------------

作者简介：Gabriel Cánepa 是来自阿根廷圣路易斯 Villa Mercedes 的 GNU/Linux 系统管理员和 Web 开发人员。 他在一家全球领先的消费品公司工作，非常高兴使用 FOSS 工具来提高他日常工作领域的生产力。

-----------

via: http://www.tecmint.com/redirect-website-url-from-one-server-to-different-server/

作者：[Gabriel Cánepa][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/redirection-with-mod_rewrite-in-apache/
[2]:http://www.tecmint.com/mod_rewrite-redirect-requests-based-on-browser/
[3]:http://www.tecmint.com/apache-performance-tuning/
[4]:http://www.tecmint.com/tag/htaccess/
[5]:http://www.tecmint.com/apache-htaccess-tricks/
[6]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Apache-Logs.png
[7]:http://mod-rewrite-cheatsheet.com/
[8]:https://httpd.apache.org/docs/2.4/rewrite/remapping.html
