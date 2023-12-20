[#]: subject: "Geekbench ML Benchmark App Adds Linux Desktop Support"
[#]: via: "https://news.itsfoss.com/geekbench-ml-benchmark-app/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Geekbench ML Benchmark 应用添加了 Linux 桌面支持
======
测试你的机器的 ML 工作负载能力！

在这一年里，我们看到了[新的人工智能联盟][1]的成立，以及一些人对[人工智能模型的开源定义][2]的质疑，但我们仍然看到了大量的新发展。

其中一项进展就是人工智能基准测试领域，流行的 Geekbench ML 在其最新版本中做了一些非常酷的事情。

**正在发生的事情：**随着[最近的公告][3]，[Primate Labs][4] 宣布发布 **Geekbench ML 0.6** ，并提供**一份早期的圣诞礼物，以支持 Linux.**

此版本的 Geekbench ML 作为**预览版本**发布，现已可用于 **Linux**、**Windows** 和 **macOS**。

**可以期望什么：**好吧，对于初学者来说，你可以**期望所有平台上的基准测试体验都是相同的**，因为它们都使用相同的模型和数据集。

顺便说一下，由于**实施了新的框架**，Geekbeench 的内部版本 [TensorFlow Lite][5] 也得到了升级，因此这些功能得到了改进。

他们还在 Geekbench ML 0.6 版本中添加了**三种新类型的工作负载**：

  * **深度估计**，这是一项有助于模拟常见相机软件效果的工作。
  * **风格转移**，该工作负载将模拟生成式人工智能如何在常见用例中发挥作用，如复制照片风格以创建不同的照片。
  * **图像超分辨率**，该工作负载将模拟人工智能驱动的图像增强。



但是，有一件重要的事情需要注意。**对于 Linux，Geekbench ML 0.6 没有图形用户界面 (GUI)**，用户只能使用命令行工具。稍后会详细介绍。

因此，尽管我们距离计划于 2024 年某个时候发布的 **Geekbench ML 1.0 版本还有一段距离**，但这是一个不错的版本，但也存在一些问题。但是，我很高兴看到他们为 Linux 提供了一个端口。

就我们的主题而言，你想在 Linux 系统上运行 Geekbench ML 吗？**

## **以下是运行 Geekbench ML Benchmark 的方法**

首先，你必须从 Geekbench 网站（链接如下）下载 _tar.gz_ 文件。

此后，解压它，在同一目录中打开终端窗口，然后运行以下命令：

````

     ./banff

````

📋

在运行基准测试之前，请确保你有可用的互联网连接。

![][6]

然后它应该开始运行基准测试，你将看到正在实时运行的模型和数据集。

![][7]

基准测试完成后，将显示确认提示，引导你在线查看基准测试结果。

![][8]

你可以在 [Geekbench 浏览器][9] 上查看我的基准测试结果，我承认这并不算什么，但这是我的系统的微不足道的分数😄。

要在 Linux 上运行 Geekbench ML，开发人员建议满足以下**系统要求**：

   * **CPU：** AMD 或 Intel
   * **内存：** 至少 2 GB
   * **操作系统：** Ubuntu 18.04 LTS（64 位）或更高版本



你可以从[官方网站][10]获取 _tar.gz_，只需解压即可开始。

[Geekbench ML][10]

_💬 我真的希望他们在未来的 Linux 版 Geekbench ML 中添加 GUI。你怎么认为？_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/geekbench-ml-benchmark-app/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/ai-alliance/
[2]: https://news.itsfoss.com/open-source-definition-ai/
[3]: https://www.geekbench.com/blog/2023/12/geekbench-ml-06/
[4]: https://www.primatelabs.com/
[5]: https://www.tensorflow.org/lite/guide
[6]: https://news.itsfoss.com/content/images/2023/12/Geekbench_ML_0.6.png
[7]: https://news.itsfoss.com/content/images/2023/12/Geekbench_ML_0.6_Output-1.png
[8]: https://news.itsfoss.com/content/images/2023/12/Geekbench_ML_0.6_Output_2.png
[9]: https://browser.geekbench.com/ml/v0/inference/328997
[10]: https://www.geekbench.com/ml/download/
