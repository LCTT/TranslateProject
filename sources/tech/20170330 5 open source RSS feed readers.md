5 open source RSS feed readers
============================================================

 ![RSS feed](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/rss_feed.png?itok=FHLEh-fZ "RSS feed") 
>Image by : [Rob McDonald][2] on Flickr. Modified by Opensource.com. [CC BY-SA 2.0][3].

### Do you use an RSS reader regularly?

<form class="pollanon" action="https://opensource.com/article/17/3/rss-feed-readers" method="post" id="poll-view-voting" accept-charset="UTF-8"><label class="element-invisible" for="edit-choice" style="display: block; clip: rect(1px 1px 1px 1px); overflow: hidden; height: 1px; width: 1px; color: rgb(67, 81, 86); position: absolute !important;">Choices</label><input type="radio" id="edit-choice-7621" name="choice" value="7621" class="form-radio" style="font-size: 16px; margin-top: 0px; max-width: 100%; -webkit-appearance: none; width: 0.8em; height: 0.8em; border-width: 1px; border-style: solid; border-color: rgb(51, 51, 51); border-radius: 50%; vertical-align: middle;"> <label class="option" for="edit-choice-7621" style="display: inline; font-weight: normal; color: rgb(67, 81, 86); margin-left: 0.2em; vertical-align: middle;">Yes.</label><input type="radio" id="edit-choice-7626" name="choice" value="7626" class="form-radio" style="font-size: 16px; margin-top: 0px; max-width: 100%; -webkit-appearance: none; width: 0.8em; height: 0.8em; border-width: 1px; border-style: solid; border-color: rgb(51, 51, 51); border-radius: 50%; vertical-align: middle;"> <label class="option" for="edit-choice-7626" style="display: inline; font-weight: normal; color: rgb(67, 81, 86); margin-left: 0.2em; vertical-align: middle;">No, but I used to.</label><input type="radio" id="edit-choice-7631" name="choice" value="7631" class="form-radio" style="font-size: 16px; margin-top: 0px; max-width: 100%; -webkit-appearance: none; width: 0.8em; height: 0.8em; border-width: 1px; border-style: solid; border-color: rgb(51, 51, 51); border-radius: 50%; vertical-align: middle;"> <label class="option" for="edit-choice-7631" style="display: inline; font-weight: normal; color: rgb(67, 81, 86); margin-left: 0.2em; vertical-align: middle;">No, I never did.</label><input type="submit" id="edit-vote" name="op" value="Vote" class="form-submit" style="font-family: &quot;Swiss 721 SWA&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Nimbus Sans L&quot;, sans-serif; font-size: 1em; max-width: 100%; line-height: normal; font-style: normal; border-width: 1px; border-style: solid; border-color: rgb(119, 186, 77); color: rgb(255, 255, 255); background: rgb(119, 186, 77); padding: 0.6em 1.9em;"></form>

When Google Reader was discontinued four years ago, many "technology experts" called it the end of RSS feeds.

And it's true that for some people, social media and other aggregation tools are filling a need that feed readers for RSS, Atom, and other syndication formats once served. But old technologies never really die just because new technologies come along, particularly if the new technology does not perfectly replicate all of the use cases of the old one. The target audience for a technology might change a bit, and the tools people use to consume the technology might change, too.

But RSS is no more gone than email, JavaScript, SQL databases, the command line, or any number of other technologies that various people told me more than a decade ago had numbered days. (Is it any wonder that vinyl album sales just hit a [25-year peak][4] last year?) One only has to look at the success of online feed reader site Feedly to understand that there's still definitely a market for RSS readers.

The truth is, RSS and related feed formats are just more versatile than anything in wide usage that has attempted to replace it. There is no other easy was for me as a consumer to read a wide variety of publications, formatted in a client of my choosing, where I am virtually guaranteed to see every item that is published, while simultaneously not being shown a bunch of articles I have already read. And as a publisher, it's a simple format that most any publishing software I already use will support out of the box, letting me reach more people and easily distribute many types of documents.

So no, RSS is not dead. Long live RSS! We last looked at [open source RSS reader][5] options in 2013, and it's time for an update. Here are some of my top choices for open source RSS feed readers in 2017, each a little different in its approach.

### Miniflux

[Miniflux][6] is an absolutely minimalist web-based RSS reader, but don't confuse its intentionally light approach with laziness on the part of the developers; it is purposefully built to be a simple and efficient design. The philosophy of Miniflux seems to be to keep the application out of the way so that the reader can focus on the content, something many of us can appreciate in a world of bloated web applications.

But lightweight doesn't mean void of features; its responsive design looks good across any device, and allows for theming, an API interface, multiple languages, bookmark pinning, and more.

