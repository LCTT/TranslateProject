[translating by KayGuoWhu]
When hackers grow old
================================================================================
Lately I’ve been wrestling with various members of an ancient and venerable open-source development group which I am not going to name, though people who regularly follow my adventures will probably guess which one it is by the time I’m done venting.

Why it so freaking hard to drag some people into the 21st century? Sigh…

I’m almost 56, an age at which a lot of younger people expect me to issue semi-regular salvos of get-off-my-lawn ranting at them. But no – I find, that, especially in technical contexts, I am far more likely to become impatient with my age peers.

A lot of them really have become grouchy, hidebound old farts. And, alas, it not infrequently falls to me to be the person who barges in and points out that practices well-adapted for 1995 (or, in the particular case I’m thinking of, 1985) are … not good things to hold on to decades later.

Why me? Because the kids have little or no cred with a lot of my age peers. If anyone’s going to get them to change, it has to be someone who is their peer in their own perception. Even so, I spend a lot more time than seems just or right fighting inertia.

Young people can be forgiven for lacking a clue. They’re young. Young means little experience, which often leads to unsound judgment. It’s more difficult for me to forgive people who have been around the track often enough that they should have a clue, but are so attached to The Way It’s Always Been Done that they can’t see what is in front of their freaking noses.

(News flash: I really don’t have a conservative temperament. I find it wryly amusing how often both conservatives and non-conservatives who argue politics with me fail to notice this.)

OK, now let’s talk about GNU ChangeLog files. They were a fine idea, a necessary one even, in 1985. The idea was to use a single ChangeLog entry to document a group of related changes to multiple files. This was a reasonable adaptation to absent or extremely primitive version control. I know this because I was there.

Even in 1995, or as late as the early 2000s, many version control systems didn’t have changesets. That is, there was no or only weak support for grouping multiple file modifications into a single retrievable object with a comment attached to the object rather than to individual file modifications. CVS, the system in widest use then, only faked changesets – and did it so badly that many people felt they couldn’t rely on that feature. ChangeLog files still made some functional sense.

But then Subversion – with real changesets – achieved wide acceptance through its beta releases around 2003 and its 1.0 in 2004. It should have been obvious then, even before the new wave of DVCSes that began a year later, that there was a culture clash a comin’. Because if your project both has a DVCS and uses the ChangeLog convention, they’re fighting for control of the same metadata.

There are different ways you can adapt. One is to continue to treat the ChangeLogs as the authoritative record of the evolution of the code. In that case, you tend to get stubby or pro-forma commit comments.

Another is to treat the commit comment log as authoritative. If you do that, you soon begin to wonder why you’re still writing ChangeLog entries at all. The commit metadata has better coherence with the code changes, after all – that’s what it’s designed for.

(Now imagine a project in which, with the best of intentions, different people are making opposite choices out of these two. Now you have to read both the ChangeLogs and the commit logs to know what’s going on. Friction costs are rising…)

A third is to try to have it both ways – duplicating commit comment data in a slightly different format in a ChangeLog entry that’s part of the commit. This has all the problems you’d expect with a representation in which there is no single point of truth; one copy gets garbled, or the ChangeLog entry gets modified so that it’s no longer in sync with the allegedly matching commit data, and life gets very confusing for anyone who comes along later and tries to figure out what people were thinking.

Or, as a senior dev on a Certain Project I Won’t Name just did in email, declaring that commits can include multiple ChangeLog entries and the commit metadata is irrelevant to the Changelogs. Which we still have to write.

My eyes crossed and my gorge rose when I read that. What kind of fool fails to realize that this is begging for trouble – that, actually, the whole edifice of custom around ChangeLog files is just dead weight and friction drag in a DVCS world with good browsing tools for reliable commit logs?

Alas, it’s a very particular kind of fool: a hacker who has grown old and rigid. All the rationalizations he will ever utter fail to hide this. He’s attached to tactics that made sense a decade ago but have become counterproductive ceremonies now. If you tried to explain not just about git summary lines but that the correct adaptation for current toolsets is to scrap ChangeLogs entirely … well, that would be insupportable, inconceivable, and just crazy talk.

Functionally this infuriates me. It is substantially harder to work on that project because of this and related nonsense. And, as badly as it happens to need young developers, that’s a real problem. It has a G+ community well into 4 digits, they’re mostly kids, and they’re not stepping up. Evidently the message has been received on the outside; the devs on this project are ancient mossbacks with inexplicable tribal fixations, and best admired from a good long distance.

What gives this extra emotional edge for me is that whenever I have to butt heads with a mossback, I keep wondering: will I be like this someday? Worse, am I looking in a mirror, already rigidified and not knowing it? I mean, I get the impression from his web presence that this particular specimen is younger than me. By a good fifteen years.

I feel mentally agile. I don’t get frustrated by people moving faster than I can handle, I get frustrated by people who can’t keep up with me, who can’t see the obvious. But this self-belief could be just a bad case of Dunning-Krueger effect biting me where I least understand it. Very few things terrify me; this possibility is high on the short list.

A separately disconcerting thing is that as I get older this sort of collision is happening more often rather than less. Somehow I expected my hacker peers to age more gracefully, to retain their neotenous flexibility even if they were physically aging. Some do indeed seem to be going that way; too many, alas, are not. It is a sadness.

I’m not sure I have a good finish for this. If I’ve escaped mentally rigidifying (and that’s an if) I think I know at least in part why, but I’m very unsure whether it can be generally replicated – you might need to have a wired-in brain chemistry that matches the strategy. Nevertheless, for whatever it’s worth, here is my advice to young hackers and indeed the young of all kinds.

You – yes, even you – cannot count on retaining your mental flexibility into middle and old unless you work at it. You have to practice busting out of comfortable mental grooves and regularly checking your assumptions when you’re young, and you have to develop a habit of it that sustains into old age.

It’s said that the best time for a middle-aged person to start (physically) exercising is thirty years ago. I think the same goes for the habits that might (might!) keep you mentally agile at 56, or 65. Push your envelope. Develop the regular practice of challenging yourself and exiting your comfort zone now so you’ll have it established when you really need it.

You have to be realistic about this; there’s an optimal-challenge level where you choose an attainable goal and work mentally hard for it. This month I’m going to learn go. Not the game, I already play that (though not very well); the programming language. Not because I really need to for a specific project, but because it’s time to stretch myself.

Develop that habit. And never let it go.

--------------------------------------------------------------------------------

via: http://esr.ibiblio.org/?p=6485

作者：[Eric Raymond][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://esr.ibiblio.org/?author=2