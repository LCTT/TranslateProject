[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The infrastructure is code: A story of COBOL and Go)
[#]: via: (https://opensource.com/article/19/8/command-line-heroes-cobol-golang)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg)

The infrastructure is code: A story of COBOL and Go
======
COBOL remains the dominant language of mainframes. What can Go learn
from its history to dominate the cloud?
![Listen to the Command Line Heroes Podcast][1]

Old challenges are new again. In [this week's Command Line Heroes podcast][2] (Season 3, Episode 5), that thought comes with a twist of programming languages and platforms.

### COBOL dominates the mainframe

One of the most brilliant minds in all of computer science is [Grace Murray Hopper][3]. Every time we don't have to write in binary to talk to computers, I recommend saying out loud: "Thank you, Rear Admiral Grace Murray Hopper." Try it next time, for she is the one who invented the first compiler (the software that translates programming code to machine language).

Hopper was essential to the invention and adoption of high-level programming languages, the first of which was COBOL. She helped create the **CO**mmon **B**usiness-**O**riented **L**anguage (COBOL for short) in 1959. As Ritika Trikha put it on [HackerRank][4]:

> "Grace Hopper, the mother of COBOL, helped champion the creation of this brand-new programming language that aimed to function across all business systems, saving an immense amount of time and money. Hopper was also the first to believe that programming languages should read just like English instead of computer jargon. Hence why COBOL's syntax is so wordy. But it helped humanize the computing process for businesses during an era when computing was intensive and prevalent only in research facilities."

In the early 1960s, mainframes were a wild new architecture for sharing powerful amounts of computation. And in the era of mainframe computing, COBOL dominated the landscape.

### COBOL in today's world

But what about today? With the decline of mainframes and the rise of newer and more innovative languages designed for the web and cloud, where does COBOL sit?

As last week's episode of Command Line Heroes mentioned, in the late 1990s, [Perl][5] (as well as JavaScript and C++) was outpacing COBOL. And, as Perl's creator, [Larry Wall stated then][6]: "COBOL is no big deal these days since demand for COBOL seems to be trailing off, for some strange reason."

Fast forward to 2019, and COBOL has far from "trailed off." As David Cassel wrote on [The New Stack][7] in 2017:

> "About 95% of ATM swipes use COBOL code, Reuters [reported in April][8], and the 58-year-old language even powers 80% of in-person transactions. In fact, Reuters calculates that there's still 220 billion lines of COBOL code currently being used in production today, and that every day, COBOL systems handle $3 trillion in commerce."

Given its continued significance in the business world, knowing COBOL can be a great career move. Top COBOL programmers can expect to [make six figures][9] due to the limited number of people who specialize in the language.

### Go dominates in the cloud, for now

That story of COBOL's early dominance rings a bell for me. If we survey the most influential projects of this cloud computing era, you'd be hard-pressed to miss Go sitting at the top of the pack. Kubernetes and much of its related technology—from Etcd to Prometheus—are written in Go. As [RedMonk explored][10] back in 2014:

> "Go's rapidly closing in on 1% of total commits and half a percent of projects and contributors. While the trend is obviously interesting, at first glance, numbers well under one percent look inconsequential relative to overall adoption. To provide some context, however, each of the most popular languages on Ohloh (C, C++, Java, JavaScript) only constitute ~10% of commits and ~5% of projects and contributors. **That means Go, a seemingly very minor player, is already used nearly one-tenth as much in FOSS as the most popular languages in existence**."

In two of my previous jobs, my team (re)wrote infrastructure software in Go to be part of this monumental wave. Influential projects continue to live in the space that Go can fill, as [Uday Hiwarale explained][11] well in 2018:

> "Things that make Go a great language [are] its simple concurrency model, its package-based code management, and its non-strict (type inference) typing system. Go does not support out-of-the box object-oriented programming experience, but [its] support structures (structs) …, with the help of methods and pointers, can help us achieve the same [outcomes]."

It looks to me like Go could be following in COBOL's footsteps, but questions remain about where it's going. In June 2019, [RedMonk ranked][12] Go in 16th place, with a future that could lead either direction.

### What can Go learn from COBOL?

If Go were to see into its future, would it look like COBOL's, with such staying power?

The stories told this season by Command Line Heroes illustrate how languages are born, how communities form around them, how they rise in popularity and standardize, and how some slowly decline. What can we learn about the lifespan of programming languages? Do they have a similar arc? Or do they differ?

I think this podcast is well worth [subscribing so that you don't miss a single one][2]. I would love to hear your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/command-line-heroes-cobol-golang

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command-line-heroes-520x292.png?itok=s_F6YEoS (Listen to the Command Line Heroes Podcast)
[2]: https://www.redhat.com/en/command-line-heroes
[3]: https://www.biography.com/scientist/grace-hopper
[4]: https://blog.hackerrank.com/the-inevitable-return-of-cobol/
[5]: https://opensource.com/article/19/8/command-line-heroes-perl
[6]: http://www.wall.org/~larry/onion3/talk.html
[7]: https://thenewstack.io/cobol-everywhere-will-maintain/
[8]: http://fingfx.thomsonreuters.com/gfx/rngs/USA-BANKS-COBOL/010040KH18J/index.html
[9]: https://www.laserfiche.com/ecmblog/looking-job-hows-your-cobol/
[10]: https://redmonk.com/dberkholz/2014/03/18/go-the-emerging-language-of-cloud-infrastructure/
[11]: https://medium.com/rungo/introduction-to-go-programming-language-golang-89d16ca72bbf
[12]: https://redmonk.com/sogrady/2019/07/18/language-rankings-6-19/
