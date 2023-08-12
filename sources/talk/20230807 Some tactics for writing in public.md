[#]: subject: "Some tactics for writing in public"
[#]: via: "https://jvns.ca/blog/2023/08/07/tactics-for-writing-in-public/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some tactics for writing in public
======

Someone recently asked me – “how do you deal with writing in public? People on the internet are such assholes!”

I’ve often heard the advice “don’t read the comments”, but actually I’ve learned a huge amount from reading internet comments on my posts from strangers over the years, even if sometimes people are jerks. So I want to explain some tactics I use to try to make the comments on my posts more informative and useful to me, and to try to minimize the number of annoying comments I get.

### talk about facts

On here I mostly talk about facts – either facts about computers, or stories about my experiences using computers.

For example [this post][1] about tcpdump contains some basic facts about how to use tcpdump, as well as an example of how I’ve used it in the past.

Talking about facts means I get a lot of fact-based comments like:

  * people sharing their own similar (or different) experiences (“I use tcpdump a lot to look at our RTP sequence numbers”)
  * pointers to other resources (“the documentation from F5 about tcpdump is great”)
  * other interesting related facts I didn’t mention (“you can use tcpdump -X too”, “netsh on windows is great”, “you can use `sudo tcpdump -s 0 -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'` to filter for HTTP GET requests)
  * potential problems or gotchas (“be careful about running tcpdump as root, try just setting the required capabilities instead”)
  * questions (“Is there a way to place the BPF filter after IP packet reassembly?” or “what’s the advantage of tcpdump over wireshark?”)
  * mistakes I made



In general, I’d say that people’s comments about facts tend to stay pretty normal. The main kinds of negative comments I get about facts are:

  * occasionally people get a little rude about facts I didn’t mention (“Didn’t use -n in any of the examples…please…“). I think I didn’t mention `-n` in that post because at the time I didn’t know why the `-n` flag was useful (it’s useful because it turns off this annoying reverse DNS lookup that tcpdump does by default so you can see the IP addresses).
  * people are also sometimes weird about mistakes. I mostly try to head this off by trying to be self-aware about my knowledge level on a topic, and saying “I’m not sure…” when I’m not sure about something.



### stories are great

I think stories encourage pretty good discussion. For example, [why you should understand (a little) about TCP][2] is a story about a time it was important for me to understand how TCP worked.

When I share stories about problems I solved, the comments really help me understand how what I learned fits into a bigger context. For example:

  * is this a common problem? people will often comment saying “this happened to me too!”
  * what are other common related problems that come up?
  * are there other possible solutions I didn’t consider?



Also I think these kinds of stories are incredibly important – that post describes a bug that was VERY hard for me to solve, and the only reason I was able to figure it out in the first place was that I read [this blog post][3].

### ask technical questions

Often in my blog posts I ask technical questions that I don’t know the answer to (or just mention “I don’t know X…”). This helps people focus their replies a little bit – an obvious comment to make is to provide an answer to the question, or explain the thing I didn’t know!

This is fun because it feels like a guaranteed way to get value out of people’s comments – people LOVE answering questions, and so they get to look smart, and I get the answer to a question I have! Everyone wins!

### fix mistakes

I make a lot of mistakes in my blog posts, because I write about a lot of things that are on the edge of my knowledge. When people point out mistakes, I often edit the blog post to fix it.

Usually I’ll stay near a computer for a few hours after I post a blog post so that I can fix mistakes quickly as they come up.

Some people are very careful to list every single error they made in their blog posts (“errata: the post previously said X which was wrong, I have corrected it to say Y”). Personally I make mistakes constantly and I don’t have time for that so I just edit the post to fix the mistakes.

### ask for examples/experiences, not opinions

A lot of the time when I post a blog post, people on Twitter/Mastodon will reply with various opinions they have about the thing. For example, someone recently replied to a blog post about DNS saying that they love using zone files and dislike web interfaces for managing DNS records. That’s not an opinion I share, so I asked them why.

They explained that there are some DNS record types (specifically `TLSA`) that they find often aren’t supported in web interfaces. I didn’t know that people used `TLSA` records, so I learned something! Cool!

I’ve found that asking people to share their **experiences** (“I wanted to use X DNS record type and I couldn’t”) instead of their **opinions** (“DNS web admin interfaces are bad”) leads to a lot of useful information and discussion. I’ve learned a lot from it over the years, and written a lot of tweets like “which DNS record types have you needed?” to try to extract more information about people’s experiences.

I try to model the same behaviour in my own work when I can – if I have an opinion, I’ll try to explain the experiences I’ve had with computers that caused me to have that opinion.

### start with a little context

I think internet strangers are more likely to reply in a weird way when they have no idea who you are or why you’re writing this thing. It’s easy to make incorrect assumptions! So often I’ll mention a little context about why I’m writing this particular blog post.

For example:

> A little while ago I started using a Mac, and one of my biggest frustrations with it is that often I need to run Linux-specific software.

or

> I’ve started to run a few more servers recently (nginx playground, mess with dns, dns lookup), so I’ve been thinking about monitoring.

or

> Last night, I needed to scan some documents for some bureaucratic reasons. I’d never used a scanner on Linux before and I was worried it would take hours to figure out…

### avoid causing boring conversations

There are some kinds of programming conversations that I find extremely boring (like “should people learn vim?” or “is functional programming better than imperative programming?“). So I generally try to avoid writing blog posts that I think will result in a conversation/comment thread that I find annoying or boring.

For example, I wouldn’t write about my opinions about functional programming: I don’t really have anything interesting to say about it and I think it would lead to a conversation that I’m not interested in having.

I don’t always succeed at this of course (it’s impossible to predict what people are going to want to comment about!), but I try to avoid the most obvious flamebait triggers I’ve seen in the past.

There are a bunch of “flamebait” triggers that can set people off on a conversation that I find boring: cryptocurrency, tailwind, DNSSEC/DoH, etc. So I have a weird catalog in my head of things not to mention if I don’t want to start the same discussion about that thing for the 50th time.

Of course, if you think that conversations about functional programming are interesting, you should write about functional programming and start the conversations you want to have!

Also, it’s often possible to start an interesting conversation about a topic where the conversation is normally boring. For example I often see the same talking points about IPv6 vs IPv4 over and over again, but I remember the comments on [Reasons for servers to support IPv6][4] being pretty interesting. In general if I really care about a topic I’ll talk about it anyway, but I don’t care about functional programming very much so I don’t see the point of bringing it up.

### preempt common suggestions

Another kind of “boring conversation” I try to avoid is suggestions of things I have already considered. Like when someone says “you should do X” but I already know I could have done X and chose not to because of A B C.

So I often will add a short note like “I decided not to do X because of A B C” or “you can also do X” or “normally I would do X, here I didn’t because…”. For example, in [this post about nix][5], I list a bunch of Nix features I’m choosing not to use (nix-shell, nix flakes, home manager) to avoid a bunch of helpful people telling me that I should use flakes.

Listing the things I’m _not_ doing is also helpful to readers – maybe someone new to nix will discover nix flakes through that post and decide to use them! Or maybe someone will learn that there are exceptions to when a certain “best practice” is appropriate.

### set some boundaries

Recently on Mastodon I complained about [some gross terminology that I’d just noticed in the dig man page on my machine][6]. A few dudes in the replies (who by now have all deleted their posts) asked me to prove that the original author _intended_ it to be offensive (which of course is besides the point, there’s just no need to have [a term widely understood to be referring to sexual assault][7] in the dig man page) or tried to explain to me why it actually wasn’t a problem.

So I blocked a few people and wrote a quick post:

> man so many dudes in the replies demanding that i prove that the person who named dig “domain information groper” intended it in an offensive way. Big day for the block button I guess :)

I don’t do this too often, but I think it’s very important on social media to occasionally set some rules about what kind of behaviour I won’t tolerate. My goal here is usually to drive away some of the assholes (they can unfollow me!) and try to create a more healthy space for everyone else to have a conversation about computers in.

Obviously this only works in situations (like Twitter/Mastodon) where I have the ability to garden my following a little bit over time – I can’t do this on HN or Reddit or Lobsters or whatever and wouldn’t try.

As for fixing it – the dig maintainers removed the problem language years ago, but Mac OS still has a very outdated version for license reasons.

(you might notice that this section is breaking the “avoid boring conversations” rule above, this section was certain to start a very boring argument, but I felt it was important to talk about boundaries so I left it in)

### don’t argue

Sometimes people seem to want to get into arguments or make dismissive comments. I don’t reply to them, even if they’re [wrong][8]. I dislike arguing on the internet and I’m extremely bad at it, so it’s not a good use of my time.

### analyze negative comments

If I get a lot of negative comments that I didn’t expect, I try to see if I can get something useful out of it.

For example, I wrote a [toy DNS resolver][9] once and some of the commenters were upset that I didn’t handle parsing the DNS packet. At the time I thought this was silly (I thought DNS parsing was really straightforward and that it was obvious how to do it, who cares that I didn’t handle it?) but I realized that maybe the commenters didn’t think it was easy or obvious, and wanted to know how to do it. Which makes sense! It’s not obvious at all if you haven’t done it before!

Those comments partly inspired [implement DNS in a weekend][10], which focuses much more heavily on the parsing aspects, and which I think is a much better explanation how to write a DNS resolver. So ultimately those comments helped me a lot, even if I found them annoying at the time.

(I realize this section makes me sound like a Perfectly Logical Person who does not get upset by negative public criticism, I promise this is not at all the case and I have 100000 feelings about everything that happens on the internet and get upset all the time. But I find that analyzing the criticism and trying to take away something useful from it helps a bit)

### that’s all!

Thanks to Shae, Aditya, Brian, and Kamal for reading a draft of this.

Some other similar posts I’ve written in the past:

  * [some blogging principles][11]
  * [some blogging myths][12]



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/08/07/tactics-for-writing-in-public/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2016/03/16/tcpdump-is-amazing/
[2]: https://jvns.ca/blog/2015/11/21/why-you-should-understand-a-little-about-tcp/
[3]: https://gocardless.com/blog/in-search-of-performance-how-we-shaved-200ms-off-every-post-request/
[4]: https://jvns.ca/blog/2022/01/29/reasons-for-servers-to-support-ipv6/
[5]: https://jvns.ca/blog/2023/02/28/some-notes-on-using-nix/
[6]: https://social.jvns.ca/@b0rk/110797431090302792
[7]: https://dictionary.cambridge.org/dictionary/english/groper
[8]: https://xkcd.com/386/
[9]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
[10]: https://implement-dns.wizardzines.com/
[11]: https://jvns.ca/blog/2017/03/20/blogging-principles/
[12]: https://jvns.ca/blog/2023/06/05/some-blogging-myths