Miniflux's [source code][7] can be found on GitHub under the [GPLv3 Affero][8] license.  If you don't want to set up your own self-hosted version, a paid hosting plan is available for $15/year.

### RSSOwl

[RSSOwl][9] is a cross-platform desktop feed reader. Written in Java, it is reminiscent of many popular desktop email clients in style and feel. It features powerful filtering and search capabilities, customizable notifications, and labels and bins for sorting your feeds. If you're used to using Thunderbird or other desktop readers for email, you'll feel right at home in RSSOwl.

You can find the source code for [RSSOwl][10] on GitHub under the [Eclipse Public License][11].

### Tickr

[Tickr][12] is a slightly different entry in this mix. It's a Linux desktop client, but it's not your traditional browse-and-read format. Instead, it slides your feed's headlines across a bar on your desktop like a news ticker; it's a great choice for news junkies who want to get the latest from a variety of sources. Clicking on a headline will open it in your browser of choice. It's not a dedicated reading client like the rest of the applications on this list, but if you're more interested in skimming headlines than reading every article, it's a good pick.

Tickr's source code and binaries can be found on the project's [website][13] under a GPL license.

### Tiny Tiny RSS

It would be difficult to build a list of modern RSS readers without including [Tiny Tiny RSS][14]. It's among the most popular self-hosted web-based readers, and it's chocked full of features: OPML import and export, keyboard shortcuts, sharing features, a themeable interface, an infrastructure for plug-ins, filtering capabilities, and lots more.

Tiny Tiny RSS also hosts an official [Android client][15], for those hoping to read on the go.

Both the [web][16] and [Android][17] source code for Tiny Tiny RSS can be found on GitLab under a [GPLv3 license][18].

### Winds

[Winds][19] is a modern looking self-hosted web feed reader, built on React. It makes use of a hosted machine learning personalization API called Stream, with the intent of helping you find more content that might be of interest to you based on your current interests. An online demo is available so you can [try it out][20] before you download. It's a new project, just a few months old, and so perhaps too soon to evaluate whether it's up to replace my daily feed reader yet, but it's certainly a project I'm watching with interest.

You can find the [source code][21] for Winds on GitHub under an [MIT][22] license.

* * *

These are most definitely not the only options out there. RSS is a relatively easy-to-parse, well-documented format, and so there are many, many different feed readers out there built to suit just about every taste. Here's a [big list][23] of self-hosted open source feed readers you might consider in addition to the ones we listed. We hope you'll share with us what your favorite RSS reader is in the comments below.

--------------------------------------------------------------------------------

作者简介：

Jason Baker - Jason is passionate about using technology to make the world more open, from software development to bringing sunlight to local governments. Linux desktop enthusiast. Map/geospatial nerd. Raspberry Pi tinkerer. Data analysis and visualization geek. Occasional coder. Cloud nativist. Follow him on Twitter.


--------------

via: https://opensource.com/article/17/3/rss-feed-readers

作者：[ Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/article/17/3/rss-feed-readers?rate=2sJrLq0K3QPQCznBId7K1Qrt3QAkwhQ435UyP77B5rs
[2]:https://www.flickr.com/photos/evokeartdesign/6002000807
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://www.theguardian.com/music/2017/jan/03/record-sales-vinyl-hits-25-year-high-and-outstrips-streaming
[5]:https://opensource.com/life/13/6/open-source-rss
[6]:https://miniflux.net/
[7]:https://github.com/miniflux/miniflux
[8]:https://github.com/miniflux/miniflux/blob/master/LICENSE
[9]:http://www.rssowl.org/
[10]:https://github.com/rssowl/RSSOwl
[11]:https://github.com/rssowl/RSSOwl/blob/master/LICENSE
[12]:https://www.open-tickr.net/
[13]:https://www.open-tickr.net/download.php
[14]:https://tt-rss.org/gitlab/fox/tt-rss/wikis/home
[15]:https://tt-rss.org/gitlab/fox/tt-rss-android
[16]:https://tt-rss.org/gitlab/fox/tt-rss/tree/master
[17]:https://tt-rss.org/gitlab/fox/tt-rss-android/tree/master
[18]:https://tt-rss.org/gitlab/fox/tt-rss-android/blob/master/COPYING
[19]:https://winds.getstream.io/
[20]:https://winds.getstream.io/app/getting-started
[21]:https://github.com/GetStream/Winds
[22]:https://github.com/GetStream/Winds/blob/master/LICENSE.md
[23]:https://github.com/Kickball/awesome-selfhosted#feed-readers
[24]:https://opensource.com/user/19894/feed
[25]:https://opensource.com/article/17/3/rss-feed-readers#comments
[26]:https://opensource.com/users/jason-baker
