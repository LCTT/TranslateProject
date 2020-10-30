[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 open source tools I can't live without)
[#]: via: (https://opensource.com/article/20/10/open-source-tools)
[#]: author: (Victoria Martinez de la Cruz https://opensource.com/users/vkmc)

5 open source tools I can't live without
======
Increase your productivity inside and outside the terminal by keeping
these tools in your own bag of tricks.
![woman on laptop sitting at the window][1]

Some time ago, I engaged with a Twitter thread that went viral among techies. The challenge? Pick only five tools that you cannot live without. I started to think about this in relation to my everyday life, and picking just five tools was not easy. I use many tools that I consider essential, such as my [IRC][2] client to connect with my colleagues and friends (yes, I still use IRC), a good text editor to hack on things, a calendar app to keep organized, and a videoconferencing platform when more direct interaction is needed.

So let me put a twist on this challenge: Pick just five open source tools that boost your productivity. Here's my list; please share yours in the comments.

### tmate

![tmate screenshot][3]

(Victoria Marinez de la Cruz, [CC BY-SA 4.0][4])

Oh, I love this tool. tmate is a fork of the well-known [tmux][5] terminal multiplexer that allows you to start a tmux session and share it over SSH. You can use it for [pair programming][6] (which is my primary use case) or for remote control.

If you collaborate often with your team members, and you want an easy, distro-agnostic, open source way to program with them (and sharing terminal access is enough for you), this is definitely a must-add to your list.

Get more info on [tmate's website][7], or check out the code on [GitHub][8].

### ix

ix is a command-line pastebin. You don't need to install anything; you can create new pastes just by `curl`ing to the [ix.io][9] site. For example, `echo Hello world. | curl -F 'f:1=<-' ix.io` will give you a link to ix.io where the message "Hello world" is pasted. This is very convenient when you want to share logs for debugging purposes or to save config files in servers where you don't have a desktop environment.

One downside is that the source code is not yet published, even though it is intended to be free and open source. If you are the author and are reading this post, please post the code so that we can contribute to the polishing process.

### asciinema

Yes, this is another terminal tool. asciinema allows you to record your terminal. There are many ways to use it, but I generally use it to make demos for presentations. It's very easy to use, and there are packages available for many Linux distributions and other platforms.

To see how it works, check out this [cool demo][10]. Isn't it great?

Get more information on [asciinema's website][11] and access its source code on [GitHub][12].

### GNOME Pomodoro

![pomodoro timer gnome][13]

(Victoria Martinez de la Cruz, [CC BY-SA 4.0][4])

OK, that's enough with the terminal tools. Now I want to share this simple gem for getting and staying organized. Have you heard about the [Pomodoro Technique][14]? Pomodoro is basically a time-management tool. It uses a tomato-shaped timer that helps you split your time into work chunks and breaks (by default, 25 minutes of work followed by five-minute breaks). And, after every four pomodoros, you take a longer break (15 minutes by default). The idea is that you stay focused during the work time, and you stretch and relax on the breaks.

This sounds very, very simple, and you might be hesitant to allow a tomato-shaped clock to control your life, but it definitely helped me get better organized and avoid exhaustion when trying to focus on many things at the same time.

Whatever your role, I highly recommend this practice. And among the many different tools that implement it, I recommend the GNOME Pomodoro app. It's available for major GNU/Linux distros, so it requires that you use the GNOME desktop environment (this might be its downside).

Check out more information on [GNOME Pomodoro's website][15], and access its [GitHub][16] repo to get the source code and learn how you can contribute.

### Jitsi

Last but not least is Jitsi. When you're working on a remote, globally distributed team, you need a way to connect with people. Instant messaging is good, but sometimes it's better to have a quick meeting to discuss things face to face (well, seeing each other faces). There are a lot of [videoconferencing tools][17] available, but I like Jitsi a lot. Not only because it's free and open source, but also because it provides a clean, functional interface. You can set up your own Jitsi server (for business purposes), but you can also try out a public Jitsi instance by going to the [Jitsi Meet][18] website.

A good practice for setting up this kind of meeting: use it only when you have a clear agenda in mind. And always ask yourself, can this meeting be an email instead? Follow these guidelines and use Jitsi with caution, and your workday will be extremely productive!

Learn more on [Jitsi's website][19] and start contributing by accessing its [GitHub][20] repository.

* * *

I hope my list helps you reach the next level in productivity. What are your five, can't-do-without-them, open source productivity tools? Let me know in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/open-source-tools

作者：[Victoria Martinez de la Cruz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vkmc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[3]: https://opensource.com/sites/default/files/pictures/tmate-opensource.jpg (tmate screenshot)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/20/7/tmux-cheat-sheet
[6]: https://en.wikipedia.org/wiki/Pair_programming
[7]: https://tmate.io/
[8]: https://github.com/tmate-io/tmate
[9]: http://ix.io/
[10]: https://asciinema.org/a/239367
[11]: https://asciinema.org/
[12]: https://github.com/asciinema/asciinema
[13]: https://opensource.com/sites/default/files/pictures/pomodoro_timer_gnome.jpg (pomodoro timer gnome)
[14]: https://en.wikipedia.org/wiki/Pomodoro_Technique
[15]: https://gnomepomodoro.org/
[16]: https://github.com/codito/gnome-pomodoro
[17]: https://opensource.com/article/20/5/open-source-video-conferencing
[18]: https://meet.jit.si/
[19]: https://jitsi.org/
[20]: https://github.com/jitsi
