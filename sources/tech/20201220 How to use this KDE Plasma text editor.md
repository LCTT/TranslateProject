[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use this KDE Plasma text editor)
[#]: via: (https://opensource.com/article/20/12/kwrite-kde-plasma)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use this KDE Plasma text editor
======
Part of the popular KDE Plasma desktop, KWrite hides a ton of useful
features in a deceptively simple, easy-to-use interface.
![Coding on a computer][1]

KWrite is a desktop text editor for KDE’s Plasma desktop. It’s meant to be a universal application that anyone can reasonably use when they need to jot down a quick note, write a school paper, do some programming, and/or anything else you can think to do with a text editor. It uses components of the [Kate editor][2] to create a simple interface but leverages those same components to provide a long list of useful features.

### Install

KWrite isn’t intended for general availability; it’s a component of the [Plasma desktop by KDE][3], so if you’re running Plasma, then you already have KWrite.

If you don’t run Plasma, then you can install Plasma, so you can either start using it along with KWrite or just use KWrite as needed. However, it’s intended as the default text editor for your Plasma desktop, so if you really want to use it as a standalone application, then it’s probably easier to just install Kate.

### Using KWrite

When you launch KWrite, you get what you’d expect from a text editor—a big empty field for typing, a menubar and toolbar at the top, and a status bar at the bottom. That’s all you really need to know before getting started. KWrite is an intuitive application, with toolbar buttons for the important activities such as opening and saving a file and a simple menu system for more advanced editing tasks.

![Kwrite terminal containing dark gray html code on white background][4]

Many of KWrite’s features are latent—they happen without you activating them yourself. For instance, should you open a file written in HTML, then KWrite highlights keywords (such as `class` and `id`) and recognizes code tags (such as `<p>` or `<div>`), and treats them differently than words of a natural language. The same happens when you load a file written in Python, and nothing happens for documents written primarily in a natural
language.

Of course, you don’t have to choose between just HTML, Python, and your native tongue. KWrite has support for lots of languages and formats (and for many, it even has auto-completion options).

For users who want a text editor with more than just obvious auto-load features, there are options in the Edit, View, and Tools menus. For instance, you can activate dynamic spell checking, run scripts, bring up a command line, comment or uncomment a line, adjust indentation, display line numbers, and much more.

There are also some interesting options when launching KWrite from a terminal. For instance, if you know exactly what line you want to navigate to in a file, you can launch KWrite with a line number argument:


```
`$ kwrite --line 101 example.txt`
```

You can also conveniently pipe the output of a command to KWrite using the `--stdin` (or just `-i` for short) option. For example, this command downloads the index page of [example.com][5] and displays the HTML in a new KWrite window:


```
`$ curl http://example.com | kwrite --stdin`
```

### Try KWrite

I’ve always felt that one of KDE’s strengths is that its perceived complexity is flexible—if you want a simple desktop, you can essentially choose to ignore any feature you don’t want. KWrite is an example of how that flexibility can also apply to developers. Because Kate has been engineered with so many features, it’s possible for developers to reuse a subset of those features to create a cleaner and more focused version of an application.

KWrite is a single-document editor. It doesn’t have tabs, nor any awareness of a project. It’s intended for people who want to work on exactly one document at a time and who want the basics to be active by default, with a selection of powerful editing tools available when needed. Install the excellent Plasma desktop and try it today!

KDE originally stood for Kool Desktop Environment, but is now known by many as the K Desktop...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kwrite-kde-plasma

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/20/12/kate-text-editor
[3]: https://opensource.com/article/19/12/linux-kde-plasma
[4]: https://opensource.com/sites/default/files/uploads/kwrite-31_days_kwrite-opensource.png (Kwrite terminal containing dark gray html code on white background)
[5]: http://example.com
