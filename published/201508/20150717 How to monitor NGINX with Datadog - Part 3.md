如何使用 Datadog 监控 NGINX（第三篇）
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_3.png)

如果你已经阅读了前面的[如何监控 NGINX][1]，你应该知道从你网络环境的几个指标中可以获取多少信息。而且你也看到了从 NGINX 特定的基础中收集指标是多么容易的。但要实现全面，持续的监控 NGINX，你需要一个强大的监控系统来存储并将指标可视化，当异常发生时能提醒你。在这篇文章中，我们将向你展示如何使用 Datadog 安装 NGINX 监控，以便你可以在定制的仪表盘中查看这些指标：

![NGINX dashboard](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_board_5.png)

Datadog 允许你以单个主机、服务、流程和度量来构建图形和警告，或者使用它们的几乎任何组合构建。例如，你可以监控你的所有主机，或者某个特定可用区域的所有NGINX主机，或者您可以监视具有特定标签的所有主机的一个关键指标。本文将告诉您如何：

- 在 Datadog 仪表盘上监控 NGINX 指标，就像监控其他系统一样
- 当一个关键指标急剧变化时设置自动警报来通知你

### 配置 NGINX ###

为了收集 NGINX 指标，首先需要确保 NGINX 已启用 status 模块和一个 报告 status 指标的 URL。一步步的[配置开源 NGINX][2] 和 [NGINX Plus][3] 请参见之前的相关文章。

### 整合 Datadog 和 NGINX ###

#### 安装 Datadog 代理 ####

Datadog 代理是[一个开源软件][4]，它能收集和报告你主机的指标，这样就可以使用 Datadog 查看和监控他们。安装这个代理通常[仅需要一个命令][5]

只要你的代理启动并运行着，你会看到你主机的指标报告[在你 Datadog 账号下][6]。

![Datadog infrastructure list](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/infra_2.png)

#### 配置 Agent ####

接下来，你需要为代理创建一个简单的 NGINX 配置文件。在你系统中代理的配置目录应该[在这儿][7]找到。

在目录里面的 conf.d/nginx.yaml.example 中，你会发现[一个简单的配置文件][8]，你可以编辑并提供 status URL 和可选的标签为每个NGINX 实例：

    init_config:
     
    instances:
     
        -   nginx_status_url: http://localhost/nginx_status/
            tags:
                -   instance:foo

当你提供了 status URL 和任意 tag，将配置文件保存为 conf.d/nginx.yaml。

#### 重启代理 ####

你必须重新启动代理程序来加载新的配置文件。重新启动命令[在这里][9]，根据平台的不同而不同。

#### 检查配置文件 ####

要检查 Datadog 和 NGINX 是否正确整合，运行 Datadog 的 info 命令。每个平台使用的命令[看这儿][10]。

如果配置是正确的，你会看到这样的输出：

    Checks
    ======
     
      [...]
     
      nginx
      -----
          - instance #0 [OK]
          - Collected 8 metrics & 0 events 

#### 安装整合 ####

最后，在你的 Datadog 帐户打开“Nginx 整合”。这非常简单，你只要在 [NGINX 整合设置][11]中点击“Install Integration”按钮。

![Install integration](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/install.png)

### 指标! ###

一旦代理开始报告 NGINX 指标，你会看到[一个 NGINX 仪表盘][12]出现在在你 Datadog 可用仪表盘的列表中。

基本的 NGINX 仪表盘显示有用的图表，囊括了几个[我们的 NGINX 监控介绍][13]中的关键指标。 （一些指标，特别是请求处理时间要求进行日志分析，Datadog 不支持。）

你可以通过增加 NGINX 之外的重要指标的图表来轻松创建一个全面的仪表盘，以监控你的整个网站设施。例如，你可能想监视你 NGINX 的主机级的指标，如系统负载。要构建一个自定义的仪表盘，只需点击靠近仪表盘的右上角的选项并选择“Clone Dash”来克隆一个默认的 NGINX 仪表盘。

![Clone dash](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/clone_2.png)

你也可以使用 Datadog 的[主机地图][14]在更高层面监控你的 NGINX 实例，举个例子，用颜色标示你所有的 NGINX 主机的 CPU 使用率来辨别潜在热点。

