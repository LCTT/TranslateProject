A brief history of text-based games and open source
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/compass_map_explore_adventure.jpg?itok=ecCoVTrZ)

The [Interactive Fiction Technology Foundation][1] (IFTF) is a non-profit organization dedicated to the preservation and improvement of technologies enabling the digital art form we call interactive fiction. When a Community Moderator for Opensource.com suggested an article about IFTF, the technologies and services it supports, and how it all intersects with open source, I found it a novel angle to the decades-long story I’ve so often told. The history of IF is longer than—but quite enmeshed with—the modern FOSS movement. I hope you’ll enjoy my sharing it here.

### Definitions and history

To me, the term interactive fiction includes any video game or digital artwork whose audience interacts with it primarily through text. The term originated in the 1980s when parser-driven text adventure games—epitomized in the United States by [Zork][2], [The Hitchhiker’s Guide to the Galaxy][3], and the rest of [Infocom][4]’s canon—defined home-computer entertainment. Its mainstream commercial viability had guttered by the 1990s, but online hobbyist communities carried on the tradition, releasing both games and game-creation tools.

After a quarter century, interactive fiction now comprises a broad and sparkling variety of work, from puzzle-laden text adventures to sprawling and introspective hypertexts. Regular online competitions and festivals provide a great place to peruse and play new work: The English-language IF world enjoys annual events including [Spring Thing][5] and [IFComp][6], the latter a centerpiece of modern IF since 1995—which also makes it the longest-lived continually running game showcase event of its kind in any genre. [IFComp’s crop of judged-and-ranked entries from 2017][7] shows the amazing diversity in form, style, and subject matter that text-based games boast today.

(I specify "English-language" above because IF communities tend to self-segregate by language, perhaps due to the technology's focus on writing. There are also annual IF events in [French][8] and [Italian][9], for example, and I've heard of at least one Chinese IF festival. Happily, these borders are porous; during the four years I managed IFComp, it has welcomed English-translated work from all international communities.)

![counterfeit monkey game screenshot][11]

Starting a new game of Emily Short's "Counterfeit Monkey," running on the interpreter Lectrote (both open source software).

Also due to its focus on text, IF presents some of the most accessible platforms for both play and authorship. Almost anyone who can read digital text—including users of assistive technology such as text-to-speech software—can play most IF works. Likewise, IF creation is open to all writers willing to learn and work with its tools and techniques.

This brings us to IF’s long relationship with open source, which has helped enable the art form’s availability since its commercial heyday. I'll provide an overview of contemporary open-source IF creation tools, and then discuss the ancient and sometimes curious tradition of IF works that share their source code.

### The world of open source IF tools

A number of development platforms, most of which are open source, are available to create traditional parser-driven IF in which the user types commands—for example, `go north,` `get lamp`, `pet the cat`, or `ask Zoe about quantum mechanics`—to interact with the game’s world. The early 1990s saw the emergence of several hacker-friendly parser-game development kits; those still in use today include [TADS][12], [Alan][13], and [Quest][14]—all open, with the latter two bearing FOSS licenses.

But by far the most prominent of these is [Inform][15], first released by Graham Nelson in 1993 and now maintained by a team Nelson still leads. Inform source is semi-open, in an unusual fashion: Inform 6, the previous major version, [makes its source available through the Artistic License][16]. This has more immediate relevance than may be obvious, since the otherwise proprietary Inform 7 holds Inform 6 at its core, translating its [remarkable natural-language syntax][17] into its predecessor’s more C-like code before letting it compile the work down into machine code.

![inform 7 IDE screenshot][19]

The Inform 7 IDE, loaded up with documentation and a sample project.

Inform games run on a virtual machine, a relic of the Infocom era when that publisher targeted a VM so that it could write a single game that would run on Apple II, Commodore 64, Atari 800, and other flavors of the "[home computer][20]." Fewer popular operating systems exist today, but Inform’s virtual machines—the relatively modern [Glulx][21] or the charmingly antique [Z-machine][22], a reverse-engineered clone of Infocom’s historical VM—let Inform-created work run on any computer with an Inform interpreter. Currently, popular cross-platform interpreters include desktop programs like [Lectrote][23] and [Gargoyle][24] or browser-based ones like [Quixe][25] and [Parchment][26]. All are open source.

