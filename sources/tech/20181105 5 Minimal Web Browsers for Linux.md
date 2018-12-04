[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (5 Minimal Web Browsers for Linux)
[#]: via: (https://www.linux.com/blog/intro-to-linux/2018/11/5-minimal-web-browsers-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)
[#]: url: ( )

5 Minimal Web Browsers for Linux
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimal.jpg?itok=ifA0Y3pV)

There are so many reasons to enjoy the Linux desktop. One reason I often state up front is the almost unlimited number of choices to be found at almost every conceivable level. From how you interact with the operating system (via a desktop interface), to how daemons run, to what tools you use, you have a multitude of options.

The same thing goes for web browsers. You can use anything from open source favorites, such as [Firefox][1] and [Chromium][2], or closed sourced industry darlings like [Vivaldi][3] and [Chrome][4]. Those options are full-fledged browsers with every possible bell and whistle you’ll ever need. For some, these feature-rich browsers are perfect for everyday needs.

There are those, however, who prefer using a web browser without all the frills. In fact, there are many reasons why you might prefer a minimal browser over a standard browser. For some, it’s about browser security, while others look at a web browser as a single-function tool (as opposed to a one-stop shop application). Still others might be running low-powered machines that cannot handle the requirements of, say, Firefox or Chrome. Regardless of the reason, Linux has you covered.

Let’s take a look at five of the minimal browsers that can be installed on Linux. I’ll be demonstrating these browsers on the Elementary OS platform, but each of these browsers are available to nearly every distribution in the known Linuxverse. Let’s dive in.

### GNOME Web

GNOME Web (codename Epiphany, which means [“a usually sudden manifestation or perception of the essential nature or meaning of something”][5]) is the default web browser for Elementary OS, but it can be installed from the standard repositories. (Note, however, that the recommended installation of Epiphany is via Flatpak or Snap). If you choose to install via the standard package manager, issue a command such as sudo apt-get install epiphany-browser -y for successful installation.

Epiphany uses the WebKit rendering engine, which is the same engine used in Apple’s Safari browser. Couple that rendering engine with the fact that Epiphany has very little in terms of bloat to get in the way, you will enjoy very fast page-rendering speeds. Epiphany development follows strict adherence to the following guidelines:

  * Simplicity - Feature bloat and user interface clutter are considered evil.

  * Standards compliance - No non-standard features will ever be introduced to the codebase.

  * Software freedom - Epiphany will always be released under a license that respects freedom.

  * Human interface - Epiphany follows the [GNOME Human Interface Guidelines][6].

  * Minimal preferences - Preferences are only added when they make sense and after careful consideration.

  * Target audience - Non-technical users are the primary target audience (which helps to define the types of features that are included).




GNOME Web is as clean and simple a web browser as you’ll find (Figure 1).

![GNOME Web][8]

Figure 1: The GNOME Web browser displaying a minimal amount of preferences for the user.

[Used with permission][9]

The GNOME Web manifesto reads:

A web browser is more than an application: it is a way of thinking, a way of seeing the world. Epiphany's principles are simplicity, standards compliance, and software freedom.

### Netsurf

The [Netsurf][10] minimal web browser opens almost faster than you can release the mouse button. Netsurf uses its own layout and rendering engine (designed completely from scratch), which is rather hit and miss in its rendering (Figure 2).

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_2.jpg?itok=KhGhIKlj)

Although you might find Netsurf to suffer from rendering issues on certain sites, understand the Hubbub HTML parser is following the work-in-progress HTML5 specification, so there will be issues popup now and then. To ease those rendering headaches, Netsurf does include HTTPS support, web page thumbnailing, URL completion, scale view, bookmarks, full-screen mode, keyboard shorts, and no particular GUI toolkit requirements. That last bit is important, especially when you switch from one desktop to another.

For those curious as to the requirements for Netsurf, the browser can run on a machine as slow as a 30Mhz ARM 6 computer with 16MB of RAM. That’s impressive, by today’s standard.

### QupZilla

If you’re looking for a minimal browser that uses the Qt Framework and the QtWebKit rendering engine, [QupZilla][11] might be exactly what you’re looking for. QupZilla does include all the standard features and functions you’d expect from a web browser, such as bookmarks, history, sidebar, tabs, RSS feeds, ad blocking, flash blocking, and CA Certificates management. Even with those features, QupZilla still manages to remain a very fast lightweight web browser. Other features include: Fast startup, speed dial homepage, built-in screenshot tool, browser themes, and more.
One feature that should appeal to average users is that QupZilla has a more standard preferences tools than found in many lightweight browsers (Figure 3). So, if going too far outside the lines isn’t your style, but you still want something lighter weight, QupZilla is the browser for you.

![QupZilla][13]

Figure 3: The QupZilla preferences tool.

[Used with permission][9]

### Otter Browser

Otter Browser is a free, open source attempt to recreate the closed-source offerings found in the Opera Browser. Otter Browser uses the WebKit rendering engine and has an interface that should be immediately familiar with any user. Although lightweight, Otter Browser does include full-blown features such as:

  * Passwords manager

  * Add-on manager

  * Content blocking

  * Spell checking

  * Customizable GUI

  * URL completion

  * Speed dial (Figure 4)

  * Bookmarks and various related features

  * Mouse gestures

  * User style sheets

  * Built-in Note tool


![Otter][15]

Figure 4: The Otter Browser Speed Dial tab.

[Used with permission][9]

Otter Browser can be run on nearly any Linux distribution from an [AppImage][16], so there’s no installation required. Just download the AppImage file, give the file executable permissions (with the command chmod u+x otter-browser-*.AppImage), and then launch the app with the command ./otter-browser*.AppImage.

Otter Browser does an outstanding job of rendering websites and could function as your go-to minimal browser with ease.

### Lynx

Let’s get really minimal. When I first started using Linux, back in ‘97, one of the web browsers I often turned to was a text-only take on the app called [Lynx][17]. It should come as no surprise that Lynx is still around and available for installation from the standard repositories. As you might expect, Lynx works from the terminal window and doesn’t display pretty pictures or render much in the way of advanced features (Figure 5). In fact, Lynx is as bare-bones a browser as you will find available. Because of how bare-bones this web browser is, it’s not recommended for everyone. But if you happen to have a gui-less web server and you have a need to be able to read the occasional website, Lynx can be a real lifesaver.

![Lynx][19]

Figure 5: The Lynx browser rendering the Linux.com page.

[Used with permission][9]

I have also found Lynx an invaluable tool when troubleshooting certain aspects of a website (or if some feature on a website is preventing me from viewing the content in a regular browser). Another good reason to use Lynx is when you only want to view the content (and not the extraneous elements).

### Plenty More Where This Came From

There are plenty more minimal browsers than this. But the list presented here should get you started down the path of minimalism. One (or more) of these browsers are sure to fill that need, whether you’re running it on a low-powered machine or not.

Learn more about Linux through the free ["Introduction to Linux" ][20]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/11/5-minimal-web-browsers-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://www.mozilla.org/en-US/firefox/new/
[2]: https://www.chromium.org/
[3]: https://vivaldi.com/
[4]: https://www.google.com/chrome/
[5]: https://www.merriam-webster.com/dictionary/epiphany
[6]: https://developer.gnome.org/hig/stable/
[7]: /files/images/minimalbrowsers1jpg
[8]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_1.jpg?itok=Q7wZLF8B (GNOME Web)
[9]: /licenses/category/used-permission
[10]: https://www.netsurf-browser.org/
[11]: https://qupzilla.com/
[12]: /files/images/minimalbrowsers3jpg
[13]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_3.jpg?itok=O8iMALWO (QupZilla)
[14]: /files/images/minimalbrowsers4jpg
[15]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_4.jpg?itok=5bCa0z-e (Otter)
[16]: https://sourceforge.net/projects/otter-browser/files/
[17]: https://lynx.browser.org/
[18]: /files/images/minimalbrowsers5jpg
[19]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_5.jpg?itok=p_Lmiuxh (Lynx)
[20]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
