[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Let your Linux terminal speak its mind)
[#]: via: (https://opensource.com/article/18/12/linux-toy-espeak)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Let your Linux terminal speak its mind
======
eSpeak is an open source text-to-speech synthesizer that can be invoked from the Linux command line.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cava.png?itok=4EWYL8uZ)

Greetings from another day in our 24-day-long Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. We’re figuring that out as we go, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

We hope that even if you've seen some of these before, there will be something new for everybody in our series.

Some of you may be too young to remember, but before there was Alexa, Siri, or the Google Assistant, computers still had voices.

Many of us will never forget HAL 9000 from [2001: A Space Odessey][1] helpfully conversing with the crew (sorry, Dave). But between 1960s science fiction and today, there was a whole generation of speaking computers. Some of them great, most of them, not so great.

One of my favorites is the open source project [eSpeak][2]. It's available in many forms, including a library version you can use to include speech technology in your own project, but it also coms as a command-line program that you can install and use easily. In my distribution, this was as simple as:

```
$ sudo dnf install espeak
```

Invoking eSpeak then can be invoked either interactively, or by piping text to it using the output of another program or a simple echo command. There are a number of [voice files][3] available for eSpeak, and if you're especially bored over the holidays, you could even create your own.

A fork of eSpeak called eSpeak NG ("Next Generation") was created in 2015 from some developers who wanted to continue development of the otherwise lightly-updated eSpeak. eSpeak is made available as open source under a GPL version 3 license, and you can find out more about the project and download the source code [on SourceForge][2].

I'll also throw in a bonus toy today, [cava][4]. Because I've been eager to give each of these articles a unique screenshot as the lead image, and today's toy outputs sound rather than something visual, I needed to find something to fill the space. Short for "console-based audio visualizer for ALSA" (although it supports more than just ALSA now), cava is a nice MIT-licensed terminal audio visualization tool that's fun to watch. Below, is a visualization of eSpeak's output of the following:

```
$ echo "Rudolph, the red-nosed reindeer, had a very shiny nose." | espeak
```

![](https://opensource.com/sites/default/files/uploads/linux-toy-cava.gif)

Do you have a favorite command-line toy that you we should have included? Our calendar is basically set for the remainder of the series, but we'd still love to feature some cool command-line toys in the new year. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Solve a puzzle at the Linux command line with nudoku][5], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-espeak

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/2001:_A_Space_Odyssey_(film)
[2]: http://espeak.sourceforge.net/
[3]: http://espeak.sourceforge.net/voices.html
[4]: https://github.com/karlstav/cava
[5]: https://opensource.com/article/18/12/linux-toy-nudoku
