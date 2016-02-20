Make Sudo Insult User For Each Incorrect Password Attempt
===========================================================

You can have lots of fun in Linux terminal. And I am not talking about those funny commands to [run a train in Linux terminal](http://itsfoss.com/ubuntu-terminal-train/).

I am talking about little tweaks in the terminal that will lighten up your mood. In a previous article, you learnt [how to increase sudo timeout in Linux terminal](http://itsfoss.com/change-sudo-password-timeout-ubuntu/). In today’s fun post, I’ll show you how you can make sudo to insult you (or other users) when incorrect password is attempted with sudo command.

Confused what I am talking about? Here, take a look at this gif to get a gist of how sudo can insult you for typing in the incorrect password.

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux.gif)

Now, why would you do that and take insults? After all, insults are not going to brighten up your day, is it?

To me, this little tweak is funny and is better than the plain old “incorrect password” error message. Moreover, I can show it off to my friends (in this case you, via It’s FOSS) to amuse them. I am pretty sure you can come up with your own reason to use this tweak.

## Enable insults in sudo

You can enable insults in `sudo` by adding the following line in `sudo` configuration:

```
Defaults 	insults
```

Let’s see how to do that. Open a terminal and use the following command:

```
sudo visudo
```

This should open the configuration file in [nano](http://www.nano-editor.org/). Yeah, I know that traditionally ‘visudo’ should open the `/etc/sudoers` file in Vi editor, but Ubuntu and Ubuntu based Linux distribution will open it in nano. Since we are talking about Vi, here is a [cheat sheet for Vi editor](http://itsfoss.com/download-vi-cheat-sheet/) that could come handy if you decide to use Vi.

Coming back to editing the sudeors file, you need to find the section where Defaults are listed. Luckily, it is in the beginning itself. Just add “Defaults insults” line to it, like this:

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux-Mint.png)

If you are using nano, use `Ctrl+X` to quit the editor. At the time of quitting, it will ask you if you want to save the changes or not. To save the changes, press `Y`.

Once you have saved the changes in sudoers file, open a terminal and use any command with sudo. Deliberately type wrong password and enjoy the abuses :)

sudo could be nasty. See, it even threatens me of consequences if I type incorrect password again. LOL.

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux-Mint-1.jpeg)

If you like this terminal hack, check out other [terminal tricks](http://itsfoss.com/category/terminal-tricks/) posts as well. If you have other such fun tweaks and hacks, do share it in the comment box below.


------------------------------------------------------------------------------

via: http://itsfoss.com/sudo-insult-linux/

作者：[ABHISHEK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
