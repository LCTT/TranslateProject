[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customize your internet with an open source search engine)
[#]: via: (https://opensource.com/article/20/2/open-source-search-engine)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Customize your internet with an open source search engine
======
Get started with YaCy, an open source, P2P web indexer.
![Person using a laptop][1]

A long time ago, the internet was small enough to be indexed by a few people who gathered the names and locations of all websites and listed them each by topic on a page or in a printed book. As the World Wide Web network grew, the "web rings" convention developed, in which sites with a similar theme or topic or sensibility banded together to form a circular path to each member. A visitor to any site in the ring could click a button to proceed to the next or previous site in the ring to discover new sites relevant to their interest.

Then for a while, it seemed the internet outgrew itself. Everyone was online, there was a lot of redundancy and spam, and there was no way to find anything. Yahoo and AOL and CompuServe and similar services had unique approaches, but it wasn't until Google came along that the modern model took hold. According to Google, the internet was meant to be indexed, sorted, and ranked through a search engine.

### Why choose an open source alternative?

Search engines like Google and DuckDuckGo are demonstrably effective. You may have reached this site through a search engine. While there's a debate to be had about content falling through the cracks because a host chooses not to follow best practices for search engine optimization, the modern solution for managing the wealth of culture and knowledge and frivolity that is the internet is relentless indexing.

But maybe you prefer not to use Google or DuckDuckGo because of privacy concerns or because you're looking to contribute to an effort to make the internet more independent. If that appeals to you, then consider participating in [YaCy][2], the peer-to-peer internet indexer and search engine.

### Install YaCy

To install and try YaCy, first ensure you have Java installed. If you're on Linux, you can follow the instructions in my [_How to install Java on Linux_][3] article. If you're on Windows or MacOS, obtain an installer from [AdoptOpenJDK.net][4].

Once you have Java installed, [download the installer][5] for your platform.

If you're on Linux, unarchive the tarball and move it to the **/opt** directory:


```
`$ sudo tar --extract --file  yacy_*z --directory /opt`
```

Start YaCy according to instructions for the installer you downloaded.

On Linux, start YaCy running in the background:


```
`$ /opt/startYACY.sh &`
```

In a web browser, navigate to **localhost:8090** and search.

![YaCy start page][6]

### Add YaCy to your URL bar

If you're using the Firefox web browser, you can make YaCy your default search engine in the Awesome Bar (that's Mozilla's name for the URL field) with just a few clicks.

First, make the dedicated search bar visible in the Firefox toolbar, if it's not already (you don't have to keep the search bar visible; you only need it active long enough to add a custom search engine). The search bar is available in the hamburger menu in the upper-right corner of Firefox in the **Customize** menu. Once the search bar is visible in your Firefox toolbar, navigate to **localhost:8090**, and click the magnifying glass icon in the Firefox search bar you just added. Click the option to add YaCy to your Firefox search engines.

![Adding YaCy to Firefox][7]

Once this is done, you can mark it as your default in Firefox preferences, or just use it selectively in searches performed in the Firefox search bar. If you set it as your default search engine, then you may have no need for the dedicated search bar because the default engine is also used by the Awesome Bar, so you can remove it from your toolbar.

### How to a P2P search engine works

YaCy is an open source and distributed search engine. It's written in [Java][8], so it runs on any platform, and it performs web crawls, indexing, and searching. It's a peer-to-peer (P2P) network, so every user running YaCy joins in the effort to track the internet as it changes from day to day. Of course, no single user possesses a full index of the entire internet because that would take a data center to house, but the index is distributed and redundant across all YaCy users. It's a lot like BitTorrent (as it uses distributed hash tables, or DHT, to reference index entries), except the data you're sharing is a matrix of words and URL associations. By mixing the results returned by the hash tables, no one can tell who has searched for what words, so all searches are functionally anonymous. It's an effective system for unbiased, ad-free, untracked, and anonymous searches, and you can join in just by using it.

### Search engines and algorithms

The act of indexing the internet refers to separating a web page into the singular words on it, then associating the page's URL with each word. Searching for one or more words in a search engine fetches all URLs associated with the query. That's one thing the YaCy client does while running.

The other thing the client does is provide a search interface for your browser. Instead of navigating to Google when you want to search, you can point your web browser to **localhost:8090** to search YaCy. You may even be able to add it to your browser's search bar (depending on your browser's extensibility), so you can search from the URL bar.

### Firewall settings for YaCy

When you first start using YaCy, it's probably running in "junior" mode. This means that the sites your client crawls are available only to you because no other YaCy client can reach your index entries. To join the P2P experience, you must open port 8090 in your router's firewall and possibly your software firewall if you're running one. This is called "senior" mode.

If you're on Linux, you can find out more about your computer's firewall in [_Make Linux stronger with firewalls_][9]. On other platforms, refer to your operating system's documentation.

A firewall is almost always active on the router provided by your internet service provider (ISP), and there are far too many varieties of them to document accurately here. Most routers provide the option to "poke a hole" in your firewall because many popular networked games require two-way traffic.

If you know how to log into your router (it's often either 192.168.0.1 or 10.1.0.1, but can vary depending on the manufacturer's settings), then log in and look for a configuration panel controlling the _firewall_ or _port forwarding_ or _applications_.

Once you find the preferences for your router's firewall, add port 8090 to the whitelist. For example:

![Adding YaCy to an ISP router][10]

If your router is doing port forwarding, then you must forward the incoming traffic to your computer's IP address, using the same port. For example:

![Adding YaCy to an ISP router][11]

If you can't adjust your firewall settings for any reason, that's OK. YaCy will continue to run and operate as a client of the P2P search network in junior mode.

### An internet of your own

There's much more you can do with the YaCy search engine than just search passively. You can force crawls of underrepresented websites, you can request the network crawl a site, you can choose to use YaCy for just on-premises searches, and much more. You have better control over what _your_ internet looks like. The more senior users there are, the more sites indexed. The more sites indexed, the better the experience for all users. Join in!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/open-source-search-engine

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://yacy.net/
[3]: https://opensource.com/article/19/11/install-java-linux
[4]: https://adoptopenjdk.net/releases.html
[5]: https://yacy.net/download_installation/
[6]: https://opensource.com/sites/default/files/uploads/yacy-startpage.jpg (YaCy start page)
[7]: https://opensource.com/sites/default/files/uploads/yacy-add-firefox.jpg (Adding YaCy to Firefox)
[8]: https://opensource.com/resources/java
[9]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[10]: https://opensource.com/sites/default/files/uploads/router-add-app.jpg (Adding YaCy to an ISP router)
[11]: https://opensource.com/sites/default/files/uploads/router-add-app1.jpg (Adding YaCy to an ISP router)
