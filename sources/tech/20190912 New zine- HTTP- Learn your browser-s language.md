[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New zine: HTTP: Learn your browser's language!)
[#]: via: (https://jvns.ca/blog/2019/09/12/new-zine-on-http/)
[#]: author: (Julia Evans https://jvns.ca/)

New zine: HTTP: Learn your browser's language!
======

Hello! I’ve released a new zine! It’s called “HTTP: Learn your browsers language!”

You can get it for $12 at <https://gum.co/http-zine>. If you buy it, you’ll get a PDF that you can either read on your computer or print out.

Here’s the cover and table of contents:

[![][1]][2] <https://jvns.ca/images/http-zine-toc.png>

### why http?

I got the idea for this zine from talking to [Marco Rogers][3] – he mentioned that he thought that new web developers / mobile developers would really benefit from understanding the fundamentals of HTTP better, I thought “OOH I LOVE TALKING ABOUT HTTP”, wrote a few pages about HTTP, saw they were helping people, and decided to write a whole zine about HTTP.

HTTP is important to understand because it runs the entire web – if you understand how HTTP requests and responses work, then it makes it WAY EASIER to debug why your web application isn’t working properly. Caching, cookies, and a lot of web security are implemented using HTTP headers, so if you don’t understand HTTP headers those things seem kind of like impenetrable magic. But actually the HTTP protocol is fundamentally pretty simple – there are a lot of complicated details but the basics are pretty easy to understand.

So the goal of this zine is to teach you the basics so you can easily look up and understand the details when you need them.

### what it looks like printed out

All of my zines are best printed out (though you get a PDF you can read on your computer too!), so here are a couple of pictures of what it looks like when printed. I always ask my illustrator to make both a black and white version and a colour version of the cover so that it looks great when printed on a black and white printer.

[![][4]][2] <https://jvns.ca/images/same-origin-policy.jpeg>

(if you click on that “same origin policy” image, you can make it bigger)

The zine comes with 4 print PDFs in addition to a PDF you can just read on your computer/phone:

  * letter / colour
  * letter / b&amp;w
  * a4 / colour
  * a4 / b&amp;w



### zines for your team

You can also buy this zine for your team members at work to help them learn HTTP!

I’ve been trying to get the pricing right for this for a while – I used to do it based on size of company, but that didn’t seem quite right because sometimes people would want to buy the zine for a small team at a big company. So I’ve switched to pricing based on the number of copies you want to distribute at your company.

Here’s the link: [zines for your team!][5].

### the tweets

When I started writing zines, I would just sit down, write down the things I thought were important, and be done with it.

In the last year and a half or so I’ve taken a different approach – instead of writing everything and then releasing it, instead I write a page at a time, post the page to Twitter, and then improve it and decide what page to write next based on the questions/comments I get on Twitter. If someone replies to the tweet and asks a question that shows that what I wrote is unclear, I can improve it! (I love getting replies on twitter asking clarifiying questions!).

Here are all the initial drafts of the pages I wrote and posted on twitter, in chronological order. Some of the pages didn’t make it into the zine at all, and I needed to do a lot of editing at the end to figure out the right order and make them all work coherently together in a zine instead of being a bunch of independent tweets.

  * Jul 1: [http status codes][6]
  * Jul 2: [anatomy of a HTTP response][7]
  * Jul 2: [POST requests][8]
  * Jul 2: [an example POST request][9]
  * Jul 28: [the same origin policy][10]
  * Jul 28: [what’s HTTP?][11]
  * Jul 30: [the most important HTTP request headers][12]
  * Jun 30: [anatomy of a HTTP request][13]
  * Aug 4: [content delivery networks][14]
  * Aug 6: [caching headers][15]
  * Aug 6: [how cookies work][16]
  * Aug 7: [redirects][17]
  * Aug 8: [45 seconds on the Accept-Language HTTP header][18]
  * Aug 9: [HTTPS: HTTP + security][19]
  * Aug 9: [today in 45 second video experiments: the Range header][20]
  * Aug 9: [some HTTP exercises to try][21]
  * Aug 10: [some security headers][22]
  * Aug 12: [using HTTP APIs][23]
  * Aug 13: [what’s with those headers that start with x-?][24]
  * Aug 13: [important HTTP response headers][25]
  * Aug 14: [HTTP request methods (part 1)][26]
  * Aug 14: [HTTP request methods (part 2)][27]
  * Aug 15: [how URLs work][28]
  * Aug 16: [CORS][29]
  * Aug 19: [why the same origin policy matters][30]
  * Aug 21: [HTTP headers][31]
  * Aug 24: [how to learn more about HTTP][32]
  * Aug 25: [HTTP/2][33]
  * Aug 27: [certificates][34]



Writing zines one tweet at a time has been really fun. I think it improves the quality a lot, because I get a ton of feedback along the way that I can use to make the zine better. There are also some experimental 45 second tiny videos in that list, which are definitely not part of the zine, but which were fun to make and which I might expand on in the future.

### examplecat.com

One tiny easter egg in the zine: I have a lot of examples of HTTP requests, and I wasn’t sure for a long time what domain I should use for the examples. I used example.com a bunch, and google.com and twitter.com sometimes, but none of those felt quite right.

A couple of days before publishing the zine I finally had an epiphany – my example on the cover was requesting a picture of a cat, so I registered <https://examplecat.com> which just has a single picture of a cat. It also has an ASCII cat if you’re browsing in your terminal.

```
$ curl https://examplecat.com/cat.txt  -i
HTTP/2 200
accept-ranges: bytes
cache-control: public, max-age=0, must-revalidate
content-length: 33
content-type: text/plain; charset=UTF-8
date: Thu, 12 Sep 2019 16:48:16 GMT
etag: "ac5affa59f554a1440043537ae973790-ssl"
strict-transport-security: max-age=31536000
age: 5
server: Netlify
x-nf-request-id: c5060abc-0399-4b44-94bf-c481e22c2b50-1772748

\    /\
 )  ( ')
(  /  )
 \(__)|
```

### more zines at wizardzines.com

If you’re interested in the idea of programming zines and haven’t seen my zines before, I have a bunch more at <https://wizardzines.com>. There are 6 free zines there:

  * [so you want to be a wizard][35]
  * [let’s learn tcpdump!][36]
  * [spying on your programs with strace][37]
  * [networking! ACK!][38]
  * [linux debugging tools you’ll love][39]
  * [profiling and tracing with perf][40]



### next zine: not sure yet!

Some things I’m considering for the next zine:

  * debugging skills (I started writing a bunch of pages about debugging but switched gears to the HTTP zine because I got really excited about that. but debugging is my favourite thing so I’d like to get this done at some point)
  * gdb (a short zine in the spirit of [let’s learn tcpdump][36])
  * relational databases (what’s up with transactions?)



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/09/12/new-zine-on-http/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/images/http-zine-cover.png
[2]: https://gum.co/http-zine
[3]: https://twitter.com/polotek
[4]: https://jvns.ca/images/http-zine-cover.jpeg
[5]: https://wizardzines.com/zines-team/
[6]: https://twitter.com/b0rk/status/1145824140462608387
[7]: https://twitter.com/b0rk/status/1145896193077256197
[8]: https://twitter.com/b0rk/status/1146054159214567424
[9]: https://twitter.com/b0rk/status/1146065212560179202
[10]: https://twitter.com/b0rk/status/1155493682885341184
[11]: https://twitter.com/b0rk/status/1155318552129396736
[12]: https://twitter.com/b0rk/status/1156048630220017665
[13]: https://twitter.com/b0rk/status/1145362860136177664
[14]: https://twitter.com/b0rk/status/1158012032651862017
[15]: https://twitter.com/b0rk/status/1158726129508868097
[16]: https://twitter.com/b0rk/status/1158848054142873603
[17]: https://twitter.com/b0rk/status/1159163613938167808
[18]: https://twitter.com/b0rk/status/1159492669384658944
[19]: https://twitter.com/b0rk/status/1159812119099060224
[20]: https://twitter.com/b0rk/status/1159829608595804160
[21]: https://twitter.com/b0rk/status/1159839824594915335
[22]: https://twitter.com/b0rk/status/1160185182323970050
[23]: https://twitter.com/b0rk/status/1160933788949655552
[24]: https://twitter.com/b0rk/status/1161283690925834241
[25]: https://twitter.com/b0rk/status/1161262574031265793
[26]: https://twitter.com/b0rk/status/1161679906415218690
[27]: https://twitter.com/b0rk/status/1161680137865367553
[28]: https://twitter.com/b0rk/status/1161997141876903936
[29]: https://twitter.com/b0rk/status/1162392625057583104
[30]: https://twitter.com/b0rk/status/1163460967067541504
[31]: https://twitter.com/b0rk/status/1164181027469832196
[32]: https://twitter.com/b0rk/status/1165277002791829510
[33]: https://twitter.com/b0rk/status/1165623594917007362
[34]: https://twitter.com/b0rk/status/1166466933912494081
[35]: https://wizardzines.com/zines/wizard/
[36]: https://wizardzines.com/zines/tcpdump/
[37]: https://wizardzines.com/zines/strace/
[38]: https://wizardzines.com/zines/networking/
[39]: https://wizardzines.com/zines/debugging/
[40]: https://wizardzines.com/zines/perf/
