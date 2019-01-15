[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Two Years With Emacs as a CEO (and now CTO))
[#]: via: (https://www.fugue.co/blog/2018-08-09-two-years-with-emacs-as-a-cto.html)
[#]: author: (Josh Stella https://www.fugue.co/blog/author/josh-stella)

Two Years With Emacs as a CEO (and now CTO)
======

Two years ago, I wrote [a blog post][1] that got some notice, which surprised me. It was a piece about going back to Emacs as my primary content creation tool, first as a CEO, and now as a CTO. A brief recap is that I spent most of my career as a programmer and a software architect, and preferred Emacs as my code editor for much of that time. Reconsidering Emacs was an experiment that I was excited about, but wasn't sure how it would work out. On the Internet, the post was met with roughly equal parts disdain and appreciation, but tens of thousands of people read it, so it seems that I touched on something interesting. Some of the more challenging and funny posts on [Reddit][2] and [HackerNews][3] predicted that I'd have hands shaped like claws or that I'd have lost my eyesight because I use white backgrounds. I'm pleased to report that no dire consequences resulted, and in fact my wrists are thanking me for the decision. Some folks worried that using Emacs would be a cognitive drain on a CEO. Having taken Fugue from an idea in my backyard to a powerful product with great and enthusiastic customers, I find Emacs to be a solace from things that are actually difficult. I still use white backgrounds.

Recently, the post was rediscovered and posted to [HackerNews][4]. I got a number of requests to follow up with a post on how things have gone since, so this is that report. In this post, I will also focus on why Emacs and functional programming are highly relevant now; and how Emacs works with our product, Fugue, that uses functional programming to automate cloud computing. I received a lot of feedback that the level of detail and color commentary were useful, so this post is also fairly verbose and I do spend some effort on explaining my thinking. I've recently moved from the CEO to CTO role here at Fugue, but the content of this post reflects the work I have been doing as CEO. I expect to do more work in code with Emacs going forward, so I have some yak shaving ahead. As always, YMMV, caveat emptor, etc.

### It worked out better than I suspected it would

My time is filled with nearly constant communication outside of and within the company. Communication is how things get done in the world, and the enemy of reflection and real contemplation of difficult or complex problems. The rarest commodity for me as a startup CEO is time to focus without distraction. Emacs is particularly good for this, once you've invested the time to learn a handful of commands. Other applications call out to be noticed, but a well configured Emacs gets out of the way both visually and mentally. It doesn't change unless you want it to, and there is no cleaner interface than a blank screen and beautiful typography. In my world of constant interruption, this simplicity allows me to focus solely on what I am thinking rather than the computer. The best programs provide access to the computer without demanding attention.

A few folks pointed out that the original post was as much a criticism of modern computer interfaces as a recommendation of Emacs. I agree and disagree. Modern interfaces, and particularly their application-centric approach (vs. content-centric), are not user focused or task oriented. Emacs avoids this fallacy, which is part of why I like it so much, but it brings other merits to the table as well. Emacs is a portal into the power of the computer itself, and that is a rabbit hole worth descending. Its idioms are paths to discovering and creating your own, and that for me is the definition of creativity. One of the sad things about modern computing is that it is largely made up of black boxes with shiny interfaces that provide momentary gratification rather than real satisfaction. This makes us into consumers rather than creators/makers of technology. I don't care who you are or what your background is; you can understand your computer, and you can make things with it. It's fun, satisfying, and not as hard as you think to get started!

We often underappreciate the effects of our environments on our psychology. Emacs imparts a feeling of calm and freedom, rather than of urgency, annoyance, or excitement - the latter of which are enemies of thought and contemplation. I like things that last, get out of the way, and provide insight when I do take the time to pay attention to them. Emacs meets all these criteria for me. I use Emacs every day for content creation, and I'm very pleased with how little I think about it. Emacs does have a learning curve, but it's no steeper than a bicycle, and has a similar payoff in that once you are through it, you don't have to think about it anymore, and it imparts a feeling of freedom that other tools don't. It's an elegant tool, from a more civilized age. I'm happy that we seem to be entering another civilized age in computing, and so Emacs is gaining in popularity.

### I gave up on using Org-mode for schedules and to-do lists

I spent some words in the original post on using Org-mode for schedules. I gave up on using Org-mode for to dos and the like, as I have to coordinate many meetings and calls every day with dozens of people, and I cannot ask the rest of the world to adapt to my choice of tools, nor do I have the time to transcribe or automate moving things to Org. We are primarily a Mac shop, use Google Calendar etc., and the native Mac OS/iOS tools do a good job for collaboration. I also use a plain old pen for note-taking during meetings, as I find laptop/keyboard use in meetings to be rude and limiting to my ability to listen and think. Therefore I've largely abandoned the idea that Emacs/org can help me with my schedule or organizing my life. Org-mode is great for lots of other things too though, and is my go-to for writing documents, including this one. In other words, I use it largely in ways the author didn't intend, and it's great at them. I hope someone says the same of our work at Fugue someday.

### Emacs use has spread at Fugue

I started the original post with an admonition that you may love Emacs, but will probably hate it. I was therefore a little concerned when the documentation team at Fugue picked it as their standard tool, as I thought perhaps they were influenced by my appreciation for it. A couple years later, I'm pretty sure that it was a good call for them. The leader of the team at the time was a very bright programmer, but the two writers we hired to make the Fugue documentation had less technical backgrounds. I figured that if it was a case of a manager imposing the wrong tool, I'd hear about it and it would resolve itself, as Fugue has an anti-authoritarian culture where people are unafraid to call bullshit on anything or anyone, including me. The original manager left Fugue last year, but the docs team now has a slick, integrated CI/CD toolchain for [docs.fugue.co][5], and they've become enthusiastic Emacs users. There is a learning curve for Emacs, but it's not that tall even if it is steep, and climbing it has real benefits in productivity and general happiness. It was also a reminder that liberal arts focused people are every bit as smart and capable with technology as programmers, and perhaps less prone to technology religions and tribalism.

### My wrists are thanking me

I've been spending 12 hours a day or so at a computer since the mid-eighties, and it has taken a toll on my wrists (as well as my back, for which I unreservedly recommend the Tag Capisco chair). The combination of Emacs and an ergonomic keyboard has made the RSI wrist issues go away to the point that I haven't thought about it in over a year. Prior to that, I was having daily pain, particularly in my right wrist, and if you've had this issue, you know it can be very distracting and worrying. A few folks asked about keyboards and mice, so if you're interested I'm currently using a [keyboard.io][6] though I've mainly used a Truly Ergonomic keyboard over the last couple years. I'm a few weeks into using the keyboard.io, and I absolutely love it. The shaped key caps are amazing for knowing where you are without looking, and the thumb keys seem obvious in retrospect, particularly for Emacs, where Control and Meta are your constant companions. No more using the pinkie for highly repetitive tasks!

The amount of mousing I do is much lower than when using Office and IDEs, and that has helped a lot, but I do still need a mouse. I've been using the rather dated looking but highly functional and ergonomic Clearly Superior trackball, which lives up to its name.

Specific tools aside, the main point is that a great keyboard combined with mouse avoidance has proved very effective at reducing wear and tear on my body. Emacs is central to this because I don't have to mouse around menus to get things done, and the navigation keys are right under my fingers. I'm pretty convinced now that hand movement away from the standard typing position causes a lot of tendon stress for me. YMMV, I'm not a doctor, etc.

### I haven't done much to my config...

Some predicted that I'd spend a lot of time yak shaving my configuration. I wondered if they were right, so I paid attention. Not only have I left my config largely alone, paying attention to the issue has made me realize just how much the other tools I use demand my attention and time. Emacs is easily the lowest maintenance piece of software I use. Mac OS and Windows are constantly demanding that I update them, but that's far less intrusive than Adobe Suite and Office's update intrusions in my world. I do occasionally update my Emacs, but it still works the same way, so it's largely a near zero cost operation for me, and one I can choose to do when I please.

I'm sorry to disappoint, as a number of folks wanted to know what I've done to keep up with a renewed Emacs community and its output, but I've only added a few things to my config over the last two years. I consider this a success, as Emacs is a tool, not a hobby for me. That said, I'd love to hear about new things if you want to share.

### ...Except for controlling the cloud

We have a lot of Emacs fans at Fugue, so we've had a [Ludwig-mode][7] for a while now. Ludwig is our declarative, functional DSL for automating cloud infrastructure and services. Recently, Alex Schoof took some flight and evening hours to build fugue-mode, which acts as an Emacs console over the Fugue CLI. If you aren't familiar with Fugue, we make a cloud automation and governance tool that leverages functional programming to give users a great experience of interacting with cloud APIs. Well, it does a lot more than that, but it does that too. Fugue-mode is cool for a number of reasons. It allows me to have a buffer that is constantly reporting on the status of my cloud infrastructure, and since I often modify that infrastructure, I can quickly see the effects of my coding. Fugue organizes cloud workloads into processes, and Fugue-mode is a lot like top for cloud workloads. It also allows me to perform operations like creating new infrastructure or deleting stuff that isn't needed anymore, without much typing. Fugue-mode is a prototype, but it's pretty handy and I now use it regularly.

![fugue-mode-edited.gif][8]

### Modes and monitors

I have added a few modes and integrations, but not really for work/CEO functions. I've been hacking around in Haskell and Scheme on the weekends for fun, so I've added haskell-mode and geiser. Emacs is great for languages that have a REPL, as you can divide up your screen into different "windows" that are running different modes, including REPLs or shells. Geiser is great for Scheme, and if you've not done so, working through SICP is a joy and possibly a revelation in an age that has lots of examples of cargo cult programming. Install MIT Scheme and geiser and you've got something that feels a bit like the Symbolics environments of lore.

This brings up another topic I didn't cover in the 2015 post: screen management. I like to use a single portrait mode monitor for writing, and I have this configuration at my home and at my primary office. For programming or mixed use, I like the new ultra-wide monitors that we provide to all Fuguers. For these, I prefer to divide my screen into three columns, with the center having my main editing buffer, the left side having a shell and a fugue-mode buffer divided horizontally, and the right having either a documentation buffer or another editing buffer or two. This is easily done by first using 'Ctl-x 3' twice, then 'Ctl-x =' to make the windows equal in width. This will give you three equal columns that you can further subdivide as you like with 'Ctl-x 2' for horizontal divisions. Here's a screenshot of what this looks like.

![Emacs Screen Shot][9]

### This will be my last CEO/Emacs post...

The first reason for this is that I'm now the CTO of Fugue, but also because there are so many topics I'm looking forward to blogging about and now I should have time to do so. I'm planning on doing some deeper dive posts on topics like functional programming, type safety for infrastructure-as-code, and as we roll out some awesome new Fugue capabilities, some posts on what is achievable on the cloud using Fugue.

--------------------------------------------------------------------------------

via: https://www.fugue.co/blog/2018-08-09-two-years-with-emacs-as-a-cto.html

作者：[Josh Stella][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.fugue.co/blog/author/josh-stella
[b]: https://github.com/lujun9972
[1]: https://blog.fugue.co/2015-11-11-guide-to-emacs.html
[2]: https://www.reddit.com/r/emacs/comments/7efpkt/a_ceos_guide_to_emacs/
[3]: https://news.ycombinator.com/item?id=10642088
[4]: https://news.ycombinator.com/item?id=15753150
[5]: https://docs.fugue.co/
[6]: https://shop.keyboard.io/
[7]: https://github.com/fugue/ludwig-mode
[8]: https://www.fugue.co/hubfs/Imported_Blog_Media/fugue-mode-edited-1.gif
[9]: https://www.fugue.co/hs-fs/hubfs/Emacs%20Screen%20Shot.png?width=929&name=Emacs%20Screen%20Shot.png
