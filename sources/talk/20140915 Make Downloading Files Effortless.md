zpl1025
Make Downloading Files Effortless
================================================================================
A download manager is computer software that is dedicated to the task of downloading files, optimizing bandwidth usage, and operating in a more organized way. Some web browsers, such as Firefox, include a download manager as a feature, but their implementation lacks the sophistication of a dedicated download manager (or add-ons for the web browser), without using bandwidth optimally, and without good file management features.

Users that regularly download files benefit from using a good download manager. The ability to maximize download speeds (with download acceleration), resume and schedule downloads, make safer and more rewarding downloading. Download managers have lost some of their popularity, but the best of them offer real benefits including tight integration with browsers, support for popular sites such as YouTube and much more.

There are some sublime open source download managers for Linux, which makes selection somewhat problematic. I have compiled a roundup of my favorite download managers, and add-ons that turn a download manager into an excellent download manager for Firefox. Each application featured here is released under an open source license.

----------

![](http://www.linuxlinks.com/portal/content2/png/uGet.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-uGet.png)

uGet is a lightweight, easy-to-use and full-featured open source download manager. uGet allows the user to download in multiple parallel streams for download acceleration, put files in a download queue, pause & resume downloads, offers advanced category management, with browser integration, clipboard monitoring, batch downloads, localized into 26 languages, and many more features.

uGet is mature software; it has been in developed for more than 11 years. In that time, it has progressed into a highly versatile download manager, with an estimable set of features, yet maintaining ease of use.

uGet is written in the C language, uses cURL as a backend, and the applicable library, libcurl. uGet has excellent platform compatibility. uGet is primarily a project for Linux, but it also runs on Mac OS X, FreeBSD, Android, and Windows.

#### Features include:  ####

- Easy to use
- Downloads queue place your downloads into a queue to download as many, or as few, downloads as you want simultaneously
- Resume downloads
- Categorized defaults
- Clipboard monitor which is well implemented
- Batch downloads
- Import downloads import from HTML files
- Support for downloading files through HTTP, HTTPS, FTP, BitTorrent & Metalink
- Multi-connection (also known as Multi-Segment): up to 20 simultaneous connections per download with adaptive segment management which means that when one segment drops out then the other connections pick up the slack to ensure optimal download speeds at all times
- Multi-mirror
- FTP login & anonymous FTP
- Powerful scheduler
- FireFox integration via FlashGot
- Aria2 plugin
- Theme chameleoning
- Quiet mode
- Keyboard shortcuts
- CLI / Terminal usage support
- Folder auto-creation
- Download history management
- GnuTLS support
- Supports 26 languages including: Arabic, Belarusian, Chinese (Simplified), Chinese (Traditional), Czech, Danish, English (default), French, Georgian, German, Hungarian, Indonesian, Italian, Polish, Portuguese (Brazil), Russian, Spanish, Turkish, Ukrainian, and Vietnamese


- Website: [ugetdm.com][1]
- Developer: C.H. Huang and contributors
- License: GNU LGPL 2.1
- Version Number: 1.10.5

----------

![](http://www.linuxlinks.com/portal/content2/png/DownThemAll%21.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-DownThemAll%21.png)

DownThemAll! is a fast, reliable and easy-to-use, open source download manager/accelerator built inside Firefox. This add-on lets the user download all the links or images contained in a webpage and much more. The add-on gives the user full control over downloads, dedicated speed and number of parallel connections at any time. Use Metalinks or add mirrors manually to download a file from different servers at the same time.

DownThemAll reads the size of the files you want to download and splits them into multiple sections, which are downloaded in parallel.

#### Features include: ####

- Complete integration with Firefox
- Multi-part download which allows the user to download the file in pieces, then combining the pieces after a completed download; thus increasing the download speed when connected to a slow server
- Metalink support which allows multiple URLs for each file to be passed to DTA, along with checksums and other informatio
- Spider a page with a single link
- Filtering
- Advanced auto-renaming options
- Pause and restart downloads


- Website: [addons.mozilla.org/en-US/firefox/addon/downthemall][2]
- Developer: Federico Parodi, Stefano Verna, Nils Maier
- License: GNU GPL v2
- Version Number: 2.0.17

----------

![](http://www.linuxlinks.com/portal/content2/png/JDownloader.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-JDownloader.png)

JDownloader is a free, open-source download management tool with a large community of developers that makes downloading easy and fast. Users can start, stop or pause downloads, set bandwith limitations, auto-extract archives and much more. It offers an easy-to-extend framework.

JDownloader simplifies downloading files from One-Click-Hosters. It also offers downloading in multiple parallel streams, captcha recognition, automatic file extraction and much more. Additionally, many "link encryption" sites are supported - so you just paste the "encrypted" links and JDownloader does the rest. JDownloader can import CCF, RSDF and DLC files.

#### Features include: ####

- Download several files at once
- Download with multiple connections
- JD has an own powerful OCR module
- Automatic extractor (including password list search) (Rar archives)
- Theme Support
- Multilingual
- About 110 hoster and over 300 decrypt plug-ins
- Reconnect with JDLiveHeaderScripts: (1400 router supported)
- Webupdate
- Integrated package manager for additional modules (eg. Webinterface, Shutdown)


- Website: [jdownloader.org][3]
- Developer: AppWork UG
- License: GNU GPL v3
- Version Number: 0.9.581

----------

![](http://www.linuxlinks.com/portal/content2/png/FreeRapidDownloader.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-FreeRapidDownloader.png)

FreeRapid Downloader is an easy to use open source downloader that supports downloading from Rapidshare, Youtube, Facebook, Picasa and other file-sharing services. Its engine is based on a list of plugins that make it possible to download from specific websites.

FreeRapid Downloader is an ideal choice for users needing a download manager specialized in sharing websites.

FreeRapid Downloader is written in Java. It needs at least Sun Java 7.0 to run.

#### Features include: ####

- Easy to use
- Supports concurrent downloading from multiple services
- Supports resuming downloads
- Download using proxy list
- Supports streamed videos or pictures
- Download history
- Smart clipboard monitoring
- Automatic checking for file's existence on server
- Auto shutdown options
- Automatic plugins updates
- Simple CAPTCHA recognition
- Multi-platform support
- Internationalization support: English, Bulgarian, Czech, Finnish, Portugal, Slovak, Hungarian, Simplified Chinese and many others
- More than 700 supported sites


- Website: [wordrider.net/freerapid/][4]
- Developer: Vity and contributors
- License: GNU GPL v2
- Version Number: 0.9u4

----------

![](http://www.linuxlinks.com/portal/content2/png/FlashGot.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-FlashGot.png)

FlashGot is a free add-on for Firefox and Thunderbird, meant to handle single and massive ("all" and "selection") downloads with several external Download Managers.

FlashGot turns every supported download manager into a download manager for Firefox.

#### Features include: ####

- Supports in Linux: Aria, Axel Download Accelerator, cURL, Downloader 4 X, FatRat, GNOME Gwget, FatRat, JDownloader, KDE KGet, pyLoad, SteadyFlow, uGet, wxDFast, and wxDownload Fast)
- Build Gallery functionality which helps to synthesize full media galleries in one page, from serial contents originally scattered on several pages, for easy and fast "download all"
- FlashGot Link downloads through the default download manager the link under the mouse pointer
- FlashGot Selection
- FlashGot All
- FlashGot Tabs
- FlashGot Media
- Capture all links from a page
- Capture all links from all tabs
- Filter the links using a mask (e.g. to download only certain types of files)
- Make a selection on a web page and capture all links in that selection
- Supports direct and batch download from the most popular link protection and file hosting services
- Privacy options
- Internationalization support


- Website: [flashgot.net][5]
- Developer: Giorgio Maone
- License: GNU GPL v2
- Version Number: 1.5.6.5

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20140913062041384/DownloadManagers.html

作者：Frazer Kline
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ugetdm.com/
[2]:https://addons.mozilla.org/en-US/firefox/addon/downthemall/
[3]:http://jdownloader.org/
[4]:http://wordrider.net/freerapid/
[5]:http://flashgot.net/
