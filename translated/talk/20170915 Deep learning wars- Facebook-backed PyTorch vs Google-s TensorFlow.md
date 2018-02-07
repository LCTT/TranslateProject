深度学习战争：Facebook支持的PyTorch与Google的TensorFlow
======
有一个令人震惊的事实,即人工智能和机器学习的工具和技术在近期迅速兴起。深度学习，或者说“注射了激素的机器学习”是数据科学家和机器学习专家在可用的库和框架方面被宠坏的一个领域。很多这样的框架都是基于Python的，因为Python是一个更通用，相对简单的语言。[Theano] [1]，[Keras] [2] [TensorFlow] [3]是一些基于Python构建的流行的深度学习库，目的是使机器学习专家更轻松。

Google的TensorFlow是一个广泛使用的机器学习和深度学习框架。 TensorFlow开源于2015年，得到了机器学习专家的广泛支持，TensorFlow已经迅速成长为许多机构为其机器学习和深度学习需求所选择的框架。 另一方面，PyTorch最近开发的用于训练神经网络的Python包被改编自基于Lua的深度学习库Torch。 PyTorch是少数可用的DL框架之一，它使用基于磁带的autograd系统（tape-based autograd system），以快速和灵活的方式构建动态神经网络。

在这篇文章中，我们将PyTorch与TensorFlow进行不同方面的比较。

让我们开始吧！

###什么编程语言支持 PyTorch和TensorFlow？

虽然主要是用C ++和CUDA编写的，但Tensorflow包含一个位于核心引擎上的Python API，使得更便于被Pythonistas使用。 除了Python，它还包括C ++，Haskell，Java，Go和Rust等其他API，这意味着开发人员可以用他们的首选语言进行编码。

虽然PyTorch是一个Python软件包，但你也可以提供使用基本的C / C ++语言的API进行编码。 如果你习惯使用Lua编程语言，你也可以使用Torch API在PyTorch中编写神经网络模型。

###PyTorch和TensorFlow有多么易于使用？

如果将TensorFlow作为一个独立的框架使用，它可能会有点复杂，并且会给深度学习模型的训练带来一些困难。 为了减少这种复杂性，可以使用位于TensorFlow复杂引擎之上的Keras封装，简化深度学习模型的开发和训练。 TensorFlow也支持PyTorch目前没有的[分布式培训] [4]。 由于包含Python API，TensorFlow也可以在生产环境中使用，即可用于培训练和部署企业级深度学习模型。

PyTorch由于Torch的复杂而被Python重写。 这使得PyTorch对于开发人员更为原生。 它有一个易于使用的框架，提供最大化的灵活和速度。 它还允许在训练过程中快速更改代码而不妨碍其性能。 如果你已经有了一些深度学习的经验，并且以前使用过Torch，那么基于它的速度，效率和易用性，你会更喜欢PyTorch。 PyTorch包含定制的GPU分配器，这使得深度学习模型具有高度的内存效率。 由此，训练大型深度学习模型变得更容易。 因此，Pytorch
在Facebook，Twitter，Salesforce等大型组织广受欢迎。

###用PyTorch和TensorFlow训练深度学习模型

PyTorch和TensorFlow都可以用来建立和训练神经网络模型。

TensorFlow在SCG（静态计算图）上工作，包括在模型开始执行之前定义静态图形。 但是，一旦开始执行，在模型内的调整更改的唯一方法是使用[tf.session and tf.placeholder tensors][5]。

PyTorch非常适合训练RNNs（递归神经网络），因为它们在[PyTorch] [6]中比在TensorFlow中运行得更快。 它适用于DCG（动态计算图），可以随时在模型中定义和更改。 在DCG中，每个模块可以单独调试，这使得神经网络的训练更简单。

TensorFlow最近提出了TensorFlow Fold，这是一个旨在创建TensorFlow模型的库，用于处理结构化数据。 像PyTorch一样，它实现了DCGs，在CPU上提供高达10倍的计算速度，在GPU上提供超过100倍的计算速度！ 在[Dynamic Batching] [7]的帮助下，你现在可以执行尺寸和结构都不相同的深度学习模型。

###GPU和CPU优化的比较

TensorFlow的编译时间比PyTorch短，为构建真实世界的应用程序提供了灵活性。 它可以从CPU，GPU，TPU，移动设备到Raspberry Pi（物联网设备）等各种处理器上运行。

另一方面，PyTorch包括张量（tensor）计算，可以使用GPU将深度神经网络模型加速到[50倍或更多] [8]。 这些张量可以停留在CPU或GPU上。 CPU和GPU都是独立的库， 无论神经网络大小如何，PyTorch都可以高效地利用。

###社区支持

TensorFlow是当今最流行的深度学习框架之一，由此也给它带来了庞大的社区支持。 它有很好的文档和一套详细的在线教程。 TensorFlow还包括许多预先训练过的模型，这些模型在[github] [9]上托管和提供。 这些模型提供给热衷于使用TensorFlow开发者和研究人员一些现成的材料来节省他们的时间和精力。

另一方面，PyTorch的社区相对较小，因为它最近才发展起来。 与TensorFlow相比，文档并不是很好，代码也不是很容易获得。 然而，PyTorch确实允许个人与他人分享他们的预训练模型。

### PyTorch和TensorFlow-力量悬殊的故事

就目前而言，由于各种原因，Tensorflow显然比PyTorch更受青睐。

Tensorflow很大，经验丰富，最适合实际应用。 是大多数机器学习和深度学习专家明显的选择，因为它提供了大量的功能，最重要的是它在市场上的成熟应用。 它具有更好的社区支持以及多语言API可用。 它有一个很好的文档库，由于从准备到使用的代码使之易于生产。 因此，它更适合想要开始深度学习的人，或者希望开发深度学习模型的组织。

虽然PyTorch相对较新，社区较小，但它速度快，效率高。 总之，它给你所有的优势在于Python的有用性和易用性。 由于其效率和速度，对于基于研究的小型项目来说，这是一个很好的选择。 如前所述，Facebook，Twitter等公司正在使用Pytorch来训练深度学习模型。 但是，使用它尚未成为主流。 PyTorch的潜力是显而易见的，但它还没有准备好去挑战这个TensorFlow的野兽。 然而，考虑到它的增长，PyTorch进一步优化并提供更多功能的日子并不遥远，直到与TensorFlow可以比较。

###Savia Lobo
非常喜欢数据科学。 喜欢更新世界各地的科技事件。 喜欢歌唱和创作歌曲。 相信才智上的艺术。

--------------------------------------------------------------------------------

via: https://datahub.packtpub.com/deep-learning/dl-wars-pytorch-vs-tensorflow/

作者：[Savia Lobo][a]
译者：[Wuod3n](https://github.com/Wuod3n)
校对：[校对者ID](https://github.com/校对者ID)

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

































