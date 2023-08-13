[#]: subject: "Some blogging myths"
[#]: via: "https://jvns.ca/blog/2023/06/05/some-blogging-myths/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some blogging myths
======

A few years ago I gave a short talk ([slides][1]) about myths that discourage people from blogging. I was chatting with a friend about blogging the other day and it made me want to write up that talk as a blog post.

here are the myths:

  * [myth: you need to be original][2]
  * [myth: you need to be an expert][3]
  * [myth: posts need to be 100% correct][4]
  * [myth: writing boring posts is bad][5]
  * [myth: you need to explain every concept][6]
  * [myth: page views matter][7]
  * [myth: more material is always better][8]



### myth: you need to be original

This is probably the one I hear the most often – “Someone has written about this before! Who’s going to care about what I have to say?“.

The main way I think about this personally is:

  1. identify something I personally have found confusing or interesting
  2. write about it



The idea is that if I found it confusing, lots of other people probably did too, even though the information might theoretically be out there on the internet somewhere. Just because there is information on the internet, it doesn’t get magically teleported into people’s brains!

I sometimes store up things that I find confusing for many months or years – for example right now I’m confused about some specific details of how Docker networking works on Mac, but I haven’t figured it out enough to be able to write about it. If I ever figure it out to my satisfaction I’ll probably write a blog post.

Sometimes when I write a blog post, someone will link me to a great existing explanation of the thing that I hadn’t seen. I try to think of this as a good thing – it means that I get a new resource that I couldn’t find, and maybe other people find out about it too. Often I’ll update the blog post to link to it.

A couple of other notes about this one:

  * technology changes, and the details matter. Maybe the exact details about how to do something have changed in the last 5 years, and there isn’t much written about the situation in 2023!
  * personal stories are really valuable. For example I love my friend Mikkel’s [Git is my buddy][9] post about how he uses Git. It’s not the same way that I use it, and I like seeing his approach.



### a bit more about my love for personal stories

I think the reason I keep writing these blog posts encouraging people to blog is that I _love_ reading people’s personal stories about how they do stuff with computers, and I want more of them. For example, I started using a Mac recently, and I’ve been very annoyed by the lack of tracing tools like strace.

So I would love to read a story about how someone is using tracing tools to debug on their Mac in 2023! I found [one from 2016][10], but I think the situation with system integrity protection has changed since then and the instructions don’t work for me.

That’s just one example, but there are a million other things on computers that I do not know how to do, where I would love to read 1 person’s story of exactly how they did it in 2023.

### myth: you need to be an expert

The second myth is that you need to be an expert in the thing you’re writing about. If you’ve been reading this blog, you probably know that I’ve written a lot of “hey, I just learned this!” posts over the years, where I:

  1. Learn an interesting thing (“hey, I didn’t know how gdb works, that’s cool!”)
  2. Write a short blog post about what I learned ([how does gdb work?][11])



You actually just need to know 1-2 interesting things that the reader doesn’t. And if you just learned the thing yesterday, it’s certain that lots of other people don’t know it either.

### myth: posts need to be 100% correct

I try to my make my posts _mostly_ correct, and I’ve gotten a bit better at that over time.

My main strategy here is to just add qualifiers like “My understanding is..” or “I think..” before statements that I’m not totally sure of. This saves a lot of time fact checking statements that I’m honestly not sure how to fact check most of the time.

Some examples of “I think…s” from my past blog posts:

> I think people are replacing “how many golf balls can fit in the Empire State Building” with more concrete [interview] questions about estimating program runtime and space requirements.
>
> I think the most important thing with bridges is to set up the route tables correctly. So far my understanding is that there are 2 route table entries you need to set: …
>
> Etsy uses PHP, which I think means they can’t have long-lived persistent TCP connections
>
> I think the MTU on my local network is 1500 bytes.

I still don’t know if all of those statements are true (is it true that PHP programs can’t have long-lived persistent TCP connections? maybe not!), so the qualifiers are useful. I don’t really know anything about PHP so I don’t have much interest in fact checking that PHP statement – I’m happy to leave it as an “I think” and potentially correct later it if someone tells me it’s wrong.

I do tend to overdo the “I think that…” statements a bit (bad habit!) and sometimes I need to edit them out when actually it’s something I’m 100% sure of.

### myth: writing boring posts is bad

The reality of publishing things on the internet is that interesting things get boosted, and boring things get ignored. So people are basically guaranteed to think your posts are much more interesting that they actually are, because they’re more likely to see your interesting posts.

Also it’s hard to guess in advance what people will think is interesting, so I try to not worry too much about predicting that in advance. I really Darius Kazemi’s [How I Won The Lottery][12] talk on this topic about how putting things on the internet is like buying lots of lottery tickets, and the best way to “win” is to make a lot of stuff.

### myth: you need to explain every concept

It’s common for people writing advanced posts (like “how malloc works”) to try to include very basic definitions for beginners.

The problem is that you end up writing something that feels like it wasn’t written for **anyone** : beginners will get confused (it’s very hard to bring someone from “I have no idea what memory allocation is” to “in depth notes about the internals of malloc” in a single blog post), and more advanced readers will be bored and put off by the overly basic explanations.

I found that the easiest way to start was to **pick one person and write for them**.

You can pick a friend, a coworker, or just a past version of yourself. Writing for just 1 person might feel insufficiently general (“what about all the other people??“) but writing that’s easy to understand for 1 person (other than you!) has a good chance of being easy to understand for many other people as well.

### writing has gotten harder as I get more experienced

Someone who read this mentioned that they feel like writing has gotten harder as they get more experienced, and I feel the same way.

I think this is because the gap between me and who I’m writing for has gotten a bigger over time, and so it gets a little harder for me to relate to people who know less about the topic. I think on the balance having more experience makes my writing better (I have more perspective!), but it feels harder.

I don’t have any advice to give about this right now. I just want to acknowledge that it’s hard because someone who read a draft of this mentioned it.

### myth: page views matter

I’ve looked at page view analytics a lot in my life, and I’ve never really gotten anything out of it. Comments like this one mean a lot more to me:

> Hey, @b0rk. Just wanted to let you know that [this post][13] really helped me to improve my skill of understanding a complex concept. Thanks! :)

If it helps one person, I figure I’ve won. And probably it helped 10 other people who didn’t say anything too!

### myth: more material is always better

I appreciate the work that goes into extremely deep dive blog posts, but honestly they’re not really my thing. I’d rather read something short, learn a couple of new things, and move on.

So that’s how I approach writing as well. I’ll share a couple of interesting things and then leave anything extra for another post. For me this works well because short posts take less time to write.

This one is obviously a personal preference: short posts aren’t “better” either, I just like them more.

But I often see people get tripped up by wanting to include EVERYTHING in their blog post and then never publishing anything and I think it’s worth considering just making the post shorter and publishing it.

### some notes on pedantic/annoying comments

Someone who read a draft of this mentioned struggling with comments that are pedantic or annoying or mean or argumentative. That one’s definitely not a myth, I’ve read a lot of comments like that about my work. (as well as a lot more comments where people are being constructive, but those ones aren’t the problem)

A few notes on how I deal with it:

  * The “don’t read the comments” advice has never worked for me, for better or for worse. I read all of them.
  * I don’t reply to them. Even if they’re [wrong][14]. I dislike arguing on the internet and I’m extremely bad at it, so it’s not a good use of my time.
  * Sometimes I can learn something new from the comment, and I try to take that as a win, even if the thing is kind of minor or the comment is phrased in a way that I find annoying.
  * Sometimes I’ll update the post to fix mistakes.
  * I’ve sometimes found it helpful to reinterpret people being mad as people being confused or curious. I wrote a [toy DNS resolver][15] once and some of the commenters were upset that I didn’t handle parsing the DNS packet. At the time I thought this was silly (I thought DNS parsing was really straightforward and that it was obvious how to do it) but I realized that maybe the commenters didn’t think it was easy or obvious, and wanted to know how do it. Which makes sense! It’s not obvious! Those comments partly inspired [implement DNS in a weekend][16], which focuses much more heavily on the parsing aspects.



As with everything I don’t think this is the “best” way to deal with pedantic/annoying comments, it’s just what I do.

### that’s all for now!

Probably I’ll write another meta post about blogging in a couple of years since apparently that’s what I do :)

