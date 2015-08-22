
如何使用 Datadog 监控 NGINX - 第3部分
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_3.png)

如果你已经阅读了[前面的如何监控 NGINX][1]，你应该知道从你网络环境的几个指标中可以获取多少信息。而且你也看到了从 NGINX 特定的基础中收集指标是多么容易的。但要实现全面，持续的监控 NGINX，你需要一个强大的监控系统来存储并将指标可视化，当异常发生时能提醒你。在这篇文章中，我们将向你展示如何使用 Datadog 安装 NGINX 监控，以便你可以在定制的仪表盘中查看这些指标：

![NGINX dashboard](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_board_5.png)

Datadog 允许你建立单个主机，服务，流程，度量，或者几乎任何它们的组合图形周围和警报。例如，你可以在一定的可用性区域监控所有NGINX主机，或所有主机，或者您可以监视被报道具有一定标签的所有主机的一个关键指标。本文将告诉您如何：

Datadog 允许你来建立图表并报告周围的主机，进程，指标或其他的。例如，你可以在特定的可用性区域监控所有 NGINX 主机，或所有主机，或者你可以监视一个关键指标并将它报告给周围所有标记的主机。本文将告诉你如何做：

- 在 Datadog 仪表盘上监控 NGINX 指标，对其他所有系统
- 当一个关键指标急剧变化时设置自动警报来通知你

### 配置 NGINX ###

为了收集 NGINX 指标，首先需要确保 NGINX 已启用 status 模块和一个URL 来报告 status 指标。下面将一步一步展示[配置开源 NGINX ][2]和[NGINX Plus][3]。

### 整合 Datadog 和 NGINX ###

#### 安装 Datadog 代理 ####

Datadog 代理是 [一个开源软件][4] 能收集和报告你主机的指标，这样就可以使用 Datadog 查看和监控他们。安装代理通常 [仅需要一个命令][5]

只要你的代理启动并运行着，你会看到你主机的指标报告[在你 Datadog 账号下][6]。

![Datadog infrastructure list](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/infra_2.png)

#### 配置 Agent ####


接下来，你需要为代理创建一个简单的 NGINX 配置文件。在你系统中代理的配置目录应该 [在这儿][7]。

在目录里面的 conf.d/nginx.yaml.example 中，你会发现[一个简单的配置文件][8]，你可以编辑并提供 status URL 和可选的标签为每个NGINX 实例：

    init_config:
     
    instances:
     
        -   nginx_status_url: http://localhost/nginx_status/
            tags:
                -   instance:foo

一旦你修改了 status URLs 和其他标签，将配置文件保存为 conf.d/nginx.yaml。

#### 重启代理 ####


你必须重新启动代理程序来加载新的配置文件。重新启动命令 [在这里][9] 根据平台的不同而不同。

#### 检查配置文件 ####

要检查 Datadog 和 NGINX 是否正确整合，运行 Datadog 的信息命令。每个平台使用的命令[看这儿][10]。

如果配置是正确的，你会看到这样的输出：

    Checks
    ======
     
      [...]
     
      nginx
      -----
          - instance #0 [OK]
          - Collected 8 metrics & 0 events 

#### 安装整合 ####

最后，在你的 Datadog 帐户里面整合 Nginx。这非常简单，你只要点击“Install Integration”按钮在 [NGINX 集成设置][11] 配置表中。

![Install integration](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/install.png)

### 指标! ###

一旦代理开始报告 NGINX 指标，你会看到 [一个 NGINX 仪表盘][12] 在你 Datadog 可用仪表盘的列表中。

基本的 NGINX 仪表盘显示了几个关键指标 [在我们介绍的 NGINX 监控中][13] 的最大值。 （一些指标，特别是请求处理时间，日志分析，Datadog 不提供。）

你可以轻松创建一个全面的仪表盘来监控你的整个网站区域通过增加额外的图形与 NGINX 外部的重要指标。例如，你可能想监视你 NGINX 主机的host-level 指标，如系统负载。你需要构建一个自定义的仪表盘，只需点击靠近仪表盘的右上角的选项并选择“Clone Dash”来克隆一个默认的 NGINX 仪表盘。

![Clone dash](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/clone_2.png)

