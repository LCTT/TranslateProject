Group Test: Linux Text Editors
================================================================================
> Mayank Sharma tests five supercharged text editors that can crunch more than just words.

If you’ve been using Linux long, you know that whether you want to edit an app’s configuration file, hack together a shell script, or write/review bits of code, the likes of LibreOffice just won’t cut it. Although the words mean almost the same thing, you don’t need a word processor for these tasks; you need a text editor.

In this group test we’ll be looking at five humble text editors that are more than capable of heavy-lifting texting duties. They can highlight syntax and auto-indent code just as effortlessly as they can spellcheck documents. You can use them to record macros and manage code snippets just as easily as you can copy/paste plain text.

Some simple text editors even exceed their design goals thanks to plugins that infuse them with capabilities to rival text-centric apps from other genres. They can take on the duties of a source code editor and even an Integrated Development Environment.

Two of most popular and powerful plain text editors are Emacs and Vim. However, we didn’t include them in this group test for a couple of reasons. Firstly, if you are using either, congratulations: you don’t need to switch. Secondly, both of these have a steep learning curve, especially to the GUI-oriented desktop generation who have access to alternatives that are much more inviting.

### The contenders: ###

#### Gedit ####

- URL:http://projects.gnome.org/gedit/
- Version: 3.10
- Licence: GPL
- Is Gnome’s default text editor up to the challenge?

#### Kate ####

- URL: www.kate-editor.org
- Version: 3.11
- Licence: LGPL/GPL
- Will Kate challenge fate?

#### Sublime Text ####

- URL: www.sublimetext.com
- Version: 2.0.2
- Licence: Proprietary
- Proprietary software in the land of free with the heart of gold.

#### UltraEdit ####

- URL: www.ultraedit.com
- Version: 4.1.0.4
- Licence: Proprietary
- Does it do enough to justify its price?

#### jEdit ####

- URL: www.jedit.org
- Version: 5.1.0
- Licence: GPL
- Will the Java-based editor spoil the party for the rest?

![There’s a fine balance between stuffing an app with features and exposing all of them to the user. Geddit keeps most of its features hidden.](http://www.linuxvoice.com/wp-content/uploads/2014/07/gedit-web.png)
There’s a fine balance between stuffing an app with features and exposing all of them to the user. Geddit keeps most of its features hidden.

### The crucial criteria ###

All the tools, except Gedit and jEdit, were installed on Fedora and Ubuntu via their recommended installation method. The former already shipped with the default Gnome desktop and the latter stubbornly refused to install on Fedora. Since these are relatively simple apps, they have no esoteric dependencies, the only exception being jEdit, which requires Oracle Java.

Thanks to the continued efforts of both Gnome and KDE, all editors look great and function properly irrespective of the desktop environment they are running on. That not only rules it out as an evaluation criterion, it also means that you are no longer bound by the tools that ship with your favourite desktop environment.

In addition to their geekier functionality, we also tested all our candidates for general-purpose text editing. However, they are not designed to mimic all the functionality of a modern-day word processor and weren’t evaluated as such.

![Kate can double up as a versatile can capable integrated development environment (IDE).](http://www.linuxvoice.com/wp-content/uploads/2014/08/kate-web.png)

Kate can double up as a versatile can capable integrated development environment (IDE).

### Programming language support ###

UltraEdit does syntax highlighting, can fold code and has project management capabilities. There’s also a function list, which is supposed to list all the functions in the source file, but it didn’t work for any of our test code files. UltraEdit also supports HTML5, and has a HTML toolbar with which you can add commonly-used HTML tags.

Even Gnome’s default text editor, Gedit, has several code-oriented features such as bracket matching, automatic indentation, and will also highlight syntax for various programming languages including C, C++, Java, HTML, XML, Python, Perl, and many others.

If you’re looking for more programming assistance, look at Sublime and Kate. Sublime supports several programming languages and (as well as the popular ones) is able to highlight syntax for C#, D, Dylan, Erlang, Groovy, Haskell, Lisp, Lua, MATLAB, OCaml, R, and even SQL. If that isn’t enough for you, you can download add-ons to support even more languages.

Furthermore, its syntax highlighting ability offers several customisable options. The app will also match braces, to ensure they are all properly rounded off, and the auto-complete function in Sublime works with variables created by the user.

Just like Komodo IDE, sublime also displays a scrollable preview of the full source code, which is really handy for navigating long code files and lets you jump between different parts of the file.

One of the best features of Sublime is its ability to run code for certain languages like C++, Python, Ruby, etc from within the editor itself, assuming of course you have the compiler and other build system tools installed on your computer. This helps save time and eliminates the need to switch out to the command line.

You can also enable the build system in Kate with plugins. Furthermore, you can add a simple front-end to the GDB debugger. Kate will work with Git, Subversion and Mercurial version control systems, and also provides some functionality for project management.

It does all this in addition to highlighting syntax for over 180 languages, along with other assistance like bracket matching, auto-completion and auto-indentation. It also supports code folding and can even collapse functions within a program.

The only disappointment is jEdit, which bills itself as a programmer’s text editor, but it struggled with other basic functions such as code folding and wouldn’t even suggest or complete functions.

**Verdict:**

- Gedit:3/5
- Kate:5/5
- Sublime:5/5
- UltraEdit3/5
- jEdit:1/5

![If you don’t like Sublime’s Charcoal appearance, you can choose one of the other 22 themes included with ti.](http://www.linuxvoice.com/wp-content/uploads/2014/08/sublime-web.png)

If you don’t like Sublime’s Charcoal appearance, you can choose one of the other 22 themes included with ti.

### Keyboard control ###

Users of an advanced text editor expect to control and operate it exclusively via the keyboard. Furthermore, some apps even allow their users to further customise the key bindings for the shortcuts.

You can easily work with Gedit using its extensive keyboard shortcut keys. There are keys for working with and editing files as well as invoke tools for common tasks such as spellchecking a document. You can access a list of default shortcut keys from within the app, but there’s no graphical way to customise them. Similarly, to customise the keybindings in Sublime, you need to make modifications in its XML keymap files. Sublime has been criticised for its lack of a graphical interface to define keyboard shortcuts, but long-term users have defended the current file-based mechanism, which gives them more control.

UltraEdit is proud of its “everything is customisable” motto, which it extend to keyboard shortcuts. You can define custom hotkeys for navigating the menus and also define your own multi-key key-mappings for accessing its plethora of functions.

In addition to its fully customisable keyboard shortcuts, jEdit also has pre-defined keymaps for Emacs. Kate is equally impressive in this respect. It has an easily accessible window to customise the key bindings. You can change the default keys, as well as define alternate ones. Furthermore, Kate also has a Vi mode which will let users operate Kate using Vi keys.

**Verdict:**

- Gedit:2/5
- Kate:5/5
- Sublime:3/5
- UltraEdit:4/5
- jEdit:5/5

### Snippets and macros ###

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