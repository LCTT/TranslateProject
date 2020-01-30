[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My favorite Bash hacks)
[#]: via: (https://opensource.com/article/20/1/bash-scripts-aliases)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

My favorite Bash hacks
======
Improve your productivity with aliases and other shortcuts for the
things you forget too often.
![bash logo on green background][1]

When you work with computers all day, it's fantastic to find repeatable commands and tag them for easy use later on. They all sit there, tucked away in **~/.bashrc** (or ~/.zshrc for [Zsh users][2]), waiting to help improve your day!

In this article, I share some of my favorite of these helper commands for things I forget a lot, in hopes that they will save you, too, some heartache over time.

### Say when it's over

When I'm using longer-running commands, I often multitask and then have to go back and check if the action has completed. But not anymore, with this helpful invocation of **say** (this is on MacOS; change for your local equivalent):


```
function looooooooong {
    START=$(date +%s.%N)
    $*
    EXIT_CODE=$?
    END=$(date +%s.%N)
    DIFF=$(echo "$END - $START" | bc)
    RES=$(python -c "diff = $DIFF; min = int(diff / 60); print('%s min' % min)")
    result="$1 completed in $RES, exit code $EXIT_CODE."
    echo -e "\n⏰  $result"
    ( say -r 250 $result 2&gt;&amp;1 &gt; /dev/null &amp; )
}
```

This command marks the start and end time of a command, calculates the minutes it takes, and speaks the command invoked, the time taken, and the exit code. I find this super helpful when a simple console bell just won't do.

### Install helpers

I started using Ubuntu back in the Lucid days, and one of the first things I needed to learn was how to install packages. And one of the first aliases I ever added was a helper for this (named based on the memes of the day):


```
`alias canhas="sudo apt-get install -y"`
```

### GNU Privacy Guard (GPG) signing

On the off chance I have to sign a [GPG][3] email without having an extension or application to do it for me, I drop down into the command line and use these terribly dorky aliases:


```
alias gibson="gpg --encrypt --sign --armor"
alias ungibson="gpg --decrypt"
```

### Docker

There are many Docker commands, but there are even more **docker compose** commands. I used to forget the **\--rm** flags, but not anymore with these useful aliases:


```
alias dc="docker-compose"
alias dcr="docker-compose run --rm"
alias dcb="docker-compose run --rm --build"
```

### gcurl helper for Google Cloud

This one is relatively new to me, but it's [heavily documented][4]. gcurl is an alias to ensure you get all the correct flags when using local curl commands with authentication headers when working with Google Cloud APIs. 

### Git and ~/.gitignore

I work a lot in Git, so I have a special section dedicated to Git helpers.

One of my most useful helpers is one I use to clone GitHub repos. Instead of having to run:


```
`git clone git@github.com:org/repo /Users/glasnt/git/org/repo`
```

I set up a clone function:


```
clone(){
    echo Cloning $1 to ~/git/$1
    cd ~/git
    git clone [git@github.com][5]:$1 $1
    cd $1
}
```

Even though I always forget and giggle any time I'm diving into my **~/.bashrc** file, I also have my "refresh upstream" command:


```
`alias yoink="git checkout master && git fetch upstream master && git merge upstream/master"`
```

Another helper for Git-ville is a global ignore file. In your **git config --global --list** you should see a **core.excludesfile**. If not, [create one][6], and fill it full of things that you always put into your individual **.gitignore** files. As a Python developer on MacOS, for me this is:


```
.DS_Store     # macOS clutter
venv/         # I never want to commit my virtualenv
*.egg-info/*  # ... nor any locally compiled packages
__pycache__   # ... or source
*.swp         # ... nor any files open in vim
```

You can find other suggestions over on [Gitignore.io][7] or on the [Gitignore repo][8] on GitHub.

### Your turn

What are your favorite helper commands? Please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/bash-scripts-aliases

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/19/9/getting-started-zsh
[3]: https://gnupg.org/
[4]: https://cloud.google.com/service-infrastructure/docs/service-control/getting-started
[5]: mailto:git@github.com
[6]: https://help.github.com/en/github/using-git/ignoring-files#create-a-global-gitignore
[7]: https://www.gitignore.io/
[8]: https://github.com/github/gitignore
