[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this Twitter client for Linux to tweet from the terminal)
[#]: via: (https://opensource.com/article/20/1/tweet-terminal-rainbow-stream)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use this Twitter client for Linux to tweet from the terminal
======
Keep up with your Twitter feed without leaving the terminal by using
Rainbow Stream in the tenth in our series on 20 ways to be more
productive with open source in 2020.
![Chat bubbles][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Keep up with Twitter with Rainbow Stream

I love social networking and microblogging. It's quick, it's easy, and I can share my thoughts with the world really quickly. The drawback is, of course, that almost all the desktop options for non-Windows users are wrappers around the website. [Twitter][2] has a lot of clients, but what I really want is something lightweight, easy to use, and most importantly, attractive.

![Rainbow Stream for Twitter][3]

[Rainbow Stream][4] is one of the prettier Twitter clients. It is easy to use and installs quickly with a simple **pip3 install rainbowstream**. On the first run, it will open a browser window and have you authorize with Twitter. Once that is done, you land at a prompt, and your Twitter timeline will start scrolling by.

![Rainbow Stream first run][5]

The most important commands to know are **p** to pause the stream, **r** to resume the stream, **h** to get help, and **t** to post a new tweet. For example, **h tweets** will give you all the options for sending and replying to tweets. Another useful help screen is **h messages**, which gives the commands for working with direct messages, which is something my wife and I use a lot. There are a lot of other commands, and I refer back to help a lot.

As your timeline scrolls by, you can see that it has full UTF-8 support and, with the right font, will show indicators for how many times something was retweeted and liked, as well as icons and emojis.

![Kill this love][6]

One of the _best_ things about Rainbow Stream is that you don't have to give up on photos and images. This feature is off by default, but you can try it out with the **config** command.


```
`config IMAGE_ON_TERM = true`
```

This command renders any images as ASCII art. If you have a photo-heavy stream, this may be a bit much, but I like it. It has a very retro-1990s BBS feel, and I did love the BBS scene in the 1990s.

You can also use Rainbow Stream to manage lists, mute people, block people, follow, unfollow, and everything else that is available with the Twitter API. There is also theme support, so you can customize the stream to your favorite color scheme.

When I'm working and don't want to have yet-another-tab open on my browser, Rainbow Stream lets me keep up in a terminal off to the side.

Without open source, Twitter wouldn't exist. Every Tweet you send and receive touches open source...

Sergey Bronnikov shares why the OpenVZ team created Twisource, an open source social media tool.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/tweet-terminal-rainbow-stream

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://twitter.com/home
[3]: https://opensource.com/sites/default/files/uploads/productivity_10-1.png (Rainbow Stream for Twitter)
[4]: https://rainbowstream.readthedocs.io/en/latest/
[5]: https://opensource.com/sites/default/files/uploads/productivity_10-2.png (Rainbow Stream first run)
[6]: https://opensource.com/sites/default/files/uploads/day10-image3_1.png (Kill this love)
