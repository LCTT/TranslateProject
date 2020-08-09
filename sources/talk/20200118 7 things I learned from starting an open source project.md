[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 things I learned from starting an open source project)
[#]: via: (https://opensource.com/article/20/1/open-source-project)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

7 things I learned from starting an open source project
======
It's not really about project mechanics at all.
![Stickers from all different open source projects and communities][1]

I'm currently involved—heavily involved—in [Enarx][2], an open source (of course!) project to support running sensitive workloads on untrusted hosts. I've had involvement in various open source projects over the years, but this is the first for which I'm one of the founders. We're at the stage now where we've got a fair amount of code, quite a lot of documentation, a logo, and (important!) stickers. The project will hopefully be included in a Linux Foundation group—the [Confidential Computing Consortium][3]—so things are going very well indeed.

I thought it might be useful to reflect on some of the things we did to get things going. To be clear, Enarx is a particular type of project, one that we believe has commercial and enterprise applications. It's also not mature yet, and we'll have hurdles and challenges along the way. What's more, the route we've taken won't be right for all projects, but hopefully, there's enough here to give a few pointers to other projects or people considering starting one up.

The first thing I'd say is that there's lots of help to be had out there. I'd start with Opensource.com, where you'll find [lots of guidance][4]. I'll follow up by saying that, however much of it you follow, you'll still get things wrong. That said, here's my list of things to consider when starting an open source project.

### 1\. Aim for critical mass

I'm very lucky to work at the amazing [Red Hat][5], where everything we do is open source and where we take open source and community very seriously. I've heard it called a "critical mass" company—in order to get something taken seriously, you need to get enough people interested in it that it's difficult to ignore. Enarx's two co-founders—Nathaniel McCallum and I—are both very enthusiastic about the project and have spent a lot of time gaining sponsors within the organisation (you know who you are, and we thank you—we also know we haven't done a good enough job with you on all occasions!) and "selling" it to engineers to get them interested enough that it was difficult to stop.

Some projects just bobble along with one or two contributors, but if you want to attract people and attention, getting a good set of people together who can get momentum going is a must.

### 2\. Create a demo

If you want to get people involved, a demo is great. It doesn't necessarily need to be polished, but it does need to show that what you're doing is possible and that you know what you're doing. For early demos, you may be talking about command-line output; that's fine if what you're providing isn't a user interface (UI) product. Being able to talk about what you're doing and convey both your passion and the importance of the project is a great boon. People like to be able to _see_ or _experience_ something, and it's much easier to communicate your enthusiasm if they have something real that expresses that.

### 3\. Choose a license

Once you have code and it's open source, you want other people to be able to contribute. This may seem like an unimportant step, but selecting an appropriate open source licence[1][6] will allow other people to contribute on well-understood and defined terms, making it easier for them to be involved—and for the organisations for which they work to allow them to do so.

### 4\. Get documentation

You might think that developer documentation is the most important to get out there—otherwise, how will other people get involved in coding? I disagree, at least to start with. For a small project, you can probably scale to a few more people just by explaining what the code does, what it should do, and what's missing. However, if there's no documentation available to explain what it's for and how it's going to help people, then why would anyone bother even looking at it?

This doesn't need to be polished marketing copy, and it doesn't need to be serious, but it does need to convey to people why they should care. It's also going to help you with the first point I mentioned, attaining critical mass, as being able to point to documentation, use cases, and the rest will help convince people that you've thought through the _point_ of your project. We've used a GitHub wiki as our main documentation hub, and we try to update it with new information as we generate it. This is an area, to be clear, where we could do better. But at least we know that.

### 5\. Be visible

People aren't going to find out about you unless you're visible. We were incredibly lucky in that the Confidential Computing Consortium was formed just as we were beginning to get to a level of critical mass, and we immediately had a platform to increase our exposure. We have a [Twitter account][7], I publish articles on [my blog][8], and at Opensource.com, we've been lucky enough to have the chance to publish on Red Hat's [now + Next][9] blog, I've done interviews with the press, and we speak at conferences wherever and whenever we can.

We're very lucky to have these opportunities, and it's clear that not all these approaches are appropriate for all projects, but make use of what you can: the more that people know about you, the more people can contribute.

### 6\. Be welcoming

Let's assume that people have found out about you: what's next? Well, they're hopefully going to want to get involved. If they don't feel welcome, then any involvement they have will taper off quickly. Yes, you need documentation (and, after a while, technical documentation, no matter what I said above), but you also need ways for contributors to talk to you and for them to feel that they are valued. We have [Gitter channels][10], and our daily standups are open to anyone who wants to join. Recently, someone opened an issue on our [issues database][11], and during the conversation on that thread, it transpired that our daily standup time doesn't work for them (given their time zone), so we're going to ensure that at least once a week it _does_, and we've assured them that we'll accommodate them.

### 7\. Work with people you like

I really, really enjoy meeting and working with the members of the Enarx project team. We get on well, we joke, we laugh, and we share a common aim: to make Enarx successful. I'm a firm believer in doing things you enjoy, where possible. Particularly in the early stages of a project, you need people who are enthusiastic and enjoy working closely together—even if they're geographically separated by thousands of kilometres.[2][12] If they don't get on, there's a decent chance that your and their enthusiasm for the project will falter, that the momentum will be lost, and that the project will end up failing. You won't always get the chance to choose those with whom you work, but if you can, then choose people you like and get on with.

### Conclusion: People

I didn't realise it when I started writing this article, but it's not really about project mechanics at all: it's about people. If you read back, you'll find the importance of people visible in every tip, even the one about choosing a license. Open source projects aren't really about code: they're about people, how they share, how they work together, and how they interact.

I'm certain that your experience of open source projects will vary, and I'd be very surprised if everyone agrees about the top seven things you should do for project success. Arguably, Enarx _isn't_ a success yet, and I shouldn't be giving advice at this stage of our maturity. But when I think back to all of the open source projects that I can think of that _are_ successful, people feature strongly, and I don't think that's a surprise at all.

* * *

  1. Or "license," if you're from the US.
  2. Or, in fact, miles.



* * *

_This article originally appeared on [Alice, Eve, and Bob – a security blog][13] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-project

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/stickers-osdc-lead.png?itok=2RNn132b (Stickers from all different open source projects and communities)
[2]: https://enarx.io/
[3]: https://confidentialcomputing.io/
[4]: https://opensource.com/article/20/1/getting-started-open-source
[5]: https://redhat.com/
[6]: tmp.3liT27tUaE#1
[7]: https://twitter.com/enarxproject
[8]: https://aliceevebob.com/
[9]: https://next.redhat.com/
[10]: https://gitter.im/enarx/
[11]: https://github.com/enarx/enarx/issues
[12]: tmp.3liT27tUaE#2
[13]: https://aliceevebob.com/2019/12/17/7-tips-for-kicking-off-an-open-source-project/
