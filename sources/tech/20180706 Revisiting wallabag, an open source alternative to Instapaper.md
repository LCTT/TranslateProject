Revisiting wallabag, an open source alternative to Instapaper
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Back in 2014, I [wrote about wallabag][1], an open source alternative to read-it-later applications like Instapaper and Pocket. Go take a look at that article if you want to. Don't worry, I'll wait for you.

Done? Great!

In the four years since I wrote that article, a lot about [wallabag][2] has changed. It's time to take a peek to see how wallabag has matured.

### What's new

The biggest change took place behind the scenes. Wallabag's developer Nicolas Lœuillet and the project's contributors did a lot of tinkering with the code, which improved the application. You see and feel the changes wrought by wallabag's newer codebase every time you use it.

So what are some of those changes? There are [quite a few][3]. Here are the ones I found most interesting and useful.

Besides making wallabag a bit snappier and more stable, the application's ability to import and export content has improved. You can import articles from Pocket and Instapaper, as well as articles marked as "To read" in bookmarking service [Pinboard][4]. You can also import Firefox and Chrome bookmarks.

You can also export your articles in several formats including EPUB, MOBI, PDF, and plaintext. You can do that for individual articles, all your unread articles, or every article—read and unread. The version of wallabag that I used four years ago could export to EPUB and PDF, but that export was balky at times. Now, those exports are quick and smooth.

Annotations and highlighting in the web interface now work much better and more consistently. Admittedly, I don't use them often—but they don't randomly disappear like they sometimes did with version 1 of wallabag.

![](https://opensource.com/sites/default/files/uploads/wallabag-annotation.png)

The look and feel of wallabag have improved, too. That's thanks to a new theme inspired by [Material Design][5]. That might not seem like a big deal, but that theme makes wallabag a bit more visually attractive and makes articles easier to scan and read. Yes, kids, good UX can make a difference.

![](https://opensource.com/sites/default/files/uploads/wallabag-theme.png)

One of the biggest changes was the introduction of [a hosted version][6] of wallabag. More than a few people (yours truly included) don't have a server to run web apps and aren't entirely comfortable doing that. When it comes to anything technical, I have 10 thumbs. I don't mind paying € 9 (just over US$ 10 at the time I wrote this) a year to get a fully working version of the application that I don't need to watch over.

### What hasn't changed

Overall, wallabag's core functions are the same. The updated codebase, as I mentioned above, makes those functions run quite a bit smoother and quicker.

Wallabag's [browser extensions][7] do the same job in the same way. I've found that the extensions work a bit better than they did when I first tried them and when the application was at version 1.

### What's disappointing

The mobile app is good, but it's not great. It does a good job of rendering articles and has a few configuration options. But you can't highlight or annotate articles. That said, you can use the app to dip into your stock of archived articles.

![](https://opensource.com/sites/default/files/uploads/wallabag-android.png)

While wallabag does a great job collecting articles, there are sites whose content you can't save to it. I haven't run into many such sites, but there have been enough for the situation to be annoying. I'm not sure how much that has to do with wallabag. Rather, I suspect it has something to do with the way the sites are coded—I ran into the same problem while looking at a couple of proprietary read-it-later tools.

Wallabag might not be a feature-for-feature replacement for Pocket or Instapaper, but it does a great job. It has improved noticeably in the four years since I first wrote about it. There's still room for improvement, but does what it says on the tin.

### Final thoughts

Since 2014, wallabag has evolved. It's gotten better, bit by bit and step by step. While it might not be a feature-for-feature replacement for the likes of Instapaper and Pocket, wallabag is a worthy open source alternative to proprietary read-it-later tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/wallabag

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/life/14/4/open-source-read-it-later-app-wallabag
[2]:https://wallabag.org/en
[3]:https://www.wallabag.org/en/news/wallabag-v2
[4]:https://pinboard.in
[5]:https://en.wikipedia.org/wiki/Material_Design
[6]:https://www.wallabag.it
[7]:https://github.com/wallabag/wallabagger
