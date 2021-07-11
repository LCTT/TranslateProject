[#]: subject: (Write good examples by starting with real code)
[#]: via: (https://jvns.ca/blog/2021/07/08/writing-great-examples/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: (zepoch)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Write good examples by starting with real code
======

When I write about programming, I spend a lot of time trying to come up with good examples. I haven’t seen a lot written about how to make examples, so here’s a little bit about my approach to writing examples!

The basic idea here is to start with real code that you wrote and then remove irrelevant details to make it into a self-contained example instead of coming up with examples out of thin air.

I’ll talk about two kinds of examples: realistic examples and suprising examples.

### good examples are realistic

To see why examples should be realistic, let’s first talk about an unrealistic example! Let’s say we’re trying to explain Python lambdas (which is just the first concept I thought of). You could give this example, of using `map` and a lambda to double a set of numbers.

```
numbers = [1, 2, 3, 4]
squares = map(lambda x: x * x, numbers)
```

I think this example is unrealistic for a couple of reasons:

  * squaring a set of numbers isn’t something you’re super likely to do in a real program unless it’s for Project Euler or something (there are LOTS of operations on lists that are a lot more likely)
  * This usage of `map` is not idiomatic Python, even if you were doing this I would write `[x*x for x in numbers]` instead



A more realistic example of Python lambdas is using them with `sort`, like this;

```
children = [{"name": "ashwin", "age": 12}, {"name": "radhika", "age": 3}]
sorted_children = sorted(children, key=lambda x: x['age'])
```

But this example is still pretty contrived (why exactly do we need to sort these children by age?). So how do we actually make realistic examples?

### how to make your examples realistic: look at actual code you wrote

I think the easiest way to make realistic examples is, instead of pulling an example out of thin air (like I did with that `children` example), instead just start by looking at real code!

For example, if I grep a bunch of Python code I wrote for `sort.+key`, I find LOTS of real examples of me sorting a list by some criterion, like:

  * `tasks.sort(key=lambda task: task['completed_time'])`
  * `emails = reversed(sorted(emails, key=lambda x:x['receivedAt']))`
  * `sorted_keysizes = sorted(scores.keys(), key=scores.get)`
  * `shows = sorted(dates[date], key=lambda x: x['time']['performanceTime'])`



It’s pretty easy to see a pattern here – a lot of these are sorting by time! So you can see how you could easily put together a simple realistic example of sorting some objects (emails, events, etc) by time.

### realistic examples help “sell” the concept you’re trying to explain

When I’m trying to explain an idea (like Python lambdas), I’m usually also trying to convince the reader that it’s worth learning! Python lambdas are super useful! And to convince someone that lambdas are useful, it really helps to show someone how lambdas could help them do a task that they could actually imagine themselves doing, and ideally a task that they’ve done before.

### distilling down examples from real code can take a long time

The example I just gave of explaining how to use `sort` with `lambda` is pretty simple and it didn’t take me a long time to come up with, but turning real code into a standalone example can take a really long time!

For example, I was thinking of including an example of some weird CSS behaviour in this post to illustrate how it’s fun to create examples with weird or surprising behaviour. I spent 2 hours taking a real problem I had this week, making sure I understood what was actually happening with the CSS, and making it into a minimal example.

In the end it “just” took [5 lines of HTML and a tiny bit of CSS][1] to demonstrate the problem and it doesn’t really look like it took hours to write. But originally it was hundreds of lines of JS/CSS/JavaScript, and it takes time to untangle all that and come up with something small that gets at the heart of the issue!

But I think it’s worth it to take the time to make examples really clear and minimal – if hundreds of people are reading your example, you’re saving them all so much time!

### that’s all for now!

I think there’s a lot more to say about examples – for instance I think there are a few different types of useful examples, like:

  * examples that are surprising to the reader, which are more about changing someone’s mental model than providing code to use directly
  * examples that are easy to copy and paste to use as a starting point



but maybe I’ll write about that another day :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/07/08/writing-great-examples/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://codepen.io/wizardzines/pen/0eda7725a46c919dcfdd3fa80aff3d41
