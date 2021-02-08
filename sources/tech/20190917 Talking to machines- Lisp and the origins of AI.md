[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Talking to machines: Lisp and the origins of AI)
[#]: via: (https://opensource.com/article/19/9/command-line-heroes-lisp)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg)

Talking to machines: Lisp and the origins of AI
======
The Command Line Heroes podcast explores the invention of Lisp and the
rise of thinking computers powered by open source software.
![Listen to the Command Line Heroes Podcast][1]

Artificial intelligence (AI) is all the rage today, and its massive impact on the world is still to come, says the[ Association for the Advancement of Artificial Intelligence][2] (AAAI). According to an article on [Nanalyze][3]:

> "The vast majority of nearly 2,000 experts polled by the Pew Research Center in 2014 said they anticipate robotics and artificial intelligence will permeate wide segments of daily life by 2025. A 2015 study covering 17 countries found that artificial intelligence and related technologies added an estimated 0.4 percentage point on average to those countries' annual GDP growth between 1993 and 2007, accounting for just over one-tenth of those countries' overall GDP growth during that time."

However, this is the second time has AI garnered so much attention. When was AI first popular, and what does that have to do with the obscure-but-often-loved programming language Lisp?

The second-to-last podcast of [Command Line Heroes][4]' third season dives into these topics and leaves us thinking about open source at the core of AI.

### Before the term AI

Thinking machines have been a curiosity for centuries, long before they could be realized. In the 1800s, computer science pioneers Charles Babbage and Ada Lovelace imagined an analytical engine capable of predictions far beyond human skills, such as correctly selecting the winning horse in a race.

In the 1940s and '50s, Alan Turing defined what it would look like for intelligent machines to emulate human intelligence; that's what we now call the Turing Test. In his 1950 [research paper][5], Turing's "imitation game" set out to convince someone they were communicating with a human in another room when, in reality, it was a machine.

While these theories inspired imaginative debate, they became less theoretical as computer hardware began providing enough power to begin experimenting.

### Why Lisp is at the heart of AI theory

John McCarthy, the person to coin the term "artificial intelligence," is also the person who reinvented how we program to create thinking machines. His reimagined approach was codified into the Lisp programming language. As [Paul Graham][6] wrote:

> "In 1960, [John McCarthy][7] published a remarkable paper in which he did for programming something like what Euclid did for geometry. He showed how, given a handful of simple operators and a notation for functions, you can build a whole programming language. He called this language Lisp, for 'List Processing,' because one of his key ideas was to use a simple data structure called a list for both code and data.
>
> "It's worth understanding what McCarthy discovered, not just as a landmark in the history of computers, but as a model for what programming is tending to become in our own time. It seems to me that there have been two really clean, consistent models of programming so far: the C model and the Lisp model. These two seem points of high ground, with swampy lowlands between them. As computers have grown more powerful, the new languages being developed have been [moving steadily][8] toward the Lisp model. A popular recipe for new programming languages in the past 20 years has been to take the C model of computing and add to it, piecemeal, parts taken from the Lisp model, like runtime typing and garbage collection."

I remember when I first wrote Lisp for a computer science class. After wrapping my head around its seemingly infinite number of parentheses, I uncovered a beautiful pattern of thought: Can I think through what I want this software to do?

![The elegance of Lisp programming is timeless][9]

That sounds silly: computers process what we code them to do, but there's something about recursion that made me think in a wildly different light. It's exciting to learn that 15 years ago, I may have been tapping into the big-picture changes McCarthy was describing.

### Why the slowdown in AI?

By the mid-to-late 1960s, McCarthy's work made way to a new field of research, where AI, machine learning (ML), and deep learning all became possibilities. And Lisp became the accepted standard in this emerging field. It's said that in 1968, McCarthy made a wager with David Levy, a Scottish chess master, that in 10 years a computer would be able to beat Levy in a chess match. Why did it take nearly 30 years to get to the famous [Deep Blue vs. Garry Kasparov][10] match?

Command Line Heroes explores one theory: that for-profit investment in AI pulled essential talent from academia, where they were advancing the science, and pushed them onto a different path. Whether or not this was the reason, the world of AI fell into a "winter," where the people pursuing it were considered unrealistic.

This AI winter lasted for quite some time. In 2005, The [_New York Times_ reported][11] that AI had become so stigmatized that "some computer scientists and software engineers avoided the term artificial intelligence for fear of being viewed as wild-eyed dreamers."

### Where is AI now?

Fast forward to today, when talking about AI or ML is a fast pass to getting people's attention—but that attention isn't always positive. Many are concerned that AI will remove millions of jobs from the world. Others say it will [create][12] millions of more jobs than are lost.

The verdict is still out. [McKinsey's research][13] on the job loss vs. job gain debate is fascinating. When you take into account growing world consumption, aging populations, "marketization" of previously unpaid domestic work, and other factors, you find that the answer depends on your outlook.

One thing is for sure: AI will be a significant part of our lives, and it will have much wider implications than other areas of tech. For this reason (among others), examining the [misconceptions around ethics and bias in AI][14] is essential.

### Open source and AI

McCarthy had a dream that machines could have common sense. His AI goals included open source from the very beginning; this is visualized on Red Hat's beautifully animated webpage on the [origins of AI and its open source roots][15].

[![Origins of AI and open source screenshot][16]][15]

If we are to achieve the goals of McCarthy, Turing, or other AI pioneers, I believe it will be because of the open source community behind the technology. Part of the reason AI's popularity bounced back is because of open source: languages, frameworks, and the datasets we analyze are increasingly open. Here are a handful of things to explore:

  * [Learn enough Python and R][17] to be part of this future
  * [Explore Python libraries][18] that will bulk up your skills
  * Understand how [AI and ML are related][19]
  * Explore [free and open datasets][20]
  * Use modern implementations of Lisp, [available under open source licenses][21]



It's possible that early AI explored the right ideas in the wrong decade. World-class computers back then weren't even as powerful as today's cellphones, and each one was shared by dozens of individuals. Today, many of us own multiple supercomputers and carry them with us all the time. For this reason, among others, the future of AI is strong and its highest achievements are yet to come.

_Command Line Heroes has covered programming languages for all of Season 3. [Subscribe so that you don't miss the last episode of the season][4], and I would love to hear your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/command-line-heroes-lisp

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_hereoes_ep7_blog-header-292x521.png?itok=lI4DXvq2 (Listen to the Command Line Heroes Podcast)
[2]: http://aaai.org/
[3]: https://www.nanalyze.com/2016/11/artificial-intelligence-definition/
[4]: https://www.redhat.com/en/command-line-heroes
[5]: https://www.csee.umbc.edu/courses/471/papers/turing.pdf
[6]: http://www.paulgraham.com/rootsoflisp.html
[7]: http://www-formal.stanford.edu/jmc/index.html
[8]: http://www.paulgraham.com/diff.html
[9]: https://opensource.com/sites/default/files/uploads/lisp_cycles.png (The elegance of Lisp programming is timeless)
[10]: https://en.wikipedia.org/wiki/Deep_Blue_versus_Garry_Kasparov
[11]: https://www.nytimes.com/2005/10/14/technology/behind-artificial-intelligence-a-squadron-of-bright-real-people.html
[12]: https://singularityhub.com/2019/01/01/ai-will-create-millions-more-jobs-than-it-will-destroy-heres-how/
[13]: https://www.mckinsey.com/featured-insights/future-of-work/jobs-lost-jobs-gained-what-the-future-of-work-will-mean-for-jobs-skills-and-wages
[14]: https://opensource.com/article/19/8/4-misconceptions-ethics-and-bias-ai
[15]: https://www.redhat.com/en/open-source-stories/ai-revolutionaries/origins-ai-open-source
[16]: https://opensource.com/sites/default/files/uploads/origins_aiopensource.png (Origins of AI and open source screenshot)
[17]: https://opensource.com/article/19/5/learn-python-r-data-science
[18]: https://opensource.com/article/18/5/top-8-open-source-ai-technologies-machine-learning
[19]: https://opensource.com/tags/ai-and-machine-learning
[20]: https://opensource.com/article/19/2/learn-data-science-ai
[21]: https://www.cliki.net/Common+Lisp+implementation
