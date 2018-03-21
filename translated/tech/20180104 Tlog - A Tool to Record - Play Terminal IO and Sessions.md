Tlog - 录制/播放终端 IO 和会话的工具
======
Tlog 是 Linux 中终端 I/O 录制和回放软件包。它用于实现集中式用户会话录制。它将所有经过的消息录制为 JSON 消息。录制为 JSON 格式的主要目的是将数据传送到 Elasticsearch 之类的存储服务，可以从中搜索和查询，以及回放。同时，他们保留所有通过的数据和时序。

Tlog 包含三个工具，分别是 tlog-rec、tlog-rec-session 和 tlog-play。

  * `Tlog-rec tool`  一般用于录制终端、程序或 shell 的输入或输出。
  * `Tlog-rec-session tool` 用于录制整个终端会话的 I/O，并保护录制的用户。
  * `Tlog-rec-session tool` 用于回放录制。



在本文中，我将解释如何在 CentOS 7.4 服务器上安装 Tlog。

### 安装

在安装之前，我们需要确保我们的系统满足编译和安装程序的所有软件要求。在第一步中，使用以下命令更新系统仓库和软件包。
```
#yum update
```

我们需要安装此软件安装所需的依赖项。在安装之前，我已经使用这些命令安装了所有依赖包。
```
#yum install wget gcc
#yum install systemd-devel json-c-devel libcurl-devel m4
```

完成这些安装后，我们可以下载该工具的[源码包][1]并根据需要将其解压到服务器上：
```
#wget https://github.com/Scribery/tlog/releases/download/v3/tlog-3.tar.gz
#tar -xvf tlog-3.tar.gz
# cd tlog-3
```

现在，你可以使用我们通常的配置和制作方法开始构建此工具。
```
#./configure --prefix=/usr --sysconfdir=/etc && make
#make install
#ldconfig
```

最后，你需要运行 `ldconfig`。它会创建必要的链接，并缓存命令行中指定目录中最近的共享库。（ /etc/ld.so.conf 中的文件，以及信任的目录 （/lib and /usr/lib））

### Tlog 工作流程图

![Tlog working process][2]

首先，用户通过 PAM 进行身份验证登录。名称服务交换机（NSS）提供的 `tlog` 信息是用户的 shell。这初始化了 tlog 部分，并从环境变量/配置文件收集关于实际 shell 的信息，并以 PTY 的形式启动实际的 shell。然后通过 syslog 或 sd-journal 开始录制在终端和 PTY 之间传递的所有内容。

### 用法

你可以使用  `tlog-rec`  录制一个会话并使用  `tlog-play` 回放它来测试新安装的 tlog 是否能够正常录制和回放会话。

#### 录制到文件中

要将会话录制到文件中，请在命令行中执行 `tlog-rec`，如下所示：
```
tlog-rec --writer=file --file-path=tlog.log
```

该命令会将我们的终端会话录制到名为 tlog.log 的文件中，并将其保存在命令中指定的路径中。

#### 从文件中回放

你可以在录制过程中或录制后使用 `tlog-play` 命令回放录制的会话。
```
tlog-play --reader=file --file-path=tlog.log
```

该命令从指定的路径读取先前录制的文件 tlog.log。

### 总结

Tlog 是一个开源软件包，可用于实现集中式用户会话录制。它主要是作为一个更大的用户会话录制解决方案的一部分使用，但它被设计为独立且可重用的。该工具可以帮助录制用户所做的一切并将其存储在服务器的某个位置，以备将来参考。你可以从这个[文档][3]中获得关于这个软件包使用的更多细节。我希望这篇文章对你有用。请发表你的宝贵建议和意见。

### 关于 Saheetha Shameer （作者）
我正在担任高级系统管理员。我是一名快速学习者，有轻微的倾向跟随行业中目前和正在出现的趋势。我的爱好包括听音乐、玩策略游戏、阅读和园艺。我对尝试各种美食也有很高的热情 :-)

--------------------------------------------------------------------------------

via: https://linoxide.com/linux-how-to/tlog-tool-record-play-terminal-io-sessions/

作者：[Saheetha Shameer][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linoxide.com/author/saheethas/
[1]:https://github.com/Scribery/tlog/releases/download/v3/tlog-3.tar.gz
[2]:https://linoxide.com/wp-content/uploads/2018/01/Tlog-working-process.png
[3]:https://github.com/Scribery/tlog/blob/master/README.md
