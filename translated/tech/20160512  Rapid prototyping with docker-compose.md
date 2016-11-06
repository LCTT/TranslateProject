
通过docker-compose进行快速原型设计
========================================
在这篇文章中，我们将考察一个Node.js原型，该原型用于从英国三个主要折扣网店查找“Raspberry PI Zero”的库存。

我写好了代码，然后经过一晚的hacking把它部署在Aure上的Ubuntu虚拟机上。Docker和docker-compose工具使得部署和更新过程非常快。

### 还记得链接指令吗？

如果你已经阅读过[Hands-on Docker tutorial][1]，那么你应该已经可以使用命令行链接Docker容器。通过命令行将节点命中计数器链接到Redis服务器，其命令可能如下所示：

```
$ docker run -d -P --name redis1
$ docker run -d hit_counter -p 3000:3000 --link redis1:redis
```

现在假设你的应用程序分为三层：

- Web前端
- 处理长时间运行任务的批处理层
- Redis或者mongo数据库

通过`--link`的显式链接只是可以用几个容器来管理，但是可能会因为我们向应用程序添加更多层或容器而失控。

###加入docker-compose

![](http://blog.alexellis.io/content/images/2016/05/docker-compose-logo-01.png)
>Docker Compose logo

docker-compose工具是标准Docker工具箱的一部分，也可以单独下载。 它提供了一组丰富的功能，通过纯文本YAML文件配置所有应用程序的部件。

上面的例子看起来像这样：

```
version: "2.0"
services:
  redis1:
  redis1:
    image: redis
  hit_counter:
    build: ./hit_counter
    ports:
     - 3000:3000
```

从Docker 1.10开始，我们可以利用网络覆盖来帮助我们在多个主机上进行扩展。 在此之前，链接仅在单个主机上工作。 “docker-compose scale”命令可以用来在需要时带来更多的计算能力。

>查看docker.com上的[docker-compose] [2]参考

真实工作示例：Raspberry PI股票警示

![](http://blog.alexellis.io/content/images/2016/05/Raspberry_Pi_Zero_ver_1-3_1_of_3_large.JPG)
>新的Raspberry PI Zero v1.3图片由Pimoroni提供

Raspberry PI Zero嗡嗡作响 - 它是一个极小的微型计算机，具有1GHz CPU和512MB RAM，可以运行完整的Linux、Docker、Node.js、Ruby和其他许多流行的开源工具。 PI Zero最好的优点之一就是它成本只有5美元。 这也意味着它去库存的速度非常之快。

*如果你想在PI上尝试Docker和Swarm，请查看下面的教程。*

>[Docker Swarm on the PI Zero][3]

### 原始网站：whereismypizero.com

我发现一个网页，它使用屏幕抓取以找出4-5个最受欢迎的折扣网店是否有库存。

- 网站包含静态HTML网页
- 向每个折扣网店发出一个XMLHttpRequest访问/ public / api /
- 服务器向每个网店发出HTTP请求并执行抓屏

每一次对/ public / api /的调用，其执行花3秒钟，而使用Apache Bench（ab），我每秒只能得到0.25个请求。

### 重新发明轮子

零售商似乎并不介意whereismypizero.com抓取他们的网站的商品库存信息，所以我开始从头写一个类似的工具。 我有意通过缓存和解耦从web层处理更多的抓取请求。 Redis是执行这项工作的完美工具。 它允许我设置一个自动过期的键/值对（即一个简单的缓存），还可以通过pub / sub在节点进程之间传输消息。

>复刻或者追踪github上的代码: [alexellis/pi_zero_stock][4]

如果之前使用过Node.js，你肯定知道它是单线程的，并且任何CPU密集型任务，如解析HTML或JSON都可能导致速度放缓。 一种缓解这种情况的方法是使用一个工作进程和Redis消息通道作为它和web层之间的连接组织。

- Web层
  使用200作为缓冲命中（存储Redis键）
  使用202作为高速缓存未命中（Redis键不存在，因此出现问题消息）
   因为我们只是读一个Redis键，响应时间非常快。
- 库存抓取器
  执行HTTP请求
  用于在不同类型的网店上抓屏
  更新具有高速缓存超时时间为60秒的Redis键
  另外，锁定一个Redis键，以防止过多的HTTP请求到网店。
```
version: "2.0"  
services:  
  web:
    build: ./web/
    ports:
     - "3000:3000"
  stock_fetch:
    build: ./stock_fetch/
  redis:
    image: redis
```

*来自示例的docker-compose.yml文件*

一旦本地正常工作，再向Azure的Ubuntu 16.04镜像云部署就轻车熟路，只花了不到5分钟。 我登录，克隆仓库并键入“docker compose up -d”， 这就是所有的工作 - 快速实现整个系统的原型不会比这几个步骤更多。 任何人（包括whereismypizero.com的所有者）只需两行命令就可以部署新解决方案：

```
$ git clone https://github.com/alexellis/pi_zero_stock
$ docker-compose up -d
```

更新网站很容易，只需要一个`git pull'`命令，然后执行`docker-compose up -d`命令，该命令需要带上`--build`参数。

如果你仍然手动链接你的Docker容器，请自己或使用如下我的代码尝试Docker Compose：

>复刻或者追踪github上的代码： [alexellis/pi_zero_stock][5]

###一睹测试网站芳容

目前测试网站使用docker-compose部署。

>[stockalert.alexellis.io][6]

![](http://blog.alexellis.io/content/images/2016/05/Screen-Shot-2016-05-16-at-22-34-26-1.png)

预览截止2016年5月16日

----------
via: http://blog.alexellis.io/rapid-prototype-docker-compose/

作者：[Alex Ellis][a]
译者：[firstadream](https://github.com/firstadream)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://blog.alexellis.io/author/alex/
[1]: http://blog.alexellis.io/handsondocker
[2]: https://docs.docker.com/compose/compose-file/
[3]: http://blog.alexellis.io/dockerswarm-pizero/
[4]: https://github.com/alexellis/pi_zero_stock
[5]: https://github.com/alexellis/pi_zero_stock
[6]: http://stockalert.alexellis.io/

