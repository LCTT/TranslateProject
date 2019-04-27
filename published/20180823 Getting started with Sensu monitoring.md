Sensu 监控入门
======
> 这个开源解决方案可以简单而有效地监控你的云基础设施。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e)

Sensu 是一个开源的基础设施和应用程序监控解决方案，它可以监控服务器、相关服务和应用程序健康状况，并通过第三方集成发送警报和通知。Sensu 用 Ruby 编写，可以使用 [RabbitMQ][1] 或 [Redis][2] 来处理消息，它使用 Redis 来存储数据。

如果你想以一种简单而有效的方式监控云基础设施，Sensu 是一个不错的选择。它可以与你的组织已经使用的许多现代 DevOps 组件集成，比如 [Slack][3]、[HipChat][4] 或 [IRC][5]，它甚至可以用 [PagerDuty][6] 发送移动或寻呼机的警报。

Sensu 的[模块化架构][7]意味着每个组件都可以安装在同一台服务器上或者在完全独立的机器上。
 
### 结构

Sensu 的主要通信机制是 Transport。每个 Sensu 组件必须连接到 Transport 才能相互发送消息。Transport 可以使用 RabbitMQ（在生产环境中推荐使用）或 Redis。

Sensu 服务器处理事件数据并采取行动。它注册客户端并使用过滤器、增变器和处理程序检查结果和监视事件。服务器向客户端发布检查说明，Sensu API 提供 RESTful API，提供对监控数据和核心功能的访问。

[Sensu 客户端][8]执行 Sensu 服务器安排的检查或本地检查定义。Sensu 使用数据存储（Redis）来保存所有的持久数据。最后，[Uchiwa][9] 是与 Sensu API 进行通信的 Web 界面。

![][11]

### 安装 Sensu

#### 条件

* 一个 Linux 系统作为服务器节点（本文使用了 CentOS 7）
* 要监控的一台或多台 Linux 机器（客户机）

#### 服务器侧

Sensu 需要安装 Redis。要安装 Redis，启用 EPEL 仓库：

```
$ sudo yum install epel-release -y
```

然后安装 Redis：

```
$ sudo yum install redis -y
```

修改 `/etc/redis.conf` 来禁用保护模式，监听每个地址并设置密码：

```
$ sudo sed -i 's/^protected-mode yes/protected-mode no/g' /etc/redis.conf
$ sudo sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf
$ sudo sed -i 's/^# requirepass foobared/requirepass password123/g' /etc/redis.conf
```

启用并启动 Redis 服务：

```
$ sudo systemctl enable redis
$ sudo systemctl start redis
```

Redis 现在已经安装并准备好被 Sensu 使用。

现在让我们来安装 Sensu。

首先，配置 Sensu 仓库并安装软件包：

```
$ sudo tee /etc/yum.repos.d/sensu.repo << EOF
[sensu]
name=sensu
baseurl=https://sensu.global.ssl.fastly.net/yum/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF

$ sudo yum install sensu uchiwa -y
```

让我们为 Sensu 创建最简单的配置文件：

```
$ sudo tee /etc/sensu/conf.d/api.json << EOF
{
  "api": {
        "host": "127.0.0.1",
        "port": 4567
  }
}
EOF
```

然后，配置 `sensu-api` 在本地主机上使用端口 4567 监听：

```
$ sudo tee /etc/sensu/conf.d/redis.json << EOF
{
  "redis": {
        "host": "<IP of server>",
        "port": 6379,
        "password": "password123"
  }
}
EOF


$ sudo tee /etc/sensu/conf.d/transport.json << EOF
{
  "transport": {
        "name": "redis"
  }
}
EOF
```

在这两个文件中，我们将 Sensu 配置为使用 Redis 作为传输机制，还有 Reids 监听的地址。客户端需要直接连接到传输机制。每台客户机都需要这两个文件。

```
$ sudo tee /etc/sensu/uchiwa.json << EOF
{
   "sensu": [
        {
        "name": "sensu",
        "host": "127.0.0.1",
        "port": 4567
        }
   ],
   "uchiwa": {
        "host": "0.0.0.0",
        "port": 3000
   }
}
EOF
```

在这个文件中，我们配置 Uchiwa 监听每个地址（0.0.0.0）的端口 3000。我们还配置 Uchiwa 使用 `sensu-api`（已配置好）。

出于安全原因，更改刚刚创建的配置文件的所有者：

```
$ sudo chown -R sensu:sensu /etc/sensu
```

启用并启动 Sensu 服务：

```
$ sudo systemctl enable sensu-server sensu-api sensu-client
$ sudo systemctl start sensu-server sensu-api sensu-client
$ sudo systemctl enable uchiwa
$ sudo systemctl start uchiwa
```

