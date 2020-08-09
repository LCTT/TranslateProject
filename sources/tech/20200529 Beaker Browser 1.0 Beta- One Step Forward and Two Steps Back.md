[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Beaker Browser 1.0 Beta: One Step Forward and Two Steps Back)
[#]: via: (https://itsfoss.com/beaker-browser-1-release/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Beaker Browser 1.0 Beta: One Step Forward and Two Steps Back
======

I recently reviewed the [Beaker Browser][1]. About a week after that review was published, the devs [released Beaker 1.0 Beta][2]. And that changes almost everything I had observed in the previous article.

This made me do an entire article on the new Beaker Browser.Here’s what’s been changed!

### No more Dat, Beaker now uses Hypercore protocol

![][3]

One of the most significant changes to Beaker is the introduction of a new protocol. Up to now, Beaker has used the [Dat protocol][4] to distribute content. Beta 1.0 replaces Dat with [Hypercore][5].

One of the components is Hyperdrive [version 10][6], which was released the same days as Beaker. Hyperdrive is “a POSIX-like filesystem implementation, written in Node.js, that’s designed to be the storage layer for fast, scalable, and secure peer-to-peer applications.”

Like BitTorrent, Hyperdrive can be used to share a large collection of files. However, unlike BitTorrent, the contents can be modified.

![][7]

Switching to the new protocol brings the following changes:

  * Performance is now vastly superior thanks to new data structures.
  * Connection-reliability has improved thanks to a switch to a hole-punching DHT.
  * A new “mounts” feature for composing multiple Hyperdrives into a single hierarchy.



Since Beaker switched over to a new protocol, all previously created websites don’t work anymore. They did include a tool to convert sites from Dat to Hypercore. I tried it on a couple of one-page sites and it failed. It only created a new site that was totally empty of content.

### New Beaker-website creating tools

The Beaker devs introduced several new tools to make editing easier. Now when you edit or create a site, you will get a split-screen view with a code editor on the left and a preview window on the right. The preview is updated whenever you save your work.

![Beaker Site Editing][8]

Besides the editor you can also open a file manager to import and manage files and images. They also included a terminal application called [webterm][9]. This terminal can only interact with the contents of the site you are working on, but it is still pretty cool. webterm only comes with 10 simple commands. If you are adventurous you can write your own commands for it, using Javascript.

You can pop out each of these tools into their own window. If you have all three open, the left-hand panel can get crowded very quickly.

You can see more information about the release [here][2]

### Final thoughts on the Beaker Browser 1.0 beta release

When I saw the announcement for Beaker Browser 1.0 Beta, I was hopeful that some of the complaints I had in the review would be fixed. Unfortunately, that didn’t happen.

My biggest problem with Beaker Browser was that it was hard to find `dat` powered content. In the previous version, there was a page with a list of about a dozen projects running on the Dat protocol, but that was it.

If you dig around on the new version, you can find a list of people who have profiles created on Hypercore. Unfortunately, most of those pages are either blank or something someone quickly threw together. I imagine that this will change with the final version of 1.0 is released.

![Beaker User Directory][10]

I did enjoy the editing tools. It made it very easy to slap together a quick webpage with a couple of lines of Markdown. I did create a site, but I’m not going to leave Beaker Browser running 24/7 to seed it. There currently isn’t any other way to do it.

What are your thoughts on the Beaker Browser? What are your thoughts on the peer-to-peer web? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News, or [Reddit][11].

--------------------------------------------------------------------------------

via: https://itsfoss.com/beaker-browser-1-release/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/beaker-browser/
[2]: https://beakerbrowser.com/2020/05/14/beaker-1-0-beta.html
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/Beaker-Browser-1-beta.png?ssl=1
[4]: https://www.datprotocol.com/
[5]: https://hypercore-protocol.org/
[6]: https://blog.hypercore-protocol.org/posts/announcing-hyperdrive-10/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/beaker-start-page.jpg?resize=800%2C426&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/beaker-site-editing-800x426.jpg?resize=800%2C426&ssl=1
[9]: https://docs.beakerbrowser.com/advanced/webterm
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/beaker-user-directory.jpg?resize=800%2C426&ssl=1
[11]: https://reddit.com/r/linuxusersgroup
