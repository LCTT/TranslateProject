The long goodbye to C
============================================================

I was thinking a couple of days ago about the new wave of systems languages now challenging C for its place at the top of the systems-programming heap – Go and Rust, in particular. I reached a startling realization – I have 35 years of experience in C. I write C code pretty much every week, but I can no longer remember when I last  _started a new project_  in C!

If this seems completely un-startling to you, you’re not a systems programmer. Yes, I know there are a lot of you out there beavering away at much higher-level languages. But I spend most of my time down in the guts of things like NTPsec and GPSD and giflib. Mastery of C has been one of the defining skills of my specialty for decades. And now, not only do I not use C for new code, I can’t clearly remember when I stopped doing so. And…looking back, I don’t think it was in this century.

That’s a helluva thing to have sneak up on me when “C expert” is one of the things you’d be most likely to hear if you asked me for my five most central software technical skills. It prompts some thought, it does. What future does C have? Could we already be living in a COBOL-like aftermath of C’s greatest days?

I started to program just a few years before the explosive spread of C swamped assembler and pretty much every other compiled language out of mainstream existence. I’d put that transition between about 1982 and 1985\. Before that, there were multiple compiled languages vying for a working programmer’s attention, with no clear leader among them; after, most of the minor ones were simply wiped out. The majors (FORTRAN, Pascal, COBOL) were either confined to legacy code, retreated to single-platform fortresses, or simply ran on inertia under increasing pressure from C around the edges of their domains.

Then it stayed that way for nearly thirty years. Yes, there was motion in applications programming; Java, Perl, Python, and various less successful contenders. Early on these affected what I did very little, in large part because their runtime overhead was too high for practicality on the hardware of the time. Then, of course, there was the lock-in effect of C’s success; to link to any of the vast mass of pre-existing C you had to write new code in C (several scripting languages tried to break that barrier, but only Python would have significant success at it).

In retrospect I should have been alert to the larger implications when I first found myself, in 1997, writing a significant application in a scripting language. It was a librarian’s assistant for an early source-code distribution hub called Sunsite; the language was Perl.

This application was all text-bashing that only needed to respond at human speed (on the close order of 0.1s), and so was obviously silly to do in C or any other language without dynamic allocation and a real string type. But I thought of it as an experiment and would not have predicted at the time that almost never again would I type “int main(int argc, char **argv)” into the first file of a new project.

I say “almost” mainly because of [SNG][3] in 1999\. I think that was my last fresh start in C; all the new C I wrote after that was for projects with a 20th-century history in C that I was contributing to or became the maintainer of – like GPSD or NTPsec.

By the time I wrote SNG in C I really shouldn’t have. Because what was happening in the background was that the relentless cycling of Moore’s Law had driven the cost of compute cycles cheap enough to make the runtime overhead of a language like Perl a non-issue. As little as three years later, I would have not have hesitated before writing SNG in Python rather than C.

Learning Python in 1997 was quite the watershed event for me. It was wonderful – like having the Lisp of my earliest years back, but with good libraries! And a full POSIX binding! And an object system that didn’t suck! Python didn’t drove C out of my toolkit, but I quickly learned to write Python when I could and C only when I must.

(It was after this that I began to feature what I called “the harsh lesson of Perl” in my talks – that is, any new language that ships without a full POSIX binding semantically equivalent to C’s  _will fail._ . CS history is littered with the corpses of academic languages whose authors did not grasp this necessity.)

It might be too obvious to need saying, but a major part of Python’s pull was simply that when writing in it I never had to worry about the memory-management problems and core-dump crashes that are such wearying regular a part of a C programmer’s life. The unobvious thing is the timing – in the late 1990s the cost-vs.risk tradeoff in applications and the kind of non-kernel system-service code I usually write definitively tilted towards paying the overhead of a language with automatic management in order to eliminate that class of defects. Not long before that (certainly as late as 1990) that overhead was very often unaffordable; Moore’s law hadn’t cranked enough cycles yet.

Preferring Python over C – and migrating C code to Python whenever I could get away with it was a spectacularly successful complexity-reduction strategy. I began to apply it in GPSD and did it systematically in NTPsec. This was a significant part of how we were able to cut the bulk of the NTP codebase by a factor of four.

But I’m not here to talk about Python today. It didn’t have to be Python that ended my use of C in new programs by 2000; while I still think it beats its competition like a dusty carpet, any of the new-school dynamic languages of the time could have pulled me away from C. There’s probably a nearby alternate timeline where I write a lot of Java.

I’m writing this reminiscence in part because I don’t think I’m anything like unique. I think the same transition was probably changing the coding habits of a lot of old C hands near the turn of the century, and very likely most of us were as unaware of it at the time as I was.

