使用docker快速组成样品机
========================================

在写前，我们将看看 Node.js 的样机 ** 找寻树莓派 PI Zero ** 的供应在英国三个主要销售.

我写的代码，黑客部署到 Azure Ubuntu 虚拟机一个晚上就可以到位。Docker 和 docker-compose 工具做出调配和更新过程非常快。

### 建立链接？


如果您已经通过 [ Docker 动手指南] [1] 那么你已有在命令行建立 Docker 容器的经验。链接一个Redis 服务器计数器节点在命令行上可能是这样：

```
$ docker run -d -P --name redis1
$ docker run -d hit_counter -p 3000:3000 --link redis1:redis
```

现在，假设应用程序中有三个等级

- Web 前端
- 批次层处理长时间运行的任务
- Redis 或 MongoDB 数据库

通过 `--link` 管理几个容器，但可能失效，可以添加多层级或容器到应用程序。

### 键入 docker 撰写

![](http://blog.alexellis.io/content/images/2016/05/docker-compose-logo-01.png)
>Docker 撰写图标

docker-compose 工具是标准的 docker工具箱的一部分，也可以单独下载。它提供了丰富功能，通过一个纯文本YAML文件配置所有应用程序组件。

上述提供了一个例子：

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

从Docker 1.10起，我们可以充分利用网络来帮助我们在多个主机进行扩展覆盖。在此之前，仅通过单个主机工作。“docker-compose scale” 命令可用于更多计算能力有需要时。

>参考docker.com上关于"docker-compose"

### 真实例子：树莓派 PI 到货通知

![](http://blog.alexellis.io/content/images/2016/05/Raspberry_Pi_Zero_ver_1-3_1_of_3_large.JPG)
>新版树莓派 PI Zero V1.3 图片提供来自Pimoroni

树莓派 PI Zero - 巨大的轰动一个微型计算机具有一个1GHz 处理器 和 512MB 内存能够运行完整 Linux，Docker，Node.js，Ruby 和许多流行的开源工具。一个关于 PI Zero 的好消息是，成本只有5美元。这也意味着，存量迅速抢购一空。

*如果您想尝试Docker 或集群在PI看看下面的教程。*

>[Docker 群在 PI Zero][3]

### 原站: whereismypizero.com

我发现了一个网页，是否抓取股票屏幕4-5种最流行的网点。

-这个网站包含一个静态的HTML页面
-发行的每口访问/公共/ API一个XML Http Request /
-服务器发出HTTP请求到各处进行刮

每个叫做 /public/api/ 花3秒钟的时间来执行和使用Apache Bench（AB），而我能够0.25每秒的请求数通过。

### 重复性工作（译者：发明轮子）

零售商似乎也并不介意whereismypizero.com刮他们的网站的股票，所以我开始写一个类似的工具，从底下开始爬。我打算通过缓存以及分割从Web层中的每秒处理一个更高的请求量。redis是这项工作的完美工具。它允许我设置一个自动到期的键/值对（即一个简单的缓存）并通过公开/代替之间传递消息处理

>在 GitHub 上克隆或者统计: [alexellis/pi_zero_stock][4]

如果你在与 Node.js 之前就知道它是单线程的，任何CPU密集型任务，如解析HTML或JSON可能导致一个缓慢的下降。一种减轻是使用第二工作进程和Redis消息通道为结缔组织和Web层之间。

-网络层
-给200的缓存命中（商店redis键存在）
-提供202的高速缓存未命中（redis键不存在，所以问题的消息）
-因为我们只看redis键的响应时间是非常快的。
-股票提取
-执行HTTP请求
-对于不同类型的网络商店擦伤
-更新一个缓存redis键到期60秒
-也锁住一个redis关键防止Web存储太多的飞行中的HTTP请求。
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

*这个例子中的docker-compose.yml文件*

我曾本地有这样的工作部署Ubuntu 16.04图像在云上 (Azure) 用了不到5分钟。我登录，克隆库和输入`docker compose up -d`.。这是所有它采取-快速原型设计一个完整的系统没有得到更好的。任何人（包括whereismypizero。com的所有者）可以部署新的解决方案只有两行：

```
$ git clone https://github.com/alexellis/pi_zero_stock
$ docker-compose up -d
```

更新网站是很容易的，只是涉及到一个 `git pull` 其次是 `docker-compose up -d` 和一个 `--build` 参数传递

如果你仍然是手动连接你的 Docker ，试试 Docker 我为自己的以下代码组成：

>克隆或喜爱在 GitHub 的代码: [alexellis/pi_zero_stock][5]

### 检查测试站点

测试网站目前是部署使用 Docker 组成的。

>[stockalert.alexellis.io][6]

![](http://blog.alexellis.io/content/images/2016/05/Screen-Shot-2016-05-16-at-22-34-26-1.png)

预览截至2016年5月16日

----------
via: http://blog.alexellis.io/rapid-prototype-docker-compose/

作者：[Alex Ellis][a]
译者：[erlinux](https://github.com/erlinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://blog.alexellis.io/author/alex/
[1]: http://blog.alexellis.io/handsondocker
[2]: https://docs.docker.com/compose/compose-file/
[3]: http://blog.alexellis.io/dockerswarm-pizero/
[4]: https://github.com/alexellis/pi_zero_stock
[5]: https://github.com/alexellis/pi_zero_stock
[6]: http://stockalert.alexellis.io/
