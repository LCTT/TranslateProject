[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Snake your way across your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-snake)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Snake your way across your Linux terminal
======
Python isn't the only snake you'll find at the Linux command line with this classic 1970s game remake.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-snake.png?itok=oNhqUTDu)

Welcome back to the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. It's hard to say exactly, but my definition is anything that helps you have fun at the terminal.

We've been on a roll with games over the weekend, and it was fun, so let's look at one more game today, Snake!

Snake is an oldie but goodie; versions of it have been around seemingly forever. The first version I remember playing was one called [Nibbles][1] that came packaged with [QBasic][2] in the 1990s, and was probably pretty important to my understanding of what a programming language even was. Here I had the source code to a game that I could modify and just see what happens, and maybe learn something about what all of those funny little words that made up a programming language were all about.

Today's [Snake][3] is written in Go, and while it's simple, it's just as much fun as the original. Like most simple old games, there are a ton of versions to choose from. In Snake's case, there's even a version in the classic [bsdgames][4] package that's almost certainly packaged for your distribution.

But what I like about this version of Snake is that it's packaged for Docker so I can easily run it in one line from my terminal without worrying about anything disto-specific. That, and it makes use of 15 randomized food emojis for the snake to eat. I'm a sucker for food emojis. Anyway, give it a try using:

```
$ docker run -ti dyego/snake-game
```

This Snake is licensed as open source under an MIT license, and you can check out the source code [on GitHub][3].
![](https://opensource.com/sites/default/files/uploads/linux-toy-snake-animated.gif)
Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Powers of two, powers of Linux: 2048 at the command line][5], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-snake

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Nibbles_(video_game)
[2]: https://en.wikipedia.org/wiki/QBasic
[3]: https://github.com/DyegoCosta/snake-game
[4]: https://github.com/vattam/BSDGames
[5]: https://opensource.com/article/18/12/linux-toy-2048
