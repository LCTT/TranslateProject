Neo4j 和图数据库起步
============================================================

> 在这个三篇文章系列中的第二篇中，安装 Neo4j 并通过网页客户端来在图中插入和查询数据。

![Neo4j 和图数据库: 开始](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_wavegraph.png?itok=z4pXCf_c "Neo4j and graph databases: Getting started")

在本系列的 [第一篇][8] 中，我们介绍了图数据库中的一些核心概念。在这篇，我们将安装 [Neo4j][9] 并通过网页客户端在图中插入并查询数据。

可通过 [他们的网站][10] 下载社区版的 Neo4j！你可以下载 Windows 或 OSX 版来测试，也有各 Linux 发行版对应的版本，还有 Docker 版。

我会在 Debian 9 (stretch) 上安装软件。你可在 [这里][11] 查看完整说明。如果你正在使用 Debian 8 (jessie) 或更老的版本，你可以安装当前的版本，但会出现的一点小问题是 jessie 中并没有安装 Neo4j 运行所需要的 Java 8 环境。

```
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add - echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list sudo apt-get update sudo apt-get install neo4j
```

在我的系统中，出于某些原因，我创建好 `/var/run/neo4j` 之后它就可以很轻松地开始了。Neo4j 给了一个“最大打开文件数”的警告，但因为是测试环境所以我不太需要关心这个问题。Neo4j 默认只会监听本机 localhost 上的连接。如果你的机器是 Debian ，那这很好，但是我的不是。我修改了 `/etc/neo4j/neo4j.conf` ，取消注释了下面这行：

```
dbms.connectors.default_listen_address=0.0.0.0
```

在重启 Neo4j 之后，我可以通过 7474 端口来访问服务器的 Neo4j 服务。默认的用户名和密码是 `Neo4j` 和 `neo4j`； 你需要设置一个新密码，然后会出现初始页面：

