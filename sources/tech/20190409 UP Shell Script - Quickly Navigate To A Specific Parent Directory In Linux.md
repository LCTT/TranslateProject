[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (UP Shell Script – Quickly Navigate To A Specific Parent Directory In Linux)
[#]: via: (https://www.2daygeek.com/up-shell-script-quickly-go-back-to-a-specific-parent-directory-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

UP Shell Script – Quickly Navigate To A Specific Parent Directory In Linux
======

Recently we had written an article about **[bd command][1]** , which help us to **[quickly go back to the specific parent directory][1]**.

Even, the [up shell script][2] allow us to perform the same but has different approach so, we would like to explore it.

This will allow us to quickly navigate to a specific parent directory with mentioning the directory name.

Instead we can give the directory number. I mean to say that number of times you’d have to go back.

Stop typing `cd ../../..` endlessly and navigate easily to a specific parent directory by using up shell script.

It support tab completion so, it’s become more convenient.

The `up.sh` registers the up function and some completion functions via your `.bashrc` or `.zshrc` file.

It was completely written using shell script and it’s support zsh and fish shell as well.

We had written an article about **[autocd][3]**. It’s a builtin shell variable that helps us to **[navigate to inside a directory without cd command][3]**.

### How To Install up Linux?

It’s not based on the distribution and you have to install it based on your shell.

Simple run the following command to enable up script on `bash` shell.

```
$ curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

$ echo 'source ~/.config/up/up.sh' >> ~/.bashrc
```

Run the following command to take the changes to effect.

```
$ source ~/.bashrc
```

Simple run the following command to enable up script on `zsh` shell.

```
$ curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

$ echo 'source ~/.config/up/up.sh' >> ~/.zshrc
```

Run the following command to take the changes to effect.

```
$ source ~/.zshrc
```

Simple run the following command to enable up script on `fish` shell.

```
$ curl --create-dirs -o ~/.config/up/up.fish https://raw.githubusercontent.com/shannonmoeller/up/master/up.fish

$ source ~/.config/up/up.fish
```

### How To Use This In Linux?

We have successfully installed and configured the up script on system. It’s time to test it.

I’m going to take the below directory path for this testing.

Run the `pwd` command or `dirs` command to know your current location.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ pwd
or
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ dirs

/usr/share/icons/Adwaita/256x256/apps
```

How to up one level? Quickly go back to one directory. I’m currently in `/usr/share/icons/Adwaita/256x256/apps` and if i want to go one directory up `256x256` directory quickly then simple type the following command.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ up

daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256$ pwd
/usr/share/icons/Adwaita/256x256
```

How to up multiple levels? Quickly go back to multiple directory. I’m currently in `/usr/share/icons/Adwaita/256x256/apps` and if i want to go to `share` directory quickly then simple type the following command.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ up 4

daygeek@Ubuntu18:/usr/share$ pwd
/usr/share
```

How to up by full name? Quickly go back to the given directory instead of number.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ up icons

daygeek@Ubuntu18:/usr/share/icons$ pwd
/usr/share/icons
```

How to up by partial name? Quickly go back to the given directory instead of number.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ up Ad

daygeek@Ubuntu18:/usr/share/icons/Adwaita$ pwd
/usr/share/icons/Adwaita
```

As i told in the beginning of the article, it supports tab completion.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ up
256x256/  Adwaita/  icons/    share/    usr/
```

This tutorial allows you to quickly go back to a specific parent directory but there is no option to move forward quickly.

We have another solution for this, will come up with new solution shortly. Please stay tune with us.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/up-shell-script-quickly-go-back-to-a-specific-parent-directory-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/bd-quickly-go-back-to-a-specific-parent-directory-in-linux/
[2]: https://github.com/shannonmoeller/up
[3]: https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/
