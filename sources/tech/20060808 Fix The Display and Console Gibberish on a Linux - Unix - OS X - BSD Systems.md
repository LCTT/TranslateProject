translating by lujun9972
Fix The Display and Console Gibberish on a Linux / Unix / OS X / BSD Systems
======
Sometimes my R & D result in the weird output on the screen。For example，accidentally I run cat command over binary file - cat /sbin/*。You will be not able to access your bash/ksh/zsh based terminal。It will be full of wired character sequences that can lock down your display。These characters will hide what you type or character displayed into strange symbols。To clear gibberish all over the screen use the following method。This article describes how to really clear the terminal screen or reset terminal in Linux or Unix-like system。


## The clear command

The clear command clears your screen including its scrollback buffer。
`$ clear`
You can press CTRL+L to clear screen too。However，clear command won't clear the terminal screen。Use the following methods to really clear the terminal so you get a get back a good working terminal。

## How to fix the display using the rest command

Here is my console with gibberish all over the screen：
[![Fig.01：Bash fix the display][1]][2]

To fix the display just type the reset command。It will initialization terminal again for you：
`$ reset`
OR
`$ tput reset`

If reset command failed to work type the following command to restore the session to a normal state：
`$ stty sane`

Press CTRL + L to clear the screen (or type the clear command)：
`$ clear`

## Use ANSI escape sequence to really clear the bash terminal

Another option is to type the following ANSI escape sequence：
```
clear
echo -e "\033c"
```

Sample outputs from both commands：
[![Animated gif 01：Fix Unix Console Gibberish Command Demo][3]][4]
Read man pages of stty and reset for more information stty(1)，reset(1)，bash(1)


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/bash-fix-the-display.html

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/tips/2006/08/bash-fix-terminal.png
[2]:https://www.cyberciti.biz/media/uploads/tips/2006/08/bash-fix-terminal.png
[3]:https://www.cyberciti.biz/media/new/tips/2006/08/unix-linux-console-gibberish.gif
[4]:https://www.cyberciti.biz/tips/bash-fix-the-display.html/unix-linux-console-gibberish
