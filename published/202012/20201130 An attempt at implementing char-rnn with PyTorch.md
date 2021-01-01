[#]: collector: (lujun9972)
[#]: translator: (zxp93)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12932-1.html)
[#]: subject: (An attempt at implementing char-rnn with PyTorch)
[#]: via: (https://jvns.ca/blog/2020/11/30/implement-char-rnn-in-pytorch/)
[#]: author: (Julia Evans https://jvns.ca/)

用 PyTorch 实现基于字符的循环神经网络
======

![](https://img.linux.net.cn/data/attachment/album/202012/19/102319oe36em6d63bolg0i.jpg)

在过去的几周里，我花了很多时间用 PyTorch 实现了一个 [char-rnn][1] 的版本。我以前从未训练过神经网络，所以这可能是一个有趣的开始。

这个想法（来自 [循环神经网络的不合理效应][1]）可以让你在文本上训练一个基于字符的<ruby>循环神经网络<rt>recurrent neural network</rt></ruby>（RNN），并得到一些出乎意料好的结果。

不过，虽然没有得到我想要的结果，但是我还是想分享一些示例代码和结果，希望对其他开始尝试使用 PyTorch 和 RNN 的人有帮助。

这是 Jupyter 笔记本格式的代码：[char-rnn in PyTorch.ipynb][2]。你可以点击这个网页最上面那个按钮 “Open in Colab”，就可以在 Google 的 Colab 服务中打开，并使用免费的 GPU 进行训练。所有的东西加起来大概有 75 行代码，我将在这篇博文中尽可能地详细解释。

### 第一步：准备数据

首先，我们要下载数据。我使用的是<ruby>古登堡项目<rt>Project Gutenberg</rt></ruby>中的这个数据：[Hans Christian Anderson’s fairy tales][3]。

```
!wget -O fairy-tales.txt
```

这个是准备数据的代码。我使用 `fastai` 库中的 `Vocab` 类进行数据处理，它能将一堆字母转换成“词表”，然后用这个“词表”把字母变成数字。

之后我们就得到了一个大的数字数组（`training_set`），我们可以用于训练我们的模型。

```
from fastai.text import *
text = unidecode.unidecode(open('fairy-tales.txt').read())
v = Vocab.create((x for x in text), max_vocab=400, min_freq=1)
training_set = torch.Tensor(v.numericalize([x for x in text])).type(torch.LongTensor).cuda()
num_letters = len(v.itos)
```

### 第二步：定义模型

这个是 PyTorch 中 `LSTM` 类的封装。除了封装 `LSTM` 类以外，它还做了三件事：

  1. 对输入向量进行 one-hot 编码，使得它们具有正确的维度。
  2. 在 `LSTM` 层后一层添加一个线性变换，因为 `LSTM` 输出的是一个长度为 `hidden_size` 的向量，我们需要的是一个长度为 `input_size` 的向量这样才能把它变成一个字符。
  3. 把 `LSTM` 隐藏层的输出向量（实际上有 2 个向量）保存成实例变量，然后在每轮运行结束后执行 `.detach()` 函数。（我很难解释清 `.detach()` 的作用，但我的理解是，它在某种程度上“结束”了模型的求导计算）（LCTT 译注：`detach()` 函数是将该张量的 `requires_grad` 参数设置为 `False`，即反向传播到该张量就结束。）

```
class MyLSTM(nn.Module):
    def __init__(self, input_size, hidden_size):
        super().__init__()
        self.lstm = nn.LSTM(input_size, hidden_size, batch_first=True)
        self.h2o = nn.Linear(hidden_size, input_size)
        self.input_size=input_size
        self.hidden = None

    def forward(self, input):
        input = torch.nn.functional.one_hot(input, num_classes=self.input_size).type(torch.FloatTensor).cuda().unsqueeze(0)
        if self.hidden is None:
            l_output, self.hidden = self.lstm(input)
        else:
            l_output, self.hidden = self.lstm(input, self.hidden)
        self.hidden = (self.hidden[0].detach(), self.hidden[1].detach())

        return self.h2o(l_output)
```

这个代码还做了一些比较神奇但是不太明显的功能。如果你的输入是一个向量（比如 `[1,2,3,4,5,6]`），对应六个字母，那么我的理解是 `nn.LSTM` 会在内部使用[沿时间反向传播][4]更新隐藏向量 6 次。

### 第三步：编写训练代码

模型不会自己训练的！

我最开始的时候尝试用 `fastai` 库中的一个辅助类（也是 PyTorch 中的封装）。我有点疑惑因为我不知道它在做什么，所以最后我自己编写了模型训练代码。

下面这些代码（`epoch()` 方法）就是有关于一轮训练过程的基本信息。基本上就是重复做下面这几件事情：

  1. 往 RNN 模型中传入一个字符串，比如 `and they ought not to teas`。（要以数字向量的形式传入）
  2. 得到下一个字母的预测结果
  3. 计算 RNN 模型预测结果和真实的下一个字母之间的损失函数（`e`，因为 `tease` 这个单词是以 `e` 结尾的）
  4. 计算梯度（用 `loss.backward()` 函数）
  5. 沿着梯度下降的方向修改模型中参数的权重（用 `self.optimizer.step()` 函数）

```
class Trainer():
  def __init__(self):
      self.rnn = MyLSTM(input_size, hidden_size).cuda()
      self.optimizer = torch.optim.Adam(self.rnn.parameters(), amsgrad=True, lr=lr)
  def epoch(self):
      i = 0
      while i < len(training_set) - 40:
        seq_len = random.randint(10, 40)
        input, target = training_set[i:i+seq_len],training_set[i+1:i+1+seq_len]
        i += seq_len
        # forward pass
        output = self.rnn(input)
        loss = F.cross_entropy(output.squeeze()[-1:], target[-1:])
        # compute gradients and take optimizer step
        self.optimizer.zero_grad()
        loss.backward()
        self.optimizer.step()
```

### 使用 nn.LSTM 沿着时间反向传播，不要自己写代码

开始的时候我自己写代码每次传一个字母到 LSTM 层中，之后定期计算导数，就像下面这样：

```
for i in range(20):
    input, target = next(iter)
    output, hidden = self.lstm(input, hidden)
loss = F.cross_entropy(output, target)
hidden = hidden.detach()
self.optimizer.zero_grad()
loss.backward()
self.optimizer.step()
```

这段代码每次传入 20 个字母，每次一个，并且在最后训练了一次。这个步骤就被称为[沿时间反向传播][4]，Karpathy 在他的博客中就是用这种方法。

这个方法有些用处，我编写的损失函数开始能够下降一段时间，但之后就会出现峰值。我不知道为什么会出现这种现象，但之后我改为一次传入 20 个字符到 LSTM 之后（按 `seq_len` 维度），再进行反向传播，情况就变好了。

### 第四步：训练模型！

我在同样的数据上重复执行了这个训练代码大概 300 次，直到模型开始输出一些看起来像英文的文本。差不多花了一个多小时吧。

这种情况下我也不关注模型是不是过拟合了，但是如果你在真实场景中训练模型，应该要在验证集上验证你的模型。

### 第五步：生成输出！

最后一件要做的事就是用这个模型生成一些输出。我写了一个辅助方法从这个训练好的模型中生成文本（`make_preds` 和 `next_pred`）。这里主要是把向量的维度对齐，重要的一点是：

```
output = rnn(input)
prediction_vector = F.softmax(output/temperature)
letter = v.textify(torch.multinomial(prediction_vector, 1).flatten(), sep='').replace('_', ' ')
```

基本上做的事情就是这些：

  1. RNN 层为字母表中的每一个字母或者符号输出一个数值向量（`output`）。
  2. 这个 `output` 向量**并不是**一个概率向量，所以需要 `F.softmax(output/temperature)` 操作，将其转换为概率值（也就是所有数值加起来和为 1）。`temperature` 某种程度上控制了对更高概率的权重，在限制范围内，如果设置 `temperature=0.0000001`，它将始终选择概率最高的字母。
  3. `torch.multinomial(prediction_vector)` 用于获取概率向量，并使用这些概率在向量中选择一个索引（如 `12`）。
  4. `v.textify` 把 `12` 转换为字母。

如果我们想要处理的文本长度为 300，那么只需要重复这个过程 300 次就可以了。

### 结果！

我把预测函数中的参数设置为 `temperature = 1` 得到了下面的这些由模型生成的结果。看起来有点像英语，这个结果已经很不错了，因为这个模型要从头开始“学习”英语，并且是在字符序列的级别上进行学习的。

虽然这些话没有什么*含义*，但我们也不知道到底想要得到什么输出。

> “An who was you colotal said that have to have been a little crimantable and beamed home the beetle. “I shall be in the head of the green for the sound of the wood. The pastor. “I child hand through the emperor’s sorthes, where the mother was a great deal down the conscious, which are all the gleam of the wood they saw the last great of the emperor’s forments, the house of a large gone there was nothing of the wonded the sound of which she saw in the converse of the beetle. “I shall know happy to him. This stories herself and the sound of the young mons feathery in the green safe.”
>
> “That was the pastor. The some and hand on the water sound of the beauty be and home to have been consider and tree and the face. The some to the froghesses and stringing to the sea, and the yellow was too intention, he was not a warm to the pastor. The pastor which are the faten to go and the world from the bell, why really the laborer’s back of most handsome that she was a caperven and the confectioned and thoughts were seated to have great made

下面这些结果是当 `temperature=0.1` 时生成的，它选择字符的方式更接近于“每次都选择出现概率最高的字符”。这就使得输出结果有很多是重复的。

> ole the sound of the beauty of the beetle. “She was a great emperor of the sea, and the sun was so warm to the confectioned the beetle. “I shall be so many for the beetle. “I shall be so many for the beetle. “I shall be so standen for the world, and the sun was so warm to the sea, and the sun was so warm to the sea, and the sound of the world from the bell, where the beetle was the sea, and the sound of the world from the bell, where the beetle was the sea, and the sound of the wood flowers and the sound of the wood, and the sound of the world from the bell, where the world from the wood, and the sound of the

这段输出对这几个单词 `beetles`、`confectioners`、`sun` 和 `sea` 有着奇怪的执念。

### 总结！

至此，我的结果远不及 Karpathy 的好，可能有一下几个原因：

  1. 没有足够多的训练数据。
  2. 训练了一个小时之后我就没有耐心去查看 Colab 笔记本上的信息。
  3. Karpathy 使用了两层LSTM，包含了更多的参数，而我只使用了一层。
  4. 完全是另一回事。

但我得到了一些大致说得过去的结果！还不错！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/30/implement-char-rnn-in-pytorch/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[zhangxiangping](https://github.com/zxp93)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://karpathy.github.io/2015/05/21/rnn-effectiveness/
[2]: https://gist.github.com/jvns/b6dda36b2fdcc02b833ed5b0c7a09112
[3]: https://www.gutenberg.org/cache/epub/27200/pg27200.txt
[4]: https://en.wikipedia.org/wiki/Backpropagation_through_time
