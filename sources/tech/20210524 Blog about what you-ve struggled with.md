[#]: subject: (Blog about what you've struggled with)
[#]: via: (https://jvns.ca/blog/2021/05/24/blog-about-what-you-ve-struggled-with/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Blog about what you've struggled with
======

I was talking to [Jemma][1] recently about what stops people from blogging. One barrier that stood out to me was: it’s hard to identify which things you know will be useful to other people!

The process I use for a lot of my blog posts is:

  1. Struggle with something (usually computer-related)
  2. Eventually (days or months or years later), figure out how to solve some of the problems I had
  3. Write a blog post about what helped me



I think this approach is effective because if I struggled with something, there’s a pretty good chance that other people are struggling with it too, and what I learned is likely to be useful to at least some of them!

Obviously this isn’t the only approach to blogging, but it’s my approach, so that’s what I’m going to write about here :). I’ll give a few examples of specific blog posts that came out of something I struggled with.

### it’s not about the struggle, it’s about what you learned

The first important thing here is that the blog posts aren’t about the struggle, exactly. I’m still not that great at writing Rust, but I wouldn’t write a blog post called “I find Rust hard” – that wouldn’t help anyone!

Instead, when I learn something that helps me, I write about it so that it can help other people too. For example, one specific thing I struggled with in Rust was understanding references, and so I wrote [what’s a reference in Rust?][2] about what I learned.

### what you struggled with shows you what to focus on

Okay, Julia, you might be thinking – if it’s about what you learned, why isn’t this blog post called “Blog about what you learned” then? Well, we’ve all learned lots of things! For example at some point in the last 8 years I learned Go. But what’s worth talking about with Go? Should I explain the syntax? Talk about `net/http`? Explain Go modules?

If I instead think about what I’ve struggled with Go, it suddenly gets MUCH clearer – one thing I’ve had trouble with is deadlocks! That’s way more specific, and a lot more likely to be useful to other people than an intro to Go modules – it’s not obvious how to use Go’s concurrency features well!

### it can take years to figure out what you learned

When I started my first job at a “big” company 7 years ago (“big” being more than 5 people), I really didn’t understand how to work with my manager effectively and it sometimes caused misunderstandings. It wasn’t great!

But when I was first having problems with this, I didn’t have anything that useful to say about this other than “oh no, um, this is hard”. This was because I hadn’t solved my problems for myself yet, so I definitely could not tell anyone else what I learned! It took me a few years to figure out how to work with a manager well.

And I’m still figuring out new ways to explain what I learned – for example just a few months ago I realized (while talking to my old manager) that there are a lot of concrete facts that managers don’t know, and if you think your manager **does** know those facts, you’ll end up with a lot of miscommunications and problems.

So I wrote [Things your manager might not know][3] as another attempt at helping people who are learning to work with their manager effectively. I wrote that post a year and a half after I left my job, so I didn’t even have a manager at the time!

### write it down while you still remember what was hard

It’s very easy to misidentify what you learned if you don’t remember what it was like to struggle with the topic.

When I first started using git at work, it was confusing and I made a lot of mistakes. But that was in 2011 and I can’t remember what was hard about it anymore! So I could say that the most important thing to learn to solve your git issues is git’s object model (like how branches / commits work), but I don’t exactly know if that’s true! I know that I used to struggle with git, and now I don’t, and now I have a pretty good model of how git’s object works, but I don’t really remember exactly what got me from there to here.

### advanced mode: write about other people’s struggles

But if you don’t remember what was hard about something, not all is lost! It’s definitely possible to write about a topic that somebody else is struggling with. I find that the easiest way to do this is to first teach the topic, so here’s a quick story about that.

In 2019, I wrote a zine about SQL. When I started, I thought it would be easy because I was pretty comfortable with SQL – I’d done a LOT of data analysis in SQL and so I thought I could explain it.

But I couldn’t have been more wrong. It turned out that when I started I had no idea what was actually challenging about learning SQL.

I spent a lot of time talking to a friend who was new to SQL about how it worked, and we realized that one of the blockers was that it wasn’t obvious to them in what order a given SQL query was running. So I wrote [SQL queries don’t start with SELECT][4], and a bunch of related examples and that helped a lot of people understand SQL queries better!

The cool thing about this is that when I dig into something that I think is easy but someone else is struggling with, often I learn something new too. For example I did sort of know in what order SQL queries ran but I’d never really thought about it explicitly. And being more explicit about how it worked helped me understand window functions better, which was something I was a bit shaky on!

### sometimes you just haven’t learned enough about a topic yet (and that’s ok)

There are still a lot of programming and career things that I’ve struggled with in the past where I still don’t have a concrete lesson that I can write about. For example, I’ve struggled a lot with Kubernetes and Envoy and I’ve written about that a bit on this blog, but I’m still not sure what I learned from some of the problems I had. And I don’t work with either of them anymore so it’s possible I’ll never really be able to say! This kind of feels bad, but it’s okay.

Every so often I’ll think about a topic I’ve struggled with in the past and reflect on whether I’ve learned anything I can write about. Usually the answer is no, but sometimes the answer is yes!

### it’s a bit weird to be vulnerable on the internet

Talking about things I struggled with on the internet is kind of scary sometimes! Here are a few things I do to make it less scary:

  * Mostly talk about technical problems! Talking about computer problems I had ([“I didn’t understand how groups worked on Linux”][5]) feels very neutral to me. We’re not born learning how groups work on Linux and everyone has to learn it at some point.
  * Be a little vague when talking about people problems! For example, [get your work recognized: write a brag document][6] comes out of some stress I had around getting promoted. I’m not very specific about my problems because everyone’s experience with getting promoted is super different and I think focusing too much on my specific issues would distract from the lesson (“track your accomplishments!”).
  * Spend a lot of time processing things! In general the more I struggled with something, the more time I need to spend processing it before I can figure out how to talk about what I learned from it in public.
  * Don’t talk about everything! There are obviously lots of things I never talk about on my blog at all :)



