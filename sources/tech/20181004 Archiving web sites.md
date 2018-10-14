Archiving web sites
======

I recently took a deep dive into web site archival for friends who were worried about losing control over the hosting of their work online in the face of poor system administration or hostile removal. This makes web site archival an essential instrument in the toolbox of any system administrator. As it turns out, some sites are much harder to archive than others. This article goes through the process of archiving traditional web sites and shows how it falls short when confronted with the latest fashions in the single-page applications that are bloating the modern web.

### Converting simple sites

The days of handcrafted HTML web sites are long gone. Now web sites are dynamic and built on the fly using the latest JavaScript, PHP, or Python framework. As a result, the sites are more fragile: a database crash, spurious upgrade, or unpatched vulnerability might lose data. In my previous life as web developer, I had to come to terms with the idea that customers expect web sites to basically work forever. This expectation matches poorly with "move fast and break things" attitude of web development. Working with the [Drupal][2] content-management system (CMS) was particularly challenging in that regard as major upgrades deliberately break compatibility with third-party modules, which implies a costly upgrade process that clients could seldom afford. The solution was to archive those sites: take a living, dynamic web site and turn it into plain HTML files that any web server can serve forever. This process is useful for your own dynamic sites but also for third-party sites that are outside of your control and you might want to safeguard.

For simple or static sites, the venerable [Wget][3] program works well. The incantation to mirror a full web site, however, is byzantine:

```
 $ nice wget --mirror --execute robots=off --no-verbose --convert-links \
 --backup-converted --page-requisites --adjust-extension \
 --base=./ --directory-prefix=./ --span-hosts \
 --domains=www.example.com,example.com http://www.example.com/

```

The above downloads the content of the web page, but also crawls everything within the specified domains. Before you run this against your favorite site, consider the impact such a crawl might have on the site. The above command line deliberately ignores [`robots.txt`][] rules, as is now [common practice for archivists][4], and hammer the website as fast as it can. Most crawlers have options to pause between hits and limit bandwidth usage to avoid overwhelming the target site.

The above command will also fetch "page requisites" like style sheets (CSS), images, and scripts. The downloaded page contents are modified so that links point to the local copy as well. Any web server can host the resulting file set, which results in a static copy of the original web site.

That is, when things go well. Anyone who has ever worked with a computer knows that things seldom go according to plan; all sorts of things can make the procedure derail in interesting ways. For example, it was trendy for a while to have calendar blocks in web sites. A CMS would generate those on the fly and make crawlers go into an infinite loop trying to retrieve all of the pages. Crafty archivers can resort to regular expressions (e.g. Wget has a `--reject-regex` option) to ignore problematic resources. Another option, if the administration interface for the web site is accessible, is to disable calendars, login forms, comment forms, and other dynamic areas. Once the site becomes static, those will stop working anyway, so it makes sense to remove such clutter from the original site as well.

### JavaScript doom

Unfortunately, some web sites are built with much more than pure HTML. In single-page sites, for example, the web browser builds the content itself by executing a small JavaScript program. A simple user agent like Wget will struggle to reconstruct a meaningful static copy of those sites as it does not support JavaScript at all. In theory, web sites should be using [progressive enhancement][5] to have content and functionality available without JavaScript but those directives are rarely followed, as anyone using plugins like [NoScript][6] or [uMatrix][7] will confirm.

Traditional archival methods sometimes fail in the dumbest way. When trying to build an offsite backup of a local newspaper ([pamplemousse.ca][8]), I found that WordPress adds query strings (e.g. `?ver=1.12.4`) at the end of JavaScript includes. This confuses content-type detection in the web servers that serve the archive, which rely on the file extension to send the right `Content-Type` header. When such an archive is loaded in a web browser, it fails to load scripts, which breaks dynamic websites.

As the web moves toward using the browser as a virtual machine to run arbitrary code, archival methods relying on pure HTML parsing need to adapt. The solution for such problems is to record (and replay) the HTTP headers delivered by the server during the crawl and indeed professional archivists use just such an approach.

### Creating and displaying WARC files

At the [Internet Archive][9], Brewster Kahle and Mike Burner designed the [ARC][10] (for "ARChive") file format in 1996 to provide a way to aggregate the millions of small files produced by their archival efforts. The format was eventually standardized as the WARC ("Web ARChive") [specification][11] that was released as an ISO standard in 2009 and revised in 2017. The standardization effort was led by the [International Internet Preservation Consortium][12] (IIPC), which is an "international organization of libraries and other organizations established to coordinate efforts to preserve internet content for the future", according to Wikipedia; it includes members such as the US Library of Congress and the Internet Archive. The latter uses the WARC format internally in its Java-based [Heritrix crawler][13].

A WARC file aggregates multiple resources like HTTP headers, file contents, and other metadata in a single compressed archive. Conveniently, Wget actually supports the file format with the `--warc` parameter. Unfortunately, web browsers cannot render WARC files directly, so a viewer or some conversion is necessary to access the archive. The simplest such viewer I have found is [pywb][14], a Python package that runs a simple webserver to offer a Wayback-Machine-like interface to browse the contents of WARC files. The following set of commands will render a WARC file on `http://localhost:8080/`:

```
 $ pip install pywb
 $ wb-manager init example
 $ wb-manager add example crawl.warc.gz
 $ wayback

```

This tool was, incidentally, built by the folks behind the [Webrecorder][15] service, which can use a web browser to save dynamic page contents.

