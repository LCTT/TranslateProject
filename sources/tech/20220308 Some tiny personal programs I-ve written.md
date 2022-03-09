[#]: subject: "Some tiny personal programs I've written"
[#]: via: "https://jvns.ca/blog/2022/03/08/tiny-programs/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some tiny personal programs I've written
======

I was talking to a friend last summer about what resources might be helpful for folks learning to program. My friend said they thought some people might benefit from a list of small and fun programming projects – the kind of thing you can do in an evening or weekend.

So let’s talk about that! I like to write small programs that have some marginal utility in my life. Kind of like this:

  * ah! A minor problem in my life!
  * I know, I bet I can solve this problem with CODE. YAY.
  * _4 hours of happy programming ensues_



This isn’t always the most _practical_ (many of the problems I’ve solved with programming could have been solved in less time in other ways), but as long as your goal is actually to have fun programming and your programs don’t hurt anyone else, I think this is a great approach :)

So here are a few examples of small personal programming projects I’ve done. I’m not going to talk about “learning projects” where my goal was to learn something specific because I’ve already written a billion blog posts about that.

These are more about just doing something fun with no specific learning goal.

### a theatre festival didn’t have a calendar

The local Fringe Festival had a bunch of shows, but there was no place I could see a calendar all one one page. So I wrote a Python script to scrape their website and generate a calendar. Here’s [the code][1] and [the output][2].

### printing out covers for tiny books

I saw a [TikTok video][3] recently where someone made miniature physical versions of the ebooks they read. I decided to try it out, so I needed to print tiny versions of a bunch of book covers. I could have resized all of them manually, but I decided to do it with programming instead.

So I wrote a little bit of HTML and CSS ([tinybooks.html][4]), converted it to a PDF, and printed it out.

### getting my scanner to work better

This is barely “programming”, but I needed to scan a bunch of documents for a family member, and I didn’t like the available software. So I wrote a [tiny shell script wrapper for `scanimage`][5] to make the process simpler. This one actually helped me a lot and I still use it when scanning.

### getting a vaccine appointment

When the second COVID vaccine doses opened up, all of the slots were full. It turned out that the website’s backend had an API, so I wrote a script to poll the API every 60 seconds or so and watch for cancellations and notify me so that I could get an earlier appointment.

This didn’t turn out to be necessary (more appointments opened up pretty soon anyway and there were enough for everyone), but it was fun.

In general I try to be careful when using APIs like this in a way the developers didn’t intend to avoid overloading the site.

### looking at housing market data

We were thinking of buying a condo a few years ago and I was mad that I couldn’t get any information about historical prices, so I wrote an iPython notebook that queried the API of a local real estate website to scrape some information and calculate some statistics like price per square foot over time.

I don’t think this actually helped us at all with buying a condo but it was fun.

(“using the API of local services” seems to be an ongoing theme, one of my favourite things is to use secret undocumented APIs where you need to copy your cookies out of the browser to get access to them)

### crossword business cards

in 2013, I thought it might be fun to have a business card that was a crossword with some of my interests. So I wrote general software to [generate crosswords from a text file][6]. I’m pretty sure never printed the business cards but it was fun to write.

### generating envelopes

I was mailing some zines a while ago, and I decided I wanted to print custom labels on every envelope – sort of a “mail merge” situation. So I wrote a Python program to go through all of the mailing address and generate some HTML and CSS. Then I turned the HTML/CSS into a PDF and printed the envelopes. This worked great.

### investigating dice rolling patterns

A friend showed me a dice rolling game where you roll a bunch of dice and add up the values. I mentioned that if you roll enough dice and add up all the values, at some point it gets a lot less “random”.

But then I wanted to see exactly how much less random it gets. So I wrote a tiny program to roll 2500 dice and add up the resulting sums a bunch of times to see how it works. (presumably you could calculate the same thing with math, but it’s easier with code)

This was so little code I’ll just inline it here. (it’s Python). Here’s [the output](<https://gist.github.com/jvns/e4a35ca2bad90c1a0fcaf578a803b456>

```

    import random

    def roll():
        return sum(random.randint(1, 6) for i in range(2500))

    while True:
        print(roll())

```

### getting drawings into the Notability app

I was using an app called Squid to do drawing, and I was switching to Notability and wanted to get my old drawings into Notability. So I [reverse engineered the Notability file format][7].

I don’t think this was ultimately that useful (I ultimately ended up switching to a different drawing app which had a real SVG import), but I had fun.

### turning off retweets

This is a slightly less tiny project (it took more than one day), but I decided I didn’t want to see retweets on Twitter anymore so I wrote a [small website][8] so I could turn off retweets.

### I really love tiny projects

All of these examples are more recent, but I think that when I was starting to learn to program tiny low-stakes projects like this really helped me. I love that

  * they’re just for me (if it goes wrong, it doesn’t matter!)
  * I can finish them in an evening or weekend (it’s not a Huge Giant Thing hanging over my head)
  * if it works, there’s some tangible output in my life (like some envelopes or miniature books or a schedule a business card or a better Twitter experience)



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/03/08/tiny-programs/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://gist.github.com/jvns/a552895b6f9b523276e88d7e7506ee86
[2]: https://jvns.ca/fringe-2021.html
[3]: https://www.tiktok.com/@stevieandjohn/video/7063929340836334895
[4]: https://gist.github.com/jvns/de0671d09f5752d36cbe6082d4fb2af2
[5]: https://gist.github.com/jvns/b5651fd6272eddcd935e5e30874a935f
[6]: https://github.com/jvns/svg_crossworder
[7]: https://jvns.ca/blog/2018/03/31/reverse-engineering-notability-format/
[8]: https://turn-off-retweets.glitch.me/
