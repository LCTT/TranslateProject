Translating by DavidChenLiang

CLI: improved
======
I'm not sure many web developers can get away without visiting the command line. As for me, I've been using the command line since 1997, first at university when I felt both super cool l33t-hacker and simultaneously utterly out of my depth.

Over the years my command line habits have improved and I often search for smarter tools for the jobs I commonly do. With that said, here's my current list of improved CLI tools.


### Ignoring my improvements

In a number of cases I've aliased the new and improved command line tool over the original (as with `cat` and `ping`).

If I want to run the original command, which is sometimes I do need to do, then there's two ways I can do this (I'm on a Mac so your mileage may vary):
```
$ \cat # ignore aliases named "cat" - explanation: https://stackoverflow.com/a/16506263/22617
$ command cat # ignore functions and aliases

```

### bat > cat

`cat` is used to print the contents of a file, but given more time spent in the command line, features like syntax highlighting come in very handy. I found [ccat][3] which offers highlighting then I found [bat][4] which has highlighting, paging, line numbers and git integration.

The `bat` command also allows me to search during output (only if the output is longer than the screen height) using the `/` key binding (similarly to `less` searching).

![Simple bat output][5]

I've also aliased `bat` to the `cat` command:
```
alias cat='bat'

```

💾 [Installation directions][4]

### prettyping > ping

`ping` is incredibly useful, and probably my goto tool for the "oh crap is X down/does my internet work!!!". But `prettyping` ("pretty ping" not "pre typing"!) gives ping a really nice output and just makes me feel like the command line is a bit more welcoming.

![/images/cli-improved/ping.gif][6]

I've also aliased `ping` to the `prettyping` command:
```
alias ping='prettyping --nolegend'

```

💾 [Installation directions][7]

### fzf > ctrl+r

In the terminal, using `ctrl+r` will allow you to [search backwards][8] through your history. It's a nice trick, albeit a bit fiddly.

The `fzf` tool is a **huge** enhancement on `ctrl+r`. It's a fuzzy search against the terminal history, with a fully interactive preview of the possible matches.

In addition to searching through the history, `fzf` can also preview and open files, which is what I've done in the video below:

For this preview effect, I created an alias called `preview` which combines `fzf` with `bat` for the preview and a custom key binding to open VS Code:
```
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

```

💾 [Installation directions][9]

### htop > top

`top` is my goto tool for quickly diagnosing why the CPU on the machine is running hard or my fan is whirring. I also use these tools in production. Annoyingly (to me!) `top` on the Mac is vastly different (and inferior IMHO) to `top` on linux.

However, `htop` is an improvement on both regular `top` and crappy-mac `top`. Lots of colour coding, keyboard bindings and different views which have helped me in the past to understand which processes belong to which.

Handy key bindings include:

  * P - sort by CPU
  * M - sort by memory usage
  * F4 - filter processes by string (to narrow to just "node" for instance)
  * space - mark a single process so I can watch if the process is spiking



![htop output][10]

There is a weird bug in Mac Sierra that can be overcome by running `htop` as root (I can't remember exactly what the bug is, but this alias fixes it - though annoying that I have to enter my password every now and again):
```
alias top="sudo htop" # alias top and fix high sierra bug

```

💾 [Installation directions][11]

### diff-so-fancy > diff

I'm pretty sure I picked this one up from Paul Irish some years ago. Although I rarely fire up `diff` manually, my git commands use diff all the time. `diff-so-fancy` gives me both colour coding but also character highlight of changes.

![diff so fancy][12]

Then in my `~/.gitconfig` I have included the following entry to enable `diff-so-fancy` on `git diff` and `git show`:
```
[pager]
 diff = diff-so-fancy | less --tabs=1,5 -RFX
 show = diff-so-fancy | less --tabs=1,5 -RFX

```

💾 [Installation directions][13]

### fd > find

Although I use a Mac, I've never been a fan of Spotlight (I found it sluggish, hard to remember the keywords, the database update would hammer my CPU and generally useless!). I use [Alfred][14] a lot, but even the finder feature doesn't serve me well.

I tend to turn the command line to find files, but `find` is always a bit of a pain to remember the right expression to find what I want (and indeed the Mac flavour is slightly different non-mac find which adds to frustration).

`fd` is a great replacement (by the same individual who wrote `bat`). It is very fast and the common use cases I need to search with are simple to remember.

A few handy commands:
```
$ fd cli # all filenames containing "cli"
$ fd -e md # all with .md extension
$ fd cli -x wc -w # find "cli" and run `wc -w` on each file

```

![fd output][15]

💾 [Installation directions][16]

### ncdu > du

Knowing where disk space is being taking up is a fairly important task for me. I've used the Mac app [Disk Daisy][17] but I find that it can be a little slow to actually yield results.

The `du -sh` command is what I'll use in the terminal (`-sh` means summary and human readable), but often I'll want to dig into the directories taking up the space.

`ncdu` is a nice alternative. It offers an interactive interface and allows for quickly scanning which folders or files are responsible for taking up space and it's very quick to navigate. (Though any time I want to scan my entire home directory, it's going to take a long time, regardless of the tool - my directory is about 550gb).

Once I've found a directory I want to manage (to delete, move or compress files), I'll use the cmd + click the pathname at the top of the screen in [iTerm2][18] to launch finder to that directory.

![ncdu output][19]

There's another [alternative called nnn][20] which offers a slightly nicer interface and although it does file sizes and usage by default, it's actually a fully fledged file manager.

My `ncdu` is aliased to the following:
```
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

```

The options are:

  * `--color dark` \- use a colour scheme
  * `-rr` \- read-only mode (prevents delete and spawn shell)
  * `--exclude` ignore directories I won't do anything about



