[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Take a break at the Linux command line with Nyan Cat)
[#]: via: (https://opensource.com/article/18/12/linux-toy-nyancat)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )

Take a break at the Linux command line with Nyan Cat
======
Rainbows, Pop-Tarts, and cats in space: What more could you want at your terminal?
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-nyancat.png?itok=eg1aEmBw)

We're now on day six of the Linux command-line toys advent calendar, where we explore some of the fun, entertaining, and in some cases, utterly useless toys available for your Linux terminal. All are available under an open source license.

Will they all be unique? Yes. Will they all be unique to you? I don't know, but, chances are you'll find at least one new toy to play with by the time our advent calendar is done.

Today's selection is a continuation on the [theme][1] we started yesterday: cats and rainbows. Wait, there's more cat-related rainbow fun to be had at the Linux command line? You bet there is.

So let's make a throwback all the way to 2011's [Nyan Cat][2] with a command-line toy call, not surprisingly, **nyancat**. Did you miss the cultural phenomenon that was Nyan Cat? Watch the embed below, I'll wait.

<https://www.youtube.com/embed/QH2-TGUlwu4>

Now, let's recreate that amazing experience in your terminal. **Nyancat** is packaged for many distributions (Arch, Debian, Gentoo, Ubuntu, etc.) but not for mine (Fedora), but compiling from source was simple. In fact, I grabbed the source, built it, and launched it in one line:

```
git clone https://github.com/klange/nyancat.git && cd nyancat && make && cd src && ./nyancat
```

This launched straight into a **nyancat** experience complete with a counter of how long I had been enjoying the **nyancat** magic for.

![](https://opensource.com/sites/default/files/uploads/linux-toy-nyancat-animated.gif)

You can find the source for **nyancat** [on GitHub][3] under an [NCSA open source license][4].

The command-line version of Nyan Cat used to be [accessible by a public Telnet server][5] (or, for even more pun, with [netcat][6]) so that you didn't even have to install it, but sadly was shut down due to bandwidth limitations. Nevertheless, the [gallery][5] from the old Telnet server running Nyan Cat on a variety of old devices is well-worth checking out, and maybe you'd like to do the community a favor by launching your own public mirror and letting the author know so that they may share it with the public yet again?

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Bring some color to your Linux terminal with lolcat][1], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-nyancat

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-lolcat
[2]: https://en.wikipedia.org/wiki/Nyan_Cat
[3]: https://github.com/klange/nyancat
[4]: http://en.wikipedia.org/wiki/University_of_Illinois/NCSA_Open_Source_License
[5]: http://nyancat.dakko.us/
[6]: http://netcat.sourceforge.net/
