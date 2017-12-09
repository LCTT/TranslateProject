translating---geekpi

Suplemon - Modern CLI Text Editor with Multi Cursor Support
======
Suplemon is a modern text editor for CLI that emulates the multi cursor behavior and other features of [Sublime Text][1]. It's lightweight and really easy to use, just as Nano is.

One of the benefits of using a CLI editor is that you can use it whether the Linux distribution that you're using has a GUI or not. This type of text editors also stands out as being simple, fast and powerful.

You can find useful information and the source code in the [official repository][2].

### Features

These are some of its interesting features:

*   Multi cursor support

*   Undo / Redo

*   Copy and Paste, with multi line support

*   Mouse support

*   Extensions

*   Find, find all, find next

*   Syntax highlighting

*   Autocomplete

*   Custom keyboard shortcuts

### Installation

First, make sure you have the latest version of python3 and pip3 installed.

Then type in a terminal:

```
$ sudo pip3 install suplemon
```

Create a new file in the current directory

Open a terminal and type:

```
$ suplemon
```

![suplemon new file](https://linoxide.com/wp-content/uploads/2017/11/suplemon-new-file.png)

Open one or multiple files

Open a terminal and type:

```
$ suplemon   ... 
```

```
$ suplemon example1.c example2.c
```

Main configuration

You can find the configuration file at ~/.config/suplemon/suplemon-config.json.

Editing this file is easy, you just have to enter command mode (once you are inside suplemon) and run the config command. You can view the default configuration by running config defaults.

Keymap configuration

I'll show you the default key mappings for suplemon. If you want to edit them, just run keymap command. Run keymap default to view the default keymap file.

*   Exit: Ctrl + Q

*   Copy line(s) to buffer: Ctrl + C

*   Cut line(s) to buffer: Ctrl + X

*   Insert buffer: Ctrl + V

*   Duplicate line: Ctrl + K

*   Goto: Ctrl + G. You can go to a line or to a file (just type the beginning of a file name). Also, it is possible to type something like 'exam:50' to go to the line 50 of the file example.c at line 50.

*   Search for string or regular expression: Ctrl + F

*   Search next: Ctrl + D

*   Trim whitespace: Ctrl + T

*   Add new cursor in arrow direction: Alt + Arrow key

*   Jump to previous or next word or line: Ctrl + Left / Right

*   Revert to single cursor / Cancel input prompt: Esc

*   Move line(s) up / down: Page Up / Page Down

*   Save file: Ctrl + S

*   Save file with new name: F1

*   Reload current file: F2

*   Open file: Ctrl + O

*   Close file: Ctrl + W

*   Switch to next/previous file: Ctrl + Page Up / Ctrl + Page Down

*   Run a command: Ctrl + E

*   Undo: Ctrl + Z

*   Redo: Ctrl + Y

*   Toggle visible whitespace: F7

*   Toggle mouse mode: F8

*   Toggle line numbers: F9

*   Toggle Full screen: F11

Mouse shortcuts

*   Set cursor at pointer position: Left Click

*   Add a cursor at pointer position: Right Click

*   Scroll vertically: Scroll Wheel Up / Down

### Wrapping up

After trying Suplemon for some time, I have changed my opinion about CLI text editors. I had tried Nano before, and yes, I liked its simplicity, but its modern-feature lack made it non-practical for my everyday use.

This tool has the best of both CLI and GUI worlds... Simplicity and feature-richness! So I suggest you give it a try, and write your thoughts in the comments :-)

--------------------------------------------------------------------------------

via: https://linoxide.com/tools/suplemon-cli-text-editor-multi-cursor/

作者：[Ivo Ursino][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linoxide.com/author/ursinov/
[1]:https://linoxide.com/tools/install-sublime-text-editor-linux/
[2]:https://github.com/richrd/suplemon/
