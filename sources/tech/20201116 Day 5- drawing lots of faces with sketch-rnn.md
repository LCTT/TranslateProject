[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 5: drawing lots of faces with sketch-rnn)
[#]: via: (https://jvns.ca/blog/2020/11/16/day-5--lots-of-faces-with-sketch-rnn/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 5: drawing lots of faces with sketch-rnn
======

Hello! This week it’s generative art week at RC, and I thought it would be fun to generate drawings of faces.

Someone suggested the [Google Quickdraw][1] dataset, which has a lot of pictures of faces. And even though I think most of the faces in there are not really that interesting, I really quite like some of them, like these two:

![][2] ![][3]

So that seems like somewhere to start!

### step 1: get the sketch-rnn model

sketch-rnn is an RNN trained on the quickdraw dataset that generates line drawings. You can see it in action in Monica Dinculescu’s very fun [magic sketchpad][4] demo here – you start making a drawing, and it’ll complete you drawing as a cat / bridge / whatever you want.

I figured that would be a fun place to start, and [ml5js][5] has a [tutorial showing how to write Javascript code to draw things with sketch-rnn][6], which I followed.

### step 2: make the tutorial code use async/await

The ml5js example had a bunch of global variables and callbacks and I found it difficult to work with, so I spent a while refactoring it to use async/await so that I could play around with it more easily. This took a while but I got it to work.

### step 3: make sketch-rnn draw lots of faces and put them into a gallery

I started out with making a more interactive website, but decided to instead do something really simple to start: just get the model to draw a lot of faces and see how I felt about them.

Here’s the resulting (very janky, not responsive) website I made, which draws faces and then puts them into a little “gallery” on the right: [lots of sketch-rnn faces][7]. You can see it “live” drawing the faces which is fun.

The set of images that comes out looks something like this:

![][8]

I don’t really like _any_ of these faces, but it’s a start! It’s also very slow on my 2015 laptop, but faster on the iPad. I didn’t spend a lot of time profiling it, but it seems to spend a lot of time in some function with `lstm` in its name – I don’t know what an LSTM is exactly but I know it’s a component of an RNN, so I guess (as you’d expect) it just has a lot of math to do in Javascript to calculate the next line to draw and that’s slow.

### next step: maybe find out if sketch-rnn can tell the difference between “interesting” and “boring” faces

I think that this face:

![][2]

is a lot more interesting than this face:

![][9]

Can I convince the neural network to distinguish between faces that I think are ‘interesting’ and ‘boring’ and maybe only generate more “interesting” faces? We’ll see! Right now I am stuck on trying to get a pre-trained model loaded into Python, so there’s a long way to go.

I did find someone who’d done something kind of similar, on [bad flamingos vs good flamingos][10] in the quickdraw dataset.

I still don’t really know anything about RNNs, but maybe if I can answer this question I will learn something about them.

### also there’s a refrigerator poetry forum

Here’s that refrigerator poetry forum I was talking about last week: <https://refrigerator-poetry-forum.herokuapp.com/>. You can write magnet poetry-style poems on a refrigerator. People wrote some charming poems and I’m happy with it. I think I might use Rails for another project in the future.

Hopefully people won’t abuse it, if there’s abuse I’ll just take it off the internet probably.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/16/day-5--lots-of-faces-with-sketch-rnn/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://quickdraw.withgoogle.com/data/face
[2]: https://jvns.ca/images/face1.jpg
[3]: https://jvns.ca/images/face2.jpg
[4]: https://magic-sketchpad.glitch.me/
[5]: https://learn.ml5js.org
[6]: https://github.com/ml5js/ml5-library/tree/main/examples/javascript/SketchRNN/SketchRNN_interactive
[7]: https://lots-of-sketchrnn-faces.netlify.app/
[8]: https://jvns.ca/images/faces.png
[9]: https://jvns.ca/images/boring-face.png
[10]: https://colinmorris.github.io/blog/bad_flamingos
