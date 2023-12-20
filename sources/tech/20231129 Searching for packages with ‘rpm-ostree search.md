[#]: subject: "Searching for packages with ‘rpm-ostree search’"
[#]: via: "https://fedoramagazine.org/searching-for-packages-with-rpm-ostree-search/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Searching for packages with ‘rpm-ostree search’
======

![][1]

Photo by [Markus Winkler][2] on [Unsplash][3]

This article descibes how to find an application to add to your ostree based system (such as Silverblue and Kinoite) using rpm-ostree.

One of the main benefits of the Fedora ostree-based systems is the immutability of the system. Not only is the image read-only, it’s also pre-built on the Fedora servers. Thus, updating a running system downloads the update deltas (that is, only the differences) and patches the system. This makes the many installations identical by default.

A pre-built image will be good enough for most people, since users are normally encouraged to use both flatpaks for applications and toolbox for development tasks. But what if the specific application doesn’t fit this and the user requires installing applications on the host system?

Well, in this case the option is to overlay the packages on the system, creating a new image locally with the added package on top of the standard image.

But, how do I know what package I want to install? What about search functionality?

### The old way ( _toolbox_ \+ _dnf search_ )

While it has always been possible to search for packages via the PackageKit-enabled Software Center (such as GNOME Software or KDE Discover), it has been a bit harder to do so via CLI.

Since _rpm-ostree_ didn’t use to offer a search command, the common way to search has been to enter a toolbox with _toolbox enter_ and search using _dnf search <search term>_. This has the downside of requiring the same repositories be enabled in the toolbox in order to get proper search results.

Example for searching for _neofetch_ :

```

    $ toolbox enter
    <Note that at this point the toolbox command might request creating a toolbox, which might involve downloading a container image>
    ⬢[fedora@toolbox ~]$ dnf search neofetch
    <snip>
    === Name Exactly Matched: neofetch ===
    neofetch.noarch : CLI system information tool written in Bash
    === Summary Matched: neofetch ===
    fastfetch.x86_64 : Like neofetch, but much faster because written in c

```

### The new way ( _rpm-ostree search_ )

Since [version 2023.6][4], _rpm-ostree_ supports the “search” verb allowing users to use rpm-ostree to search for available packages. An example command for this is:

```

     rpm-ostree search *kernel

```

To use the search verb, first make certain you are using _rpm-ostree_ version 2023.6 or later:

```

    $ rpm-ostree --version
    rpm-ostree:
     Version: '2023.8'
     Git: 9a99d0af32640b234318815a256a2d11e35fa64c
     Features:
      - rust
      - compose
      - container
      - fedora-integration

```

If the version requirement is satisfied, you should be able to run _rpm-ostree search <search terms>_.

Here is an example, searching for neofetch with _rpm-ostree search_ :

```

    $ rpm-ostree search neofetch

    ===== Name Matched =====
    neofetch : CLI system information tool written in Bash

    ===== Summary Matched =====
    fastfetch : Like neofetch, but much faster because written in c

```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/searching-for-packages-with-rpm-ostree-search/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/rpm-ostree_search-816x345.jpg
[2]: https://unsplash.com/@markuswinkler?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/magnifying-glass-on-white-table-afW1hht0NSs?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://github.com/coreos/rpm-ostree/releases/tag/v2023.6
