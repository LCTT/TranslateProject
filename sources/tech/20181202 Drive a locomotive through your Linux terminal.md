[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Drive a locomotive through your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-sl)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )

Drive a locomotive through your Linux terminal
======
Using the sl command, you can train yourself to get on track with a fun command-line experience.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-sl.png?itok=WPTj0Ga9)

It's December, and every Linux terminal user deserves a reward just for making through the year. So we're bringing you a sort of advent calendar of Linux command-line toys. What's a command-line toy? It might be a game, a pointless little time waster, or just something to bring you joy at the terminal.

**sl** , which is short for steam locomotive.

Today's Linux command-line toy is a suggestion from Opensource.com community moderator [Ben Cotton][1] . Ben suggested, which is short for steam locomotive.

It's also, conveniently and not coincidentally, a common typo for the Linux **ls** command. Want to stop mistyping ls? Try installing **sl**. It's probably packaged for your default repos. For me, in Fedora, that means it was as simple to install as:

```
$ sudo dnf install sl -y
```

Now, just type **sl** to try it out.

![](https://opensource.com/sites/default/files/uploads/linux-toy-sl-animated.gif)

You may notice, as I did, that **Ctrl+C** doesn't derail your train, so you have to wait for the entire train to pass. That'll teach you to mistype **ls**!

Want to check out the source to **sl**? It's over [on GitHub][2].

**sl** is also a great opportunity to share a personal PSA about open source licensing. While its [license][3] was "open source enough" to be packaged for my distribution, it's not technically an [OSI-approved][4] license. After the copyright line, the license reads simply:

```
Everyone is permitted to do anything on this program including copying,
modifying, and improving, unless you try to pretend that you wrote it.
i.e., the above copyright notice has to appear in all copies.
THE AUTHOR DISCLAIMS ANY RESPONSIBILITY WITH REGARD TO THIS SOFTWARE.
```

Unfortunately, when you chose a license that's not OSI-approved, you may accidentally be creating extra work for your users, as they must figure out whether your license will work for their situation. Do their corporate policies allow them to contribute? Can they even legally use the program? Does the license mesh with the license of another program they wish to integrate with it?

Unless you're a lawyer (and perhaps, even if you are), navigating the space of non-standard licenses can be tricky. So if you're still looking for a New Year's Resolution, why not resolve to choose only OSI-approved licenses for any new projects you start in 2019.

No disrespect to the creator, though. **sl** is still a great little command-line toy.

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Box yourself in on the Linux command line][5], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-sl

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/users/bcotton
[2]: https://github.com/mtoyoda/sl
[3]: https://github.com/mtoyoda/sl/blob/master/LICENSE
[4]: https://opensource.org/licenses
[5]: https://opensource.com/article/18/12/linux-toy-boxes
