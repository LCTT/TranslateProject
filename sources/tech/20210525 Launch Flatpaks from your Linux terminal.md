[#]: subject: (Launch Flatpaks from your Linux terminal)
[#]: via: (https://opensource.com/article/21/5/launch-flatpaks-linux-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Launch Flatpaks from your Linux terminal
======
Use a Bash alias to launch Flatpak applications without dropping out of
the terminal to the desktop.
![Terminal command prompt on orange background][1]

The Flatpak application distribution model is helping developers target Linux in a new and easy way, and it's helping Linux users install more applications without worrying about what version of Linux they're running. It's an exciting technology, and on my [Fedora Silverblue][2] system, it's the default package installation method. All of my desktop applications on Silverblue and several of my favorites I use on Slackware are running as Flatpaks.

There's one thing that makes Flatpak a little awkward in some cases, though, and that's its naming scheme. For instance, when I install Emacs as a Flatpak, it's registered on my system as `org.gnu.emacs`. This is done, apparently, for fear of clobbering the name of an existing system-level application—if I already have Emacs installed, then what's the differentiation between `/usr/bin/emacs` and the Flatpak installation of Emacs? For this reason, a Flatpak like Emacs gets installed to something like (get ready for it) this path:


```
`/var/lib/flatpak/app/org.gnu.emacs/current/active/export/bin/org.gnu.emacs`
```

It's not symlinked from `/usr/bin` or `/opt`, the location isn't added to the user's path, and launching a Flatpak requires an invocation like this:


```
`$ flatpak run org.gnu.emacs`
```

That's a lot of typing compared to just entering `emacs`.

### Names are hard to remember

The Flatpak naming scheme also assumes you use a Flatpak often enough to remember the package's reverse DNS name. Aside from the structure, there's no standard for naming a Flatpak, so one Flatpak could use camel-case, such as `org.libreoffice.LibreOffice`, while another might use a mix, such as `org.gimp.GIMP`.

Some names are easier to remember than others, too. For example, `org.glimpse_editor.Glimpse` is easy to remember _only_ if you remember its website is <http://glimpse-editor.org>, rather than glimpse.org, and an underscore replaces the dash.

From the viewpoint of Flatpak developers, this isn't a problem because Flatpaks are intended to be launched from the desktop. You don't have to remember `org.gnu.emacs` because you can always launch it from GNOME Activities or your K-Menu or a similar graphical launcher.

This holds true often enough, but sometimes it's more convenient to launch an application from a terminal because you're already using the terminal. Whether I want an image in Glimpse or a text file in Emacs or a music file in VLC, I'm very frequently too busy in the terminal to "drop" out to the desktop (even though it's just one key away!), launch the application, click through the menus to open a file, and then click through my filesystem to find the file I want to open.

It's just faster to type the command followed by the file I want to open. But if I have to type `flatpak run org.something.app`, it isn't.

### Using Bash aliases to launch a Flatpak

The obvious solution to all of this is a [Bash alias][3]. With a Bash alias, you can assign any arbitrary command to nearly any word you want. There are many [common][4] Bash [aliases][5] that nearly every Linux user has on their system, either by conscious choice or because the distribution presets them:


```
$ grep alias ~/.bashrc
alias cp='cp -v'
alias rm='/usr/bin/local/trashy'
alias mv='mv -v'
alias ls='ls --color'
alias ll='ls -l --color'
alias lh='ll -h'
```

You can create aliases for Flatpaks, too:


```
`alias emacs='flatpak run org.gnu.emacs'`
```

Problem solved!

### Better interaction with Bash scripting

It didn't take long for the process of adding aliases manually to feel too laborious to me. And for me, it's not the task but the process. Opening an editor and adding an alias is remarkably quick, but it's a break in my workflow.

What I really want is something I can, mentally and physically, append to the initial Flatpak install process _as needed_. Not all the Flatpaks I install require an alias. For instance, here's a partial list of Flatpaks on my Silverblue system:


```
$ find /var/lib/flatpak/app/* -maxdepth 0 -type d | tail -n5
/var/lib/flatpak/app/org.gnome.baobab
/var/lib/flatpak/app/org.gnome.Calculator
/var/lib/flatpak/app/org.gnome.Calendar
/var/lib/flatpak/app/org.gnome.Characters
/var/lib/flatpak/app/org.gnome.clocks
/var/lib/flatpak/app/org.gnome.Contacts
/var/lib/flatpak/app/org.gnome.eog
/var/lib/flatpak/app/org.gnome.Evince
/var/lib/flatpak/app/org.gnome.FileRoller
/var/lib/flatpak/app/org.gnome.font-viewer
/var/lib/flatpak/app/org.gnome.gedit
/var/lib/flatpak/app/org.gnome.Logs
/var/lib/flatpak/app/org.gnome.Maps
/var/lib/flatpak/app/org.gnome.NautilusPreviewer
/var/lib/flatpak/app/org.gnome.Rhythmbox3
/var/lib/flatpak/app/org.gnome.Screenshot
/var/lib/flatpak/app/org.gnome.Weather
/var/lib/flatpak/app/org.gnu.emacs
/var/lib/flatpak/app/org.signal.Signal
```

I'll never launch Weather or GNOME Calculator from the terminal. I won't ever launch Signal from the terminal, either, because it's an application I open at the start of my day and never close.

Therefore, the requirements I defined for myself are:

  * As-needed addition of an alias
  * Terminal-based control, so it fits comfortably at the end of my Flatpak install process
  * Does one thing and does it well
  * Portable across Fedora, RHEL, Slackware, and any other distro I happen to be using any given week



The solution I've settled on lately is a custom little [Bash script][6] that I use to add aliases for Flatpaks I know I want to access quickly from my terminal. Here's the script:


```
#!/bin/sh
# GPLv3 appears here
# gnu.org/licenses/gpl-3.0.md

# vars
SYMRC=.bashrc.d
SYMDIR=$HOME/$SYMRC
SYMFILE=flatpak_aliases

# exit on errors
set -e

# this is where the aliases lives
if [ ! -d $SYMDIR ]; then
    mkdir "${SYMDIR}"
    touch "${SYMDIR}"/"${SYMFILE}"
fi

sourcer() {
    echo 'Run this command to update your shell:'
    echo ". ${SYMDIR}/${SYMFILE}"
}

lister() {
    cat "${SYMDIR}"/"${SYMFILE}"
}

adder() {
    grep "alias ${ARG}\=" "${SYMDIR}"/"${SYMFILE}" &amp;&amp; i=1
    [[ $VERBOSE ]] &amp;&amp; echo "$i"

    if [ $i &gt; 0 ]; then
        echo "Alias for ${ARG} already exists:"
        grep "alias ${ARG}=" "${SYMDIR}"/"${SYMFILE}"
        exit
    else
        echo "alias ${ARG}='${COMMAND}'" &gt;&gt; "${SYMDIR}"/"${SYMFILE}"
        [[ $VERBOSE ]] &amp;&amp; echo "Alias for ${ARG} added"
        sourcer
    fi

    unset i
}

remover() {
    echo "Removing stuff."
    sed -i "/alias ${ARG}\=/d" "${SYMDIR}"/"${SYMFILE}"
    sourcer
}

# arg parse
while [ True ]; do
    if [ "$1" = "--help" -o "$1" = "-h" ]; then
        echo " "
        echo "$0 add --command 'flatpak run org.gnu.emacs' emacs \\# create symlink for emacs"
        echo "$0 add --command 'flatpak run org.gnu.emacs -fs' emacs-fs \\# create symlink for emacs in fullscreen"
        echo "$0 remove emacs \\# remove emacs symlink"
        echo "$0 list         \\# list all active flatpak symlinks"
        echo " "
        exit
    elif [ "$1" = "--verbose" -o "$1" = "-v" ]; then
        VERBOSE=1
        shift 1
    elif [ "$1" = "list" ]; then
        MODE="list"
        shift 1
    elif [ "$1" = "add" ]; then
        MODE="add"
        shift 1
    elif [ "$1" = "remove" ]; then
        MODE="remove"
        shift 1
    elif [ "$1" = "--command" -o "$1" = "-c" ]; then
        COMMAND="${2}"
        shift 2
    else
        break
    fi
done

#create array, retain spaces
ARG=( "${@}" )

case $MODE in
    add)
        adder
        ;;
    list)
        lister
        ;;
    remove)
        remover
        ;;
    *)
        echo "You must specify an action &lt;list|add|remove&gt;"
        exit 1
esac
```

### Using the script

![Launching a Flatpak from a terminal][7]

When I install a Flatpak I expect to want to launch from the terminal, I finish the process with this script:


```
$ flatpak install org.gnu.emacs
$ pakrat add -c 'flatpak run org.gnu.emacs' emacs
Alias for emacs added.
Run this command to update your shell:
. ~/.bashrc.d/flatpak_aliases

$ . ~/.bashrc.d/flatpak_aliases
```

If an alias already exists, it's discovered, and no new alias is created.

I can remove an alias, too:


```
`$ pakrat remove emacs`
```

This doesn't remove the Flatpak and only operates on the dedicated `flatpak_aliases` file.

All Flatpak aliases are added to `~/.bashrc.d/flatpak_aliases`, which you can automatically source when your shell is launched by placing this manner of code into your `.bashrc` or `.bash_profile` or `.profile` file:


```
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc
```

### Flatpak launching made easy

Flatpaks integrate really well with desktop Linux, and they have a strong, reproducible infrastructure behind them. They're [relatively easy to build][8] and a breeze to use. With just a little added effort, you can bring them down into the terminal so that you can use them whichever way works best for you. There are probably several other projects like this out there and probably a few in development that are far more advanced than a simple Bash script, but this one's been working well for me so far. Try it out, or share your custom solution in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/launch-flatpaks-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/article/21/2/linux-packaging
[3]: https://opensource.com/article/19/7/bash-aliases
[4]: https://opensource.com/article/17/5/introduction-alias-command-line-tool
[5]: https://opensource.com/article/18/9/handy-bash-aliases
[6]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[7]: https://opensource.com/sites/default/files/flatpak-terminal-launch.png (Launching a Flatpak from a terminal)
[8]: https://opensource.com/article/19/10/how-build-flatpak-packaging
