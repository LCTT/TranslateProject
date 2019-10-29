[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for October 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-october-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

4 cool new projects to try in COPR for October 2019
======

![][1]

[COPR][2] is a collection of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in COPR. If you’re new to using COPR, see the [COPR User Documentation][3] for how to get started.

### Nu

[Nu][4], or Nushell, is a shell inspired by PowerShell and modern CLI tools. Using a structured data based approach, Nu makes it easy to work with commands that output data, piping through other commands. The results are then displayed in tables that can be sorted or filtered easily and may serve as inputs for further commands. Finally, Nu provides several builtin commands, multiple shells and support for plugins.

#### Installation instructions

The [repo][5] currently provides Nu for Fedora 30, 31 and Rawhide. To install Nu, use these commands:

```
sudo dnf copr enable atim/nushell
sudo dnf install nushell
```

### NoteKit

[NoteKit][6] is a program for note-taking. It supports Markdown for formatting notes, and the ability to create hand-drawn notes using mouse. In NoteKit, notes are sorted and organized in a tree structure.

#### Installation instructions

The [repo][7] currently provides NoteKit for Fedora 29, 30, 31 and Rawhide. To install NoteKit, use these commands:

```
sudo dnf copr enable lyessaadi/notekit
sudo dnf install notekit
```

### Crow Translate

[Crow Translate][8] is a program for translating. It can translate text as well as speak both the input and result, and offers a command line interface as well. For translation, Crow Translate uses Google, Yandex or Bing translate API.

#### Installation instructions

The [repo][9] currently provides Crow Translate for Fedora 30, 31 and Rawhide, and for Epel 8. To install Crow Translate, use these commands:

```
sudo dnf copr enable faezebax/crow-translate
sudo dnf install crow-translate
```

### dnsmeter

[dnsmeter][10] is a command-line tool for testing performance of a nameserver and its infrastructure. For this, it sends DNS queries and counts the replies, measuring various statistics. Among other features, dnsmeter can use different load steps, use payload from PCAP files and spoof sender addresses.

#### Installation instructions

The repo currently provides dnsmeter for Fedora 29, 30, 31 and Rawhide, and EPEL 7. To install dnsmeter, use these commands:

```
sudo dnf copr enable @dnsoarc/dnsmeter
sudo dnf install dnsmeter
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-october-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html#
[4]: https://github.com/nushell/nushell
[5]: https://copr.fedorainfracloud.org/coprs/atim/nushell/
[6]: https://github.com/blackhole89/notekit
[7]: https://copr.fedorainfracloud.org/coprs/lyessaadi/notekit/
[8]: https://github.com/crow-translate/crow-translate
[9]: https://copr.fedorainfracloud.org/coprs/faezebax/crow-translate/
[10]: https://github.com/DNS-OARC/dnsmeter
