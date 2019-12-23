[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How tracking pixels work)
[#]: via: (https://jvns.ca/blog/how-tracking-pixels-work/)
[#]: author: (Julia Evans https://jvns.ca/)

How tracking pixels work
======

I spent some time talking to a reporter yesterday about how advertisers track people on the internet. We had a really fun time looking at Firefox’s developer tools together (I’m not an internet privacy expert, but I do know how to use the network tab in developer tools!) and I learned a few things about how tracking pixels actually work in practice!

### the question: how does Facebook know that you went to Old Navy?

I often hear about this slightly creepy internet experience: you’re looking at a product online, and a day later see an ad for the same boots or whatever that you were looking at. This is called “retargeting”, but how does it actually work exactly in practice?

In this post we’ll experiment a bit and see exactly how Facebook can know what products you’ve looked at online! I’m using Facebook as an example in this blog post just because it’s easy to find websites with Facebook tracking pixels on them but of course almost every internet advertising company does this kind of tracking.

### the setup: allow third party trackers, turn off my adblocker

I use Firefox, and by default Firefox blocks a lot of this kind of tracking. So I needed to modify my Firefox privacy settings to get this tracking to work.

I changed my privacy settings from the default ([screenshot][1]) to a custom setting that allows third-party trackers ([screenshot][2]). I also disabled some privacy extensions I usually have running.

### tracking pixels: it’s not the gif, it’s the query parameters

A tracking pixel is a 1x1 gif that sites use to track you. By itself, obviously a tiny 1x1 gif doesn’t do too much. So how do tracking pixels track you? 2 ways:

  1. Sites use the **query parameters** in the tracking pixel to add extra information like the URL of the page you’re visiting. So instead of just requesting `https://www.facebook.com/tr/` (which is a 44-byte 1x1 gif), it’ll request `https://www.facebook.com/tr/?the_website_you're_on`. (email marketers use similar tricks to figure out if you’ve opened an email, by giving the tracking pixel a unique URL)
  2. Sites send **cookies** with the tracking pixel so that they can tell that the person who visited oldnavy.com is the same as the person who’s using Facebook on the same computer.



### the Facebook tracking pixel on Old Navy’s website

To test this out, I went to look at a product on the Old Navy site with the URL [https://oldnavy.gap.com/browse/product.do?pid=504753002&amp;cid=1125694&amp;pcid=1135640&amp;vid=1&amp;grid=pds_0_109_1][3] (a “Soft-Brushed Plaid Topcoat for Men”).

When I did that, the Javascript running on that page (presumably [this code][4]) sent a request to facebook.com that looks like this in Developer tools: (I censored most of the cookie values because some of them are my login cookies :) )

![][5]

Let’s break down what’s happening:

  1. My browser sends a request to ` https://www.facebook.com/tr/?id=937725046402747&ev=PageView&dl=https%3A%2F%2Foldnavy.gap.com%2Fbrowse%2Fproduct.do%3Fpid%3D504753002%26cid%3D1125694%26pcid%3Dxxxxxx0%26vid%3D1%26grid%3Dpds_0_109_1%23pdp-page-content&rl=https%3A%2F%2Foldnavy.gap.com%2Fbrowse%2Fcategory.do%3Fcid%3D1135640%26mlink%3D5155%2Cm_mts_a&if=false&ts=1576684838096&sw=1920&sh=1080&v=2.9.15&r=stable&a=tmtealium&ec=0&o=30&fbp=fb.1.1576684798512.1946041422&it=15xxxxxxxxxx4&coo=false&rqm=GET`
  2. With that request, it sends a cookie called `fr` which is set to `10oGXEcKfGekg67iy.AWVdJq5MG3VLYaNjz4MTNRaU1zg.Bd-kxt.KU.F36.0.0.Bd-kx6.` (which I guess is my Facebook ad tracking ID)



So the three most notable things that are being sent in the tracking pixel query string are:

  * the page I visited: [https://oldnavy.gap.com/browse/product.do?pid=504753002&amp;cid=1125694&amp;pcid=1135640&amp;vid=1&amp;grid=pds_0_109_1#pdp-page-content][6]
  * the page that referred me to that page: [https://oldnavy.gap.com/browse/category.do?cid=1135640&amp;mlink=5155,m_mts_a][7]
  * an identifier cookie for me: `10oGXEcKfGekg67iy.AWVdJq5MG3VLYaNjz4MTNRaU1zg.Bd-kxt.KU.F36.0.0.Bd-kx6.`



### now let’s visit Facebook!

Next, let’s visit Facebook, where I’m logged in. What cookies is my browser sending Facebook?

Unsurprisingly, it’s the same `fr` cookie from before: `10oGXEcKfGekg67iy.AWVdJq5MG3VLYaNjz4MTNRaU1zg.Bd-kxt.KU.F36.0.0.Bd-kx6.`. So Facebook now definitely knows that I (Julia Evans, the person with this Facebook account) visited the Old Navy website a couple of minutes ago and looked at a “Soft-Brushed Plaid Topcoat for Men”, because they can use that identifier to match up the data.

### these cookies are third-party cookies

The `fr` cookie that Facebook is using to track what websites I go to is called a “third party cookie”, because Old Navy’s website is using it to identify me to a third party (facebook.com). This is different from first-party cookies, which are used to keep you logged in.

Safari and Firefox both block many third-party cookies by default (which is why I had to change Firefox’s privacy settings to get this experiment to work), and as of today Chrome doesn’t (presumably because Chrome is owned by an ad company).

### sites have lots of tracking pixels

Like I expected, sites have **lots** of tracking pixels. For example, wrangler.com loaded 19 different tracking pixels in my browser from a bunch of different domains. The tracking pixels on wrangler.com came from: `ct.pinterest.com`, `af.monetate.net`, `csm.va.us.criteo.net`, `google-analytics.com`, `dpm.demdex.net`, `google.ca`, `a.tribalfusion.com`, `data.photorank.me`, `stats.g.doubleclick.net`, `vfcorp.dl.sc.omtrdc.net`, `ib.adnxs.com`, `idsync.rlcdn.com`, `p.brsrvr.com`, and `adservice.google.com`.

For most of these trackers, Firefox helpfully pointed out that it would have blocked them if I was using the standard Firefox privacy settings:

![][8]

### why browsers matter

The reason browsers matter so much is that your browser has the final word on what information it sends about you to which websites. The Javascript on the Old Navy’s website can ask your browser to send tracking information about you to Facebook, but your browser doesn’t have to do it! It can decide “oh yeah, I know that facebook.com/tr/ is a tracking pixel, I don’t want my users to be tracked, I’m just not going to send that request”.

And it can make that behaviour configurable by changing browser settings or installing browser extensions, which is why there are lots of privacy extensions.

### it’s fun to see how this works!

I think it’s fun to see how cookies / tracking pixels are used to track you in practice, even if it’s kinda creepy! I sort of knew how this worked before but I’d never actually looked at the cookies on a tracking pixel myself or what kind of information it was sending in its query parameters exactly.

And if you know how it works, it’s a easier to figure out how to be tracked less!

### what can you do?

I do a few small things to get tracked on the internet a little less:

  * install an adblocker (like ublock origin or something), which will block a lot of tracker domains
  * use Firefox/Safari instead of Chrome (which have stronger default privacy settings right now)
  * use the [Facebook Container][9] Firefox extension, which takes extra steps to specifically prevent Facebook from tracking you



There are still lots of other ways to be tracked on the internet (especially when using mobile apps where you don’t have the same kind of control as with your browser), but I like understanding how this one method of tracking works and think it’s nice to be tracked a little bit less.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/how-tracking-pixels-work/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/images/trackers.png
[2]: https://jvns.ca/images/firefox-insecure-settings.png
[3]: https://oldnavy.gap.com/browse/product.do?pid=504753002&cid=1125694&pcid=1135640&vid=1&grid=pds_0_109_1
[4]: https://developers.facebook.com/docs/facebook-pixel/implementation/
[5]: https://jvns.ca/images/fb-old-navy.png
[6]: https://oldnavy.gap.com/browse/product.do?pid=504753002&cid=1125694&pcid=1135640&vid=1&grid=pds_0_109_1#pdp-page-content
[7]: https://oldnavy.gap.com/browse/category.do?cid=1135640&mlink=5155,m_mts_a
[8]: https://jvns.ca/images/firefox-helpful.png
[9]: https://addons.mozilla.org/en-CA/firefox/addon/facebook-container/
