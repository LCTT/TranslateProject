[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Revive your RSS feed with Newsboat in the Linux terminal)
[#]: via: (https://opensource.com/article/20/2/newsboat)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Revive your RSS feed with Newsboat in the Linux terminal
======
Newsboat is an excellent RSS reader, whether you need a basic set of
features or want your application to do a whole lot more.
![Boat on the ocean with Creative Commons sail][1]

Psst. Word on the web is that RSS died in 2013. That's when Google pulled the plug on Google Reader.

Don't believe everything that you hear. RSS is alive. It's well. It's still a great way to choose the information you want to read without algorithms making the decision for you. All you need is the [right feed reader][2].

Back in January, Opensource.com Correspondent [Kevin Sonney][3] introduced a nifty terminal RSS reader [called Newsboat][4]. In his article, Kevin scratched Newsboat's surface. I figured it was time to take a deeper dive into what Newsboat can do.

### Adding RSS feeds to Newsboat

As Kevin writes, "installing Newsboat is pretty easy since it is included with most distributions (and Homebrew on macOS)." You can, as Kevin also notes, import a [file containing RSS feeds][5] from another reader. If this is your first kick at the RSS can or it's been a while since you've used an RSS reader, chances are you don't have one of those files handy.

Not to worry. You just need to do some copying and pasting. Go to the folder **.newsboat** in your **/home** directory. Once you're there, open the file **urls** in a text editor. Then, go to the websites you want to read, find the links to their RSS feeds, and copy and paste them into the **urls** file.

![Newsboat urls file][6]

Start Newsboat, and you're ready to get reading.

### Reading your feeds

As Kevin Sonney points out, you refresh your feeds by pressing the **r** or **R** keys on your keyboard. To read the articles from a feed, press **Enter** to open that feed and scroll down the list. Then, press **Enter** to read an item.

![Newsboat reading][7]

Return to the list of articles by pressing **q**. Press **q** again to return to your list of feeds.

Every so often, you might run into a feed that shows just part of an article. That can be annoying. To get the full article, press **o** to open it in your desktop's default web browser. On my desktop, for example, that's Firefox. You can change the browser Newsboat works with; I'll explain that below.

### Following links

Hyperlinking has been a staple of the web since its beginnings at CERN in the early 1990s. It's hard to find an article published online that doesn't contain at least a couple of links that point elsewhere.

Instead of leaving links embedded in an article or post, Newsboat gathers them into a numbered list at the end of the article or post.

![Hyperlinks in Newsboat][8]

To follow a link, press the number beside it. In the screenshot above, you'd press **4** to open the link to the homepage of one of the contributors to that article. The link, as you've probably guessed, opens in your default browser.

### Using Newsboat as a client for other feed readers

You might use a web-based feed reader, but might also want to read your RSS feeds in something a bit more minimal on your desktop. Newsboat can do that.

It works with several feed readers, including The Old Reader, Inoreader, Newsblur, Tiny Tiny RSS, FeedHQ, and the newsreader apps for [ownCloud][9] and [Nextcloud][10]. Before you can read feeds from any of them, you'll need to do a little work.

Go back to the **.newsboat** folder in your **/home** directory and create a file named **config**. Then add the settings that hook Newsboat into one of the RSS readers it supports. You can find more information about the specific settings for each reader in [Newsboat's documentation][11].

Here's an example of the settings I use to connect Newsboat with the newsreader app in my instance of Nextcloud:


```
urls-source "ocnews"
ocnews-url "<https://my.nextcloud.instance>"
ocnews-login "myUserName"
ocnews-password "NotTellingYouThat!"
```

I've tested this with Nextcloud, The Old Reader, Inoreader, and Newsblur. Newsboat worked seamlessly with all of them.

![Newsboat with The Old Reader][12]

### Other useful configuration tricks

You can really unleash Newsboat's power and flexibility by tapping into [its configuration options][13]. That includes changing text colors, the order Newsboat sorts feeds, where it saves articles, the length of time Newsboat keeps articles, and more.

Below are a few of the options I've added to my configuration file.

#### Change Newsboat's default browser

As I mentioned a few paragraphs back, Newsboat opens articles in your default graphical web browser. If you want to read feeds in a [text-only browser][14] like w3m or ELinks, add this to your Newsboat configuration file:


```
`browser "/path/to/browser %u"`
```

In my configuration file, I've set w3m up as my browser:


```
`browser "/usr/bin/w3m %u"`
```

![Newsboat with w3m][15]

#### Remove read articles

I like an uncluttered RSS feed. That means getting rid of articles I've already read. Add this setting to the configuration file to have Newsboat do that automatically:


```
`show-read-feeds  no`
```

#### Refresh feeds at launch

Life gets busy. Sometimes, I go a day or two without checking my RSS feeds. That means having to refresh them after I fire Newsboat up. Sure, I can press **r** or **R**, but why not have the application do it for me? I've added this setting to my configuration file to have Newsboat refresh all of my feeds when I launch it:


```
`refresh-on-startup  yes`
```

If you have a lot of feeds, it can take a while to refresh them. I have around 80 feeds, and it takes over a minute to get new content from all of them.

### Is that everything?

Not even close. In addition to all of its configuration options, Newsboat also has a number of command-line switches you can use when you fire it up. Read more about them in the [documentation][16].

On the surface, Newsboat is simple. But a lot of power and flexibility hides under its hood. That makes Newsboat an excellent RSS reader for anyone who needs a basic set of features or for someone who needs their RSS reader to do a whole lot more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/newsboat

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/CreativeCommons_ideas_520x292_1112JS.png?itok=otei0vKb (Boat on the ocean with Creative Commons sail)
[2]: https://opensource.com/article/17/3/rss-feed-readers
[3]: https://opensource.com/users/ksonney
[4]: https://opensource.com/article/20/1/open-source-rss-feed-reader
[5]: https://en.wikipedia.org/wiki/OPML
[6]: https://opensource.com/sites/default/files/uploads/newsboat-urls-file.png (Newsboat urls file)
[7]: https://opensource.com/sites/default/files/uploads/newsboat-reading.png (Newsboat reading)
[8]: https://opensource.com/sites/default/files/uploads/newsboat-links.png (Hyperlinks in Newsboat)
[9]: https://github.com/owncloudarchive/news
[10]: https://github.com/nextcloud/news
[11]: https://newsboat.org/releases/2.18/docs/newsboat.html#_newsboat_as_a_client_for_newsreading_services
[12]: https://opensource.com/sites/default/files/uploads/newsboat-oldreader.png (Newsboat with The Old Reader)
[13]: https://newsboat.org/releases/2.18/docs/newsboat.html#_example_configuration
[14]: https://opensource.com/article/16/12/web-browsers-linux-command-line
[15]: https://opensource.com/sites/default/files/uploads/newsboat-read-with-w3m.png (Newsboat with w3m)
[16]: https://newsboat.org/releases/2.18/docs/newsboat.html
