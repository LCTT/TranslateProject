[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Arch-Wiki-Man – A Tool to Browse The Arch Wiki Pages As Linux Man Page from Offline)
[#]: via: (https://www.2daygeek.com/arch-wiki-man-a-tool-to-browse-the-arch-wiki-pages-as-linux-man-page-from-offline/)
[#]: author: ([Prakash Subramanian](https://www.2daygeek.com/author/prakash/))
[#]: url: ( )

Arch-Wiki-Man – A Tool to Browse The Arch Wiki Pages As Linux Man Page from Offline
======

Getting internet is not a big deal now a days, however there will be a limitation on technology.

I was really surprise to see the technology growth but in the same time there will be fall in everywhere.

Whenever you search anything about other Linux distributions most of the time you will get a third party links in the first place but for Arch Linux every time you would get the Arch Wiki page for your results.

As Arch Wiki has most of the solution other than third party websites.

As of now, you might used web browser to get a solution for your Arch Linux system but you no need to do the same for now.

There is a solution is available in command line to perform this action much faster way and the utility called arch-wiki-man. If you are Arch Linux lover, i would suggest you to read **[Arch Linux Post Installation guide][1]** which helps you to tweak your system for day to day use.

### What is arch-wiki-man?

[arch-wiki-man][2] tool allows user to search the arch wiki pages right from the command line (CLI) instantly without internet connection. It allows user to access and search an entire wiki pages as a Linux man page.

Also, you no need to switch to GUI. Updates are pushed automatically every two days so, your local copy of the Arch Wiki pages will be upto date. The tool name is `awman`. awman stands for Arch Wiki Man.

We had already wrote similar kind of topic called **[Arch Wiki Command Line Utility][3]** (arch-wiki-cli) which allows user search Arch Wiki from command line but make sure you should have internet to use this utility.

### How to Install arch-wiki-man tool?

arch-wiki-man utility is available in AUR repository so, we need to use AUR helper to install it. There are many AUR helper is available and we had wrote an article about **[Yaourt AUR helper][4]** and **[Packer AUR helper][5]** which are very famous AUR helper.

```
$ yaourt -S arch-wiki-man

or

$ packer -S arch-wiki-man
```

Alternatively we can install it using npm package manager. Make sure, you should have installed **[NodeJS][6]** on your system. If so, run the following command to install it.

```
$ npm install -g arch-wiki-man
```

### How to Update the local Arch Wiki copy?

As updated previously, updates are pushed automatically every two days and it can be done by running the following command.

```
$ sudo awman-update
[sudo] password for daygeek:
[email protected] /usr/lib/node_modules/arch-wiki-man
└── [email protected]

arch-wiki-md-repo has been successfully updated or reinstalled.
```

awman-update is faster and more convenient method to get the update. However, you can get the updates by reinstalling this package using the following command.

```
$ yaourt -S arch-wiki-man

or

$ packer -S arch-wiki-man
```

### How to Use Arch Wiki from command line?

It’s very simple interface and easy to use. To search anything, just run `awman` followed by the search term. The general syntax is as follow.

```
$ awman Search-Term
```

### How to Search Multiple Matches?

If you would like to list all the results titles comes with `installation` string, run the following command format. If the output comes with multiple results then you will get a selection menu to navigate each item.

```
$ awman installation
```

![][8]

Detailed page screenshot.
![][9]

### Search a given string in Titles & Descriptions

The `-d` or `--desc-search` option allow users to search a given string in titles and descriptions.

```
$ awman -d mirrors

or

$ awman --desc-search mirrors
? Select an article: (Use arrow keys)
❯ [1/3] Mirrors: Related articles
 [2/3] DeveloperWiki-NewMirrors: Contents
 [3/3] Powerpill: Powerpill is a pac
```

### Search a given string in Contents

The `-k` or `--apropos` option allow users to search a given string in content as well. Make a note, this option significantly slower your search as this scan entire wiki page content.

```
$ awman -k openjdk

or

$ awman --apropos openjdk
? Select an article: (Use arrow keys)
❯ [1/26] Hadoop: Related articles
 [2/26] XDG Base Directory support: Related articles
 [3/26] Steam-Game-specific troubleshooting: See Steam/Troubleshooting first.
 [4/26] Android: Related articles
 [5/26] Elasticsearch: Elasticsearch is a search engine based on Lucene. It provides a distributed, mul..
 [6/26] LibreOffice: Related articles
 [7/26] Browser plugins: Related articles
(Move up and down to reveal more choices)
```

### Open the search results in a web browser

The `-w` or `--web` option allow users to open the search results in a web browser.

```
$ awman -w AUR helper

or

$ awman --web AUR helper
```

![][10]

### Search in other languages

The `-w` or `--web` option allow users to open the search results in a web browser. To see a list of supported language, run the following command.

```
$ awman --list-languages
arabic
bulgarian
catalan
chinesesim
chinesetrad
croatian
czech
danish
dutch
english
esperanto
finnish
greek
hebrew
hungarian
indonesian
italian
korean
lithuanian
norwegian
polish
portuguese
russian
serbian
slovak
spanish
swedish
thai
ukrainian
```

Run the awman command with your preferred language to see the results with different language other than English.

```
$ awman -l chinesesim deepin
```

![][11]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/arch-wiki-man-a-tool-to-browse-the-arch-wiki-pages-as-linux-man-page-from-offline/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/arch-linux-post-installation-30-things-to-do-after-installing-arch-linux/
[2]: https://github.com/greg-js/arch-wiki-man
[3]: https://www.2daygeek.com/search-arch-wiki-website-command-line-terminal/
[4]: https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[5]: https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[6]: https://www.2daygeek.com/install-nodejs-on-ubuntu-centos-debian-fedora-mint-rhel-opensuse/
[7]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-1.png
[9]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-2.png
[10]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-3.png
[11]: https://www.2daygeek.com/wp-content/uploads/2018/11/arch-wiki-man-%E2%80%93-A-Tool-to-Browse-The-Arch-Wiki-Pages-As-Linux-Man-page-from-Offline-4.png
