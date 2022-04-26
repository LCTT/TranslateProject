[#]: subject: "Hands on With GNOME’s New Text Editor for Linux Users"
[#]: via: "https://itsfoss.com/gnome-text-editor/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hands on With GNOME’s New Text Editor for Linux Users
======

If you are a regular reader here on It’s FOSS, you might have read about [GNOME’s plan to replace Gedit with their own text editor][1].

Yes, GNOME has a brand-new text editor and it is called, well, Text Editor.

While Gedit is still the default, this new editor has made an entry with the release of GNOME 42. I am using Ubuntu 22.04 and it is available to install from the repositories.

Not exactly a brand-new [feature of Ubuntu 22.04][2], this new editor is available to install in the latest Ubuntu LTS version and perhaps other distributions using GNOME 42.

Intrigued? Let me share my experience with this new editor and then I’ll show you the installation steps.

### Experience with GNOME Text Editor

Built on top of the [controversial libadwaita][3], GNOME Text Editor follows the new design principles set by its development committee. It has a sleek, modern look with rounded corners.

Don’t expect anything extraordinary here in terms of features. It’s not a replacement of coding focused editors like [Atom or VS Code][4]. This also doesn’t mean it’s as plain and simple as Windows’ Notepad.

Let’s see what it has to offer.

#### Saved sessions

By default, GNOME Text Editor automatically opens the last opened files. This is a neat feature that lets you resume your work.

This behavior can be controlled by the Restore Session option under Preferences.

![][5]

You can also search and open the recently opened files. Clearing the history (as shown in the above image) will clear the recently accessed files.

#### Themes and in-built themes

Like new GNOME applications, it gives you three theming style to choose from: system theme, light theme and dark theme. If you have chosen system theme, the editor will automatically switch between light and dark theme based on the system theme (light or dark) in use.

![System theme option gnome text editor][6]

Apart from that, you can choose between eight available themes (available in dark and light variants) under the preference section.

![Theme options under preference][7]

You can see the changes immediately as you select the themes.

#### Changes and Unsaved file handling

Modified and unsaved files are prominently reflected while you work on them.

![Unsaved files are more prominently marked][8]

You’ll obviously be warned if you try to close the editor with modified files.

![][9]

There is no automatic save options here. [Gedit has option for automatically saving files][10] without using any additional plugins.

#### No plugins

Speaking of plugins, there is no such system for the new text Editor yet. Gedit has a decent plugin ecosystems that helps in enhancing the capacity of the editor.

I don’t have any concrete information if plugins will be allowed in this editor in the future or not.

#### Syntax highlighting

Syntax highlight is an integral part of text editors these days. GNOME Text Editor promptly highlights syntax for various programming language.

This is usually done based on the extension of the code file. However, I noticed that it also detects and highlights syntax for bash scripts and C/C++ programs even before saving the file.

![Bash scripts. C/C++ code are detected even without file extension][11]

#### Keyboard shortcuts

I love using keyboard shortcuts in my favorite applications. It makes things quicker.

The GNOME Text Editor supports plenty of keyboard shortcuts for all kind of actions. You can find the list of keyboard shortcuts under the hamburger menu (☰) or use the keyboard shortcut Ctrl+?.

![Keyboard shortcuts in GNOME Text Editor][12]

#### Search and replace

Text Editor has pretty decent find and replace feature. You can use set extra parameters like regex search, case-sensitive search or match exact words.

![search replace gnome text editor][13]

#### More features

There are several other features that you may find in Gedit:

  * Spell check
  * Line numbers
  * Automatic indentation
  * Space/tab indentation
  * Change case
  * Text wrapping



#### What it doesn’t do?

It is essentially a text editor, so you cannot open doc files in it and that’s by design. If you open a doc file, you’ll see gibberish. The same goes for PDF files.

![][14]

Also, it is not intended for hardcore coding. It cannot replace the likes of VS Code. It is okay for occasional code reading or shell scripting but it doesn’t have the features like project folders or running the codes.

### Installing GNOME Text Editor

As stated earlier, it is available with GNOME 42, but not installed by default. In Ubuntu 22.04, it is available in the Universe repository and can be installed with the following command:

```

    sudo apt install gnome-text-editor

```

It should be available in other distros with GNOME 42. Please [check the version of desktop environment][15] you are using.

Once installed, you can search and open it in the Activities area. The icon for the new editor is a refreshed version of the Gedit icon.

![][16]

### Conclusion

The good old [Gedit][17] has been a part of GNOME for a long time. There were lack of development a few years ago but the development has resumed again. However, the GNOME team is working on revamping their core applications for GTK 4 and libadwaita.

This new Text Editor looks like a reimplementation of the Gedit with similar interface and feature but a more fluid experience which is more consistent with the new GNOME design.

It won’t surprise me that this new editor becomes the default text editor in the coming version of GNOME. It would be interesting to see if a plugin ecosystem is developed for the new editor or not.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-text-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/gnome-text-editor-to-replace-gedit/
[2]: https://itsfoss.com/ubuntu-22-04-release-features/
[3]: https://news.itsfoss.com/gnome-libadwaita-library/
[4]: https://itsfoss.com/visual-studio-code-vs-atom/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/restore-session-option-gnome-text-editor-1.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/system-theme-option-gnome-text-editor-800x560.png
[7]: https://itsfoss.com/wp-content/uploads/2022/04/theme-options-gnome-text-editor.png
[8]: https://itsfoss.com/wp-content/uploads/2022/04/unsaved-file-gnome-text-editor-800x481.png
[9]: https://itsfoss.com/wp-content/uploads/2022/04/save-prompt-gnome-text-editor.png
[10]: https://itsfoss.com/how-to-enable-auto-save-feature-in-gedit/
[11]: https://itsfoss.com/wp-content/uploads/2022/04/syntax-highlight-gnome-text-editor.png
[12]: https://itsfoss.com/wp-content/uploads/2022/04/keyboard-shortcuts-gnome-text-editor-800x637.png
[13]: https://itsfoss.com/wp-content/uploads/2022/04/search-replace-gnome-text-editor-800x477.png
[14]: https://itsfoss.com/wp-content/uploads/2022/04/doc-in-gnome-text-editor-800x485.png
[15]: https://itsfoss.com/find-desktop-environment/
[16]: https://itsfoss.com/wp-content/uploads/2022/04/new-gnome-text-editor.png
[17]: https://wiki.gnome.org/Apps/Gedit
