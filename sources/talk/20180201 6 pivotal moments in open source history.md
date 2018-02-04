6 pivotal moments in open source history
============================================================

### Here's how open source developed from a printer jam solution at MIT to a major development model in the tech industry today.

![6 pivotal moments in open source history](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/welcome-open-sign-door-osdc-lead.png?itok=i9jCnaiu "6 pivotal moments in open source history")
Image credits : [Alan Levine][4]. [CC0 1.0][5]

Open source has taken a prominent role in the IT industry today. It is everywhere from the smallest embedded systems to the biggest supercomputer, from the phone in your pocket to the software running the websites and infrastructure of the companies we engage with every day. Let's explore how we got here and discuss key moments from the past 40 years that have paved a path to the current day.

### 1\. RMS and the printer

In the late 1970s, [Richard M. Stallman (RMS)][6] was a staff programmer at MIT. His department, like those at many universities at the time, shared a PDP-10 computer and a single printer. One problem they encountered was that paper would regularly jam in the printer, causing a string of print jobs to pile up in a queue until someone fixed the jam. To get around this problem, the MIT staff came up with a nice social hack: They wrote code for the printer driver so that when it jammed, a message would be sent to everyone who was currently waiting for a print job: "The printer is jammed, please fix it." This way, it was never stuck for long.

In 1980, the lab accepted a donation of a brand-new laser printer. When Stallman asked for the source code for the printer driver, however, so he could reimplement the social hack to have the system notify users on a paper jam, he was told that this was proprietary information. He heard of a researcher in a different university who had the source code for a research project, and when the opportunity arose, he asked this colleague to share it—and was shocked when they refused. They had signed an NDA, which Stallman took as a betrayal of the hacker culture.

The late '70s and early '80s represented an era where software, which had traditionally been given away with the hardware in source code form, was seen to be valuable. Increasingly, MIT researchers were starting software companies, and selling licenses to the software was key to their business models. NDAs and proprietary software licenses became the norms, and the best programmers were hired from universities like MIT to work on private development projects where they could no longer share or collaborate.

As a reaction to this, Stallman resolved that he would create a complete operating system that would not deprive users of the freedom to understand how it worked, and would allow them to make changes if they wished. It was the birth of the free software movement.

### 2\. Creation of GNU and the advent of free software

