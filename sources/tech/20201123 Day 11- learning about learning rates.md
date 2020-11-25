[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 11: learning about learning rates)
[#]: via: (https://jvns.ca/blog/2020/11/23/day-11--learning-about-learning-rates/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 11: learning about learning rates
======

Hello!

On Friday I trained an RNN to count to 3 (1 2 3 1 2 3 1 2 3), thanks to some great advice from another Recurser. I figured that once I got that working, I could then extend that and train the same RNN on a bunch of Shakespearean text to get it to generate vaguely Shakespeare-y text.

But on Friday I couldn’t get that to work! I was puzzled by this, but today I figured out what was happening.

### what’s a learning rate?

First, here’s a very short “deep learning for math majors” explanation of how training for a deep learning model works in general. I wrote this to help consolidate my own understanding on Friday.

  * The model takes the training data and weights and outputs a single number, the output of the loss function
  * The model’s “weights” are the parameters of all the matrices in the model, like if there’s a 64 x 64 matrix then there are 4096 weights
  * For optimization purposes, this function should be thought of as a function of the weights (not the training data), since the weights are going to change and the function isn’t
  * Training is basically gradient descent. You take the derivative of the function (aka gradient), with respect to the weights of all the matrices/various functions in the model
  * The way you take this derivative is using the chain rule, the algorithm for applying the chain rule to a neural network is called “backpropagation”
  * Then you adjust the parameters by a multiple of the gradient (since this is gradient descent). The multiple of the gradient that you use is called the **learning rate** – it’s basically `parameters -= learning_rate * gradient`
  * machine learning model training is a lot like general continuous function optimization in that finding the “right” step size to do gradient descent is basically impossible so there are a lot of heuristics for picking step learning rates that will work. One of these heuristics is called [Adam][1]



### if you set your learning rate too high, the model won’t learn anything

So back to our original problem: when I was training my model to generate Shakespeare, I noticed that my model wasn’t learning anything! By “not learning anything”, I mean that the value of the loss function was not going down over time.

I eventually figured out that this was because my learning rate was too high! It was 0.01 or something, and changing it to more like 0.002 resulted in more learning progress. Hooray!

I started to generate text like this:

```
erlon, w oller. is. d y ivell iver ave esiheres tligh? e ispeafeink
teldenauke'envexes. h exinkes ror h. ser. sat ly. spon, exang oighis yn, y
hire aning is's es itrt. for ineull ul'cl r er. s unt. y ch er e s out twiof
uranter h measaker h exaw; speclare y towessithisil's  aches? s es, tith s aat
```

which is a big improvement over what I had previously, which was:

```
kf ;o 'gen '9k ',nrhna 'v ;3; ;'rph 'g ;o kpr ;3;tavrnad 'ps ;]; ;];oraropr
;9vnotararaelpot ;9vr ;9
```

But then training stalled again, and I felt like I could still do better.

### resetting the state of the optimizer is VERY BAD

It turned out that the reason training had stalled the second time was that my code looked like this:

```
for i in range(something):
    optimizer = torch.optim.Adam(rnn.parameters())
    ... do training things
```

I’d written the code this way because I didn’t realize that the state of the optimizer (“Adam”) was important, so I just reset it sometimes because it seemed convenient at the time.

It turns out that the optimizer’s state is very important, I think because it slowly reduces the training rate as training progresses. So I reorganized my code so that I only initialized the optimizer once at the beginning of training.

I also made sure that when I saved my model, I also saved the optimizer’s state:

```
torch.save({'model_state_dict': rnn.state_dict(), 'optimizer_dict': optimizer.state_dict()}, MODEL_PATH)
```

Here’s the “Shakespeare” the model was generating after I stopped resetting the optimizer all the time:

```
at soerin, I kanth as jow gill fimes, To metes think our wink we in fatching
and, Drose, How the wit? our arpear War, our in wioken alous, To thigh dies wit
stain! navinge a sput pie, thick done a my wiscian. Hark's king, and Evit night
and find. Woman steed and oppet, I diplifire, and evole witk ud
```

It’s a big improvement! There are some actual English words in there! “Woman steed and oppet!”

### that’s it for today!

Tomorrow my goal is to learn what “BPTT” means and see if I can use it to train this model more quickly and maybe give it a bigger hidden state than 87 parameters. And once I’ve done that, maybe I can start to train more interesting models!!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/23/day-11--learning-about-learning-rates/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/Adam
