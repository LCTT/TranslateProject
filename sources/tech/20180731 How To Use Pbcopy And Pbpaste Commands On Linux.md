How To Use Pbcopy And Pbpaste Commands On Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/Pbcopy-And-Pbpaste-Commands-720x340.png)

Since Linux and Mac OS X are *Nix based systems, many commands would work on both platforms. However, some commands may not available in on both platforms, for example **pbcopy** and **pbpaste**. These commands are exclusively available only on Mac OS X platform. The Pbcopy command will copy the standard input into clipboard. You can then paste the clipboard contents using Pbpaste command wherever you want. Of course, there could be some Linux alternatives to the above commands, for example **Xclip**. The Xclip will do exactly same as Pbcopy. But, the distro-hoppers who switched to Linux from Mac OS would miss this command-pair and still prefer to use them. No worries! This brief tutorial describes how to use Pbcopy and Pbpaste commands on Linux.

### Install Xclip / Xsel

Like I already said, Pbcopy and Pbpaste commands are not available in Linux. However, we can replicate the functionality of pbcopy and pbpaste commands using Xclip and/or Xsel commands via shell aliasing. Both Xclip and Xsel packages available in the default repositories of most Linux distributions. Please note that you need not to install both utilities. Just install any one of the above utilities.

To install them on Arch Linux and its derivatives, run:
```
$ sudo pacman xclip xsel

```

On Fedora:
```
$ sudo dnf xclip xsel

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt install xclip xsel

```

Once installed, you need create aliases for pbcopy and pbpaste commands. To do so, edit your **~/.bashrc** file:
```
$ vi ~/.bashrc

```

If you want to use Xclip, paste the following lines:
```
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

```

If you want to use xsel, paste the following lines in your ~/.bashrc file.
```
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

```

Save and close the file.

Next, run the following command to update the changes in ~/.bashrc file.
```
$ source ~/.bashrc

```

The ZSH users paste the above lines in **~/.zshrc** file.

### Use Pbcopy And Pbpaste Commands On Linux

Let us see some examples.

The pbcopy command will copy the text from stdin into clipboard buffer. For example, have a look at the following example.
```
$ echo "Welcome To OSTechNix!" | pbcopy

```

The above command will copy the text “Welcome To OSTechNix” into clipboard. You can access this content later and paste them anywhere you want using Pbpaste command like below.
```
$ echo `pbpaste`
Welcome To OSTechNix!

```

![](https://www.ostechnix.com/wp-content/uploads/2018/07/pbcopy-and-pbpaste-commands-in-action.png)

Here are some other use cases.

I have a file named **file.txt** with the following contents.
```
$ cat file.txt
Welcome To OSTechNix!

```

You can directly copy the contents of a file into a clipboard as shown below.
```
$ pbcopy < file.txt

```

Now, the contents of the file is available in the clipboard as long as you updated with another file’s contents.

To retrieve the contents from clipboard, simply type:
```
$ pbpaste
Welcome To OSTechNix!

```

You can also send the output of any Linux command to clip board using pipeline character. Have a look at the following example.
```
$ ps aux | pbcopy

```

Now, type “pbpaste” command at any time to display the output of “ps aux” command from the clipboard.
```
$ pbpaste

```

![](https://www.ostechnix.com/wp-content/uploads/2018/07/pbcopy-and-pbpaste-commands-2.png)

There is much more you can do with Pbcopy and Pbpaste commands. I hope you now got a basic idea about these commands.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-use-pbcopy-and-pbpaste-commands-on-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