By late 1983, Stallman was ready to announce his project and recruit supporters and helpers. In September 1983, [he announced the creation of the GNU project][7] (GNU stands for GNU's Not Unix—a recursive acronym). The goal of the project was to clone the Unix operating system to create a system that would give complete freedom to users.

In January 1984, he started working full-time on the project, first creating a compiler system (GCC) and various operating system utilities. Early in 1985, he published "[The GNU Manifesto][8]," which was a call to arms for programmers to join the effort, and launched the Free Software Foundation in order to accept donations to support the work. This document is the founding charter of the free software movement.

### 3\. The writing of the GPL

Until 1989, software written and released by the [Free Software Foundation][9] and RMS did not have a single license. Emacs was released under the Emacs license, GCC was released under the GCC license, and so on; however, after a company called Unipress forced Stallman to stop distributing copies of an Emacs implementation they had acquired from James Gosling (of Java fame), he felt that a license to secure user freedoms was important.

The first version of the GNU General Public License was released in 1989, and it encapsulated the values of copyleft (a play on words—what is the opposite of copyright?): You may use, copy, distribute, and modify the software covered by the license, but if you make changes, you must share the modified source code alongside the modified binaries. This simple requirement to share modified software, in combination with the advent of the internet in the 1990s, is what enabled the decentralized, collaborative development model of the free software movement to flourish.

### 4\. "The Cathedral and the Bazaar"

By the mid-1990s, Linux was starting to take off, and free software had become more mainstream—or perhaps "less fringe" would be more accurate. The Linux kernel was being developed in a way that was completely different to anything people had been seen before, and was very successful doing it. Out of the chaos of the kernel community came order, and a fast-moving project.

In 1997, Eric S. Raymond published the seminal essay, "[The Cathedral and the Bazaar][10]," comparing and contrasting the development methodologies and social structure of GCC and the Linux kernel and talking about his own experiences with a "bazaar" development model with the Fetchmail project. Many of the principles that Raymond describes in this essay will later become central to agile development and the DevOps movement—"release early, release often," refactoring of code, and treating users as co-developers are all fundamental to modern software development.

This essay has been credited with bringing free software to a broader audience, and with convincing executives at software companies at the time that releasing their software under a free software license was the right thing to do. Raymond went on to be instrumental in the coining of the term "open source" and the creation of the Open Source Institute.

"The Cathedral and the Bazaar" was credited as a key document in the 1998 release of the source code for the Netscape web browser Mozilla. At the time, this was the first major release of an existing, widely used piece of desktop software as free software, which brought it further into the public eye.

### 5\. Open source

As far back as 1985, the ambiguous nature of the word "free", used to describe software freedom, was identified as problematic by RMS himself. In the GNU Manifesto, he identified "give away" and "for free" as terms that confused zero price and user freedom. "Free as in freedom," "Speech not beer," and similar mantras were common when free software hit a mainstream audience in the late 1990s, but a number of prominent community figures argued that a term was needed that made the concept more accessible to the general public.

After Netscape released the source code for Mozilla in 1998 (see #4), a group of people, including Eric Raymond, Bruce Perens, Michael Tiemann, Jon "Maddog" Hall, and many of the leading lights of the free software world, gathered in Palo Alto to discuss an alternative term. The term "open source" was [coined by Christine Peterson][11] to describe free software, and the Open Source Institute was later founded by Bruce Perens and Eric Raymond. The fundamental difference with proprietary software, they argued, was the availability of the source code, and so this was what should be put forward first in the branding.

Later that year, at a summit organized by Tim O'Reilly, an extended group of some of the most influential people in the free software world at the time gathered to debate various new brands for free software. In the end, "open source" edged out "sourceware," and open source began to be adopted by many projects in the community.

There was some disagreement, however. Richard Stallman and the Free Software Foundation continued to champion the term "free software," because to them, the fundamental difference with proprietary software was user freedom, and the availability of source code was just a means to that end. Stallman argued that removing the focus on freedom would lead to a future where source code would be available, but the user of the software would not be able to avail of the freedom to modify the software. With the advent of web-deployed software-as-a-service and open source firmware embedded in devices, the battle continues to be waged today.

### 6\. Corporate investment in open source—VA Linux, Red Hat, IBM

In the late 1990s, a series of high-profile events led to a huge increase in the professionalization of free and open source software. Among these, the highest-profile events were the IPOs of VA Linux and Red Hat in 1999\. Both companies had massive gains in share price on their opening days as publicly traded companies, proving that open source was now going commercial and mainstream.

Also in 1999, IBM announced that they were supporting Linux by investing $1 billion in its development, making is less risky to traditional enterprise users. The following year, Sun Microsystems released the source code to its cross-platform office suite, StarOffice, and created the [OpenOffice.org][12] project.

The combined effect of massive Silicon Valley funding of open source projects, the attention of Wall Street for young companies built around open source software, and the market credibility that tech giants like IBM and Sun Microsystems brought had combined to create the massive adoption of open source, and the embrace of the open development model that helped it thrive have led to the dominance of Linux and open source in the tech industry today.

 _Which pivotal moments would you add to the list? Let us know in the comments._ 

### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/picture-11423-8ecef7f357341aaa7aee8b43e9b530c9.png?itok=n1snBFq3)][13] Dave Neary - Dave Neary is a member of the Open Source and Standards team at Red Hat, helping make Open Source projects important to Red Hat be successful. Dave has been around the free and open source software world, wearing many different hats, since sending his first patch to the GIMP in 1999.[More about me][2]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/pivotal-moments-history-open-source

作者：[Dave Neary  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dneary
[1]:https://opensource.com/article/18/2/pivotal-moments-history-open-source?rate=gsG-JrjfROWACP7i9KUoqmH14JDff8-31C2IlNPPyu8
[2]:https://opensource.com/users/dneary
[3]:https://opensource.com/user/16681/feed
[4]:https://www.flickr.com/photos/cogdog/6476689463/in/photolist-aSjJ8H-qHAvo4-54QttY-ofm5ZJ-9NnUjX-tFxS7Y-bPPjtH-hPYow-bCndCk-6NpFvF-5yQ1xv-7EWMXZ-48RAjB-5EzYo3-qAFAdk-9gGty4-a2BBgY-bJsTcF-pWXATc-6EBTmq-SkBnSJ-57QJco-ddn815-cqt5qG-ddmYSc-pkYxRz-awf3n2-Rvnoxa-iEMfeG-bVfq5-jXy74D-meCC1v-qx22rx-fMScsJ-ci1435-ie8P5-oUSXhp-xJSm9-bHgApk-mX7ggz-bpsxd7-8ukud7-aEDmBj-qWkytq-ofwhdM-b7zSeD-ddn5G7-ddn5gb-qCxnB2-S74vsk
[5]:https://creativecommons.org/publicdomain/zero/1.0/
[6]:https://en.wikipedia.org/wiki/Richard_Stallman
[7]:https://groups.google.com/forum/#!original/net.unix-wizards/8twfRPM79u0/1xlglzrWrU0J
[8]:https://www.gnu.org/gnu/manifesto.en.html
[9]:https://www.fsf.org/
[10]:https://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar
[11]:https://opensource.com/article/18/2/coining-term-open-source-software
[12]:http://www.openoffice.org/
[13]:https://opensource.com/users/dneary
[14]:https://opensource.com/users/dneary
[15]:https://opensource.com/users/dneary
[16]:https://opensource.com/article/18/2/pivotal-moments-history-open-source#comments
[17]:https://opensource.com/tags/licensing