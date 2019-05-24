Why I love technical debt
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUS_lovemoneyglory1.png?itok=nbSRovsj)
This is not necessarily the title you'd expect for an article, I guess,* but I'm a fan of [technical debt][1]. There are two reasons for this: a Bad Reason and a Good Reason. I'll be upfront about the Bad Reason first, then explain why even that isn't really a reason to love it. I'll then tackle the Good Reason, and you'll nod along in agreement.

### The Bad Reason I love technical debt

We'll get this out of the way, then, shall we? The Bad Reason is that, well, there's just lots of it, it's interesting, it keeps me in a job, and it always provides a reason, as a security architect, for me to get involved in** projects that might give me something new to look at. I suppose those aren't all bad things. It can also be a bit depressing, because there's always so much of it, it's not always interesting, and sometimes I need to get involved even when I might have better things to do.

And what's worse is that it almost always seems to be security-related, and it's always there. That's the bad part.

Security, we all know, is the piece that so often gets left out, or tacked on at the end, or done in half the time it deserves, or done by people who have half an idea, but don't quite fully grasp it. I should be clear at this point: I'm not saying that this last reason is those people's fault. That people know they need security is fantastic. If we (the security folks) or we (the organization) haven't done a good enough job in making sufficient security resources--whether people, training, or visibility--available to those people who need it, the fact that they're trying is great and something we can work on. Let's call that a positive. Or at least a reason for hope.***

### The Good Reason I love technical debt

Let's get on to the other reason: the legitimate reason. I love technical debt when it's named.

What does that mean?

We all get that technical debt is a bad thing. It's what happens when you make decisions for pragmatic reasons that are likely to come back and bite you later in a project's lifecycle. Here are a few classic examples that relate to security:

  * Not getting around to applying authentication or authorization controls on APIs that might, at some point, be public.
  * Lumping capabilities together so it's difficult to separate out appropriate roles later on.
  * Hard-coding roles in ways that don't allow for customisation by people who may use your application in different ways from those you initially considered.
  * Hard-coding cipher suites for cryptographic protocols, rather than putting them in a config file where they can be changed or selected later.



There are lots more, of course, but those are just a few that jump out at me and that I've seen over the years. Technical debt means making decisions that will mean more work later on to fix them. And that can't be good, can it?

There are two words in the preceding paragraphs that should make us happy: they are "decisions" and "pragmatic." Because, in order for something to be named technical debt, I'd argue, it has to have been subject to conscious decision-making, and trade-offs must have been made--hopefully for rational reasons. Those reasons may be many and various--lack of qualified resources; project deadlines; lack of sufficient requirement definition--but if they've been made consciously, then the technical debt can be named, and if technical debt can be named, it can be documented.

And if it's documented, we're halfway there. As a security guy, I know that I can't force everything that goes out of the door to meet all the requirements I'd like--but the same goes for the high availability gal, the UX team, the performance folks, etc.

What we need--what we all need--is for documentation to exist about why decisions were made, because when we return to the problem we'll know it was thought about. And, what's more, the recording of that information might even make it into product documentation. "This API is designed to be used in a protected environment and should not be exposed on the public Internet" is a great piece of documentation. It may not be what a customer is looking for, but at least they know how to deploy the product, and, crucially, it's an opportunity for them to come back to the product manager and say, "We'd really like to deploy that particular API in this way. Could you please add this as a feature request?" Product managers like that. Very much.****

The best thing, though, is not just that named technical debt is visible technical debt, but that if you encourage your developers to document the decisions in code,***** then there's a decent chance that they'll record some ideas about how this should be done in the future. If you're really lucky, they might even add some hooks in the code to make it easier (an "auth" parameter on the API, which is unused in the current version, but will make API compatibility so much simpler in new releases; or cipher entry in the config file that currently only accepts one option, but is at least checked by the code).

I've been a bit disingenuous, I know, by defining technical debt as named technical debt. But honestly, if it's not named, then you can't know what it is, and until you know what it is, you can't fix it.******* My advice is this: when you're doing a release close-down (or in your weekly standup--EVERY weekly standup), have an agenda item to record technical debt. Name it, document it, be proud, sleep at night.

* Well, apart from the obvious clickbait reason--for which I'm (a little) sorry.

** I nearly wrote "poke my nose into."

*** Work with me here.

**** If you're software engineer/coder/hacker, here's a piece of advice: Learn to talk to product managers like real people, and treat them nicely. They (the better ones, at least) are invaluable allies when you need to prioritize features or have tricky trade-offs to make.

***** Do this. Just do it. Documentation that isn't at least mirrored in code isn't real documentation.******

****** Don't believe me? Talk to developers. "Who reads product documentation?" "Oh, the spec? I skimmed it. A few releases back. I think." "I looked in the header file; couldn't see it there."

******* Or decide not to fix it, which may also be an entirely appropriate decision.

This article originally appeared on [Alice, Eve, and Bob - a security blog][2] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/why-i-love-technical-debt

作者：[Mike Bursell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://en.wikipedia.org/wiki/Technical_debt
[2]:https://aliceevebob.wordpress.com/2017/08/29/why-i-love-technical-debt/
