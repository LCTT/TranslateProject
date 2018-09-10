translating---geekpi

Two open source alternatives to Flash Player
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bulb-light-energy-power-idea.png?itok=zTEEmTZB)

In July 2017, Adobe sounded the [death knell][1] for its Flash Media Player, announcing it would end support for the once-ubiquitous online video player in 2020. In truth, however, Flash has been on the decline for the past eight years following a rash of zero-day attacks that damaged its reputation. Its future dimmed after Apple announced in 2010 it would not support the technology, and its demise accelerated in 2016 after Google stopped enabling Flash by default (in favor of HTML5) in the Chrome browser.

Even so, Adobe is still issuing monthly updates for the software, which has slipped from being used on 28.5% of all websites in 2011 to [only 4.4.%][2] as of August 2018. More evidence of Flash’s decline: Google director of engineering [Parisa Tabriz said][3] the number of Chrome users who access Flash content via the browser has declined from 80% in 2014 to under eight percent in 2018.

Although few* video creators are publishing in Flash format today, there are still a lot of Flash videos out there that people will want to access for years to come. Given that the official application’s days are numbered, open source software creators have a great opportunity to step in with alternatives to Adobe Flash Media Player. Two of those applications are Lightspark and GNU Gnash. Neither are perfect substitutions, but help from willing contributors could make them viable alternatives.

### Lightspark

[Lightspark][4] is a Flash Player alternative for Linux machines. While it’s still in alpha, development has accelerated since Adobe announced it would sunset Flash in 2017. According to its website, Lightspark implements about 60% of the Flash APIs and [works][5] on many leading websites including BBC News, Google Play Music, and Amazon Music.

Lightspark is written in C++/C and licensed under [LGPLv3][6]. The project lists 41 contributors and is actively soliciting bug reports and other contributions. For more information, check out its [GitHub repository][5].

### GNU Gnash

[GNU Gnash][7] is a Flash Player for GNU/Linux operating systems including Ubuntu, Fedora, and Debian. It works as standalone software and as a plugin for the Firefox and Konqueror browsers.

Gnash’s main drawback is that it doesn’t support the latest versions of Flash files—it supports most Flash SWF v7 features, some v8 and v9 features, and offers no support for v10 files. It’s in beta release, and since it’s licensed under the [GNU GPLv3 or later][8], you can help contribute to modernizing it. Access its [project page][9] for more information.

### Want to create Flash?

*Just because most people aren't publishing Flash videos these days, that doesn't mean there will never, ever be a need to create SWF files. If you find yourself in that position, these two open source tools might help:

  * [Motion-Twin ActionScript 2 Compiler][10] (MTASC): A command-line compiler that can generate SWF files without Adobe Animate (the current iteration of Adobe's video-creator software).
  * [Ming][11]: A library written in C that can generate SWF files. It also contains some [utilities][12] you can use to work with Flash files.



--------------------------------------------------------------------------------

via: https://opensource.com/alternatives/flash-media-player

作者：[Opensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com
[1]: https://theblog.adobe.com/adobe-flash-update/
[2]: https://w3techs.com/technologies/details/cp-flash/all/all
[3]: https://www.bleepingcomputer.com/news/security/google-chrome-flash-usage-declines-from-80-percent-in-2014-to-under-8-percent-today/
[4]: http://lightspark.github.io/
[5]: https://github.com/lightspark/lightspark/wiki/Site-Support
[6]: https://github.com/lightspark/lightspark/blob/master/COPYING
[7]: https://www.gnu.org/software/gnash/
[8]: http://www.gnu.org/licenses/gpl-3.0.html
[9]: http://savannah.gnu.org/projects/gnash/
[10]: http://tech.motion-twin.com/mtasc.html
[11]: http://www.libming.org/
[12]: http://www.libming.org/WhatsIncluded
