wcnnbdk1 translating
# Perl and the birth of the dynamic web

>The fascinating story of Perl's role in the dynamic web spans newsgroups and mailing lists, computer science labs, and continents.

 ![Perl and the birth of the dynamic web](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc-lead-web-internet.png?itok=hq81pSDs "Perl and the birth of the dynamic web") 
>Image by : [Internet Archive Book Images][30], modified by Opensource.com. [CC BY-SA 4.0][29].

The web's early history is generally remembered as a few seminal events: the day Tim Berners-Lee [announced][28] the WWW-project on Usenet, the document with which [CERN released the project's code][27] into the public domain, and of course [the first version of the NCSA Mosaic browser][26] in January 1993\. Although these individual moments were certainly crucial, the period is far richer and reveals that technological development is not a set of discrete events, but rather a range of interconnected stories.

One such story is how exactly the web became _dynamic_, which is to say, how we got web servers to do more than serve static HTML documents. This is a story that spans [newsgroups][25] and mailing lists, computer science labs, and continents—its focus is not so much one person as one programming language: Perl.

### CGI scripts and infoware

In the mid- to late-1990s, Perl and the dynamic web were nearly synonymous. As a relatively easy-to-learn interpreted language with powerful text-processing features, Perl made it easy to write scripts to connect a website to a database, handle form data sent by users, and of course create those unmistakeable icons of the '90s web, hit counters and guestbooks.

Such website features came in the form of CGI scripts, named for the Common Gateway Interface, [first implemented][24] by Rob McCool in the NCSA HTTPD server in November 1993\. CGI was designed to allow for drop-in functionality, and within a few years one could easily find archives of pre-cooked scripts written in Perl. An infamous case was [Matt's Scripts Archive][23], a popular source that unintentionally carried security flaws and inspired members of the Perl community to create a professional alternative called [Not Matt's Scripts][22].

At the same time that amateur and professional programmers took up Perl to create dynamic websites and applications, Tim O'Reilly [coined the term "infoware"][21] to describe how the web and Perl were part of a sea of change in the computing industry. With innovations by Yahoo! and Amazon in mind, O'Reilly wrote: "Traditional software embeds small amounts of information in a lot of software; infoware embeds small amounts of software in a lot of information." Perl was the perfect small-but-powerful tool—the Swiss Army Chainsaw—that powered informational media from large web directories to early platforms for user-generated content.

### Forks in the road

Although Perl's relationship to CGI is well-documented, the links between the programming language and the rise of the dynamic web go deeper. In the brief period between the appearance of [the first website][20] (just before Christmas 1990) and McCool's work on CGI in 1993, much of what defined the web in the 1990s and beyond—from forms to bitmaps and tables—was up in the air. Although Berners-Lee was often deferred to in these early years, different people saw different potential uses for the web, and pushed it in various directions. On the one hand, this resulted in famous disputes, such as questions of [how closely HTML should follow SGML][19], or [whether to implement an image tag][18]. On the other hand, change was a slower process without any straightforward cause. The latter best describes how the dynamic web developed.

