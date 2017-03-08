如何隐藏 Apache 版本号和其它敏感信息
============================================================

当远程请求发送到你的 Apache Web 服务器时，在默认情况下，一些有价值的信息，如 web 服务器版本号、服务器操作系统详细信息、已安装的 Apache 模块等等，会随服务器生成的文档发回客户端。

这给攻击者利用漏洞并获取对 web 服务器的访问提供了很多有用的信息。为了避免显示 web 服务器信息，我们将在本文中演示如何使用特定的 Apache 指令隐藏 Apache Web 服务器的信息。

**推荐阅读：** [13 个有用的 Apache 服务器安全贴士][1]。

两个重要的指令是：

### ServerSignature

这允许在服务器生成的文档（如错误消息、mod_proxy 的 ftp 目录列表、mod_info 输出等等）下添加一个显示服务器名称和版本号的页脚行。

它有三个可能的值：

-  `On` - 允许在服务器生成的文档中添加尾部页脚行，
-  `Off` - 禁用页脚行
-  `EMail` - 创建一个 “**mailto:**” 引用；用于将邮件发送到所引用文档的 ServerAdmin。

### ServerTokens

它决定了发送回客户端的服务器响应头字段是否包含服务器操作系统类型的描述和有关已启用的 Apache 模块的信息。

此指令具有以下可能的值（以及在设置特定值时发送到客户端的示例信息）：

```
ServerTokens   Full (或者不指定) 
```
发送给客户端的信息： `Server: Apache/2.4.2 (Unix) PHP/4.2.2 MyMod/1.2` 
```
ServerTokens   Prod[uctOnly] 
```
发送给客户端的信息： `Server: Apache`
```
ServerTokens   Major 
```
发送给客户端的信息： `Server: Apache/2` 
```
ServerTokens   Minor 
```
发送给客户端的信息： `Server: Apache/2.4` 
```
ServerTokens   Min[imal]
``` 
发送给客户端的信息：`Server: Apache/2.4.2` 
```
ServerTokens   OS 
```
发送给客户端的信息： `Server: Apache/2.4.2 (Unix)`


**注意**：在 Apache **2.0.44** 之后，`ServerTokens` 也控制由 `ServerSignature` 指令提供的信息。

**推荐阅读：** [5 个加速 Apache Web 服务器的贴士][2]。

为了隐藏 web 服务器版本号、服务器操作系统细节、已安装的 Apache 模块等等，使用你最喜欢的编辑器打开 Apache 配置文件：

```
$ sudo vi /etc/apache2/apache2.conf        #Debian/Ubuntu systems
$ sudo vi /etc/httpd/conf/httpd.conf       #RHEL/CentOS systems 
```

添加/修改/附加下面的行：

```
ServerTokens Prod
ServerSignature Off 
```

保存并退出文件，重启你的 Apache 服务器：

```
$ sudo systemctl apache2 restart  #SystemD
$ sudo sevice apache2 restart     #SysVInit
```

本篇中，我们解释了如何使用特定的 Apache 指令隐藏Apache web 服务器版本号及其他信息。

如果你在 Apache 中运行 PHP，我建议你[隐藏 PHP 版本号][3]。

如往常一样，你可以在评论栏中写下你的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 及 web 开发者，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/hide-apache-web-server-version-information/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/apache-security-tips/
[2]:http://www.tecmint.com/apache-performance-tuning/
[3]:http://www.tecmint.com/hide-php-version-http-header/
