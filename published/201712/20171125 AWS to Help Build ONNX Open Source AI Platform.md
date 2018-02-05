AWS 帮助构建 ONNX 开源 AI 平台
============================================================
![onnx-open-source-ai-platform](https://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2017-onnx-1.jpg)


AWS 最近成为了加入深度学习社区的<ruby>开放神经网络交换<rt>Open Neural Network Exchange</rt></ruby>（ONNX）协作的技术公司，最近在<ruby>无障碍和可互操作<rt>frictionless and interoperable</rt></ruby>的环境中推出了高级人工智能。由 Facebook 和微软领头了该协作。

作为该合作的一部分，AWS 开源其深度学习框架 Python 软件包 ONNX-MXNet，该框架提供了跨多种语言的编程接口（API），包括 Python、Scala 和开源统计软件 R。

AWS 深度学习工程经理 Hagay Lupesko 和软件开发人员 Roshani Nagmote 上周在一篇帖子中写道，ONNX 格式将帮助开发人员构建和训练其它框架的模型，包括 PyTorch、Microsoft Cognitive Toolkit 或 Caffe2。它可以让开发人员将这些模型导入 MXNet，并运行它们进行推理。

### 对开发者的帮助

今年夏天，Facebook 和微软推出了 ONNX，以支持共享模式的互操作性，来促进 AI 的发展。微软提交了其 Cognitive Toolkit、Caffe2 和 PyTorch 来支持 ONNX。

微软表示：Cognitive Toolkit 和其他框架使开发人员更容易构建和运行计算图以表达神经网络。

[ONNX 代码和文档][4]的初始版本已经放到了 Github。

AWS 和微软上个月宣布了在 Apache MXNet 上的一个新 Gluon 接口计划，该计划允许开发人员构建和训练深度学习模型。

[Tractica][5] 的研究总监 Aditya Kaul 观察到：“Gluon 是他们试图与 Google 的 Tensorflow 竞争的合作伙伴关系的延伸”。

他告诉 LinuxInsider，“谷歌在这点上的疏忽是非常明显的，但也说明了他们在市场上的主导地位。”

Kaul 说：“甚至 Tensorflow 也是开源的，所以开源在这里并不是什么大事，但这归结到底是其他生态系统联手与谷歌竞争。”

根据 AWS 的说法，本月早些时候，Apache MXNet 社区推出了 MXNet 的 0.12 版本，它扩展了 Gluon 的功能，以便进行新的尖端研究。它的新功能之一是变分 dropout，它允许开发人员使用 dropout 技术来缓解递归神经网络中的过拟合。

AWS 指出：卷积 RNN、LSTM 网络和门控循环单元（GRU）允许使用基于时间的序列和空间维度对数据集进行建模。

### 框架中立方式

[Tirias Research][6] 的首席分析师 Paul Teich 说：“这看起来像是一个提供推理的好方法，而不管是什么框架生成的模型。”

他告诉 LinuxInsider：“这基本上是一种框架中立的推理方式。”

Teich 指出，像 AWS、微软等云提供商在客户的压力下可以在一个网络上进行训练，同时提供另一个网络，以推进人工智能。

他说：“我认为这是这些供应商检查互操作性的一种基本方式。”

Tractica 的 Kaul 指出：“框架互操作性是一件好事，这会帮助开发人员确保他们建立在 MXNet 或 Caffe 或 CNTK 上的模型可以互操作。”

至于这种互操作性如何适用于现实世界，Teich 指出，诸如自然语言翻译或语音识别等技术将要求将 Alexa 的语音识别技术打包并交付给另一个开发人员的嵌入式环境。

### 感谢开源

[ThinkStrategies][7] 的总经理 Jeff Kaplan 表示：“尽管存在竞争差异，但这些公司都认识到他们在开源运动所带来的软件开发进步方面所取得的巨大成功。”

他告诉 LinuxInsider：“开放式神经网络交换（ONNX）致力于在人工智能方面产生类似的优势和创新。”

越来越多的大型科技公司已经宣布使用开源技术来加快 AI 协作开发的计划，以便创建更加统一的开发和研究平台。

AT＆T 几周前宣布了与 TechMahindra 和 Linux 基金会合作[推出 Acumos 项目][8]的计划。该平台旨在开拓电信、媒体和技术方面的合作。


--------------------------------------------------------------------------------

via: https://www.linuxinsider.com/story/AWS-to-Help-Build-ONNX-Open-Source-AI-Platform-84971.html

作者：[David Jones][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxinsider.com/story/AWS-to-Help-Build-ONNX-Open-Source-AI-Platform-84971.html#searchbyline
[1]:https://www.linuxinsider.com/story/AWS-to-Help-Build-ONNX-Open-Source-AI-Platform-84971.html#
[2]:https://www.linuxinsider.com/perl/mailit/?id=84971
[3]:https://www.linuxinsider.com/story/AWS-to-Help-Build-ONNX-Open-Source-AI-Platform-84971.html
[4]:https://github.com/onnx/onnx
[5]:https://www.tractica.com/
[6]:http://www.tiriasresearch.com/
[7]:http://www.thinkstrategies.com/
[8]:https://www.linuxinsider.com/story/84926.html
[9]:https://www.linuxinsider.com/story/AWS-to-Help-Build-ONNX-Open-Source-AI-Platform-84971.html