In one sense, the first gateways can be traced to 1991 and 1992, when Berners-Lee and a handful of other computer scientists and hypertext enthusiasts [wrote servers][17] that connected to specific resources, such as particular CERN applications, general applications such as Oracle databases, and [wide area information servers (WAIS)][16]. (WAIS was the late 1980s precursor to the web developed by, among others, [Brewster Kahle][15], a digital librarian and founder of the [Internet Archive][14].) In this way, a gateway was a custom web server designed to do one thing: connect with another network, database, or application. Any dynamic feature meant running another daemon on a different port (read, for example, Berners-Lee's description of [how to add a search function][13] to a website). Berners-Lee intended the web to be a universal interface to diverse information systems, and encouraged a proliferation of single-purpose servers. He also [noted][12] that Perl was "a powerful (if otherwise incomprehensible) language with which to hack together" one.

However, another sense of "gateway" suggested not a custom machine but a script, a low-threshold add-on that wouldn't require a different server. The first of this kind was arguably Jim Davis's [Gateway to the U Mich Geography server][11], released to the WWW-talk mailing list in November 1992\. Davis's script, written in Perl, was a kind of proto-Web API, pulling in data from another server based on formatted user queries. Highlighting how these two notions of gateway differed, Berners-Lee [responded][10] to Davis requesting that he and the author of the Michigan server "come to some arrangement," as it would make more sense "from the network point of view" to only have one server providing this information. Berners-Lee, as might be expected of the person who invented the web, preferred an orderly information resource. Such drop-in gateways and scripts that pulled data in from other servers meant a potential qualitative shift in what the web could be, extending but also subtly transforming Berners-Lee's original vision.

### Going Wayback to the Perl HTTPD

An important step between Davis's geography gateway and the standardization of such low-threshold web scripting through CGI was the [Perl HTTPD][9], a web server written entirely in Perl by grad student Marc Van Heyningen at Indiana University in Bloomington in early 1993\. Among [the design principles][8] Van Heyningen laid out was easy extensibility—beyond the fact that using Perl meant no compiling was necessary, the server included "a feature to restart the server when new features are added to the code with zero downtime," making it "trivial" to add new functionality.

The Perl HTTPD stood in contrast to the idea that servers should have a single, dedicated purpose. Instead, it hinted at an incremental, permanently beta approach to software products that would eventually be considered common sense in web work. Van Heyningen [later wrote][7] that his reason for building a server from scratch was there was no easy way to create "virtual documents" (i.e., dynamically generated pages) with the CERN server, and joked that the easiest way to do this was to use "the language of the gods." Among the scripts he added early on was a web interface to Sun's man pages as well as a [a Finger Gateway][6] (an early protocol for sharing information about a computer system or user).

Although the Indiana University server used by Van Heyningen was primarily used to connect to existing information resources, Van Heyningen and fellow students also saw the potential for personal publishing. One of its more popular pages from 1993-1994 [published][5] documents, photographs, and news stories around a famous Canadian court case for which national media had been gagged.

The Perl HTTPD wasn't necessarily built to last. Today, Van Heyningen remembers it as a "hacked up prototype." Its original purpose was to demonstrate the web's usefulness to senior staff who had chosen Gopher to be the university's network interface. Van Heyningen's argument-in-code included an appeal to his professors' vanity in the form of [a web-based, searchable index of their publications][4]. In other words, a key innovation in server technology was created to win an argument, and in that sense the code did all that was asked of it.

Despite the servers's temporary nature, the ideas that accompanied the Perl HTTPD would stick around. Van Heyningen began to receive requests for the code and shared it online, with a note that one would need to know some Perl (or someone who did) to port the server to other systems. Soon after, Austin-based programmer Tony Sanders created a portable version called [Plexus][3]. Sanders's web server was a fully fledged product that cemented the kind of easy extensibility that the Perl HTTPD suggested, while adding a number of new features such as image decoding. Plexus in turn [directly inspired][2]Rob McCool to create an "htbin" for scripts on the NCSA HTTPD server, and soon after that the implementation of the Common Gateway Interface.

Alongside this historical legacy, the Perl HTTPD is also preserved in a more tangible form—thanks to the wonderful Internet Archive (the Wayback Machine), you can still [download the tarball][1] today.

### Future histories

For all the tech world's talk of disruption, technological change is in fact a contradictory process. Existing technologies are the basis for thinking about new ones. Archaic forms of programming inspire new ways of doing things today. Something as innovative as the web was very much an extension of older technologies—not least, Perl.

To go beyond simple timelines of seminal events, perhaps web historians could take a cue from Perl. Part of the challenge is material. Much of what must be done involves wrangling structure from the messy data that's available, gluing together such diverse sources as mailing lists, archived websites, and piles of books and magazines. And part of the challenge is conceptual—to see that web history is much more than the release dates of new technologies, that it encompasses personal memory, human emotion, and social processes as much as it does protocols and Initial Public Offerings, and that it is not one history but many. Or as the Perl credo goes, "There's More Than One Way To Do It."

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/11/perl-and-birth-dynamic-web

作者：[Michael Stevenson][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mstevenson
[1]:https://web.archive.org/web/20011126190051/http://www.cs.indiana.edu/perl-server/httpd.pl.tar.Z
[2]:http://1997.webhistory.org/www.lists/www-talk.1993q4/0516.html
[3]:https://web.archive.org/web/19990421192342/http://www.earth.com/server/doc/plexus.html
[4]:https://web.archive.org/web/19990428030253/http://www.cs.indiana.edu:800/cstr/search
[5]:https://web.archive.org/web/19970720205155/http://www.cs.indiana.edu/canada/karla.html
[6]:https://web.archive.org/web/19990429014629/http://www.cs.indiana.edu:800/finger/gateway
[7]:https://web.archive.org/web/19980122184328/http://www.cs.indiana.edu/perl-server/history.html
[8]:https://web.archive.org/web/19970720025822/http://www.cs.indiana.edu/perl-server/intro.html
[9]:https://web.archive.org/web/19970720025822/http://www.cs.indiana.edu/perl-server/code.html
[10]:https://lists.w3.org/Archives/Public/www-talk/1992NovDec/0069.html
[11]:https://lists.w3.org/Archives/Public/www-talk/1992NovDec/0060.html
[12]:http://info.cern.ch/hypertext/WWW/Provider/ShellScript.html
[13]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0109.html
[14]:https://archive.org/index.php
[15]:http://brewster.kahle.org/about/
[16]:https://en.wikipedia.org/wiki/Wide_area_information_server
[17]:http://info.cern.ch/hypertext/WWW/Daemon/Overview.html
[18]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0182.html
[19]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0096.html
[20]:http://info.cern.ch/hypertext/WWW/TheProject.html
[21]:https://web.archive.org/web/20000815230603/http://www.edventure.com/release1/1198.html
[22]:http://nms-cgi.sourceforge.net/
[23]:https://web.archive.org/web/19980709151514/http://scriptarchive.com/
[24]:http://1997.webhistory.org/www.lists/www-talk.1993q4/0518.html
[25]:https://en.wikipedia.org/wiki/Usenet_newsgroup
[26]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0099.html
[27]:https://tenyears-www.web.cern.ch/tenyears-www/
[28]:https://groups.google.com/forum/#!msg/alt.hypertext/eCTkkOoWTAY/bJGhZyooXzkJ
[29]:https://creativecommons.org/licenses/by-sa/4.0/
[30]:https://www.flickr.com/photos/internetarchivebookimages/14591826409/in/photolist-oeqVBX-xezHCD-otJDtG-whb6Qz-tohe9q-tCxH8y-xq4VfN-otJFfh-xEmn3b-tERUdv-oucUgd-wKDyLy-owgebW-xd6Wew-xGEvuT-toqHkP-oegBCj-xtDdzN-tF19ip-xGFbWP-xcQMJq-wxrrkN-tEYczi-tEYvCn-tohQuy-tEzFwN-xHikPT-oetG8V-toiGvh-wKEgAu-xut1qp-toh7PG-xezovR-oegRMa-wKN2eg-oegSRp-sJ29GF-oeqXLV-oeJTBY-ovLF3X-oeh2iJ-xcQBWs-oepQoy-ow4xoo-xknjyD-ovunVZ-togQaj-tEytff-xEkSLS-xtD8G1
