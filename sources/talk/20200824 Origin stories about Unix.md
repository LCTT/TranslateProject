[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Origin stories about Unix)
[#]: via: (https://opensource.com/article/20/8/unix-history)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Origin stories about Unix
======
Brian Kernighan, one of the original Unix gurus, shares his insights
into the origins of Unix and its associated technology.
![Old UNIX computer][1]

Brian W. Kernighan opens his book _Unix: A History and a Memoir_ with the line, "To understand how Unix happened, we have to understand Bell Labs, especially how it worked and the creative environment that it provided." And so begins a wonderful trip back in time, following the creation and development of early Unix with someone who was there.

You may recognize Brian Kernighan's name. He is the "K" in [AWK][2], the "K" in "K&amp;R C" (he co-wrote the original "Kernighan and Ritchie" book about the C programming language), and he has authored and co-authored many books about Unix and technology. On my own bookshelf, I can find several of Kernighan's books, including _The Unix Programming Environment_ (with Rob Pike), _The AWK Programming Language_ (with Alfred Aho and Peter J. Weinberger), and _The C Programming Language_ (with Dennis M. Ritchie). And of course, his latest entry, _Unix: A History and a Memoir_.

I interviewed Brian about this most recent book. I think we spent equal amounts of time discussing the book as we did reminiscing about Unix and groff. Below are a few highlights of our conversation:

### JH: What prompted you to write this book?

BWK: I thought it would be nice to have a history of what happened at Bell Labs. Jon Gertner wrote a book, _The Idea Factory: Bell Labs and the Great Age of American Innovation_, that described the physical science work at Bell Labs. This was an authoritative work, very technical, and not something that I could do, but it was kind of the inspiration for this book.

There's also a book by James Gleick, _The Information: A History, a Theory, a Flood_, that isn't specific to Bell Labs, but it's very interesting. That was kind of an inspiration for this, too.

I originally wanted to write an academic history of the Labs, but I realized it was better to write something based on my own memories and the memories of those who were there at the time. So that's where the book came from.

### JH: What are a few stories from the book you'd like people to read about?

BWK: I think there are really two stories I'd like people to know about, and both of them are origin myths. I heard them afresh when Ken Thompson and I were at the [Vintage Computer Festival about a year ago][3].

One is the origin of Unix itself—how Bonnie, Ken's wife, went off on vacation for three weeks, just at the time that Ken thought he was about three weeks away from having a complete operating system. This was, of course, due to Ken's very competent programming abilities, and it was incredible he was able to pull it off. It was written entirely in Assembly and was really amazing work.

[Note: This story starts on page 33 in the book. I'll briefly relate it here. Thompson was working on "a disk scheduling algorithm that would try to maximize throughput on any disk," but particularly the PDP-7's very tall single-platter disk drive. In testing the algorithm, Thompson realized, "I was three weeks from an operating system." He broke down his work into three units—an editor, an assembler, and a kernel—and wrote one per week. And about that time, Bonnie took their son to visit Ken's parents in California, so Thompson had those three weeks to work undisturbed.]

And then there's the origin story for `grep`. Over the years, I'd gotten the story slightly wrong—I thought Ken had written `grep` entirely on demand. It was classic Ken that he had a great idea, a neat idea, a clean idea, and he was able to write it very quickly. Regular expressions (regex) were already present in the text editor, so really, he just pulled regex from the editor and turned it into a program.

[Note: This story starts on page 70 in the book. Doug McIlroy said, "Wouldn't it be great if we could look for things in files?" Thompson replied, "Let me think about it overnight," and the next morning presented McIlroy with the `grep` program he'd written.]

### JH: What other stories did you not get to tell in the book?

BWK: I immediately think of the "Peter Weinberger's face" story! There were a lot of pranks based on having a picture of Peter's face pop up in random places. Someone attached a picture of Peter with magnets to the metal wall of a stairway. And there was a meeting once where Peter was up in front, not in the audience. And while he was talking, everyone in the audience held up a mask that had Peter's face printed on it. 

[Note: The "Peter Weinberger's face" story starts on page 47 in the book. Spinroot also has an [archive of the prank][4] with examples.]

I talked to a lot of people from the Labs about the book. I would email people, and I would receive long replies with more stories than I could fit into the length or the narrative. Honestly, there's probably a whole other book that someone else could write just based on those stories. It's amazing how many people come forward with stories about Unix and running Unix on systems I haven't even heard of.

## A fantastic read

_Unix: A History and a Memoir_ is well-titled. Throughout the book, Kernighan shares details on the rich history of Unix, including background on Bell Labs, the spark of Unix with CTSS and Multics in 1969, and the first edition in 1971. Kernighan also provides his own reflection on how Unix came to be such a dominant platform, including notes on portability, Unix tools, the Unix Wars, and Unix descendants such as Minix, Linux, BSD, and Plan9. You will also find nuggets of information and great stories that fill in details around some of the everyday features of Unix.

At just over 180 pages, _Unix: A History and a Memoir_ is a fantastic read. If you are a fan of Linux, or any open source Unix, including the BSD versions, you will want to read this book.

_Unix: A History and a Memoir_ is available on [Amazon][5] in paperback and e-book formats. Published by Kindle Direct Publishing, October 2019.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/unix-history

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://opensource.com/resources/what-awk
[3]: https://www.youtube.com/watch?v=EY6q5dv_B-o
[4]: https://spinroot.com/pico/pjw.html
[5]: https://www.amazon.com/dp/1695978552
