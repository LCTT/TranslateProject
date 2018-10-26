HankChow translating

Browsing the web with Min, a minimalist open source web browser
======
Not every web browser needs to carry every single feature. Min puts a minimalist spin on the everyday web browser.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG)

Does the world need another web browser? Even though the days of having a multiplicity of browsers to choose from are long gone, there still are folks out there developing new applications that help us use the web.

One of those new-fangled browsers is [Min][1]. As its name suggests (well, suggests to me, anyway), Min is a minimalist browser. That doesn't mean it's deficient in any significant way, and its open source, Apache 2.0 license piques my interest.

But is Min worth a look? Let's find out.

### Getting going

Min is one of many applications written using a development framework called [Electron][2]. (It's the same framework that brought us the [Atom text editor][3].) You can [get installers][4] for Linux, MacOS, and Windows. You can also grab the [source code from GitHub][5] and compile it if you're inclined.

I run Manjaro Linux, and there isn't an installer for that distro. Luckily, I was able to install Min from Manjaro's package manager.

Once that was done, I fired up Min by pressing Alt+F2, typing **min** in the run-application box, and pressing Enter, and I was ready to go.

![](https://opensource.com/sites/default/files/uploads/min-main.png)

Min is billed as a smarter, faster web browser. It definitely is fast—at the risk of drawing the ire of denizens of certain places on the web, I'll say that it starts faster than Firefox and Chrome on the laptops with which I tried it.

Browsing with Min is like browsing with Firefox or Chrome. Type a URL in the address bar, press Enter, and away you go.

### Min's features

While Min doesn't pack everything you'd find in browsers like Firefox or Chrome, it doesn't do too badly.

Like any other browser these days, Min supports multiple tabs. It also has a feature called Tasks, which lets you group your open tabs.

Min's default search engine is [DuckDuckGo][6]. I really like that touch because DuckDuckGo is one of my search engines of choice. If DuckDuckGo isn't your thing, you can set another search engine as the default in Min's preferences.

Instead of using tools like AdBlock to filter out content you don't want, Min has a built-in ad blocker. It uses the [EasyList filters][7], which were created for AdBlock. You can block scripts and images, and Min also has a built-in tracking blocker.

Like Firefox, Min has a reading mode called Reading List. Flipping the Reading List switch (well, clicking the icon in the address bar) removes most of the cruft from a page so you can focus on the words you're reading. Pages stay in the Reading List for 30 days.

![](https://opensource.com/sites/default/files/uploads/min-reading-list.png)

Speaking of focus, Min also has a Focus Mode that hides and prevents you from opening other tabs. So, if you're working in a web application, you'll need to click a few times if you feel like procrastinating.

Of course, Min has a number of keyboard shortcuts that can make using it a lot faster. You can find a reference for those shortcuts [on GitHub][8]. You can also change a number of them in Min's preferences.

I was pleasantly surprised to find Min can play videos on YouTube, Vimeo, Dailymotion, and similar sites. I also played sample tracks at music retailer 7Digital. I didn't try playing music on popular sites like Spotify or Last.fm (because I don't have accounts with them).

![](https://opensource.com/sites/default/files/uploads/min-video.png)

### What's not there

The features that Min doesn't pack are as noticeable as the ones it does. There doesn't seem to be a way to bookmark sites. You either have to rely on Min's search history to find your favorite links, or you'll have to rely on a bookmarking service.

On top of that, Min doesn't support plugins. That's not a deal breaker for me—not having plugins is undoubtedly one of the reasons the browser starts and runs so quickly. I know a number of people who are … well, I wouldn't go so far to say junkies, but they really like their plugins. Min wouldn't cut it for them.

### Final thoughts

Min isn't a bad browser. It's light and fast enough to appeal to the minimalists out there. That said, it lacks features that hardcore web browser users clamor for.

If you want a zippy browser that isn't weighed down by all the features of so-called modern web browsers, I suggest giving Min a serious look.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/min-web-browser

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://minbrowser.github.io/min/
[2]: http://electron.atom.io/apps/
[3]: https://opensource.com/article/17/5/atom-text-editor-packages-writers
[4]: https://github.com/minbrowser/min/releases/
[5]: https://github.com/minbrowser/min
[6]: http://duckduckgo.com
[7]: https://easylist.to/
[8]: https://github.com/minbrowser/min/wiki
