[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Newsboat – A Command line RSS/Atom Feed Reader For Text Consoles)
[#]: via: (https://www.ostechnix.com/newsbeuter-command-line-rssatom-feed-reader-unix-like-systems/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Newsboat – A Command line RSS/Atom Feed Reader For Text Consoles
======

![Newsboat RSS/Atom Feed reader][1]

**Newsboat** , a fork of Newsbeuter, is a free, open source RSS/Atom feed reader for text consoles. It supports GNU/Linux, FreeBSD, Mac OS X, and other Unix-like operating systems. Compared to other slow and huge amount of memory consumed RSS feed readers, Newsboat is the best choice for anyone who are looking for a simple, slick and fast feed reader that can be completely managed via keyboard.

Concerning about the features, we can list the following:

  * Subscribe to RSS 0.9x, 1.0, 2.0 and Atom feeds.
  * Download podcasts.
  * Configure your keyboard shortcuts as per your wish.
  * Search through all downloaded articles.
  * Categorize and query your subscriptions with a flexible tag system.
  * Integrate any data source through a flexible filter and plugin system.
  * Automatically remove unwanted articles through a “killfile”.
  * Define “meta feeds” using a powerful query language.
  * Synchronize newsboatr with your bloglines.com account.
  * Import and exporting your subscriptions with the widely used OPML format.
  * Customize the look and feel of Newsboat as per your liking.
  * Keep all your feeds in sync with Google Reader.
  * And many.



In this brief guide, let us see how to install and use Newsboat in Linux.

### Newsboat – A Command line RSS/Atom Feed Reader

##### Installation

**On Arch Linux and derivatives:**

Newsboat is available in the [Community] repository of Arch Linux. So, you can install it using [**Pacman**][2] command as shown below.

```
$ sudo pacman -S newsboat
```

**On Debian, Ubuntu, Linux Mint:**

It is also available in the default repositories of DEB based systems such as Ubuntu, Linux Mint. To install it, run the following command:

```
$ sudo apt-get install newsboat
```

**On Fedora:**

Newsboat is available in the official repositories of Fedora. To install it, run:

```
$ sudo dnf install newsboat
```

Newsboat is also available as [**Snap**][3], so you can install it using command:

```
$ sudo snap install newsboat
```

Once installed, launch it using command:

```
$ newsboat
```

**Sample output:**

```
Starting newsboat 2.10.2...
Loading configuration...done.
Opening cache...done.
Loading URLs from /home/sk/.newsboat/urls...done.
Error: no URLs configured. Please fill the file /home/sk/.newsboat/urls with RSS feed URLs or import an OPML file.

newsboat 2.10.2
usage: newsboat [-i <file>|-e] [-u <urlfile>] [-c <cachefile>] [-x <command> ...] [-h]
-e, --export-to-opml export OPML feed to stdout
-r, --refresh-on-start refresh feeds on start
-i, --import-from-opml=<file> import OPML file
-u, --url-file=<urlfile> read RSS feed URLs from <urlfile>
-c, --cache-file=<cachefile> use <cachefile> as cache file
-C, --config-file=<configfile> read configuration from <configfile>
-X, --vacuum compact the cache
-x, --execute=<command>... execute list of commands
-q, --quiet quiet startup
-v, --version get version information
-l, --log-level=<loglevel> write a log with a certain loglevel (valid values: 1 to 6)
-d, --log-file=<logfile> use <logfile> as output log file
-E, --export-to-file=<file> export list of read articles to <file>
-I, --import-from-file=<file> import list of read articles from <file>
-h, --help this help
```

As you see in the above screenshot, we haven’t added any URLs yet in Newsboat.

##### Managing Feeds

We can add, edit, tag, and delete feeds by editing the **urls** file. The default urls file is **~/.newsboat/urls**. If it is not available, just create it.

**Add feeds**

To add a feed, edit this file

```
$ vi ~/.newsboat/urls
```

Then, add the feed URLs one by one.

```
http://feeds.feedburner.com/Ostechnix
```

If the feed URL has protected with user name and password, you need to mention the username and password as shown below.

```
http://username:[email protected]/feed.rss
```

After adding all urls, save and close the file.

**Add tags to the feeds**

You can add one or more tags to categorize the feeds as per your liking. Specify the tags separated by space if you want to add more than one tags to a single feed. If you want to specify a single tag that contains a space, just mention it within double quotes like below.

```
http://feeds.feedburner.com/Ostechnix "All Linux news"
https://www.archlinux.org/feeds/packages/ "Only Arch Linux related news"
```

**Read feeds**

To read feeds, just launch the Newsboat utility from the Terminal using command:

```
$ newsboat
```

Sample output:

![][4]

Newsboat Rss feed reader

As you see in the above screenshot, I have added two RSS feeds. You can now start downloading the feeds, either by pressing **“R”** to download all feeds, or by pressing **“r”** to download the currently selected feed.

Now, you will see the list of recent items in each feed.

![][5]

Alternatively, you can run the following command to refresh feeds on start:

```
$ newsboat -r
```

Use **Up/Down** arrows to choose a feed and hit **ENTER** key to open the currently selected feed.

![][6]

Press ENTER key to open the selected entry:

![][7]

To open the entry in your default web browser, simply press **o**.

Here is the list of keyboard controls to manage your feeds.

  * Press **n** to go the next unread entry.
  * Press **o** to open the selected entry in default web browser.
  * Press **r** (small letter) to reload the currently selected feed.
  * Press **R** (capital) to reload all feeds.
  * Press **A** to mark as read.
  * Press **/** to search for a specific entry.
  * Press **s** to save single entry or all entries.
  * Press **e** to enqueue.
  * Press **?** (question mark) to open the help window at any time.
  * And press **q** to go back and exit.



**Remove feeds**

To remove the feeds, just delete the URL in the urls file.

**Useful tip for Arch Linux users**

If you’re using a Arch based Linux distribution, I know a good way to read the Arch news page before updating your system. The reason for doing this is you can read the Arch news about current updating issues before actually updating your Arch Linux.

Add the Arch news link in **~/.newsboat/urls** file:

```
$ https://www.archlinux.org/feeds/news/
```

Open your **~/.bashrc** file and add the following line:

```
alias update='newsboat -r && sudo pacman -Syu'
```

Replace ‘update’ with any alias name of your choice.

Now, run the following command to update your Arch Linux system.

```
$ update
```

Whenever you run the above command, it will load the Arch news feed in your Terminal. You can simply read about current issues and then update the Arch Linux system.

For more details, refer the Newsboat help section using command:

```
$ newsboat -h
```

Also, refer the [**official documentation**][8] page for more detailed information.

And, that’s all. Hope this helps. I will be soon here with another useful guide. If you find this article helpful, please take a moment to share it on your social, professional networks and support OSTechNix.

**Resources:**

  * [**Newsboat website**][9]
  * [**Newsboat GtiHub Repository**][10]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/newsbeuter-command-line-rssatom-feed-reader-unix-like-systems/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2017/07/Newsboat-RSS-Atom-Feed-reader-720x340.png
[2]: https://www.ostechnix.com/getting-started-pacman/
[3]: https://www.ostechnix.com/introduction-ubuntus-snap-packages/
[4]: https://www.ostechnix.com/wp-content/uploads/2017/07/Newsboat.png
[5]: https://www.ostechnix.com/wp-content/uploads/2017/07/Load-new-feeds.png
[6]: https://www.ostechnix.com/wp-content/uploads/2017/07/Newboat1.png
[7]: https://www.ostechnix.com/wp-content/uploads/2017/07/Open-Rss-feed-entry.png
[8]: https://newsboat.org/releases/2.16.1/docs/newsboat.html
[9]: https://newsboat.org/
[10]: https://github.com/newsboat/newsboat
