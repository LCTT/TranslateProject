[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get your RSS feeds and podcasts in one place with this open source tool)
[#]: via: (https://opensource.com/article/20/1/open-source-rss-feed-reader)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Get your RSS feeds and podcasts in one place with this open source tool
======
Keep up with your news feed and podcasts with Newsboat in the twelfth in
our series on 20 ways to be more productive with open source in 2020.
![Ship captain sailing the Kubernetes seas][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Access your RSS feeds and podcasts with Newsboat

RSS news feeds are an exceptionally handy way to keep up to date on various websites. In addition to Opensource.com, I follow the annual [SysAdvent][2] sysadmin tools feed, some of my favorite authors, and several webcomics. RSS readers allow me to "batch up" my reading, so I'm not spending every day on a bunch of different websites.

![Newsboat][3]

[Newsboat][4] is a terminal-based RSS feed reader that looks and feels a lot like the email program [Mutt][5]. It makes news reading easy and has a lot of nice features.

Installing Newsboat is pretty easy since it is included with most distributions (and Homebrew on MacOS). Once it is installed, adding the first feed is as easy as adding the URL to the **~/.newsboat/urls** file. If you are migrating from another feed reader and have an OPML file export of your feeds, you can import that file with:


```
`newsboat -i </path/to/my/feeds.opml>`
```

After you've added your feeds, the Newsboat interface is _very_ familiar, especially if you've used Mutt. You can scroll up and down with the arrow keys, check for new items in a feed with **r**, check for new items in all feeds with **R**, press **Enter** to open a feed and select an article to read.

![Newsboat article list][6]

You are not limited to just the local URL list, though. Newsboat is also a client for news reading services like [Tiny Tiny RSS][7], ownCloud and Nextcloud News, and a few Google Reader successors. Details on that and a whole host of other configuration options are covered in [Newsboat's documentation][8].

![Reading an article in Newsboat][9]

#### Podcasts

Newsboat also provides [podcast support][10] through Podboat, an included application that facilitates downloading and queuing podcast episodes. While viewing a podcast feed in Newsboat, press **e** to add the episode to your download queue. All the information will be stored in a queue file in the **~/.newsboat** directory. Podboat reads this queue and downloads the episode(s) to your local drive. You can do this from the Podboat user interface (which looks and acts like Newsboat), or you can tell Podboat to download them all with **podboat -a**. As a podcaster and podcast listener, I think this is _really_ handy.

![Podboat][11]

Overall, Newsboat has some really great features and is a nice, lightweight alternative to web-based or desktop apps.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-rss-feed-reader

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://sysadvent.blogspot.com/
[3]: https://opensource.com/sites/default/files/uploads/productivity_12-1.png (Newsboat)
[4]: https://newsboat.org
[5]: http://mutt.org/
[6]: https://opensource.com/sites/default/files/uploads/productivity_12-2.png (Newsboat article list)
[7]: https://tt-rss.org/
[8]: https://newsboat.org/releases/2.18/docs/newsboat.html
[9]: https://opensource.com/sites/default/files/uploads/productivity_12-3.png (Reading an article in Newsboat)
[10]: https://newsboat.org/releases/2.18/docs/newsboat.html#_podcast_support
[11]: https://opensource.com/sites/default/files/uploads/productivity_12-4.png (Podboat)
