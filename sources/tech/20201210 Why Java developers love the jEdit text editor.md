[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Java developers love the jEdit text editor)
[#]: via: (https://opensource.com/article/20/12/jedit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why Java developers love the jEdit text editor
======
This editor packs the power of Java and offers plenty of plugins to
streamline your workflow.
![Person drinking a hot drink at the computer][1]

Java is a powerful language. Maybe because it’s often seen as an "industrial-strength" tool, you might not expect it to be the foundation of a text editor. After all, text editing is almost too easy for such power. In fact, in most modern programming toolkits, the component accepting text entry is a pre-programmed widget. Using a Java toolkit, a simple text editor can be written in about 100 lines of code. So what can [jEdit][2] possibly offer to justify its existence?

Well, quite a lot, actually! The jEdit application is a refreshing reminder of just how practical and useful Java can be for even everyday desktop apps. It deftly demonstrates the dynamism of its foundational technology, and ever true to Java’s enduring promise, it does so on _all_ platforms.

### Installing jEdit

jEdit is written in Java, so it’s available for any platform. [Download it][3] in a generic installer or in a custom installer for the OS of choice. Once it’s downloaded (it’s small, so it won’t take long), run the installer.

If you don’t have Java installed, learn how to install Java on [Linux][4], [Mac, or Windows][5].

### Using jEdit

The way you edit text in jEdit is the same as editing text in any desktop text editor. If you’ve used one, you’ve basically used jEdit; all the common keyboard shortcuts and conventions apply. There are also some features commonly aimed at coders—line numbering, folding (in which sections of text are hidden so you can focus on other sections), and syntax highlighting.

But imagine, for a moment, text editors on a spectrum from [Vim simplicity][6] to [Emacs complexity][7], and you’ll find jEdit happily making its home alongside Emacs. While the editing component is typical of any desktop editing app, jEdit’s additional features include plugins, macros that you can record live during your editing session, features specific to certain editing modes, buffer options, and more. This is an editor that actively encourages you to make it your own.

There are three places you can go for jEdit customization: buffer options, global options, and the plugins manager.

Buffer options (in the Utilities menu) allow you to adjust settings associated with your current document. Usually, jEdit auto-detects the appropriate mode to use for what you’re doing. For instance, writing XML triggers jEdit’s XML highlighting. Sometimes, though, you want to override what jEdit has detected or failed to detect. You can also turn on Explicit Folding mode, which allows you to manually define sections of text you want jEdit to treat as foldable sections.

Global options (in the Utilities menu) offer dozens of preferences that get treated as jEdit’s defaults. This can include anything from its appearance to custom shortcuts.

Plugins extend jEdit in ways its developers, literally, never intended. Plugins offer ways of working that just aren’t "normal" for jEdit, but that just might transform a laborious task into something easy or even fun. It practically transformed XML workflow with its excellent XML parsing, its _Outline_ plugin available for its dockable _Sidekick_ panel, and XSLT integration. If I were not already using Netbeans for Java code, I can imagine using jEdit instead.

### jEdit for programmers

Which text editor you choose depends on what you intend to do in your editor. This one calls itself the "programmer’s text editor," and I feel it’s a very strong contender for serious Java and XML work. However, it doesn’t have quite the same feature set when editing Lua code and Bash scripts. Compared to something like Emacs, for instance, jEdit’s code folding is less flexible (I couldn’t get it to fold a Lua function without additional markup). While it does have a rich plugin selection, I was unable to find anything particularly persuasive for work in AsciiDoc and other non-code formats.

The most appealing feature of jEdit, for me, is its foundation in Java. Because it runs in a JVM, you can be confident that you can use it regardless of your platform and possibly regardless of whether you have permission to install applications outside your own home directory. Java is a popular and active language, so jEdit’s features and plugins are well-maintained.

You should try jEdit if you’re a fan of consistency, or a Java developer, or just an XML geek trying desperately to get out of oXygen. It’s easy to get started, and it’s a lot of fun to explore.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/jedit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: http://jedit.org
[3]: http://www.jedit.org/index.php?page=download
[4]: https://opensource.com/article/19/11/install-java-linux
[5]: http://adoptopenjdk.org
[6]: https://opensource.com/article/20/12/vi-text-editor
[7]: https://opensource.com/article/20/12/emacs
