Tech jargon: The good, the bad, and the ugly
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/change_words_scrabble_letters.jpg?itok=mbRFmPJ1)

One enduring and complex piece of jargon is the use of "free" in relation to software. In fact, the term is so ambiguous that different terms have evolved to describe some of the variants—open source, FOSS, and even phrases such as "free as in speech, not as in beer." But surely this is a good thing, right? We know what we mean; we're sharing shorthand by using a particular word in a particular way. Some people might not understand, and there's some ambiguity. But does that matter?

### A couple of definitions

I was involved in an interesting discussion with colleagues recently about the joys (or otherwise) of jargon. It stemmed from a section I wrote in a recent article, [How to talk to security people: a guide for the rest of us][1], where I said:

> "Jargon has at least two uses:
>
>   1. as an exclusionary mechanism for groups to keep non-members in the dark;
>   2. as a short-hand to exchange information between 'in-the-know' people so that they don't need to explain everything in exhaustive detail every time."
>


Given the discussion that arose, I thought it was worth delving more deeply into this question. It's more than an idle interest, as I think there are important lessons around our use of jargon that impact how we interact with our colleagues and peers that deserve some careful thought. These lessons apply particularly to my chosen field, security.

Before we start, we should define "jargon". It's always nice to have two conflicting versions, so here we go:

  * "Special words or expressions used by a profession or group that are difficult for others to understand." ([Oxford Living Dictionaries][2])
  * "Without a qualifier, denotes informal 'slangy' language peculiar to or predominantly found among hackers." ([The Jargon File][3])



I should start by pointing out that The Jargon File, which was published in paper form in at least [two versions][4] as The Hacker's Dictionary (ed. Steele) and The New Hacker's Dictionary (ed. Raymond), has a pretty special place in my heart. When I decided that I wanted to properly "take up" geekery,1,2 I read The New Hacker's Dictionary from cover to cover, several times, and when a new edition came out, I bought that and did the same.

In fact, for more technical readers, I suspect that a fair amount of your cultural background is expressed within its covers (paper or virtual), even if you're not aware of it. If you're interested in delving deeper and like the feel of paper in your hands, I encourage you to purchase a copy—but be careful to get the right one. There are some expensive versions that seem just to be printouts of The Jargon File, rather than properly typeset and edited versions.3

But let's get onto the meat of this article: is jargon a force for good or ill?

### First: Why jargon is good

The case for jargon is quite simple. We need jargon to enable us to discuss concepts and the use of terms in normal language—like scheduling—as jargon leads to some interesting metaphors that guide us in our practice.4 We absolutely need shared practice, and for that we need shared language—and some of that language is bound to become jargon over time. But consider a lexicon, or an FAQ, or other ways to allow your colleagues to participate: be inclusive, not exclusive. That's the good. The problem, however, is the bad.

### The case against jargon: Ambiguity

You would think jargon would serve to provide agreed terms within a particular discipline and help prevent ambiguity around contexts. It may be a surprise, then, that the first problem we often run into with jargon is namespace clashes. Consider the following. There's an old joke about how to distinguish an electrical engineer from a humanities5 graduate: ask them how many syllables are in the word "coax." The point here, of course, is that they come from different disciplines. But there are lots of words—and particularly abbreviations—that have different meanings or expansions depending on context and where disciplines and contexts may collide.

What do these words mean to you?6

  * Scheduling: kernel-level CPU allocation to processes OR placement of workloads by an orchestration component
  * Comms: I/O in a computer system OR marketing/analyst communications
  * Layer: OSI model OR IP suite layer OR another architectural abstraction layer such as host or workload
  * SME: subject matter expert OR small/medium enterprise
  * SMB: small/medium business OR small message block
  * TLS: transport layer security OR Times Literary Supplement
  * IP: internet protocol OR intellectual property OR intellectual property as expressed as a silicon component block
  * FFS for further study OR …7



One of the interesting things is that quite a lot of my background is betrayed by the various options that present themselves to me. I wonder how many readers will have thought of the Times Literary Supplement, for example. I'm also more likely to think of SME as the term relating to organisations, because that's the favoured form in Europe, whereas I believe that the US tends to SMB. I'm sure your experiences will all be different—which rather makes my point for me.

That's the first problem. In a context where jargon is often praised as a way of shortcutting lengthy explanations, it can actually be a significant ambiguating force.

### The case against jargon: Exclusion

Intentionally or not—and sometimes it is intentional—groups define themselves through the use of specific terminology. Once this terminology becomes opaque to those outside the group, it becomes "jargon," as per our first definition above. "Good" use of jargon generally allows those within the group to converse using shared context around concepts that do not need to be explained in detail every time they are used.

An example would be a "smoke test"—a quick test to check that basic functionality is performing correctly (see the Jargon File's [definition][5] for more). If everyone in the group understands what this means, then why go into more detail? But if you are joined at a stand-up meeting8 by a member of marketing who wants to know whether a particular build is ready for release, and you say "well, no—it's only been smoke-tested so far," then it's likely you'll need to explain.

The problem is that there are occasions when jargon can exclude others, whether that usage is intended or not. There have been times for most of us, I'm sure, when we want to show we're part of a group, so we use terms that we know another person won't understand. On other occasions, the term may be so ingrained in our practice that we use it without thinking, and the other person is unintentionally excluded. I would argue that we need to be careful to avoid both of these uses.

Intentional exclusion is rarely helpful, but unintentional exclusion can be just as damaging—in some ways more so, as it is typically unremarked and therefore difficult to remedy.

### What to do?

First, be aware when you're using jargon, and try to foster an environment where people feel happy to query what you mean. If you see people's eyes glazing over, take a step back and explain the context and the term. Second, be on the lookout for ambiguity: if you're on a project where something can mean more than one thing, disambiguate somewhere in a file or diagram that everyone can access and is easily discoverable. And last, don't use jargon to exclude. We need all the people we can get, so let's bring them in, not push them out.

1\. "Properly"—really? Although I'm not sure "improperly" is any better.

2\. I studied English Literature and Theology at university, so this was a conscious decision to embrace a rather different culture.

3\. The most recent "real" edition of which I'm aware is Raymond, Eric S., 1996, [The New Hacker's Dictionary][6], 3rd ed., MIT University Press, Cambridge, Mass.

4\. Although metaphors can themselves be constraining as they tend to push us to think in a particular way, even if that way isn't entirely applicable in this context.

5\. Or "liberal arts".

6\. I've added the first options that spring to mind when I come across them—I'm aware there are almost certainly others.

7\. Believe me, when I saw this abbreviation in a research paper for the first time, I was most confused and had to look it up.

8\. Oh, look: jargon…

This article originally appeared on [Alice, Eve, and Bob – a security blog][7] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/tech-jargon

作者：[Mike Bursell][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:http://aliceevebob.com/2018/05/08/how-to-talk-to-security-people-a-guide-for-the-rest-of-us/
[2]:https://en.oxforddictionaries.com/definition/jargon
[3]:http://catb.org/jargon/html/distinctions.html
[4]:https://en.wikipedia.org/wiki/Jargon_File
[5]:http://catb.org/jargon/html/S/smoke-test.html
[6]:https://www.amazon.com/New-Hackers-Dictionary-3rd/dp/0262680920
[7]:https://aliceevebob.com/2018/06/26/jargon-a-force-for-good-or-ill/