The fact is that after 2000, though I did still the bulk of my work in C/C++ on projects like GPSD and Battle for Wesnoth and NTPsec, all my new program starts were in Python.

Often these were projects that might well have been completely impractical in C. I speak of projects like [reposurgeon][4] and [doclifter][5], in particular; trying to do these in C, with its limited data-type ontology and its extreme vulnerability to low-level data-management issues, would have been horrifying and probably doomed.

But even for smaller stuff – things that might have been practical in C – I reached for Python, because why work harder and deal with more core-dump bugs than you have to? Until near the end of last year, when I tried to start a project in Rust and wrote my [first successful small project in Go.][6]

Again, though I’m talking about my personal experience here, I think it reflects larger trends pretty well, more anticipating than following them. I was an early Python adopter back in ’98, and statistics from [TIOBE][7] tell me I did my first Go project within months of when it broke out from being a niche language used mainly at the corporate shop that originated it.

More generally: Only now are the first languages that directly challenge C for its traditional turf looking viable. My filter for that is pretty simple – a C challenger is only “viable” if you could propose to a old C hand like me that C programming is No Longer Allowed, here’s an automated translator that lifts C to the new language, now get  _all your usual work done_  – and the old hand would smile happily.

Python and its kin aren’t good enough for that. Trying to implement (for example) NTPsec on Python would be a disaster, undone by high runtime overhead and latency variations due to GC. Python is good enough for code that only has to respond to a single user at human speed, but not usually for code that has to respond at  _machine speed_  – especially under heavy multiuser loads. It’s not just my judgment saying this – Go only  _exists_  because Google, then Python’s major backer, hit the same wall.

So Go is designed for the C-like jobs Python can’t handle. It’s too bad we don’t actually have an automatic code lifter, but the thought of doing all my systems stuff in Go doesn’t scare me. In fact I’m quite happy with the idea. My C chops are still largely applicable and I get garbage collection and really sweet concurrency primitives too, what’s not to like?

(There’s more about my first Go experience [here][8].)

I’d like to include Rust under “reasons C is growing obsolete”, but having studied and tried to code in the language I find [it’s just not ready yet.][9]. Maybe in five years.

As 2017 is drawing to a close, we have one relatively mature language that looks like a plausible C successor over most of C’s application range (I’ll be more precise about that in a bit) and an awkward youngster that might complete successfully in a few years.

That’s actually huge. Though it may be hard to see just how huge until you lift your head out of current events and take a longer perspective. We went  _thirty years_  – most of my time in the field – without any plausible C successor, nor any real vision of what a post-C technology platform for systems programming might look like. Now we have two such visions…

…and there is another. I have a friend working on a language he calls “Cx” which is C with minimal changes for type safety; the goal of his project is explicitly to produce a code lifter that, with minimal human assistance, can pull up legacy C codebases. I won’t name him so he doesn’t get stuck in a situation where he might be overpromising, but the approach looks sound to me and I’m trying to get him more funding.

So, now I can see three plausible paths out of C. Two years ago I couldn’t see any. I repeat: this is huge.

Am I predicting the imminent extinction of C? No. For the foreseeable future I think it will retain a pretty firm grip on OS kernels and device firmware. There, the old imperative to squeeze out maximum performance even if it means using an unsafe language still has force.

What’s opening up now is the space just above that that I usually play in – projects like GPSD and NTPsec, system services and daemons that would historically have been written in C as a matter of course. Other good examples of the sort of thing I mean are DNS servers and mail transport agents – system programs that need to communicate and handle transactions at at machine speed, not human speed.

It is now possible to glimpse a future in which all that code is written in specific C replacements with strong memory-safety properties. Go, or Rust, or Cx – any way you slice it, C’s hold is slipping. Like, if I were clean-starting an NTP implementation today, I’d do it in Go without any hesitation at all.

--------------------------------------------------------------------------------

via: http://esr.ibiblio.org/?p=7711

作者：[Eric Raymond][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://esr.ibiblio.org/?author=2
[1]:http://esr.ibiblio.org/?author=2
[2]:http://esr.ibiblio.org/?p=7711
[3]:http://sng.sourceforge.net/
[4]:http://www.catb.org/esr/reposurgeon/
[5]:http://www.catb.org/esr/doclifter/
[6]:http://www.catb.org/esr/loccount/
[7]:https://www.tiobe.com/tiobe-index/
[8]:https://blog.ntpsec.org/2017/02/07/grappling-with-go.html
[9]:http://esr.ibiblio.org/?p=7303
