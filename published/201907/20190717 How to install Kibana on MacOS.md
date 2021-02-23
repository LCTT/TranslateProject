[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11135-1.html)
[#]: subject: (How to install Kibana on MacOS)
[#]: via: (https://opensource.com/article/19/7/installing-kibana-macos)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

如何在 MacOS 上安装 Kibana
======

> Elasticsearch 当安装好了之后，Kibana 插件可以为这个功能强大的搜索工具添加可视化功能。

![](https://img.linux.net.cn/data/attachment/album/201907/22/204048vl8t88y6q8988229.jpg)

在我之前的文章中，我向 Mac 用户介绍了[安装 Elasticsearch][2] 的步骤，这是世界上最受欢迎的企业级搜索引擎。（这里有一篇针对 Linux 用户的[单独文章][3]。）其自然语言处理能力使得 Elasticsearch 在数据集中查找细节方面表现出色。一旦你发现了你需要的数据，如果你已经安装了 [Kibana][4]，你可以将它提升到一个新的水平。

Kibana 是 Elasticsearch 的开源的数据可视化插件。当你在 Elasticsearch 中找到了数据，Kibana 就会帮助你将其放入折线图、[时间序列查询][5]、地理空间地图等。该工具非常适合于必须展示其研究成果的数据科学家，尤其是那些使用开源数据的人。

### 安装 Kibana

你需要在 Elasticsearch 之外单独安装 Kibana。因为我安装了 Elasticsearch 7.1.1，所以我将安装 Kibana 1.1。版本的匹配非常重要，Kibana 需要针对相同版本的 Elasticsearch 节点运行。 （Kibana 运行在 node.js 上。）

以下是我为 MacOS 安装 Kibana 7.1.1 时所遵循的步骤：

1、确保 Elasticsearch 已下载并运行。如果需要，请参阅上一篇文章。

**注意**：你至少需要先安装 Elasticsearch 1.4.4 或更高版本才能使用 Kibana。这是因为你需要向 Kibana 提供要连接的 Elasticsearch 实例的 URL 以及你要搜索的 Elasticsearch 索引。通常，最好安装两者的最新版本。

2、单击[此处][6]下载 Kibana。你将看到如下的网页，它会提示你在**下载**部分的右上角下载 Kibana for Mac：

![Download Kibana here.][7]

3、在你的 `Downloads` 文件夹中，打开 .tar 文件以展开它。此操作将创建一个具有相同名称的文件夹（例如，`kibana-7.1.1-darwin-x86_64`）。

4、如果你希望 Kibana 放在另一个文件夹中，请立即移动它。

仔细检查 Elasticsearch 是否正在运行，如果没有，请在继续之前启动它。（如果你需要说明，请参阅上一篇文章。）

### 打开 Kibana 插件

Elasticsearch 运行起来后，你现在可以启动 Kibana 了。该过程类似于启动 Elasticsearch：

1、从 Mac 的 `Downloads` 文件夹（或 Kibana 移动到的新文件夹）里，打开 Kibana 文件夹（即 `~Downloads/kibana-7.1.1-darwin-x86_64`）。

2、打开 `bin` 子文件夹。

![The Kibana bin folder.][8]

3、运行 `kibana-plugin`。你可能会遇到上一篇文章中出现的相同安全警告：
   
![Security warning][9]

通常，如果收到此警告，请按照那篇文章中的说明清除警告并打开 Kibana。请注意，如果我在终端中没有运行 Elasticsearch 的情况下打开该插件，我会收到相同的安全警告。要解决此问题，如上一篇文章中所述，打开 Elasticsearch 并在终端中运行它。使用 GUI 启动 Elasticsearch 也应该打开终端。

然后，我右键单击 `kibana-plugin` 并选择“打开”。这个解决方案对我有用，但你可能需要尝试几次。 我的 Elasticsearch 聚会中的几个人在他们的设备上打开 Kibana 时遇到了一些麻烦。

### 更改 Kibana 的主机和端口号

Kibana 的默认设置将其配置为在 `localhost:5601` 上运行。你需要更新文件（在这个例子的情况下）`~Downloads/kibana-7.1.1-darwin-x86_64/config/kibana.yml` 以在运行 Kibana 之前更改主机或端口号。

![The Kibana config directory.][10]

以下是我的 Elasticsearch 聚会组里配置 Kibana 时终端的样子，因此默认为 `http://localhost:9200`，这是查询 Elasticsearch 实例时使用的 URL：

![Configuring Kibana's host and port connections.][11]

### 从命令行运行 Kibana

打开插件后，可以从命令行或 GUI 运行 Kibana。这是终端连接到 Elasticsearch 后的样子：

![Kibana running once it's connected to Elasticsearch.][12]

与 Elasticsearch 一样，Kibana 默认在前台运行。你可以按 `Ctrl-C` 来停止它。

### 总结

Elasticsearch 和 Kibana 是占用大量存储空间的大型软件包。有这么多人一次下载这两个软件包，当我的Elasticsearch 会员和我下载它们两个时，我平均要下载几分钟。这可能是由于 WiFi 不佳和/或用户数量太多，但如果发生同样的事情，请记住这种可能性。

之后，由于我的笔记本电脑存储空间不足，我无法上传我们正在使用的 JSON 文件。我能够按照讲师的可视化进行操作，但无法实时使用 Kibana。因此，在下载 Elasticsearch 和 Kibana 之前，请确保设备上有足够的空间（至少几千兆字节）来上传和使用这些工具搜索文件。

要了解有关 Kibana 的更多信息，他们的用户指南[简介][13]是理想的。（你可以根据你正在使用的 Kibana 版本配置该指南。）他们的演示还向你展示了如何[在几分钟内构建仪表板][14]，然后进行首次部署。

玩得开心！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/installing-kibana-macos

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://linux.cn/article-11125-1.html
[3]: https://opensource.com/article/19/7/installing-elasticsearch-and-kibana-linux
[4]: https://www.elastic.co/products/kibana
[5]: https://en.wikipedia.org/wiki/Time_series
[6]: https://www.elastic.co/downloads/kibana
[7]: https://opensource.com/sites/default/files/uploads/download_kibana.png (Download Kibana here.)
[8]: https://opensource.com/sites/default/files/uploads/kibana_bin_folder.png (The Kibana bin folder.)
[9]: https://opensource.com/sites/default/files/uploads/security_warning.png (Security warning)
[10]: https://opensource.com/sites/default/files/uploads/kibana_config_directory.png (The Kibana config directory.)
[11]: https://opensource.com/sites/default/files/uploads/kibana_host_port_config.png (Configuring Kibana's host and port connections.)
[12]: https://opensource.com/sites/default/files/uploads/kibana_running.png (Kibana running once it's connected to Elasticsearch.)
[13]: https://www.elastic.co/guide/en/kibana/7.2/introduction.html
[14]: https://www.elastic.co/webinars/getting-started-kibana?baymax=rtp&elektra=docs&storm=top-video&iesrc=ctr
