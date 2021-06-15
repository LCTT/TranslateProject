[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 10: Training an RNN to count to three)
[#]: via: (https://jvns.ca/blog/2020/11/20/day-10--training-an-rnn-to-count-to-three/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 10: Training an RNN to count to three
======

Yesterday I was trying to train an RNN to generate English that sounds kind of like Shakespeare. That was not working, so today I instead tried to do something MUCH simpler: train an RNN to generate sequences like

```
0 1 2 0 1 2 0 1 2 0 1 2
```

and slightly more complicated sequences like

```
0 1 2 1 0 1 2 1 0 1 2 1 0 1 2 1 0
```

I used (I think) the exact same RNN that I couldn’t get to work yesterday to generate English by training it on Shakespeare, so it was cool to see that I could at least use it for this much simpler task (memorize short sequences of numbers).

### the jupyter notebook

It’s late so I won’t explain all the code in this blog post, but here’s the PyTorch code I wrote to train the RNN to count to three.

  * Here it is as a [github gist][1]
  * and [here it is on Colab][2] if you want to run it yourself



In the gist there are a few experiments with different sequence lengths, like (unsurprisingly) it takes longer to train it to memorize a sequence of length 20 than a sequence of length 5.

### simplifying is nice

I’m super happy that I got an RNN to do something that I actually understand! I feel pretty hopeful that on Monday I’ll be able to go back to the character RNN problem of trying to get the RNN to generate English words now that I have this simpler thing working.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/20/day-10--training-an-rnn-to-count-to-three/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://gist.github.com/jvns/b8804fb9d0672ce147a28d22648b4bd7
[2]: https://colab.research.google.com/gist/jvns/b8804fb9d0672ce147a28d22648b4bd7/rnn-123.ipynb
