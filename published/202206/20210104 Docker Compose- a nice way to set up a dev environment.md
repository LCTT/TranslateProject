[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: (turbokernel)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14747-1.html)
[#]: subject: (Docker Compose: a nice way to set up a dev environment)
[#]: via: (https://jvns.ca/blog/2021/01/04/docker-compose-is-nice/)
[#]: author: (Julia Evans https://jvns.ca/)

Docker Compose：搭建开发环境的好方式
======

![](https://img.linux.net.cn/data/attachment/album/202206/23/180033lpg4v4bz0bbb1719.jpg)

大家好！我又写了一篇关于 [我最喜欢的电脑工具][1] 的文章。这一篇讲的是 Docker Compose！

本文主要就是讲一讲我对 Docker Compose 有多么满意啦（不讨论它的缺点）！咳咳，因为它总能够完成它该做的，并且似乎总能有效，更棒的是，它的使用还非常简单。另外，在本文中，我只讨论我是如何用 Docker Compose 来搭建开发环境的，而不涉及它在生产中的使用。

最近，我考虑了很多关于这种个人开发环境的搭建方式，原因是，我现在把所有的计算工作都搬到了一个私有云上，大概 20 美元/月的样子。这样一来，我就不用在工作的时候花时间去思考应该如何管理几千台 AWS 服务器了。

在此之前，我曾花了两天的时间，尝试使用其他的工具来尝试搭建一个开发环境，搭到后面，我实在是心累了。相比起来，Docker Compose 就简单易用多了，我非常满意。于是，我和妹妹分享了我的 `docker-compose` 使用经历，她略显惊讶：“是吧！你也觉得 Docker Compose 真棒对吧！” 嗯，我觉得我应该写一篇博文把过程记录下来，于是就有了你们看到的这篇文章。

### 我们的目标是：搭建一个开发环境

目前，我正在编写一个 Ruby on Rails 服务（它是一个计算机“调试”游戏的后端）。在我的生产服务器上，我安装了：

  * 一个 Nginx 服务器
  * 一个 Rails 服务
  * 一个 Go 服务（使用了 [gotty][2] 来代理一些 SSH 连接）
  * 一个 Postgres 数据库

在本地搭建 Rails 服务非常简单，用不着容器（我只需要安装 Postgres 和 Ruby 就行了，小菜一碟）。但是，我还想要把匹配 `/proxy/*` 的请求的发送到 Go 服务，其他所有请求都发送到 Rails 服务，所以需要借助 Nginx。问题来了，在笔记本电脑上安装 Nginx 对我来说太麻烦了。

是时候使用 `docker-compose` 了！

### docker-compose 允许你运行一组 Docker 容器

基本上，Docker Compose 的作用就是允许你运行一组可以互相通信 Docker 容器。

你可以在一个叫做 `docker-compose.yml` 的文件中，配置你所有的容器。我在下方将贴上我为这个服务编写的 `docker-compose.yml` 文件（完整内容），因为我觉得它真的很简洁、直接！

```
version: "3.3"
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password # yes I set the password to 'password'
  go_server:
    # todo: use a smaller image at some point, we don't need all of ubuntu to run a static go binary
    image: ubuntu
    command: /app/go_proxy/server
    volumes:
      - .:/app
  rails_server:
    build: docker/rails
    command: bash -c "rm -f tmp/pids/server.pid && source secrets.sh && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/app
  web:
    build: docker/nginx
    ports:
      - "8777:80" # this exposes port 8777 on my laptop
```

这个配置包含了两种容器。对于前面两个容器，我直接使用了现有的镜像（`image: postgres` 和 `image: ubuntu`）。对于后面两个容器，我不得不构建一个自定义容器镜像，其中， `build: docker/rails` 的作用就是告诉 Docker Compose，它应该使用 `docker/rails/Dockerfile` 来构建一个自定义容器。

我需要允许我的 Rails 服务访问一些 API 密钥和其他东西，因此，我使用了 `source secrets.sh`，它的作用就是在环境变量中预设一组密钥。

### 如何启动所有服务：先 “build” 后 “up”

我一直都是先运行 `docker-compose build` 来构建容器，然后再运行 `docker-compose up` 把所有服务启动起来。

你可以在 yaml 文件中设置 `depends_on`，从而进行更多启动容器的控制。不过，对于我的这些服务而言，启动顺序并不重要，所以我没有设置它。

### 网络互通也非常简单

容器之间的互通也是一件很重要的事情。Docker Compose 让这件事变得超级简单！假设我有一个 Rails 服务正在名为 `rails_server` 的容器中运行，端口是 3000，那么我就可以通过 `http://rails_server:3000` 来访问该服务。就是这么简单！

以下代码片段截取自我的 Nginx 配置文件，它是根据我的使用需求配置的（我删除了许多 `proxy_set_headers` 行，让它看起来更清楚）：

```
location ~ /proxy.* {
  proxy_pass http://go_server:8080;
}
location @app {
  proxy_pass http://rails_server:3000;
}
```

或者，你可以参考如下代码片段，它截取自我的 Rails 项目的数据库配置，我在其中使用了数据库容器的名称（`db`）：

```
development:
  <<: *default
  database: myproject_development
  host: db # <-------- 它会被“神奇地”解析为数据库容器的 IP 地址
  username: postgres
  password: password
```

至于 `rails_server` 究竟是如何被解析成一个 IP 地址的，我还真有点儿好奇。貌似是 Docker 在我的计算机上运行了一个 DNS 服务来解析这些名字。下面是一些 DNS 查询记录，我们可以看到，每个容器都有它自己的 IP 地址：

```
$ dig +short @127.0.0.11 rails_server
172.18.0.2
$ dig +short @127.0.0.11 db
172.18.0.3
$ dig +short @127.0.0.11 web
172.18.0.4
$ dig +short @127.0.0.11 go_server
172.18.0.5
```

### 是谁在运行这个 DNS 服务？

我（稍微）研究了一下这个 DNS 服务是怎么搭建起来的。

以下所有命令都是在容器外执行的，因为我没有在容器里安装很多网络工具。

**第一步：**：使用 `ps aux | grep puma`，获取 Rails 服务的进程 ID。

找到了，它是 `1837916`！简单～

**第二步：**：找到和 `1837916` 运行在同一个网络命名空间的 UDP 服务。

我使用了 `nsenter` 来在 `puma` 进程的网络命令空间内运行 `netstat`（理论上，我猜想你也可以使用 `netstat -tupn` 来只显示 UDP 服务，但此时，我的手指头只习惯于打出 `netstat -tulpn`）。

```
$ sudo nsenter -n -t 1837916 netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.11:32847        0.0.0.0:*               LISTEN      1333/dockerd
tcp        0      0 0.0.0.0:3000            0.0.0.0:*               LISTEN      1837916/puma 4.3.7
udp        0      0 127.0.0.11:59426        0.0.0.0:*                           1333/dockerd
```

我们可以看到，此时有一个运行在 `59426` 端口的 UDP 服务，它是由 `dockerd` 运行的！或许它就是我们要找的 DNS 服务？

**第三步**：确定它是不是我们要找的 DNS 服务

我们可以使用 `dig` 工具来向它发送一个 DNS 查询：

```
$ sudo nsenter -n -t 1837916 dig +short @127.0.0.11 59426 rails_server
172.18.0.2
```

奇怪，我们之前运行 `dig` 的时候，DNS 查询怎么没有发送到 `59426` 端口，而是发送到了 `53` 端口呢？这到底是怎么回事呀？

**第四步**：iptables

对于类似“这个服务似乎正运行在 X 端口上，但我却在 Y 端口上访问到了它，这是什么回事呢？”的问题，我的第一念头都是“一定是 iptables 在作怪”。

于是，我在运行了容器的网络命令空间内执行 `iptables-save`，果不其然，真相大白：

```
$ sudo nsenter -n -t 1837916 iptables-save
.... redacted a bunch of output ....
-A DOCKER_POSTROUTING -s 127.0.0.11/32 -p udp -m udp --sport 59426 -j SNAT --to-source :53
COMMIT
```

在输出中有一条 iptables 规则，它将 `53` 端口的流量发送到了 `59426` 上。哈哈，真有意思！

### 数据库文件储存在一个临时目录中

这样做有一个好处：我可以直接挂载 Postgres 容器的数据目录 `./tmp/db`，而无需在我的笔记本电脑上管理 Postgres 环境。

我很喜欢这种方式，因为我真的不想在笔记本电脑上独自管理一个 Postgres 环境（我也真的不知道该如何配置 Postgres）。另外，出于习惯，我更喜欢让开发环境的数据库和代码放在同一个目录下。

### 仅需一行命令，我就可以访问 Rails 控制台

管理 Ruby 的版本总是有点棘手，并且，即使我暂时搞定了它，我也总是有点担心自己会把 Ruby 环境搞坏，然后就要修它个十年（夸张）。

（使用 Docker Compose）搭建好这个开发环境后，如果我需要访问 Rails <ruby>控制台<rt>console</rt></ruby>（一个交互式环境，加载了所有我的 Rails 代码），我只需要运行一行代码即可：

```
$ docker-compose exec rails_server rails console
Running via Spring preloader in process 597
Loading development environment (Rails 6.0.3.4)
irb(main):001:0>
```

好耶！

### 小问题：Rails 控制台的历史记录丢失了

我碰到了一个问题：Rails 控制台的历史记录丢失了，因为我一直在不断地重启它。

不过，我也找到了一个相当简单的解决方案（嘿嘿）：我往容器中添加了一个 `/root/.irbrc` 文件，它能够把 IRB 历史记录文件的保存位置指向一个不受容器重启影响的地方。只需要一行代码就够啦：

```
IRB.conf[:HISTORY_FILE] = "/app/tmp/irb_history"
```

### 我还是不知道它在生产环境的表现如何

到目前为止，这个项目的生产环境搭建进度，还停留在“我制作了一个 DigitalOcean droplet（LCCT 译注：一种 Linux 虚拟机服务），并手工编辑了很多文件”的阶段。

嗯……我相信以后会在生产环境中使用 docker-compose 来运行一下它的。我猜它能够正常工作，因为这个服务很可能最多只有两个用户在使用，并且，如果我愿意，我可以容忍它在部署过程中有 60 秒的不可用时间。不过话又说回来，出错的往往是我想不到的地方。

推特网友提供了一些在生产中使用 docker-compose 的注意事项：

  * `docker-compose up` 只会重启那些需要重启的容器，这会让重启速度更快。
  * 有一个 Bash 小脚本 [wait-for-it][3]，你可以用它来保持等待一个容器，直到另一个容器的服务可用。
  * 你可以准备两份 `docker-compose.yaml` 文件：用于开发环境的 `docker-compose.yaml` 和用于生产环境的 `docker-compose-prod.yaml`。我想我会在分别为 Nginx 指定不同的端口：开发时使用 `8999`，生产中使用 `80`。
  * 人们似乎一致认为，如果你的项目是一台计算机上运行的小网站，那么 docker-compose 在生产中不会有问题。
  * 有个人建议说，如果愿意在生产环境搭建复杂那么一丢丢，Docker Swarm 就或许会是更好的选择，不过我还没试过（当然，如果要这么说的话，干嘛不用 Kubernetes 呢？Docker Compose 的意义就是它超级简单，而 Kubernetes 肯定不简单 : )）。

Docker 似乎还有一个特性，它能够 [把你用 docker-compose 搭建的环境，自动推送到弹性容器服务（ESC）上][4]，听上去好酷的样子，但是我还没有试过。

### docker-compose 会有不适用的场景吗

我听说 docker-compose 在以下场景的表现较差：

  * 当你有很多微服务的时候（还是自己搭建比较好）
  * 当你尝试从一个很大的数据库中导入数据时（就像把几百 G 的数据存到每个人的笔记本电脑里一样）
  * 当你在 Mac 电脑上运行 Docker 时。我听说 Docker 在 macOS 上比在 Linux 上要慢很多（我猜想是因为它需要做额外的虚拟化）。我没有 Mac 电脑，所以我还没有碰到这个问题。

### 以上就是全部内容啦！

在此之前，我曾花了一整天时间，尝试使用 Puppet 来配置 Vagrant 虚拟机，然后在这个虚拟机里配置开发环境。结果，我发现虚拟机启动起来实在是有点慢啊，还有就是，我也不喜欢编写 Puppet 配置（哈哈，没想到吧）。

幸好，我尝试了 Docker Compose，它真好简单，马上就可以开始工作啦！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/01/04/docker-compose-is-nice/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/#cool-computer-tools---features---ideas
[2]: https://github.com/yudai/gotty/
[3]: https://github.com/vishnubob/wait-for-it
[4]: https://docs.docker.com/cloud/ecs-integration/
