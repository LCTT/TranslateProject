[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customizing my Linux terminal with tmux and Git)
[#]: via: (https://opensource.com/article/20/7/tmux-git)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Customizing my Linux terminal with tmux and Git
======
Set up your console so you always know where you are and what to do
next.
![woman on laptop sitting at the window][1]

I use GNOME Terminal, mostly because it is my distribution's default. But what happens inside my terminal is far from "default." Before I get into how I customize it, here is what it looks like:

![Moshe Zadka's terminal][2]

(Moshe Zadka, [CC BY-SA 4.0][3])

### Start at the bottom

I use [tmux][4], a terminal multiplexer technology, to manage my terminal experience.

At the bottom of the image above, you can see my green tmux bar. The `[3]` at the bottom indicates this terminal is the third one: each terminal runs its own tmux session. (I created a new one to make the font larger, so it's easier to see in this screenshot; this is the only difference between this terminal and my real ones.)

The prompt also looks funny, right? With so much information jammed into the prompt, I like to stick in a newline so that if I want to do impromptu shell programming or write a five-step pipeline, I can do it without having things spill over. The trade-off is that simple sequences of commands—touch this, copy that, move this—scroll off my screen faster.

The last thing on the line with the content is [Aleph null][5], the smallest [infinite cardinality][6]. I like it when it is obvious where a content line ends, and when I realized that both Aleph and subscript 0 are Unicode characters, I could not resist the temptation to make Aleph null part of my prompt. (Math nerds, unite!)

Before that is my username; this is moderately useful since I use the same [dotfiles][7] (stored in Git) on multiple machines with different usernames.

Before my username is the last component of the directory I am in. The full path is often too long and useless, but the current directory is invaluable for someone, like me, who constantly forgets what he's working on. Before that is the name of the machine. All my machines are named after TV shows that I like. My older laptop is `mcgyver`.

The first bit in the prompt is the bit I like the most: one letter that lets me know the Git status of the directory. It is `G` if the directory is "(not in) Git," `K` if the directory is "OK" and nothing needs to be done, `!` if there are files unknown to Git that must be added or ignored, `C` if I need to commit, `U` if there is no upstream, and `P` if an upstream exists, but I have not pushed. This scheme is not based on the current status but describes the _next action_ I need to do. (To review Git terminology, give [this article][8] a read.)

This terminal functionality is accomplished with an interesting Python utility. It runs `python -m howsit` (after I installed [howsit][9] in a dedicated virtual environment).

You can see the rendering in the image above, but for completeness, here is my PS1:


```
[$(~/.virtualenvs/howsit/bin/python -m howsit)]\h:\W \u ℵ₀  
$
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/tmux-git

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/sites/default/files/uploads/terminal-tmux-moshezadka.png (Moshe Zadka's terminal)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/20/1/tmux-console
[5]: https://simple.wikipedia.org/wiki/Aleph_null#:~:text=Aleph%20null%20(also%20Aleph%20naught,series%20of%20infinite%20cardinal%20numbers.
[6]: https://gizmodo.com/a-brief-introduction-to-infinity-5809689
[7]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[8]: https://opensource.com/article/19/2/git-terminology
[9]: https://pypi.org/project/howsit/
