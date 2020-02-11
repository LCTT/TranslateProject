[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top hacks for the YaCy open source search engine)
[#]: via: (https://opensource.com/article/20/2/yacy-search-engine-hacks)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Top hacks for the YaCy open source search engine
======
Rather than adapting to someone else's vision, customize you search
engine for the internet you want with YaCY.
![Browser of things][1]

In my article about [getting started with YaCy][2], I explained how to install and start using the [YaCy][3] peer-to-peer search engine. One of the most exciting things about YaCy, however, is the fact that it's a local client. Each user owns and operates a node in a globally distributed search engine infrastructure, which means each user is in full control of how they navigate and experience the World Wide Web.

For instance, Google used to provide the URL google.com/linux as a shortcut to filter searches for Linux-related topics. It was a small feature that many people found useful, but [topical shortcuts were dropped][4] in 2011. 

YaCy makes it possible to customize your search experience.

### Customize YaCy

Once you've installed YaCy, navigate to your search page at **localhost:8090**. To customize your search engine, click the **Administration** button in the top-right corner (it may be concealed in a menu icon on small screens).

The admin panel allows you to configure how YaCy uses your system resources and how it interacts with other YaCy clients.

![YaCy profile selector][5]

For instance, to configure an alternative port and set RAM and disk usage, use the **First steps** menu in the sidebar. To monitor YaCy activity, use the **Monitoring** panel. Most features are discoverable by clicking through the panels, but here are some of my favorites.

### Search appliance

Several companies have offered [intranet search appliances][6], but with YaCy, you can implement it for free. Whether you want to search through your own data or to implement a search system for local file shares at your business, you can choose to run YaCy as an internal indexer for files accessible over HTTP, FTP, and SMB (Samba). People in your local network can use your personalized instance of YaCy to find shared files, and none of the data is shared with users outside your network.

### Network configuration

YaCy favors isolation and privacy by default. You can adjust how you connect to the peer-to-peer network in the **Network Configuration** panel, which is revealed by clicking the link located at the top of the **Use Case &amp; Account** configuration screen.

![YaCy network configuration][7]

### Crawl a site

Peer-to-peer indexing is user-driven. There's no mega-corporation initiating searches on every accessible page on the internet, so a site isn't indexed until someone deliberately crawls it with YaCy.

The YaCy client provides two options to help you help crawl the web: you can perform a manual crawl, and you can make YaCy available for suggested crawls.

![YaCy advanced crawler][8]

#### Start a manual crawling job

A manual crawl is when you enter the URL of a site you want to index and start a YaCy crawl job. To do this, click the **Advanced Crawler** link in the **Production** sidebar. Enter one or more URLs, then scroll to the bottom of the page and enable the **Do remote indexing** option. This enables your client to broadcast the URLs it is indexing, so clients that have opted to accept requests can help you perform the crawl.

To start the crawl, click the **Start New Crawl Job** button at the bottom of the page. I use this method to index sites I use frequently or find useful.

Once the crawl job starts, YaCy indexes the URLs you enter and stores the index on your local machine. As long as you are running in senior mode (meaning your firewall permits incoming and outgoing traffic on port 8090), your index is available to YaCy users all over the globe.

#### Join in on a crawl

While some very dedicated YaCy senior users may crawl the internet compulsively, there are a _lot_ of sites out there in the world. It might seem impossible to match the resources of popular spiders and bots, but because YaCy has so many users, they can band together as a community to index more of the internet than any one user could do alone. If you activate YaCy to broadcast requests for site crawls, participating clients can work together to crawl sites you might not otherwise think to crawl manually.

To configure your client to accept jobs from others, click the **Advanced Crawler** link in the left sidebar menu. In the **Advanced Crawler** panel, click the **Remote Crawling** link under the **Network Harvesting** heading at the top of the page. Enable remote crawls by placing a tick in the checkbox next to the **Load** setting.

![YaCy remote crawling][9]

### YaCy monitoring and more

YaCy is a surprisingly robust search engine, providing you with the opportunity to theme and refine your experience in nearly any way you could want. You can monitor the activity of your YaCy client in the **Monitoring** panel, so you can get an idea of how many people are benefiting from the work of the YaCy community and also see what kind of activity it's generating for your computer and network.

![YaCy monitoring screen][10]

### Search engines make a difference

The more time you spend with the Administration screen, the more fun it becomes to ponder how the search engine you use can change your perspective. Your experience of the internet is shaped by the results you get back for even the simplest of queries. You might notice, in fact, how different one person's "internet" is from another person's when you talk to computer users from a different industry. For some people, the web is littered with ads and promoted searches and suffers from the tunnel vision of learned responses to queries. For instance, if someone consistently searches for answers about X, most commercial search engines will give weight to query responses that concern X. That's a useful feature on the one hand, but it occludes answers that require Y, even though that might be the better solution for a specific task.

As in real life, stepping outside a manufactured view of the world can be healthy and enlightening. Try YaCy, and see what you discover.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/yacy-search-engine-hacks

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_desktop_website_checklist_metrics.png?itok=OKKbl1UR (Browser of things)
[2]: https://opensource.com/article/20/2/open-source-search-engine
[3]: https://yacy.net/
[4]: https://www.linuxquestions.org/questions/linux-news-59/is-there-no-more-linux-google-884306/
[5]: https://opensource.com/sites/default/files/uploads/yacy-profiles.jpg (YaCy profile selector)
[6]: https://en.wikipedia.org/wiki/Vivisimo
[7]: https://opensource.com/sites/default/files/uploads/yacy-network-config.jpg (YaCy network configuration)
[8]: https://opensource.com/sites/default/files/uploads/yacy-advanced-crawler.jpg (YaCy advanced crawler)
[9]: https://opensource.com/sites/default/files/uploads/yacy-remote-crawl-accept.jpg (YaCy remote crawling)
[10]: https://opensource.com/sites/default/files/uploads/yacy-monitor.jpg (YaCy monitoring screen)
