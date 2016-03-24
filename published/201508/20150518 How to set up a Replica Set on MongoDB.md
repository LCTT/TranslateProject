如何配置 MongoDB 副本集
================================================================================

MongoDB 已经成为市面上最知名的 NoSQL 数据库。MongoDB 是面向文档的，它的无模式设计使得它在各种各样的WEB 应用当中广受欢迎。最让我喜欢的特性之一是它的副本集（Replica Set），副本集将同一数据的多份拷贝放在一组 mongod 节点上，从而实现数据的冗余以及高可用性。

这篇教程将向你介绍如何配置一个 MongoDB 副本集。

副本集的最常见配置需要一个主节点以及多个副节点。这之后启动的复制行为会从这个主节点到其他副节点。副本集不止可以针对意外的硬件故障和停机事件对数据库提供保护，同时也因为提供了更多的节点从而提高了数据库客户端数据读取的吞吐量。

### 配置环境 ###

这个教程里，我们会配置一个包括一个主节点以及两个副节点的副本集。

![](https://farm8.staticflickr.com/7667/17801038505_529a5224a1.jpg)

为了达到这个目的，我们使用了3个运行在 VirtualBox 上的虚拟机。我会在这些虚拟机上安装 Ubuntu 14.04，并且安装 MongoDB 官方包。

我会在一个虚拟机实例上配置好所需的环境，然后将它克隆到其他的虚拟机实例上。因此，选择一个名为 master 的虚拟机，执行以下安装过程。

首先，我们需要给 apt 增加一个 MongoDB 密钥：

    $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

然后，将官方的 MongoDB 仓库添加到 source.list 中：

    $ sudo su
    # echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

接下来更新 apt 仓库并且安装 MongoDB。

    $ sudo apt-get update
    $ sudo apt-get install -y mongodb-org

现在对 /etc/mongodb.conf 做一些更改

    auth = true
    dbpath=/var/lib/mongodb
    logpath=/var/log/mongodb/mongod.log
    logappend=true
    keyFile=/var/lib/mongodb/keyFile
    replSet=myReplica

第一行的作用是表明我们的数据库需要验证才可以使用。keyfile 配置用于 MongoDB 节点间复制行为的密钥文件。replSet 为副本集设置一个名称。

接下来我们创建一个用于所有实例的密钥文件。

    $ echo -n "MyRandomStringForReplicaSet" | md5sum > keyFile

这将会创建一个含有 MD5 字符串的密钥文件，但是由于其中包含了一些噪音，我们需要对他们清理后才能正式在 MongoDB 中使用。

    $ echo -n "MyReplicaSetKey" | md5sum|grep -o "[0-9a-z]\+" > keyFile

grep 命令的作用的是把将空格等我们不想要的内容过滤掉之后的 MD5 字符串打印出来。

现在我们对密钥文件进行一些操作，让它真正可用。

    $ sudo cp keyFile /var/lib/mongodb
    $ sudo chown mongodb:nogroup keyFile
    $ sudo chmod 400 keyFile

接下来，关闭此虚拟机。将其 Ubuntu 系统克隆到其他虚拟机上。

![](https://farm9.staticflickr.com/8729/17800903865_9876a9cc9c.jpg)

这是克隆后的副节点1和副节点2。确认你已经将它们的MAC地址重新初始化，并且克隆整个硬盘。

![](https://farm6.staticflickr.com/5333/17613392900_6de45c9450.jpg)

请注意，三个虚拟机示例需要在同一个网络中以便相互通讯。因此，我们需要它们弄到“互联网"上去。

这里推荐给每个虚拟机设置一个静态 IP 地址，而不是使用 DHCP。这样它们就不至于在 DHCP 分配IP地址给他们的时候失去连接。

像下面这样编辑每个虚拟机的 /etc/networks/interfaces 文件。

在主节点上:

    auto eth1
        iface eth1 inet static
        address 192.168.50.2
        netmask 255.255.255.0

在副节点1上:

    auto eth1
        iface eth1 inet static
        address 192.168.50.3
        netmask 255.255.255.0

在副节点2上:

    auto eth1
        iface eth1 inet static
        address 192.168.50.4
        netmask 255.255.255.0

由于我们没有 DNS 服务，所以需要设置设置一下 /etc/hosts 这个文件，手工将主机名称放到此文件中。

在主节点上:

    127.0.0.1 localhost primary
    192.168.50.2 primary
    192.168.50.3 secondary1
    192.168.50.4 secondary2

在副节点1上:

    127.0.0.1 localhost secondary1
    192.168.50.2 primary
    192.168.50.3 secondary1
    192.168.50.4 secondary2

在副节点2上:

    127.0.0.1 localhost secondary2
    192.168.50.2 primary
    192.168.50.3 secondary1
    192.168.50.4 secondary2

使用 ping 命令检查各个节点之间的连接。

    $ ping primary
    $ ping secondary1
    $ ping secondary2

### 配置副本集 ###

验证各个节点可以正常连通后，我们就可以新建一个管理员用户，用于之后的副本集操作。

在主节点上，打开 /etc/mongodb.conf 文件，将 auth 和 replSet 两项注释掉。

    dbpath=/var/lib/mongodb
    logpath=/var/log/mongodb/mongod.log
    logappend=true
    #auth = true
    keyFile=/var/lib/mongodb/keyFile
    #replSet=myReplica
    
在一个新安装的 MongoDB 上配置任何用户或副本集之前，你需要注释掉 auth 行。默认情况下，MongoDB 并没有创建任何用户。而如果在你创建用户前启用了 auth，你就不能够做任何事情。你可以在创建一个用户后再次启用 auth。 

修改 /etc/mongodb.conf 之后，重启 mongod 进程。

    $ sudo service mongod restart

现在连接到 MongoDB master：

	$ mongo <master-ip-address>:27017

连接 MongoDB 后，新建管理员用户。

    > use admin
    > db.createUser({
    user:"admin",
    pwd:"
    })
    
重启 MongoDB：

    $ sudo service mongod restart

再次连接到 MongoDB，用以下命令将 副节点1 和副节点2节点添加到我们的副本集中。

    > use admin
    > db.auth("admin","myreallyhardpassword")
    > rs.initiate()
    > rs.add ("secondary1:27017")
    > rs.add("secondary2:27017")


现在副本集到手了，可以开始我们的项目了。参照 [官方驱动文档][1] 来了解如何连接到副本集。如果你想要用 Shell 来请求数据，那么你需要连接到主节点上来插入或者请求数据，副节点不行。如果你执意要尝试用副本集操作，那么以下错误信息就蹦出来招呼你了。

    myReplica:SECONDARY>
    myReplica:SECONDARY> show databases
    2015-05-10T03:09:24.131+0000 E QUERY    Error: listDatabases failed:{ "note" : "from execCommand", "ok" : 0, "errmsg" : "not master" }
        at Error ()
        at Mongo.getDBs (src/mongo/shell/mongo.js:47:15)
        at shellHelper.show (src/mongo/shell/utils.js:630:33)
    at shellHelper (src/mongo/shell/utils.js:524:36)
        at (shellhelp2):1:1 at src/mongo/shell/mongo.js:47
        
如果你要从 shell 连接到整个副本集，你可以安装如下命令。在副本集中的失败切换是自动的。

	$ mongo primary,secondary1,secondary2:27017/?replicaSet=myReplica

如果你使用其它驱动语言（例如，JavaScript、Ruby 等等），格式也许不同。

希望这篇教程能对你有所帮助。你可以使用Vagrant来自动完成你的本地环境配置，并且加速你的代码。

--------------------------------------------------------------------------------

via: http://xmodulo.com/setup-replica-set-mongodb.html

作者：[Christopher Valerio][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:http://docs.mongodb.org/ecosystem/drivers/