Unfortunately, pywb has trouble loading WARC files generated by Wget because it [followed][16] an [inconsistency in the 1.0 specification][17], which was [fixed in the 1.1 specification][18]. Until Wget or pywb fix those problems, WARC files produced by Wget are not reliable enough for my uses, so I have looked at other alternatives. A crawler that got my attention is simply called [crawl][19]. Here is how it is invoked:

```
 $ crawl https://example.com/

```

(It does say "very simple" in the README.) The program does support some command-line options, but most of its defaults are sane: it will fetch page requirements from other domains (unless the `-exclude-related` flag is used), but does not recurse out of the domain. By default, it fires up ten parallel connections to the remote site, a setting that can be changed with the `-c` flag. But, best of all, the resulting WARC files load perfectly in pywb.

### Future work and alternatives

There are plenty more [resources][20] for using WARC files. In particular, there's a Wget drop-in replacement called [Wpull][21] that is specifically designed for archiving web sites. It has experimental support for [PhantomJS][22] and [youtube-dl][23] integration that should allow downloading more complex JavaScript sites and streaming multimedia, respectively. The software is the basis for an elaborate archival tool called [ArchiveBot][24], which is used by the "loose collective of rogue archivists, programmers, writers and loudmouths" at [ArchiveTeam][25] in its struggle to "save the history before it's lost forever". It seems that PhantomJS integration does not work as well as the team wants, so ArchiveTeam also uses a rag-tag bunch of other tools to mirror more complex sites. For example, [snscrape][26] will crawl a social media profile to generate a list of pages to send into ArchiveBot. Another tool the team employs is [crocoite][27], which uses the Chrome browser in headless mode to archive JavaScript-heavy sites.

This article would also not be complete without a nod to the [HTTrack][28] project, the "website copier". Working similarly to Wget, HTTrack creates local copies of remote web sites but unfortunately does not support WARC output. Its interactive aspects might be of more interest to novice users unfamiliar with the command line.

In the same vein, during my research I found a full rewrite of Wget called [Wget2][29] that has support for multi-threaded operation, which might make it faster than its predecessor. It is [missing some features][30] from Wget, however, most notably reject patterns, WARC output, and FTP support but adds RSS, DNS caching, and improved TLS support.

Finally, my personal dream for these kinds of tools would be to have them integrated with my existing bookmark system. I currently keep interesting links in [Wallabag][31], a self-hosted "read it later" service designed as a free-software alternative to [Pocket][32] (now owned by Mozilla). But Wallabag, by design, creates only a "readable" version of the article instead of a full copy. In some cases, the "readable version" is actually [unreadable][33] and Wallabag sometimes [fails to parse the article][34]. Instead, other tools like [bookmark-archiver][35] or [reminiscence][36] save a screenshot of the page along with full HTML but, unfortunately, no WARC file that would allow an even more faithful replay.

The sad truth of my experiences with mirrors and archival is that data dies. Fortunately, amateur archivists have tools at their disposal to keep interesting content alive online. For those who do not want to go through that trouble, the Internet Archive seems to be here to stay and Archive Team is obviously [working on a backup of the Internet Archive itself][37].

--------------------------------------------------------------------------------

via: https://anarc.at/blog/2018-10-04-archiving-web-sites/

作者：[Anarcat][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://anarc.at
[1]: https://anarc.at/blog
[2]: https://drupal.org
[3]: https://www.gnu.org/software/wget/
[4]: https://blog.archive.org/2017/04/17/robots-txt-meant-for-search-engines-dont-work-well-for-web-archives/
[5]: https://en.wikipedia.org/wiki/Progressive_enhancement
[6]: https://noscript.net/
[7]: https://github.com/gorhill/uMatrix
[8]: https://pamplemousse.ca/
[9]: https://archive.org
[10]: http://www.archive.org/web/researcher/ArcFileFormat.php
[11]: https://iipc.github.io/warc-specifications/
[12]: https://en.wikipedia.org/wiki/International_Internet_Preservation_Consortium
[13]: https://github.com/internetarchive/heritrix3/wiki
[14]: https://github.com/webrecorder/pywb
[15]: https://webrecorder.io/
[16]: https://github.com/webrecorder/pywb/issues/294
[17]: https://github.com/iipc/warc-specifications/issues/23
[18]: https://github.com/iipc/warc-specifications/pull/24
[19]: https://git.autistici.org/ale/crawl/
[20]: https://archiveteam.org/index.php?title=The_WARC_Ecosystem
[21]: https://github.com/chfoo/wpull
[22]: http://phantomjs.org/
[23]: http://rg3.github.io/youtube-dl/
[24]: https://www.archiveteam.org/index.php?title=ArchiveBot
[25]: https://archiveteam.org/
[26]: https://github.com/JustAnotherArchivist/snscrape
[27]: https://github.com/PromyLOPh/crocoite
[28]: http://www.httrack.com/
[29]: https://gitlab.com/gnuwget/wget2
[30]: https://gitlab.com/gnuwget/wget2/wikis/home
[31]: https://wallabag.org/
[32]: https://getpocket.com/
[33]: https://github.com/wallabag/wallabag/issues/2825
[34]: https://github.com/wallabag/wallabag/issues/2914
[35]: https://pirate.github.io/bookmark-archiver/
[36]: https://github.com/kanishka-linux/reminiscence
[37]: http://iabak.archiveteam.org
