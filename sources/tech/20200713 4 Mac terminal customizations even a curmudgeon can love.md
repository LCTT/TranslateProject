[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Mac terminal customizations even a curmudgeon can love)
[#]: via: (https://opensource.com/article/20/7/mac-terminal)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

4 Mac terminal customizations even a curmudgeon can love
======
Open source means I can find Linux familiarity on any terminal.
![Coffee and laptop][1]

A decade ago, I started my first job that required me to use Linux as my laptop's operating system. I was offered a range of variants, including Gentoo, if I was so inclined, but since I had used Ubuntu briefly in the past, I opted for Ubuntu Lucid Lynx 10.04.

My terminal, [Konsole][2], was themed in [Zenburn][3] and had a Bash prompt that looked like this:


```
`machinename ~/path/to/folder $`
```

Nowadays, I'm running on a Mac, specifically macOS Catalina using [iTerm2][4] with the [Zenburn theme][5] and a zsh prompt that looks like this:


```
machinename ~/path/to/folder
$
```

I think after a decade with a near-identical prompt, I have earned the title of _curmudgeon_, if only as a sign that I have preferences and habits that go against what the cool kids are doing nowadays.

As if to prove my curmudgeonly point, I wanted to change my terminal to match my old one. Getting a setup that looks and feels like Lucid Lynx on Mac isn't simple and took some time.

My biggest recent change was moving from Bash to zsh and migrating my [Bash hacks][6]. But that was only one of the major shifts. I learned many new-fangled lessons that I now bestow onto you, dear reader.

### Coreutils forgives flag order

Moving from Ubuntu to macOS wasn't too much of a shift until I started thinking I was losing my Unix-foo. I'd try running basic operations like removing folders and be told that I was invoking `rm` incorrectly.

It turns out that the GNU-style utilities may look like BSD-style utilities, but one of the biggest usability differences is _flag order_. The order in which unnamed parameters are listed does not line up. For instance: `rm`.

Here's the familiar GNU-style command to remove a directory:


```
`$ rm path/to/folder -rf`
```

This contrasts with the BSD-style version of the same command:


```
$ rm path/to/folder -rf
rm: path/to/folder: is a directory
rm: -rf: No such file or directory
```

I got around this by installing [Coreutils][7] through [Homebrew][8]. This brings GNU utilities to macOS and makes flag order more forgiving by allowing me to not have to remember flag order for commands that are deeply ingrained into my muscle memory.

### iTerm2 is powerful

I'm not sure of any operating system where power users are happy with the default terminal. In macOS land, I settled on [iTerm2][4], which allows me more flexibility than the base OS's terminal application. One of my favorite iTerm power features is being able to use **Command**+**D** and **Command**+**Shift**+**D** to split panes vertically and horizontally. There are many more tricks to be learned, but easy split panes alone can make iTerm2 worth the switch from the default option.

### Context-aware plugins

One reason even a curmudgeon of a user customizes a terminal prompt is to gain some situational awareness. I enjoy it when a terminal gives me context and answers all the questions that come to mind. Not just what folder I'm in, but: What machine am I on? Is this a Git repository? If so, what branch am I in? Am I in a Python virtual environment?

Answers to these questions go into a category of terminal extensions that can be called "context-aware plugins."

For the current Git branch, I used this [parse_git_branch()][9] method (there is a similar plugin for [Oh My Zsh][10], if you're using that). For Python, virtualenv prefixes to the prompt automatically. Oh My Zsh has so many [plugins][11], you're sure to find something to improve your life.

As for my local machine? I just place it directly in the PS1 format because I'm basic like that, and macOS doesn't _really_ let you name your machines.

### Multi-line prompts are fine

The observant reader may notice the one change in my prompt over a decade is that it's now two lines. This is a recent change that I'm slowly learning to love because all those plugins I mentioned earlier make my prompt looonnngggg. You can navigate only so deep in a filesystem before you start having line-wrapped command inputs trying to do anything basic. And with that comes occasional redraw issues and readability concerns.

The suggestions I received about resolving this revolved mostly around, "Oh, you're using zsh? Use [Powerlevel10k][12]!" Which is fine for those who aren't stuck in their ways, like me. But I was able to learn from these themes and take a small bit of suggestion from them.

What I've done is to add a `$'\n'` before the final `$` in my prompt, which allows my context-aware information—current machine, current folder, current GitHub branch, current virtualenv, and the like—to all live on one line, and then my commands can be entered without issues.

The only problem I've found is learning where to _look_. I'm used to having my eyes start at the center of the line because that's where the prompt used to start. I'm slowly learning to look left to the prompt, but it's a slow process. I have a decade of eye training to undo.

### Use what works for you

If you prefer a certain style or tool, then you are absolutely valid in that preference. You can try other things, but never think you have to use the latest and greatest just to be like the cool kids. Your style and preferences can change over time, but never be forced into changes that aren't comfortable for you.

_Join us next time, when Aunty Katie complains about IDEs._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/mac-terminal

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://konsole.kde.org/
[3]: https://github.com/brson/zenburn-konsole
[4]: https://www.iterm2.com/
[5]: https://gist.github.com/fooforge/3373215
[6]: https://opensource.com/article/20/1/bash-scripts-aliases
[7]: https://formulae.brew.sh/formula/coreutils
[8]: https://opensource.com/article/20/6/homebrew-mac
[9]: https://gist.github.com/kevinchappell/09ca3805a9531b818579
[10]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
[11]: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
[12]: https://github.com/romkatv/powerlevel10k
