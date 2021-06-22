[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 9: Generating a lot of nonsense with an RNN)
[#]: via: (https://jvns.ca/blog/2020/11/19/day-9--generating-a-lot-of-nonsense-with-an-rnn/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 9: Generating a lot of nonsense with an RNN
======

Hello! On Monday I posted about [generating faces with sketch-rnn][1], which I did using a pre-trained RNN model.

I want to train that model to genreate more complicated faces (which may or may not work!), but I decided that since I knew literally nothing about neural networks it would be good to start with something simpler: [this char-rnn model from Karpathy that generates text that sounds vaguely Shakespearean][2].

After spending some time playing with Tensorflow, I decided to use PyTorch with the [fast.ai][3] helper libraries because it’s what my friend Ray was using for his project.

Here are some initial things I’ve learned about training neural networks. All of this is pretty disjointed and I still have no idea what I’m doing.

### there are a lot of tensors

All the data seems to be tensors! A 1-d tensor is a vector, a 2-d tensor is a matrix, and a 3-d tensor is, well, who knows. This is a little new but I have some vague intuition about tensor products from learning about quantum computing ten [years][4] ago so this seems okay.

They seem not too bad to manipulate, like `tensor.flatten()` will flatten a multidimensional tensor into a vector. I still feel a bit uncertain about the exact order things get flattened in, I need to experiment &amp; think it through.

The word “dimension” for tensors is also used in a different way than I expected, like I’d usually think that the “dimension” of a 8x9 matrix is 72 (becuase that’s the dimension of the vector space of 8x9 matrices), but in Torch land the “dimension” of a 8x9 matrix seems to be 2. That seems fine though.

### there are a lot of dimension mismatches

I’ve spent a lot of hours over the last couple of days staring at error messages like

```
ValueError: Expected target size (77, 64) got torch.Size (77, 70)
```

Some reasons I’ve gotten errors like this so far

  * I tried to pass a 3-dimensional tensor to a loss function that wanted a 2-dimensional tensor
  * I forgot to embed my input data (which is a bunch of class labels) into a higher dimensional space so that every number turns into a 64-dimensional vector
  * I multiplied a vector by a matrix with the wrong dimensions



Something that I find a bit confusing about the tensors and dimension mismatches is that a lot of the time you seem to be able to pass in both a 2-dimensional tensor and a 3-dimensional tensor to the same method. For example, if I have a 2x3 matrix, I can multiply that by a 3x4 tensor, or by a 3x4x89 tensor, or by a 3x92x12x238 tensor, or whatever. This corresponds to what I remember about tensors from quantum computing, but I find a bit harder to think about in terms of numbers in a matrix on a computer.

I tweeted about this and a bunch of people agreed with me that they have also spent a bunch of time debugging dimension mismatches so at least I’m not alone :)

### the cross entropy loss in pytorch isn’t the cross entropy

A “loss function” is basically a function you use to check how similar 2 vectors are. Lower is better.

Today I got pretty confused because I was trying to compute the cross entropy loss for two identical vectors, and the result wasn’t 0! I thought that the result was going to be 0, because the vectors were identical!

It turns out that in PyTorch the “cross entropy loss” of x and y isn’t actually the [cross entropy][5] of x and y (which would be 0 if x and y are identical!), instead it’s `cross_entropy(softmax(x), y)` – you apply a “softmax” function to x first.

### it goes a LOT faster with a GPU

At some point I was training a model on a CPU, and then I switched to a GPU and every batch trained literally 10x faster.

### colab is pretty useful

I’ve been using Google’s [Colab][6], which seems to be a fork of Jupyter notebook. It comes with some free GPUs that you can use, which is nice.

The main annoying thing I’ve run into about Colab is that they pretty aggressively kill your running notebooks if they’re idle to reduce resource usage. This is actually fine on its own (you can save your data to Google Drive and restore it!).

BUT as far as I can tell, if I want to use the Google Drive to get my files, I need to reauthenticate the notebook to Google Drive every single time by clicking a link and pasting in an OAuth (or something) code. I don’t really understand why it can’t just authenticate me once and then have it work forever.

### it’s bad if your training loss never goes down

I’ve been having the same problem for most of yesterday and today, which is that I have a model and some training data, and when I try to train the model my training loss never improves, which measn that basically the model isn’t training.

And then when I make predictions from the model, I get results like this:

```
eto e  enaih eet codosueonites st tne   esee ob nmnoesnrertieieeu  ooe
```

which makes it seem like it’s learned _something_ – those letters are common letters in the English language, sure! It’s better than generating `zxisqqqqxw`, which is more like the results I’d expect if the network hadn’t learned anything at all. But it definitely hasn’t learned a lot.

### some code that does not work

If you’re interested in what some code for an RNN that DOES NOT WORK looks like, here’s [the code I’ve written so far][7]

the neural network part looks like this:

```
class RNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.i2h = nn.Linear(nv, nh) # Wxh
        self.h2h = nn.Linear(nh, nh) # Whh
        self.h2o = nn.Linear(nh, nv) # Why
        self.hidden = torch.zeros(1, nh).cuda()

    def forward(self, input):
        x = self.i2h(torch.nn.functional.one_hot(input, num_classes=nv).type(torch.FloatTensor).cuda())
        y = self.h2h(self.hidden)
        hidden = torch.tanh(y + x)
        self.hidden = hidden.detach()
        z = self.h2o(hidden)
        return z
```

and it basically sets up a bunch of matrices that are meant to correspond to this code from Karpathy’s blog post:

```
def step(self, x):
  # update the hidden state
  self.h = np.tanh(np.dot(self.W_hh, self.h) + np.dot(self.W_xh, x))
  # compute the output vector
  y = np.dot(self.W_hy, self.h)
  return y
```

but unlike his code, it does not generate text that looks vaguely Shakespeare after I train it, it generates gibberish! Maybe tomorrow I will find out why.

Here’s a snippet of code that samples from the model’s output probability vector using a “temperature” – at a very low temperature it just always picks the letter that the model thinks is most likely (which by the way right now in my case is LITERALLY ALWAYS A SPACE which is also a sign that something is wrong). At higher temperatures it might pick another likely letter.

```
temperature = 1
prediction_vector = F.softmax(learn.model(x)[0]/temperature)
v.textify(torch.multinomial(prediction_vector, 1).flatten(), sep='')
```

### that’s all!

As usual when I learn things I am mostly trying to do it without reading any books or watching any videos – there’s this whole video course from <https://fast.ai> that seems pretty good, but for whatever reason I prefer to just bang my head against a problem I’m trying to solve until I get VERY CONFUSED and then resort to reading things that might help me understand what’s going on then. So that’s the plan, we’ll see how it goes.

It’s been pretty fun so far, I know a bunch of things about loss functions that I didn’t know before at least, and now I kind of know what a softmax is!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/19/day-9--generating-a-lot-of-nonsense-with-an-rnn/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://lots-of-sketchrnn-faces.netlify.app/
[2]: https://karpathy.github.io/2015/05/21/rnn-effectiveness/
[3]: https://www.fast.ai/
[4]: https://github.com/jvns/masters-thesis/
[5]: https://en.wikipedia.org/wiki/Cross_entropy
[6]: https://colab.research.google.com/
[7]: https://gist.github.com/jvns/ce24d85c9d645c32b0d552b69359979f