I wrote another blog post about [blogging principles I use][7] a few years ago that talks about some more tactics I use here.

### you can practice identifying what you learned

Going from “I have a problem!” to “I don’t have that problem anymore!” to “here are the specific things I learned!” is not actually that easy! But it is something you can practice. It’s easy to skip that last step – you can learn things on an intuitive level but never actually identify what exactly it was that you learned.

For example, I’m definitely better at testing than I used to be but I haven’t taken the time to identify exactly what I’ve learned about testing over the years! I think I’d write better tests if I explicitly wrote down what I’ve learned about testing so that I could more consistently do those things in the future.

### talk to a friend or coworker to figure out what you’ve learned

It can be really hard to notice things you’ve learned on your own. Like we just talked about, I don’t really konw what I’ve learned about testing!

I find that having conversations with friends or coworkers makes it MUCH easier to figure out what I want to write about a topic. A few reasons talking to others is great:

  * It can help clarify your thoughts!
  * They probably have different ideas from you!
  * They can tell you if what you’re saying resonates with them or not!



### why I like writing about what I learned in public

I think that whether or not you write about what you learned in public, it’s super valuable to keep track of what you learned from doing hard things. It helps you remember what you’ve learned so that you can do better work in the future!

Here are a few things I like about writing about what I’ve learned in public, though:

  * It helps other people! It feels way better to have struggled with a super confusing situation and come out of it with something concrete that can help others navigate a similar situation
  * Putting the writing on the internet really forces me to think about whether the lessons I think I learned actually make sense (“wait, is this REALLY true?“)
  * When I’m writing I often come up with additional questions and do a little bit of extra research, so I learn even more!
  * Seeing other people’s reactions often helps me learn something new
  * If I want to remember what I learned about something in the past, I can just look it up on my blog!



Thanks to Jemma, Kamal, Shae, Matthieu, and Travis for feedback on a draft of this.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/05/24/blog-about-what-you-ve-struggled-with/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jemma.dev/
[2]: https://jvns.ca/blog/2017/11/27/rust-ref/
[3]: https://jvns.ca/blog/things-your-manager-might-not-know/
[4]: https://jvns.ca/blog/2019/10/03/sql-queries-don-t-start-with-select/
[5]: https://jvns.ca/blog/2017/11/20/groups/
[6]: https://jvns.ca/blog/brag-documents/
[7]: https://jvns.ca/blog/2017/03/20/blogging-principles/
