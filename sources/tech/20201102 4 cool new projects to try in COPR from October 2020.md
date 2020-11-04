[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR from October 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-october-2020/)
[#]: author: (frostyx https://fedoramagazine.org/author/frostyx/)

4 cool new projects to try in COPR from October 2020
======

![][1]

COPR is a [collection][2] of personal repositories for software
that isn’t carried in Fedora. Some software doesn’t conform to
standards that allow easy packaging. Or it may not meet other Fedora
standards, despite being free and open-source. COPR can offer these
projects outside the Fedora set of packages. Software in COPR isn’t
supported by Fedora infrastructure or signed by the project. However,
it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in COPR. If
you’re new to using COPR, see the [COPR User Documentation][3]
for how to get started.

### Dialect

[Dialect][4] translates text to foreign languages using Google Translate. It remembers your translation history and supports features such as automatic language detection and text to speech. The user interface is minimalistic and mimics the Google Translate tool itself, so it is really easy to use.

![][5]

#### Installation instructions

The [repo][6] currently provides Dialect for Fedora 33 and Fedora
Rawhide. To install it, use these commands:

```
sudo dnf copr enable lyessaadi/dialect
sudo dnf install dialect
```

### GitHub CLI

[gh][7] is an official GitHub command-line client. It provides fast
access and full control over your project issues, pull requests, and
releases, right in the terminal. Issues (and everything else) can also
be easily viewed in the web browser for a more standard user interface
or sharing with others.

![][8]

#### Installation instructions

The [repo][9] currently provides _gh_ for Fedora 33 and Fedora
Rawhide. To install it, use these commands:

```
sudo dnf copr enable jdoss/github-cli
sudo dnf install github-cli
```

### Glide

[Glide][10] is a minimalistic media player based on GStreamer. It
can play both local and remote files in any multimedia format
supported by GStreamer itself. If you are in need of a multi-platform
media player with a simple user interface, you might want to give Glide a try.

![][11]

#### Installation instructions

The [repo][12] currently provides Glide for Fedora 32, 33, and
Rawhide. To install it, use these commands:

```
sudo dnf copr enable atim/glide-rs
sudo dnf install glide-rs
```

### Vim ALE

[ALE][13] is a plugin for Vim text editor, providing syntax and
semantic error checking. It also brings support for fixing code and
many other IDE-like features such as TAB-completion, jumping to
definitions, finding references, viewing documentation, etc.

![][14]

#### Installation instructions

The [repo][15] currently provides _vim-ale_ for Fedora 31,
32, 33, and Rawhide, as well as for EPEL8. To install it, use these
commands:

```
sudo dnf copr enable praiskup/vim-ale
sudo dnf install vim-ale
```

Editors note: Previous COPR articles can be found [here][16].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-from-october-2020/

作者：[frostyx][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/gi-lom/dialect
[5]: https://fedoramagazine.org/wp-content/uploads/2020/10/dialect.png
[6]: https://copr.fedorainfracloud.org/coprs/lyessaadi/dialect/
[7]: https://github.com/cli/cli
[8]: https://fedoramagazine.org/wp-content/uploads/2020/10/github-cli.png
[9]: https://copr.fedorainfracloud.org/coprs/jdoss/github-cli/
[10]: https://github.com/philn/glide
[11]: https://fedoramagazine.org/wp-content/uploads/2020/10/glide.png
[12]: https://copr.fedorainfracloud.org/coprs/atim/glide-rs/
[13]: https://github.com/dense-analysis/ale
[14]: https://fedoramagazine.org/wp-content/uploads/2020/10/vim-ale.png
[15]: https://copr.fedorainfracloud.org/coprs/praiskup/vim-ale/
[16]: https://fedoramagazine.org/?s=COPR
