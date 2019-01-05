[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Linux command line can fetch fun from afar)
[#]: via: (https://opensource.com/article/18/12/linux-toy-remote)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

The Linux command line can fetch fun from afar
======
Use these tools to access weather, reading material, and more from remote locations.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-remote.png?itok=mHm9POPi)

We're almost to the end of our 24-day-long Linux command-line toys advent calendar. Hopefully, you've been following along, but if not, start back at [the beginning][1] and work your way through. You'll find plenty of games, diversions, and oddities for your Linux terminal.

And while you may have seen some toys from our calendar before, we hope there’s at least one new thing for everyone.

Today's toy (or actually, collection of toys) is a little different. So far I've mostly tried to focus on toys that are self-contained, and completely usable under an open source license. But I've gotten some great suggestions from readers which utilize an open source tool to access something remotely that may or may not be open source. Today, I'll round up a few of those.

The first one is a total classic: use Telnet to watch an ASCII-rendition of Star Wars. Chances are that Telnet is already installed on your system, so all you'll need to do is run:

```
$ telnet towel.blinkenlights.nl
```

I feel like I first saw this one over a decade ago, so it's a bit amazing to me that it's still alive and online. If you've never watched it, set aside some time and go check it out. You won't regret it.

![](https://opensource.com/sites/default/files/uploads/linux-toy-star-wars.png)

Next, Opensource.com contributor [Manuel Dewald][2] suggested a way to fetch your local weather from the terminal. It's easy, and only requires that you have **curl** (or, well, **** **wget** ) installed.

```
$ curl wttr.in
```

![](https://opensource.com/sites/default/files/uploads/linux-toy-weather.png)

Finally, while you can spend the holidays reading your favorite sites (including Opensource.com) from your favorite [command-line web browser][3], there are a few of my favorite sites that are more easily browsed with a dedicated client. Two of these include Reddit and Hacker News, for which there are clients that have been recommended to me that you may wish to try, mostly available under open source licenses. I've poked around with [haxor-news][4] (Hacker News) and [rtv][5] (Reddit), and both seem pretty cool.

Do you have a favorite command-line toy that we should have included? It's a little late to submit a suggestion for this year, but we'd still love to feature some cool command-line toys in the new year. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Watch YouTube videos at the Linux terminal][6], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-remote

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-boxes
[2]: https://opensource.com/users/ntlx
[3]: https://opensource.com/article/16/12/web-browsers-linux-command-line
[4]: https://github.com/donnemartin/haxor-news
[5]: https://github.com/michael-lazar/rtv
[6]: https://opensource.com/article/18/12/linux-toy-youtube-dl
