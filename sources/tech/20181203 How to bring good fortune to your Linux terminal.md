[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How to bring good fortune to your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-fortune)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )

How to bring good fortune to your Linux terminal
======
Bring quotes and quips to the command line with the fortune utility.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-fortune.png?itok=5PVVZVer)

It's December, and if you haven't found a [tech advent calendar][1] that sparks your fancy yet, well, maybe this one will do the trick. Every day, from now to the 24th, we're bringing you a different Linux command-line toy. What's a command-line toy, you ask? It could be a game or any simple diversion to bring a little happiness to your terminal.

You may have seen some of these before. We hope you'll find something new, too. Either way, we hope you have fun following along.

Today's toy, **fortune** , is an old one. Versions of it date back to the 1980s when it was included with Unix. The version I installed in Fedora was available under a BSD license, and I grabbed it with the following.

```
$ sudo dnf install fortune-mod -y
```

Your distribution may be different. On some, you may need to install the fortunes separately from **fortune** itself (try searching your package manager for  "fortunes*"). You can also check out the source code on [GitHub][2]. Then, just run **fortune** to get, well, a fortune.

```
$ fortune
"Time is an illusion.  Lunchtime doubly so."
-- Ford Prefect, _Hitchhiker's Guide to the Galaxy_
```

So why do you need fortunes at the terminal? For fun, of course. Perhaps you'd like to add them to the message of the day on your system?

Personally, I like using the **fortune** command as a built-in piece of dummy data when I'm using the terminal to parse text, particularly with [regular expressions][3], and want something simple to try it out on.

For example, let's say I was testing our a transformation with the **tr** command to replace letter the letter e with a numeral 3.

```
$ fortune | tr 'eE' '3'
Unix 3xpr3ss:
All pass3ng3r bring a pi3c3 of th3 a3roplan3 and a box of tools with th3m to
th3 airport. Th3y gath3r on th3 tarmac, arguing constantly about what kind
of plan3 th3y want to build and how to put it tog3th3r. 3v3ntually, th3
pass3ng3rs split into groups and build s3v3ral diff3r3nt aircraft, but giv3
th3m all th3 sam3 nam3. Som3 pass3ng3rs actually r3ach th3ir d3stinations.
All pass3ng3rs b3li3v3 th3y got th3r3.
```

So what fortunes come with your distribution? Take a look in your **/usr/share/games/fortune** directory to find them all. Here are a few of my favorites.

```
Never laugh at live dragons.
                -- Bilbo Baggins [J.R.R. Tolkien, "The Hobbit"]

I dunno, I dream in Perl sometimes...
             -- Larry Wall in  <8538@jpl-devvax.JPL.NASA.GOV>

I have an existential map.  It has "You are here" written all over it.
                -- Steven Wright
```

Looking for more on **fortune**? You can, of course, always check out the man page to learn more about the options, or read a little bit more about the history of the command on [Wikipedia][4].

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Drive a locomotive through your Linux terminal][5], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-fortune

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/16/11/7-tech-advent-calendars-holiday-season
[2]: https://github.com/shlomif/fortune-mod
[3]: https://opensource.com/article/18/5/getting-started-regular-expressions
[4]: https://en.wikipedia.org/wiki/Fortune_%28Unix%29
[5]: https://opensource.com/article/18/12/linux-toy-sl
