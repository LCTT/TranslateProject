[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 open source web browser alternatives)
[#]: via: (https://opensource.com/article/19/7/open-source-browsers)
[#]: author: (Bryant Son https://opensource.com/users/brson/users/lauren-pritchett/users/scottnesbitt)

6 open source web browser alternatives
======
Chrome and Firefox are on the list, but you'll find some other
interesting options, too.
![web development and design, desktop and browser][1]

Open source web browsers have come a long way since Microsoft dominated the web browser market with its closed source Internet Explorer (IE). For many years, IE was the standard browser for Microsoft's Windows operating system, while Safari (also closed source) was the default browser for MacOS. Then Mozilla's introduction of Firefox, followed by Google's release of Chrome, sparked a revolution in open source internet browsers. Those two are extremely well known but are not the only open source browsers available.

This article introduces seven open source browsers, summarizes their features, and shares how you can contribute to them.

Name / Link to Contribute | License | Supported OSes
---|---|---
[Brave][2] | MPL 2.0 | All
[Chrome/Chromium][3] | BSD | All
[Firefox][4] | MPL 2.0 | All
[Konqueror][5] | GPL | Linux
[Lynx][6] | GPL | Linux, Windows, DOS
[Midori][7] | LGPL | Linux, Windows

### Brave

The [Brave browser][8] was created with the goal of blocking all but user-approved advertisements and website trackers. [Brendan Eich][9], the creator of JavaScript and a co-founder of the Mozilla Foundation, leads the Brave project as the CEO and a co-founder.

**Pros of Brave:**

  * No ads or web trackers
  * Speed
  * Security
  * Chromium [extension support][10]
  * Bugs are tracked in [Brave QA central][11]



**Cons of Brave:**

  * The opt-in micro-payment system to support content creators has an unclear pathway to get your payments to your intended recipient



You can find Brave's source code (available under the Mozilla Public License) in its extensive [GitHub repositories][2] (there are 140 repos as of this writing).

### Chrome/Chromium

[Google Chrome][12], inarguably, is the most [widely used][13] internet browser—open source or otherwise. I remember when Google introduced the first version of Chrome. Mozilla Firefox, which came out much earlier, was riding a wave of popularity. The first version of Chrome was so slow, buggy, and disappointing, which led me to think it wouldn't be successful. But, boy, I was wrong. Chrome got better and better, and the browser eventually surpassed Firefox's browser market share. Google Chrome is still known as a "memory hog" due to its heavy random access memory (RAM) utilization. Regardless, Chrome is by far the most popular browser, and it's loved by many due to its simplicity and speed.

**Pros of Google Chrome/Chromium:**

  * Simplicity
  * Speed
  * Many useful built-in features



**Cons of Google Chrome/Chromium:**

  * Heavy memory usage
  * Chrome (not Chromium) has proprietary code



Chromium, which is the open source project behind the Chrome browser, is available under the Berkeley Software Distribution (BSD) license. Note that the Chrome browser also has some closed source code. To contribute, visit the [Contributing to Chromium][14] page.

### Firefox

Although Chrome is now the most popular browser, [Mozilla Firefox][15] is the one that started the whole open source web browser sensation. Before Mozilla Firefox, Internet Explorer seemed to be undefeatable. But the birth of Firefox shook that belief. One interesting bit of trivia is that its co-founder [Blake Ross][16] was only 19 years old when Firefox was released.

**Pros of Mozilla Firefox:**

  * Security
  * Many extensions are available
  * Uniform user experience across different systems



**Cons of Mozilla Firefox:**

  * Heavy memory usage
  * Some HTML5 compatibility issue



Firefox's source code is available under the Mozilla Public License (MPL), and it maintains comprehensive guidelines on [how to contribute][4].

### Konqueror

[Konqueror][17] may not be the most well-known internet browser, and that is okay because it is responsible for KHTML, the browser engine forked by Apple and then Google for the Safari and Chrome browsers (and subsequently used by Brave, Vivaldi, and several other browsers). Today, Konqueror can use either its native KHTML engine or the Chromium fork. Konqueror is maintained by the international [KDE][18] free software community, and it's easy to find on most Linux desktops.

**Pros of Konqueor:**

  * Pre-installed on many Linux desktops
  * Fast and efficient
  * Built-in ad-blocker and pop-up blocker
  * Customizable URL shortcuts
  * Doubles as a file manager, man page viewer, and much more



**Cons of Konqueror:**

  * Primarily runs in Linux
  * Requires several KDE libraries to be installed



Konqueror's source code is available under the GNU Public License (GPL). You can find its detailed [documentation][19] and [source code][5] on the KDE website.

### Lynx

Ah, [Lynx][20]. Lynx is a unique browser as it is entirely text-based. It is also the oldest web browser still in use and still under development. You might think, "who would use a text-based browser?" But it works, and there is a big community supporting this special open source browser.

**Pros of Lynx:**

  * Extremely lightweight
  * Extremely minimal
  * Extremely secure
  * Supports DOS and Windows
  * Ideal for testing and safe browsing



**Cons of Lynx:**

  * Nothing but text



Lynx's source code is available under the GNU Public License (GPL) and maintained on [GitHub][6].

### Midori

If you hear "Midori," you might think of a green-hued cocktail. But the [Midori browser][21] is an open source, lightweight browser. If you want a simple and lightweight browser, Midori might be an interesting one to look at. But note that there is no stable release for this browser, and it is known to be quite buggy.

**Pros of Midori:**

  * Simple
  * Lightweight



**Cons of Midori:**

  * Still no stable release
  * Buggy
  * Almost no extensions
  * No process isolation



Midori's source code is available under the GNU Lesser General Public License (LGPL) and maintained on [GitHub][7].

* * *

Do you know another open source browser that I should have mentioned on this list? Please share it in the comments.

Web browsers that run in a terminal window are alive and kicking. They're niche, but still get the...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/open-source-browsers

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson/users/lauren-pritchett/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh (web development and design, desktop and browser)
[2]: https://github.com/brave
[3]: https://www.chromium.org/Home
[4]: https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Introduction
[5]: https://kde.org/applications/internet/org.kde.konqueror/development
[6]: https://github.com/kurtchen/Lynx
[7]: https://github.com/midori-browser/core
[8]: https://brave.com
[9]: https://en.wikipedia.org/wiki/Brendan_Eich
[10]: https://support.brave.com/hc/en-us/articles/360017909112-How-can-I-add-extensions-to-Brave-
[11]: https://community.brave.com/c/legacy/qa
[12]: https://www.google.com/chrome/
[13]: https://www.statista.com/statistics/544400/market-share-of-internet-browsers-desktop/
[14]: https://chromium.googlesource.com/chromium/src/+/master/docs/contributing.md
[15]: https://www.mozilla.org/firefox/
[16]: https://en.wikipedia.org/wiki/Blake_Ross
[17]: https://kde.org/applications/internet/org.kde.konqueror
[18]: https://kde.org
[19]: https://docs.kde.org/stable5/en/applications/konqueror/index.html
[20]: http://lynx.browser.org/
[21]: https://www.midori-browser.org/
