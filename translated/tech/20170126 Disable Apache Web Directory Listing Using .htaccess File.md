使用 .htaccess 文件禁用 Web 目录列举
===========

[确保 Apache web 服务器安全][3] 是最重要的任务之一，特别是在你的网站刚刚搭建好的时侯。

比方说，如果你 Apache 服务目录 (`/var/www/tecmint` 或 `/var/www/html/tecmint`) 下创建一个名为 `tecmint` 的目录，并且忘记在该目录放置 `index.html`，你会惊奇的发现所有访问者都可以在浏览器输入 **http://www.example.com/tecmint** 来完整列举所有在该目录中的重要文件和文件夹。

本文将为你展示如何使用 `.htaccess` 文件禁用或阻止 Apache 服务器目录列举。

以下便是不存在 `index.html` ，且未采取防范措施前，目录的列举的情况。

[![Apache 目录列举](http://www.tecmint.com/wp-content/uploads/2017/01/Apache-Directory-Listing.png)][4]

*Apache 目录列举*

首先，`.htaccess`  (**hypertext access**) 是一个文件，它可以让站点管理员控制服务器的环境变量以及其他的重要选项，用以增强他/她的站点功能。

欲知更多关于该重要文件的信息，请阅读以下文章，以便通过 `.htaccess` 的方法来确保 Apache Web 服务器的安全。

1. [确保 Apache Web 服务器安全的 25 条 .htaccess 设置技巧][1]
2. [使用 .htaccess 为 Apache Web 目录进行密码保护][2]

使用这一简单方法，在站点目录树中的任意/每个目录创建 `.htaccess` 文件，以便为站点根目录、子目录和其中的文件提供保护支持。

首先要 Apache 主配置文件中为你的站点启用 `.htaccess` 文件支持。

```
$ sudo vi /etc/apache2/apache2.conf    #Debian/Ubuntu 系统
$ sudo vi /etc/httpd/conf/httpd.conf   #RHEL/CentOS 系统
```
然后寻找以下部分，其中 `AllowOverride` 指令必须设置为 `AllowOverride All`。

```
<Directory /var/www/html/>
Options Indexes FollowSymLinks
AllowOverride All
</Directory>
```
如果已存在 `.htaccess` 文件，先备份（如下），假设文件在 `/var/www/html/tecmint/` （并要禁用该目录列举）：

```
$ sudo cp /var/www/html/tecmint/.htaccess /var/www/html/tecmint/.htaccess.orig  
```

然后你就可以在某个特定的目录使用你喜欢的编辑器打开 (或创建) 它，以便修改。并添加以下内容来关闭目录列举。

```
Options -Indexes 
```

下一步就是重启 Apache Web 服务器：

```
-------- 使用 SystemD 的系统 -------- 
$ sudo systemctl restart apache2
$ sudo systemctl restart httpd
-------- 使用 SysVInit 的系统 -------- 
$ sudo /etc/init.d/apache2 restart 
$ sudo /etc/init.d/httpd restart
```

现在来验证效果，在浏览器中输入：**http://www.example.com/tecmint**，你会得到类似如下的信息：

[![Apache 目录列举已禁用](http://www.tecmint.com/wp-content/uploads/2017/01/Apache-Directory-Listing-Disabled.png)][5]

*Apache 目录列举已禁用*

在本文中，我们描述了如何使用 `.htaccess` 文件来禁用 Apache Web 服务器的目录列举。之后我们会介绍两种同样简单的我方法来实现这一相同目的。随时保持联系。

像往常一样，在下方反馈表单中给我们发送关于本文的任何想法。

--------------

作者简介：

Aaron Kili 是一名 Linux 和 F.O.S.S 忠实拥护者、未来的 Linux 系统管理员、Web 开发者，目前是 TecMint 的原创作者，热衷于计算机并乐于知识分享。

-------------

译者简介：

[GHLandy](http://GHLandy.com) - 生活中所有欢乐与苦闷都应藏在心中，有些事儿注定无人知晓，自己也无从说起。

-------------

via: http://www.tecmint.com/disable-apache-directory-listing-htaccess/

作者：[Aaron Kili][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProje)  原创编译，[Linux中国](https://linux.cn) 荣誉推出

[1]: http://www.tecmint.com/password-protect-apache-web-directories-using-htaccess/
[2]: http://www.tecmint.com/apache-htaccess-tricks/
[3]: http://www.tecmint.com/apache-security-tips/
