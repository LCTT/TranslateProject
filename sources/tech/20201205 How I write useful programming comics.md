[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I write useful programming comics)
[#]: via: (https://jvns.ca/blog/2020/12/05/how-i-write-useful-programming-comics/)
[#]: author: (Julia Evans https://jvns.ca/)

How I write useful programming comics
======

### How I write useful programming comics

The other day a friend was asking me how I write [programming comics][1]. I’ve tried to write about this at least 6 times ([1][2], [2][3], [3][4], [4][5], [5][6], [6][7]), but I felt like there’s still something missing so here’s another attempt.

#### drawing isn’t the hard part

The 2 common questions/comments I get about my comics are:

  1. “what tools do you use?” (an ipad + apple pencil + a drawing app).
  2. I wish I were good at drawing so that I could do that



But neither of these is what I actually find hard about comics: I’m actually [very bad at drawing][5], and I’ve made comics that people love with very simple tools, like taking a [low-quality picture of a notebook with my phone][8].

So what’s the secret?

#### 3 types of comics I draw

I think a lot of my comics fall into 3 categories. I don’t think that this categorization is totally accurate, but I think it’s a helpful way to start talking about how to do it.

**Type 1: the Surprising/Hidden Fact**

Here are 10 examples of surprising ideas I’ve written about:

  * [SELECT queries aren’t executed in the order they’re written in][9]
  * [position: absolute isn’t absolute][10]
  * [cookies let a server store information in your browser][11]
  * [the /proc directory on linux lets you access information about processes][12]
  * [linux uses copy on write for a new process’s memory][13]
  * [ngrep is like ‘grep’ for network packets][14]
  * [a git branch is a pointer to a commit][15]
  * [if you ask about specific things you want feedback on, you’re more likely to get the feedback you need][16]
  * [container layers are implemented using overlay filesystems][17]



Of course, a lot of these aren’t that surprising when you already know about them – “cookies let a server store information in your browser” is a basic fact about how cookies work! But if you don’t already know it, it’s pretty surprising and kind of exciting to learn.

I think there are at least two subtypes of surprising facts here:

  * Facts that tell you about something you can _do_ (like “use ngrep to grep your network packets”)
  * Facts that explain why something works the way it does (“oh, I’m always confused about SQL queries because they’re not executed in the order they’re written in! That explains a lot!”)



**Type 2: the List of Important Things about X**

This sounds pretty boring at first (“uh, a list?”), but most of the comics I’ve drawn where people tell me “This is amazing, I printed this out and put it on my wall” are lists. Here are some examples of list comics:

  * [every linux networking tool I know][18]
  * [what to talk about in 1:1s with your manager][19]
  * [the most important HTTP request headers][20]
  * [HTTP status codes][21]
  * [ways I want my team to be][22]
  * [grep’s command line arguments][23]
  * [find’s command line arguments][24]
  * [dig’s command line arguments][25]
  * about 30 other “X’s most important command line arguments and what they do” (basically all of [bite size command line][26] and [bite size networking][26])



A key things about this is that it’s not just “a list of facts about X” (anyone can make a list!) but a list of **the most important facts** about X. For example, grep has a lot of command line arguments. But it turns out that I only ever use 9 of them even though I use a grep a LOT, and that each of those 9 options can be explained in just a few words.

All of the topics are super specific, like “HTTP request headers”, “HTTP response headers”, and “topics for 1:1s”.

**Type 3: the Relatable Story**

The last type (and the type I’m the least certain how to categorize) is sort of a story that resonates with people. I think that this one is really important but I can’t do it justice right now so I’m going to stick to talking about the other two types in this post.

  * [take on hard projects][27]
  * [how I got better at debugging][28]
  * [how to be a wizard programmer][29]
  * [data analysis is always more work than I think][30]



#### source 1 of Surprising Facts: things I learned somewhat recently

Okay, so how do you find surprising facts to share? The way I started out was to just share things I learned that I was surprised by!

I started doing this on my blog, not in comics: I’d learn something that I was surprised by, and think “oh, this is cool, I should write a blog post about it so other people can learn it too!“. And then I’d write it up and often people would be really happy to learn the thing too!

Obviously I don’t think everyone needs to have a tech blog, but I _do_ think that noticing surprising computer facts as you learn them and explaining them clearly is a skill that you need to practice if you want to get good at it!

#### source 2 of Surprising Facts: things other people find surprising

Recently I’ve moved a little more into what I feel is the Hard Mode of surprising facts – things that I have not been personally surprised by recently, but that a lot of people who don’t know about the topic yet would be really surprised by.

I think the main way to discover Surprising Facts like this is by talking to people who do not know the thing already and observing what they find surprising. For example I might have an interaction like this:

  1. me (showing someone to a coworker) so you can do TASK like this…
  2. coworker: um wait you can do that?? That’s so cool! I have a lot of questions!
  3. me: oh yeah it’s so useful!



For me, HTTP cookies were an example this – I’d forgotten that it could be surprising / interesting to learn how they worked because I learned about them a while ago, and then one day a friend asked me “hey, how do cookies work?”. And I remembered that it’s really cool and useful to know, so I wrote it down!

Another example of this is [SELECT queries start with FROM][9] – this was something that I understood intuitively and hadn’t thought about. But when walking through a SQL query’s execution with someone, I noticed that they were really surprised that you didn’t execute the query in the same order that it was written. And I realized “oh yeah, that IS weird actually, I bet a lot of other people are confused by that too!“. So I wrote it down and it helped a lot of people!

I think the skill of “figuring out what people typically find surprising when learning a topic and coming up with clear explanations” is probably called “teaching”.

#### Lists of Important Things are a little bit easier to write

I find writing lists a little easier than writing Surprising Facts – it’s hard to come up with a useful topic for a list, but once I have the topic (like “every linux networking tool I know”), it feels somewhat straightforward to list them all and briefly explain the basics of each one.

#### I only write comics about things I know relatively well

People also ask me pretty often if I write comics about topics I’m learning as I learn them. I don’t do this basically because I find writing short things a LOT harder than writing long things.

I do write blog posts about topics I’m just learning – if there’s a topic I’m still not super clear on, I can usually write a 1200-word blog post about it with some basic facts and questions and examples. But if I’m still a little bit confused about the topic, it’s very hard to definitively list “Here are the 3 most important surprising facts you need to know to understand TOPIC”, because very likely I actually don’t know those 3 facts yet! Or maybe I kind of know them, they’re mixed in with a lot of other things that I’m not sure about and aren’t as important.

#### that’s all for now!

Hopefully this is helpful! Someone pointed out that this advice might also apply to blog posts, which, maybe it does!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/12/05/how-i-write-useful-programming-comics/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com
[2]: https://jvns.ca/blog/2019/09/01/ways-to-write-zines-without-fancy-tools/
[3]: https://jvns.ca/blog/2018/12/09/how-do-you-document-a-tech-project-with-comics/
[4]: https://jvns.ca/blog/2018/10/28/when-does-teaching-with-comics-work-well/
[5]: https://jvns.ca/teach-tech-with-cartoons/
[6]: https://jvns.ca/blog/2016/11/14/why-cute-drawings/
[7]: https://jvns.ca/blog/2016/08/29/how-i-made-a-zine/
[8]: https://twitter.com/b0rk/status/638365065926811648
[9]: https://wizardzines.com/comics/sql-query-order/
[10]: https://wizardzines.com/comics/position-absolute/
[11]: https://twitter.com/b0rk/status/1158848054142873603
[12]: https://twitter.com/b0rk/status/981159808832286720
[13]: https://twitter.com/b0rk/status/987727508241092608
[14]: https://twitter.com/b0rk/status/1102027359874703360
[15]: https://twitter.com/b0rk/status/1044403728336310273
[16]: https://wizardzines.com/comics/ask-for-specific-feedback/
[17]: https://wizardzines.com/comics/overlay-filesystems/
[18]: https://wizardzines.com/networking-tools-poster.pdf
[19]: https://wizardzines.com/comics/1-1s/
[20]: https://wizardzines.com/comics/request-headers/
[21]: https://wizardzines.com/comics/status-codes/
[22]: https://drawings.jvns.ca/team/
[23]: https://wizardzines.com/comics/grep/
[24]: https://wizardzines.com/comics/find/
[25]: https://wizardzines.com/comics/dig/
[26]: https://wizardzines.com/zines/bite-size-command-line
[27]: https://wizardzines.com/comics/take-on-hard-projects/
[28]: https://wizardzines.com/comics/better-at-debugging/
[29]: https://wizardzines.com/comics/wizard-programmer/
[30]: https://twitter.com/b0rk/status/617003669561679872