![](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx-host-map-3.png)

###  NGINX 指标警告 ###

一旦 Datadog 捕获并可视化你的指标，你可能会希望建立一些监控自动地密切关注你的指标，并当有问题提醒你。下面将介绍一个典型的例子：一个提醒你 NGINX 吞吐量突然下降时的指标监控器。

#### 监控 NGINX 吞吐量 ####

Datadog 指标警报可以是“基于吞吐量的”（当指标超过设定值会警报）或“基于变化幅度的”（当指标的变化超过一定范围会警报）。在这个例子里，我们会采取后一种方式，当每秒传入的请求急剧下降时会提醒我们。下降往往意味着有问题。

1. **创建一个新的指标监控**。从 Datadog 的“Monitors”下拉列表中选择“New Monitor”。选择“Metric”作为监视器类型。

	![NGINX metric monitor](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_1.png)

2. **定义你的指标监视器**。我们想知道 NGINX 每秒总的请求量下降的数量，所以我们在基础设施中定义我们感兴趣的 nginx.net.request_per_s 之和。

	![NGINX metric](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_2.png)

3. **设置指标警报条件**。我们想要在变化时警报，而不是一个固定的值，所以我们选择“Change Alert”。我们设置监控为无论何时请求量下降了30％以上时警报。在这里，我们使用一个一分钟的数据窗口来表示 “now” 指标的值，对横跨该间隔内的平均变化和之前 10 分钟的指标值作比较。

	![NGINX metric change alert](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_3.png)

4. **自定义通知**。如果 NGINX 的请求量下降，我们想要通知我们的团队。在这个例子中，我们将给 ops 团队的聊天室发送通知，并给值班工程师发送短信。在“Say what’s happening”中，我们会为监控器命名，并添加一个伴随该通知的短消息，建议首先开始调查的内容。我们会 @ ops 团队使用的 Slack，并 @pagerduty [将警告发给短信][15]。

	![NGINX metric notification](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_4v3.png)

5. **保存集成监控**。点击页面底部的“Save”按钮。你现在在监控一个关键的 NGINX [工作指标][16]，而当它快速下跌时会给值班工程师发短信。

### 结论 ###

在这篇文章中，我们谈到了通过整合 NGINX 与 Datadog 来可视化你的关键指标，并当你的网络基础架构有问题时会通知你的团队。

如果你一直使用你自己的 Datadog 账号，你现在应该可以极大的提升你的 web 环境的可视化，也有能力对你的环境、你所使用的模式、和对你的组织最有价值的指标创建自动监控。

如果你还没有 Datadog 帐户，你可以注册[免费试用][17]，并开始监视你的基础架构，应用程序和现在的服务。

------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/

作者：K Young
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://linux.cn/article-5970-1.html
[2]:https://linux.cn/article-5985-1.html#open-source
[3]:https://linux.cn/article-5985-1.html#plus
[4]:https://github.com/DataDog/dd-agent
[5]:https://app.datadoghq.com/account/settings#agent
[6]:https://app.datadoghq.com/infrastructure
[7]:http://docs.datadoghq.com/guides/basic_agent_usage/
[8]:https://github.com/DataDog/dd-agent/blob/master/conf.d/nginx.yaml.example
[9]:http://docs.datadoghq.com/guides/basic_agent_usage/
[10]:http://docs.datadoghq.com/guides/basic_agent_usage/
[11]:https://app.datadoghq.com/account/settings#integrations/nginx
[12]:https://app.datadoghq.com/dash/integration/nginx
[13]:https://linux.cn/article-5970-1.html
[14]:https://www.datadoghq.com/blog/introducing-host-maps-know-thy-infrastructure/
[15]:https://www.datadoghq.com/blog/pagerduty/
[16]:https://www.datadoghq.com/blog/monitoring-101-collecting-data/#metrics
[17]:https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/#sign-up
[18]:https://github.com/DataDog/the-monitor/blob/master/nginx/how_to_monitor_nginx_with_datadog.md
[19]:https://github.com/DataDog/the-monitor/issues
