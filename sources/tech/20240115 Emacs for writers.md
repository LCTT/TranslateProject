[#]: subject: "Emacs for writers"
[#]: via: "https://fedoramagazine.org/emacs-for-writers/"
[#]: author: "odisej https://fedoramagazine.org/author/odisej/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Emacs for writers
======

![][1]

Photo by [Christin Hume][2] on [Unsplash][3]

This is an article about my journey to finding and configuring Emacs as a writer’s text editor and the results of my journey.

### The journey begins

Sometimes, being a computer user can feel somewhat like being a treasure hunter. Think about it: you’re on a quest to find that one application that perfectly suits your needs. You start your search, seeking the treasure map on some website or forum that will point you to the ‘X’ marking the spot. When you finally find it, you feel like you’ve struck gold. This is how I felt when I discovered GNU Emacs and started using it as a journalist’s tool, as opposed to a programming tool or for any other task it is capable of.

Continuing with the treasure hunting parable: the path through the jungle was neither easy nor short. My goal was to find a distraction-free text editor or word processor that would work on Linux. This was several years ago, and the selection was not that extensive, even though the distraction-free trend was starting to gain momentum. There were options like Pyroom (still available today), FocusWriter (still actively developed), and AbiWord, which has a useful full-screen mode. I’d stick with one or the other for a month or two, but eventually, I’d encounter some limitations. I also tried using old programs like Word Perfect and WordStar in an emulated environment. It wasn’t a great experience because they lacked support for Unicode, which caused additional problems with different code pages.

Then the discovery: GNU Emacs – _dnf install emacs_. This command will install the entire package, along with the default GTK version of the software.

### Unlocking Potentials

I remember seeing a screenshot somewhere and liking the simplicity. However, opening this treasure chest was far from easy. Emacs is, in many ways, idiosyncratic — its logic predates many modern editors and word processors. They warned me: the learning curve is steep, but once you get there, you’ll be hooked. And so it went. Trying to unlock its potential with all the shortcut combinations often felt like being a skilled lockpicker. But eventually, it clicked.

### Modes

Emacs, when you first open it, isn’t particularly useful for writing. It’s essentially just a simple text editor with some rather intricate shortcut combinations. The magic happens in Emacs’ modes, and there are many to choose from. That is how you can customize Emacs to dance to your tune. Understanding the concept of modes is crucial. There are major modes and minor modes. Some are included by default and others require installation. A major mode determines the editing behavior, a minor mode is an optional feature which you can turn on or off and is not necessarily specific to a type of file.

### Packages and Repositories

Emacs also has its own packages and repositories, some of which are available as packages in Fedora repositories, as well. However, enabling third-party repositories inside Emacs is often necessary. MELPA is one of the most commonly used ones. Instructions for it’s use are found at [MELPA’s Getting Started page][4].

#### Visual-line-mode

To make Emacs suitable for writing articles and books, I had to familiarize myself with several modes. Let’s start with ‘visual-line-mode’. This mode is available by default and serves as a line-wrapping feature that essentially turns on word wrapping.

You can activate any major or minor mode by pressing _M-x_ (usually _ALT + x_ ) and then typing the name of the mode, in this case, _visual-line-mode_. Hitting Return completes the action and word wrapping is immediately enabled.

#### Spelling

Spelling is essential too, and Emacs offers a _flyspell-mode_. You can change the dictionary at any time by using _ispell-change-dictionary_ , for example. You can find more information about the capabilities of FlySpell on [EmacsWiki’s FlySpell page][5].

#### Counting

Character and word count are also crucial pieces of information for every writer. _wc-mode_ can be your ally; you can access it on [GitHub][6]. It’s a minor mode that provides a _wc_ function and adds live word, line, and character counts to the modeline. Additionally, users can set specific goals for adding or deleting words.

### Configuration

By this point, Emacs has become a respectable tool for writing, but we can continue to enhance its capabilities.

I personally dislike the shape of modern computer screens for writing preferring narrower margins for text. Emacs can be configured to accommodate this. (I can’t recall the source for this particular recipe, probably from Stack Overflow.)

But before we dive into the code there is another essential aspect of Emacs we have to understand: its configuration file. Traditionally, _/.emacs_ serves as the init file, but Emacs also looks at _/.emacs.el_ , _/.emacs.d/init.el_ , and _/.config/emacs/init.el_. These configuration file enables us to customize how Emacs functions to our preferences.

Without delving too deeply into the technical aspects, suffice it to say that we can specify which modes should start automatically and which minor modes should be used with a major mode. Emacs uses hooks for this, and you can see how it works by checking out my _init.el_ file (see below). This means that we can set up Emacs so that word count is always displayed when we open a text file, or we can start ‘flyspell’ every time we work on it.

If there’s something outside of the available modes, it can be added to the configuration file. This is the case with the margins. Adding the following to the _init.el_ file sets the margins and assigns the F5 key to toggle the margins on or off:

```

    (defun my-set-margins ()
    "Set margins in current buffer."
    (setq left-margin-width 1)
    (setq right-margin-width 1))

```

```

    (add-hook 'text-mode-hook 'my-set-margins)

```

```

    (defun my-toggle-margins ()
    "Set margins in current buffer."
    (interactive)
    (if (or (> left-margin-width 0) (> right-margin-width 0))
    (progn
    (setq left-margin-width 0)
    (setq right-margin-width 0)
    (set-window-buffer (selected-window) (current-buffer)))
    (setq left-margin-width 26)
    (setq right-margin-width 26)
    (set-window-buffer (selected-window) (current-buffer))))

```

```

    (global-set-key [f5] 'my-toggle-margins)

```

One can also customize typographical punctuation marks. More information on this is available at [Emacswiki][7].

You can even make every keypress sound like an old typewriter using the [selectric-mode][8].

### Keystrokes and short cuts

Now, we will delve into some intriguing details that showcase the flexibility of Emacs.

#### Buffers

Emacs also has its special buffer (the text you are editing in Emacs resides in an object called a buffer), where you can quickly jot down a thought, fact, or reminder. As you write, this can be very helpful. All notes can be saved in a separate file later. You can navigate between all the open buffers by pressing _Ctrl + left arrow_ or _Ctrl +_ _right arrow_.

#### Viewing other files/web pages

You can easily open other files, or browse the web with the built-in EWW browser ( _Alt + x EWW_ ). It’s essentially a text browser, somewhat like Lynx. It provides just what you need to check something on the web. It’s so much more convenient to do all of this within Emacs itself rather than constantly switching to the system’s default browser. Once you get used to it, the mouse is rarely used in Emacs.

#### Split screens

Shortcuts, such as _Ctrl + x 3_ (meaning you have to press _Ctrl_ and _x_ together and then _3_ ), are available for use at any time. This particular shortcut splits the screen vertically into two halves, allowing you to view two different files simultaneously or scroll through the same one. _Ctrl + x 2_ can split the screen horizontally, and you can do this multiple times, opening many different buffers.

#### Keystrokes for undo, cut, and paste

_Ctrl + x u_ is undo, _Ctrl + space_ marks the beginning and end of a selection, somewhat like WordStar. This is one of the things I love most when writing in Emacs. _Ctrl + w_ cuts the text, _Alt + w_ copies it, and _Ctrl + y_ pastes it. _Ctrl + x + Ctrl + f_ opens a file. I did mentioned that Emacs has some interesting quirks?

#### There is much more

You can change the colors and themes to your liking, adjust the default font, and save your preferences. Sometimes I like to use old classical green or orange themes and change the font to CGA or VGA. It’s easy to do and find; look it up.

At times, it may seem like there are no limits to customizing Emacs. What it offers is truly remarkable.

For me, I believe I’ve found the perfect tool for writing. Some of the reasons are mentioned above, but there are many more.

### Save that configuration

Before concluding, there’s one more advantage to mention. When you find that perfect configuration file, you can simply copy it to other computers you use, and when you switch to the new one, you’ll have the Emacs setup you want immediately available.

### Finally…

If George R. R. Martin, the author of the popular ‘A Song of Ice and Fire’ series of books (which inspired the ‘Game of Thrones’ TV series), decides to move away from WordStar, which he is reportedly still using, I would recommend Emacs to him. Someone else may need to configure it for him initially, but afterward, he would feel right at home. There is even a ‘wordstar-mode’ if he wishes to stick to some of the WordStaresque shortcuts.

Why some avid writers, such as me, prefer the old-fashioned look of the editor is probably something another celebrity, famous TV-psychiatrist Frasier, might answer, but we are around. And when we find that perfect tool, it really feels like finding a real treasure.

### P.S.

Post Scriptum: writing this article I stumbled upon this excellent resource should you like to dive into the depths of [writing on Emacs][9]. Highly recommended.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/emacs-for-writers/

作者：[odisej][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/odisej/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/EMACS_for_writers-816x345.jpg
[2]: https://unsplash.com/@christinhumephoto?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/person-sitting-front-of-laptop-mfB1B1s4sMc?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://melpa.org/#/getting-started
[5]: https://www.emacswiki.org/emacs/FlySpell
[6]: https://github.com/bnbeckwith/wc-mode
[7]: https://www.emacswiki.org/emacs/TypographicalPunctuationMarks
[8]: https://github.com/rbanffy/selectric-mode
[9]: https://github.com/thinkhuman/writingwithemacs