If the pace of Inform’s development has slowed in its maturity, it remains vital through an active and transparent ecosystem—just like any other popular open source project. In Inform’s case, this includes the aforementioned interpreters, [a collection of language extensions][27] (usually written in a mix of Inform 6 and 7), and of course, all the work created with it and shared with the world, sometimes with source included (I’ll return to that topic later in this article).

IF creation tools invented in the 21st century tend to explore player interactions outside of the traditional parser, generating hypertext-driven work that any modern web browser can load. Chief among these is [Twine][28], originally developed by Chris Klimas in 2009 and under active development by many contributors today as [a GNU-licensed open source project][29]. (In fact, [Twine][30] can trace its OSS lineage back to [TiddlyWiki][31], the project from which Klimas initially derived it.)

Twine represents a sort of maximally [open and accessible approach][30] to IF development: Beyond its own FOSS nature, it renders its output as self-contained websites, relying not on machine code requiring further specialized interpretation but the open and well-exercised standards of HTML, CSS, and JavaScript. As a creative tool, Twine can match its own exposed complexity to the creator’s skill level. Users with little or no programming knowledge can create simple but playable IF work, while those with more coding and design skills—including those developing these skills by making Twine games—can develop more sophisticated projects. Little wonder that Twine’s visibility and popularity in educational contexts has grown quite a bit in recent years.

Other noteworthy open source IF development projects include the MIT-licensed [Undum][32] by Ian Millington, and [ChoiceScript][33] by Dan Fabulich and the [Choice of Games][34] team—both of which also target the web browser as the gameplay platform. Looking beyond strict development systems like these, web-based IF gives us a rich and ever-churning ecosystem of open source work, such as furkle’s [collection of Twine-extending tools][35] and Liza Daly’s [Windrift][36], a JavaScript framework purpose-built for her own IF games.

### Programs, games, and game-programs

Twine benefits from [a standing IFTF program dedicated to its support][37], allowing the public to help fund its maintenance and development. IFTF also directly supports two long-time public services, IFComp and the IF Archive, both of which depend upon and contribute back into open software and technologies.

![Harmonia opening screen shot][39]

The opening of Liza Daly's "Harmonia," created with the Windrift open source IF-creation framework.

The Perl- and JavaScript-based application that runs the IFComp’s website has been [a shared-source project][40] since 2014, and it reflects [the stew of FOSS licenses used by its IF-specific sub-components][41], including the various code libraries that allow parser-driven competition entries to run in a web browser. [The IF Archive][42]—online since 1992 and [an IFTF project since 2017][43]—is a set of mirrored repositories based entirely on ancient and stable internet standards, with [a little open source Python script][44] to handle indexing.

### At last, the fun part: Let's talk about open source text games

The bulk of the archive [comprises games][45], of course—years and years of games, reflecting decades of evolving game-design trends and IF tool development.

