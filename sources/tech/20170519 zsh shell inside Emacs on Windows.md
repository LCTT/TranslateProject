[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (zsh shell inside Emacs on Windows)
[#]: via: (https://www.onwebsecurity.com/configuration/zsh-shell-inside-emacs-on-windows.html)
[#]: author: (Peter Mosmans https://www.onwebsecurity.com/)

zsh shell inside Emacs on Windows
======

![zsh shell inside Emacs on Windows][5]

The most obvious advantage of running a cross-platform shell (for example Bash or zsh) is that you can use the same syntax and scripts on multiple platforms. Setting up (alternative) shells on Windows can be pretty tricky, but the small investment is well worth the reward.

The MSYS2 subsystem allows you to run shells like Bash or zsh on Windows. An important part of MSYS2 is making sure that the search paths are all pointing to the MSYS2 subsystem: There are a lot of dependencies.

Bash is the default shell once MSYS2 is installed; zsh can be installed using the package manager:

```
pacman -Sy zsh
```

Setting zsh as default shell can be done by modifying the ` /etc/passwd` file, for instance:

```
mkpasswd -c | sed -e 's/bash/zsh/' | tee -a /etc/passwd
```

This will change the default shell from bash to zsh.

Running zsh under Emacs on Windows can be done by modifying the ` shell-file-name` variable, and pointing it to the zsh binary from the MSYS2 subsystem. The shell binary has to be somewhere in the Emacs ` exec-path` variable.

```
(setq shell-file-name (executable-find "zsh.exe"))
```

Don't forget to modify the PATH environment variable for Emacs, as the MSYS2 paths should be resolved before Windows paths. Using the same example, where MSYS2 is installed under

```
c:\programs\msys2
```

:

```
(setenv "PATH" "C:\\programs\\msys2\\mingw64\\bin;C:\\programs\\msys2\\usr\\local\\bin;C:\\programs\\msys2\\usr\\bin;C:\\Windows\\System32;C:\\Windows")
```

After setting these two variables in the Emacs configuration file, running

```
M-x shell
```

in Emacs should bring up the familiar zsh prompt.

Emacs' terminal settings (eterm) are different than MSYS2' standard terminal settings (xterm-256color). This means that some plugins or themes (prompts) might not work - especially when using oh-my-zsh.

Detecting whether zsh is started under Emacs is easy, using the variable

```
$INSIDE_EMACS
```

. This codesnippet in

```
.zshrc
```

(which will be sourced for interactive shells) only enables the git plugin when being run in Emacs, and changes the theme

```
# Disable some plugins while running in Emacs
if [[ -n "$INSIDE_EMACS" ]]; then
 plugins=(git)
 ZSH_THEME="simple"
else
 ZSH_THEME="compact-grey"
fi
```

. This codesnippet in(which will be sourced for interactive shells) only enables the git plugin when being run in Emacs, and changes the theme

By adding the ` INSIDE_EMACS` variable to the local ` ~/.ssh/config` as ` SendEnv` variable...

```
Host myhost
SendEnv INSIDE_EMACS
```

... and to a ssh server as ` AcceptEnv` variable in ` /etc/ssh/sshd_config` ...

```
AcceptEnv LANG LC_* INSIDE_EMACS
```

... this even works when ssh'ing inside an Emacs shell session to another ssh server, running zsh. When ssh'ing in the zsh shell inside Emacs on Windows, using the parameters ` -t -t` forces pseudo-tty allocation (which is necessary, as Emacs on Windows don't have a true tty).

Cross-platform, open-source goodyness...

--------------------------------------------------------------------------------

via: https://www.onwebsecurity.com/configuration/zsh-shell-inside-emacs-on-windows.html

作者：[Peter Mosmans][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.onwebsecurity.com/
[b]: https://github.com/lujun9972
[1]: https://www.onwebsecurity.com/category/configuration.html
[2]: https://www.onwebsecurity.com/tag/emacs.html
[3]: https://www.onwebsecurity.com/tag/msys2.html
[4]: https://www.onwebsecurity.com/tag/zsh.html
[5]: https://www.onwebsecurity.com//images/zsh-shell-inside-emacs-on-windows.png
