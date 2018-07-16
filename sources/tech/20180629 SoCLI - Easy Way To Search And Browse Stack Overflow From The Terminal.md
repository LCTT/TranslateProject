SoCLI – Easy Way To Search And Browse Stack Overflow From The Terminal
======
Stack Overflow is the largest, most trusted online community for developers to learn, share​ ​their programming ​knowledge, and build their careers. It’s world’s largest developer community and allows users to ask and answer questions. It’s open alternative to earlier question and answer sites such as Experts-Exchange.

It’s my preferred website, i have learned many program stuffs also i found many Linux related stuffs as well. Even i asked many questions and answered few questions too when i have time.

Today i have stumbled upon good CLI utility called SoCLI & how2 both are used to browse stackoverflow website from the terminal easily and it’s very helpful when you doesn’t have GUI. Today we are going to discuss about SoCLI and will discuss about how2 in upcoming article.

**Suggested Read :**
**(#)** [How To Search The Arch Wiki Website Right From Terminal][1]
**(#)** [Googler – Google Search from the command line on Linux][2]
**(#)** [Buku – A Powerful Command-line Bookmark Manager for Linux][3]

This might have very useful for NIX guys, whoever spending most of the time in CLI.

[SoCLI][4] is a Stack overflow command line interface written in python. It’s allows you to search and browse stack overflow from the terminal.

### SoCLI Featues:

  * Verity of search is available like Quick Search, Manual Search & interactive Search
  * Coloured interface
  * Question stats view
  * Topic Based Search using tag
  * Can view user profiles
  * Can create a new question via the web browser
  * Can open the page in a browser



### How to Install Python

Make sure your system should have python-pip package in order to install SoCLI. pip is a python module bundled with setuptools, it’s one of the recommended tool for installing Python packages in Linux.

For **`Debian/Ubuntu`** , use [apt-get command][5] or [apt command][6] to install pip.
```
$ sudo apt install python-pip

```

For **`RHEL/CentOS`** , use [YUM command][7] to install pip.
```
$ sudo yum install python-pip python-devel

```

For **`Fedora`** , use [dnf command][8] to install pip.
```
$ sudo dnf install python-pip

```

For **`Arch Linux`** , use [pacman command][9] to install pip.
```
$ sudo pacman -S python-pip

```

For **`openSUSE`** , use [Zypper Command][10] to install pip.
```
$ sudo pacman -S python-pip

```

### How to Install SoCLI

Simple use pip command to install socli.
```
$ sudo pip install socli

```

### How to Update SoCLI

Run the following command to update your existing version of socli to the newest version to avail latest features.
```
$ sudo pip install --upgrade socli

```

### How to Use SoCLI

Simple fire the socli command on terminal to start explorer stackoverflow from the Linux command line. It’s offering varies arguments which will speedup your search even more faster.

Common syntax for **`SoCLI`**
```
socli [Arguments] [Search Query]

```

### Quick Search

The following command will search for the given query `command to check apache active connections` and displays the first most voted question in Stack Overflow with its most voted answer.
```
$ socli command to check apache active connections

```

![][12]

### Interactive Search

To enable interactive search, use `-iq` arguments followed by your search query.

The following command will search for the given query `delete matching string` and print a list of questions from Stack Overflow.
```
$ socli -iq delete matching string

```

![][13]

It will allows users to choose any of the questions interactively by hitting questing number in end of the results. In my case i have choose a question `2` then it will display the complete description of the chosen question with its most voted answer.
![][14]

Use `UP` and `DOWN` arrow keys to navigate to other answers. Press `LEFT` arrow key to go back to the list of questions.

### Manual Search

SoCLI allows you to display mentioned question number for given query. The following command will search for the given query `netstat command examples` in Stack Overflow and displays the second question full information for given query alike quick search.
```
$ socli -r 2 -q netstat command examples

```

![][15]

### Topic Based Search

SoCLI allows topic based search by using specific tags. Just mention the specific tags using `-t` arguments and followed by search query `command to increase jvm heap memory`.
```
$ socli -t linux -q command to increase jvm heap memory

```

![][16]

For multiple tags, Just separate them with a comma.
```
$ socli -t linux,unix -q grep

```

### Post a New Question

If you can’t find an answer for your question in Stack Overflow? don’t worry, post a new question by running following command.
```
$ socli -n

```

It will open the new question page of Stack Overflow in the web browser for you to create a new question.

### Man Page

To know more options & arguments about SoCLI, navigate to help section.
```
$ socli -h

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/socli-search-and-browse-stack-overflow-from-linux-terminal/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/search-arch-wiki-website-command-line-terminal/
[2]:https://www.2daygeek.com/googler-google-search-from-the-command-line-on-linux/
[3]:https://www.2daygeek.com/buku-command-line-bookmark-manager-linux/
[4]:https://github.com/gautamkrishnar/socli
[5]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[6]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[7]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[9]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[12]:https://www.2daygeek.com/wp-content/uploads/2017/08/socli-search-and-browse-stack-overflow-from-command-line-1.png
[13]:https://www.2daygeek.com/wp-content/uploads/2017/08/socli-search-and-browse-stack-overflow-from-command-line-2.png
[14]:https://www.2daygeek.com/wp-content/uploads/2017/08/socli-search-and-browse-stack-overflow-from-command-line-2a.png
[15]:https://www.2daygeek.com/wp-content/uploads/2017/08/socli-search-and-browse-stack-overflow-from-command-line-3.png
[16]:https://www.2daygeek.com/wp-content/uploads/2017/08/socli-search-and-browse-stack-overflow-from-command-line-4.png
