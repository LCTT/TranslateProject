[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Linux terminal is no one-trick pony)
[#]: via: (https://opensource.com/article/18/12/linux-toy-ponysay)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

The Linux terminal is no one-trick pony
======
Bring the magic of My Little Pony to your Linux command line.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-ponysay.png?itok=ehl6pTr_)

Welcome to another day of the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. We’re figuring that out as we go, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

Some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

Reader [Lori][1] made the suggestion of today's toy in a comment on my previous article on [cowsay][2]:

"Hmmm, I've been playing with something called ponysay which seems to be a full-color variant on your cowsay."

Intrigued, I had to check it out, and I was not disappointed with what I found.

In a nutshell, **[ponysay][3]** is exactly that: a rewrite of **cowsay** that includes many full-color characters from [My Little Pony][4], that you can use to output phrases at the Linux command line. It's actually a really well-done project, that features over 400 characters and character combinations, and is incredibly well documented in a [78-page PDF][5] covering full usage.

To install **ponysay** , you'll want to check out the project [README][6] to select the installation method that works best for your distribution and situation. Since ponysay didn't appear to be packaged for my distribution, Fedora, I opted to try out the Docker container image, but do what works best for you; installation from source may also work for you.

I was curious to try out [**podman**][7] as a drop-in replacement for **docker** for a casual container users, and for me at least, it just worked!

```
$ podman run -ti --rm mpepping/ponysay 'Ponytastic'
```

The outputs are amazing, and I challenge you to try it out and let me know your favorite. Here was one of mine:

![](https://opensource.com/sites/default/files/uploads/linux-toy-ponysay-output.png)

It's developers chose to write the code in [Pony][8]! (Update: Sadly, I was wrong about this. It's written in Python, though GitHub believes it to be Pony because of the file extensions.) Ponysay is licensed under the GPL version 3, and you can pick up its source code [on GitHub][3].

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Relax by the fire at your Linux terminal][9], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-ponysay

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/users/n8chz
[2]: https://opensource.com/article/18/12/linux-toy-cowsay
[3]: https://github.com/erkin/ponysay
[4]: https://en.wikipedia.org/wiki/My_Little_Pony
[5]: https://github.com/erkin/ponysay/blob/master/ponysay.pdf?raw=true
[6]: https://github.com/erkin/ponysay/blob/master/README.md
[7]: https://opensource.com/article/18/10/podman-more-secure-way-run-containers
[8]: https://opensource.com/article/18/5/pony
[9]: https://opensource.com/article/18/12/linux-toy-aafire
