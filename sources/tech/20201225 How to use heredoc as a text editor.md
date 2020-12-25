[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use heredoc as a text editor)
[#]: via: (https://opensource.com/article/20/12/heredoc)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use heredoc as a text editor
======
This obscure terminal feature provides a text editor in a pinch.
![woman on laptop sitting at the window][1]

There’s a somewhat obscure feature in Linux and Unix shells that allows you to open a sort of do-while loop for the [cat][2] command. It’s called the _heredoc_, and it enables you to have, more or less, a text editor no matter what shell you’re using. The syntax is:


```
`$ cat << EOF >> example.txt`
```

The string in the middle is, essentially, a conditional that stops the loop. That is, if you type alone on a line, the loop ends. During the loop, whatever you type into your terminal is piped into the destination file (in this case).

### Installing

As long as you have a terminal, you already have the ability to initiate a heredoc. I’ve used this syntactical trick in [Bash][3], [tsch][4], and Korn shell.

### Using heredoc

To open a heredoc "session", you use the cat command with redirection that points first to cat with a terminating string (common convention is **EOF** for "End Of File", but it can actually be anything). After the terminating keyword, you redirect your output to a destination file. You're then able to type directly into your terminal, using most common shell keyboard shortcuts to navigate through your work. Your session ends when you type your designated terminating string on a line by itself. You know you're in a heredoc loop by the unique prompt (usually the **&gt;** character).


```
$ cat &lt;&lt; EOF &gt;&gt; example.txt
&gt; Everything you type here will be placed into example.txt when I type EOF on a line by itself. Until then, you can type...
&gt;
&gt; whatever...
&gt;
&gt; you want to type.
&gt;
&gt; EOF
$  
```

Everything you enter while your terminal is waiting for **EOF** is placed into the destination file. Prompt characters are omitted, and EOF itself is not part of the file.


```
Everything you type here will be placed into example.txt when I type EOF on a line by itself. Until then, you can type...

whatever...

you want to type.
```

Realistically, you’re probably not going to use heredoc syntax as a substitute for a good text editor. It's a great quick hack to enter more than one line, but more than 10 lines or so starts to strain its usefulness. For instance, you can’t go up to edit previous lines without triggering your shell’s [history][5] function. Depending on your shell and how it's configured, you may be able to go up, then down to recall your text, and then move back through your text with **Ctrl+B**. 

Most features of your shell work as expected, but there’s probably no undo and very little error recovery.

And besides, even the most minimal of installs are likely to have at least [Vi][6] or [ed][7] installed.

And yet heredoc is still useful! It's more flexible than **echo**, and when you’re working on a shell script, it's indispensable. For instance, imagine you’re writing an installer script so you can automate the install of a set of custom applications. One of the applications isn’t distributed with a `.dekstop` file, so it does not appear in your Application menu. To fix this, you decide to generate a `.desktop` file at install time.

Rather than writing a `.desktop` file and carrying it around as an external dependency for your install script, you could use heredoc in your install script itself:


```
#!/bin/sh

VERSION=${VERSION:-x.y.z}
PKGNAM=${VERSION:-example}
PKG="${PKGNAM}"-"${VERSION}"-`arch`.tgz

# download package
wget "${PKG}"
tar txvf "${PKG}"

# use here doc to create missing .desktop file
cat &lt;&lt; EOF &gt;&gt; $HOME/.local/share/applications/example.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name="${PKGNAM}"
Comment="${PKGNAM}"
Exec="${PKGNAM}" %F
EOF

# insert the rest of an install script...
```

You have automated text entry into a file, no text editor involved (except the one you use to write your script, obviously). Here’s what the resulting `.desktop` file looks like:


```
[Desktop Entry]
Version=1.0
Type=Application
Name=example
Comment=example
Exec=example %F
```

As you can see, you can use variables within the heredoc, and they’re correctly resolved. The `EOF` string doesn’t appear in the file; it only signals the end of the heredoc.

### Better than echo

The heredoc technique is generally considered easier than `echo` or [printf][8] because once you’re "in" the document, you’re free to do whatever you want. It’s liberating in that sense, but it’s limited compared to a proper text editor.

Use heredoc for quick notes and for shell scripts, and never puzzle over how to dynamically generate configuration files again.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/heredoc

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/article/19/2/getting-started-cat-command
[3]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[4]: https://opensource.com/article/20/8/tcsh
[5]: https://opensource.com/article/20/6/bash-history-commands
[6]: https://opensource.com/article/19/3/getting-started-vim
[7]: https://opensource.com/article/20/12/gnu-ed
[8]: https://opensource.com/article/20/8/printf
