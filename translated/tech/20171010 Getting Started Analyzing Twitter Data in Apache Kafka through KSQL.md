在 Apache Kafka 中通过 KSQL 分析 Twitter 数据入门
============================================================ 

[KSQL][8] 是 Apache Kafka 中的开源的流式 SQL 引擎。它可以让你在 Kafka 主题（topics）上，使用一个简单的并且是交互式的SQL接口，很容易地做一些复杂的流处理。在这个短文中，我们将看到怎么去很容易地配置并运行在一个沙箱中去探索它，使用大家都喜欢的一个演示数据库源： Twitter。我们将去从 teewts 的行流中获取，通过使用 KSQL 中的条件去过滤它。去构建一个合计，如统计 tweets 每个用户每小时的数量。

![](https://www.confluent.io/wp-content/uploads/tweet_kafka-1024x617.png)

首先， [抓取一个汇总平台的拷贝][9]。我使用的是 RPM 但是，如果你想去使用的话，你也可以使用 [tar, zip, etc][10] 。启动 Confluent：

`$ confluent start`

(如果你感兴趣，这是一个 [在Confluent CLI 上的快速教程][11] )

我们将使用 Kafka 连接去从 Twitter 上拖数据。 Twitter 连接器可以在 [on GitHub here][12]上找到。去安装它，像下面这样操作：

`# Clone the git repo
cd /home/rmoff
git clone https://github.com/jcustenborder/kafka-connect-twitter.git`

`# Compile the code
cd kafka-connect-twitter
mvn clean package`

从我们建立的 [连接器][13] 上建立连接， 你要去修改配置文件.自从我们使用 Confluent CLI， 真实的配置文件是 `etc/schema-registry/connect-avro-distributed.properties`, 因此去修改它并增加如下内容：

`plugin.path=/home/rmoff/kafka-connect-twitter/target/kafka-connect-twitter-0.2-SNAPSHOT.tar.gz`

重启动 Kafka 连接：
`confluent stop connect
confluent start connect`

一旦你安装了插件，你可以很容易地去配置它。你可以直接使用 Kafka Connect REST API ，或者创建你的配置文件，这就是我要在这里做的。如果你需要全部的方法查看 [Twitter to grab your API keys first][14]。

假设你写这些到 `/home/rmoff/twitter-source.json`，你可以现在运行：

`$ confluent load twitter_source -d /home/rmoff/twitter-source.json`

然后 tweets 从大家都喜欢的网络明星 [rick]-rolling in…开始

现在我们从 KSQL 开始 ! 马上去下载并构建它：

`cd /home/rmoff  `
`git clone https://github.com/confluentinc/ksql.git  `
`cd /home/rmoff/ksql  `
`mvn clean compile install -DskipTests`

构建完成后，让我们来运行它：

`./bin/ksql-cli local --bootstrap-server localhost:9092`

使用 KSQL， 我们可以让我们的数据保留在 Kafka 话题上并可以查询它。首先，我们需要去告诉 KSQL 主题上的数据模式（schema）是什么，一个 twitter 消息是一个真实的非常好的巨大的 JSON 对象， 但是，为了简洁，我们只好选出几个行去开始它：

`ksql> CREATE STREAM twitter_raw (CreatedAt BIGINT, Id BIGINT, Text VARCHAR) WITH (KAFKA_TOPIC='twitter_json_01', VALUE_FORMAT='JSON');` 
`Message  `
`----------------`
`Stream created`

在定义的模式中，我们可以查询这些流。使用 KSQL 去展示从开始的主题中取得的数据 (而不是当前时间点，它是缺省的)，运行：

`ksql> SET 'auto.offset.reset' = 'earliest';  `
`Successfully changed local property 'auto.offset.reset' from 'null' to 'earliest'`

现在，让我们看看这些数据，我们将使用 LIMIT 从句仅检索一行：

现在，让我们使用刚才定义的可用的 tweet 负荷的全部内容重新定义流：

现在，我们可以操作和检查更多的最近的数据，使用一般的 SQL 查询：

注意这里没有 LIMIT 从句，因此，你将在屏幕上看到  _continuous query_ 的结果。不像关系表中返回一个确定数量结果的查询，一个运行在无限的流式数据上的持续查询， 因此，它总是可能返回更多的记录。点击 Ctrl-C 去中断燕返回到 KSQL 提示符。在以上的查询中我们做了一些事情：

*   TIMESTAMPTOSTRING 去转换时间戳从 epoch 到人类可读格式。（译者注： epoch 指的是一个特定的时间 1970-01-01 00:00:00 UTC）

*   EXTRACTJSONFIELD 去展示源中嵌套的用户域中的一个，它看起来像：

*   应用谓语去展示内容，对#（hashtag）使用模式匹配， 使用 LCASE 去强制小写字母。（译者注：hashtag，twitter中用来标注线索主题的标签）

关于支持的功能列表，查看 [the KSQL documentation][15]。

我们可以创建一个从这个数据中得到的流：

并且查询这个得到的流：

在我们完成之前，让我们去看一下怎么去做一些聚合。

你将可能得到满屏幕的结果；这是因为 KSQL 在每次给定的时间窗口更新时实际发出聚合值。自从我们设置 KSQL 去读取在主题 (`SET 'auto.offset.reset' = 'earliest';`) 上的全部消息，它是一次性读取这些所有的消息并计算聚合更新。这里有一个微妙之处值得去深入研究。我们的入站 tweets 流正好就是一个流。但是，现有它不能创建聚合，我们实际上是创建了一个表。一个表是在给定时间点的给定键的值的一个快照。 KSQL 聚合数据基于消息事件的时间，并且如果它更新了，通过简单的相关窗口重申去操作后面到达的数据。困惑了吗？ 我希望没有，但是，让我们看一下，如果我们可以用这个例子去说明。 我们将申明我们的聚合作为一个真实的表：

看表中的列，这里除了我们要求的外，还有两个隐含列：

`ksql> DESCRIBE user_tweet_count;

Field           | Type  
-----------------------------------  
ROWTIME         | BIGINT  
ROWKEY          | VARCHAR(STRING)  
USER_SCREENNAME | VARCHAR(STRING)  
TWEET_COUNT     | BIGINT  
ksql>`

我们看一下这些是什么：

 `ROWTIME` 是窗口开始时间，  `ROWKEY` 是 `GROUP BY`(`USER_SCREENNAME`) 加上窗口的组合。因此，我们可以通过创建另外一个衍生的表来整理一下：

现在它更易于查询和查看我们感兴趣的数据：

### 结论

所以我们有了它！ 我们可以从 Kafka 中取得数据， 并且很容易使用 KSQL 去探索它。 而不仅是去浏览和转换数据，我们可以很容易地使用 KSQL 从流和表中建立流处理。

![](https://www.confluent.io/wp-content/uploads/user_tweet-1024x569.png)

如果你对 KSQL 能够做什么感兴趣，去查看：

*   [KSQL announcement blog post][1]

*   [Our recent KSQL webinar][2] 和 [Kafka Summit keynote][3]

*   [clickstream demo][4] 它可用于 [KSQL’s GitHub repo][5] 的一部分

*   [presentation that I did recently][6] 展示了 KSQL 如何去支持基于流的 ETL 平台

记住，KSQL 现在正处于开发者预览版中。 欢迎在 KSQL github repo 上提出任何问题， 或者去我们的 [community Slack group][16] 的 #KSQL通道。

--------------------------------------------------------------------------------

via: https://www.confluent.io/blog/using-ksql-to-analyse-query-and-transform-data-in-kafka

作者：[Robin Moffatt ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.confluent.io/blog/author/robin/
[1]:https://www.confluent.io/blog/ksql-open-source-streaming-sql-for-apache-kafka/
[2]:https://www.confluent.io/online-talk/ksql-streaming-sql-for-apache-kafka/
[3]:https://www.confluent.io/kafka-summit-sf17/Databases-and-Stream-Processing-1
[4]:https://www.youtube.com/watch?v=A45uRzJiv7I
[5]:https://github.com/confluentinc/ksql
[6]:https://speakerdeck.com/rmoff/look-ma-no-code-building-streaming-data-pipelines-with-apache-kafka
[7]:https://www.confluent.io/blog/author/robin/
[8]:https://github.com/confluentinc/ksql/
[9]:https://www.confluent.io/download/
[10]:https://docs.confluent.io/current/installation.html?
[11]:https://www.youtube.com/watch?v=ZKqBptBHZTg
[12]:https://github.com/jcustenborder/kafka-connect-twitter
[13]:https://docs.confluent.io/current/connect/userguide.html#connect-installing-plugins
[14]:https://apps.twitter.com/
[15]:https://github.com/confluentinc/ksql/blob/0.1.x/docs/syntax-reference.md
[16]:https://slackpass.io/confluentcommunity
