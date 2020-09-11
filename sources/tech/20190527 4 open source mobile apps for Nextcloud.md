[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 open source mobile apps for Nextcloud)
[#]: via: (https://opensource.com/article/19/5/mobile-apps-nextcloud)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

4 open source mobile apps for Nextcloud
======
Increase Nextcloud's value by turning it into an on-the-go information
hub.
![][1]

I've been using [Nextcloud][2] (and before that, ownCloud), an open source alternative to file syncing and storage services like Dropbox and Google Drive, for many years. It's been both reliable and useful, and it respects my privacy.

While Nextcloud is great at both syncing and storage, it's much more than a place to dump your files. Thanks to applications that you can fold into Nextcloud, it becomes more of an information hub than a storage space.

While I usually interact with Nextcloud using the desktop client or in a browser, I'm not always at my computer (or any computer that I trust). So it's important that I can work with Nextcloud using my [LineageOS][3]-powered smartphone or tablet.

To do that, I use several open source apps that work with Nextcloud. Let's take a look at four of them.

As you've probably guessed, this article looks at the Android version of those apps. I grabbed mine from [F-Droid][4], although you get them from other Android app markets. You might be able to get some or all of them from Apple's App Store if you're an iOS person.

### Working with files and folders

The obvious app to start with is the [Nextcloud sync client][5]. This little app links your phone or tablet to your Nextcloud account.

![Nextcloud mobile app][6]

Using the app, you can:

  * Create folders
  * Upload one or more files
  * Sync files between your device and server
  * Rename or remove files
  * Make files available offline



You can also tap a file to view or edit it. If your device doesn't have an app that can open the file, then you're out of luck. You can still download it to your phone or tablet though.

### Reading news feeds

Remember all the whining that went on when Google pulled the plug on Google Reader in 2013? This despite Google giving users several months to find an alternative. And, yes, there are alternatives. One of them, believe it or not, is Nextcloud.

Nextcloud has a built-in RSS reader. All you need to do to get started is upload an [OPML][7] file containing your feeds or manually add a site's RSS feed to Nextcloud.

Going mobile is easy, too, with the Nextcloud [News Reader app][8].

![Nextcloud News app][9]

Unless you configure the app to sync when you start it up, you'll need to swipe down from the top of the app to load updates to your feeds. Depending on how many feeds you have, and how many unread items are in those feeds, syncing takes anywhere from a few seconds to half a minute.

From there, tap an item to read it in the News app.

![Nextcloud News app][10]

You can also add feeds or open what you're reading in your device's default web browser.

### Reading and writing notes

I don't use Nextcloud's [Notes][11] app all that often (I'm more of a [Standard Notes][12] person). That said, you might find the Notes app comes in handy.

How? By giving you a lightweight way to take [plain text][13] notes on your mobile device. The Notes app syncs any notes you have in your Nextcloud account and displays them in chronological order—newest or last-edited notes first.

![Nextcloud Notes app][14]

Tap a note to read or edit it. You can also create a note by tapping the **+** button, then typing what you need to type.

![Nextcloud Notes app][15]

There's no formatting, although you can add markup (like Markdown) to the note. Once you're done editing, the app syncs your note with Nextcloud.

### Accessing your bookmarks

Nextcloud has a decent bookmarking tool, and its [Bookmarks][16] app makes it easy to work with the tool on your phone or tablet.

![Nextcloud Bookmarks app][17]

Like the Notes app, Bookmarks displays your bookmarks in chronological order, with the newest appearing first in the list.

If you tagged your bookmarks in Nextcloud, you can swipe left in the app to see a list of those tags rather than a long list of bookmarks. Tap a tag to view the bookmarks under it.

![Nextcloud Bookmarks app][18]

From there, just tap a bookmark. It opens in your device's default browser.

You can also add a bookmark within the app. To do that, tap the **+** menu and add the bookmark.

![Nextcloud Bookmarks app][19]

You can include:

  * The URL
  * A title for the bookmark
  * A description
  * One or more tags



### Is that all?

Definitely not. There are apps for [Nextcloud Deck][20] (a personal kanban tool) and [Nextcloud Talk][21] (a voice and video chat app). There are also a number of third-party apps that work with Nextcloud. Just do a search for _Nextcloud_ or _ownCloud_ in your favorite app store to track them down.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/mobile-apps-nextcloud

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_BUS_cloudagenda_20140341_jehb.png?itok=1NGs3_n4
[2]: https://nextcloud.com/
[3]: https://lineageos.org/
[4]: https://opensource.com/life/15/1/going-open-source-android-f-droid
[5]: https://f-droid.org/en/packages/com.nextcloud.client/
[6]: https://opensource.com/sites/default/files/uploads/nextcloud-app.png (Nextcloud mobile app)
[7]: http://en.wikipedia.org/wiki/OPML
[8]: https://f-droid.org/en/packages/de.luhmer.owncloudnewsreader/
[9]: https://opensource.com/sites/default/files/uploads/nextcloud-news.png (Nextcloud News app)
[10]: https://opensource.com/sites/default/files/uploads/nextcloud-news-reading.png (Nextcloud News app)
[11]: https://f-droid.org/en/packages/it.niedermann.owncloud.notes
[12]: https://opensource.com/article/18/12/taking-notes-standard-notes
[13]: https://plaintextproject.online
[14]: https://opensource.com/sites/default/files/uploads/nextcloud-notes.png (Nextcloud Notes app)
[15]: https://opensource.com/sites/default/files/uploads/nextcloud-notes-add.png (Nextcloud Notes app)
[16]: https://f-droid.org/en/packages/org.schabi.nxbookmarks/
[17]: https://opensource.com/sites/default/files/uploads/nextcloud-bookmarks.png (Nextcloud Bookmarks app)
[18]: https://opensource.com/sites/default/files/uploads/nextcloud-bookmarks-tags.png (Nextcloud Bookmarks app)
[19]: https://opensource.com/sites/default/files/uploads/nextcloud-bookmarks-add.png (Nextcloud Bookmarks app)
[20]: https://f-droid.org/en/packages/it.niedermann.nextcloud.deck
[21]: https://f-droid.org/en/packages/com.nextcloud.talk2
