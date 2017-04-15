
在树莓派上通过Apache Spark on YARN搭建Hadoop集群
===
有些时候我们想从DQYDJ网站的数据中分析点有用的东西出来，在过去，我们要用R语言提取固定宽度的数据，然后通过数学建模分析美国的最低收入补贴，当然也包括其他优秀的方法。

今天我将向你展示对大数据的一点探索，不过有点变化，使用的是全世界最流行的微型电脑————树莓派，如果手头没有，那就看下一篇吧（可能是已经处理好的数据）对于其他用户，请继续阅读吧，今天我们要建立一个树莓派 Hadoop集群！


为什么要建立一个Raspberry Pi的Hadoop集群？

![](https://dqydj.com/wp-content/uploads/2016/08/IMG_9132-245x300.png)
>由三个树莓派节点组成的Hadoop集群

对DQYDJ这句谚语我们做了大量的数据处理工作，但这些还不能称得上是大数据。

和许许多多有争议的话题一样，数据的大小之别被解释成这样一个笑话：

如果能被RAM所存储，那么它就不是大数据。 ————佚名

似乎这儿有两种解决问题的方法：

1.我们可以找到一个足够大的数据集合，任何家用电脑的内存都存不下。
2.我们可以

上手树莓派2B

这个由设计师和工程师制作出来的精致小玩意儿拥有1GB的RAM，扩展SD卡充当它的硬盘，此外，每一台的价格都低于50刀，这意味着你可以花不到250刀的价格搭建一个集群。

或许天下没有比这更便宜的入场券来带你进入大数据的大门。

### 制作一个树莓派集群

我最喜欢制作的原材料。

这里我将给出我原来为了制作树莓派集群购买原材料的链接，如果以后要在亚马逊购买的话你可先这些链接收藏起来，也是对本站的一点支持。(谢谢)

- 树莓派2B x3
- 集群原理图
- 4层亚克力支架
- 6口USB转接器
- 内存卡
- MicroUSB数据线
- 短网线
- 双面胶

开始制作

1.首先，装好三个树莓派，每一个用螺丝钉固定在亚克力面板上。（看下图）
2.接下来，安装以太网交换机，用双面胶贴在其中一个在亚克力面板上。
3.用双面胶贴将USB转接器贴在一个在亚克力面板使之成为最顶层。
4.接着就是一层一层都拼好——这里我选择将树莓派放在交换机和USB转接器的底下（可以看看完整安装好的两张截图）

如果你需要电线的话我想出了一个好方法-如果你和我一样购买力USB线和网线，我可以将它们卷起来放在亚克力板子的每一层

现在不要急着上电，需要将系统烧录到SD卡上才能继续。

烧录

按照这个教程将Raspbian烧录到三张SD卡上，我使用的是Win7下的[Win32DiskImager][2]。

将其中一张烧录好的SD卡插在你想作为主节点的树莓派上，连接USB线并启动它。

启动主节点

这里有一篇非常棒的教程，讲如何安装Hadoop 2.7.1，此处就不再熬述。

在启动过程中有一些要注意的地方，我将和你一起设置直到最后一步，记住我现在使用的IP段为192.168.1.50 – 192.168.1.52，主节点是.50，从节点是.51和.52，你的网络可能会有所不同，如果你想设置静态IP的话可以在评论区看看或讨论。

一旦你完成了这些步骤，接下来要做的就是启用交换文件，Spark on YARN将分割出一块很接近内存空间的交换文件，当你内存快用完时便会使用这个交换分区。

（如果你以前没有做过有关交换分区的操作的话，可以看看这篇教程，记住交换分区不要太多，因为内存卡的性能扛不住）

现在我准备介绍有关我和其他Geek关于启动设置一些微妙的区别

对于初学者，确保你给你的树莓派起了一个名字——在/etc/hostname设置，我的主节点设置为‘RaspberryPiHadoopMaster’ ，从节点设置为 ‘RaspberryPiHadoopSlave#’

主节点的/etc/hosts配置如下：

如果你想让 Hadoop, YARN, and Spark运行正常的话，你也需要修改这些配置文件。

hdfs-site.xml:

```
yarn-site.xml (Note the changes in memory!):

slaves:

core-site.xml:
```

设置从节点：

接下来按照Because We Can Geek上的教程，你需要对上面的文件作出小小的改动。主节点没有改变其中的yarn-site.xml，所以从节点中不必含有这个文件。

III.在我们的树莓派集群中测试YARN!

如果所有设备都正常工作，在主节点上你应该执行如下命令：

> start-dfs.sh

> start-yarn.sh

当设备启动后，遵循教程以Hadoop用户方式执行。

接下来执行`hdfs dfsadmin -report`查看三个节点是否都正确启动，确认你看到一行粗体文字‘Live datanodes (3)’：

Configured Capacity: 93855559680 (87.41 GB)
Raspberry Pi Hadoop Cluster picture Straight On
Present Capacity: 65321992192 (60.84 GB)
DFS Remaining: 62206627840 (57.93 GB)
DFS Used: 3115364352 (2.90 GB)
DFS Used%: 4.77%
Under replicated blocks: 0
Blocks with corrupt replicas: 0
Missing blocks: 0
Missing blocks (with replication factor 1): 0
————————————————-
Live datanodes (3):
Name: 192.168.1.51:50010 (RaspberryPiHadoopSlave1)
Hostname: RaspberryPiHadoopSlave1
Decommission Status : Normal

你现在可以做一些简单的诸如‘Hello, World!’的测试，或者直接进行下一步。

IV.安装SPARK ON YARN

YARN是另一种非常好用的资源调度器，已经集成在Hadoop安装包中。

Apache Spark 是 Hadoop 生态圈中的一款软件包，它是一个可执行的引擎。就像著名的预装软件MapReduce一样。在一般情况下，Spark得益于存储在基于磁盘的MapReduce。运行负载堪比10-100倍的MapReduce-安装完成后你可以试试Spark 和 MapReduce的有什么不同。

我个人对Spark还是留下非常深刻的印象，因为它提供了两种数据工程师和科学家都比较擅长的语言– Python 和 R。

安装Apache Spark非常简单，在你家目录下，wget这个地址，然后‘tar -xzf ’，最后把解压出来的文件移动至 /opt 并清除刚才下载的文件，以上这些就是安装步骤。

我又创建了只有两行的文件spark-env.sh，其中包含Spark的配置文件目录。

SPARK_MASTER_IP=192.168.1.50

SPARK_WORKER_MEMORY=512m

(在YARN跑起来之前我不确定这些是否有必要。)

V. 你好，世界! 为Apache Spark发现一个有趣的数据集!

在Hadoop进行对‘Hello, World!’的单词计数。

我决定改进一下`hello world`的例子，这个例子在平常也用不上，也许统计一些关于我自己的大数据会更有用…

如果你有一个正在运行的`WordPress`博客，可以通过简单的两步来导出和

我使用`Export to Text‘导出文章的内容到纯文本文件中，我使用一些压缩库编写了一个`Python`来压缩了`HTML文件`，现在你可以将一个更小的文件复制到pi搭建的HDFS集群。

如果你没有进行上面的操作，还有一种方法将文件转移到pi上

>hdfs dfs -copyFromLocal dqydj_stripped.txt /dqydj_stripped.txt

现在准备进行最后一步 - 向Apache Spark写入相同的代码。

### VI: 点燃 Apache Spark

我们的单词计数程序基于Cloudera进行修改，你可以在这里找到。我们要修改我们的自己的单词计数程序。

在主节点上安装‘stop-words’这个`python`第三方包，有趣的是我在DQYDJ上使用了23,295次the这个单词，你可能不想看到这些语法单词占据着单词计数的前列，另外，用下列代码替换所有有关dqydj的参考文件，注意你自己的数据库路径。

保存好wordCount.py确保上面的路径都是正确无误的。

现在，通过运行在YARN上的Spark，你可以看到我在DQYDJ使用最多的单词是哪一个。

>/opt/spark-2.0.0-bin-hadoop2.7/bin/spark-submit –master yarn –executor-memory 512m –name wordcount –executor-cores 8 wordCount.py /dqydj_stripped.txt

### 我在DQYDJ使用最多的单词

可能入列的单词有哪一些呢？can, will, it’s, one, even, like, people, money, don’t, also“.

嘿，不差钱–悄悄进入前十。在一个致力于金融、投资和经济的网站上谈论这似乎是件好事，对吧？

这是余下的50个最常用的词汇，请用他们得出有关我余下文章的结论。

![](https://dqydj.com/wp-content/uploads/2016/08/dqydj_pk_most_used_words.png)

我希望你能喜欢这篇关于Hadoop, YARN, 和 Apache Spark的教程，现在你可以在Spark运行其他的任务。

你的下一步是任务是开始读pyspark文档（库或其他语言）去学习一些可用的功能。根据你的兴趣和你实际存储的数据，你将会深入学习到有流数据包的SQL，甚至机器学习！

你要建立一个树莓派集群吗？看看你使用最频繁的单词是什么？

--------------------------------------------------------------------------------

原文: https://dqydj.com/raspberry-pi-hadoop-cluster-apache-spark-yarn/?utm_source=dbweekly&utm_medium=email

作者：[PK][a]
译者：[popy32](https://github.com/sfantree)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dqydj.com/about/#contact_us
[1]: https://www.raspberrypi.org/downloads/raspbian/
[2]: https://sourceforge.net/projects/win32diskimager/
[3]: http://www.becausewecangeek.com/building-a-raspberry-pi-hadoop-cluster-part-1/
[4]: https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
[5]: http://www.becausewecangeek.com/building-a-raspberry-pi-hadoop-cluster-part-2/
[6]: https://spark.apache.org/
[7]: https://hadoop.apache.org/docs/r1.2.1/mapred_tutorial.html
[8]: https://spark.apache.org/downloads.html
[9]: https://wordpress.org/support/plugin/export-to-text
[10]: https://pypi.python.org/pypi/bleach

