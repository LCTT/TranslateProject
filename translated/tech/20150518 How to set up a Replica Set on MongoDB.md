如何配置MongoDB副本集（Replica Set）
================================================================================
MongoDB已经成为市面上最知名的NoSQL数据库。MongoDB是面向文档的，它的无模式设计使得它在各种各样的WEB应用当中广受欢迎。最让我喜欢的特性之一是它的副本集，副本集将同一数据的多份拷贝放在一组mongod节点上，从而实现数据的冗余以及高可用性。

这篇教程将向你介绍如何配置一个MongoDB副本集。

副本集的最常见配置涉及到一个主节点以及多个副节点。这之后启动的复制行为会从这个主节点到其他副节点。副本集不止可以针对意外的硬件故障和停机事件对数据库提供保护，同时也因为提供了更多的结点从而提高了数据库客户端数据读取的吞吐量。

### 配置环境 ###

这个教程里，我们会配置一个包括一个主节点以及两个副节点的副本集。

![](https://farm8.staticflickr.com/7667/17801038505_529a5224a1.jpg)

为了达到这个目的，我们使用了3个运行在VirtualBox上的虚拟机。我会在这些虚拟机上安装Ubuntu 14.04，并且安装MongoDB官方包。

我会在一个虚拟机实例上配置好需要的环境，然后将它克隆到其他的虚拟机实例上。因此，选择一个名为master的虚拟机，执行以下安装过程。

首先，我们需要在apt中增加一个MongoDB密钥：

    $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

然后，将官方的MongoDB仓库添加到source.list中：

    $ sudo su
    # echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

接下来更新apt仓库并且安装MongoDB。

    $ sudo apt-get update
    $ sudo apt-get install -y mongodb-org

现在对/etc/mongodb.conf做一些更改

    auth = true
    dbpath=/var/lib/mongodb
    logpath=/var/log/mongodb/mongod.log
    logappend=true
    keyFile=/var/lib/mongodb/keyFile
    replSet=myReplica

第一行的作用是确认我们的数据库需要验证才可以使用的。keyfile用来配置用于MongoDB结点间复制行为的密钥文件。replSet用来为副本集设置一个名称。

接下来我们创建一个用于所有实例的密钥文件。

    $ echo -n "MyRandomStringForReplicaSet" | md5sum > keyFile

这将会创建一个含有MD5字符串的密钥文件，但是由于其中包含了一些噪音，我们需要对他们清理后才能正式在MongoDB中使用。

    $ echo -n "MyReplicaSetKey" | md5sum|grep -o "[0-9a-z]\+" > keyFile

grep命令的作用的是把将空格等我们不想要的内容过滤掉之后的MD5字符串打印出来。

现在我们对密钥文件进行一些操作，让它真正可用。

    $ sudo cp keyFile /var/lib/mongodb
    $ sudo chown mongodb:nogroup keyFile
    $ sudo chmod 400 keyFile

接下来，关闭此虚拟机。将其Ubuntu系统克隆到其他虚拟机上。

![](https://farm9.staticflickr.com/8729/17800903865_9876a9cc9c.jpg)

这是克隆后的副节点1和副节点2。确认你已经将它们的MAC地址重新初始化，并且克隆整个硬盘。

![](https://farm6.staticflickr.com/5333/17613392900_6de45c9450.jpg)

请注意，三个虚拟机示例需要在同一个网络中以便相互通讯。因此，我们需要它们弄到“互联网"上去。

这里推荐给每个虚拟机设置一个静态IP地址，而不是使用DHCP。这样它们就不至于在DHCP分配IP地址给他们的时候失去连接。

像下面这样编辑每个虚拟机的/etc/networks/interfaces文件。

在主结点上:

    auto eth1
        iface eth1 inet static
        address 192.168.50.2
        netmask 255.255.255.0

在副结点1上:

    auto eth1
        iface eth1 inet static
        address 192.168.50.3
        netmask 255.255.255.0

在副结点2上:

    auto eth1
        iface eth1 inet static
        address 192.168.50.4
        netmask 255.255.255.0

由于我们没有DNS服务，所以需要设置设置一下/etc/hosts这个文件，手工将主机名称放到次文件中。

在主结点上:

    127.0.0.1 localhost primary
    192.168.50.2 primary
    192.168.50.3 secondary1
    192.168.50.4 secondary2

在副结点1上:

    127.0.0.1 localhost secondary1
    192.168.50.2 primary
    192.168.50.3 secondary1
    192.168.50.4 secondary2

在副结点2上:

    127.0.0.1 localhost secondary2
    192.168.50.2 primary
    192.168.50.3 secondary1
    192.168.50.4 secondary2

使用ping命令检查各个结点之间的连接。

    $ ping primary
    $ ping secondary1
    $ ping secondary2

### 配置副本集 ###

验证各个结点可以正常连通后，我们就可以新建一个管理员用户，用于之后的副本集操作。

在主节点上，打开/etc/mongodb.conf文件，将auth和replSet两项注释掉。

    dbpath=/var/lib/mongodb
    logpath=/var/log/mongodb/mongod.log
    logappend=true
    #auth = true
    keyFile=/var/lib/mongodb/keyFile
    #replSet=myReplica

重启mongod进程。

    $ sudo service mongod restart

连接MongoDB后，新建管理员用户。

    > use admin
    > db.createUser({
    user:"admin",
    pwd:"
    })
    $ sudo service mongod restart

连接到MongoDB，用以下命令将secondary1和secondary2节点添加到我们的副本集中。

    > use admin
    > db.auth("admin","myreallyhardpassword")
    > rs.initiate()
    > rs.add ("secondary1:27017")
    > rs.add("secondary2:27017")


现在副本集到手了，可以开始我们的项目了。参照 [official driver documentation][1] 来了解如何连接到副本集。如果你想要用Shell来请求数据，那么你需要连接到主节点上来插入或者请求数据，副节点不行。如果你执意要尝试用附件点操作，那么以下错误信息就蹦出来招呼你了。

    myReplica:SECONDARY>
    myReplica:SECONDARY> show databases
    2015-05-10T03:09:24.131+0000 E QUERY    Error: listDatabases failed:{ "note" : "from execCommand", "ok" : 0, "errmsg" : "not master" }
        at Error ()
        at Mongo.getDBs (src/mongo/shell/mongo.js:47:15)
        at shellHelper.show (src/mongo/shell/utils.js:630:33)
    at shellHelper (src/mongo/shell/utils.js:524:36)
        at (shellhelp2):1:1 at src/mongo/shell/mongo.js:47

希望这篇教程能对你有所帮助。你可以使用Vagrant来自动完成你的本地环境配置，并且加速你的代码。

--------------------------------------------------------------------------------

via: http://xmodulo.com/setup-replica-set-mongodb.html

作者：[Christopher Valerio][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:http://docs.mongodb.org/ecosystem/drivers/
