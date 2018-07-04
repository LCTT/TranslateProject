5 Best Feed Reader Apps for Linux
======

**Brief: Extensively use RSS feeds to stay updated with your favorite websites? Take a look at the best feed reader applications for Linux.**

[RSS][1] feeds were once most widely used, to collect news and articles from different sources at one place. It is often perceived that [RSS usage is in decline][2]. However, there are still people (like me) who believe in opening an application that accumulates all the website’s articles at one place, which they can read later even when they are not connected to the internet.

Feed Readers makes it easier by collecting all the published items on a website for anytime access. You don’t need to open several browser tabs to go to your favorite websites, and bookmarking the one you liked.

In this article, I’ll share some of my favorite feed reader applications for Linux desktop.

### Best Feed Readers for Linux

![Best Feed Readers for Linux][3]

As usual, Linux has multiple choices for feed readers and in this article, we have compiled the 5 good feed readers applications for you. The list is no particular order.

#### 1\. Akregator – Feed Reader

[Akregator][4] is a KDE product which is easy to use and powerful enough to provide latest updates from news sites, blogs and RSS/Atom enabled websites.

It comes with an internal browser for news reading and updated the feed in real time.

##### Features

  * You can add a website’s feed using “Ädd Feed” options and define an interval to refresh and update subscribe feeds.
  * It can store and archive contents – the setting of which can be defined on a global level or on individual feeds.
  * Features option to import subscribed feeds from another browser or a past back up.
  * Notifies you of the unread feeds.



##### How to install Akregator

If you are running KDE desktop, most probably Akregator is already installed on your system. If not, you can use the below command for Debian based systems.
```
sudo apt install akregator

```

Once installed, you can directly add a website by clicking on Feed menu and then **Add feed** and giving the website name. This is how It’s FOSS feed looks like when added.

![][5]

#### 2\. QuiteRSS

[QuiteRSS][6] is another free and open source RSS/Atom news feed reader with lots of features. There are additional features like proxy integration, adblocker, integrated browser, and system tray integration. It’s easier to update feeds by setting up a timer to refresh.

##### Features

  * Automatic feed updation on either start up or using a timer option.
  * Searching feed URL using website address and categorizing them in new, unread, starred and deleted section.
  * Embedded browser so that you don’t leave the app.
  * Hiding images, if you are only interested in text.
  * Adblocker and better system tray integration.
  * Multiple language support.



##### How to install QuiteRSS

You can install it from the QuiteRSS ppa.
```
sudo add-apt-repository ppa:quiterss/quiterss
sudo apt-get update
sudo apt-get install quiterss

```

![][7]

#### 3\. Liferea

Linux Feed Reader aka [Liferea][8] is probably the most used feed aggregator on Linux platform. It is fast and easy to use and supports RSS / Atom feeds. It has support for podcasts and there is an option for adding custom scripts which can run depending upon your actions.

There’s a browser integration while you still have the options to open an item in a separate browser.

##### Features

  * Liferea can download and save feeds from your favorite website to read offline.
  * It can be synced with other RSS feed readers, making a transition easier.
  * Support for Podcasts.
  * Support for search folders, which allows users to save searches.



##### How to install Liferea

Liferea is available in the official repository for almost all the distributions. Ubuntu-based users can install it by using below command:
```
sudo apt-get install liferea

```

![][9]

#### 4\. FeedReader

[FeedReader][10] is a simple and elegant RSS desktop client for your web-based RSS accounts. It can work with Feedbin, Feedly, FreshRSS, Local RSS among others and has options to send it over mail, tweet about it etc.

##### Features

  * There are multiple themes for formatting.
  * You can customize it according to your preferences.
  * Supports notifications and podcasts.
  * Fast searches and various filters are present, along with several keyboard shortcuts to make your reading experience better.



##### How to install FeedReader

FeedReader is available as a Flatpak for almost every Linux distribution.
```
flatpak install http://feedreader.xarbit.net/feedreader-repo/feedreader.flatpakref

```

It is also available in Fedora repository:
```
sudo dnf install feedreader

```

And, in Arch User Repository.
```
yaourt -S feedreader

```

![][11]

#### 5\. Newsbeuter: RSS feed in terminal

[Newsbeuter][12] is an open source feed reader for terminal lovers. There is an option to add and delete an RSS feed and to get the content on the terminal itself. Newsbeuter is loved by people who spend more time on the terminal and want their feed to be clutter free from images and ads.

##### How to install Newsbeuter
```
sudo apt-get install newsbeuter

```

Once installation completes, you can launch it by using below command
```
newsbeuter

```

To add a feed in your list, edit the urls file and add the RSS feed.
```
vi ~/.newsbeuter/urls
>> http://feeds.feedburner.com/itsfoss

```

To read the feeds, launch newsbeuter and it will display all the posts.

![][13]

You can get the useful commands at the bottom of the terminal which can help you in using newsbeuter. You can read this [manual page][14] for detailed information.

#### Final Words

To me, feed readers are still relevant, especially when you follow multiple websites and blogs. The offline access to your favorite website and blog’s content with options to archive and search is the biggest advantage of using a feed reader.

Do you use a feed reader on your Linux system? If yes, tell us your favorite one in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/feed-reader-apps-linux/

作者：[Ambarish Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://en.wikipedia.org/wiki/RSS
[2]:http://andrewchen.co/the-death-of-rss-in-a-single-graph/
[3]:https://itsfoss.com/wp-content/uploads/2018/04/best-feed-reader-apps-linux.jpg
[4]:https://www.kde.org/applications/internet/akregator/
[5]:https://itsfoss.com/wp-content/uploads/2018/02/Akregator2-800x500.jpg
[6]:https://quiterss.org/
[7]:https://itsfoss.com/wp-content/uploads/2018/02/QuiteRSS2.jpg
[8]:https://itsfoss.com/liferea-rss-client/
[9]:https://itsfoss.com/wp-content/uploads/2018/02/Liferea-800x525.png
[10]:https://jangernert.github.io/FeedReader/
[11]:https://itsfoss.com/wp-content/uploads/2018/02/FeedReader2-800x465.jpg
[12]:https://newsbeuter.org/
[13]:https://itsfoss.com/wp-content/uploads/2018/02/newsbeuter.png
[14]:http://manpages.ubuntu.com/manpages/bionic/man1/newsbeuter.1.html
