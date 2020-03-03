[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Waterfox: Firefox Fork With Legacy Add-ons Options)
[#]: via: (https://itsfoss.com/waterfox-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Waterfox: Firefox Fork With Legacy Add-ons Options
======

_**Brief: In this week’s open source software highlight, we take a look at a Firefox-based browser that supports legacy extensions that Firefox no longer supports while potentially providing fast user experience.**_

When it comes to web browsers, Google Chrome leads the market share. [Mozilla Firefox is there still providing hopes for a mainstream web browser that respects your privacy][1].

Firefox has improved a lot lately and one of the side-effects of the improvements is removal of add-ons. If your favorite add-on disappeared in last few months/years, you have a good new in the form of Witerfox.

Attention!

It’s been brought to our notice that Waterfox has been acquired by System1. This company also acquired privacy focused search engine Startpage.
While System1 claims that they are providing privacy focused products because ‘there is a demand’, we cannot vouch for their claim.
In other words, it’s up to you to trust System1 and Waterfox.

### Waterfox: A Firefox-based Browser

![Waterfox Classic][2]

[Waterfox][3] is a useful open-source browser built on top of Firefox that focuses on privacy and supports legacy extensions. It doesn’t pitch itself as a privacy-paranoid browser but it does respect the basics.

You get two separate Waterfox browser versions. The current edition aims to provide a modern experience and the classic version focuses to support [NPAPI plugins][4] and [bootstrap extensions][5].

![Waterfox Classic][6]

If you do not need to utilize bootstrap extensions but rely on [WebExtensions][7], Waterfox Current is the one you should go for.

And, if you need to set up a browser that needs NPAPI plugins or bootstrap extensions extensively, Waterfox Classic version will be suitable for you.

So, if you like Firefox, but want to try something different on the same line, this is a Firefox alternative for the job.

### Features of Waterfox

![Waterfox Current][8]

Of course, technically, you should be able to do a lot of things that Mozilla Firefox supports.

So, I’ll just highlight all the important features of Waterfox in a list here.

  * Supports NPAPI Plugins
  * Supports Bootstrap Extensions
  * Offers separate editions for legacy extension support and modern WebExtension support.
  * Cross-platform support (Windows, Linux, and macOS)
  * Theme customization
  * Archived Add-ons supported



### Installing Waterfox on Ubuntu/Linux

Unlike other popular browsers, you don’t get a package to install. So, you will have to download the archived package from its [official download page][9].

![][10]

Depending on what edition (Current/Classic) you want – just download the file, which will be **.tar.bz2** extension file.

Once downloaded, simply extract the file.

Next, head on to the extracted folder and look for the “**Waterfox**” file. You can simply double-click on it to run start up the browser.

If that doesn’t work, you can utilize the terminal and navigate to the extracted **Waterfox** folder. Once there, you can simply run it with a single command. Here’s how it looks like:

```
cd waterfox-classic
./waterfox
```

In either case, you can also head to its [GitHub page][11] and explore more options to get it installed on your system.

[Download Waterfox][3]

**Wrapping up**

I fired it up on my Pop!_OS 19.10 installation and it worked really well for me. Though I don’t think I could switch from Firefox to Waterfox because I am not using any legacy add-on. It could still be an impressive option for certain users.

You could give it a try and let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/waterfox-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-firefox/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-classic.png?fit=800%2C423&ssl=1
[3]: https://www.waterfox.net/
[4]: https://en.wikipedia.org/wiki/NPAPI
[5]: https://wiki.mozilla.org/Extension_Manager:Bootstrapped_Extensions
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-classic-screenshot.jpg?ssl=1
[7]: https://wiki.mozilla.org/WebExtensions
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-screenshot.jpg?ssl=1
[9]: https://www.waterfox.net/download/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/waterfox-download-page.jpg?ssl=1
[11]: https://github.com/MrAlex94/Waterfox
