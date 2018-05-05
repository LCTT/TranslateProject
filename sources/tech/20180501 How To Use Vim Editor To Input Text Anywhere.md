How To Use Vim Editor To Input Text Anywhere
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/vim-anywhere-720x340.png)

Howdy Vim users! Today, I have come up with a good news to all of you. Say hello to **Vim-anywhere** , a simple script that allows you to use the Vim editor to input text anywhere in your Linux box. That means you can simply invoke your favorite Vim editor, type whatever you want and paste the text on any application or on a website. The text will be available in your clipboard until you restart your system. This utility is absolutely useful for those who love to use the Vim keybindings often in non-vim environment.

### Install Vim-anywhere in Linux

The Vim-anywhere utility will work on any GNOME based (or derivatives) Linux distributions. Also, make sure you have installed the following prerequisites.

  * Curl
  * Git
  * gVim
  * xclip



For instance, you can those utilities in Ubuntu as shown below.
```
$ sudo apt install curl git vim-gnome xclip

```

Then, run the following command to install Vim-anywhere:
```
$ curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash

```

Vim-anywhere has been installed. Now let us see how to use it.

### Use Vim Editor To Input Text Anywhere

Let us say you need to create a word document. But you’re much more comfortable using Vim editor than LibreOffice writer. No problem, this is where Vim-anywhere comes in handy. It automates the entire process. It simply invokes the Vim editor, so you can write whatever you want in it and paste it in the .doc file.

Let me show you an example. Open LibreOffice writer or any graphical text editor of your choice. Then, open Vim-anywhere. To do so, simply press **CTRL+ALT+V**. It will open the gVim editor. Press “i” to switch to interactive mode and input the text. Once done, save and close it by typing **:wq**.

![][2]

The text will be available in the clipboard until you restart the system. After you closed the editor, your previous application is refocused. Just press **CTRL+P** to paste the text in it.

![][3]

It’s just an example. You can even use Vim-anywhere to write something on an annoying web form or any other applications. Once Vim-anywhere invoked, it will open a buffer. Close it and its contents are automatically copied to your clipboard and your previous application is refocused.

The vim-anywhere utility will create a temporary file in **/tmp/vim-anywhere** when invoked. These temporary files stick around until you restart your system, giving you a temporary history.
```
$ ls /tmp/vim-anywhere

```

You can re-open your most recent file using command:
```
$ vim $( ls /tmp/vim-anywhere | sort -r | head -n 1 )

```

**Update Vim-anywhere**

Run the following command to update Vim-anywhere:
```
$ ~/.vim-anywhere/update

```

**Change keyboard shotcut**

The default keybinding to invoke Vim-anywhere is CTRL+ALT+V. You can change it to any custom keybinding using gconf tool.
```
$ gconftool -t str --set /desktop/gnome/keybindings/vim-anywhere/binding <custom binding>

```

**Uninstall Vim-anywhere**

Some of you might think that opening Vim editor each time to input text and paste the text back to another application might be pointless and completely unnecessary.

If you don’t find this utility useful, simply uninstall it using command:
```
$ ~/.vim-anywhere/uninstall

```



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-use-vim-editor-to-input-text-anywhere/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/05/vim-anywhere-1-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/vim-anywhere-2.png
