组测试: Linux 文本编辑器
================================================================================
> Mayank Sharma 测试了5款不仅仅是能处理字的超级文本编辑器。

如果你使用Linux已经有很长一段时间，你知道，不管是编辑一款app的配置文件，一起用shell脚本骇客，或者编写/查看代码，类似LobreOffice的工具并不能满足。尽管字面上看起来意思一样，你不需要一个字处理器来完成这些任务；你需要一个文本编辑器。

在这个组测试中，我们将着眼于5款不仅仅是能胜任繁重文本任务的简陋的文本编辑器。他们能高亮语法，像拼写检查一样轻松处理代码缩进。你可以像你复制/粘贴文本那样容易地使用他们记录宏以及管理代码片段。

得益于能向它们注入足以抗衡其它类型的以文本为中心的应用程序能力的插件，一些简单的文本编辑器甚至超过了它们的设计目标。它们能胜任一个源代码编辑器的任务，甚至是一个集成开发环境。

Emacs和Vim是两款最流行和强大的纯文本编辑器。但是，由于一些原因，我们在这个组测试中并没有包括它们。首先，如果你使用它们中的任何一个，那么恭喜你：你不需要更换了。其次，它们都有陡峭的学习曲线，尤其是对于那些对有面向图形用户界面的桌面系统的替代能力更有兴趣的用户。

### 目录: ###

#### Gedit ####

- URL:http://projects.gnome.org/gedit/
- 版本: 3.10
- 许可证: GPL
- Gnome的默认文本编辑器准备好挑战了?

#### Kate ####

- URL: www.kate-editor.org
- 版本: 3.11
- 许可证: LGPL/GPL
- Kate会挑战命运吗?

#### Sublime Text ####

- URL: www.sublimetext.com
- 版本: 2.0.2
- 许可证: Proprietary
- 在自由与黄金心脏土地上的私有软件。

#### UltraEdit ####

- URL: www.ultraedit.com
- 版本: 4.1.0.4
- 许可证: Proprietary
- 它做的足够多去证明它的价值了吗?

#### jEdit ####

- URL: www.jedit.org
- 版本: 5.1.0
- 许可证: GPL
- 基于Java的编辑器是否会扰乱其他编辑器的世界?