你也可以更高级别的监控你的 NGINX 实例通过使用 Datadog 的 [Host Maps][14] -对于实例，color-coding 你所有的 NGINX 主机通过 CPU 使用率来辨别潜在热点。

![](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx-host-map-3.png)

###  NGINX 指标 ###

一旦 Datadog 捕获并可视化你的指标，你可能会希望建立一些监控自动密切的关注你的指标，并当有问题提醒你。下面将介绍一个典型的例子：一个提醒你 NGINX 吞吐量突然下降时的指标监控器。

#### 监控 NGINX 吞吐量 ####

Datadog 指标警报可以是 threshold-based（当指标超过设定值会警报）或 change-based（当指标的变化超过一定范围会警报）。在这种情况下，我们会采取后一种方式，当每秒传入的请求急剧下降时会提醒我们。下降往往意味着有问题。

1.**创建一个新的指标监控**. 从 Datadog 的“Monitors”下拉列表中选择“New Monitor”。选择“Metric”作为监视器类型。

![NGINX metric monitor](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_1.png)

2.**定义你的指标监视器**. 我们想知道 NGINX 每秒总的请求量下降的数量。所以我们在基础设施中定义我们感兴趣的 nginx.net.request_per_s度量和。

![NGINX metric](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_2.png)

3.**设置指标警报条件**.我们想要在变化时警报，而不是一个固定的值，所以我们选择“Change Alert”。我们设置监控为无论何时请求量下降了30％以上时警报。在这里，我们使用一个 one-minute 数据窗口来表示“now” 指标的值，警报横跨该间隔内的平均变化，和之前 10 分钟的指标值作比较。

![NGINX metric change alert](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_3.png)

4.**自定义通知**.如果 NGINX 的请求量下降，我们想要通知我们的团队。在这种情况下，我们将给 ops 队的聊天室发送通知，网页呼叫工程师。在“Say what’s happening”中，我们将其命名为监控器并添加一个短消息将伴随该通知并建议首先开始调查。我们使用 @mention 作为一般警告，使用 ops 并用 @pagerduty [专门给 PagerDuty 发警告][15]。

![NGINX metric notification](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_4v3.png)

5.**保存集成监控**.点击页面底部的“Save”按钮。你现在监控的关键指标NGINX [work 指标][16]，它边打电话给工程师并在它迅速下时随时分页。

### 结论 ###

在这篇文章中，我们已经通过整合 NGINX 与 Datadog 来可视化你的关键指标，并当你的网络基础架构有问题时会通知你的团队。

如果你一直使用你自己的 Datadog 账号，你现在应该在 web 环境中有了很大的可视化提高，也有能力根据你的环境创建自动监控，你所使用的模式，指标应该是最有价值的对你的组织。

如果你还没有 Datadog 帐户，你可以注册[免费试用][17]，并开始监视你的基础架构，应用程序和现在的服务。

----------
这篇文章的来源在 [on GitHub][18]. 问题，错误，补充等？请[联系我们][19].

------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/

作者：K Young
译者：[strugglingyouth](https://github.com/译者ID)
校对：[strugglingyouth](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.datadoghq.com/blog/how-to-monitor-nginx/
[2]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#open-source
[3]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#plus
[4]:https://github.com/DataDog/dd-agent
[5]:https://app.datadoghq.com/account/settings#agent
[6]:https://app.datadoghq.com/infrastructure
[7]:http://docs.datadoghq.com/guides/basic_agent_usage/
[8]:https://github.com/DataDog/dd-agent/blob/master/conf.d/nginx.yaml.example
[9]:http://docs.datadoghq.com/guides/basic_agent_usage/
[10]:http://docs.datadoghq.com/guides/basic_agent_usage/
[11]:https://app.datadoghq.com/account/settings#integrations/nginx
[12]:https://app.datadoghq.com/dash/integration/nginx
[13]:https://www.datadoghq.com/blog/how-to-monitor-nginx/
[14]:https://www.datadoghq.com/blog/introducing-host-maps-know-thy-infrastructure/
[15]:https://www.datadoghq.com/blog/pagerduty/
[16]:https://www.datadoghq.com/blog/monitoring-101-collecting-data/#metrics
[17]:https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/#sign-up
[18]:https://github.com/DataDog/the-monitor/blob/master/nginx/how_to_monitor_nginx_with_datadog.md
[19]:https://github.com/DataDog/the-monitor/issues
