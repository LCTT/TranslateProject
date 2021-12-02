[#]: subject: "Google Chrome vs Chromium: What’s the difference?"
[#]: via: "https://itsfoss.com/chrome-vs-chromium/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google Chrome vs Chromium: What’s the difference?
======

Google Chrome is the most popular web browser. No matter whether you prefer to use it, Chrome manages to offer a good user experience.

Even though it is available for Linux, it is not an open-source web browser.

And, if you need the look and feel of Google Chrome but want to use an open-source solution, Chromium can be your answer.

But isn’t Google Chrome based on Chromium? (that’s a Yes.) And, it’s also developed by Google? (Also, Yes.)

So, what are the differences between Chrome and Chromium? In this article, we shall take an in-depth look at both of them and compare them while presenting some benchmarks.

### User Interface

![Google Chrome and Chromium running side-by-side on Zorin OS 16][1]

The user interfaces for both Google Chrome and Chromium remain very similar, with minor noticeable differences.

For instance, I noticed that the system title bar and borders were disabled by default for Google Chrome out of the box. In contrast, it was enabled by default for Chromium at the time of my tests.

You can also notice a share button in the address bar of Google Chrome, which is absent on Chromium.

It isn’t a big visual difference, but just a set of UI tweaks as per the available features. So, yes, you can expect a similar user experience with under-the-hood tweaks. If you are in for the UI, both the browsers should suit you well.

### Open-Source &amp; Proprietary Code

![][2]

Chromium is entirely open-source, meaning anyone can use and modify the code to their heart’s intent. You can check out its source code on its [GitHub mirror][3].

This is why you will find many [Chromium-based browsers][4] available such as Brave, Vivaldi and Edge.

You end up getting so many choices, so you can choose what you like the best.

On the other hand, Google Chrome adds proprietary code to Chromium, making Chrome a proprietary browser. For example, one can fork Brave, but one cannot fork Google Chrome, restricting the usage of their Google-specific code/work.

For end-users, the license does not affect the user experience. However, with an open-source project, you get more transparency without relying on the company to communicate what they intend to change and what they’re doing with the browser.

So, yes, if you’re not a fan of proprietary code, Chromium is the answer.

### Feature Differences

It’s no surprise that Google does not want its competitors to have similar capabilities. So, Google has been [locking up Chromium and disabling a lot of Google-specific abilities][5].

Hence, you will find some differences in capabilities between both browsers.

Not just limited to that, but because Chromium is open-source, you may notice some inconvenience. Fret not; I’ll point out the crucial differences below:

**Google Chrome** | **Chromium**
---|---
Sign-in and Sync Available | No Sign-in and Sync
Media codec support to use Netflix | Manual codec installation is required

For starters, the Google-powered sign-in/sync feature is no longer available in Chromium. It supported sign-in and sync until Google decided to remove it from the open-source project.

Next, Google Chrome comes with built-in support for high-quality media codecs. So, you can load up content from Netflix. But, it won’t work with Chromium.

![Netflix doesn’t work in Chromium by default][6]

Technically, Chromium does not include the _Widevine Content Decryption module_. So, you will have to install the required codecs manually to make most of the things work.

However, you should not have any issues playing content from platforms like Apple Music and others on both browsers out of the box.

### Installation &amp; Availability of Latest update

You can install Google Chrome on virtually any platform. Linux is not an exception. Just head to its official website and grab the DEB/RPM package to install it quickly. The installed application also gets updated automatically.

![][7]

Installing Chromium is not that straightforward on several platforms. There was a time when some Linux distributions included Chromium as the default browser. Those were the days of the past.

Even on Windows, Chromium installation and update is not as smooth as Chrome.

On Linux, it’s entirely a different story for installing Chromium. Popular distribution like Ubuntu packages it as a sandboxed Snap application.

Even if you are trying to install it using the terminal, hoping that you would get it from the APT repositories, it’s Snap again:

![][8]

With the Snap package, you may face issues with blending in with your custom desktop theme. Snap applications take longer to start as well.

![][9]

And, if you proceed to build it and install Chromium manually, you will have to update it manually.

### The Privacy Angle

Google Chrome should be good enough for most users. However, if you are worried about your privacy, Google Chrome tracks usage info and some browsing-related information.

Recently, [Google introduced a new Chrome API][10] that lets sites detect when you are idle and when you are not. While this is a massive privacy concern, it isn’t the only thing.

Google constantly experiments with new ways of tracking users; for instance, Google’s FLoC experiment wasn’t well-received, as pointed out by [EFF][11].

Technically, they claim that they want to enhance users’ privacy while still providing advertising opportunities. However, that is one impossible task to achieve as of now.

In comparison, Chromium should fare way better concerning privacy. However, if you hate anything Google-related in your browser, even the slightest telemetry, you should try [UnGoogled Chromium][12] instead.

It is Chromium, but without any Google components.

### Browser Performance

There are a variety of browser benchmarks that give you an idea of how well a browser can handle tasks.

Considering the advanced web applications and resource-intensive JavaScript found on websites, if a web browser does not perform well, you will get a noticeably bad experience when you dabble with many active tabs.

[JetStream 2][13] and [Speedometer 2][14] are two popular benchmarks that give you a performance estimate of handling various tasks and responsiveness, respectively.

In addition to that, I also tried out [Basemark Web 3.0][15], which also tests a variety of things and gives you an aggregate score.

![][16]

Overall, Google Chrome wins here.

But, it is worth noting that your system resources and background processes while running a browser will affect performance differently. So, take that into account as well.

### What should you choose?

The choices for browsers exist because users prefer different things. Google Chrome offers a good feature set and user experience. If you use Google-powered services in some form, Google Chrome is an easy recommendation.

However, if you are concerned about privacy practices and proprietary code, Chromium or UnGoogled Chromium, or any other Chromium-based browser like Brave can be a good pick.

That’s all I had in mind when debating Chrome and Chromium. I am open to receive your views now. The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/chrome-vs-chromium/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/chrome-chromium-ui.png?resize=800%2C627&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/open-source-proprietary.png?resize=800%2C450&ssl=1
[3]: https://github.com/chromium/chromium
[4]: https://news.itsfoss.com/chrome-like-browsers-2021/
[5]: https://news.itsfoss.com/is-google-locking-down-chrome/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/chromium-netflix.png?resize=800%2C541&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/google-chrome-version.png?resize=800%2C549&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-chromium.png?resize=800%2C440&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/chromium-version.png?resize=800%2C539&ssl=1
[10]: https://www.forbes.com/sites/zakdoffman/2021/10/02/stop-using-google-chrome-on-windows-10-android-and-apple-iphones-ipads-and-macs/
[11]: https://www.eff.org/deeplinks/2021/03/googles-floc-terrible-idea
[12]: https://github.com/Eloston/ungoogled-chromium
[13]: https://webkit.org/blog/8685/introducing-the-jetstream-2-benchmark-suite/
[14]: https://webkit.org/blog/8063/speedometer-2-0-a-benchmark-for-modern-web-app-responsiveness/
[15]: https://web.basemark.com/
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/chrome-chromium-benchmarks-1.png?resize=800%2C450&ssl=1
