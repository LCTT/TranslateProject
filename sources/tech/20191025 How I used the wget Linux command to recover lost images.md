[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I used the wget Linux command to recover lost images)
[#]: via: (https://opensource.com/article/19/10/how-community-saved-artwork-creative-commons)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How I used the wget Linux command to recover lost images
======
The story of the rise and fall of the Open Clip Art Library and the
birth of FreeSVG.org, a new library of communal artwork.
![White shoes on top of an orange tribal pattern][1]

In 2004, the Open Clip Art Library (OCAL) was launched as a source of free illustrations for anyone to use, for any purpose, without requiring attribution or anything in return. This site was the open source world’s answer to the big stacks of clip art CDs on the shelf of every home office in the 1990s, and to the art dumps provided by the closed-source office and artistic software titles.

In the beginning, the clip art library consisted mostly of work by a few contributors, but in 2010 it went live with a brand new interactive website, allowing anyone to create and contribute clip art with a vector illustration application. The site immediately garnered contributions from around the globe, and from all manner of free software and free culture projects. A special importer for this library was even included in [Inkscape][2].

However, in early 2019, the website hosting the Open Clip Art Library went offline with no warning or explanation. Its community, which had grown to number in the thousands, assumed at first that this was a temporary glitch. The site remained offline, however, for over six months without any clear explanation of what had happened.

Rumors started to swell. The site was being updated ("There is years of technical debt to pay off," said site developer Jon Philips in an email). The site had fallen to rampant DDOS attacks, claimed a Twitter account. The maintainer had fallen prey to identity theft, another Twitter account claimed. Today, as of this writing, the site’s one and only remaining page declares that it is in "maintenance and protected mode," the meaning of which is unclear, except that users cannot access its content.

### Recovering the commons

Sites appear and disappear over the course of time, but the loss of the Open Clip Art Library was particularly surprising to its community because it was seen as a community project. Few community members understood that the site hosting the library had fallen into the hands of a single maintainer, so while the artwork in the library was owned by everyone due to its [Creative Commons 0 License][3], access to it was functionally owned by a single maintainer. And, because the site’s community kept in touch with one another through the site, that same maintainer effectively owned the community.

When the site failed, the community lost access to its artwork as well as each other. And without the site, there was no community.

Initially, everything on the site was blocked when it went down. After several months, though, users started recognizing that the site’s database was still online, which meant that a user could access an individual art file by entering its exact URL. In other words, you couldn’t navigate to the art file through clicking around a website, but if you already knew the address, then you could bring it up in your browser. Similarly, technical (or lazy) users realized it was also possible to "scrape" the site with an automated web browser like **wget**.

The **wget** Linux command is _technically_ a web browser, although it doesn’t let you browse interactively the way you do with Firefox. Instead, **wget** goes out onto the internet and retrieves a file or a collection of files and downloads them to your hard drive. You can then open those files in Firefox or a text editor, or whatever application is most appropriate, and view the content.

Usually, **wget** needs to know a specific file to fetch. If you’re on Linux or macOS with **wget** installed, you can try this process by downloading the index page for [example.com][4]:


```
$ wget example.org/index.html
[...]
$ tail index.html

&lt;body&gt;&lt;div&gt;
    &lt;h1&gt;Example Domain&lt;/h1&gt;
    &lt;p&gt;This domain is for illustrative examples in documents.
    You may use this domain in examples without permission.&lt;/p&gt;
        &lt;p&gt;&lt;a href="[http://www.iana.org/domains/example"\&gt;More][5] info&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;&lt;/body&gt;&lt;/html&gt;
```

To scrape the Open Clip Art Library, I used the **\--mirror** option, so that I could point **wget** to just the directory containing the artwork so it could download everything within that directory. This action resulted in four straight days (96 hours) of constant downloading, ending with an excess of 100,000 SVG files that had been contributed by over 5,000 community members. Unfortunately, the author of any file that did not have proper metadata was irrecoverable because this information was locked in inaccessible files in the database, but the CC0 license meant that this issue _technically_ didn’t matter (because no attribution is required with CC0 files).

A casual analysis of the downloaded files also revealed that nearly 45,000 of them were copies of the same single file (the site’s logo). This was caused by redirects pointing to the site's logo (for reasons unknown), and careful parsing could extract the original destination. Another 96 hours, and all clip art posted on OCAL up to its last day was recovered: **a total of about 156,000 images.**

SVG files tend to be small, but this is still an enormous amount of work that poses a few very real problems. First of all, several gigabytes of online storage would be needed so the artwork could be made available to its former community. Secondly, a means of searching the artwork would be necessary, because it’s just not realistic to browse through 55,000 files manually.

It became apparent that what the community really needed was a platform.

### Building a new platform

For some time, the site [Public Domain Vectors][6] had been publishing vector art that was in the public domain. While it remains a popular site, open source users often used it only as a secondary source of art because most of the files there were in the EPS and AI formats, both of which are associated with Adobe. Both file formats can generally be converted to SVG but at a loss of features.

When the Public Domain Vectors site’s maintainers (Vedran and Boris) heard about the loss of the Open Clip Art Library, they decided to create a site oriented toward the open source community. True to form, they chose the open source [Laravel][7] framework as the backend, which provided the site with an admin dashboard and user access. The framework, being robust and well-developed, also allowed them to respond quickly to bug reports and feature requests, and to upgrade the site as needed. The site they are building is called [FreeSVG.org][8], and is already a robust and thriving library of communal artwork.

Since then they have been uploading all of the clip art from the Open Clip Art Library, and they're even diligently tagging and categorizing the art as they go. As creators of Public Domain Vectors, they are also contributing their own images in SVG format. Their aim is to become the primary resource for SVG images with a CC0 license on the internet.

### Contributing

The maintainers of [FreeSVG.org][8] are aware that they have inherited significant stewardship. They are working to title and describe all images on the site so that users can easily find artwork, and will provide this file to the community once it is ready, believing strongly that the metadata about the art belongs to the people that create and use the art as much as the art itself does. They're also aware that unforeseen circumstances can arise, so they create regular backups of their site and content, and intend to make the most recent backup available to the public, should their site fail.

If you want to add to the Creative Commons content of [FreeSVG.org][9], then download [Inkscape][10] and start drawing. There’s plenty of public domain artwork out there in the world, like [historical advertisements][11], [tarot cards][12], and [storybooks][13] just waiting to be converted to SVG, so you can contribute even if you aren’t confident in your drawing skills. Visit the [FreeSVG forum][14] to connect with and support other contributors.

The concept of the _commons_ is important. [Creative Commons benefits everyone][15], whether you’re a student, teacher, librarian, small business owner, or CEO. If you don’t contribute directly, then you can always help promote it.

That’s a strength of free culture: It doesn’t just scale, it gets better when more people participate.

### Hard lessons learned

From the demise of the Open Clip Art Library to the rise of FreeSVG.org, the open culture community has learned several hard lessons. For posterity, here are the ones that I believe are most important.

#### Maintain your metadata

If you’re a content creator, help the archivists of the future and add metadata to your files. Most image, music, font, and video file formats can have EXIF data embedded into them, and others have metadata entry interfaces in the applications that create them. Be diligent in tagging your work with your name, website or public email, and license.

#### Make copies

Don’t assume that somebody else is doing backups. If you care about communal digital content, then back it up yourself, or else don’t count on having it available forever. The trope that _whatever’s uploaded to the internet is forever_ may be true, but that doesn’t mean it’s _available to you_ forever. If the Open Clip Art Library files hadn’t become secretly available again, it’s unlikely that anyone would have ever successfully uncovered all 55,000 images from random places on the web, or from personal stashes on people’s hard drives around the globe.

#### Create external channels

If a community is defined by a single website or physical location, then that community is as good as dissolved should it lose access to that space. If you’re a member of a community that’s driven by a single organization or site, you owe it to yourselves to share contact information with those you care about and to establish a channel for communication even when that site is not available.

For example, [Opensource.com][16] itself maintains mailing lists and other off-site channels for its authors and correspondents to communicate with one another, with or without the intervention or even existence of the website.

#### Free culture is worth working for

The internet is sometimes seen as a lazy person’s social club. You can log on when you want and turn it off when you’re tired, and you can wander into whatever social circle you want.

But in reality, free culture can be hard work. It’s not hard in the sense that it’s difficult to be a part of, but it’s something you have to work to maintain. If you ignore the community you’re in, then the community may wither and fade before you realize it.

Take a moment to look around you and identify what communities you’re a part of, and if nothing else, tell someone that you appreciate what they bring to your life. And just as importantly, keep in mind that you’re contributing to the lives of your communities, too.

Creative Commons held its Gl obal Summit a few weeks ago in Warsaw, with amazing international...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-community-saved-artwork-creative-commons

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tribal_pattern_shoes.png?itok=e5dSf2hS (White shoes on top of an orange tribal pattern)
[2]: https://opensource.com/article/18/1/inkscape-absolute-beginners
[3]: https://creativecommons.org/share-your-work/public-domain/cc0/
[4]: http://example.com
[5]: http://www.iana.org/domains/example"\>More
[6]: http://publicdomainvectors.org
[7]: https://github.com/viralsolani/laravel-adminpanel
[8]: https://freesvg.org
[9]: http://freesvg.org
[10]: http://inkscape.org
[11]: https://freesvg.org/drinking-coffee-vector-drawing
[12]: https://freesvg.org/king-of-swords-tarot-card
[13]: https://freesvg.org/space-pioneers-135-scene-vector-image
[14]: http://forum.freesvg.org/
[15]: https://opensource.com/article/18/1/creative-commons-real-world
[16]: http://Opensource.com
