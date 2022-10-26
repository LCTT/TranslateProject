[#]: subject: "Google AI Unveils A New Open Source Library for Array Storage"
[#]: via: "https://www.opensourceforu.com/2022/10/google-ai-unveils-a-new-open-source-library-for-array-storage/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "KevinZonda"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15128-1.html"

谷歌 AI 推出新的数组存储开源库
======

![](https://www.opensourceforu.com/wp-content/uploads/2022/10/google3-1068x559.jpg)

> 谷歌 AI 引入了一个用于数组存储的高性能开源库 TensorStore。

谷歌开发的开源 C++ 和 Python 框架 TensorStore 旨在加速大型多维数组的读写设计。覆盖单一大型坐标系的多维数据集通常用于当代计算机科学和机器学习应用程序中。使用这些数据集具有挑战性，因为客户经常希望进行涉及多个工作站并行操作的调查，并且可能会以不可预测的间隔和不同的规模接收和输出数据。

谷歌研究院开发了 TensorStore，该库为用户提供了一个可以管理巨大数据集的 API，而无需复杂的硬件，以解决数据存储和操作问题。该库支持许多存储系统，包括本地和网络文件系统、谷歌云存储等。

为了加载和处理大量数据，TensorStore 提供了一个简单的 Python API。任何任意大小的基础数据集都可以加载和更新，而无需将数据集完整存储在内存中，因为在需要精确切片之前不需要在内存中读取或保存实际数据。

这是通过索引和操作语法实现的，它与 NumPy 操作的语法非常相似。除了虚拟视图、广播、对齐和其他复杂的索引功能，TensorStore 还支持如数据类型转换、降低取样和随意创建的数组这些功能。

此外，TensorStore 包含一个异步 API，可以并发进行读取或写入操作。在执行其他工作时，软件可以进行内存缓存处理（可配置），从而减少在访问常用数据时处理较慢存储系统的需要。

大型数值数据集需要大量的处理能力来检查和分析。实现这一点的常用方法是在分散在许多设备上的大量 CPU 或加速器内核之间并行化任务。在保持出色速度的同时并行分析单个数据集的能力一直是 TensorStore 的关键目标。 PaLM、脑图和其他复杂的大规模机器学习模型是 TensorStore 应用案例的一些例子。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/10/google-ai-unveils-a-new-open-source-library-for-array-storage/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[KevinZonda](https://github.com/KevinZonda)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
