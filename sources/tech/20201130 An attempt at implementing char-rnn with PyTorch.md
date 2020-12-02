[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An attempt at implementing char-rnn with PyTorch)
[#]: via: (https://jvns.ca/blog/2020/11/30/implement-char-rnn-in-pytorch/)
[#]: author: (Julia Evans https://jvns.ca/)

An attempt at implementing char-rnn with PyTorch
======

Hello! I spent a bunch of time in the last couple of weeks implementing a version of [char-rnn][1] with PyTorch. I’d never trained a neural network before so this seemed like a fun way to start.

The idea here (from [The Unreasonable Effectiveness of Recurrent Neural Networks][1]) is that you can train a character-based recurrent neural network on some text and get surprisingly good results.

I didn’t quite get the results I was hoping for, but I wanted to share some example code &amp; results in case it’s useful to anyone else getting started with PyTorch and RNNs.

Here’s the Jupyter notebook with the code: [char-rnn in PyTorch.ipynb][2]. If you click “Open in Colab” at the top, you can open it in Google’s Colab service where at least right now you can get a free GPU to do training on. The whole thing is maybe 75 lines of code, which I’ll attempt to somewhat explain in this blog post.

### step 1: prepare the data

First up: we download the data! I used [Hans Christian Anderson’s fairy tales][3] from Project Gutenberg.

```
!wget -O fairy-tales.txt
```

Here’s the code to prepare the data. I’m using the `Vocab` class from fastai, which can turn a bunch of letters into a “vocabulary” and then use that vocabulary to turn letters into numbers.

Then we’re left with a big array of numbers (`training_set`) that we can use to train a model.

```
from fastai.text import *
text = unidecode.unidecode(open('fairy-tales.txt').read())
v = Vocab.create((x for x in text), max_vocab=400, min_freq=1)
training_set = torch.Tensor(v.numericalize([x for x in text])).type(torch.LongTensor).cuda()
num_letters = len(v.itos)
```

### step 2: define a model

This is a wrapper around PyTorch’s LSTM class. It does 3 main things in addition to just wrapping the LSTM class:

  1. one hot encode the input vectors, so that they’re the right dimension
  2. add another linear transformation after the LSTM, because the LSTM outputs a vector with size `hidden_size`, and we need a vector that has size `input_size` so that we can turn it into a character
  3. Save the LSTM hidden vector (which is actually 2 vectors) as an instance variable and run `.detach()` on it after every round. (I struggle to articulate what `.detach()` does, but my understanding is that it kind of “ends” the calculation of the derivative of the model)



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

This code also does something kind of magical that isn’t obvious at all – if you pass it in a vector of inputs (like [1,2,3,4,5,6]), corresponding to 6 letters, my understanding is that `nn.LSTM` will internally update the hidden vector 6 times using [backpropagation through time][4].

### step 3: write some training code

This model won’t just train itself!

I started out trying to use a training helper class from the `fastai` library (which is a wrapper around PyTorch). I found that kind of confusing because I didn’t understand what it was doing, so I ended up writing my own training code.

Here’s some code to show basically what 1 round of training looks like (the `epoch()` method). Basically what this is doing is repeatedly:

  1. Give the RNN a string like `and they ought not to teas` (as a vector of numbers, of course)
  2. Get the prediction for the next letter
  3. Compute the loss between what the RNN predicted, and the real next letter (`e`, because tease ends in `e`)
  4. Calculate the gradient (`loss.backward()`)
  5. Change the weights in the model in the direction of the gradient (`self.optimizer.step()`)



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



But I got some vaguely coherent results! Hooray!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/30/implement-char-rnn-in-pytorch/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://karpathy.github.io/2015/05/21/rnn-effectiveness/
[2]: https://gist.github.com/jvns/b6dda36b2fdcc02b833ed5b0c7a09112
[3]: https://www.gutenberg.org/cache/epub/27200/pg27200.txt
[4]: https://en.wikipedia.org/wiki/Backpropagation_through_time
