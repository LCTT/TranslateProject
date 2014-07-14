JonathanKang is translating

How To Enable Tab Complete Heroku Commands In Oh-My-Zsh
================================================================================
**Heroku** Client is the (Command Line Interface) CLI tool for creating and managing Heroku apps.

Requirements:

- Heroku toolbelt
- Oh-My-Zsh ([How to Install][1])

Note this post is not talk about heroku, it’s just to show users how they can ease typing of commands with oh-my-zsh, so am NOT going to talk into detail on doing things. Also you should have [heroku toolbelt][2] installed to make this work. Is simple for Ubuntu and Debian derivatives,Install by running the command below:

    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

Open Terminal and login into heroku with you account created [here][3]:

    heroku login
    Enter your Heroku credentials.
    Email: enockseth@unixmen.com
    Password (typing will be hidden): 
    Authentication successful.

That shows heroku is up and running.

Open **.zshrc** in your favourite text editor

    vim .zshrc

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/zsh_git.png)

By default git is the only plugin enabled.

Add **heroku** to the plugins section as shown below:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/zsh_heroku.png)

Restart teminal, type **heroku** press tab and you’re good to go:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/heroku_tab_complete.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/enable-tab-complete-heroku-commands-oh-zsh/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.unixmen.com/install-oh-zsh-ubuntu-arch-linux-fedora/
[2]:https://toolbelt.heroku.com/
[3]:https://www.heroku.com/
