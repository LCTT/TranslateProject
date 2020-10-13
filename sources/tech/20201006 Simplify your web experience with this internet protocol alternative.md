[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Simplify your web experience with this internet protocol alternative)
[#]: via: (https://opensource.com/article/20/10/gemini-internet-protocol)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Simplify your web experience with this internet protocol alternative
======
Discover new corners of a quieter and simpler internet with the Gemini
Protocol.
![Person typing on a 1980's computer][1]

If you've been on the internet for a very long time or you're just very resourceful, you might remember an early text-sharing protocol called [Gopher][2]. Gopher was eventually displaced by the HTTP protocol, which of course is the basis for the modern World Wide Web. For many people, the "internet" and the "World Wide Web" are the same thing, because many people don't consciously do anything online that's _not_ on the www subdomain.

But there have always been a variety of network protocols to share information over an interconnected network: Telnet, FTP, SSH, Torrent, GNUnet, and many more. Recently, there's been an addition to this collection of alternatives, and it's called [Gemini][3].

The Gemini protocol, named after the space mission between the rudimentary experiments of Project Mercury and Project Apollo, is meant to sit peacefully between Gopher and HTTP. It doesn't aim to replace the modern web, by any means, but it does try to create both a simplified web and a modernized Gopher.

This development, young though it may be, is significant for many reasons. People take issue with the modern web, of course, for reasons spanning the technical and the philosophical, but it's also just plain bloated. A million hits from a Google search can feel like overkill when all you really want is one reliable answer to a very specific question.

Many people use Gopher for this very reason: it's small enough to allow for niche interests that are easy to find. However, Gopher is an old protocol that makes assumptions about programming, networking, and browsing that just aren't applicable anymore. Gemini aims to bring the best of the web to a format that approximates Gopher but is easy to program for. A simple Gemini browser can be written in a few hundred lines of code, and there's a very good one written in about 1,600 lines. That's a powerful feature for programmers, students, and minimalists alike.

### How to browse Gemini

Like the early web, Gemini is small enough that there is a list of known servers running Gemini sites. Just as browsing an HTTP site requires a web browser, accessing a Gemini site requires a Gemini browser. There are already several available, listed on the [Gemini website][4].

The simplest one to run is the [AV-98][5] client. It's written in Python and runs in a terminal. To try it out, download it:


```
`$ git clone https://tildegit.org/solderpunk/AV-98.git`
```

Change directory into the downloaded directory and run AV-98:


```
$ cd AV-98.git
$ python3 ./main.py
```

The client is an interactive prompt. It has limited commands, and the main one is simply `go` followed by a Gemini server address. Go to the list of known [Gemini servers][6], select one that seems interesting, and try visiting it:


```
AV-98&gt; go gemini://example.club

Welcome to the example.club Gemini server!

Here are some folders of ASCII art:

[1] Penguins
[2] Wildebeests
[3] Demons
```

Navigation is a matter of following numbered links. For instance, to navigate to the Penguins directory, enter `1` and press Enter:


```
AV-98&gt; 1

[1] Gentoo
[2] Emperor
[3] Little Blue
```

To go back, type `back` and press Enter:


```
`AV-98> back`
```

For more commands, just enter `help`.

### Gemini as your web alternative

The Gemini protocol is simple enough for beginner-level and intermediate programmers to write clients for, and it's an easy and quick way to share content on the internet. While the World Wide Web's ubiquity is advantageous for widespread distribution, there's always room for alternatives. Check out Gemini and discover new corners of a quieter and simpler internet.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/gemini-internet-protocol

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://en.wikipedia.org/wiki/Gopher_%28protocol%29
[3]: https://gemini.circumlunar.space/
[4]: https://gemini.circumlunar.space/clients.html
[5]: https://tildegit.org/solderpunk/AV-98
[6]: https://portal.mozz.us/gemini/gemini.circumlunar.space/servers
