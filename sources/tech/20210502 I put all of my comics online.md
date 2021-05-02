[#]: subject: (I put all of my comics online!)
[#]: via: (https://jvns.ca/blog/2021/05/02/publishing-comics/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

I put all of my comics online!
======

Hello! As you probably know, I write a lot of comics about programming, and I publish collections of them as zines you can buy at <https://wizardzines.com>.

I also usually post the comics on Twitter as I write them. But there are a lot of problems with just posting them to Twitter, like:

  * **the pages are hard to find**. For example, if you want to find the one on `socat`, you can [search twitter][1] and you’ll find it, but then you have to somehow magically guess what words I used in the tweet, and also sort through a bunch of other tweets.
  * **they’re annoying to link to**. Twitter isn’t really the best user interface for this sort of thing.
  * **I can’t make updates**. Twitter doesn’t have an edit button!
  * **work that never made it into a zine is basically impossible to find**. For example I wrote 12 pages of a sequel to “bite size linux” but never quite finished it, and it’s basically impossible for anyone to find those pages. Or I have a couple of [pages][2] about [Kubernetes][3] I wrote one time that will probably never make it into a zine either.



If someone wants to see the page on socat, I’d really like them to just be able to find it at <https://wizardzines.com/comics/socat>

### now they’re all online in one place!

the tl;dr is that (almost) all of my comics are now online in one place at <https://wizardzines.com/comics>. Hooray!

### you can search!

There are 273 comics right now which is a lot, so I’ve added a very simple search using [list.js][4]. Here’s what it looks like.

![][5]

It searches based on the title and also a few keywords I manually added, which is why “authoritative nameservers” matches the search “dns”.

I wrote a small custom search function that only matches starting at the beginning of the word, so that the search “tar” doesn’t give you “start”. It feels pretty good to use.

If you want to read the pages from the Bite Size Linux sequel I mentioned that I started writing 2 years ago and never finished, you can search for “linux2”.

### what’s not there

Some parts of the zines aren’t there just because it wouldn’t make sense – for example most of the zines have an introduction and a conclusion page, and those pages don’t really work as a standalone comic.

Also a lot of the pages from my free zines aren’t there yet because a lot of them don’t work as well as standalone pages. I might add them in the future though, we’ll see.

Other things that are missing that I think I will add:

  * the comics from <https://drawings.jvns.ca>
  * any other pages I’ve posted over the years on Twitter that aren’t in a zine, assuming that I can find them (for example [scenes from distributed systems][6])



### why I didn’t do this earlier

This isn’t actually that hard of a change to make technically – I just needed to write some Python scripts and write a little search function.

But I felt a bit worried about making all the comics more easily available online because – what if I put them online and then nobody wants to buy the zines anymore?

I decided this week not to worry about that and just do it because I’m really excited about being able to easily link any comic that I want.

The zine business is going really well in general so I think it’s a lot nicer to operate with a spirit of abundance instead of a spirit of scarcity.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/05/02/publishing-comics/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/search?q=socat%20from%3Ab0rk&src=typed_query&f=live
[2]: https://wizardzines.com/comics/kubernetes-components/
[3]: https://wizardzines.com/comics/scenes-from-kubernetes/
[4]: https://listjs.com/
[5]: https://jvns.ca/images/dns-search.png
[6]: https://twitter.com/b0rk/status/1056560207562711041
