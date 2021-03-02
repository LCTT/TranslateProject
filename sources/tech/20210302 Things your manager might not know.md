[#]: subject: (Things your manager might not know)
[#]: via: (https://jvns.ca/blog/things-your-manager-might-not-know/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Things your manager might not know
======

When people talk about “managing up”, sometimes it’s framed as a bad thing – massaging the ego of people in charge so that they treat you well.

In my experience, managing up is usually a lot more practical. Your manager doesn’t (and can’t!) know every single detail about what you do in your job, and being aware of what they might not know and giving them the information they need to do their job well makes everyone’s job a lot easier.

Here are the facts your manager might not know about you and your team that we’ll cover in this post:

  * What’s slowing the team down
  * Exactly what individual people on the team are working on
  * Where the technical debt is
  * How to help you get better at your job
  * What your goals are
  * What issues they should be escalating
  * What extra work you’re doing
  * How compensation/promotions work at the company



For each one, I’ll give specific ways you can help get them the information they need. All of these ways you can help them will also help you – it’s not just an altruistic endeavor :)

This post (like all my writing about working with a manager) assumes that you generally have a good relationship with your manager.

### your manager can’t know every detail about your job

I said this already, but I want to reiterate it: the reason your manager doesn’t know all these things isn’t because they’re not doing their job. It’s literally impossible for them to keep track of every detail about every person’s on their team’s job. It’s normal for managers to rely on their team to keep them informed about important facts they need to know, especially with more senior engineers.

Keeping them informed helps them do their job better, and it makes your job a lot easier too. Let’s talk about how that works!

### they might not know: what’s slowing the team down

Sometimes, you’re working on a project and the project is going more slowly than you hoped. There are always reasons for this – maybe there have been a lot more bugs than you expected, maybe you’re using a new technology nobody on the team has ever used before, maybe you’re waiting for another team to do something. The reasons things are hard change a lot! Even if your manager knew what was slowing you down 2 weeks ago, maybe that issue has been totally resolved and you’re onto a totally different problem.

It’s a problem if your manager doesn’t know this mostly because if they know why you’re stuck, they might be able to help.

### what you can do to help: tell them what’s hard about your job

It can feel bad to admit that you’re having trouble with something, but tasks usually aren’t hard because you’re “slow” or “bad at your job”. Usually it’s because there’s something concrete that’s making it hard. Identifying what that thing is and telling your manager about it helps them a lot!

For example, maybe you’re working on a feature and it’s turning out to be MUCH more complicated than you expected because there are a lot of edge cases that nobody had thought about. It’s useful for your manager to know that because sometimes they can help address it! They might:

  * Encourage you to take the time you need to figure it out (“it’s really important to get all these edge cases right, I’m happy you’re doing this!”)
  * Suggest someone who could help you (“Ankita was dealing with those exact issues last year, you should talk to her!”)
  * Factor it into their planning (“Sounds like that won’t get done this week then, good to know”)
  * Deprioritize the feature (“Oh, I thought this was going to be a quick fix, if this is really complicated we should focus our energy on something else instead”)



### they might not know: exactly what individual people on the team are working on

Your manager almost certainly knows what the team as a whole is working on (maybe you’re working on releasing some new site), but do they know that today you’re working on getting a TLS certificate issued for the site and learning how CAs work? Maybe not!

The reason this is a problem for them is that someone might ask them “hey Manager, did your team get that TLS certificate yet?”, and it looks bad for them to not know the answer, or not be able to easily find out.

### what you can do to help: keep them informed about your progress

You can ask your manager how they like to stay updated about what the team is doing: maybe they want to track everything through the issue tracker, maybe they want folks to write weekly digest, or maybe they have a different system.

If your team uses an issue tracker, taking a few minutes to keep it up to date can really help your manager keep a handle on what’s going on! If they can quickly look at the TLS ticket and see that you’re still working on it, that saves them a lot of time and means that you can spend your 1:1s discussing more important and interesting things than “hey, are you done with that TLS ticket?”.

### they might not know: where the technical debt is

Your manager probably broadly understands what technology your team is using. But, especially if they’ve never worked as a software engineer on your specific team, they probably don’t know that much about the details! They may not completely understand the problems you’re having with your current architecture, or which systems are going to fail soon. They rely on you for that.

And it’s important for them to know about things like technical debt: if you have a system that isn’t going to meet your current scaling needs soon and is going to need a lot of work, that needs to get factored into planning!

### what you can do to help: tell them about technical risks!

A couple of examples of things you can tell them about:

  * technical debt that’s slowing you down when building new features
  * systems that are causing a lot of disruption because they’re unreliable



### they might not know: how to help you get better at your job

When I started out, I often felt like there were things I could be doing differently to do my job better. And that was definitely true! So I was sometimes confused about why my manager wasn’t giving me feedback about how I could be doing things better.

The reality is that in most cases, you probably know how to do your job better than your manager does! You’ve spent a lot more time thinking about the projects you’re working on, and they definitely can’t just parachute in and tell you how to improve. Of course, there are lots of times when your manager does have useful advice for you, but it’s not easy for them to figure out how to give it to you! Here are a few reasons why:

  1. They don’t necessarily even know what you’re struggling with in the first place (like we talked about in the last article)
  2. Even if they do know, it might not be obvious to them what they can do to improve the situation. Some managers are of course better at figuring this out than others – it’s not easy!



### what you can do to help: identify what you need and ask for it!

Managers often LOVE it when you ask them for something that they can do that will help you. Here are a few examples of things you could ask for:

  * **less work**: maybe you’re doing 3 projects and it’s too much and it’s making all of 3 projects go slowly, and you need to only be working on 2 things.
  * **harder work**: maybe you don’t feel like you’re learning anything with your current work and you want to work on something that’s more of a challenge
  * **a learning budget**: you’re learning about some new technology, and you think going to a conference will really help you, and you want a couple of days off and the budget to buy a ticket.
  * **help with an interpersonal situation**: maybe you’re having a little bit of trouble working with someone else on the team, and you need some advice to understand what’s going on with that person and how to work with them more effectively.
  * **specific feedback on work you did**: asking for feedback on a specific piece of work you did (“hey, do you have any feedback on that migration we did?“) is MUCH more effective than just asking “do you have any feedback for me?”.



Learning how to do this well takes a lot of practice – if you want to improve something about your job, it can be hard to break that down into “ok, the problem is X” and it’s even harder to identify something specific somebody else could do to address the problem. But if you can do it it’s WAY easier to get what you want and good managers will be delighted to help you!

It’s also **definitely** okay to bring up problems when you don’t specifically know what you need – if you’re not sure how to solve the problem you can explore possible solutions together!

### more you can do to help: tell them your goals!

“Get better at your job” also means different things to different people. So if you have a specific career goal, it’s important to tell it to your manager! For example if you want to become an architect / team lead / manager one day, tell them that! Ask them what skills they think you’ll need to build to get there! Good managers will be delighted to talk to you about this, figure out what you need to do, and [sponsor][1] your work to help you get opportunities.

### they might not know: what issues they should be escalating

Sometimes issues come up on the team that should actually be dealt with by someone higher up and that you can’t easily fix on your own. A few examples:

  * You’re in a negotiation with a vendor and it’s not going well (vendor negotiations happen infrequently and they can be really tricky to handle for anyone!)
  * You’re stuck because of a conflict in priorities between teams (your team needs another team to be doing X, but the other team thinks that the priority is Y).



It’s bad to try to handle issues you don’t have the power to fix on your own because it’ll take forever, it’ll be frustrating for you, and you won’t be able to make progress.

### what you can do: practice escalating issues!

It’s usually not totally clear which things are part of your job and which things you should be escalating to your manager. The best way to get better at identifying what should be escalated is to ask your manager about it when you notice an issue you’re really struggling with! Eventually you’ll learn what kinds of issues should be escalated and which ones you should tackle on your own.

Identifying which things you should be escalating to your manager (“hey, I think you should know about this…”) isn’t easy, but it’s really a win/win when you can do it – if you escalate it to them, you’re no longer stuck trying to deal with an issue that’s impossible for you to fix, and they can make sure it gets done by people who actually have the power to do it.

### they might not know: what extra work you’re doing

If you’re doing a bunch of extra work outside your normal job description, your manager might not realize that! It’s important to bring it up with your manager so that they can give you credit for that work (put it in your [brag document][2]!).

Sometimes there’s also extra work you’re doing that you shouldn’t be doing (like in the previous section, maybe it’s something that should be escalated!), and in those cases telling them can help you stop doing the work.

### they might not know: how the company’s compensation and promotions systems work

This one is a little different from the others because you’re not going to be giving your manager information about this in the same way, but it’s important to be aware of.

I used to think that managers knew everything about compensation / promotions. Then one day I had a really enlightening conversation with my old manager Jay where I was asking a question about how compensation worked, and he said “yeah, I don’t know!”.

I really appreciated how honest he was about it, and it made me realise that there are a LOT of things a manager might not know about how these systems work, like:

  * what the system for issuing stock refreshes is
  * how raises are calculated when someone gets promoted
  * what’s actually expected for a promotion to a given level, and whether or not it’s the same as what’s written down
  * whether / why exceptions are made to the rules
  * the basic facts about your compensation (I’ve had jobs where managers knew my salary but not what my stock grants were. Apparently this is pretty common!)



### what you can do to help: ask about how compensation works!

I’ve found it really valuable to start out conversations about compensation / promotions in a fact-finding way – instead of saying ”hello, i want a raise”, it’s a lot easier for everyone to start with “hey, how does this work? can you explain it to me?”.

This can be especially helpful to new managers because even if they don’t know the answers right away, they can often find out! So if you ask, it’s an opportunity for them to go figure out how these systems work.

You can also get general information about how compensation and promotions work from other managers who are not your manager, if there’s a different manager you have a good relationship who you’d rather have that conversation with.

### Some other sources of uncertainty

There are also a lot of other things your manager might be uncertain about:

  * They don’t know how priorities are going to change in the future – if there’s a surprise change in priorities, often it’s a surprise to them too!
  * They might not know if they’re going to get headcount / how to get headcount: if you’re stressed because your team is overloaded and you’d love to hire someone, they might need to figure out how to get permission to do that themselves
  * They may not know how _they’re_ performing. If they’re uncertain about how their next performance review is going to come back or if they just got a bad review, sometimes that uncertainty/stress can trickle down in weird ways. People are human! I think this is good to be aware of as a possible explanation for weird behaviour even if usually they won’t tell you that this is happening.



### If you get good at this, it’s a superpower

Being good at telling your manager the right information at the right time and asking for what you need is a superpower. It makes you way more valuable to have on a team (because your manager knows they can trust you to give them the information they need), and it’s more likely that you’ll get what you want (because you’re making it easy for them to do that!).

This skill takes a lot of time to learn but it’s pretty easy to practice. You can take a few minutes to reflect before your 1:1 with your manager and think about what might be important to bring up with them.

The great thing about all of this is that you don’t have to guess: if you’re curious about what your manager knows about a given topic or how you can help get them the information they need, you can just ask them!

If you want to read more about how to build a good relationship with your manager, I wrote a zine called [Help! I Have a Manager!][3] about it.

Thanks to Jay Shirley for coming up with the idea for this post with me, and to Akiva Leffert, Allison Kaptur, Camille Fournier, Chirag Davé, Duretti Hirpa, Evy Kassirer, Jay Shirley, Juan Pablo Buriticá, Kamal Marhubi, Marc Hedlund, Marco Rogers, and Ronnie Chen for their comments which made it a lot better. All the problems with it are mine of course :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/things-your-manager-might-not-know/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://larahogan.me/blog/what-sponsorship-looks-like/
[2]: https://jvns.ca/blog/brag-documents/
[3]: https://wizardzines.com/zines/manager/
