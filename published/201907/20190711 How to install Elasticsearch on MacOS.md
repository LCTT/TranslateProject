[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11125-1.html)
[#]: subject: (How to install Elasticsearch on MacOS)
[#]: via: (https://opensource.com/article/19/7/installing-elasticsearch-macos)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo/users/don-watkins)

如何在 MacOS 上安装 Elasticsearch
======

> 安装 Elasticsearch 很复杂！以下是如何在 Mac 上安装。

![](https://img.linux.net.cn/data/attachment/album/201907/20/064958dnnwvp8wqzqq4fm2.jpg)

[Elasticsearch][2] 是一个用 Java 开发的开源全文搜索引擎。用户上传 JSON 格式的数据集。然后，Elasticsearch 在向集群索引中的文档添加可搜索的引用之前先保存原始文档。

Elasticsearch 创建还不到九年，但它是最受欢迎的企业搜索引擎。Elastic 在 2019 年 6 月 25 日发布了最新的更新版本 7.2.0。

[Kibana][3] 是 Elasticsearch 的开源数据可视化工具。此工具可帮助用户在 Elasticsearch 集群的内容索引之上创建可视化。

[Sunbursts][4]、[地理空间数据地图][5]、[关系分析][6]和实时数据面板只是其中几个功能。并且由于 Elasticsearch 的机器学习能力，你可以了解哪些属性可能会影响你的数据（如服务器或 IP 地址）并查找异常模式。

在上个月的 [DevFest DC][7] 中，Booz Allen Hamilton 的首席数据科学家 [Summer Rankin 博士][8]将 TED Talk 的内容数据集上传到了 Elasticsearch，然后使用 Kibana 快速构建了面板。出于好奇，几天后我去了一个 Elasticsearch 聚会。

由于本课程针对的是新手，因此我们从第一步开始：在我们的笔记本上安装 Elastic 和 Kibana。如果没有安装这两个包，我们无法将莎士比亚的文本数据集作为测试 JSON 文件创建可视化了。

接下来，我将分享在 MacOS 上下载、安装和运行 Elasticsearch V7.1.1 的分步说明。这是我在 2019 年 6 月中旬参加 Elasticsearch 聚会时的最新版本。

### 下载适合 MacOS 的 Elasticsearch

1、进入 <https://www.elastic.co/downloads/elasticsearch>，你会看到下面的页面：

![The Elasticsearch download page.][9]

2、在**下载**区，单击 **MacOS**，将 Elasticsearch TAR 文件（例如，`elasticsearch-7.1.1-darwin-x86_64.tar`）下载到 `Downloads` 文件夹。
 
3、双击此文件并解压到自己的文件夹中（例如，`elasticsearch-7.1.1`），这其中包含 TAR 中的所有文件。

**提示**：如果你希望 Elasticsearch 放在另一个文件夹中，现在可以移动它。

### 在 MacOS 命令行中运行 Elasticsearch

如果你愿意，你可以只用命令行运行 Elasticsearch。只需遵循以下流程：

1、[打开终端窗口][10]。

2、在终端窗口中，输入你的 Elasticsearch 文件夹。例如（如果你移动了程序，请将 `Downloads` 更改为正确的路径）：

```
$ cd ~Downloads/elasticsearch-1.1.0
```

3、切换到 Elasticsearch 的 `bin` 子文件夹，然后启动该程序。例如：

```
$ cd bin 
$ ./elasticsearch
```

这是我启动 Elasticsearch 1.1.0 时命令行终端显示的一些输出：

![Terminal output when running Elasticsearch.][11]

**注意**：默认情况下，Elasticsearch 在前台运行，这可能会导致计算机速度变慢。按 `Ctrl-C` 可以阻止 Elasticsearch 运行。

### 使用 GUI 运行 Elasticsearch

如果你更喜欢点击操作，你可以像这样运行 Elasticsearch：

1、打开一个新的 **Finder** 窗口。

2、在左侧 Finder 栏中选择 `Downloads`（如果你将 Elasticsearch 移动了另一个文件夹，请进入它）。

3、打开名为 `elasticsearch-7.1.1` 的文件夹（对于此例）。出现了八个子文件夹。

![The elasticsearch/bin menu.][12]

4、打开 `bin` 子文件夹。如上面的截图所示，此子文件夹中有 20 个文件。
 
5、单击第一个文件，即 `elasticsearch`。

请注意，你可能会收到安全警告，如下所示：

![The security warning dialog box.][13]

这时候要打开程序需要：

1. 在警告对话框中单击 **OK**。
2. 打开**系统偏好**。
3. 单击**安全和隐私**，打开如下窗口：

    ![Where you can allow your computer to open the downloaded file.][14]
4. 单击**永远打开**，打开如下所示的确认对话框：

    ![Security confirmation dialog box.][15]
5. 单击**打开**。会打开一个终端窗口并启动 Elasticsearch。

启动过程可能需要一段时间，所以让它继续运行。最终，它将完成，你最后将看到类似这样的输出：

![Launching Elasticsearch in MacOS.][16]

### 了解更多

安装 Elasticsearch 之后，就可以开始探索了！

该工具的 [Elasticsearch：开始使用][17]指南会根据你的目标指导你。它的介绍视频介绍了在 [Elasticsearch Service][18] 上启动托管集群，执行基本搜索查询，通过创建、读取、更新和删除（CRUD）REST API 等方式操作数据的步骤。

本指南还提供文档链接，开发控制台命令，培训订阅以及 Elasticsearch Service 的免费试用版。此试用版允许你在 AWS 和 GCP 上部署 Elastic 和 Kibana 以支持云中的 Elastic 集群。

在本文的后续内容中，我们将介绍在 MacOS 上安装 Kibana 所需的步骤。此过程将通过不同的数据可视化将你的 Elasticsearch 查询带到一个新的水平。 敬请关注！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/installing-elasticsearch-macos

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://www.getapp.com/it-management-software/a/qbox-dot-io-hosted-elasticsearch/
[3]: https://www.elastic.co/products/kibana
[4]: https://en.wikipedia.org/wiki/Pie_chart#Ring
[5]: https://en.wikipedia.org/wiki/Spatial_analysis
[6]: https://en.wikipedia.org/wiki/Correlation_and_dependence
[7]: https://www.devfestdc.org/
[8]: https://www.summerrankin.com/about
[9]: https://opensource.com/sites/default/files/uploads/wwa1f3_600px_0.png (The Elasticsearch download page.)
[10]: https://support.apple.com/en-ca/guide/terminal/welcome/mac
[11]: https://opensource.com/sites/default/files/uploads/io6t1a_600px.png (Terminal output when running Elasticsearch.)
[12]: https://opensource.com/sites/default/files/uploads/o43yku_600px.png (The elasticsearch/bin menu.)
[13]: https://opensource.com/sites/default/files/uploads/elasticsearch_security_warning_500px.jpg (The security warning dialog box.)
[14]: https://opensource.com/sites/default/files/uploads/the_general_tab_of_the_system_preferences_security_and_privacy_window.jpg (Where you can allow your computer to open the downloaded file.)
[15]: https://opensource.com/sites/default/files/uploads/confirmation_dialog_box.jpg (Security confirmation dialog box.)
[16]: https://opensource.com/sites/default/files/uploads/y5dvtu_600px.png (Launching Elasticsearch in MacOS.)
[17]: https://www.elastic.co/webinars/getting-started-elasticsearch?ultron=%5BB%5D-Elastic-US+CA-Exact&blade=adwords-s&Device=c&thor=elasticsearch&gclid=EAIaIQobChMImdbvlqOP4wIVjI-zCh3P_Q9mEAAYASABEgJuAvD_BwE
[18]: https://info.elastic.co/elasticsearch-service-gaw-v10-nav.html?ultron=%5BB%5D-Elastic-US+CA-Exact&blade=adwords-s&Device=c&thor=elasticsearch%20service&gclid=EAIaIQobChMI_MXHt-SZ4wIVJBh9Ch3wsQfPEAAYASAAEgJo9fD_BwE
