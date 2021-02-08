[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 8: Start with something that works)
[#]: via: (https://jvns.ca/blog/2020/11/18/how-to-do-hard-projects--start-with-something-that-works/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 8: Start with something that works
======

Today at RC I’m a little stuck so here’s a very short reflection on how to do hard programming problems :)

I was talking to a friend yesterday about how to do programming projects that are a bit out of your comfort zone, and I realized that there’s a pattern to how I approach new-to-me topics! Here I’m especially thinking about little side projects where you want to get the thing done pretty efficiently.

When I start on a new project using some technology I haven’t worked with before, I often:

  1. Find some code on the internet that already does something a little like what I want
  2. Incrementally modify that code until it does what I want, often completely changing everything about the original code in the process



Here are a couple of quick thoughts about this process:

### it’s important that the initial code _works_

Often when I’m out looking for examples, I’ll find a lot of code that I can’t get to work quickly, often because the code is kind of old and things have changed since then. Whenever possible, I try to find code that I can get to work on my computer pretty quickly.

It’s been pretty helpful to me to give up relatively quickly on code that I can’t get to work right away and look for another example – often there is something out there that’s more recent and that I can get to work more quickly!

### you have to be able to incrementally change the code into what you want

Today I’ve been working with some neural network code, and one thing I’m really struggling with for the last couple of days is that I find it pretty easy to find somewhat relevant Jupyter notebooks that do RNN things, and pretty hard to modify those examples to do something closer to what I want. They keep breaking and I then don’t know how to fix them.

Last week I was working on a Rails app, which I think is something that’s very easy to incrementally change into the program you want: `rails new` gives you a webserver that does almost nothing, but it works! And then you just need to change it one tiny step at a time into the website you want to build.

### examples of “something that works”

  * If you want to write a window manager, [tinywm][1] is a window manager in 50 lines of C!
  * this tiny kernel written in Rust that does nothing was a fun starting point for an operating system <https://github.com/charliesome/rustboot> (probably it’s not a good starting point today)
  * `rails new`, like I talked about above
  * I love that <https://glitch.com/> projects let you “view source” on the backend of any Glitch project
  * Jupyter notebooks, like [these great NLP tutorials by Allison Parrish][2]



### that’s all!

I think little starting points like this are so important and can be really magical. Finding the right starting point can be hard, but when I find a good one it makes everything so much easier!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/18/how-to-do-hard-projects--start-with-something-that-works/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: http://incise.org/tinywm.html
[2]: https://twitter.com/aparrish/status/876117075567284225
