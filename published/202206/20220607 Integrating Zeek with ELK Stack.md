[#]: subject: "Integrating Zeek with ELK Stack"
[#]: via: "https://www.opensourceforu.com/2022/06/integrating-zeek-with-elk-stack/"
[#]: author: "Tridev Reddy https://www.opensourceforu.com/author/tridev-reddy/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14770-1.html"

将 Zeek 与 ELK 栈集成
======

> Zeek 是一个开源的网络安全监控工具。本文讨论了如何将 Zeek 与 ELK 集成。

![](https://img.linux.net.cn/data/attachment/album/202206/28/164550v4nuk3g7ux77y77v.jpg)

在本杂志 2022 年 3 月版发表的题为“用 Zeek 轻松实现网络安全监控”的文章中，我们研究了 Zeek 的功能，并学习了如何开始使用它。现在我们将把我们的学习经验再进一步，看看如何将其与 ELK（即 Elasticsearch、Kibana、Beats 和 Logstash）整合。

为此，我们将使用一个叫做 Filebeat 的工具，它可以监控、收集并转发日志到 Elasticsearch。我们将把 Filebeat 和 Zeek 配置在一起，这样后者收集的数据将被转发并集中到我们的 Kibana 仪表盘上。

### 安装 Filebeat

让我们首先将 Filebeat 与 Zeek 安装在一起。使用 `apt` 来安装 Filebeat，使用以下命令：

```
sudo apt install filebeat
```

接下来，我们需要配置 `.yml` 文件，它位于 `/etc/filebeat/` 文件夹中：

```
sudo nano /etc/filebeat/filebeat.yml
```

我们只需要在这里配置两件事。在 Filebeat 输入部分，将类型改为 `log`，并取消对 `enabled:false` 的注释，将其改为 `true`。我们还需要指定存储日志的路径，也就是说，我们需要指定 `/opt/zeek/logs/current/*.log`。

完成这些后，设置的第一部分应该类似于图 1 所示的内容。

![Figure 1: Filebeat config (a)][2]

第二件要修改的事情是在输出下的 Elasticsearch 输出部分，取消对 `output.elasticsearch` 和 `hosts` 的注释。确保主机的 URL 和端口号与你安装 ELK 时配置的相似。我们把它保持为 `localhost`，端口号为 `9200`。

在同一部分中，取消底部的用户名和密码的注释，输入安装后配置 ELK 时生成的 Elasticsearch 用户的用户名和密码。完成这些后，参考图 2，检查设置。

![Figure 2: Filebeat config (b)][3]

现在我们已经完成了安装和配置，我们需要配置 Zeek，使其以 JSON 格式存储日志。为此，确保你的 Zeek 实例已经停止。如果没有，执行下面的命令来停止它：

```
cd /opt/zeek/bin
./zeekctl stop
```

现在我们需要在 `local.zeek` 中添加一小行，它存在于 `opt/zeek/share/zeek/site/` 目录中。

以 root 身份打开该文件，添加以下行：

```
@load policy/tuning/json-logs.zeek
```

参考图 3，确保设置正确。

![Figure 3: local.zeek file][4]

由于我们改变了 Zeek 的一些配置，我们需要重新部署它，这可以通过执行以下命令来完成：

```
cd /opt/zeek/bin
./zeekctl deploy
```

现在我们需要在 Filebeat 中启用 Zeek 模块，以便它转发 Zeek 的日志。执行下面的命令：

```
sudo filebeat modules enable zeek
```

我们几乎要好了。在最后一步，配置 `zeek.yml` 文件要记录什么类型的数据。这可以通过修改 `/etc/filebeat/modules.d/zeek.yml` 文件完成。

在这个 .yml 文件中，我们必须提到这些指定的日志存放在哪个目录下。我们知道，这些日志存储在当前文件夹中，其中有几个文件，如 `dns.log`、`conn.log`、`dhcp.log` 等等。我们需要在每个部分提到每个路径。如果而且只有在你不需要该文件/程序的日志时，你可以通过把启用值改为 `false` 来舍弃不需要的文件。

例如，对于 `dns`，确保启用值为 `true`，并且路径被配置：

```
var.paths: [ “/opt/zeek/logs/current/dns.log”, “/opt/zeek/logs/*.dns.json” ]
```

对其余的文件重复这样做。我们对一些我们需要的文件做了这个处理。我们添加了所有主要需要的文件。你也可以这样做。请参考图 4。

![Figure 4: zeek.yml configuration][5]

现在是启动 Filebeat 的时候了。执行以下命令：

```
sudo filebeat setup
sudo service filebeat start
```

现在一切都完成了，让我们移动到 Kibana 仪表板，检查我们是否通过 Filebeat 接收到来自 Zeek 的数据。

![Figure 5: Dashboard of Kibana (Destination Geo)][6]

进入仪表板。你可以看到它所捕获的数据的清晰统计分析（图 5 和图 6）。

![Figure 6: Dashboard of Kibana (Network)][7]

现在让我们进入发现选项卡，通过使用查询进行过滤来检查结果：

```
event.module: "zeek"
```

这个查询将过滤它在一定时间内收到的所有数据，只向我们显示名为 Zeek 的模块的数据（图 7）。

![Figure 7: Filtered data by event.module query][8]

### 鸣谢

*作者感谢 VIT-AP 计算机科学与工程学院的 Sibi Chakkaravarthy Sethuraman、Sudhakar Ilango、Nandha Kumar R.和Anupama Namburu 的不断指导和支持。特别感谢人工智能和机器人技术卓越中心（AIR）。*


--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/integrating-zeek-with-elk-stack/

作者：[Tridev Reddy][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/tridev-reddy/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Integrating-Zeek-with-ELK-Stack-Featured-image.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Filebeat-config-a.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2-Filebeat-config-b.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-3-local.zeek-file-1.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4-zeek.yml-configuration.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5-Dashboard-of-Kibana-Destination-Geo.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6-Dashboard-of-Kibana-Network-1.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-7-Filtered-data-by-event.jpg
