GHLandy Translating

How to install Google Chrome Browser on Kali Linux
######

Contents

*   *   [1. Objective][7]
    *   [2. Requirements][8]
    *   [3. Difficulty][9]
    *   [4. Conventions][10]
    *   [5. Instructions][11]
        *   [5.1. Download Google Chrome][3]
        *   [5.2. Install Google Chrome][4]
        *   [5.3. Start Google Chrome][5]
        *   [5.4. Appendix][6]
            *   [5.4.1. Illegal Instruction][1]
            *   [5.4.2. Package libappindicator1 is not installed][2]

### Objective

The objective is to install Google Chrome web browser on Kali Linux. See an appendix for a possible issue troubleshooting.

### Requirements

Privileged access to your Kali Linux installation or Live system is required.

### Difficulty

EASY

### Conventions

*   **#** - requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
*   **$** - given command to be executed as a regular non-privileged user

### Instructions

### Download Google Chrome

To start, use `wget` command to download a latest Google Chrome debian package:
```
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

### Install Google Chrome

The easiest way to install google chrome on you Kali Linux is to by use of `gdebi` which will automatically download all depended packages.
```
# gdebi google-chrome-stable_current_amd64.deb
```

### Start Google Chrome

To start Google Chrome, open up a terminal and run `google-chrome` command:
```
$ google-chrome
```

### Appendix

#### Illegal Instruction

The `Illegal Instruction` error message appears when running the `google-chrome` command as privileged root user. Since by default Kali Linux's default user is root, we need to create a dummy non-privileged user eg. `linuxconfig`, and use this user to start Google Chrome browser:
```
# useradd -m -d /home/linuxconfig linuxconfig
# su linuxconfig -c google-chrome
```

#### Package libappindicator1 is not installed

```
dpkg: dependency problems prevent configuration of google-chrome-stable:
 google-chrome-stable depends on libappindicator1; however:
  Package libappindicator1 is not installed.
```
To resolve Google Chrome's dependencies problems use `gdebi` to install Google Chrome's debian package. See above. 

<center style="box-sizing: inherit;">
 ![Start google chrome as regular user on Kali Linux](https://linuxconfig.org/images/kali-linux-google-chome-browser-start.jpg) 
</center>

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux

作者：[Lubos Rendek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux
[1]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-4-1-illegal-instruction
[2]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-4-2-package-libappindicator1-is-not-installed
[3]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-1-download-google-chrome
[4]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-2-install-google-chrome
[5]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-3-start-google-chrome
[6]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-4-appendix
[7]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h1-objective
[8]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h2-requirements
[9]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h3-difficulty
[10]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h4-conventions
[11]:https://linuxconfig.org/how-to-install-google-chrome-browser-on-kali-linux#h5-instructions