💾 [Installation directions][21]

### tldr > man

It's amazing that nearly every single command line tool comes with a manual via `man <command>`, but navigating the `man` output can be sometimes a little confusing, plus it can be daunting given all the technical information that's included in the manual output.

This is where the TL;DR project comes in. It's a community driven documentation system that's available from the command line. So far in my own usage, I've not come across a command that's not been documented, but you can [also contribute too][22].

![TLDR output for 'fd'][23]

As a nicety, I've also aliased `tldr` to `help` (since it's quicker to type!):
```
alias help='tldr'

```

💾 [Installation directions][24]

### ack || ag > grep

`grep` is no doubt a powerful tool on the command line, but over the years it's been superseded by a number of tools. Two of which are `ack` and `ag`.

I personally flitter between `ack` and `ag` without really remembering which I prefer (that's to say they're both very good and very similar!). I tend to default to `ack` only because it rolls of my fingers a little easier. Plus, `ack` comes with the mega `ack --bar` argument (I'll let you experiment)!

Both `ack` and `ag` will (by default) use a regular expression to search, and extremely pertinent to my work, I can specify the file types to search within using flags like `--js` or `--html` (though here `ag` includes more files in the js filter than `ack`).

Both tools also support the usual `grep` options, like `-B` and `-A` for before and after context in the grep.

![ack in action][25]

Since `ack` doesn't come with markdown support (and I write a lot in markdown), I've got this customisation in my `~/.ackrc` file:
```
--type-set=md=.md,.mkd,.markdown
--pager=less -FRX

```

💾 Installation directions: [ack][26], [ag][27]

[Futher reading on ack & ag][28]

### jq > grep et al

I'm a massive fanboy of [jq][29]. At first I struggled with the syntax, but I've since come around to the query language and use `jq` on a near daily basis (whereas before I'd either drop into node, use grep or use a tool called [json][30] which is very basic in comparison).

I've even started the process of writing a jq tutorial series (2,500 words and counting) and have published a [web tool][31] and a native mac app (yet to be released).

`jq` allows me to pass in JSON and transform the source very easily so that the JSON result fits my requirements. One such example allows me to update all my node dependencies in one command (broken into multiple lines for readability):
```
$ npm i $(echo $(\
 npm outdated --json | \
 jq -r 'to_entries | .[] | "\(.key)@\(.value.latest)"' \
))

```

The above command will list all the node dependencies that are out of date, and use npm's JSON output format, then transform the source JSON from this:
```
{
 "node-jq": {
 "current": "0.7.0",
 "wanted": "0.7.0",
 "latest": "1.2.0",
 "location": "node_modules/node-jq"
 },
 "uuid": {
 "current": "3.1.0",
 "wanted": "3.2.1",
 "latest": "3.2.1",
 "location": "node_modules/uuid"
 }
}

```

…to this:

That result is then fed into the `npm install` command and voilà, I'm all upgraded (using the sledgehammer approach).

### Honourable mentions

Some of the other tools that I've started poking around with, but haven't used too often (with the exception of ponysay, which appears when I start a new terminal session!):

  * [ponysay][32] > cowsay
  * [csvkit][33] > awk et al
  * [noti][34] > `display notification`
  * [entr][35] > watch



### What about you?

So that's my list. How about you? What daily command line tools have you improved? I'd love to know.


--------------------------------------------------------------------------------

via: https://remysharp.com/2018/08/23/cli-improved

作者：[Remy Sharp][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://remysharp.com
[1]: https://remysharp.com/images/terminal-600.jpg
[2]: https://training.leftlogic.com/buy/terminal/cli2?coupon=READERS-DISCOUNT&utm_source=blog&utm_medium=banner&utm_campaign=remysharp-discount
[3]: https://github.com/jingweno/ccat
[4]: https://github.com/sharkdp/bat
[5]: https://remysharp.com/images/cli-improved/bat.gif (Sample bat output)
[6]: https://remysharp.com/images/cli-improved/ping.gif (Sample ping output)
[7]: http://denilson.sa.nom.br/prettyping/
[8]: https://lifehacker.com/278888/ctrl%252Br-to-search-and-other-terminal-history-tricks
[9]: https://github.com/junegunn/fzf
[10]: https://remysharp.com/images/cli-improved/htop.jpg (Sample htop output)
[11]: http://hisham.hm/htop/
[12]: https://remysharp.com/images/cli-improved/diff-so-fancy.jpg (Sample diff output)
[13]: https://github.com/so-fancy/diff-so-fancy
[14]: https://www.alfredapp.com/
[15]: https://remysharp.com/images/cli-improved/fd.png (Sample fd output)
[16]: https://github.com/sharkdp/fd/
[17]: https://daisydiskapp.com/
[18]: https://www.iterm2.com/
[19]: https://remysharp.com/images/cli-improved/ncdu.png (Sample ncdu output)
[20]: https://github.com/jarun/nnn
[21]: https://dev.yorhel.nl/ncdu
[22]: https://github.com/tldr-pages/tldr#contributing
[23]: https://remysharp.com/images/cli-improved/tldr.png (Sample tldr output for 'fd')
[24]: http://tldr-pages.github.io/
[25]: https://remysharp.com/images/cli-improved/ack.png (Sample ack output with grep args)
[26]: https://beyondgrep.com
[27]: https://github.com/ggreer/the_silver_searcher
[28]: http://conqueringthecommandline.com/book/ack_ag
[29]: https://stedolan.github.io/jq
[30]: http://trentm.com/json/
[31]: https://jqterm.com
[32]: https://github.com/erkin/ponysay
[33]: https://csvkit.readthedocs.io/en/1.0.3/
[34]: https://github.com/variadico/noti
[35]: http://www.entrproject.org/
