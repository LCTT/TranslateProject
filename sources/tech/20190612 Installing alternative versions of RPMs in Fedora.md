[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installing alternative versions of RPMs in Fedora)
[#]: via: (https://fedoramagazine.org/installing-alternative-rpm-versions-in-fedora/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

Installing alternative versions of RPMs in Fedora
======

![][1]

[Modularity][2] enables Fedora to provide alternative versions of RPM packages in the repositories. Several different applications, language runtimes, and tools are available in multiple versions, build natively for each Fedora release.

The Fedora Magazine has already covered [Modularity in Fedora 28 Server Edition][3] about a year ago. Back then, it was just an optional repository with additional content, and as the title hints, only available to the Server Edition. A lot has changed since then, and now **Modularity is a core part of the Fedora distribution**. And some packages have moved to modules completely. At the time of writing — out of the 49,464 binary RPM packages in Fedora 30 — 1,119 (2.26%) come from a module ([more about the numbers][4]).

### Modularity basics

Because having too many packages in multiple versions could feel overwhelming (and hard to manage), packages are grouped into **modules** that represent an application, a language runtime, or any other sensible group.

Modules often come in multiple **streams** — usually representing a major version of the software. Available in parallel, but only one stream of each module can be installed on a given system.

And not to overwhelm users with too many choices, each Fedora release comes with a set of **defaults** — so decisions only need to be made when desired.

Finally, to simplify installation, modules can be optionally installed using pre-defined **profiles** based on a use case. A database module, for example, could be installed as a client, a server, or both.

### Modularity in practice

When you install an RPM package on your Fedora system, chances are it comes from a module stream. The reason why you might not have noticed is one of the core principles of Modularity — remaining invisible until there is a reason to know about it.

Let’s compare the following two situations. First, installing the popular _i3_ tiling window manager, and second, installing the minimalist _dwm_ window manager:

```
$ sudo dnf install i3
...
Done!
```

As expected, the above command installs the _i3_ package and its dependencies on the system. Nothing else happened here. But what about the other one?

```
$ sudo dnf install dwm
...
Enabling module streams:
  dwm                 6.1
...
Done!
```

It feels the same, but something happened in the background — the default _dwm_ module stream ( _6.1_ ) got enabled, and the _dwm_ package from the module got installed.

To be transparent, there is a message about the module auto-enablement in the output. But other than that, the user doesn’t need to know anything about Modularity in order to use their system the way they always did.

But what if they do? Let’s see how a different version of _dwm_ could have been installed instead.

Use the following command to see what module streams are available:

```
$ sudo dnf module list
...
dwm                 latest                ...
dwm                 6.0                   ...
dwm                 6.1 [d]               ...
dwm                 6.2                   ...
...
Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
```

The output shows there are four streams of the _dwm_ module, _6.1_ being the default.

To install the _dwm_ package in a different version — from the _6.2_ stream for example — enable the stream and then install the package by using the two following commands:

```
$ sudo dnf module enable dwm:6.2
...
Enabling module streams:
  dwm                 6.2
...
Done!
$ sudo dnf install dwm
...
Done!
```

Finally, let’s have a look at profiles, with PostgreSQL as an example.

```
$ sudo dnf module list
...
postgresql          9.6            client, server     ...
postgresql          10             client, server     ...
postgresql          11             client, server     ...
...
```

To install PostgreSQL 11 as a server, use the following command:

```
$ sudo dnf module install postgresql:11/server
```

Note that — apart from enabling — modules can be installed with a single command when a profile is specified.

It is possible to install multiple profiles at once. To add the client tools, use the following command:

```
$ sudo dnf module install postgresql:11/client
```

There are many other modules with multiple streams available to choose from. At the time of writing, there were 83 module streams in Fedora 30. That includes two versions of MariaDB, three versions of Node.js, two versions of Ruby, and many more.

Please refer to the [official user documentation for Modularity][5] for a complete set of commands including switching from one stream to another.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/installing-alternative-rpm-versions-in-fedora/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/modularity-f30-816x345.jpg
[2]: https://docs.pagure.org/modularity
[3]: https://fedoramagazine.org/modularity-fedora-28-server-edition/
[4]: https://blog.samalik.com/2019/06/12/counting-modularity-packages.html
[5]: https://docs.fedoraproject.org/en-US/modularity/using-modules/
