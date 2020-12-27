[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR from December 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-december/)
[#]: author: (Jakub Kadlčík https://fedoramagazine.org/author/frostyx/)

4 cool new projects to try in COPR from December 2020
======

![][1]

COPR is a [collection][2] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open-source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in COPR. If you’re new to using COPR, see the [COPR User Documentation][3] for how to get started.

## [][4] Blanket

[Blanket][5] is an application for playing background sounds, which may potentially improve your focus and increase your productivity. Alternatively, it may help you relax and fall asleep in a noisy environment. No matter what time it is or where you are, Blanket allows you to wake up while birds are chirping, work surrounded by friendly coffee shop chatter or distant city traffic, and then sleep like a log next to a fireplace while it is raining outside. Other popular choices for background sounds such as pink and white noise are also available.

![][6]

### [][7] Installation instructions

The [repo][8] currently provides Blanket for Fedora 32 and 33. To install it, use these commands:

```
sudo dnf copr enable tuxino/blanket
sudo dnf install blanket
```

## [][9] k9s

[k9s][10] is a command-line tool for managing Kubernetes clusters. It allows you to list and interact with running pods, read their logs, dig through used resources, and overall make the Kubernetes life easier. With its extensibility through plugins and customizable UI, _k9s_ is welcoming to power-users.

![][11]

For [many more preview screenshots][12], please see the [project page][10].

### [][13] Installation instructions

The [repo][14] currently provides _k9s_ for Fedora 32, 33, and Fedora Rawhide as well as EPEL 7, 8, Centos Stream, and others. To install it, use these commands:

```
sudo dnf copr enable luminoso/k9s
sudo dnf install k9s
```

## [][15] rhbzquery

[rhbzquery][16] is a simple tool for querying the Fedora Bugzilla instance. It provides an interface for specifying the search query but it doesn’t list results in the command-line. Instead, _rhbzquery_ generates a Bugzilla URL and opens it in a web browser.

![][17]

### [][18] Installation instructions

The [repo][19] currently provides *rhbzquery *for Fedora 32, 33, and Fedora Rawhide. To install it, use these commands:

```
sudo dnf copr enable petersen/rhbzquery
sudo dnf install rhbzquery
```

## [][20] gping

[gping][21] is a more visually intriguing alternative to the standard _ping_ command, as it shows results in a graph. It is also possible to ping multiple hosts at the same time to easily compare their response times.

![][22]

### [][23] Installation instructions

The [repo][24] currently provides gping for Fedora 32, 33, and Fedora Rawhide as well as for EPEL 7 and 8. To install it, use these commands:

```
sudo dnf copr enable atim/gping
sudo dnf install gping
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-december/

作者：[Jakub Kadlčík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#blanket
[5]: https://github.com/rafaelmardojai/blanket
[6]: https://github.com/FrostyX/fedora-magazine/raw/main/img/blanket.png
[7]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions
[8]: https://copr.fedorainfracloud.org/coprs/tuxino/blanket/
[9]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#k9s
[10]: https://k9scli.io/
[11]: https://github.com/FrostyX/fedora-magazine/raw/main/img/k9s.png
[12]: https://k9scli.io/#-previews
[13]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions-1
[14]: https://copr.fedorainfracloud.org/coprs/luminoso/k9s/
[15]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#rhbzquery
[16]: https://github.com/juhp/rhbzquery
[17]: https://github.com/FrostyX/fedora-magazine/raw/main/img/rhbzquery.png
[18]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions-2
[19]: https://copr.fedorainfracloud.org/coprs/petersen/rhbzquery/
[20]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#gping
[21]: https://github.com/orf/gping
[22]: https://github.com/FrostyX/fedora-magazine/raw/main/img/gping.png
[23]: https://github.com/FrostyX/fedora-magazine/blob/main/2020-december.md#installation-instructions-4
[24]: https://copr.fedorainfracloud.org/coprs/atim/gping
