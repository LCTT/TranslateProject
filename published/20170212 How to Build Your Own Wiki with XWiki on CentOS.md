如何在 CentOS 中安装 XWiki
============================================================

由于大家的强烈要求，这里有另外一篇在 CentOS 7 服务器中用 XWiki 安装 wiki 的教程。我们已经发布了一篇[如何在 Ubuntu 中安装 DokuWiki][8] 的教程，但如果你需要一个 DokuWiki 的替代品，XWiki 是一个很好的选择。

### XWiki 信息

首先最重要的是：它是自由而开源的！这是一些 XWiki 的功能：

*   一个非常强大的所见即所得编辑器
*   强大的 wiki 语法
*   强大的权限管理
*   响应式皮肤
*   高级搜索
*   独特的应用程序集
*   还有更多功能……

### 为何使用 XWiki？

它已经开发了 10 多年，XWiki 被许多知名公司使用作为：

*   知识库
*   内网协作
*   公开网站
*   商业应用
*   其他等……

### XWiki 要求

*   Java 8 或更高版本
*   支持 Servlet 3.0.1 的 Servlet 容器
*   用于支持数据库的 JDBC 4 驱动程序
*   至少 2GB RAM（对于较小的 wiki 是 1GB）
*   你可以用 $10 从 [Linode][1] 买到 2GB RAM VPS。但是，它是[非管理][2]的 VPS。如果你想要一个[管理 VPS][3]，你可以搜索一下供应商。如果你得到一个管理 VPS，他们可能会为你安装 XWiki。

我们将在本教程中使用 CentOS 7 服务器。

### CentOS 7 中 XWiki 安装指南

让我们开始吧。首先登录 CentOS VPS，更新你的系统：

```
yum update
```

如果你还没有安装 nano 和 wget，就先安装：

```
yum install nano wget
```

### 安装 Java

XWiki 基于并运行于 Java 环境，因此我们需要安装 Java。要安装它，运行下面的命令：

```
yum install java
```

要验证是否已经成功安装，运行：

```
java -version
```

### 下载并安装 XWiki

目前，XWiki 最新的版本是 8.4.4，如果还有更新的版本，你可以用更新命令更新。

要下载 XWiki 安装器，运行：

```
wget http://download.forge.ow2.org/xwiki/xwiki-enterprise-installer-generic-8.4.4-standard.jar
```

要运行安装器，输入下面的命令：

```
java -jar xwiki-enterprise-installer-generic-8.4.4-standard.jar
```

现在，安装器会有提示地询问你几个问题，分别输入 `1`（接受）、`2`（退出）、`3`（重新显示）。大多数提示可以回答 `1`（接受）。这个安装器是不言自明的，易于理解，因此只要遵循其每步建议就行。

### 启动 XWiki

要启动 XWiki，你需要进入你先前选择的目录：

```
cd /usr/local/"XWiki Enterprise 8.4.4"
```

并运行脚本：

```
bash start_xwiki.sh
```

等待脚本执行完毕就行了。XWiki 已经安装并已启动。就是这么简单。

现在你可以在 8080 端口上通过域名或者服务器 IP 访问 XWiki 了：

```
http://server-ip:8080
```

或者

```
http://example.com:8080
```

XWiki 默认运行在 8080 端口，但如果你想要使用 80 端口，确保没有其他程序运行在 80 端口，并用下面的命令启动 XWiki： 

```
bash start_xwiki.sh -p 80
```

现在你可以不用指定端口访问 XWiki 了。当你访问时，你应该会看见默认的 XWiki 主页，类似于这样：

 ![xwiki start page](https://thishosting.rocks/wp-content/uploads/2017/02/xwiki-starting-page.jpg.webp) 

XWiki 默认的管理员用户及密码为：

- 用户名：Admin
- 密码：admin

使用它们登录并访问管理面板。祝你在新的 wiki 中使用愉快！

--------------------------------------------------------------------------------

via: https://thishosting.rocks/how-to-build-your-own-wiki-with-xwiki-on-centos/

作者：[thishosting.rocks][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks
[1]:https://thishosting.rocks/go/linode
[2]:https://thishosting.rocks/cheap-cloud-hosting-providers-comparison/
[3]:https://thishosting.rocks/best-cheap-managed-vps/
[4]:https://thishosting.rocks/category/knowledgebase/
[5]:https://thishosting.rocks/tag/wiki/
[6]:https://thishosting.rocks/tag/xwiki/
[7]:https://thishosting.rocks/2017/02/12/
[8]:https://linux.cn/article-8178-1.html
