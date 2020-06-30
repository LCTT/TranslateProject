[#]: collector: (lujun9972)
[#]: translator: (nophDog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 open source alternatives to VS Code)
[#]: via: (https://opensource.com/article/20/6/open-source-alternatives-vs-code)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

7 open source alternatives to VS Code
======
Avoid Microsoft's proprietary VS Code build and opt for an open source
code editor instead.
![Person using a laptop][1]

Visual Studio Code, also known as VS Code, is a code editor for Linux, Windows, and macOS. It's the kind of editor that walks the line between editing text and managing your entire codebase, like an integrated development environment (IDE). It's extensible through plugins and has proven to be a reliable text editor that's easily beaten out formidable non-open rival editors.

Microsoft released VS Code as open source, but the version you download from Microsoft is not open source. However, you have several options for using VS Code as open source or selecting one of its open source alternatives.

### Building VS Code as open source

VS Code's source code is available [on GitHub][2]. Yet when you download the VS Code application [from Microsoft][3], you'll find that your download is licensed under the [Microsoft Software License][4]. This isn't an open source license. The difference is in the build process.

Chris Dias, a Microsoft developer on the VS Code project, [makes a comparison][5] between VS Code and, for instance, the Chrome browser and its open source "upstream" project, [Chromium][6]. VS Code is indeed built upon an open source codebase. The official Microsoft-branded release is customized with Microsoft-specific functionality, including a trademark, an extensions gallery, a proprietary C# debugger, and telemetry. But when you clone and build the code yourself, none of these targets is configured, so you generate a "clean" version, which is called Code - OSS (OSS stands for open source software).

In practice, the differences between VS Code and Code - OSS are minimal. Most notably, VS Code includes telemetry, which is tracking software. It's unlikely that Microsoft is literally tracking your every move, and there's lots of software out there these days that gathers usage data. Whether or not you care about VS Code's telemetry is up to you. If you'd rather do without the usage tracking, here are some great (and open source) alternatives to VS Code.

### VSCodium

![Code OSS screenshot][7]

(Seth Kenlon, [CC BY-SA 4.0][8])

The easiest alternative to VS Code is VS Code itself, built without Microsoft's proprietary additions. The [VSCodium][9] project provides downloadable executables of Code - OSS, built from the VS Code codebase without Microsoft's `product.json` changes. The VSCodium developers also go to great length to deactivate all hard-to-find telemetry options, delivering the cleanest build of VS Code's source you can find without building it yourself.

VSCodium cautions that VS Code quietly includes some proprietary tools that cannot be shipped with an open source build. This includes a C# debugger and some gallery extensions. If you need them, there are [documented workarounds][10] for these issues, but if you rely on something very specific in VS Code, you should verify that it functions in VSCodium.

You should also verify that all [telemetry is deactivated][11].

### Code - OSS

If you don't want to use VSCodium's build, you can [compile VS Code from source][12] yourself and end up with the same thing. The executable is called `Code - OSS` rather than `VSCode`, and the license restrictions that apply to VSCodium also apply to your build, but so do the workarounds.

If you build the application from source, you should verify that all [telemetry is deactivated][11] when you first launch it.

### Atom

![Atom screenshot][13]

(Seth Kenlon, [CC BY-SA 4.0][8])

[Atom][14] is an open source IDE-like text editor that Microsoft acquired when it purchased GitHub. Like VS Code, you can extend the Atom editor with plugins and customize it with themes and your unique combination of tools. It is also cross-platform and has built-in GitHub integration. In short, Atom is potentially whatever you need it to be, so long as the extensions you need already exist or you're willing to write them.

Also like VS Code, Atom includes [metrics tracking by default][15]. This can be disabled, and unlike VS Code, there are no arbitrary restrictions on extensions, so you don't have to change up your workflow in exchange for your privacy. Atom is certainly a useful tool for coders, but it's also a pretty great editor for [anyone who uses a computer][16]. If you're looking for a good general-purpose text editor, give Atom a try.

### GNOME Builder

![GNOME Builder screenshot][17]

(Seth Kenlon, [CC BY-SA 4.0][8])

Developed as an IDE for the GNOME desktop, [GNOME Builder][18] is a code editor for Linux, specifically for building GNOME applications. If you're building applications for Linux and want an easy avenue to compatibility, Builder is the easy choice. Install Builder from [Flathub.org][19]; when you start a project, it'll even prompt you to install the GNOME SDK if you're missing it. This means you don't have to consciously track GNOME as you maintain your application because Builder does it for you.

However, you can use Builder for much more than just GNOME applications. It supports dozens of programming languages, including Python, Rust, C and C++, Java, Go, JavaScript, TypeScript, VB.NET, several markup and Markdown languages, and more. Some of these have full support with autocompletion and pop-up function definitions, while others only have simple conveniences such as syntax highlighting and auto-bracket matching. The IDE is a pleasure to work with, though, whether you consider yourself a serious programmer or you're just in need of a good HTML and CSS editor.

### Geany

![Geany screenshot][20]

(Seth Kenlon, [CC BY-SA 4.0][8])

[Geany][21] is a powerful, stable, and lightweight editor with useful features to help you write good Bash, Python, Lua, XML, HTML, LaTeX, and more. There's plenty of support for 50 different programming and scripting languages, markup languages, and miscellaneous filetypes (such as .diff and .po). At the very least, Geany almost certainly provides bracket matching and syntax highlighting—and it usually offers quite a lot more.

Geany is a modest little editor, but through plugins, you can add features such as a panel for a project view, filesystem tree, debugging, a terminal, and so on until it looks and acts like an IDE. Or, if you prefer, you can keep it simple and understated. If you can't run VS Code on a computer due to limitations in CPU or RAM, Geany is the obvious alternative. It's quick to launch, and its memory footprint is negligible. While Geany is a little heftier than running Vim in a terminal, it's fast and snappy even on a Raspberry Pi.

### Brackets

![Brackets screenshot][22]

(Seth Kenlon, [CC BY-SA 4.0][8])

[Brackets][23] is a text editor and IDE aimed at web developers. It has strong support for HTML, CSS, JavaScript, PHP, and even Python. However, like VS Code, it has a rich ecosystem of extensions, so you can expand it to serve as your workbench for whatever language you work in the most.

There are extensions to help parse languages, to run scripts, and even to compile and execute code. Brackets has a traditional interface anyone can understand, whether or not you're familiar with an IDE or even a text editor beyond a simple notepad. If you spend a little time adding relevant extensions and getting to know them, you'll find Brackets a useful and subtle editor that helps you, through autocompletion and linting, avoid silly mistakes in whatever you're typing. And if you're writing code, it'll probably make your testing and debugging workflow faster.

### Che

![Che screenshot][24]

(Seth Kenlon, [CC BY-SA 4.0][8])

If you enjoy living on the cutting edge, [Che][25] is an editor you need to try. It's a cloud-based IDE, so it runs by default as a Software as a Service (SaaS), but it's entirely open source, so it can be run as _your own_ SaaS, provided you have a Kubernetes instance.

More than just being an online IDE, though, Che is an IDE built for cloud development. It makes no assumptions that you expect or want a view of your local filesystem. It lives and works in the cloud, so you can too. In fact, if you have a Git server, you can treat it as your filesystem and work on a project directly from its repository. Of course, you can also download any work you do, if you like to have a local backup copy.

But its main feature, and the one cloud developers are excited about, is that Che is a full-featured, Kubernetes-aware, open source IDE. If you're building apps, sites, or containers (or a combination of the three) for the cloud, then Che is an editor you need to try.

### What's your choice?

Are you using one of these alternatives to VS Code? Is there one you would like to try? Please share your feedback in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/open-source-alternatives-vs-code

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://github.com/microsoft/vscode
[3]: https://code.visualstudio.com/
[4]: https://code.visualstudio.com/license
[5]: https://github.com/Microsoft/vscode/issues/60#issuecomment-161792005
[6]: https://www.chromium.org/
[7]: https://opensource.com/sites/default/files/uploads/code-oss.png (Code OSS screenshot)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://vscodium.com/
[10]: https://github.com/VSCodium/vscodium/blob/master/DOCS.md
[11]: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting
[12]: https://github.com/Microsoft/vscode/wiki/How-to-Contribute#build-and-run
[13]: https://opensource.com/sites/default/files/uploads/atom.jpg (Atom screenshot)
[14]: http://atom.io
[15]: https://discuss.atom.io/t/how-do-i-disable-the-metrics-or-tracking/24520
[16]: https://opensource.com/article/19/4/write-git
[17]: https://opensource.com/sites/default/files/uploads/builder.png (GNOME Builder screenshot)
[18]: https://wiki.gnome.org/Apps/Builder
[19]: https://flathub.org/apps/details/org.gnome.Builder
[20]: https://opensource.com/sites/default/files/uploads/geany.png (Geany screenshot)
[21]: https://www.geany.org/
[22]: https://opensource.com/sites/default/files/uploads/brackets.jpg (Brackets screenshot)
[23]: http://brackets.io/
[24]: https://opensource.com/sites/default/files/uploads/che-cpp.jpg (Che screenshot)
[25]: https://www.eclipse.org/che/extend/
