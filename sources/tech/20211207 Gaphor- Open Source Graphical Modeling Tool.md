[#]: subject: "Gaphor: Open Source Graphical Modeling Tool"
[#]: via: "https://itsfoss.com/gaphor-modeling-tool/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Gaphor: Open Source Graphical Modeling Tool
======

Gaphor is a free and open source modeling application with support for various modeling languages such as UML, [SysML][1], RAAML and C4.

Not aware of the term “modeling language”? Basically, it’s a set of instructions that can be used to create the design and constructions of structures. It could be textual and graphical, both.

The graphical one is easier to look at and figure out how various components of the project are related to each other.

Have you seen a flowchart or sequence diagrams? Those are also a type of graphical modeling in the simplest form.

![Sequence diagram example][2]

There are various modeling languages and they are used for software development, system engineering, physics, project management and more.

### Gaphor for UML, SysML and more

[Gaphor][3] works with the UML, SysML, and RAAML OMG standards. It also includes support for the C4 model for visualizing software architectures.

It’s not just a [drawing tool][4]. It implements a fully-compliant UML 2 data model. You can create highly complex models with Gaphor.

![][5]

Written in Python, Gaphor is completely open source under Apache 2 license. You can find all its source code on [its GitHub repository][6]. It is a cross-platform tool and available to install on Linux, Windows and macOS.

You can export your diagrams in PDF, PNG, SVG and XML formats. You can also plug-in a code generator.

Gaphor website mentions that it has dark mode but I didn’t see any options to enable it in the AppImage version I downloaded.

### Installing Gaphor on Linux

![Gaphor user interface][7]

Arch users can find Gaphor in the AUR. For other distributions, you have the choice of choosing between [AppImage][8] and Flatpak.

You can download the AppImage from its download page.

[Download Gaphor][9]

If you want to use the Flatpak version, add the Flathub repository first:

```

    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

```

And then install it:

```

    flatpak install --user flathub org.gaphor.Gaphor

```

Since Gaphor is essentially a Python application, you can install it [using Pip][10] as well.

```

    pip install gaphor

```

I used UML and sequence diagrams when I worked as a software engineer. I haven’t used it in the last few years. Looking at Gaphor, I think it’s a pretty cool app to have if you have to create UML and other diagrams for your projects.

Feel free to give it a try and share your experience in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gaphor-modeling-tool/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://sysml.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/sequence-diagram-example-800x364.png?resize=800%2C364&ssl=1
[3]: https://gaphor.org/
[4]: https://itsfoss.com/open-source-paint-apps/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/gaphor-uml-screenshot.jpg?resize=800%2C570&ssl=1
[6]: https://github.com/gaphor
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/gaphor-example-800x445.png?resize=800%2C445&ssl=1
[8]: https://itsfoss.com/use-appimage-linux/
[9]: https://gaphor.org/download.html#linux
[10]: https://itsfoss.com/install-pip-ubuntu/