![在展示一个有功能的应用程序和将它们所有的东西曝光给用户之间有一个很好的平衡。Geddit隐藏了它的大部分功能。](http://www.linuxvoice.com/wp-content/uploads/2014/07/gedit-web.png)
在展示一个有功能的应用程序和将它们所有的东西曝光给用户之间有一个很好的平衡。Geddit隐藏了它的大部分功能。

### 关键标准 ###

除了Gedit和jEdit以外的所有工具，都是通过推荐的安装方法安装在Fedora和Ubuntu上。前者已经兼容默认的Gnome桌面，后者仍然固执地反对安装在Fedora上。由于这些是相对简单的应用程序，他们没有复杂的依赖，唯一例外的是jEdit，它要求要有Oracle Java。

得益于Gnome和KDE持续的努力，不论他们运行的桌面环境，所有编辑器看起来很好，功能也很正常。这不仅是作为环境评价的标准，也意味着你不再受制于要找到和你的桌面环境兼容的工具。

除了它们老派的功能，我们也对所有候选者测试了通用文本编辑功能。然而，它们并没有被设计为模仿现代字处理器的所有功能，我们也不以此评判。

![Kate能搭建为功能丰富的集成开发环境](http://www.linuxvoice.com/wp-content/uploads/2014/08/kate-web.png)

Kate能搭建为功能丰富的集成开发环境。

### 编程语言支持 ###

UltraEdit 能进行语法高亮，代码折叠以及拥有项目管理的能力。这也有一个罗列源文件中所有功能的功能列表，但并不适用于我们任何的测试代码文件。UltraEdit也支持HTML5，有能添加常用HTML标记的HTML工具栏。

即使Gnome的默认文本编辑器Gedit，也有几个面向编码的功能特性，例如括号匹配，自动缩进以及为包括C, C++, Java, HTML, XML, Python, Perl, 以及许多其它编程语言进行语法高亮。

如果你需要更多的编程辅助，看一下Sublime和Kate。Sublime支持多种编程语言并且(正如流行的那些)能为C#, D, Dylan, Erlang, Groovy, Haskell, Lisp, Lua, MATLAB, OCaml, R, 甚至 SQL 进行语法高亮。如果这还不够，你可以下载插件以支持更多的语言。

另外，它的语法高亮功能提供了多个可定制选项。这个应用程序也会进行括号匹配，确保代码段都正确，Sublime的自动补全功能也支持用户创建的变量。

正如Komodo IDE，Sublime也可滚动浏览显示完整的代码，这对于长代码文件导航和在文件中的不同部分跳转很方便。

Sublime最好的功能之一就是能在编辑器内部为特定语言，例如C++, Python, Ruby等运行代码，当然假设在你的电脑上安装有编译器以及其它系统工具。

你也可以用插件在Kate中开启构建系统功能。另外，你可以为GDB调试器添加一个简单的前端。Kate能和Git，Subversion以及Mercurial版本控制系统一起工作，也提供了一些项目管理的功能。

除了能为超过180中语言进行语法高亮，它支持所有的这些辅助功能，例如括号匹配，自动补全和自动缩进。它也支持代码折叠，甚至在一个程序中包括有错误的函数。

jEdit是唯一的遗憾，它声称自己是一个程序员的文本编辑器，但它缺少其他的基本功能，例如代码折叠，它甚至不支持补全功能。

**Verdict:**

- Gedit:3/5
- Kate:5/5
- Sublime:5/5
- UltraEdit3/5
- jEdit:1/5

![如果你不喜欢Sublime的Charcoal外观，你可以选择它包含的其它22中主题。](http://www.linuxvoice.com/wp-content/uploads/2014/08/sublime-web.png)

如果你不喜欢Sublime的Charcoal外观，你可以选择它包含的其它22中主题。

### 键盘控制 ###

高级文本编辑器用户希望能完全通过键盘控制和操作，一些应用程序甚至运行他们的用户自定义快捷方式的键盘绑定。

你可以轻松的使用Gedit的扩展键盘快捷键。这里有编辑文件，为普通任务，例如对一个文档进行拼写检查，唤起工具的快捷键。你可以获取应用程序内部的一系列默认快捷键，但并没有图形化的方式去自定义它们。相似的，在Sublime中自定义键绑定，你需要修改他的XML键映射文件。Sublime由于缺少定义键盘快捷键的图形化界面而饱受批评，但长期使用的用户已经支持当前的基于文件的机制，这给他们更多的控制能力。

UltraEdit为它"一切都可自定义"的座右铭感到自豪，这也包括键盘快捷键。你可以自定义菜单导航的热键，以及定义你自己的访问大量函数的多键键映射。

除了完全可自定义的键盘快捷键以外，jEdit也有为Emacs预定义的键映射。Kate在这方面尤其令人映像深刻。它有简单可访问的自定义键绑定窗口。你可以更改默认的键，或者定义替代的键。另外，Kate也有一个能使用户使用Vi键操作Kate的Vi模式。

**Verdict:**

- Gedit:2/5
- Kate:5/5
- Sublime:3/5
- UltraEdit:4/5
- jEdit:5/5

### 片段和宏 ###

Macros help you cut down the time spent on editing and organising data by automating repetitive steps, while Snippets of code extend a similar functionality to programmers by creating reusable chunks of source code. Both have the ability to save you time.

The vanilla Gedit installation doesn’t have either of these functionalities, but you can enable them via separate plugins. While the Snippets plugin ships with Gedit, you’ll have to manually download and install the macro plugin (it’s called gedit-macropy and is hosted on GitHub) before you can enable it from within Gedit.

Kate takes the same plugins route to enable the snippets feature. Once added, the plugin also adds a repository of snippets for PHP, Bash and Java. You can display the list of snippets in the sidebar for easier access. Right-click on a snippet to edit its contents as well as its shortcut key combination. However, very surprisingly, it doesn’t support macros – despite repeated hails from users since 2002!

jEdit too has a plugin for enabling snippets. But it can record macros from user actions and you can also write them in the BeanShell scripting language (BeanShell supports scripted objects as simple method closures like those in Perl and JavaScript). jEdit also has a plugin that will download several macros from jEdit’s website.

Sublime ships with inbuilt ability to create both snippets and macros, and ships with several snippets of frequently used functions for most popular programming languages.

Snippets in UltraEdit are called Smart Templates and just like with Sublime you can insert them based upon the kind of source file you’re editing. To complement the Macro recording function, UltraEdit also has an integrated javascript-based scripting language to automate tasks. You can also download user-submitted macros and scripts from the editor’s website.

**Verdict:**

- Gedit:3/5
- Kate:1/5
- Sublime:5/5
- UltraEdit:5/5
- jEdit:5/5

![UltraEdit’s UI is highly configurable — you can customise the layout of the toolbars and menus just as easily as you can change many other aspects.](http://www.linuxvoice.com/wp-content/uploads/2014/08/ultraedit-web.png)

UltraEdit’s UI is highly configurable — you can customise the layout of the toolbars and menus just as easily as you can change many other aspects.

### Ease of use ###

Unlike a bare-bones text editor, the text editors in this feature are brimming with features to accommodate a wide range of users — from document writers to programmers. Instead of stripping features from the apps, their developers are looking for avenues to add more functionality.

Although at first glance most apps in this group test have a very similar layout, upon closer inspection, you’ll notice several usability differences. We have a weak spot for apps that expose their functionality and features by making judicious use of the user interface, instead of just overwhelming the user.

### Gedit: 4/5 ###

Gedit wears a very vanilla look. It has an easy interface with minimal menus and buttons. This is a two-edged sword though, as some users might fail to realise its true potential.

The app can open multiple files in tabs that can be rearranged and moved between windows. Users can optionally enable panels on the side and bottom for displaying a file browser and the output of a tool enabled by a plugin. The app will detect when an open file is modified by another application and offers to reload that file.

The UI has been given a major overhaul in the latest version of the app yet to make its way into Gnome. However it isn’t yet stable, and while it maintains all features, several plugins that interact with the menu will need to be updated.

### Kate: 5/5 ###

Although a major part of its user interface resembles Gedit, Kate tucks in tabs at either side and its menus are much fuller. The app is approachable and invites users to explore other features.

Kate can transparently open and save files over all protocols supported by KDE’s KIO including HTTP, FTP, SSH, SMB and WebDAV. You can use the app to work with multiple files at the same time. But unlike the traditional horizontal tab switching bar in most app, Kate has tabs on either side of the screen. The left sidebar will display an index of open files. Programmers who need to see different parts of the same file at the same time will also appreciate its ability to split the interface horizontally as well as vertically.

### Sublime: 5/5 ###

Sublime lets you view up to four files at the same time in various arrangements. There’s also a full-screen distraction free mode that just displays the file and the menu, for when you’re in the zone.

The editor also has a minimap on the right, which is useful for navigating long files. The app ships with several snippets for popular functions in several programming languages, which makes it very usable for developers. Another neat editing feature, whether you are working with text documents or code, is the ability to swap and shuffle selections.

### UltraEdit: 3/5 ###

UltraEdit’s interface is loaded with several toolbars at the top and bottom of the interface. Along with the tabs to switch between documents, panes on either side and the gutter area, these leave little room for the editor window.

Web developers working with HTML files have lots of assistance at their fingertips. You can also access remote files via FTP and SFTP. Advanced features such as recording a macro and comparing files are also easily accessible.

Using the app’s Preferences window you can tweak various aspects of the app, including the colour scheme and other features like syntax highlighting.

### jEdit: 3/5 ###

In terms of usability, one of the first red-flags was jEdit’s inability to install on RPM-based distros. Navigating the editor takes some getting used to, since its menus aren’t in the same order as in other popular apps and some have names that won’t be familiar to the average desktop user. However, the app include detailed inbuilt help, which will help ease the learning curve.

jEdit highlights the current line you are on and enables you to split windows in multiple viewing modes. You can easily install and manage plugins from within the app, and in addition to full macros, jEdit also lets you record quick temporary ones.

![Thanks to its Java underpinnings, jEdit doesn’t really feel at home on any desktop environment](http://www.linuxvoice.com/wp-content/uploads/2014/08/jedit-web.png)

Thanks to its Java underpinnings, jEdit doesn’t really feel at home on any desktop environment

### Availability and support ###

There are several similarities between Gedit and Kate. Both apps take advantage of their respective parent project, Gnome and KDE, and are bundled with several mainstream distros. Yet both projects are cross-platform and have Windows and Mac OS X ports as well as native Linux versions.

Gedit is hosted on Gnome’s web infrastructure and has a brief user guide, information about the various plugins, and the usual channels of getting in touch including a mailing list and IRC channel. You’ll also find usage information on the websites of other Gnome-based distros such as Ubuntu. Similarly, Kate gets the benefit of KDE’s resources and hosts detailed user information as well as a mailing list and IRC channel. You can access their respective user guides offline from within the app as well.

UltraEdit is also available for Windows and Mac OS X besides Linux, and has detailed user guides on getting started, though there’s none included within the app. To assist users, UltraEdit hosts a database of frequently asked questions, a bunch of power tips that have detailed information about several specific features, and users can engage with one another other on forum boards. Additionally, paid users can also seek support from the developers via email.

Sublime supports the same number of platforms, however you don’t need to buy a separate licence for each platform. The developer keeps users abreast with ongoing development via a blog and also participates actively in the hosted forums. The highlight of the project’s support infrastructure is the freely available detailed tutorial and video course. Sublime is lovely.

Because it’s written in Java, jEdit is available on several platforms. On its website you’ll find a detailed user guide and links to documentation of some plugins. However, there are no avenues for users to engage with other users or the developer.

**Verdict:**

- Gedit: 4/5
- Kate: 4/5
- Sublime: 5/5
- UltraEdit: 3/5
- jEdit: 2/5

### Add-on and plugins ###

Different users have different requirements, and a single lightweight app can only do as much. This is where plugins come into the picture. The apps rely on these small pluggable widgets to extend their feature set and be of use to even more number of users.

The one exception is UltraEdit. The app has no third-party plugins, but its developers do point out that third-party tools such as HtmlTidy are already installed with UltraEdit.

Gedit ships with a number of plugins installed, and you can download more with the gedit-plugins package. The project’s website also points to several third-party plugins based on their compatibility with the Gedit versions.

Three useful plugins for programmers are Code Comment, Terminal Plugin, which adds a terminal in the bottom panel, and the Session Saver. The Session Saver is really useful when you’re working on a project with multiple files. You can open all the files in tabs, save your session and when you restore it with a single click it’ll open all the files in the same tab order as you saved them.

Similarly, you can extend Kate by adding plugins using its built-in plugin manager. In addition to the impressive projects plugins, some others that will be of use to developers include an embedded terminal, ability to compile and debug code and execute SQL queries on databases.

Plugins for Sublime are written in Python, and the text editor includes a tool called Package Control, which is a little bit like apt-get in that it enables the user to find, install, upgrade and remove plugin packages. With plugins, you can bring the Git version control to Sublime, as well as the JSLint tool to improve JavaScript. The Sublime Linter plugin is a must have for coders and will point out any errors in your code.

jEdit boasts the most impressive plugin infrastructure. The app has over 200 plugins, which can be browsed in the dedicated site of their own. The website lists plugins under various categories such as File Management, Version Control, Text, etc. You’ll find lots of plugins housed under each category.

Some of the best plugins are the Android plugin, which provides utilities to work on Android projects; the TomcatSwitch plugin, using which you can create and control an external Jakarta Tomcat server process; and the Vimulator plugin, for Vi-like capabilities. You can install these plugins using jEdit’s using its plugin manager.

**Verdict**

- Gedit: 3/5
- Kate: 4/5
- Sublime: 4/5
- UltraEdit: 1/5
- jEdit: 5/5

### Plain ol’ text editing ###

Despite all their powerful extra-curricular activities that might even displace full-blown apps across several genres, there will be times when you just need to use these text editing behemoths to read, write, or edit plain and simple text. While you can use all of them to enter text, we are evaluating them for access to common text-editing conveniences.

Gedit which is Gnome’s default text editor, supports an undo and redo mechanism as well as search and replace. It can spellcheck documents in multiple languages and can also access and edit remote files using Gnome GVFS libraries.

You can spellcheck documents with Kate as well, which also lets you perform a Google search on any highlighted text. It’s also got a line modification system which visually alerts users of lines which have modified and unsaved changes in a file. In addition, it enables users to set bookmarks within a file to ease navigation of lengthy documents.

Sublime has a wide selection of editing commands, such as indenting text and formatting paragraphs. Its auto-save feature helps prevent users from losing their work. Advanced users will appreciate the regex-based recursive find and replace feature, as well as the ability to select multiple non-contiguous spans of text and act on them collectively.

UltraEdit also enables the use of regular expressions for its search and replace feature and can edit remote files via FTP. One unique feature of jEdit is its support for an unlimited number of clipboard which it calls registers. You can copy snippets of text to these registers which are available across editing sessions.

**Verdict:**

- Gedit: 4/5
- Kate: 5/5
- Sublime: 5/5
- UltraEdit: 4/5
- jEdit: 4/5

### Our verdict ###

All the editors in this feature are good enough to replace your existing text editor for editing text files and tweaking configuration files. In fact, chances are they’ll even double up as your IDE. These apps are chock full of bells and whistles, and their developers aren’t thinking of stripping features, but adding more and more and more.

At the tail end of this test we have jEdit. Not only does it insist on using the proprietary Oracle Java Runtime Environment, it failed to install on our Fedora machine, and the developer doesn’t actively engage with its users.

UltraEdit does little better. This commercial proprietary tool focuses on web developers, and doesn’t offer anything to non-developer power users that makes it worth recommending over free software alternatives.

On the third podium position we have Gedit. There’s nothing inherently wrong with Gnome’s default editor, but despite all its positive aspects, it’s simply outclassed by Sublime and Kate. Out of the box, Kate is a more versatile editor than Gedit, and outscores Gnome’s default editor even after taking their respective plugin systems into consideration.

Both Sublime and Kate are equally good. They performed equally well in most of our tests. Whatever ground it lost to Sublime for not supporting macros, it gained for its keyboard friendliness and its ease of use in defining custom keybindings.

Kate’s success can be drawn from the fact that it offers the maximum number of features with minimal learning curve. Just fire it up and use it as a simple text editor, or easily edit configuration file with syntax highlighting, or even use it to collaborate and work on a complex programming project thanks to its project management capabilities.

We aren’t pitching Kate to replace a full-blown integrated development environment such as [insert your favourite specialised tool here]. But it’s an ideal all-rounder and a perfect stepping stone to a specialised tool.

Kate is designed for moments when you need something that’s quick to respond, doesn’t overwhelm you with its interface and is just as useful as something that might otherwise be overkill.

### 1st Kate ###

- Licence LGPL/GPL Version 3.11
- www.kate-editor.org
- The ultimate mild-mannered text editor with super powers.
- Kate is one of the best apps to come out of the KDE project.

### 2nd Sublime Text ###

- Licence Proprietary Version 2.0.2
- www.sublimetext.com
- A professionally done text editor that’s worth every penny – easy to use, full of features and it looks great.

### 3rd Gedit ###

- Licence GPL Version 3.10
- http://projects.gnome.org/gedit
- Gets it done from Gnome. It’s a wonderful text editor and does an admirable job, but the competition here is too great.

### 4th UltraEdit ###

- Licence Proprietary Version 4.1.0.4
- www.ultraedit.com
- Focuses on bundling conveniences for web developers without offering anything special for general users.

### 5th jEdit ###

- Licence GPL Version 5.1.0
- www.jedit.org
- A lack of support, lack of working on Fedora and a lack of looking nice relegate jEdit to the bottom slot.

### You may also wish to try… ###

The default text editor that ships with your distro will also be able to assist you with some advanced tasks. There’s KDE’s KWrite and Raspbian’s Nano, for instance. KWrite inherits some of Kate’s features thanks to KDE’s katepart component, and Nano has sprung back into limelight thanks to its availability for Raspberry Pi.

If you wish to follow the steps of Linux gurus, you could always try the revered text editors Emacs and Vim. First time users who want to get a taste for the power of Vim might want to consider gVim, which exposes Vim’s power via a graphical interface.

Besides jEdit and Kate, there are other editors that mimic the usability of veteran advanced editors like Emacs and Vim, such as the JED editor and Joe’s Own Editor, both of which have an emulation mode for Emacs. On the other hand, if you are looking for lightweight code editors check out Bluefish and Geany. They exist to fill the niche between text editors and full-fledged integrated development platforms. 

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/text-editors/

作者：[Ben Everard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/ben_everard/
