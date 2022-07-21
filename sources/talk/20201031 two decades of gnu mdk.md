[#]: subject: "two decades of gnu mdk"
[#]: via: "https://jao.io/blog/2020-10-31-two-decades-of-gnu-mdk.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

two decades of gnu mdk
======

I've just published [GNU MDK 1.3.0][1], its [28th release][2], which finally migrates MDK's graphical user interface to GTK+ 3, to keep up with the, ahem, not-so-modern times and see to it that MDK keeps alive for at least another decade or two.

![][3]

Twenty years ago on this day, the first version of MDK 0.1 was released. Back then, it didn't have an Emacs or graphical interface[1][4], support for internationalization or any integration with Guile, and the debugger was really bare bones (it still is, but not _that_ much). It wasn't yet a GNU package. But all those things, and then more, came in rapid succession, as i used the project to discover the Free Software world, both at a technical and a human level.

As a physicist out of grad school, i wasn't young, but i was just starting in the world of software and everything was fresh and new and exciting. I remember the thrill of receiving emails from total strangers willing to help and offering insightful advice (hi there, Philip King, wherever you are these days), and of thinking that someone else, out there, was finding my little program fun and useful[2][5]. Or of exchanging messages with RMS, that guy i had read about in _Hackers_ and admired so much; and then see in the process MDK entering the GNU umbrella. And of seeing it shortly afterwards on [Knuth's own page on TAOCP][6], up there in the _MIXware_ list.

MDK was my first project developed entirely in Emacs running on Debian (twenty years ago, that felt bolder than it sounds now), two constant companions up to ths day. Seeing it as a [maintained Debian package][7] was another big satisfaction and milestone for memory lane.

I also have vivid recollections of the mind-bending experience of discovering Scheme, because i learnt that Guile was the extension language of choice for GNU, and my baby steps on writing a lexer or an interpreter, and how humbled i felt when i took a proper compilers course a few years later and looked back at my clumsily rediscovered wheels[3][8].

MDK was also my gateway to publishing [a book][9] for the first time, thanks to the nice guys of the GNU Press, with a polished version of its manual. Okay, it's more of a booklet, and out of press by now, but it was an enriching experience nonetheless; for instance i got a chance of seeing an editor in action.

![mdk.jpg][10] | ![mdk-source.png][11]
---|---

After two decades, having grown older and bitter, all those things look small and of little importance, but as a freshman i truly had the best of times. I think that maybe the most important thing i learned was to [collaborate with other people][12], and i've since been always very fond of the kindness of strangers, and how much one can learn from them.

Anyway, here's to the next twenty years. Happy hacking!

### Footnotes:

[1][13]

To be honest, i almost never use MDK's graphical interface, and prefer to comfortably [use it within emacs][14], but a bit of eye candy is not bad every now and then.

[2][15]

Keep in mind that those were ancient times, more so on my side of th world: the cool new thing to learn and use for me was CVS, and there were rumors about something called subversion. And then SourceForge felt like the best thing ever.

[3][16]

Shortly after, SICP would be the eye-opener it's been for many and would make everything make sense (i talked a bit about that process in [one of my very first blog posts][17]). In retrospect, i think the journey that i then started is the main reason i never went on to complete an MMDK for MMIX, which was planned and going to be written in OCaml.

[Tags][18]: [programming][19]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2020-10-31-two-decades-of-gnu-mdk.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/mdk
[2]: https://www.gnu.org/software/mdk/NEWS.txt
[3]: https://jao.io/img/mdk.png
[4]: tmp.vwpDdwNIgk#fn.1
[5]: tmp.vwpDdwNIgk#fn.2
[6]: https://www-cs-faculty.stanford.edu/~knuth/taocp.html
[7]: https://tracker.debian.org/pkg/mdk
[8]: tmp.vwpDdwNIgk#fn.3
[9]: https://dl.acm.org/doi/book/10.5555/1215741
[10]: https://jao.io/img/mdk.jpg
[11]: https://jao.io/img/mdk-source.png
[12]: https://www.gnu.org/software/mdk/manual/html_node/Acknowledgments.html
[13]: tmp.vwpDdwNIgk#fnr.1
[14]: https://www.gnu.org/software/mdk/manual/mdk.html#Emacs-tools
[15]: tmp.vwpDdwNIgk#fnr.2
[16]: tmp.vwpDdwNIgk#fnr.3
[17]: https://jao.io/blog/2006-01-14-the-joy-of-repl.html
[18]: https://jao.io/blog/tags.html
[19]: https://jao.io/blog/tag-programming.html
