[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11175-1.html)
[#]: subject: (How to Install MongoDB on Ubuntu)
[#]: via: (https://itsfoss.com/install-mongodb-ubuntu)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何在 Ubuntu 上安装 MongoDB
======

> 本教程介绍了在 Ubuntu 和基于 Ubuntu 的 Linux 发行版上安装 MongoDB 的两种方法。

[MongoDB][1] 是一个越来越流行的自由开源的 NoSQL 数据库，它将数据存储在类似 JSON 的灵活文档集中，这与 SQL 数据库中常见的表格形式形成对比。

你很可能发现在现代 Web 应用中使用 MongoDB。它的文档模型使得使用各种编程语言能非常直观地访问和处理它。

![mongodb Ubuntu][2]

在本文中，我将介绍两种在 Ubuntu 上安装 MongoDB 的方法。

### 在基于 Ubuntu 的发行版上安装 MongoDB

1. 使用 Ubuntu 仓库安装 MongoDB。简单但不是最新版本的 MongoDB
2. 使用其官方仓库安装 MongoDB。稍微复杂，但你能得到最新版本的 MongoDB。

第一种安装方法更容易，但如果你计划使用官方支持的最新版本，那么我建议使用第二种方法。

有些人可能更喜欢使用 snap 包。Ubuntu 软件中心提供了 snap，但我不建议使用它们，因为他们现在已经过期了，因此我这里不会提到。

### 方法 1：从 Ubuntu 仓库安装 MongoDB

这是在系统中安装 MongoDB 的简便方法，你只需输入一个命令即可。

#### 安装 MongoDB

首先，确保你的包是最新的。打开终端并输入：

```
sudo apt update && sudo apt upgrade -y
```

继续安装 MongoDB：

```
sudo apt install mongodb
```

这就完成了！MongoDB 现在安装到你的计算机上了。

MongoDB 服务应该在安装时自动启动，但要检查服务状态：

```
sudo systemctl status mongodb
```

![Check if the MongoDB service is running.][3]

你可以看到该服务是**活动**的。

#### 运行 MongoDB

MongoDB 目前是一个 systemd 服务，因此我们使用 `systemctl` 来检查和修改它的状态，使用以下命令：

```
sudo systemctl status mongodb
sudo systemctl stop mongodb
sudo systemctl start mongodb
sudo systemctl restart mongodb
```

你也可以修改 MongoDB 是否自动随系统启动（默认：启用）：

```
sudo systemctl disable mongodb
sudo systemctl enable mongodb
```

要开始使用（创建和编辑）数据库，请输入：

```
mongo
```

这将启动 **mongo shell**。有关查询和选项的详细信息，请查看[手册][4]。

**注意：**根据你计划使用 MongoDB 的方式，你可能需要调整防火墙。不过这超出了本篇的内容，并且取决于你的配置。

#### 卸载 MongoDB

如果你从 Ubuntu 仓库安装 MongoDB 并想要卸载它（可能要使用官方支持的方式安装），请输入：

```
sudo systemctl stop mongodb
sudo apt purge mongodb
sudo apt autoremove
```

这应该会完全卸载 MongoDB。确保**备份**你可能想要保留的任何集合或文档，因为它们将被删除！

### 方法 2：在 Ubuntu 上安装 MongoDB 社区版

这是推荐的安装 MongoDB 的方法，它使用包管理器。你需要多打几条命令，对于 Linux 新手而言，这可能会感到害怕。

但没有什么可怕的！我们将一步步说明安装过程。

#### 安装 MongoDB

由 MongoDB Inc. 维护的包称为 `mongodb-org`，而不是 `mongodb`（这是 Ubuntu 仓库中包的名称）。在开始之前，请确保系统上未安装 `mongodb`。因为包之间会发生冲突。让我们开始吧！

首先，我们必须导入公钥：

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
```

现在，你需要在源列表中添加一个新的仓库，以便你可以安装 MongoDB 社区版并获得自动更新：

```
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
```

要安装 `mongodb-org`，我们需要更新我们的包数据库，以便系统知道可用的新包：

```
sudo apt update
```

现在你可以安装**最新稳定版**的 MongoDB：

```
sudo apt install -y mongodb-org
```

或者某个**特定版本**（在 `=` 后面修改版本号）

```
sudo apt install -y mongodb-org=4.0.6 mongodb-org-server=4.0.6 mongodb-org-shell=4.0.6 mongodb-org-mongos=4.0.6 mongodb-org-tools=4.0.6
```

如果你选择安装特定版本，请确保在所有位置都修改了版本号。如果你修改了 `mongodb-org=4.0.6`，你将安装最新版本。

默认情况下，使用包管理器（`apt-get`）更新时，MongoDB 将更新为最新的版本。要阻止这种情况发生（并冻结为已安装的版本），请使用：

```
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
```

你现在已经成功安装了 MongoDB！

#### 配置 MongoDB

默认情况下，包管理器将创建 `/var/lib/mongodb` 和 `/var/log/mongodb`，MongoDB 将使用 `mongodb` 用户帐户运行。

我不会去更改这些默认设置，因为这超出了本指南的范围。有关详细信息，请查看[手册][5]。

`/etc/mongod.conf` 中的设置在启动/重新启动 **mongodb** 服务实例时生效。

##### 运行 MongoDB

要启动 mongodb 的守护进程 `mongod`，请输入：

```
sudo service mongod start
```

现在你应该验证 `mongod` 进程是否已成功启动。此信息（默认情况下）保存在 `/var/log/mongodb/mongod.log` 中。我们来看看文件的内容：

```
sudo cat /var/log/mongodb/mongod.log
```

![Check MongoDB logs to see if the process is running properly.][6]

只要你在某处看到：`[initandlisten] waiting for connections on port 27017`，就说明进程正常运行。

**注意**：27017 是 `mongod` 的默认端口。

要停止/重启 `mongod`，请输入：

```
sudo service mongod stop
sudo service mongod restart
```

现在，你可以通过打开 **mongo shell** 来使用 MongoDB：

```
mongo
```

#### 卸载 MongoDB

运行以下命令：

```
sudo service mongod stop
sudo apt purge mongodb-org*
```

要删除**数据库**和**日志文件**（确保**备份**你要保留的内容！）：

```
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb
```

### 总结

MongoDB 是一个很棒的 NoSQL 数据库，它易于集成到现代项目中。我希望本教程能帮助你在 Ubuntu 上安装它！在下面的评论中告诉我们你计划如何使用 MongoDB。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-mongodb-ubuntu

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.mongodb.com/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/mongodb-ubuntu.jpeg?resize=800%2C450&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/mongodb_check_status.jpg?fit=800%2C574&ssl=1
[4]: https://docs.mongodb.com/manual/tutorial/getting-started/
[5]: https://docs.mongodb.com/manual/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/mongodb_org_check_logs.jpg?fit=800%2C467&ssl=1
