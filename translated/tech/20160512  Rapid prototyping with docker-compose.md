使用docker快速组成样品机
========================================

在写前，我们将看看 Node.js 样机 ** 找寻树莓派 PI Zero ** 的供应在英国三个主要销售.

我写的代码，黑客部署到 Azure Ubuntu 虚拟机一个晚上就可以到位。Docker 和 docker-compose 工具做出调配和更新过程非常快。

### 建立链接？


如果您已经通过 [动手 Docker 教程指南] [1] 那么你已有在命令行建立 Docker 容器的经验。链接一个Redis 服务器计数器节点在命令行上可能是这样：

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

>[Docker Swarm on the PI Zero][3]

### Original site: whereismypizero.com

I found a webpage which used screen scraping to find whether 4-5 of the most popular outlets had stock.

- The site contained a static HTML page
- Issued one XMLHttpRequest per outlet accessing /public/api/
- The server issued the HTTP request to each shop and performed the scraping

Every call to /public/api/ took 3 seconds to execute and using Apache Bench (ab) I was only able to get through 0.25 requests per second.

### Reinventing the wheel

The retailers didn't seem to mind whereismypizero.com scraping their sites for stock, so I set about writing a similar tool from the ground up. I had the intention of handing a much higher amount of requests per second through caching and de-coupling the scrape from the web tier. Redis was the perfect tool for the job. It allowed me to set an automatically expiring key/value pair (i.e. a simple cache) and also to transmit messages between Node processes through pub/sub.

>Fork or star the code on Github: [alexellis/pi_zero_stock][4]

If you've worked with Node.js before then you will know it is single-threaded and that any CPU intensive tasks such as parsing HTML or JSON could lead to a slow-down. One way to mitigate that is to use a second worker process and a Redis messaging channel as connective tissue between this and the web tier.

- Web tier
  -Gives 200 for cache hit (Redis key exists for store)
  -Gives 202 for cache miss (Redis key doesn't exist, so issues message)
  -Since we are only ever reading a Redis key the response time is very quick.
- Stock Fetcher
  -Performs HTTP request
  -Scrapes for different types of web stores
  -Updates a Redis key with a cache expire of 60 seconds
  -Also locks a Redis key to prevent too many in-flight HTTP requests to the web stores.
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

*The docker-compose.yml file from the example.*

Once I had this working locally deploying to an Ubuntu 16.04 image in the cloud (Azure) took less than 5 minutes. I logged in, cloned the repository and typed in `docker compose up -d`. That was all it took - rapid prototyping a whole system doesn't get much better. Anyone (including the owner of whereismypizero.com) can deploy the new solution with just two lines:

```
$ git clone https://github.com/alexellis/pi_zero_stock
$ docker-compose up -d
```

Updating the site is easy and just involves a `git pull` followed by a `docker-compose up -d` with the `--build` argument passed along.

If you are still linking your Docker containers manually, try Docker Compose for yourself or my code below:

>Fork or star the code on Github: [alexellis/pi_zero_stock][5]

### Check out the test site

The test site is currently deployed now using docker-compose.

>[stockalert.alexellis.io][6]

![](http://blog.alexellis.io/content/images/2016/05/Screen-Shot-2016-05-16-at-22-34-26-1.png)

Preview as of 16th of May 2016

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