尝试访问 Uchiwa 网站：`http://<服务器的 IP 地址>:3000`

对于生产环境，建议运行 RabbitMQ 集群作为 Transport 而不是 Redis（虽然 Redis 集群也可以用于生产环境），运行多个 Sensu 服务器实例和 API 实例，以实现负载均衡和高可用性。

Sensu 现在安装完成，让我们来配置客户端。

#### 客户端侧

要添加一个新客户端，你需要通过创建 `/etc/yum.repos.d/sensu.repo` 文件在客户机上启用 Sensu 仓库。

```
$ sudo tee /etc/yum.repos.d/sensu.repo << EOF
[sensu]
name=sensu
baseurl=https://sensu.global.ssl.fastly.net/yum/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF
```

启用仓库后，安装 Sensu：

```
$ sudo yum install sensu -y
```

要配置 `sensu-client`，创建在服务器中相同的 `redis.json` 和 `transport.json`，还有 `client.json` 配置文件：

```
$ sudo tee /etc/sensu/conf.d/client.json << EOF
{
  "client": {
        "name": "rhel-client",
        "environment": "development",
        "subscriptions": [
        "frontend"
        ]
  }
}
EOF
```

在 `name` 字段中，指定一个名称来标识此客户机（通常是主机名）。`environment` 字段可以帮助你过滤，而 `subscriptions` 定义了客户机将执行哪些监视检查。

最后，启用并启动服务并签入 Uchiwa，因为客户机会自动注册：

```
$ sudo systemctl enable sensu-client
$ sudo systemctl start sensu-client
```

### Sensu 检查

Sensu 检查有两个组件：一个插件和一个定义。

Sensu 与 [Nagios 检查插件规范][12]兼容，因此无需修改即可使用用于 Nagios 的任何检查。检查是可执行文件，由 Sensu 客户机运行。

检查定义可以让 Sensu 知道如何、在哪以及何时运行插件。

#### 客户端侧

让我们在客户机上安装一个检查插件。请记住，此插件将在客户机上执行。

启用 EPEL 并安装 `nagios-plugins-http`：

```
$ sudo yum install -y epel-release
$ sudo yum install -y nagios-plugins-http
```

现在让我们通过手动执行它来了解这个插件。尝试检查客户机上运行的 Web 服务器的状态。它应该会失败，因为我们并没有运行 Web 服务器：

```
$ /usr/lib64/nagios/plugins/check_http -I 127.0.0.1
connect to address 127.0.0.1 and port 80: Connection refused
HTTP CRITICAL - Unable to open TCP socket
```

不出所料，它失败了。检查执行的返回值：

```
$ echo $?
2
```

Nagios 检查插件规范定义了插件执行的四个返回值：

| 插件返回码 | 状态 |
|----------|-----------|
|        0 | OK        |
|        1 | WARNING   |
|        2 | CRITICAL  |
|        3 | UNKNOWN   |

有了这些信息，我们现在可以在服务器上创建检查定义。

#### 服务器侧

在服务器机器上，创建 `/etc/sensu/conf.d/check_http.json` 文件：

```
{
  "checks": {
    "check_http": {
      "command": "/usr/lib64/nagios/plugins/check_http -I 127.0.0.1",
      "interval": 10,
      "subscribers": [
        "frontend"
      ]
    }
  }
}
```

在 `command` 字段中，使用我们之前测试过的命令。`interval` 会告诉 Sensu 这个检查的频率，以秒为单位。最后，`subscribers` 将定义执行检查的客户机。

重新启动 `sensu-api` 和 `sensu-server` 并确认新检查在 Uchiwa 中可用。

```
$ sudo systemctl restart sensu-api sensu-server
```

### 接下来

Sensu 是一个功能强大的工具，本文只简要介绍它可以干什么。参阅[文档][13]了解更多信息，访问 Sensu 网站了解有关 [Sensu 社区][14]的更多信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/getting-started-sensu-monitoring-solution

作者：[Michael Zamot][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mzamot
[1]:https://www.rabbitmq.com/
[2]:https://redis.io/topics/config
[3]:https://slack.com/
[4]:https://en.wikipedia.org/wiki/HipChat
[5]:http://www.irc.org/
[6]:https://www.pagerduty.com/
[7]:https://docs.sensu.io/sensu-core/1.4/overview/architecture/
[8]:https://docs.sensu.io/sensu-core/1.4/installation/install-sensu-client/
[9]:https://uchiwa.io/#/
[10]:/file/406576
[11]:https://opensource.com/sites/default/files/uploads/sensu_system.png (sensu_system.png)
[12]:https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/pluginapi.html
[13]:https://docs.sensu.io/
[14]:https://sensu.io/community
