[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tips and tricks for using CUPS for printing with Linux)
[#]: via: (https://opensource.com/article/19/1/cups-printing-linux)
[#]: author: (Antoine Thomas https://opensource.com/users/ttoine)

Tips and tricks for using CUPS for printing with Linux
======
One of Apple's most important contributions to GNU/Linux was adopting CUPS in Mac OS X.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Did you ever try to configure a printer on a GNU/Linux desktop distribution at the end of the '90s? Or even before?

To make a long story short: That was fine if you worked at a large organization with an IT team to handle it and dedicated hardware or a printing server. There were many different standards and protocols to handle printers. And only a few big vendors (usually Unix vendors) provided specific support and drivers for their entire range of products.

However, if open source enthusiasts wanted a home printer that would work with their favorite distribution, that was another story. They probably spent a fair amount of time on forums, newsgroups, or IRC (remember those ancestors of social networks and chats?) asking about printers with easy-to-install Linux drivers.

In 1999, the first version of [CUPS][1] (the Common Unix Printing System) was released by Easy Software Products. Most of the most popular distributions at the time adopted CUPS as their default printing system. That was a huge success: one standard could handle many printers and protocols.

But if the printer vendor didn't provide a CUPS driver, it was still tricky or impossible to make it work. Some smart people might do reverse engineering. And a few printers, with native support of PostScript and Internet Printing Protocol (IPP), worked "out of the box."

### Then came Apple

In the early 2000s, Apple was struggling to build a new printing system for its new Mac OS X. In March 2002, it decided to save time by adopting CUPS for its flagship operating system.

No printer vendor could ignore Apple computers' market share, so a lot of new printer drivers for Mac OS X's CUPS became available, spanning most vendors and product ranges, including corporate, graphic arts, consumer, and photo printing.

CUPS became so important for Apple that it bought the software from Easy Software Products in 2007; since then Apple has continued to maintain it and manage its intellectual property.

### But what does that have to do with GNU/Linux?

At the time Apple integrated CUPS in Mac OS X, it was already used by default in many distros and available for most others. But few dedicated drivers were available, meaning they were not packaged or listed as "for GNU/Linux."

However, once CUPS drivers were available for Mac OS X, a simple hack became popular with GNU/Linux enthusiasts: download the Mac driver, extract the PPD files, and test them with your printer. I used this hack many times with my Epson printers.

That's the CUPS magic: If a driver exists, it usually works with all operating systems that use CUPS for printing, as long as they use a supported protocol (like IPP).

That's how printer drivers began to be available for GNU/Linux.

### Nowadays

Afterward, printer vendors realized it was quite easy to provide drivers for GNU/Linux since they already developed them for Mac. It's now easy to find a GNU/Linux driver for a printer, even a newer one. Some distributions include packages with a lot of drivers, and most vendors provide dedicated drivers—sometimes via a package, other times with PPD files in an archive.

Advanced control applications are available too, some official, some not, which make it possible (for example) to look at ink levels or clean printing heads.

In some cases, installing a printer on GNU/Linux is even easier than on other operating systems, particularly with distributions using [zero-configuration networking][2] (e.g., Bonjour, Avahi) to auto-discover and share network printers.

### Tips and tricks

  * **Install a PDF printer:** Installing a PDF printer on GNU/Linux is very easy. Just look for the **cups-pdf** package in your favorite distribution and install it. If the package doesn't automatically create the PDF printer, you can add one using your system preferences to print in PDF from any application.

  * **Access the CUPS web interface:** If your usual interface for managing printers doesn't work or you don't like it, open a web browser and go to <http://localhost:631/admin>. You can manage all the printers installed on your computer, adjust their settings, and even add new ones—all from this web interface. Note that this might be available on other computers on your network; if so, replace "localhost" with the relevant hostname or IP address.

  * **Check ink level:** If you have an Epson, Canon, HP, or Sony printer, you can see its ink level with a simple application. Look for the "ink" package in your distribution repositories.

  * **Contribute to CUPS:** Like many open source project, CUPS is maintained on GitHub. Check the [CUPS website][1] and [GitHub issues][3] to find out how you can contribute to improving it.




### CUPS license

Originally, CUPS was released under GPLv2. I'm not sure why; maybe to make it easier to distribute with GNU/Linux. Or maybe it was just what most open source projects did at the time.

Apple decided to [change the license][4] in November 2017 to the Apache 2.0 license. Many observers commented that it was consistent with Apple's strategy to move the IP of its open source projects to more business-compliant licenses.

While this change could create issues with shipping CUPS with GNU/Linux, it is still available in most distributions.

### Happy 20th birthday, CUPS!

CUPS was released in 1999, so, let's celebrate and thank all the people involved in this successful open source project, from the original authors to the driver developers to its current maintainers.

The next time you print with your favorite GNU/Linux operating system, remind yourself to say "thank you" to Apple.

The company isn't well known for its contributions to open source. But if you look carefully (at, for example, [Apple's Open Source Releases][5] and [Open Source Development][6] pages), you'll see how many open source components are in Apple's operating systems and applications.

You'll also discover other important open source projects Apple kicked off. For example, it forked KHTML, the KDE browser, to create [WebKit][7] for the Safari Browser. Wait, THE WebKit? Yes, Apple initiated WebKit. But that is another story...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/cups-printing-linux

作者：[Antoine Thomas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ttoine
[b]: https://github.com/lujun9972
[1]: https://www.cups.org/
[2]: https://en.wikipedia.org/wiki/Zero-configuration_networking#Major_implementations
[3]: https://github.com/apple/cups/issues
[4]: https://www.cups.org/blog/2017-11-07-cups-license-change.html
[5]: https://opensource.apple.com/
[6]: https://developer.apple.com/opensource/
[7]: https://webkit.org/