![Installing Neo4J](https://opensource.com/sites/default/files/u128651/article_2_image_1.jpg "Installing Neo4J")

让我们在 Neo4j 上创建[上篇文章][8]中使用过的图。如下图：

![Graph database image 2, defining a new type of node](https://opensource.com/sites/default/files/u128651/article_1_image_2.jpg "Graph database image 2, defining a new type of node")

类似 MySQL 和其它的数据库系统，Neo4j 的各类操作也使用一套查询语句。Cypher，就是 Neo4j 使用的查询语句，但有一些语法区别需要去学习和注意。<ruby>节点<rt>node</rt></ruby>需要用圆括号表示，而<ruby>关系 <rt>relationship</rt></ruby> 需要放在方括号中。因为这是系统中唯二的数据类型，所以了解这些就够了。

首先，我们创建所有的节点。你需要将下面内容复制黏贴到浏览器顶部区域中，在那里运行查询语句。

```
CREATE (a:Person { name: 'Jane Doe', favorite_color: 'purple' }) CREATE (b:Person { name: 'John Doe' }) CREATE (c:Person { name: 'Mary Smith', favorite_color: 'red', dob: '1992-11-09' }) CREATE (d:Person { name: 'Robert Roe' }) CREATE (e:Person { name: 'Rhonda Roe' }) CREATE (f:Person { name: 'Ryan Roe' }) CREATE (t:City { name: 'Petaluma, CA' }) CREATE (u:City { name: 'Cypress, TX' }) CREATE (v:City { name: 'Grand Prairie, TX' }) CREATE (w:City { name: 'Houston, TX' })
```

注意，在标签前的字符就是变量。这些信息会在出现在各个地方，但我们在这里并不会用到。但你不能不指定相应信息就盲目创建，所以我们使用它们然后就忽略它们。

在上面一共创建了 10 个节点和 13 个属性。想查看它们？ 通过下面语句来匹配查询所有节点：

```
MATCH (n) RETURN n
```

这条语句会返回一个可视化的图。（在应用内，你可以在返回的图中使用”全屏”按钮来查看大图)。你将会看到类似下面的图像：


![Visual graph](https://opensource.com/sites/default/files/u128651/article_2_image_2.jpg "Visual graph")

添加关系需要一点技巧；你需要连接的节点必须是 “<ruby>在限定范围内的<rt>in scope</rt></ruby>”，意思连接的节点是在当前查询语句所限定的范围内的。我们之前使用的查询语句范围太大，所以让我们找到 John 和 Jane 并让他们结婚：

```
MATCH (a:Person),(b:Person) WHERE a.name='Jane Doe' AND b.name='John Doe' CREATE (a)-[r:MARRIAGE {date: '2017-03-04', place: 'Houston, TX'}]->(b)
```

这条语句会创建一个关系并设置两个属性。重新运行该 `MATCH` 语句会显示那个关系。你可以通过鼠标点击任意的节点或关系来查看它们的属性。

我们来添加其它的关系。比起使用一些列的 `MATCH` 语句，我会一次性做完并从中 `CREATE` 创建多个关系。

```
MATCH (a:Person),(b:Person),(c:Person),(d:Person),(e:Person),(f:Person),(t:City),(u:City),(v:City),(w:City) WHERE a.name='Jane Doe' AND b.name='John Doe' AND c.name='Mary Smith' AND d.name='Robert Roe' AND e.name='Rhonda Roe' AND f.name='Ryan Roe' AND t.name='Petaluma, CA' AND u.name='Cypress, TX' AND v.name='Grand Prairie, TX' AND w.name='Houston, TX' CREATE (d)-[m2:MARRIAGE {date: '1990-12-01', place: 'Chicago, IL'}]->(e) CREATE (a)-[n:CHILD]->(c) CREATE (d)-[n2:CHILD]->(f) CREATE (e)-[n3:CHILD]->(f) CREATE (b)-[n4:STEPCHILD]->(c) CREATE (a)-[o:BORN_IN]->(v) CREATE (b)-[o2:BORN_IN]->(t) CREATE (c)-[p:DATING]->(f) CREATE (a)-[q:LIVES_IN]->(u) CREATE (b)-[q1:LIVES_IN]->(u) CREATE (a)-[r:WORKS_IN]->(w) CREATE (a)-[s:FRIEND]->(d) CREATE (a)-[s2:FRIEND]->(e)
```

重新运行该 `MATCH` 语句，你将会看到下面图像：


![Graph after re-querying with MATCH](https://opensource.com/sites/default/files/u128651/article_2_image_3.jpg "Graph after re-querying with MATCH")

如果你喜欢，你可以将节点拖拉成像我之前画的图的样子。

在这个例子中，我们唯一使用的 `MATCH` 就是 `MATCH` 所有的东西。下面这个查询会返回两个结婚了的夫妻并显示他们之间的关系：

```
MATCH (a)-[b:MARRIAGE]->(c) RETURN a,b,c
```

在一个更复杂的图中，你可以做更多的细节查询。（LCTT 译注：此例子为 Neo4j 自带例子的）例如，你有关于电影和人的节点，还有像 `ACTED IN`、`DIRECTED`、`WROTE SCREENPLAY` 等属性的关系，你可以运行下面这个查询：

```
MATCH (p:Person { name: 'Mel Gibson' })--(m:Movie) RETURN m.title
```

……上述是查询和 Mel Gibson 相关的所有影片。但如果你想查询他演过的所有电影，下面这条语句会更有用：

```
MATCH (p:Person { name: 'Mel Gibson' })-[r:ACTED_IN]->(m:movie) RETURN m.title,r.role
```

还有更多更炫酷的 Cypher 语句可以使用，但我们就简单介绍这些。更详细完整的 Cypher 语句可以在 Neo4j 的[官网][12]上查看, 并且也有很多例子可以练习。

在此系列的下篇文章中，我们会通过写些 Perl 脚本来展示如何在应用中使用图数据库。

（图片来源 : opensource.com）

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/7/neo4j-graph-databases-getting-started

作者：[Ruth Holloway][a]
译者：[happygeorge01](https://github.com/happygeorge01)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://opensource.com/file/363066
[2]:https://opensource.com/file/363061
[3]:https://opensource.com/file/363071
[4]:https://opensource.com/file/363076
[5]:https://opensource.com/article/17/7/neo4j-graph-databases-getting-started?rate=hqfP7Li5t_MqS9sV0FXwGAC0fVBoBXOglypRL7c-Zn4
[6]:https://opensource.com/users/druthb
[7]:https://opensource.com/user/36051/feed
[8]:https://linux.cn/article-8728-1.html
[9]:https://neo4j.com/
[10]:https://neo4j.com/download/community-edition/
[11]:http://debian.neo4j.org/?_ga=2.172102506.853767004.1499179137-1089522652.1499179137
[12]:https://neo4j.com/docs/developer-manual/current/cypher/
[13]:https://opensource.com/users/druthb
[14]:https://opensource.com/users/druthb
[15]:https://opensource.com/users/druthb
[16]:https://opensource.com/tags/programming
