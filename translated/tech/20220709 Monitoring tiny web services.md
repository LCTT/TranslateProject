[#]: subject: "Monitoring tiny web services"
[#]: via: "https://jvns.ca/blog/2022/07/09/monitoring-small-web-services/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

监测微型网络服务
======

你好! 我最近又开始运行一些服务器（[nginx playground][1]、[mess with dns][2]、[dns lookup][3]），所以我一直在考虑监控问题。

最初我并不完全清楚如何监控这些网站，所以我想快速写下我是如何做到的。

我根本不打算谈如何监控大型严肃的关键任务网站，只谈微型的不重要的网站。

### 目标：在操作上几乎不花时间

我希望网站大部分时间都能正常工作，但我也希望在持续的运营上几乎不花时间。

我最初对运行服务器非常警惕，因为在我的上一份工作中，我是 24/7 轮流值班，负责一些关键的服务，在我的印象中，“负责服务器”意味着“在凌晨 2 点被叫起来修理服务器”和“有很多复杂的仪表盘”。

所以有一段时间我只做静态网站，这样我就不用考虑服务器的问题。

但最终我意识到，我所要写的任何服务器的风险都很低，如果它们偶尔宕机 2 小时也没什么大不了的，我只需设置一些非常简单的监控来帮助它们保持运行。

### 没有监控很糟糕

起初，我根本没有为我的服务器设置任何监控。这样做的结果是非常可预见的：有时网站坏了，而我却没有发现，直到有人告诉我！

### 步骤 1：uptime 检查器

第一步是建立一个 uptime 检查器。外面有很多这样的东西，我现在使用的是 [updown.io][4] 和 [uptime robot][5]。我更喜欢 updown 的用户界面和[定价][6]结构（它是按请求而不是按月收费），但u ptime robot 有一个更慷慨的免费套餐。

它们会：

  1. 检查网站是否正常
  2. 如果出现故障，它会给我发电子邮件



我发现电子邮件通知对我来说是一个很好的级别，如果网站宕机，我会很快发现，但它不会唤醒我或任何东西。

### 步骤 2：端到端的健康检查

接下来，让我们谈谈“检查网站是否正常”到底是什么意思。

起初，我只是把我的健康检查端点之一变成一个函数，无论如何都会返回 `200 OK`。

这倒是挺有用的 – 它告诉我服务器是启动着的！

但不出所料，我遇到了问题，因为它没有检查 API 是否真的在_工作_ – 有时健康检查成功了，尽管服务的其他部分实际上已经进入了一个糟糕的状态。

所以我更新了它，让它真正地发出 API 请求，并确保它成功了。

我所有的服务都只做了很少的事情（nginx playground 只有一个端点），所以设置一个健康检查是非常容易的，它实际上贯穿了服务应该做的大部分动作。

下面是 nginx playground 的端到端健康检查处理程序的样子。它非常基本：它只是发出一个 POST 请求（给自己），并检查该请求是成功还是失败。

```

    func healthHandler(w http.ResponseWriter, r *http.Request) {
        // make a request to localhost:8080 with `healthcheckJSON` as the body
        // if it works, return 200
        // if it doesn't, return 500
        client := http.Client{}
        resp, err := client.Post("http://localhost:8080/", "application/json", strings.NewReader(healthcheckJSON))
        if err != nil {
            log.Println(err)
            w.WriteHeader(http.StatusInternalServerError)
            return
        }
        if resp.StatusCode != http.StatusOK {
            log.Println(resp.StatusCode)
            w.WriteHeader(http.StatusInternalServerError)
            return
        }
        w.WriteHeader(http.StatusOK)
    }

```

### 健康检查频率：每小时一次

现在，我大部分健康检查每小时运行一次，有些每 30 分钟运行一次。

我每小时运行一次，因为 updown.io 的定价是按健康检查次数计算的，我正在监控 18 个不同的 URL，而且我想把我的健康检查预算保持在 5 美元/年的最低水平。

花一个小时来发现这些网站中的一个出现故障，对我来说是可以的 – 如果有问题，我也不能保证能很快修复它。

如果可以更频繁地运行它们，我可能会每 5-10 分钟运行一次。

### 步骤 3：第三步：如果健康检查失败，自动重新启动

我的一些网站在 fly.io 上，fly 有一个相当标准的功能，我可以为一个服务配置一个 HTTP 健康检查，如果健康检查失败，就重新启动服务。

“经常重启”是一个非常有用的策略来弥补我尚未修复的 bug，有一段时间，nginx playground 有一个进程泄漏，`nginx` 进程没有被终止，所以服务器的内存一直在耗尽。

通过健康检查，其结果是，每隔一天左右就会发生这样的情况：

  * 服务器的内存用完了
  * 健康检查开始失败
  * 它被重新启动
  * 一切又正常了
  * 几个小时后再次重复整个传奇



最终，我开始实际修复进程泄漏，但很高兴有一个解决方法可以在我拖延修复 bug 时保持运行。

这些用于决定是否重新启动服务的运行状况检查更频繁地运行：每 5 分钟左右。

### 这不是监控大型服务的最佳方式

这可能很明显，我在一开始就已经说过了，但是“编写一个 HTTP 健康检查”并不是监控大型复杂服务的最佳方法。 但我不会深入讨论，因为这不是这篇文章的主题。

### 到目前为止一直运行良好！

我最初在 3 个月前的四月写了这篇文章，但我一直等到现在才发布它以确保整个设置正常工作。

这带来了很大的不同 – 在我遇到一些非常愚蠢的停机问题之前，现在在过去的几个月里，网站的运行时间达到了 99.95%！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/07/09/monitoring-small-web-services/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://nginx-playground.wizardzines.com
[2]: https://messwithdns.net
[3]: https://dns-lookup.jvns.ca
[4]: https://updown.io/
[5]: https://uptimerobot.com/
[6]: https://updown.io/#pricing
