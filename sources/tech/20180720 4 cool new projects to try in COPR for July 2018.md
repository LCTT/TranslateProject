translating---geekpi

4 cool new projects to try in COPR for July 2018
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR is a [collection][1] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### Hledger

[Hledger][2] is a command-line program for tracking money or other commodities. It uses a simple, plain-text formatted journal for storing data and double-entry accounting. In addition to the command-line interface, hledger offers a terminal interface and a web client that can show graphs of balance on the accounts.
![][3]

#### Installation instructions

The repo currently provides hledger for Fedora 27, 28, and Rawhide. To install hledger, use these commands:
```
sudo dnf copr enable kefah/HLedger
sudo dnf install hledger

```

### Neofetch

[Neofetch][4] is a command-line tool that displays information about the operating system, software, and hardware. Its main purpose is to show the data in a compact way to take screenshots. You can configure Neofetch to display exactly the way you want, by using both command-line flags and a configuration file.
![][5]

#### Installation instructions

The repo currently provides Neofetch for Fedora 28. To install Neofetch, use these commands:
```
sudo dnf copr enable sysek/neofetch
sudo dnf install neofetch

```

### Remarkable

[Remarkable][6] is a Markdown text editor that uses the GitHub-like flavor of Markdown. It offers a preview of the document, as well as the option to export to PDF and HTML. There are several styles available for the Markdown, including an option to create your own styles using CSS. In addition, Remarkable supports LaTeX syntax for writing equations and syntax highlighting for source code.
![][7]

#### Installation instructions

The repo currently provides Remarkable for Fedora 28 and Rawhide. To install Remarkable, use these commands:
```
sudo dnf copr enable neteler/remarkable
sudo dnf install remarkable

```

### Aha

[Aha][8] (or ANSI HTML Adapter) is a command-line tool that converts terminal escape sequences to HTML code. This allows you to share, for example, output of git diff or htop as a static HTML page.
![][9]

#### Installation instructions

The [repo][10] currently provides aha for Fedora 26, 27, 28, and Rawhide, EPEL 6 and 7, and other distributions. To install aha, use these commands:
```
sudo dnf copr enable scx/aha
sudo dnf install aha

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-july-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:http://hledger.org/
[3]:https://fedoramagazine.org/wp-content/uploads/2018/07/hledger.png
[4]:https://github.com/dylanaraps/neofetch
[5]:https://fedoramagazine.org/wp-content/uploads/2018/07/neofetch.png
[6]:https://remarkableapp.github.io/linux.html
[7]:https://fedoramagazine.org/wp-content/uploads/2018/07/remarkable.png
[8]:https://github.com/theZiz/aha
[9]:https://fedoramagazine.org/wp-content/uploads/2018/07/aha.png
[10]:https://copr.fedorainfracloud.org/coprs/scx/aha/
