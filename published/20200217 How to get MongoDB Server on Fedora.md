[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11942-1.html)
[#]: subject: (How to get MongoDB Server on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-get-mongodb-server-on-fedora/)
[#]: author: (Honza Horak https://fedoramagazine.org/author/hhorak/)

如何在 Fedora 上安装 MongoDB 服务器
======

![][1]

Mongo（来自 “humongous” —— 巨大的）是一个高性能、开源、无模式的、面向文档的数据库，它是最受欢迎的 [NoSQL][2] 数据库之一。它使用 JSON 作为文档格式，并且可以在多个服务器节点之间进行扩展和复制。

### 有关许可证更改的故事

MongoDB 上游决定更改服务器代码的许可证已经一年多了。先前的许可证是 GNU Affero General Public License v3（AGPLv3）。但是，上游公司写了一个新许可证，旨在使运行 MongoDB 即服务的公司可以回馈社区。新许可证称为 Server Side Public License（SSPLv1），关于这个举措及其解释的更多说明，请参见 [MongoDB SSPL FAQ][3]。

Fedora 一直只包含自由软件。当 SSPL 发布后，Fedora [确定][4]它并不是自由软件许可证。许可证更改日期（2018 年 10 月）之前发布的所有 MongoDB 版本都可保留在 Fedora 中，但之后再也不更新的软件包会带来安全问题。因此，从 Fedora 30 开始，Fedora 社区决定完全[移除 MongoDB 服务器][5]。

### 开发人员还有哪些选择？

是的，还有替代方案，例如 PostgreSQL 在最新版本中也支持 JSON，它可以在无法再使用 MongoDB 的情况下使用它。使用 JSONB 类型，索引在 PostgreSQL 中可以很好地工作，其性能可与 MongoDB 媲美，甚至不会受到 ACID 的影响。

开发人员可能选择 MongoDB 的技术原因并未随许可证而改变，因此许多人仍想使用它。重要的是要意识到，SSPL 许可证仅更改仅针对 MongoDB 服务器。MongoDB 上游还开发了其他项目，例如 MongoDB 工具、C 和 C++ 客户端库以及用于各种动态语言的连接器，这些项目在客户端使用（通过网络与服务器通信的应用中）。由于这些包的许可证人保持自由（主要是 Apache 许可证），因此它们保留在 Fedora 仓库中，因此用户可以将其用于应用开发。

唯一的变化实际是服务器软件包本身，它已从 Fedora 仓库中完全删除。让我们看看 Fedora 用户可以如何获取非自由的包。

### 如何从上游安装 MongoDB 服务器

当 Fedora 用户想要安装 MongoDB 服务器时，他们需要直接向上游获取 MongoDB。但是，上游不为 Fedora 提供 RPM 包。相反，MongoDB 服务器可以获取源码 tarball，用户需要自己进行编译（这需要一些开发知识），或者 Fedora 用户可以使用一些兼容的包。在兼容的选项中，最好的选择是 RHEL-8 RPM。以下步骤描述了如何安装它们以及如何启动守护进程。

#### 1、使用上游 RPM 创建仓库（RHEL-8 构建）

```
$ sudo cat > /etc/yum.repos.d/mongodb.repo >>EOF
[mongodb-upstream]
name=MongoDB Upstream Repository
baseurl=https://repo.mongodb.org/yum/redhat/8Server/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc
EOF
```

#### 2、安装元软件包，来拉取服务器和工具包

```
$ sudo dnf install mongodb-org
......
Installed:
  mongodb-org-4.2.3-1.el8.x86_64           mongodb-org-mongos-4.2.3-1.el8.x86_64  
  mongodb-org-server-4.2.3-1.el8.x86_64    mongodb-org-shell-4.2.3-1.el8.x86_64
  mongodb-org-tools-4.2.3-1.el8.x86_64          

Complete!
```

#### 3、启动 MongoDB 守护进程

```
$ sudo systemctl status mongod
● mongod.service - MongoDB Database Server
   Loaded: loaded (/usr/lib/systemd/system/mongod.service; enabled; vendor preset: disabled)
   Active: active (running) since Sat 2020-02-08 12:33:45 EST; 2s ago
     Docs: https://docs.mongodb.org/manual
  Process: 15768 ExecStartPre=/usr/bin/mkdir -p /var/run/mongodb (code=exited, status=0/SUCCESS)
  Process: 15769 ExecStartPre=/usr/bin/chown mongod:mongod /var/run/mongodb (code=exited, status=0/SUCCESS)
  Process: 15770 ExecStartPre=/usr/bin/chmod 0755 /var/run/mongodb (code=exited, status=0/SUCCESS)
  Process: 15771 ExecStart=/usr/bin/mongod $OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 15773 (mongod)
   Memory: 70.4M
      CPU: 611ms
   CGroup: /system.slice/mongod.service

```

#### 4、通过 mongo shell 连接服务器来验证是否运行

```
$ mongo
MongoDB shell version v4.2.3
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&amp;gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("20b6e61f-c7cc-4e9b-a25e-5e306d60482f") }
MongoDB server version: 4.2.3
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
    http://docs.mongodb.org/
---
```
 

就是这样了。如你所见，RHEL-8 包完美兼容，只要 Fedora 包还与 RHEL-8 兼容，它就应该会一直兼容。请注意，在使用时必须遵守 SSPLv1 许可证。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-get-mongodb-server-on-fedora/

作者：[Honza Horak][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hhorak/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/mongodb-816x348.png
[2]: https://en.wikipedia.org/wiki/NoSQL
[3]: https://www.mongodb.com/licensing/server-side-public-license/faq
[4]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/thread/IQIOBOGWJ247JGKX2WD6N27TZNZZNM6C/
[5]: https://fedoraproject.org/wiki/Changes/MongoDB_Removal
