How I recorded user behaviour on my competitor’s websites
======

### Update

Google’s team has tracked down my test site, most likely using the source code I shared and de-indexed the whole domain.

Last time [I publicly exposed a flaw][1], Google issued a [manual penalty][2] and devalued a single offending page. This time, there is no notice in Search Console. The site is completely removed from their index without any notification.

I’ve received a lot of criticism in the way I’ve handled this. Many are suggesting the right way is to approach Google directly with security flaws like this instead of writing about it publicly. Others are suggesting I acted unethically, or even illegally by running this test. I think it should be obvious that if I intended to exploit this method I wouldn’t write about it. With so much risk and so little gain, is this even worth doing in practice? Of course not. I’d be more concerned about those who do unethical things and don’t write about it.

### My wish list:

a) Manipulating the back button in Chrome shouldn’t be possible in 2018
b) Websites that employ this tactic should be detected and penalised by Google’s algorithms
c) If still found in Google’s results, such pages should be labelled with “this page may be harmful” notice.

### Here’s what I did:

  1. User lands on my page (referrer: google)
  2. When they hit “back” button in Chrome, JS sends them to my copy of SERP
  3. Click on any competitor takes them to my mirror of competitor’s site (noindex)
  4. Now I generate heatmaps, scrollmaps, records screen interactions and typing.

![][3]

![script][4]
![][5]
![][6]

Interestingly, only about 50% of users found anything suspicious, partly due to the fact that I used https on all my pages, which is one of the main [trust factors on the web][7].

Many users are just happy to see the “padlock” in their browser.

At this point I was able to:

  * Generate heatmaps (clicks, moves, scroll depth)
  * Record actual sessions (mouse movement, clicks, typing)



I gasped when I realised I can actually **capture all form submissions and send them to my own email**.

Note: I never actually tried that.

Yikes!

### Wouldn’t a website doing this be penalised?

You would think so.

I had this implemented for a **very brief period of time** (and for ethical reasons took it down almost immediately, realising that this may cause trouble). After that I changed the topic of the page completely and moved the test to one of my disposable domains where **remained** for five years and ranked really well, though for completely different search terms with rather low search volumes. Its new purpose was to mess with conspiracy theory people.

### Alternative Technique

You don’t have to spoof Google SERPs to generate competitor’s heatmaps, you can simply A/B test your landing page VS your clone of theirs through paid traffic (e.g. social media). Is the A/B testing version of this ethically OK? I don’t know, but it may get you in legal trouble depending on where you live.

### What did I learn?

Users seldom read home page “fluff” and often look for things like testimonials, case studies, pricing levels and staff profiles / company information in search for credibility and trust. One of my upcoming tests will be to combine home page with “about us”, “testimonials”, “case studies” and “packages”. This would give users all they really want on a single page.

### Reader Suggestions

“I would’ve thrown in an exit pop-up to let users know what they’d just been subjected to.”
<https://twitter.com/marcnashaat/status/1031915003224309760>

### From Hacker News

> Howdy, former Matasano pentester here.
>  FWIW, I would probably have done something similar to them before I’d worked in the security industry. It’s an easy mistake to make, because it’s one you make by default: intellectual curiosity doesn’t absolve you from legal judgement, and people on the internet tend to flip out if you do something illegal and say anything but “You’re right, I was mistaken. I’ve learned my lesson.”
>
> To the author: The reason you pattern-matched into the blackhat category instead of whitehat/grayhat (grayhat?) category is that in the security industry, whenever we discover a vuln, we PoC it and then write it up in the report and tell them immediately. The report typically includes background info, reproduction steps, and recommended actions. The whole thing is typically clinical and detached.
>
> Most notably, the PoC is usually as simple as possible. alert(1) suffices to demonstrate XSS, for example, rather than implementing a fully-working cookie swipe. The latter is more fun, but the former is more impactful.
>
> One interesting idea would’ve been to create a fake competitor — e.g. “VirtualBagel: Just download your bagels and enjoy.” Once it’s ranking on Google, run this same experiment and see if you could rank higher.
>
> That experiment would demonstrate two things: (1) the history vulnerability exists, and (2) it’s possible for someone to clone a competitor and outrank them with this vulnerability, thereby raising it from sev:low to sev:hi.
>
> So to be clear, the crux of the issue was running the exploit on a live site without their blessing.
>
> But again, don’t worry too much. I would have made similar errors without formal training. It’s easy for everyone to say “Oh well it’s obvious,” but when you feel like you have good intent, it’s not obvious at all.
>
> I remind everyone that RTM once ran afoul of the law due to similar intellectual curiosity. (In fairness, his experiment exploded half the internet, but still.)

Source: <https://news.ycombinator.com/item?id=17826106>


### About the author

[Dan Petrovic][9]

Dan Petrovic, the managing director of DEJAN, is Australia’s best-known name in the field of search engine optimisation. Dan is a web author, innovator and a highly regarded search industry event speaker.


--------------------------------------------------------------------------------

via: https://dejanseo.com.au/competitor-hack/

作者：[Dan Petrovic][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dejanseo.com.au/dan-petrovic/
[1]:https://dejanseo.com.au/hijack/
[2]:https://dejanseo.com.au/google-against-content-scrapers/
[3]:https://dejanseo.com.au/wp-content/uploads/2018/08/step-1.png
[4]:https://dejanseo.com.au/wp-content/uploads/2018/08/script.gif
[5]:https://dejanseo.com.au/wp-content/uploads/2018/08/step-2.png
[6]:https://dejanseo.com.au/wp-content/uploads/2018/08/step-3.png
[7]:https://dejanseo.com.au/trust/
[8]:https://secure.gravatar.com/avatar/9068275e6d3863b7dc11f7dff0974ced?s=100&d=mm&r=g
[9]:https://dejanseo.com.au/dan-petrovic/ (Dan Petrovic)
[10]:https://dejanseo.com.au/author/admin/ (More posts by Dan Petrovic)
