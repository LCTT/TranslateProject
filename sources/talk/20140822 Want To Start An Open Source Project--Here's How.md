  Vic020

Want To Start An Open Source Project? Here's How
================================================================================
> Our step-by-step guide.

**You have a problem. You've weighed the** [pros and cons of open sourcing your code][1], and you know [you need to start an open-source project][2] for your software. But you have no idea how to do this.

Oh, sure. You may know how to set up a GitHub account and get started, but such [mechanics][3] are actually the easy part of open source. The hard part is making anyone care enough to use or contribute to your project.

![](http://a4.files.readwrite.com/image/upload/c_fit,q_80,w_630/MTE5NDg0MDYxMTg2Mjk1MzEx.jpg)

Here are some principles to guide you in building and releasing code that others will care about.

### First, The Basics ###

You may choose to open source code for a variety of reasons. Perhaps you're looking to engage a community to help write your code. Perhaps, [like Known][4], you see "open source distribution ... as a multiplier for the small teams of developers writing the code in-house." 

Or maybe you just think it's the right thing to do, [as the UK government believes][5]. 

Regardless of the reason, this isn't about you. Not really. For open source to succeed, much of the planning has to be about those who will use the software. As [I wrote in 2005][6], if you "want lots of people to contribute (bug fixes, extensions, etc.," then you need to "write good documentation, use an accessible programming language ... [and] have a modular framework." 

Oh, and you also need to be writing software that people care about. 

Think about the technology you depend on every day: operating systems, web application frameworks, databases, and so on. These are far more likely to generate outside interest and contributions than a niche technology for a particular industry like aviation. The broader the application of the technology, the more likely you are to find willing contributors and/or users.

In summary, any successful open-source project needs these things:

1. Optimal market timing (solving a real need in the market);

2. A strong, inclusive team of developers and non-developers; 

3. An architecture of participation (more on that below);

4. Modular code to make it easier for new contributors to find a discrete chunk of the program to work on, rather than forcing them to scale an Everest of monolithic code;

5. Code that is broadly applicable (or a way to reach the narrower population more niche-y code appeals to);

6. Great initial source code (if you put garbage into GitHub, you'll get garbage out);

7. A permissive license—I [personally prefer Apache-style licensing][7] as it introduces the lowest barriers to developer adoption, but many successful projects (like Linux and MySQL) have used GPL licensing to great effect.

Of the items above, it's sometimes hardest for projects to actively invite participation. That's usually because this is less about code and more about people.

### "Open" Is More Than A License ###

One of the best things I've read in years on this subject comes from Vitorio Miliano ([@vitor_io][8]), a user experience and interaction designer from Austin, Texas. [Miliano points out][9] that anyone who doesn't already work on your project is a "layperson," in the sense that no matter their level of technical competence, they know little about your code.

So your job, he argues, is to make it easy to get involved in contributing to your code base. While he focuses on how to involve non-programmers in open-source projects, he identifies a few things project leads need to do to effectively involve anyone—technical or non-technical—in open source:

> 1. a way to understand the value of your project 
> 
> 2. a way to understand the value they could provide to the project
> 
> 3. a way to understand the value they could receive from contributing to the project
> 
> 4. a way to understand the contribution process, end-to-end
> 
> 5. a contribution mechanism suitable for their existing workflows

Too often, project leads want to focus on the fifth step without providing an easy path to understand items 1 through 4. "How" to contribute doesn't matter very much if would-be contributors don't appreciate the "why."

On that note, it's critical, Miliano writes, to establish the value of the project with a "jargon-free description" so as to "demonstrate your accessibility and inclusiveness by writing your descriptions to be useful to everyone at all times." This has the added benefit, he avers, of signaling that documentation and other code-related content will be similarly clear.

On the second item, programmers and non-programmers alike need to be able to see exactly what you'd like from them, and then they need to be recognized for their contributions. Sometimes, as MongoDB solution architect [Henrik Ingo told me][10], "A smart person [may] come[] by with great code, but project members fail to understand it." That's not a terrible problem if the "in" group acknowledges the contribution and reaches out to understand. 

But that doesn't always happen.

### Do You Really Want To Lead An Open Source Project? ###

Too many open-source project leads advertise inclusiveness but then are anything but inclusive. If you don't want people contributing code, don't pretend to be open source. 

Yes, this is sometimes a function of newbie fatigue. As [one developer wrote][11] recently on HackerNews, 

> Small projects get lots of, well, basically useless people who need tons of handholding to get anything accomplished. I see the upside for them, but I don't see the upside for me: if I where[sic] to help them out, I'd spend my limited available time on handholding people who apparently managed to get ms degrees in cs without being able to code instead of doing what I enjoy. So I ignore them.

While that may be a good way to maintain sanity, the attitude doesn't bode well for a project if it's widely shared. 

And if you really couldn't care less about non-programmers contributing design input, or documentation, or whatever, then make that clear. Again, if this is the case, you really shouldn't be an open-source project. 

Of course, the perception of exclusion is not always reality. As ActiveState vice president Bernard Golden told me over IM, "many would-be developers are intimidated by the perception of an existing 'in-crowd' dev group, even though it may not really be true." 

Still, the more open source projects invest in making it easy to understand why developers should contribute, and make it inviting to do so, the how largely takes care of itself.

Lead image courtesy of [Shutterstock][12]

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/08/20/open-source-project-how-to

作者：[Matt Asay][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://readwrite.com/author/matt-asay
[1]:http://readwrite.com/2014/07/07/open-source-software-pros-cons
[2]:http://readwrite.com/2014/08/15/open-source-software-business-zulily-erp-wall-street-journal
[3]:http://www.cocoanetics.com/2011/01/starting-an-opensource-project-on-github/
[4]:http://werd.io/2014/the-roi-of-building-open-source-software
[5]:https://www.gov.uk/design-principles
[6]:http://asay.blogspot.com/2005/09/so-you-want-to-build-open-source.html
[7]:http://www.cnet.com/news/apache-better-than-gpl-for-open-source-business/
[8]:https://twitter.com/vitor_io
[9]:http://opensourcedesign.is/blogging_about/import-designers/
[10]:https://twitter.com/h_ingo/status/501323333301190656
[11]:https://news.ycombinator.com/item?id=8122814
[12]:http://www.shutterstock.com/
