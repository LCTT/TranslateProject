[#]: subject: (Microsoft Gets into the OpenJDK Business: What Does it Mean for You?)
[#]: via: (https://news.itsfoss.com/microsoft-openjdk/)
[#]: author: (John Paul Wohlscheid https://news.itsfoss.com/author/john/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Microsoft Gets into the OpenJDK Business: What Does it Mean for You?
======

Microsoft is getting into the Java business. The question is “What does this mean for the Open-Source community?” Has Microsoft learned anything from their past interactions with Java? Let’s see.

### Introducing Microsoft Builds of OpenJDK

Microsoft recently announced that they would be releasing builds of OpenJDK. According to [the announcement][1], these builds will be Long-Term Support (LTS).

The builds will include Java 11 (based on OpenJDK 11.0.10+9) for “macOS, Linux, and Windows”. They will be available for both servers and desktop systems. They are also introducing Early Access builds of Java 16 for Windows on ARM (based on OpenJDK 16+36). “The Microsoft Build of OpenJDK is a simple drop-in replacement for any other OpenJDK distribution available in the Java ecosystem.”

All of the binaries available are considered “Preview”. The announcement mentions that Java 11 was released in 2018. So what call it a “Preview”? Because Microsoft wants feedback from customers on “things like the packaging and installation experience” before they make them production ready.

Since they are consider Long-Term Support, Java 11 will be supported until 2024. OpenJDK 17 will be made available when Java 17 “is finalized”. Microsoft will not be offering support for Java 8.

For those interested in the recipes Microsoft is using to bake its Java cake, they are using the “same build scripts used by the Eclipse Adoptium project and tested against the Eclipse Adoptium Quality Assurance suite (including OpenJDK project tests)”.

The binaries are licensed as “General Public License 2.0 with Classpath Exception (GPLv2+CE)”.

### Not Microsoft’s First Java Rodeo

![][2]

What’s interesting is that this is not the first time that Microsoft got involved with Java. Back in 1996, Microsoft introduced the imaginatively named [J++][3]. Initially, J++ got a lot of [good press][4].

However, the honeymoon didn’t last. [In 2007][5], Sun Microsystems sued Microsoft. They said that Microsoft “breached its licensing agreement by adding extensions that weren’t Java-compatible”. The suit was settled in 2001. “Microsoft was required to pay Sun $20 million, as well as to permanently stop using “Java-compatible” trademarks.” J++ supported ended in 2004.

This was just one of [many times][6] that Microsoft enacted their [Embrace, Extent, Extinguish mantra][7]. This time it was Microsoft plans that were extinguished.

Sometimes, its hard to equate all of the underhanded tactics that Microsoft committed under Bill Gates and his philanthropy.

### So What Does This All Mean?

The burning question is why is Microsoft even bothering to create these binaries in the first place? There are at least half of a dozen organizations that offer OpenJDK binaries, including IBM, Amazon, and Eclipse.

[Mike and Chris from Coder Radio][8] has repeatedly mentioned that Microsoft is transforming itself into a company that creates tools for programmers. They don’t care what platform programmers use, just that they use Microsoft tools. (In the OpenJDK announcement, Microsoft listed the available platforms as “macOS, Linux, and Windows”.) This newest announcement is the latest step in the transformation.

What does it mean for open source? If Microsoft leaves the OpenJDK binaries unchanged, probably not much. At most, they will make the binaries work better on Windows and with Visual Studio Code. However, the big concern would be if they start changing the code.

My advice: Keep your eggs out of Microsoft’s basket, so you don’t get locked into their tooling. At least, until they have proven that they are not evil. After all, there are plenty of alternative already.

![][9]

I'm not interested

#### _Related_

  * [Microsoft Makes 'Extensible Storage Engine' Open-Source, Used by Windows 10 &amp; Microsoft Exchange][10]
  * ![][11] ![][12]


  * [Is Google Locking Down Chrome to Resist the Rise of Chromium Based Browsers?][13]
  * ![][11] ![Google Chrome][14]


  * [Good News! elementary OS is Coming to Raspberry Pi 4][15]
  * ![][11] ![elementary OS Raspberry Pi Build][16]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-openjdk/

作者：[John Paul Wohlscheid][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://devblogs.microsoft.com/java/announcing-preview-of-microsoft-build-of-openjdk/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzM3NScgd2lkdGg9JzI5NScgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[3]: https://en.wikipedia.org/wiki/Visual_J%2B%2B
[4]: https://www.drdobbs.com/microsofts-visual-j-10/184415556
[5]: https://www.informit.com/articles/article.aspx?p=101152
[6]: https://birdhouse.org/beos/byte/30-bootloader/
[7]: https://en.wikipedia.org/wiki/Embrace,_extend,_and_extinguish
[8]: https://coder.show/
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzI1MCcgd2lkdGg9Jzc1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[10]: https://news.itsfoss.com/microsoft-ese-open-source/
[11]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[12]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/02/ese-microsoft.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
[13]: https://news.itsfoss.com/is-google-locking-down-chrome/
[14]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/02/google-chrome.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
[15]: https://news.itsfoss.com/elementary-os-raspberry-pi-release/
[16]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/elementaryos-raspberry-pi-build.jpg?fit=800%2C450&ssl=1&resize=350%2C200
