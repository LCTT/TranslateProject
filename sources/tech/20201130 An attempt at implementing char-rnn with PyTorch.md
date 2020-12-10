[#]: collector: (lujun9972)
[#]: translator: (zhangxiangping)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An attempt at implementing char-rnn with PyTorch)
[#]: via: (https://jvns.ca/blog/2020/11/30/implement-char-rnn-in-pytorch/)
[#]: author: (Julia Evans https://jvns.ca/)

用PyTorch实现char-rnn
======

你好！在过去的几周里，我花了很多时间用PyTorch实现了一个[char-rnn][1]的版本。我以前从未训练过神经网络，所以这可能是一个有趣的开始。

这个想法(来自[The Unreasonable Effectiveness of Recurrent Neural Networks][1])可以让你在文本上训练一个基于字符的循环神经网络，并得到一些出乎意料的结果。

不过，虽然没有得到我想要的结果，但是我还是想分享一些示例代码和结果，希望对其他开始尝试使用PyTorch和RNNs的人有帮助。

这是Jupyter notebook格式的代码：[char-rnn in PyTorch.ipynb][2]。你可以点击这个网页最上面那个按钮Open in Colab，就可以在Google的Colab服务中打开，并使用免费的GPU进行训练。所有的东西加起来大概有75行代码，我将在这篇博文中尽可能地详细解释。

### step 1: prepare the data
### 第一步：准备数据

首先，我们要下载数据。我使用的是古登堡项目中的这个数据：[Hans Christian Anderson’s fairy tales][3]。

```
!wget -O fairy-tales.txt
```

这个是准备数据的代码。我使用fastai库中的Vocab类进行数据处理，它能将一堆字母转换成“词表”，然后用这个“词表”把字母变成数字。

之后我们就得到了一大串数字（`训练集`），我们可以在这上面训练我们的模型。

```
from fastai.text import *
text = unidecode.unidecode(open('fairy-tales.txt').read())
v = Vocab.create((x for x in text), max_vocab=400, min_freq=1)
training_set = torch.Tensor(v.numericalize([x for x in text])).type(torch.LongTensor).cuda()
num_letters = len(v.itos)
```

### step 2: define a model
### 第二步：定义模型

这个是Pytorch中LSTM类的封装。除了封装LSTM类以外，它还做了三件事：

  1. 对输入向量进行one-hot编码，使得他们具有正确的维度。
  2. 在LSTM层后一层添加一个线性变换，因为LSTM输出的是一个长度为`hidden_size`的向量，我们需要的是一个长度为`input_size`的向量这样才能把它变成一个字符。
  3. 把LSTM隐藏层的输出向量（实际上有2个向量）保存成实例变量，然后在每轮运行结束后执行`.detach()`函数。（我很难解释清`.detach（）`的作用，但我的理解是，它在某种程度上“结束”了模型的求导计算（译者注：detach()函数是将该张量的requires_grad参数设置为False，即反向传播到该张量就结束。））

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

这个代码还做了一些比较神奇但是不太明显的功能。如果你的输入是一个向量（比如[1,2,3,4,5,6]），对应六个字母，那么我的理解是`nn.LSTM`会在内部使用[backpropagation through time][4]更新隐藏向量6次

### step 3: write some training code
### 第三步：编写训练代码

模型不会自己训练自己的！

我最开始的时候尝试用`fastai`库中的一个helper类（也是PyTorch中的封装）。我有点疑惑因为我不知道它在做什么，所以最后我自己编写了模型训练代码。

下面这些代码（epoch()方法）就是有关于一轮训练过程的基本信息。基本上就是重复做下面这几件事情：
  1. 往RNN模型中传入一个字符串，比如`and they ought not to teas`。（要以数字向量的形式传入）
  2. 得到下一个字母的预测结果。
  3. 计算RNN模型预测结果和真实的下一个字母之间的损失函数。（`e`，因为tease是以`e`结尾的）
  4. 计算梯度。（用`loss.backward()`函数）
  5. 沿着梯度下降的方向修改模型中参数的权重。（用`self.optimizer.step()`函数）

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

### let `nn.LSTM` do backpropagation through time, don’t do it myself
### 使用`nn.LSTM`沿着时间反向传播，不要自己写代码。



Originally I wrote my own code to pass in 1 letter at a time to the LSTM and then periodically compute the derivative, kind of like this:

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

This passes in 20 letters (one at a time), and then takes a training step at the end. This is called [backpropagation through time][4] and Karpathy mentions using this method in his blog post.

This kind of worked, but my loss would go down for a while and then kind of spike later in training. I still don’t understand why this happened, but when I switched to instead just passing in 20 characters at a time to the LSTM (as the `seq_len` dimension) and letting it do the backpropagation itself, things got a lot better.

### step 4: train the model!

I reran this training code over the same data maybe 300 times, until I got bored and it started outputting text that looked vaguely like English. This took about an hour or so.

In this case I didn’t really care too much about overfitting, but if you were doing this for a Real Reason it would be good to run it on a validation set.

### step 5: generate some output!

The last thing we need to do is to generate some output from the model! I wrote some helper methods to generate text from the model (`make_preds` and `next_pred`). It’s mostly just trying to get the dimensions of things right, but here’s the main important bit:

```
output = rnn(input)
prediction_vector = F.softmax(output/temperature)
letter = v.textify(torch.multinomial(prediction_vector, 1).flatten(), sep='').replace('_', ' ')
```

Basically what’s going on here is that

  1. the RNN outputs a vector of numbers (`output`), one for each letter/punctuation in our alphabet.
  2. The `output` vector isn’t **yet** a vector of probabilities, so `F.softmax(output/temperature)` turns it into a bunch of probabilities (aka “numbers that add up to 1”). `temperature` kind of controls how much to weight higher probabilities – in the limit if you set temperature=0.0000001, it’ll always pick the letter with the highest probability.
  3. `torch.multinomial(prediction_vector)` takes the vector of probabilities and uses those probabilites to pick an index in the vector (like 12)
  4. `v.textify` turns “12” into a letter



If we want 300 characters worth of text, we just repeat this process 300 times.

### the results!

Here’s some generated output from the model where I set `temperature = 1` in the prediction function. It’s kind of like English, which is pretty impressive given that this model needed to “learn” English from scratch and is totally based on character sequences.

It doesn’t make any _sense_, but what did we expect really.

> “An who was you colotal said that have to have been a little crimantable and beamed home the beetle. “I shall be in the head of the green for the sound of the wood. The pastor. “I child hand through the emperor’s sorthes, where the mother was a great deal down the conscious, which are all the gleam of the wood they saw the last great of the emperor’s forments, the house of a large gone there was nothing of the wonded the sound of which she saw in the converse of the beetle. “I shall know happy to him. This stories herself and the sound of the young mons feathery in the green safe.”
>
> “That was the pastor. The some and hand on the water sound of the beauty be and home to have been consider and tree and the face. The some to the froghesses and stringing to the sea, and the yellow was too intention, he was not a warm to the pastor. The pastor which are the faten to go and the world from the bell, why really the laborer’s back of most handsome that she was a caperven and the confectioned and thoughts were seated to have great made

Here’s some more generated output at `temperature=0.1`, which weights its character choices closer to “just pick the highest probability character every time”. This makes the output a lot more repetitive:

> ole the sound of the beauty of the beetle. “She was a great emperor of the sea, and the sun was so warm to the confectioned the beetle. “I shall be so many for the beetle. “I shall be so many for the beetle. “I shall be so standen for the world, and the sun was so warm to the sea, and the sun was so warm to the sea, and the sound of the world from the bell, where the beetle was the sea, and the sound of the world from the bell, where the beetle was the sea, and the sound of the wood flowers and the sound of the wood, and the sound of the world from the bell, where the world from the wood, and the sound of the

It’s weirdly obsessed with beetles and confectioners, and the sun, and the sea. Seems fine!

### that’s all!

my results are nowhere near as good as Karpathy’s so far, maybe due to one of the following:

  1. not enough training data
  2. I got bored with training after an hour and didn’t have the patience to babysit the Colab notebook for longer
  3. he used a 2-layer LSTM with more hidden parameters than me, I have 1 layer
  4. something else entirely



但我得到了一些大致说得过去的结果！还不错！


--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/30/implement-char-rnn-in-pytorch/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[zhangxiangping](https://github.com/zxp93)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://karpathy.github.io/2015/05/21/rnn-effectiveness/
[2]: https://gist.github.com/jvns/b6dda36b2fdcc02b833ed5b0c7a09112
[3]: https://www.gutenberg.org/cache/epub/27200/pg27200.txt
[4]: https://en.wikipedia.org/wiki/Backpropagation_through_time
