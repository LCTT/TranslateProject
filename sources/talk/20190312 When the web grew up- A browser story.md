[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (When the web grew up: A browser story)
[#]: via: (https://opensource.com/article/19/3/when-web-grew)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

When the web grew up: A browser story
======
A personal story of when the internet came of age.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Internet_Sign.png?itok=5MFGKs14)

Recently, I [shared how][1] upon leaving university in 1994 with a degree in English literature and theology, I somehow managed to land a job running a web server in a world where people didn't really know what a web server was yet. And by "in a world," I don't just mean within the organisation in which I worked, but the world in general. The web was new—really new—and people were still trying to get their heads around it.

That's not to suggest that the place where I was working—an academic publisher—particularly "got it" either. This was a world in which a large percentage of the people visiting their website were still running 28k8 modems. I remember my excitement in getting a 33k6 modem. At least we were past the days of asymmetric upload/download speeds,1 where 1200/300 seemed like an eminently sensible bandwidth description. This meant that the high-design, high-colour, high-resolution documents created by the print people (with whom I shared a floor) were completely impossible on the web. I wouldn't allow anything bigger than a 40k GIF on the front page of the website, and that was pushing it for many of our visitors. Anything larger than 60k or so would be explicitly linked as a standalone image from a thumbnail on the referring page.

To say that the marketing department didn't like this was an understatement. Even worse was the question of layout. "Browsers decide how to lay out documents," I explained, time after time, "you can use headers or paragraphs, but how documents appear on the page isn't defined by the document, but by the renderer!" They wanted control. They wanted different coloured backgrounds. After a while, they got that. I went to what I believe was the first W3C meeting at which the idea of Cascading Style Sheets (CSS) was discussed. And argued vehemently against them. The suggestion that document writers should control layout was anathema.2 It took some while for CSS to be adopted, and in the meantime, those who cared about such issues adopted the security trainwreck that was Portable Document Format (PDF).

How documents were rendered wasn't the only issue. Being a publisher of actual physical books, the whole point of having a web presence, as far as the marketing department was concerned, was to allow customers—or potential customers—to know not only what a book was about, but also how much it was going to cost them to buy. This, however, presented a problem. You see, the internet—in which I include the rapidly growing World Wide Web—was an open, free-for-all libertarian sort of place where nobody was interested in money; in fact, where talk of money was to be shunned and avoided.

I took the mainstream "Netizen" view that there was no place for pricing information online. My boss—and, indeed, pretty much everybody else in the organisation—took a contrary view. They felt that customers should be able to see how much books would cost them. They also felt that my bank manager would like to see how much money was coming into my bank account on a monthly basis, which might be significantly reduced if I didn't come round to their view.

Luckily, by the time I'd climbed down from my high horse and got over myself a bit—probably only a few weeks after I'd started digging my heels in—the web had changed, and there were other people putting pricing information up about their products. These newcomers were generally looked down upon by the old schoolers who'd been running web servers since the early days,3 but it was clear which way the wind was blowing. This didn't mean that the battle was won for our website, however. As an academic publisher, we shared an academic IP name ("ac.uk") with the University. The University was less than convinced that publishing pricing information was appropriate until some senior folks at the publisher pointed out that Princeton University Press was doing it, and wouldn't we look a bit silly if…?

The fun didn't stop there, either. A few months into my tenure as webmaster ("webmaster@…"), we started to see a worrying trend, as did lots of other websites. Certain visitors were single-handedly bringing our webserver to its knees. These visitors were running a new web browser: Netscape. Netscape was badly behaved. Netscape was multi-threaded.

Why was this an issue? Well, before Netscape, all web browsers had been single-threaded. They would open one connection at a time, so even if you had, say five GIFs on a page,4 they would request the HTML base file, parse that, then download the first GIF, complete that, then the second, complete that, and so on. In fact, they often did the GIFs in the wrong order, which made for very odd page loading, but still, that was the general idea. The rude people at Netscape decided that they could open multiple connections to the webserver at a time to request all the GIFs at the same time, for example! And why was this a problem? Well, the problem was that most webservers were single-threaded. They weren't designed to have multiple connections open at any one time. Certainly, the HTTP server that we ran (MacHTTP) was single-threaded. Even though we had paid for it (it was originally shareware), the version we had couldn't cope with multiple requests at a time.

The debate raged across the internet. Who did these Netscape people think they were, changing how the world worked? How it was supposed to work? The world settled into different camps, and as with all technical arguments, heated words were exchanged on both sides. The problem was that not only was Netscape multi-threaded, it was also just better than the alternatives. Lots of web server code maintainers, MacHTTP author Chuck Shotton among them, sat down and did some serious coding to produce multi-threaded beta versions of their existing code. Everyone moved almost immediately to the beta versions, they got stable, and in the end, single-threaded browsers either adapted and became multi-threaded themselves, or just went the way of all outmoded products and died a quiet death.6

This, for me, is when the web really grew up. It wasn't prices on webpages nor designers being able to define what you'd see on a page,8 but rather when browsers became easier to use and when the network effect of thousands of viewers moving to many millions tipped the balance in favour of the consumer, not the producer. There were more steps in my journey—which I'll save for another time—but from around this point, my employers started looking at our monthly, then weekly, then daily logs, and realising that this was actually going to be something big and that they'd better start paying some real attention.

1\. How did they come back, again?

2\. It may not surprise you to discover that I'm still happiest at the command line.

3\. About six months before.

4\. Reckless, true, but it was beginning to happen.5

5\. Oh, and no—it was GIFs or BMP. JPEG was still a bright idea that hadn't yet taken off.

6\. It's never actually quiet: there are always a few diehard enthusiasts who insist that their preferred solution is technically superior and bemoan the fact that the rest of the internet has gone to the devil.7

7\. I'm not one to talk: I still use Lynx from time to time.

8\. Creating major and ongoing problems for those with different accessibility needs, I would point out.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/when-web-grew

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/11/how-web-was-won
