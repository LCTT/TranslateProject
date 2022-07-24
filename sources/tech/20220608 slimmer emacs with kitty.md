[#]: subject: "slimmer emacs with kitty"
[#]: via: "https://jao.io/blog/2022-06-08-slimmer-emacs-with-kitty.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

slimmer emacs with kitty
======

A problem of using Emacs as my operating system is that any otherwise minor friction with its interface quickly becomes an irritant, and i thus find myself needed a truly smooth emacs-human interaction; or, to be more precise _emacs-jao_ interaction: my must needs are going to be, sometimes, triffles to you, and the other way round.

During the last year, a perceived sluggishness in Emacs's X11 display performance, together with a very noticeably increased RAM consumption have become one of those irritants, and i decided that enough is enough, and moved (for the time being at least) from exwm to, essentially, using xmonad and kitty as my Emacs's display engine.

![][1]

For several years now, i've been using exwm as my main desktop, and been quite happy with it. One of the reasons is that i almost don't get bit by blocking external programs because, well, i don't use many external programs. It's still a bit annoying when every now and then emacs gets stuck in a busy loop and i have to wait to regain control of my computer (since emacs is single threaded), and for that reason, i also have an [xmonad configuration][2] tailored to essentially use emacs for everything, with an occasional detour to a web browser or maybe a video player. That way, if emacs gets stuck, i can do something else, and, also, i don't need to restart my desktop when i recompile Emacs.

Before that, i had been using emacs as a daemon and `emacsclient -t` in an `rxvt` terminal as my primary emacs interface for many years. The limitations weren't many for my use cases: one cannot display images, but it's very easy to set up things so that one gets a, say, `feh` pop up when needed (which is not often) or open an `eww` buffer in Firefox instead; and one cannot display PDFs inside Emacs. That last one was harder, because i keep my notes (using a [very simple library of mine][3]) in org mode with links to PDFs and need to be able to easily go from one to the other. I found a good (for my needs) solution for the latter too, but well, running Emacs under X11 (or even under wayland in sway) also worked and was convenient, so i thoght my terminal days were just a fond memory.

Until a year or so ago, when i started noticing my X11 Emacs instance consuming considerably more RAM (as in, 5 times what it used to need for long running sessions… still more or less what a "modern" browser takes, i know, but i don't want my Emacs to resemble a browser in any way). I normally run Emacs compiled from master, so hiccups happen and i didn't panic: there probably was some accidental leak that would be fixed and i could even help locating it. Unfortunately, with the release of Emacs 28, this higher memory needs seem consolidated (and no, i don't use native compilation, so they don't come from there), as is the tendency to eat more memory as the session grows longer (without changes in my usage patterns, the RSS footprint of the process tends to increase at least 500Mb per day). And, even more unfortunately, i seem to be the only person on earth suffering from this: i haven't found yet any fellow emacser observing the problem, and, although i've tried, i couldn't find a single package (or combination thereof) causing this issue. Except, that is, for the X11 display mode.

Fact is, if i run emacs in a terminal with the same packages as normal and with the same usage patterns (which are essentially the same as when i use it in X11), there is no memory leak. Once i load the standard set of packages i use (chats, eww, notmuch, cider, that kind of thing, plush all [my customizations][4]), an X11 emacs will take around 500Mb RAM, while a terminal one is happy with 250Mb. And that's fair enough. Problem is, after 3 or 4 days using the X11 version, RAM is consumption jumping to 3 or 4 Gb, while a terminal-based emacs used in essentially the same way will typically be around 500Mb.

Thanks to the experiment above, i'm reasonably sure that the graphical interface is at the root of my memory woes. That by itself would have already been enough to seriously consider a return to my emacs daemon days, but there was more: using emacs in an X terminal after all this time, really made me realize how slow the rendering in X11 Emacs is by comparison. I mean, rendering in X11 is not slow in absolute terms, it's perfectly usable in my experience; but, in a terminal? let me tell you, it's _fast_, an a real pleasure to use.

So all i needed was to smooth out a few wrinkles and it'd be a done deal. First thing was to try with [kitty][5] as terminal emulator, just because it's the one i use these days and i like how it's developed. It took a bit of wrestling to make sure that my usual keybindings (or slight modifications of them) would work, and also some documentation reading to come up with a good configuration, but it wasn't too hard: you can find my `kitty.conf` [here][6]. A point worth making is that running Emacs with kitty as a graphical frontend is, for practical purposes, very close to running Emacs in "graphical mode"; for instance, kitty has background transparency, uses the same font rendering engine ([HarfBuzz][7]) as X11 Emacs, and it's perfectly able to display things like emojis; it just does all that faster! One only needs to get rid of the discontinuous vertical separators in Emacs:

```

    (set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?│))

```

and also clean up the end of the modeline:

```

    (setq mode-line-end-spaces nil)

```

and then you get the screenshot above of some random buffers in and emacs running with the config above (and my regular color theme): as you can see, hard to distinguish from an X session.

Also, i definitely needed to interact seamlessly with the X clipboard, as you'd do in X11 Emacs:

```

    (use-package xclip
      :ensure t)

    (unless (display-graphic-p) (xclip-mode 1))

```

As mentioned, i delegate image display to `feh` and `firefox` in the few cases i need it, and interplay with `zathura` to handle PDFs and my associated notes, but that's stuff for a future post[1][8]. With that in place, i'm finding myself pretty comfortable living in terminal Emacs most of my time.

Speedy hacking!

### Footnotes:

[1][9]

The gist of it is pretty simple though, and it's basically distilled in [this section][10] of my configuration.

[Tags][11]: [emacs][12]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2022-06-08-slimmer-emacs-with-kitty.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://jao.io/img/emacs-kitty.png
[2]: https://codeberg.org/jao/xmonad-config
[3]: https://codeberg.org/jao/elibs/src/branch/main/lib/doc/jao-org-notes.el
[4]: https://codeberg.org/jao/elibs/src/branch/main
[5]: https://sw.kovidgoyal.net/kitty/
[6]: https://codeberg.org/jao/elibs/src/branch/main/data/kitty.conf
[7]: https://en.wikipedia.org/wiki/HarfBuzz
[8]: tmp.aRLm0IGxe1#fn.1
[9]: tmp.aRLm0IGxe1#fnr.1
[10]: https://codeberg.org/jao/elibs/src/main/init.el#L1595
[11]: https://jao.io/blog/tags.html
[12]: https://jao.io/blog/tag-emacs.html
