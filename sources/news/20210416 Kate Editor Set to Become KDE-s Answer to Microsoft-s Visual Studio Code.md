[#]: subject: (Kate Editor Set to Become KDE’s Answer to Microsoft’s Visual Studio Code)
[#]: via: (https://news.itsfoss.com/kate/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Kate Editor Set to Become KDE’s Answer to Microsoft’s Visual Studio Code
======

KDE has revealed some details on the upcoming 21.04 release of their Kate text editor, or KDE Advanced Text Editor. With this release comes a huge range of new features, such as a new HUD style command palette and improved search in files.

To the Visual Studio Code users out there, this may seem familiar. Microsoft VS Code has had a similar style command palette for a long time, which Kate users (until now) had to leave out of their workflow.

Some of the features I will be looking at in this article include:

  * **Integrated Git support**
  * HUD style command palette
  * Quick open with fuzzy matching
  * Improved Search In Files
  * Improved Language Server Protocol (LSP) support



### Integrated Git Support – Finally!

![][1]

One of the biggest features of this update is the integrated git support. Although it has been possible to load git repositories in Kate for a while now, the new integrated git support allows you to checkout and create branches, stash stuff, stage your files for commit or diff, and do the commit and push afterward, **all without touching the terminal!**

This is a huge improvement over the old way of using Kate’s built-in terminal to manage your repositories.

Additionally, it opens up the ability to use git on the Windows version of Kate, which still doesn’t have the ability to access a command line (most likely due to the locked-down nature of it).

This is a a huge feature, and I suspect that it will be welcomed by developers everywhere.

### HUD Style Command Palette

![][2]

One of the key components of the VS Code workflow is the Command Palette. After waiting for years, this huge feature has finally been added to Kate.

The Command Palette is possibly one of the most commonly used features in VS Code, and it has been one of the few things that have kept me using the aforementioned text editor. Now with the integration into Kate, I can happily switch, without worrying about a huge disruption to my workflow.

### Quick Open (With Fuzzy Matching)

![][3]

A longtime feature of Kate, Quick Open hasn’t been improved all that much over the past few years. Now with the new 21.04 release, it is receiving a major overhaul, with things such as Fuzzy Matching and a new UI that aims to be more consistent with the Command Palette.

The new UI is the result of a move to a more consistent design throughout Kate. Although minor, this change definitely is more eye-pleasing and helps improve the layout for those with larger screens.

The fuzzy matching is also a welcome improvement. The Quick Open dialog used to use a wildcard filter for its top result, with direct matches to the search term being listed beneath it. The 21.04 release uses a new fuzzy matching algorithm, providing the best results at the top, with less likely results located at the bottom.

The result of this is far more reliable results, which when combined with the new UI, provides a huge improvement to the user experience.

### Improved Search in Files

![][3]

With the new release comes yet another welcome improvement: Better search in files.

The search plugin got a major overhaul with much better result representation in the proper editor font and colors. It has also been improved in terms of speed, with a very noticeable performance jump.

One way they achieved this is through parallelizing the search engine, allowing it to attempt to utilize all the available cores on the CPU. No longer does Kate need to hide behind Atom/VS Code!

### Improved LSP Support

![][4]

For those unfamiliar with the term, LSP stands for Language Server Protocol. This is what’s responsible for the detection of code errors and warnings, go to definition/declaration capabilities, and symbol outlines.

If you happen to be coding in one of the supported languages, it should be enabled out of the box, enabling Kate to be used similarly to a lightweight IDE.

### Wrapping Up

With this [upcoming new release][5], you can expect heaps of cool new features, each providing a better experience to the end-user. After a long wait, it seems that Kate is finally catching up with other [modern code editors like VS Code][6] in terms of features, with the added benefit of better integration into KDE Plasma desktop.

The new release should arrive in within the next two weeks. Keep an eye out for it.

![][7]

I'm not interested

#### _Related_

  * [KDE Plasma 5.22 To Include New Adaptive Panel Opacity and Other Exciting Improvements][8]
  * ![][9] ![][10]


  * [KDE Plasma 5.21 Brings in a New Application Launcher, Wayland Support, and Other Exciting Additions][11]
  * ![][9] ![][12]


  * [Linux Release Roundup #21.12: 7-Zip, Vivaldi Browser 3.7, Audacity 3.0 and More New Releases][13]
  * ![][9] ![Linux Release Roundups][14]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/kate/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzUwNycgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzUxMCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQzNScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzM3Nycgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[5]: https://kate-editor.org/post/2021/2021-03-29-kate-21.04-feature-preview/
[6]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzI1MCcgd2lkdGg9Jzc1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[8]: https://news.itsfoss.com/kde-plasma-5-22-dev/
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[10]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/kde-plasma-22-dev-ft.png?fit=1200%2C675&ssl=1&resize=350%2C200
[11]: https://news.itsfoss.com/kde-plasma-5-21-release/
[12]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/02/kde-plasma-5-21-feat.png?fit=1200%2C675&ssl=1&resize=350%2C200
[13]: https://news.itsfoss.com/linux-release-roundup-2021-12/
[14]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/Linux-release-roundups.png?fit=800%2C450&ssl=1&resize=350%2C200
