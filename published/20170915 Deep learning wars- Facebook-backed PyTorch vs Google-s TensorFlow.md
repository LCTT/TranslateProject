深度学习战争：Facebook 支持的 PyTorch 与 Google 的 TensorFlow
======

![](https://hub.packtpub.com/wp-content/uploads/2018/03/iStock-621901930-1068x832.jpg)

有一个令人震惊的事实，即人工智能和机器学习的工具和技术在近期迅速兴起。深度学习，或者说“注射了激素的机器学习”，数据科学家和机器学习专家在这个领域有数不胜数等可用的库和框架。很多这样的框架都是基于 Python 的，因为 Python 是一个更通用，相对简单的语言。[Theano] [1]、[Keras] [2]、 [TensorFlow] [3] 是几个基于 Python 构建的流行的深度学习库，目的是使机器学习专家更轻松。

Google 的 TensorFlow 是一个被广泛使用的机器学习和深度学习框架。 TensorFlow 开源于 2015 年，得到了机器学习专家社区的广泛支持，TensorFlow 已经迅速成长为许多机构根据其机器学习和深度学习等需求而选择的框架。 另一方面，PyTorch 是由 Facebook 最近开发的用于训练神经网络的 Python 包，改编自基于 Lua 的深度学习库 Torch。 PyTorch 是少数可用的深度学习框架之一，它使用<ruby>基于磁带的自动梯度系统<rt>tape-based autograd system</rt></ruby>，以快速和灵活的方式构建动态神经网络。

在这篇文章中，我们将 PyTorch 与 TensorFlow 进行不同方面的比较。

让我们开始吧！

### 什么编程语言支持 PyTorch 和 TensorFlow？

虽然主要是用 C++ 和 CUDA 编写的，但 TensorFlow 包含一个位于核心引擎上的 Python API，使得更便于被<ruby>Python 支持者<rt>Pythonistas</rt></ruby>使用。 除了 Python，它还包括 C++、Haskell、Java、Go 和 Rust 等其他 API，这意味着开发人员可以用他们的首选语言进行编码。

虽然 PyTorch 是一个 Python 软件包，但你也可以提供使用基本的 C/C++ 语言的 API 进行编码。 如果你习惯使用 Lua 编程语言，你也可以使用 Torch API 在 PyTorch 中编写神经网络模型。

### PyTorch 和 TensorFlow 有多么易于使用？

如果将 TensorFlow 作为一个独立的框架使用，它可能会有点复杂，并且会给深度学习模型的训练带来一些困难。 为了减少这种复杂性，可以使用位于 TensorFlow 复杂引擎之上的 Keras 封装，以简化深度学习模型的开发和训练。 TensorFlow 也支持 PyTorch 目前没有的[分布式培训] [4]。 由于包含 Python API，TensorFlow 也可以在生产环境中使用，即可用于培训练和部署企业级深度学习模型。

PyTorch 由于 Torch 的复杂用 Python 重写。 这使得 PyTorch 对于开发人员更为原生。 它有一个易于使用的框架，提供最大化的灵活和速度。 它还允许在训练过程中快速更改代码而不妨碍其性能。 如果你已经有了一些深度学习的经验，并且以前使用过 Torch，那么基于它的速度、效率和易用性，你会更喜欢 PyTorch。 PyTorch 包含定制的 GPU 分配器，这使得深度学习模型具有更高的内存效率。 由此，训练大型深度学习模型变得更容易。 因此，Pytorch 
在 Facebook、Twitter、Salesforce 等大型组织广受欢迎。

### 用 PyTorch 和 TensorFlow 训练深度学习模型

PyTorch 和 TensorFlow 都可以用来建立和训练神经网络模型。

TensorFlow 工作于 SCG（静态计算图）上，包括在模型开始执行之前定义静态图。 但是，一旦开始执行，在模型内的调整更改的唯一方法是使用 [tf.session and tf.placeholder tensors][5]。

PyTorch 非常适合训练 RNN（递归神经网络），因为它们在 [PyTorch] [6] 中比在 TensorFlow 中运行得更快。 它适用于 DCG（动态计算图），可以随时在模型中定义和更改。 在 DCG 中，每个模块可以单独调试，这使得神经网络的训练更简单。

TensorFlow 最近提出了 TensorFlow Fold，这是一个旨在创建 TensorFlow 模型的库，用于处理结构化数据。 像 PyTorch 一样，它实现了 DCG，在 CPU 上提供高达 10 倍的计算速度，在 GPU 上提供超过 100 倍的计算速度！ 在 [Dynamic Batching] [7] 的帮助下，你现在可以执行尺寸和结构都不相同的深度学习模型。

### GPU 和 CPU 优化的比较

TensorFlow 的编译时间比 PyTorch 短，为构建真实世界的应用程序提供了灵活性。 它可以从 CPU、GPU、TPU、移动设备到 Raspberry Pi（物联网设备）等各种处理器上运行。

另一方面，PyTorch 包括<ruby>张量<rt>tensor</rt></ruby>计算，可以使用 GPU 将深度神经网络模型加速到 [50 倍或更多] [8]。 这些张量可以停留在 CPU 或 GPU 上。 CPU 和 GPU 都是独立的库， 无论神经网络大小如何，PyTorch 都可以高效地利用。

### 社区支持

TensorFlow 是当今最流行的深度学习框架之一，由此也给它带来了庞大的社区支持。 它有很好的文档和一套详细的在线教程。 TensorFlow 还包括许多预先训练过的模型，这些模型托管和提供于 [GitHub] [9]。 这些模型提供给热衷于使用 TensorFlow 开发者和研究人员一些现成的材料来节省他们的时间和精力。

另一方面，PyTorch 的社区相对较小，因为它最近才发展起来。 与 TensorFlow 相比，文档并不是很好，代码也不是很容易获得。 然而，PyTorch 确实允许个人与他人分享他们的预训练模型。

### PyTorch 和 TensorFlow —— 力量悬殊的故事

就目前而言，由于各种原因，TensorFlow 显然比 PyTorch 更受青睐。

TensorFlow 很大，经验丰富，最适合实际应用。 是大多数机器学习和深度学习专家明显的选择，因为它提供了大量的功能，最重要的是它在市场上的成熟应用。 它具有更好的社区支持以及多语言 API 可用。 它有一个很好的文档库，由于从准备到使用的代码使之易于生产。 因此，它更适合想要开始深度学习的人，或者希望开发深度学习模型的组织。

虽然 PyTorch 相对较新，社区较小，但它速度快，效率高。 总之，它给你所有的优势在于 Python 的有用性和易用性。 由于其效率和速度，对于基于研究的小型项目来说，这是一个很好的选择。 如前所述，Facebook、Twitter 等公司正在使用 PyTorch 来训练深度学习模型。 但是，使用它尚未成为主流。 PyTorch 的潜力是显而易见的，但它还没有准备好去挑战这个 TensorFlow 野兽。 然而，考虑到它的增长，PyTorch 进一步优化并提供更多功能的日子并不遥远，直到与 TensorFlow可以 比较。

作者： Savia Lobo，非常喜欢数据科学。 喜欢更新世界各地的科技事件。 喜欢歌唱和创作歌曲。 相信才智上的艺术。

--------------------------------------------------------------------------------

via: https://datahub.packtpub.com/deep-learning/dl-wars-pytorch-vs-tensorflow/

作者：[Savia Lobo][a]
译者：[Wuod3n](https://github.com/Wuod3n)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://datahub.packtpub.com/author/savial/
[1]:https://www.packtpub.com/web-development/deep-learning-theano
[2]:https://www.packtpub.com/big-data-and-business-intelligence/deep-learning-keras
[3]:https://www.packtpub.com/big-data-and-business-intelligence/deep-learning-tensorflow
[4]:https://www.tensorflow.org/deploy/distributed
[5]:https://www.tensorflow.org/versions/r0.12/get_started/basic_usage
[6]:https://www.reddit.com/r/MachineLearning/comments/66rriz/d_rnns_are_much_faster_in_pytorch_than_tensorflow/
[7]:https://arxiv.org/abs/1702.02181
[8]:https://github.com/jcjohnson/pytorch-examples#pytorch-tensors
[9]:https://github.com/tensorflow/models



