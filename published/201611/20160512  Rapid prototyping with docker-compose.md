通过 docker-compose 进行快速原型设计
========================================

在这篇文章中，我们将考察一个 Node.js 开发原型，该原型用于从英国三个主要折扣网店查找“Raspberry PI Zero”的库存。

我写好了代码，然后经过一晚的鼓捣把它部署在 Aure 上的 Ubuntu 虚拟机上。Docker 和 docker-compose 工具使得部署和更新过程非常快。

### 还记得链接指令（link）吗？

如果你已经阅读过 [Hands-on Docker tutorial][1]，那么你应该已经可以使用命令行链接 Docker 容器。通过命令行将 Node.js 的计数器链接到 Redis 服务器，其命令可能如下所示：

```
$ docker run -d -P --name redis1
$ docker run -d hit_counter -p 3000:3000 --link redis1:redis
```

现在假设你的应用程序分为三层：

- Web 前端
- 处理长时间运行任务的批处理层
- Redis 或者 mongo 数据库

通过`--link`的显式链接只是管理几个容器是可以的，但是可能会因为我们向应用程序添加更多层或容器而失控。

### 加入 docker-compose

![](http://blog.alexellis.io/content/images/2016/05/docker-compose-logo-01.png)

*Docker Compose logo*

docker-compose 工具是标准 Docker 工具箱的一部分，也可以单独下载。 它提供了一组丰富的功能，通过纯文本 YAML 文件配置所有应用程序的部件。

上面的例子看起来像这样：

```
version: "2.0"
services:
  redis1:
    image: redis
  hit_counter:
    build: ./hit_counter
    ports:
     - 3000:3000
```

从 Docker 1.10 开始，我们可以利用网络覆盖（network overlays）来帮助我们在多个主机上进行扩展。 在此之前，链接仅能工作在单个主机上。 `docker-compose scale` 命令可以用来在需要时带来更多的计算能力。

> 查看 docker.com 上的 [docker-compose][2] 参考

###　真实工作示例：Raspberry PI 库存警示

![](http://blog.alexellis.io/content/images/2016/05/Raspberry_Pi_Zero_ver_1-3_1_of_3_large.JPG)

*新的 Raspberry PI Zero v1.3 图片，由 Pimoroni 提供*

Raspberry PI Zero 嗡嗡作响 - 它是一个极小的微型计算机，具有 1GHz CPU 和 512MB RAM，可以运行完整的Linux、Docker、Node.js、Ruby 和其他许多流行的开源工具。 PI Zero 最好的优点之一就是它成本只有 5 美元。 这也意味着它销售的速度非常之快。

*如果你想在 PI 上尝试 Docker 和 Swarm，请查看下面的教程：[Docker Swarm on the PI Zero][3]*

### 原始网站：whereismypizero.com

我发现一个网页，它使用屏幕抓取以找出 4-5 个最受欢迎的折扣网店是否有库存。

- 网站包含静态 HTML 网页
- 向每个折扣网店发出一个 XMLHttpRequest 访问 /public/api/
- 服务器向每个网店发出 HTTP 请求并执行抓屏

每一次对 /public/api/ 的调用，其执行花 3 秒钟，而使用 Apache Bench（ab），我每秒只能完成 0.25 个请求。

### 重新发明轮子

零售商似乎并不介意 whereismypizero.com 抓取他们的网站的商品库存信息，所以我开始从头写一个类似的工具。 我尝试通过缓存和解耦 web 层来处理更多的抓取请求。 Redis 是执行这项工作的完美工具。 它允许我设置一个自动过期的键/值对（即一个简单的缓存），还可以通过 pub/sub 在 Node.js 进程之间传输消息。

> 复刻或者追踪放在 github 上的代码: [alexellis/pi_zero_stock][4]

如果之前使用过 Node.js，你肯定知道它是单线程的，并且任何 CPU 密集型任务，如解析 HTML 或 JSON 都可能导致速度放缓。一种缓解这种情况的方法是使用一个工作进程和 Redis 消息通道作为它和 web 层之间的连接组织。

- Web 层
  - 使用 200 代表缓冲命中（该商店的 Redis 键存在）
  - 使用 202 代表高速缓存未命中（该商店的 Redis 键不存在，因此发出消息）
  - 因为我们只是读一个 Redis 键，响应时间非常快。
- 库存抓取器
  - 执行 HTTP 请求
  - 用于在不同类型的网店上抓屏
  - 更新 Redis 键的缓存失效时间为 60 秒
  - 另外，锁定一个 Redis 键，以防止对网店过多的 HTTP 请求。

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

*来自示例的 docker-compose.yml 文件*

一旦本地正常工作，再向 Azure 的 Ubuntu 16.04 镜像云部署就轻车熟路，只花了不到 5 分钟。 我登录、克隆仓库并键入`docker compose up -d`， 这就是所有的工作 - 快速实现整个系统的原型不会比这几个步骤更多。 任何人（包括 whereismypizero.com 的所有者）只需两行命令就可以部署新解决方案：

```
$ git clone https://github.com/alexellis/pi_zero_stock
$ docker-compose up -d
```

更新网站很容易，只需要一个`git pull`命令，然后执行`docker-compose up -d`命令，该命令需要带上`--build`参数。

如果你仍然手动链接你的 Docker 容器，请自己或使用如下我的代码尝试 Docker Compose：

> 复刻或者追踪在 github 上的代码： [alexellis/pi_zero_stock][5]

### 一睹测试网站芳容

目前测试网站使用 docker-compose 部署：[stockalert.alexellis.io][6]

![](http://blog.alexellis.io/content/images/2016/05/Screen-Shot-2016-05-16-at-22-34-26-1.png)

*预览于 2016 年 5 月 16 日*

----------
via: http://blog.alexellis.io/rapid-prototype-docker-compose/

作者：[Alex Ellis][a]
译者：[firstadream](https://github.com/firstadream)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://blog.alexellis.io/author/alex/
[1]: http://blog.alexellis.io/handsondocker
[2]: https://docs.docker.com/compose/compose-file/
[3]: http://blog.alexellis.io/dockerswarm-pizero/
[4]: https://github.com/alexellis/pi_zero_stock
[5]: https://github.com/alexellis/pi_zero_stock
[6]: http://stockalert.alexellis.io/

