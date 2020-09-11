[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What makes a programming exercise good?)
[#]: via: (https://jvns.ca/blog/2019/11/20/what-makes-a-programming-exercise-good/)
[#]: author: (Julia Evans https://jvns.ca/)

What makes a programming exercise good?
======

I’ve been thinking about programming exercises lately, because I want to move into teaching people skills. But what makes a good programming exercise? I [asked about this on Twitter today][1] and got some useful responses so here are some criteria:

### it’s fun

This one is sort of self-explanatory and I think it’s really important. Programming is fun and learning is fun so I can’t see why programming exercises would need to be boring.

### it teaches you something you care about

I don’t think this has to strictly mean “relevant to your job right this second” – people don’t just have jobs, we also want to make art and games and fun personal projects and sometimes just understand the world around us. But it’s important to know what goals the exercise can help you with and what it’s related to!

Some arbitrary examples:

  * take an image of something from a website and reproduce it from scratch with CSS (towards using CSS to make your own websites that look awesome)
  * write a webserver from scratch without any frameworks (to learn the HTTP protocol, so that you can debug issues with a real webserver more easily)
  * write a small raytracer (so you can make cool art with raytracing techniques on shaderhub!)
  * write a tiny bit of assembly (as a very initial step towards understanding of what Spectre and Meltdown are even about and why we need to make all our computers run slower to prevent them)



### it’s a challenge

I don’t know if this is everyone’s experience but I often start programming exercises and get bored quickly (“oh, I know how to do this, this is boring”). For me it’s really important for the exercise to teach me something I really don’t know how to do and that’s a little bit hard for me.

My favourite set of programming exercises is the [cryptopals crypto challenges][2] because they get harder pretty fast – by exercise #6, you’re already breaking toy encryption protocols, and by #12 you’re breaking an Actual Encryption Protocol (AES in ECB mode)!

### you can tell if you succeeded

It’s easy to write exercises that are too vaguely specified (“write a toy tcp stack!“). But what does that mean? How much of a TCP stack am I supposed to write? Having test cases and clear criteria for “yay! you did it! congratulations!” is really important.

### you can do it quickly

In less than 2-3 hours (an evening after work), say. It’s hard to find time to spend like 8 hours on an exercise unless it’s REALLY exciting.

I also think that giving some specific real-world benchmark data seems nice (“I did this from scratch in 97 minutes”).

### the author believes in you

This is a bit fuzzier but very lovely – [this person on Twitter wrote][3]:

> Similar to that, the writing is patient and gives me the impression that it believes in my ability to accomplish the task. … I learned a ton in the early days from Linux HOWTOs. Some gave me the sense that it was impossible to fail. Just follow the steps. It’s all there.

Especially if you’re doing a somewhat challenging exercise like we talked about above, I think it’s nice for the author to believe in your! (and of course it’s crucial that they’ve actually written the exercises so that they’re _right_ and you can likely do the thing!)

### it’s been tested

I read the (great) biography [Dearie: The Remarkable Life of Julia Child][4] recently and one thing that stood out to me is that she _tested_ all of the recipes in Mastering the Art Of French Cooking. It took her _years_ to write the book and test the recipes and make sure that American home cooks actually had access to all the ingredients and had the.

I don’t think all cookbook authors test their recipes, but I think testing really improves cookbooks.

I started writing some SQL exercises (like [this prototype of one on GROUP BY][5]) a while back, and at some point I realized the big thing holding me back was that I didn’t have testers! I couldn’t find out if people were actually learning from them or not!

This is a new thing for me because when I write blog posts I don’t test them (I barely even proofread them!). I just write them and publish and people often like them and that’s it! I said to [Amy Hoy][6] (who is amazing) on Twitter that I didn’t understand why you have to test exercises if you don’t have to test blog posts and she [pointed out][7] that people have much higher expectations for exercises than for blog posts – with the blog posts you maybe expect to learn 1-2 new facts, but with exercises you expect to actually develop a new skill!

Also, people are often investing a lot more time in exercises (especially if they have to set up a dev environment or something!), so it’s extra important to make sure that they actually work.

### you won’t get stuck

It’s SO EASY to get stuck on some random irrelevant point in a programming exercise that’s totally unrelated to the skill you’re trying to learn. For example there might be an easily-avoidable mistake that you can make with the exercise and spend a lot of time debugging but it doesn’t actually teach you a lot.

### it’s easy to get help

If you’re doing a challenging exercise, you might want to get help from your friends / colleagues / the internet!

Some things that can go wrong:

  * None of your friends have ever heard of the thing the exercise is teaching so you can’t talk about it with them
  * The exercise expects you to be using the newest version of some software, but actually all the examples on the internet are for some older version so it’s difficult to search for help even though the exercise is technically correct
  * The community around the tech used in the exercise is hostile/unhelpful



One obvious way to accomplish this is by letting people use the programming language they’re most comfortable in, because they probably already know how to Google for help in that environment.

### no time-consuming setup required

Installing software is boring, and a lot of programming projects require installing software! A few things that can go wrong with this (though there are a lot more than this!)

  * I get a compiler error when I try to install this package on my computer
  * The example actually requires some very specific package versions to work properly and if you don’t have those exact versions installed you get a bunch of cryptic errors and need to google for 3 hours to fix them



This kind of thing is a huge waste of time and super demoralizing. And it’s not trivial to avoid! If you’re trying to teach someone a specific piece of software, often that software

A few options I’ve seen or used to manage this:

  * tell people what you know works (“I’ve tested this in Mac/Linux but not Windows”)
  * avoid requiring any software to be installed (“just use python”)
  * use Docker to run everything
  * run all the code in the person’s browser (because browsers usually do about the same thing)
  * use a cloud system (so everything runs on someone else’s computer). This is what I do for my [pandas cookbook][8], which lets you run it in Binder, this really great free service for hosting Jupyter notebooks.



### it’s easy to extend

@tef has this great talk on Scratch [A million things to do with a computer!][9] which explains the 3 ideas of Scratch:

  * low floors
  * wide walls
  * high ceilings



It sucks when you start learning something and then learn that what you can do with the Thing is very limited! It’s exciting when you learn something and see “oh, wow, there are SO MANY POSSIBILITIES, what if I did X instead?”

### that’s a lot of things!

The criteria we arrived at:

  * fun exercises
  * that teach you something you care about
  * that are challenging
  * with clear success criteria
  * that can be done quickly
  * with no complicated setup
  * and few hidden gotchas
  * using a tech stack that’s easy for you to get help with
  * where there’s a lot of room to grow



That seems pretty hard, but it seems like a good goal to aspire to! I’m going to keep very slowly working on exercises!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/11/20/what-makes-a-programming-exercise-good/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/1197282185230860288
[2]: https://cryptopals.com/
[3]: https://twitter.com/mojavelinux/status/1197323090427953152
[4]: https://www.amazon.com/exec/obidos/ASIN/0307473414/metafilter-20/ref=nosim/
[5]: https://joins-238123.netlify.com/aggregations/
[6]: https://stackingthebricks.com/
[7]: https://twitter.com/amyhoy/status/1197291805449940993
[8]: https://github.com/jvns/pandas-cookbook
[9]: https://www.youtube.com/watch?v=vU9myNJI9l4
