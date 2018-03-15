Exploring free and open web fonts
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-docdish-yellow-typewriter-keys.png?itok=0sPgIdMG)

There is no question that the face of the web has been transformed in recent years by open source fonts. Prior to 2010, the only typefaces you were likely to see in a web browser were the generic "web safe" [core fonts][1] from Microsoft. But that year saw the start of several revolutions: the introduction of the Web Open Font Format ([WOFF][2]), which offered an open standard for efficiently delivering font files over HTTP, and the launch of web-font services like [Google Fonts][3] and the [Open Font Library][4]—both of which offered web publishers access to a large collection of fonts, for free, available under open licenses.

It is hard to overstate the positive impact of these events on web typography. But it can be all too easy to equate the successes of open web fonts with open source typography as a whole and conclude that the challenges are behind us, the puzzles solved. That is not the case, so if you care about type, the good news is there are a lot of opportunities to get involved in improvement.

For starters, it's critical to understand that Google Fonts and Open Font Library offer a specialized service—delivering fonts in web pages—and they don't implement solutions for other use cases. That is not a shortcoming on the services' side; it simply means that we have to develop other solutions.

There are a number of problems to solve. Probably the most obvious example is the awkwardness of installing fonts on a desktop Linux machine for use in other applications. You can download any of the web fonts offered by either service, but all you will get is a generic ZIP file with some TTF or OTF binaries inside and a plaintext license file. What happens next is up to you to guess.

Most users learn quickly that the "right" step is to manually copy those font binaries into any one of a handful of special directories on their hard drive. But that just makes the files visible to the operating system; it doesn't offer much in the way of a user experience. Again, this is not a flaw with the web-font service; rather it's evidence of the point where the service stops and more work needs to be done on the other side.

A big improvement from the user's perspective would be for the OS or the desktop environment to be smarter at this "just downloaded" stage. Not only would it install the font files to the right location but, more importantly, it could add important metadata that the user will want to access when selecting a font to use in a project.

What this additional information consists of and how it is presented to the user is tied to another challenge: Managing a font collection on Linux is noticeably less pleasant than on other operating systems. Periodically, font manager applications appear (see [GTK+ Font Manager][5] for one of the most recent examples), but they rarely catch on. I've been thinking a lot about where I think they come up short; one core factor is they have limited themselves to displaying only the information embedded in the font binary: basic character-set coverage, weight/width/slope settings, embedded license and copyright statements, etc.

But a lot of decisions go into the process of selecting a font for a job besides what's in this embedded data. Serious font users—like information designers, journal article authors, or book designers—make their font-selection decisions in the context of each document's requirements and needs. That includes license information, naturally, but it includes much more, like information about the designer and the foundry, stylistic trends, or details about how the font works in use.

For example, if your document includes both English and Arabic text, you probably want a font where the Latin and Arabic glyphs were designed together by someone experienced with the two scripts. Otherwise, you'll waste a ton of time making tiny adjustments to the font sizes and line spacing trying to get the two languages to mix well. You may have learned from experience that certain designers or vendors are better at multi-script design than others. Or it might be relevant to your project that today's fashion magazines almost exclusively use "[Didone][6]"-style typefaces, a name that refers to super-high-contrast styles pioneered by [Firmin Didot][7] and [Giambattista Bodoni][8] around 200 years ago. It just happens to be the trend.

But none of those terms (Didone, Didot, or Bodoni) are likely to show up in the binary's embedded data, nor is easy to tell whether the Latin and Arabic fit together or anything else about the typeface's back history. That information might appear in supplementary material like a type specimen or font documentation—if any exists.

A specimen is a designed document (often a PDF) that shows the font in use and includes background information; it frequently serves a dual role as a marketing piece and a sample to look at when choosing a font. The considered design of a specimen showcases how the font functions in practice and in a manner that an automatically generated character table simply cannot. Documentation may include some other vital information, like how to activate the font's OpenType features, what mathematical or archaic forms it provides, or how it varies stylistically across supported languages. Making this sort of material available to the user in the font-management application would go a long way towards helping users find the fonts that fit their projects' needs.

Of course, if we're going to consider a font manager that can handle documentation and specimens, we also have to take a hard look at what comes with the font packages provided by distributions. Linux users start with a few fonts automatically installed, and repository-provided packages are the only font source most users have besides downloading the generic ZIP archive. Those packages tend to be pretty bare-bones. Commercial fonts generally include specimens, documentation, and other support items, whereas open source fonts usually do not.

There are some excellent examples of open fonts that do provide quality specimens and documentation (see [SIL Gentium][9] and [Bungee][10] for two distinctly different but valid approaches), but they rarely (if ever) make their way into the downstream packaging chain. We plainly can do better.

There are some technical obstacles to offering a richer user experience for interacting with the fonts on your system. For one thing, the [AppStream][11] metadata standard defines a few [parameters][12] specific to font files, but so far includes nothing that would cover specimens, designer and foundry information, and other relevant details. For another, the [SPDX][13] (Software Package Data Exchange) format does not cover many of the software licenses (and license variants) used to distribute fonts.

Finally, as any audiophile will tell you, a music player that does not let you edit and augment the ID3 tags in your MP3 collection is going to get frustrating quickly. You want to fix errors in the tags, you want to add things like notes and album art—essentially, you want to polish your library. You would want to do the same to keep your local font library in a pleasant-to-use state.

But editing the embedded data in a font file has been taboo because fonts tend to get embedded and attached to other documents. If you monkey with the fields in a font binary, then redistribute it with your presentation slides, anyone who downloads those slides can end up with bad metadata through no fault of their own. So anyone making improvements to the font-management experience will have to figure out how to strategically wrangle repeated changes to the embedded and external font metadata.

In addition to the technical angle, enriching the font-management experience is also a design challenge. As I said above, good specimens and well-written documentation exist for several open fonts. But there are many more packages missing both, and there are a lot of older font packages that are no longer being maintained. That probably means the only way that most open font packages are going to get specimens or documentation is for the community to create them.

Perhaps that's a tall order. But the open source design community is bigger than it has ever been, and it is a highly motivated segment of the overall free and open source software movement. So who knows; maybe this time next year finding, downloading, and using fonts on a desktop Linux system will be an entirely different experience.

One train of thought on the typography challenges of modern Linux users includes packaging, document design, and maybe even a few new software components for desktop environments. There are other trains to consider, too. The commonality is that where the web-font service ends, matters get more difficult.

The best news, from my perspective, is that there are more people interested in this topic than ever before. For that, I think we have the higher profile that open fonts have received from big web-font services like Google Fonts and Open Font Library to thank.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/webfonts

作者：[Nathan Willis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/n8willis
[1]:https://en.wikipedia.org/wiki/Core_fonts_for_the_Web
[2]:https://en.wikipedia.org/wiki/Web_Open_Font_Format
[3]:https://fonts.google.com/
[4]:https://fontlibrary.org/
[5]:https://fontmanager.github.io/
[6]:https://en.wikipedia.org/wiki/Didone_(typography)
[7]:https://en.wikipedia.org/wiki/Firmin_Didot
[8]:https://en.wikipedia.org/wiki/Giambattista_Bodoni
[9]:https://software.sil.org/gentium/
[10]:https://djr.com/bungee/
[11]:https://www.freedesktop.org/wiki/Distributions/AppStream/
[12]:https://www.freedesktop.org/software/appstream/docs/sect-Metadata-Fonts.html
[13]:https://spdx.org/
