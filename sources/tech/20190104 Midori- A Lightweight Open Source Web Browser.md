[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Midori: A Lightweight Open Source Web Browser)
[#]: via: (https://itsfoss.com/midori-browser)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Midori: A Lightweight Open Source Web Browser
======

**Here’s a quick review of the lightweight, fast, open source web browser Midori, which has returned from the dead.**

If you are looking for a lightweight [alternative web browser][1], try Midori.

[Midori][2] is an open source web browser that focuses more on being lightweight than on providing a ton of features.

If you have never heard of Midori, you might think that it is a new application but Midori was first released in 2007.

Because it focused on speed, Midori soon gathered a niche following and became the default browser in lightweight Linux distributions like Bodhi Linux, SilTaz etc.

Other distributions like [elementary OS][3] also used Midori as its default browser. But the development of Midori stalled around 2016 and its fans started wondering if Midori was dead already. elementary OS dropped it from its latest release, I believe, for this reason.

The good news is that Midori is not dead. After almost two years of inactivity, the development resumed in the last quarter of 2018. A few extensions including an ad-blocker were added in the later releases.

### Features of Midori web browser

![Midori web browser][4]

Here are some of the main features of the Midori browser

  * Written in Vala with GTK+3 and WebKit rendering engine.
  * Tabs, windows and session management
  * Speed dial
  * Saves tab for the next session by default
  * Uses DuckDuckGo as a default search engine. It can be changed to Google or Yahoo.
  * Bookmark management
  * Customizable and extensible interface
  * Extension modules can be written in C and Vala
  * Supports HTML5
  * An extremely limited set of extensions include an ad-blocker, colorful tabs etc. No third-party extensions.
  * Form history
  * Private browsing
  * Available for Linux and Windows



Trivia: Midori is a Japanese word that means green. The Midori developer is not Japanese if you were guessing something along that line.

### Experiencing Midori

![Midori web browser in Ubuntu 18.04][5]

I have been using Midori for the past few days. The experience is mostly fine. It supports HTML5 and renders the websites quickly. The ad-blocker is okay. The browsing experience is more or less smooth as you would expect in any standard web browser.

The lack of extensions has always been a weak point of Midori so I am not going to talk about that.

What I did notice is that it doesn’t support international languages. I couldn’t find a way to add new language support. It could not render the Hindi fonts at all and I am guessing it’s the same with many other non-[Romance languages][6].

I also had my fair share of troubles with YouTube videos. Some videos would throw playback error while others would run just fine.

Midori didn’t eat my RAM like Chrome so that’s a big plus here.

If you want to try out Midori, let’s see how can you get your hands on it.

### Install Midori on Linux

Midori is no longer available in the Ubuntu 18.04 repository. However, the newer versions of Midori can be easily installed using the [Snap packages][7].

If you are using Ubuntu, you can find Midori (Snap version) in the Software Center and install it from there.

![Midori browser is available in Ubuntu Software Center][8]Midori browser is available in Ubuntu Software Center

For other Linux distributions, make sure that you have [Snap support enabled][9] and then you can install Midori using the command below:

```
sudo snap install midori
```

You always have the option to compile from the source code. You can download the source code of Midori from its website.

If you like Midori and want to help this open source project, please donate to them or [buy Midori merchandise from their shop][10].

Do you use Midori or have you ever tried it? How’s your experience with it? What other web browser do you prefer to use? Please share your views in the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/midori-browser

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-browsers-linux/
[2]: https://www.midori-browser.org/
[3]: https://itsfoss.com/elementary-os-juno-features/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/Midori-web-browser.jpeg?resize=800%2C450&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/midori-browser-linux.jpeg?resize=800%2C491&ssl=1
[6]: https://en.wikipedia.org/wiki/Romance_languages
[7]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/midori-ubuntu-software-center.jpeg?ssl=1
[9]: https://itsfoss.com/install-snap-linux/
[10]: https://www.midori-browser.org/shop
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/Midori-web-browser.jpeg?fit=800%2C450&ssl=1
