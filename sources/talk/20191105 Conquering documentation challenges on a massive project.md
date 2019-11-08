[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Conquering documentation challenges on a massive project)
[#]: via: (https://opensource.com/article/19/11/documentation-challenges-tom-caswell-matplotlib)
[#]: author: (Gina Helfrich, Ph.D. https://opensource.com/users/ginahelfrich)

Conquering documentation challenges on a massive project
======
Learn more about documentation at scale in this interview with Tom
Caswell, Matplotlib lead developer.
![Files in a folder][1]

Given the recent surge in popularity of open source data science projects like pandas, NumPy, and [Matplotlib][2], it’s probably no surprise that the increased level of interest is generating user complaints about documentation. To help shed light on what’s at stake, we talked to someone who knows a lot about the subject: [Thomas Caswell][3], the lead developer of Matplotlib.

Matplotlib is a flexible and customizable tool for producing static and interactive data visualizations since 2001 and is a foundational project in the scientific Python stack. Matplotlib became a [NumFOCUS-sponsored project][4] in 2015.

Tom has been working on Matplotlib for the past five years and got his start answering questions about the project on Stack Overflow. Answering questions became submitting bug reports, which became writing patches, which became maintaining the project, which ultimately led to him becoming the lead developer.

**Fun fact:** Tom’s advancement through the open source community follows exactly the [path described by Brett Cannon][5], a core Python maintainer.

NumFOCUS Communications Director, Gina Helfrich, sat down with Tom to discuss the challenges of managing documentation on a project as massive and as fundamental as Matplotlib.

**Gina Helfrich:** Thanks so much for taking the time to talk with us about Matplotlib and open source documentation, Tom. To contextualize our conversation a bit, can you speak a little to your impression of the [back-and-forth][6] on Twitter with Wes McKinney about pandas and user complaints about the documentation?

**Thomas Caswell:** I only kind of saw the edges, but I see both sides. On one hand, I think something Mike Pope said was, "if it’s not documented, it doesn’t exist." If you are writing open source tools,

part of that work is documenting them, and doing so clearly in a way that users can discover and actually use, short of going to the source [code]. It’s not good enough to dump code on the internet—you have to do the whole thing.

On the other hand, if you’re not paying [for the software], you don’t get to make demands. The attitude I think Wes was reacting to, which you see a lot, is: "You built this tool that is useful to me, therefore I expect enterprise-grade paid support because it’s obviously critical to what I’m doing."

But I think the part Eric O. Lebigot was responding to is the first part. Part of building a tool is the documentation, not just the code. But Wes is responding to the entitlement, the expectation of free work, so I see both sides.

**GH:** Looking at Matplotlib specifically, which is facing many of the same issues as pandas, I know you have some big challenges with your documentation. I get the impression that there’s this notion out there from new users that getting started with Matplotlib is super frustrating and the docs don’t really help. Can you tell me about the history there and how the project came to have this problem?

**TC:** So, Matplotlib is a humongous library. I’ve been working on it for five years, and around once a month (or every other month), there’s a bug report where my first reaction is, "Wait… we do _what_?"

A lot of the library is under-documented. This library survived at least two generations of partial conversion to standardized docstring formats. As I understand it (I wasn’t around at the time), we were one of the first projects outside of core Python to adopt Sphinx to build our docs—possibly a little too early. We have a lot of weird customizations since Sphinx didn’t have those features yet [at the time]. Other people have built better versions of those features since then, but because Matplotlib is so huge, migrating them is hard.

I think if you build the PDF version of our docs, it’s around 3,000 pages, and I would say that the library has maybe half the documentation it really needs.

We are woefully under-documented in the sense that not every feature has good docs. On the other hand, we are over-documented in that what we have is not well organized and there’s no clear entry point. If I want to find out how to do something, even I have a hard time finding where something is documented. And if _I_ [the lead developer] have issues finding that information, there’s no prayer of new users finding it. So in that sense, we are both drastically under-documented and drastically over-documented.

**[Read next: [Syadmins: Poor documentation is not a job insurance strategy][7]]**

**GH:** Given that Matplotlib is over 15 years old, do you have a sense of who has been writing the documentation? How does your documentation actually get developed?

**TC:** Historically, much like the code, the documentation was organically developed. We’ve had a lot of investment in examples and docstrings, and a few entries labeled as tutorials that teach you one specific skill. For example, we’ve got prose on the "rough theory of colormaps," and how to make a colormap.

A lot of Matplotlib’s documentation is examples, and the examples overlap. Over the past few years, when I see interesting examples go by on the mailing list or on Stack Overflow, I’ll say, "Can you put this example in the docs?" So, I guess I’ve been actively contributing to the problem that there’s too much stuff to wade through.

Part of the issue is that people will do a six-hour tutorial and then some of those examples end up in the docs. Then, someone _else_ will do a six-hour tutorial (you can’t cover the whole library in six hours) and the basics are probably similar, but they may format the tutorial differently.

**GH:** Wow, that sounds pretty challenging to inherit and try to maintain. What kinds of improvements have you been working on for the documentation?

**TC:** There’s been an effort over the past couple of years to move to numpydoc format, away from the home-grown scheme we had previously. Also, [Nelle Varoquaux][8] recently did a tremendous amount of work and led the effort to move from how we were doing examples to using Sphinx-Gallery, which makes it much easier to put good prose into examples. This practice was picked up by [Chris Holdgraf][9] recently, as well. Sphinx-Gallery went live on our main docs with Matplotlib 2.1, which was a huge improvement for users. Nelle also organized a distributed [docathon][10].

We’ve been trying to get better about new features. When there’s a new feature, you must add an example to the docs for that feature, which helps make things discoverable. We’ve been trying to get better about making sure docstrings exist, are accurate, and that they document all of the parameters.

**GH:** If you could wave a magic wand and have the Matplotlib docs that you want, what would they look like?

**TC:** Well, as I mentioned, the docs grew organically, and that means we have no consistent voice across them. It also means there’s no single point of truth for various things. When you write an example, how far back down the basics do you go? So, it’s not clear what you need to know before you can understand the example. Either you explain just enough, all the way back (so we’ve got a random assortment of the basics smeared everywhere), or you have examples that, unless you’re already a heavy user, make no sense.

So, to answer the question, having someone who can actually _write_ and has empathy for users go through and write a 200-page intro to Matplotlib book, and have that be the main entry to the docs. That’s my current vision of what I want.

**GH:** If you were introducing a new user to Matplotlib today, what would you have her read? Where would you point her in the docs?

**TC:** Well, there isn’t a good, clear option for, "You’ve been told you need to use Matplotlib. Go spend an afternoon and read this." I’m not sure where I’d point people to for that right now. [Nicolas Rougier][11] has written some [good][12] [stuff][13] on that front, such as a tutorial for beginners, and some of that has migrated into the docs.

There’s a lot out there, but it’s not collated centrally, or linked from our docs as "START HERE." I should also add that I might not have the best view of this issue anymore because I haven’t actively gone looking for this information, so maybe I just never found it because I don’t need it. I don’t know that it exists. (This topic actually [came up recently][14] on the mailing list.)

The place we do point people to is: Go look at the gallery and click on the thumbnail that looks closest to what you want to do.

Ben Root presented an [Anatomy of Matplotlib tutorial][15] at SciPy several times. There’s a number of Matplotlib books that exist. It’s mixed whether the authors were contributors [to the project]. Ben Root recently wrote one about [interactive figures][16]. I’ve been approached and have turned this task down a couple of times, just because I don’t have time to write a book. So my thought for getting a technical writer was to get a technical writer to write the book, and instead of publishing the result as a book, put it in the online docs.

**GH:** Is there anyone in the Matplotlib contributor community who specializes in the documentation part of things, or takes a lot of ownership around documentation?

Nelle was doing this for Matplotlib for a bit but has stepped back. Chris Holdgraf is taking the lead on some doc-related things now. Nicholas Rougier has written a number of [extremely good tutorials][17] outside of the project's documentation.

I mean, no one uses _just_ Matplotlib. You don’t use us but not use SciPy, NumPy, or pandas. You have to be using something else to do the actual work that you now need to visualize. There are many "clean" introductions to Matplotlib in other places. For example, both Jake VanderPlas’s [analysis book][18] and Katy Huff and Anthony Scopatz’s [book][19] have introductions to Matplotlib that cover this topic to the degree they felt was needed for their purposes.

**GH:** I’d love to hear your thoughts on the role of Stack Overflow in all of this.

**TC:** That actually is how I got into the project. My Stack Overflow number is large, and it’s almost all Matplotlib questions. And how I got started is that I answered questions. A lot of the questions on Stack Overflow are, "Please read the docs for me." Which, fine. But actually, a great way to learn the library is to answer questions on Stack Overflow, because people who have problems that you don’t personally have will ask, "How do I do this?" and now you have to go figure out how to do it. It’s kind of fun.

But sometimes people ask questions and they’ve actually found a bug. And in determining that they’ve actually found a bug, I tried to figure out how to fix the bugs. So, I started some reports, which led to, "Here’s a pull request to fix the bug I found." And then when I started entering a lot of PRs, they were like, "You need to start reviewing them now," so they gave me commit rights and made me review things. And then they put me in charge.

I do like Stack Overflow. I think that to a large extent, what it replaced is the mailing list. If I have any criticism of Stack Overflow, I think it’s convincing people who are answering questions to upstream more of the results.

There are some good examples on Stack Overflow. Here’s a complex one: You have to touch these seven different functions, each of which are relatively well documented, but you have to put them together in just the right way. Some of those answers should probably go in the gallery with our annotations about how they work. Basically, if you go through Joe Kington’s top 50 answers, they should probably all go in the docs.

In other cases, the question is asked because the docstring is not clear. We need to convince people who are answering those questions to use those moments as a survey of where our documentation is not clear, instead of just answering [on Stack Overflow], and then move those answers back [to the docs].

**GH:** What’s it like managing PRs for documentation as opposed to patches and bug fixes?

**TC:** We’ve tried to streamline how we do documentation PRs. Writing documentation PRs is the most painful thing ever in open source because you get copyediting via pull request. You get picky proofreading and copyediting via GitHub comments. Like, "there’s a missing comma," or "two spaces!" And again, I keep using myself as a weird outlier benchmark, _I_ get disheartened when I write doc pull requests and then I get 50 comments regarding picky little things.

What I’ve started trying to push as the threshold on docs is, "Did [the change] make it worse?" If it didn’t make it worse, merge the change. Frequently, it takes more time to leave a GitHub comment than to fix the problem.

> "If you can use Matplotlib, you are qualified to contribute to it."
>       — Tom Caswell, Matplotlib lead developer

**GH:** What’s one action you’d like members of the community who are reading this interview to take? What is one way they could make a difference on this issue?

**TC:** One thing I’d like to see more of—and I acknowledge that how to contribute to open source is a big hurdle to get over—I’ve said previously that if you can use Matplotlib, you are qualified to contribute to it. That’s a message I would like to get out more broadly.

If you’re a user and you read the docstring to something and it doesn’t make sense, and then you play around a bit and you understand that function well enough to use it—you could then start clarifying docstrings.

Because one of the things I have the hardest time with is that I personally am bad at putting myself in other people’s shoes when writing docs. I don’t know from a user’s point of view—and this sounds obnoxious but I’m deep enough in the code—what they know coming into the library as a new person. I don’t know the right things to tell them in the docstring that will actually help them. I can try to guess and I’ll probably write too much, or the wrong things. Or worse, I’ll write a bunch of stuff that refers to things they don’t know about, and now I’ve just made the function more confusing.

Whereas a user who has just encountered this function for the first time, and sorted out how to make it do what they need it to do for their purposes, is in the right mindset to write what they wish the docs had said that would have saved them an hour.

**GH:** That’s a great message, I think. Thanks for talking with me, Tom!

**TC:** You’re welcome. Thank you.

_This article was originally published on the [NumFOCUS blog][20] in 2017 and is just as relevant today. It’s republished with permission by the original interviewer and has been lightly edited for style, length, and clarity. If you want to support NumFOCUS in person, attend one of the local [PyData events][21] happening around the world. Learn more about NumFOCUS on our website: [numfocus.org][22]_

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/documentation-challenges-tom-caswell-matplotlib

作者：[Gina Helfrich, Ph.D.][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ginahelfrich
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://matplotlib.org
[3]: https://twitter.com/tacaswell
[4]: https://numfocus.org/sponsored-projects
[5]: https://snarky.ca/why-i-took-october-off-from-oss-volunteering/
[6]: https://twitter.com/wesmckinn/status/909772652532953088
[7]: https://www.redhat.com/sysadmin/poor-documentation
[8]: https://twitter.com/nvaroqua
[9]: https://twitter.com/choldgraf
[10]: https://www.numfocus.org/blog/numfocus-projects-participate-in-docathon-2017/
[11]: https://twitter.com/NPRougier
[12]: https://github.com/rougier/matplotlib-tutorial
[13]: http://www.labri.fr/perso/nrougier/teaching/matplotlib/matplotlib.html
[14]: https://mail.python.org/pipermail/matplotlib-users/2017-September/001031.html
[15]: https://github.com/matplotlib/AnatomyOfMatplotlib
[16]: https://www.amazon.com/Interactive-Applications-using-Matplotlib-Benjamin/dp/1783988843
[17]: http://www.labri.fr/perso/nrougier/teaching/
[18]: http://shop.oreilly.com/product/0636920034919.do
[19]: http://shop.oreilly.com/product/0636920033424.do
[20]: https://numfocus.org/blog/matplotlib-lead-developer-explains-why-he-cant-fix-the-docs-but-you-can
[21]: https://pydata.org/
[22]: https://numfocus.org
