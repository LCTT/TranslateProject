[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use the Eclipse IDE as your text editor)
[#]: via: (https://opensource.com/article/20/12/eclipse)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use the Eclipse IDE as your text editor
======
Though technically an IDE, Eclipse offers a robust editing suite with
lots of extensions to give you the tools you need.
![Women in computing and open source v5][1]

Eclipse is an IDE (integrated development environment). It’s definitely not a text editor. Then again, an IDE is really just a text editor with a lot of extra features for specific kinds of text. Furthermore, an IDE is often _home_ to a developer. Developers have their IDE of choice open all day long, so it’s natural to stay in that IDE when it’s time to write a project README file, or to jot down a quick note, or to just make a grocery list. So sometimes, an IDE is just a text editor, after all.

### Installing

One of Eclipse’s advantages as a platform is that it’s wildly popular. It’s the default Java IDE in many a classroom and business, and it’s easy to obtain regardless of your operating system.

On Linux, you can install Eclipse from your software repository.

On Mac or Windows, download an installer from [eclipse.org][2].

Eclipse is a big project, so if you have a favorite programming language, you can download a version of Eclipse tuned specifically for that language. However, you can’t go wrong by just downloading the Java one and adding extensions to it for further development options.

### Launching Eclipse

When you first launch Eclipse, you’re prompted to establish a workspace. This is a useful convention of many IDEs, designed to ensure that all of your active development libraries and projects are centrally located on your computer. This way, you don’t throw out a directory of libraries and headers you’ve forgotten your project relies upon, and you’re less likely to bundle in libraries from your base system, forgetting that your users will need to install them separately before running your code. The default location for Eclipse’s workspace is `~/eclipse-workspace`.

![eclipse workspace with white text on grey background][3]

### Eclipse projects

Eclipse is designed for formal _projects_. It assumes that you’re building an application or command or library consisting of many related files. Even when you create a text file, Eclipse assumes that it’s probably a `README` or a configuration file for your project. If you want to use Eclipse to create arbitrary text files that are not associated with a code project, then you can create a project file just for your text files.

To create a new project, navigate to the **File** menu and select **New Project**. From the list of project templates, select **General**. Once you have a project created, you can use it to store arbitrary text files created and maintained within Eclipse.

### Extensions

By default, Eclipse is adept with XML and can handle plain text adequately. [I write in XML whenever I get the chance][4], and Eclipse makes for an excellent XML workbench. If you don’t write in XML for fun, though, you might prefer to have syntax highlighting for your favorite syntax, too. Eclipse is extensible, so you can install plugins to add to its features.

One of my favorite plugins is [LiClipseText][5], a configurable syntax highlighter for several text formats. To install it (or any Eclipse extension), navigate to the **Help** menu and select **Eclipse Marketplace**. Search the Marketplace for LiClipse, and then click the **Install** button on the result. Depending on the speed of your Internet and computer, wait for the extension to install, and then allow Eclipse to restart so it can load the extension into your environment.

![Eclipse marketplace showing available editors ][6]

In my experience, most document format plugins are activated according to file extension association. In other words, when I open a file with a name ending in .md or .mdown, LiClipseText is enabled in the text editing window.
You can adjust file associations in Eclipse’s preferences in case you want to override defaults loaded by an extension or by Eclipse itself.

### Eclipse for text editing

Writing in Eclipse feels very natural. After all, Eclipse primarily operates upon text anyway, so it’s well equipped whether your text contains code or natural language. In fact, I’ve found that there are some small bonuses to using a code editor like Eclipse for natural language processing. For instance, the occurrence marker in Eclipse highlights all occurrences of a specific term. When programming, this is useful so you can visualize where variables and functions are being used. When you’re writing, you can activate the same feature, and I’ve found that it helps me keep the terms I’m using consistent, and by contrast, it helps me detect overuse of any given phrase.

Eclipse can also handle diffs and patches with ease, and it’s got version control integration, so synchronizing work between computers is trivial.

Whether you use Eclipse as your primary text editor or just for required text files you’re bundling along with applications you develop, it’s a great platform for writing.

How to set up your Eclipse environment with Python and EASE, and a few ideas to supercharge your...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/eclipse

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: https://www.eclipse.org/downloads/packages/
[3]: https://opensource.com/sites/default/files/uploads/eclipse-31_days-eclipse-opensource.png (eclipse workspace with white text on grey background)
[4]: https://opensource.com/article/17/9/docbook
[5]: https://marketplace.eclipse.org/content/liclipsetext
[6]: https://opensource.com/sites/default/files/uploads/eclipse-marketplace-31_days-eclipse-opensource.jpg (Eclipse marketplace showing available editors )