Thanks to Ed, Jeff, Brian, Hazem, Zachary, and Miccah for reading a draft of this

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/06/05/some-blogging-myths/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2020/12/10/day-24--a-short-talk-about-blogging-myths/
[2]: tmp.Qqrv69sbMf#myth-you-need-to-be-original
[3]: tmp.Qqrv69sbMf#myth-you-need-to-be-an-expert
[4]: tmp.Qqrv69sbMf#myth-posts-need-to-be-100-correct
[5]: tmp.Qqrv69sbMf#myth-writing-boring-posts-is-bad
[6]: tmp.Qqrv69sbMf#myth-you-need-to-explain-every-concept
[7]: tmp.Qqrv69sbMf#myth-page-views-matter
[8]: tmp.Qqrv69sbMf#myth-more-material-is-always-better
[9]: https://mikkel.ca/blog/git-is-my-buddy-effective-solo-developer/
[10]: https://bryce.is/writing/code/2016/07/30/debugging-using-system-calls.html
[11]: https://jvns.ca/blog/2016/08/10/how-does-gdb-work/
[12]: https://www.youtube.com/watch?v=l_F9jxsfGCw
[13]: https://jvns.ca/blog/2018/09/01/learning-skills-you-can-practice/
[14]: https://xkcd.com/386/
[15]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
[16]: https://implement-dns.wizardzines.com/
