[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Browse the Peer-to-peer Web With Beaker Browser)
[#]: via: (https://itsfoss.com/beaker-browser/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Browse the Peer-to-peer Web With Beaker Browser
======

The Internet as we know it has existed unchanged (more or less) for the last 50 years. People across the globe use their devices to retrieve data from huge servers dotted around the world.

A group of dedicated technologists wants to change that to make the internet a place where people can connect and share information directly instead of relying on a central server (decentralization).

There are a bunch of such decentralized services that we have already covered on It’s FOSS. [LBRY as YouTube alternative][1], [Mastodon as Twitter alternative][2] are just a couple of such examples.

And today I am going to cover another such product called [Beaker Browser][3] which is essentially for browsing the peer to peer web.

![Beaker Browser][4]

### What is the ‘peer-to-peer Web’?

According to [one of the devs][5] behind the Beaker browser, “The P2P Web is an experimental set of technologies…to give users more control over the Web.”

Further, they say that the peer-to-peer Web has three main principles: anybody can be a server; multiple computers can serve the same site; there is no back end.

As you can see from those principles. the idea of the peer-to-peer Web is very similar to BitTorrent where files are seeded by multiple peers and those peers share the bandwidth load. This reduces the overall bandwidth that a person needs to provide for their site.

![Beaker Browser Settings][6]

The other major part of the peer-to-peer Web is creator control of their ideas. In this day and age, platforms being controlled by large corporations, who try to use your data for their benefit. Beaker returns control to the content creators.

### Browsing the decentralized web with Beaker

The [Beaker Browser][3] first came into existence in 2016. The project (and the technology that surrounds it) is created by a team of three at [Blue Link Labs][7]. The Beaker Browser uses the [Dat protocol][8] to share data between computers. All websites that use the Dat protocol start with `dat://` instead of `http://`.

The strengths of the Dat protocol are:

  * Fast – Archives sync from multiple sources at once.
  * Secure – All updates are signed and integrity-checked.
  * Resilient – Archives can change hosts without changing their URLs.
  * Versioned – Changes are written to an append-only version log.
  * Decentralized – Any device can host any archive.



![Beaker Browser Seeding][9]

The Beaker Browser is essentially a cut down version of Chromium with built-in support for `dat://`addresses. It can still visit regular `http://` sites.

Each time you visit a dat site, the content for that site is downloaded to your computer as you request it. For example, a picture of Linux Torvalds on the about page of a site is not downloaded until you navigate to that page.

Also, once you visit a dat website, “[you temporarily][10] re-upload or seed whichever files you’ve downloaded from the website.” You can also choose to seed the website to help its creator.

![Beaker Browser Menu][11]

Since the whole idea of Beaker is to create a more open web, you can easily view the source of any website. Unlike most browsers where you just see the source code the current page, you are viewing, Beaker shows you the entire structure of the site in a GitHub-like view. You can even fork the site and host your version of it.

Besides visiting dat-based websites, you can also create your own site. In the Beaker Browser menu, there is an option to create a new website or an empty project. If you select the option to create a new website, Beaker will build a little demo site that you can edit with the browser’s built-in editor.

However, if you are like me and prefer to use Markdown, you can choose to create an empty project. Beaker will create the structure of a site and assign it a `dat://`address. Create an `index.md` file and you are good to go. There is a [short tutorial][12] with more info. You can also use the create empty project option to build a web app.

![Beaker Browser Website Template][13]

Since Beaker acts as a web server and site seeder, any time you close it or turn off your computer your site will become unavailable. Thankfully, you don’t have to run your computer or the browser constantly. You can also use a seeding service named [Hashbase][14] or you can set up a [`homebase`][15] seeding server.

Though Beaker is [available][16] for Linux, Windows, and macOS. If you do start playing around Beaker, be sure to take a quick look at [their gui][17][d][17][es][17].

### Beaker Browser is not for everyone but it has a purpose

When I first got this assignment, I had high hopes for the Beaker Browser. As it stands now, it’s still very experimental. A number of the dat sites that I tried to visit were unavailable because the user was not seeding their site. Beaker does have an option to notify you when that site is back online.

![Beaker Browser No Peer][18]

Another problem is that Beaker is a really stripped down version of Chromium. There is no option to install extensions or themes. Instead, you are stuck with a white theme and a very limited toolset. I would not use this as my main browser and having access to the world of dat websites is not enough of a reason to keep it installed on my system.

I looked to see if there is an extension for Firefox that would add support for the `dat://` protocol. I did find such an extension, but it also required the installation of a couple of other pieces of software. It’s just easier to install Beaker.

As it stands now, Beaker is not for me. Maybe in the future, more people will start using Beaker or the dat protocol will gain support by other browsers. Then it might be interesting. Right now, it’s kinda empty.

As part of my time with Beaker, I created a [website][19] using the built-in tools. Don’t worry, I made sure that it’s seeded.

![Beaker Bowser Site Source][20]

What are your thoughts on the Beaker Brower? What are your thoughts on the peer-to-peer web? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News, or [Reddit][21].

--------------------------------------------------------------------------------

via: https://itsfoss.com/beaker-browser/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/lbry/
[2]: https://itsfoss.com/mastodon-open-source-alternative-twitter/
[3]: https://beakerbrowser.com/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser.jpg?resize=800%2C426&ssl=1
[5]: https://pfrazee.hashbase.io/blog/what-is-the-p2p-web
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-bowser-setting.jpg?resize=800%2C573&ssl=1
[7]: https://bluelinklabs.com/
[8]: https://www.datprotocol.com/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-bowser-seedding.jpg?resize=800%2C466&ssl=1
[10]: https://beakerbrowser.com/docs/faq/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser-menu.jpg?ssl=1
[12]: https://beakerbrowser.com/docs/guides/create-a-markdown-site
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser-website-template.jpg?resize=800%2C459&ssl=1
[14]: https://hashbase.io/
[15]: https://github.com/beakerbrowser/homebase
[16]: https://beakerbrowser.com/install/
[17]: https://beakerbrowser.com/docs/guides/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-browser-no-peer.jpg?resize=800%2C424&ssl=1
[19]: https://41bfbd06731e8d9c5d5676e8145069c69b254e7a3b710ddda4f6e9804529690c/
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/beaker-bowser-source.jpg?resize=800%2C544&ssl=1
[21]: https://reddit.com/r/linuxusersgroup
