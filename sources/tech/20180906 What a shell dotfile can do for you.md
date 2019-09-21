What a shell dotfile can do for you
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

Ask not what you can do for your shell dotfile, but what a shell dotfile can do for you!

I've been all over the OS map, but for the past several years my daily drivers have been Macs. For a long time, I used Bash, but when a few friends started proselytizing [zsh][1], I gave it a shot. It didn't take long for me to appreciate it, and several years later, I strongly prefer it for many of the little things that it does.

I've been using zsh (provided via [Homebrew][2], not the system installed), and the [Oh My Zsh enhancement][3].

The examples in this article are for my personal `.zshrc`. Most will work directly in Bash, and I don't believe that any rely on Oh My Zsh, but your mileage may vary. There was a period when I was maintaining a shell dotfile for both zsh and Bash, but I did eventually give up on my `.bashrc`.

### We're all mad here

If you want the possibility of using the same dotfile across OS's, you'll want to give your dotfile a little smarts.
```
### Mac Specifics
if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac-specific stuff here.
fi
```

For instance, I expect the Alt + arrow keys to move the cursor by the word rather than by a single space. To make this happen in [iTerm2][4] (my preferred shell), I add this snippet to the Mac-specific portion of my .zshrc:
```
### Mac Specifics
if [[ "$OSTYPE" == "darwin"* ]]; then
        ### Mac cursor commands for iTerm2; map ctrl+arrows or alt+arrows to fast-move
        bindkey -e
        bindkey '^[[1;9C' forward-word
        bindkey '^[[1;9D' backward-word
        bindkey '\e\e[D' backward-word
        bindkey '\e\e[C' forward-word
fi
```

### What about Bob?

While I came to love my shell dotfile, I didn't always want the same things available on my home machines as on my work machines. One way to solve this is to have supplementary dotfiles to use at home but not at work. Here's how I accomplished this:
```
if [[ `egrep 'dnssuffix1|dnssuffix2' /etc/resolv.conf` ]]; then
        if [ -e $HOME/.work ]
                source $HOME/.work
        else
                echo "This looks like a work machine, but I can't find the ~/.work file"
        fi
fi
```

In this case, I key off of my work dns suffix (or multiple suffixes, depending on your situation) and source a separate file that makes my life at work a little better.

### That thing you do

Now is probably a good time to quit using the tilde (`~`) to represent your home directory when writing scripts. You'll find that there are some contexts where it's not recognized. Getting in the habit of using the environment variable `$HOME` will save you a lot of troubleshooting time and headaches later on.

The logical extension would be to have OS-specific dotfiles to include if you are so inclined.

### Memory, all alone in the moonlight

I've written embarrassing amounts of shell, and I've come to the conclusion that I really don't want to write more. It's not that shell can't do what I need most of the time, but I find that if I'm writing shell, I'm probably slapping together a duct-tape solution rather than permanently solving the problem.

Likewise, I hate memorizing things, and throughout my career, I have had to do radical context shifting during the course of a day. The practical consequence is that I've had to re-learn many things several times over the years. ("Wait... which for-loop structure does this language use?")

So, every so often I decide that I'm tired of looking up how to do something again. One way that I improve my life is by adding aliases.

A common scenario for anyone who works with systems is finding out what's taking up all of the disk. Unfortunately, I have never been able to remember this incantation, so I made a shell alias, creatively called `bigdirs`:
```
alias bigdirs='du --max-depth=1 2> /dev/null | sort -n -r | head -n20'
```

While I could be less lazy and actually memorize it, well, that's just not the Unix way...

### Typos, and the people who love them

Another way that using shell aliases improves my life is by saving me from typos. I don't know why, but I've developed this nasty habit of typing a `w` after the sequence `ea`, so if I want to clear my terminal, I'll often type `cleawr`. Unfortunately, that doesn't mean anything to my shell. Until I add this little piece of gold:
```
alias cleawr='clear'
```

In one instance of Windows having an equivalent, but better, command, I find myself typing `cls`. It's frustrating to see your shell throw up its hands, so I add:
```
alias cls='clear'
```

Yes, I'm aware of `ctrl + l`, but I never use it.

### Amuse yourself

Work can be stressful. Sometimes you just need to have a little fun. If your shell doesn't know the command that it clearly should just do, maybe you want to shrug your shoulders right back at it! You can do this with a function:
```
shrug() { echo "¯\_(ツ)_/¯"; }
```

If that doesn't work, maybe you need to flip a table:
```
fliptable() { echo "（╯°□°）╯ ┻━┻"; } # Flip a table. Example usage: fsck -y /dev/sdb1 || fliptable
```

