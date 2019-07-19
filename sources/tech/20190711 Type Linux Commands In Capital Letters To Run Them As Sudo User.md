[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Type Linux Commands In Capital Letters To Run Them As Sudo User)
[#]: via: (https://www.ostechnix.com/type-linux-commands-in-capital-letters-to-run-them-as-sudo-user/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Type Linux Commands In Capital Letters To Run Them As Sudo User
======

![Type Linux Commands In Capital Letters To Run Them As Sudo User][1]

The reason I love Linux community a lot is they create so many FUN projects which you rarely find in any other propriety operating systems. A while ago, we looked at a fun project named [**“Hollywood”**][2] which turns the Terminal into a Hollywood technical melodrama hacker interface in Ubuntu-like systems. There are few other utilities available, for example **cowsay** , **fortune** , **sl** and **toilet** (!) etc., to kill your free time and keep you entertained! They may not be useful, but these utilities are really entertaining and fun to use. Today, I stumbled upon yet another similar utility named **“SUDO”**. As the name implies, whenever you type Linux commands in capital letters, the SUDO utility will run them as sudo user! Meaning, you need not to type “sudo” in-front of the Linux commands you about to run. Cool, yeah?

### Install SUDO

* * *

**A word of caution:**

Before installing this (or any utility), take a look at the source code (Link given at the end) and see if there are suspicious/malicious code included to harm your system. Test it in a VM. If you like or found it useful, you can use it in your personal/production systems.

* * *

Git clone the SUDO repository:

```
$ git clone https://github.com/jthistle/SUDO.git
```

This command will clone the contents of SUDO GIT repository and saves them in a directory named “SUDO” in your current working directory.

```
Cloning into 'SUDO'...
remote: Enumerating objects: 42, done.
remote: Counting objects: 100% (42/42), done.
remote: Compressing objects: 100% (29/29), done.
remote: Total 42 (delta 17), reused 30 (delta 12), pack-reused 0
Unpacking objects: 100% (42/42), done.
```

Switch to SUDO directory:

```
$ cd SUDO/
```

And, install it using command:

```
$ ./install.sh
```

The command will add the following entries in your **~/.bashrc** file:

```
[...]
# SUDO - shout at bash to su commands
# Distributed under GNU GPLv2, @jthistle on github

shopt -s expand_aliases

IFS_=${IFS}
IFS=":" read -ra PATHS <<< "$PATH"

for i in "${PATHS[@]}"; do
    for j in $( ls "$i" ); do
        if [ ${j^^} != $j ] && [ $j != "sudo" ]; then
            alias ${j^^}="sudo $j"
        fi
    done
done

alias SUDO='sudo $(history -p !!)'

IFS=${IFS_}

# end SUDO
```

It will also take a backup of your **~/.bashrc** and save it as **~/.bashrc.old**. You can restore it if anything goes catastrophically wrong.

Finally, update the changes using command:

```
$ source ~/.bashrc
```

### Now, type Linux Commands in Capital letters to run them as Sudo user

Usually, we execute Linux commands that requires sudo/root privileges like below.

```
$ sudo mkdir /ostechnix
```

Right? Yes! The above command will create directory named “ostechnix” in root (/). Let us cancel this command using **Ctrl+c**.

Once SUDO is installed, you can **type any Linux command in capital without sudo** and run them. So, you can run the above command like below:

```
$ MKDIR /ostechnix

$ TOUCH /ostechnix/test.txt

$ LS /ostechnix
```

![][3]

Type Linux Commands In Capital Letters To Run Them As Sudo User

Please note that **it will not bypass the sudo password**. You still need to type sudo password to execute the given command. It will only help to avoid typing “sudo” in-front of each command.

* * *

**Related read:**

  * [**How To Run Particular Commands Without Sudo Password In Linux**][4]
  * [**How To Restore Sudo Privileges To A User**][5]
  * [**How To Grant And Remove Sudo Privileges To Users On Ubuntu**][6]
  * [**How To Find All Sudo Users In Your Linux System**][7]
  * [**How To Display Asterisks When You Type Password In Terminal**][8]
  * [**How To Change The Sudo Prompt In Linux**][9]



* * *

Of course, typing “sudo” will take only a few seconds, so it is not a big deal. I must tell this is just fun and USELESS project to pass time. If you don’t like it, go away and learn something useful. If you like it, give it a go and have fun!

**Resource:**

  * [**SUDO GitHub Repository**][10]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/type-linux-commands-in-capital-letters-to-run-them-as-sudo-user/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/sudo-720x340.png
[2]: https://www.ostechnix.com/turn-ubuntu-terminal-hollywood-technical-melodrama-hacker-interface/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/07/SUDO-in-action.gif
[4]: https://www.ostechnix.com/run-particular-commands-without-sudo-password-linux/
[5]: https://www.ostechnix.com/how-to-restore-sudo-privileges-to-a-user/
[6]: https://www.ostechnix.com/how-to-grant-and-remove-sudo-privileges-to-users-on-ubuntu/
[7]: https://www.ostechnix.com/find-sudo-users-linux-system/
[8]: https://www.ostechnix.com/display-asterisks-type-password-terminal/
[9]: https://www.ostechnix.com/change-sudo-prompt-linux-unix/
[10]: https://github.com/jthistle/SUDO
