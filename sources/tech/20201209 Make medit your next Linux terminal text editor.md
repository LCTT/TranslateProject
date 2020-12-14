[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make medit your next Linux terminal text editor)
[#]: via: (https://opensource.com/article/20/12/medit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Make medit your next Linux terminal text editor
======
This classic text editor offers all the basics and some exciting extra
features that let you customize your experience.
![Person drinking a hot drink at the computer][1]

There’s [XEDIT][2], jEdit, NEdit, [gedit][3], and, as it turns out, [medit][4]. 

I had not heard about medit until I started searching for editors I hadn’t yet tried, but I’m glad to have discovered it. If you’re looking for a classic gedit experience (circa Gnome 2), then medit is, probably unintentionally, an excellent and modern approximation. It’s also got many additional features, such as the ability to write plugins in Python, Lua, or C, and a means to integrate even shell scripts into its menu system. All the other usual features are here, too—a tabbed interface, an on-demand shell, indentation management, syntax highlighting, and so on.

### Installing medit

You can download medit from [mooedit.sourceforge.net][5]. It’s confirmed to work on Linux and Windows. If you’re using Linux, you may also find it in your repository. I installed my copy from [slackbuilds.org][6] on Slackware.

![Medit terminal showing examples of Bash script in editor][7]

### Using medit

Medit advertises itself as an editor "for programming and around programming," and in fact, started its life out as part of a larger project called [GAP (Groups, Algorithms, Programming)][8]. Most of its features are aimed at typical developer expectations. For instance, in the **Edit** menu, there are options to increase and decrease indentation, a common task for any programmer trying to indicate scope visually (and a literal requirement for Python programmers), and options to comment or uncomment blocks of text.

Some features can be useful for general users, too. Medit has an easy-to-use tabbed interface (both at the top of the window and as a pop-up list along the side), a side panel for quick filesystem browsing, the ability to bookmark places in a file, and so on. It also has syntax highlighting for both programming languages, as well as markup and markdown languages, so it’s a useful editor for code and prose alike.

### Color schemes

When editing plain text with no syntax associated with it or a format like Asciidoc, for which medit has no preset highlighting scheme, the editor assumes your system default. I use a dark theme, so medit displays white text on a dark gray background.

For syntax highlighting, though, the text becomes colorful depending on the part each word plays in its structured language. At first, I was a little frustrated at some of the choices medit made; many of the colors were too dark against my dark background to be legible, and I didn’t feel that all the important elements were unique enough. The answer to this problem, should you disagree with medit’s choices, is in **Preferences**, where you can change the color theme. I changed mine to the Tango colors, which rendered a solarized color array that stood out nicely against my dark editor background and even added color to elements that were kept white under the medit theme.

![Medit terminal showing examples of Bash script in editor using Tango color scheme against dark background][9]

### Pop-up Python

At the bottom of the medit window, there’s a pop-up terminal for quick access to a shell. This is a nice feature, but frankly, after you’ve experienced Emacs and [Kate][10], it feels pretty common. What surprised me about medit was its pop-up Python console, which launches from the **Tools** menu with **moo** and **gtk** modules pre-imported. In other words, when you launch medit’s Python shell, you can look through the Python and GTK modules that medit itself is partly built upon. It’s a great feature and one that might inspire you to write a plugin (the Terminal pop-up is a plugin written in Python, so you can also look through its code to get a feel for how a plugin is written).

### Classic editing

Medit is a great GTK-based editor with all the important basic features and several tantalizing extras to help inspire you to extend the application and make it your own. As it accepts C, Python, Lua, and Bash, there are several entry points for doing just that. If you’re looking for a no-nonsense editor for your writing, whether it’s code or markdown or something in between, give medit a chance.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/medit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/article/20/12/xedit
[3]: https://opensource.com/article/20/12/gedit
[4]: http://mooedit.sourceforge.net/
[5]: https://sourceforge.net/projects/mooedit/files/medit/
[6]: https://slackbuilds.org/repository/14.2/development/medit
[7]: https://opensource.com/sites/default/files/uploads/medit-31_days_medit-opensource.png (Medit terminal showing examples of Bash script in editor)
[8]: https://www.gap-system.org/
[9]: https://opensource.com/sites/default/files/uploads/medit-tango-colour-31_days_medit-opensource.png (Medit terminal showing examples of Bash script in editor using Tango color scheme against dark background)
[10]: https://opensource.com/article/20/12/kate-text-editor