Lots of IF work shares its source code, and the community’s quick-start solution for finding it is simple: [Search the IFDB for the tag "source available"][46]. (The IFDB is yet another long-running IF community service, run privately by TADS creator Mike Roberts.) Users who are comfortable with a more bare-bones interface may also wish to browse [the `/games/source` directory][47] of the IF Archive, which groups content by development platform and written language (there's also a lot of work either too miscellaneous or too ancient to categorize floating at the top).

A little bit of random sampling of these code-sharing games reveals an interesting dilemma: Unlike the wider world of open source software, the IF community lacks a generally agreed-upon way of licensing all the code that it generates. Unlike a software tool—including all the tools we use to build IF—an interactive fiction game is a work of art in the most literal sense, meaning that an open source license intended for software would fit it no better than it would any other work of prose or poetry. But then again, an IF game is also a piece of software, and it exhibits source-code patterns and techniques that its creator may legitimately wish to share with the world. What is an open source-aware IF creator to do?

Some games address this by passing their code into the public domain, either through explicit license or—as in the case of [the original 42-year-old Adventure by Crowther and Woods][48]—through community fiat. Some try to split the difference, rolling their own license that allows for free re-use of a game’s exposed business logic but prohibits the creation of work derived specifically from its prose. This is the tack I took when I opened up the source of my own game, [The Warbler’s Nest][49]. Lord knows how well that’d stand up in court, but I didn’t have any better ideas at the time.

Naturally, you can find work that simply puts everything under a single common license and never mind the naysayers. A prominent example is [Emily Short’s epic Counterfeit Monkey][50], released in its entirety under a Creative Commons 4.0 license. [CC frowns at its application to code][51], but you could argue that [the strangely prose-like nature of Inform 7 source][52] makes it at least a little more compatible with a CC license than a more traditional software project would be.

### What now, adventurer?

If you are eager to start exploring the world of interactive fiction, here are a few links to check out:


+ As mentioned above, IFDB and the IF Archive both present browsable interfaces to more than 40 years worth of collected interactive fiction work. Much of this is playable in a web browser, but some require additional interpreter programs. IFDB can help you find and install these.

  IFComp’s annual results pages provide another view into the best of this free and archive-available work.

+ The Interactive Fiction Technology Foundation is a charitable non-profit organization that helps support Twine, IFComp, and the IF Archive, as well as improve the accessibility of IF, explore IF’s use in education, and more. Join its mailing list to receive IFTF’s monthly newsletter, peruse its blog, and browse some thematic merchandise.

+ John Paul Wohlscheid wrote this article about open-source IF tools earlier this year. It covers some platforms not mentioned here, so if you’re still hungry for more, have a look.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/interactive-fiction-tools

作者：[Jason Mclntosh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jmac
[1]:http://iftechfoundation.org/
[2]:https://en.wikipedia.org/wiki/Zork
[3]:https://en.wikipedia.org/wiki/The_Hitchhiker%27s_Guide_to_the_Galaxy_(video_game)
[4]:https://en.wikipedia.org/wiki/Infocom
[5]:http://www.springthing.net/
[6]:http://ifcomp.org/
[7]:https://ifcomp.org/comp/2017
[8]:http://www.fiction-interactive.fr/
[9]:http://www.oldgamesitalia.net/content/marmellata-davventura-2018
[10]:/file/403396
[11]:https://opensource.com/sites/default/files/uploads/monkey.png (counterfeit monkey game screenshot)
[12]:http://tads.org/
[13]:https://www.alanif.se/
[14]:http://textadventures.co.uk/quest/
[15]:http://inform7.com/
[16]:https://github.com/DavidKinder/Inform6
[17]:http://inform7.com/learn/man/RB_4_1.html#e307
[18]:/file/403386
[19]:https://opensource.com/sites/default/files/uploads/inform.png (inform 7 IDE screenshot)
[20]:https://www.youtube.com/watch?v=bu55q_3YtOY
[21]:http://ifwiki.org/index.php/Glulx
[22]:http://ifwiki.org/index.php/Z-machine
[23]:https://github.com/erkyrath/lectrote
[24]:https://github.com/garglk/garglk/
[25]:http://eblong.com/zarf/glulx/quixe/
[26]:https://github.com/curiousdannii/parchment
[27]:https://github.com/i7/extensions
[28]:http://twinery.org/
[29]:https://github.com/klembot/twinejs
[30]:/article/18/7/twine-vs-renpy-interactive-fiction
[31]:https://tiddlywiki.com/
[32]:https://github.com/idmillington/undum
[33]:https://github.com/dfabulich/choicescript
[34]:https://www.choiceofgames.com/
[35]:https://github.com/furkle
[36]:https://github.com/lizadaly/windrift
[37]:http://iftechfoundation.org/committees/twine/
[38]:/file/403391
[39]:https://opensource.com/sites/default/files/uploads/harmonia.png (Harmonia opening screen shot)
[40]:https://github.com/iftechfoundation/ifcomp
[41]:https://github.com/iftechfoundation/ifcomp/blob/master/LICENSE.md
[42]:https://www.ifarchive.org/
[43]:http://blog.iftechfoundation.org/2017-06-30-iftf-is-adopting-the-if-archive.html
[44]:https://github.com/iftechfoundation/ifarchive-ifmap-py
[45]:https://www.ifarchive.org/indexes/if-archiveXgames
[46]:http://ifdb.tads.org/search?sortby=ratu&searchfor=%22source+available%22
[47]:https://www.ifarchive.org/indexes/if-archiveXgamesXsource.html
[48]:http://ifdb.tads.org/viewgame?id=fft6pu91j85y4acv
[49]:https://github.com/jmacdotorg/warblers-nest/
[50]:https://github.com/i7/counterfeit-monkey
[51]:https://creativecommons.org/faq/#can-i-apply-a-creative-commons-license-to-software
[52]:https://github.com/i7/counterfeit-monkey/blob/master/Counterfeit%20Monkey.materials/Extensions/Counterfeit%20Monkey/Liquids.i7x