Imagine my chagrin and frustration when I needed to flip a desk and I couldn't remember what I had called it. So I added some more shell aliases:
```
alias flipdesk='fliptable'
alias deskflip='fliptable'
alias tableflip='fliptable'
```

And sometimes you need to celebrate:
```
disco() {
        echo "(•_•)"
        echo "<)   )╯"
        echo " /    \ "
        echo ""
        echo "\(•_•)"
        echo " (   (>"
        echo " /    \ "
        echo ""
        echo " (•_•)"
        echo "<)   )>"
        echo " /    \ "
}
```

Typically, I'll pipe the output of these commands to `pbcopy `and paste it into the relevant chat tool I'm using.

I got this fun function from a Twitter account that I follow called "Command Line Magic:" [@climagic][5]. Since I live in Florida now, I'm very happy that this is the only snow in my life:
```
snow() {
        clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}

```

### Fun with functions

We've seen some examples of functions that I use. Since few of these examples require an argument, they could be done as aliases. I use functions out of personal preference when it's more than a single short statement.

At various times in my career, I've run [Graphite][6], an open-source, scalable, time-series metrics solution. There have been enough instances where I needed to transpose a metric path (delineated with periods) to a filesystem path (delineated with slashes), or vice versa, that it became useful to have dedicated functions for these tasks:
```
# Useful for converting between Graphite metrics and file paths
function dottoslash() {
        echo $1 | sed 's/\./\//g'
}
function slashtodot() {
        echo $1 | sed 's/\//\./g'
}
```

During another time in my career, I was running a lot of Kubernetes. If you aren't familiar with running Kubernetes, you need to write a lot of YAML. Unfortunately, it's not hard to write invalid YAML. Worse, Kubernetes doesn't validate YAML before trying to apply it, so you won't find out it's invalid until you apply it. Unless you validate it first:
```
function yamllint() {
        for i in $(find . -name '*.yml' -o -name '*.yaml'); do echo $i; ruby -e "require 'yaml';YAML.load_file(\"$i\")"; done
}
```

Because I got tired of embarrassing myself and occasionally breaking a customer's setup, I wrote this little snippet and added it as a pre-commit hook to all of my relevant repos. Something similar would be very helpful as part of your continuous integration process, especially if you're working as part of a team.

### Oh, fingers, where art thou?

I was once an excellent touch-typist. Those days are long gone. I typo more than I would have believed possible.

At different times, I have used a fair amount of either Chef or Kubernetes. Fortunately for me, I never used both at the same time.

Part of the Chef ecosystem is Test Kitchen, a suite of tools that facilitate testing, which is invoked with the commands `kitchen test`. Kubernetes is managed with a CLI tool `kubectl`. Both commands require several subcommands, and neither rolls off the fingers particularly fluidly.

Rather than create a bunch of "typo aliases," I aliased those commands to `k`:
```
alias k='kitchen test $@'
```

or
```
alias k='kubectl $@'
```

### Timesplitters

The last half of my career has involved writing more code with other people. I've worked in many environments where we have forked copies of repos on our account and use pull requests as part of the review process. When I want to make sure that my fork of a given repo is up to date with the parent, I use `fetchupstream`:
```
alias fetchupstream='git fetch upstream && git checkout master && git merge upstream/master && git push'
```

### Mine eyes have seen the glory of the coming of color

I like color. It can make things like diffs easier to use.
```
alias diff='colordiff'
```

I thought that colorized man pages was a neat trick, so I incorporated this function:
```
# Colorized man pages, from:
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
        env \
                LESS_TERMCAP_md=$(printf "\e[1;36m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
}
```

I love the command `which`. It simply tells you where in the filesystem the command you're running comes from—unless it's a shell function. After multiple cascading dotfiles, sometimes it's not clear where a function is defined or what it does. It turns out that the `whence` and `type` commands can help with that.
```
# Where is a function defined?
whichfunc() {
        whence -v $1
        type -a $1
}
```

### Conclusion

I hope this article helps and inspires you to find ways to improve your daily shell-using experience. They don't need to be huge, novel, or complex. They might solve a minor but frequent bit of friction, create a shortcut, or even offer a solution to reducing common typos.

You're welcome to look through my [dotfiles repo][7], but I warn you that it could use a lot of cleaning up. Feel free to use anything that you find helpful, and please be excellent to one another.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/shell-dotfile

作者：[H.Waldo Grunenwald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gwaldo
[1]: http://www.zsh.org/
[2]: https://brew.sh/
[3]: https://github.com/robbyrussell/oh-my-zsh
[4]: https://www.iterm2.com/
[5]: https://twitter.com/climagic
[6]: https://github.com/graphite-project/
[7]: https://github.com/gwaldo/dotfiles
