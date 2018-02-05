translating---geekpi

How To Turn On/Off Colors For ls Command In Bash On a Linux/Unix
======

How do I turn on or off file name colors (ls command colors) in bash shell on a Linux or Unix like operating systems?

Most modern Linux distributions and Unix systems comes with alias that defines colors for your file. However, ls command is responsible for displaying color on screen for files, directories and other file system objects.

By default, color is not used to distinguish types of files. You need to pass --color option to the ls command on Linux. If you are using OS X or BSD based system pass -G option to the ls command. The syntax is as follows to turn on or off colors.

#### How to turn off colors for ls command

Type the following command
`$ ls --color=none`
Or just remove alias with the unalias command:
`$ unalias ls`
Please note that the following bash shell aliases are defined to display color with the ls command. Use combination of [alias command][1] and [grep command][2] as follows:
`$ alias | grep ls`
Sample outputs
```
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
```

#### How to turn on colors for ls command

Use any one of the following command:
```
$ ls --color=auto
$ ls --color=tty
```
[Define bash shell aliases ][3]if you want:
`alias ls='ls --color=auto'`
You can add or remove ls command alias to the ~/.bash_profile or [~/.bashrc file][4]. Edit file using a text editor such as vi command:
`$ vi ~/.bashrc`
Append the following code:
```
# my ls command aliases #
alias ls = 'ls --color=auto'
```

[Save and close the file in Vi/Vim text editor][5].

#### A note about *BSD/macOS/Apple OS X ls command

Pass the -G option to ls command to enable colorized output on a {Free,Net,Open}BSD or macOS and Apple OS X Unix family of operating systems:
`$ ls -G`
Sample outputs:
[![How to enable colorized output for the ls command in Mac OS X Terminal][6]][7]
How to enable colorized output for the ls command in Mac OS X Terminal

#### How do I skip colorful ls command output temporarily?

You can always [disable bash shell aliases temporarily][8] using any one of the following syntax:
`\ls
/bin/ls
command ls
'ls'`


#### About the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][9], [Facebook][10], [Google+][11].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-turn-on-or-off-colors-in-bash/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html (See Linux/Unix alias command examples for more info)
[2]:https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/ (See Linux/Unix grep command examples for more info)
[3]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
[4]:https://bash.cyberciti.biz/guide/~/.bashrc
[5]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[6]:https://www.cyberciti.biz/media/new/faq/2016/01/color-ls-for-Mac-OS-X.jpg
[7]:https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
[8]:https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
