[#]: subject: "transient"
[#]: via: "https://jao.io/blog/2020-05-02-transient.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

transient
======

Emacs being, essentially, my operating system and window manager, i've had since i remember a set of keybinding maps grouped by functionality (sleep and related operations, media player control, network access, and so on), whereby every group of commands starts with the same prefix. E.g., all my commands controlling media have a keybinding starting with `C-c m`. Nothing earthshaking, and pretty common. Recently, the [transient][1] library has made my life easier in this department.

For instance, this is how i configured my keybindings for the "media keymap":

```

    (global-set-key [(control ?c) ?m ?L] #'jao-player-show-lyrics)
    (global-set-key [(control ?c) ?m ?b] #'jao-player-browse)
    (global-set-key [(control ?c) ?m ?d] #'jao-player-volume-lower)
    (global-set-key [(control ?c) ?m ?k] #'jao-player-stop)
    (global-set-key [(control ?c) ?m ?l] #'jao-player-list)
    (global-set-key [(control ?c) ?m ?L] #'jao-player-show-lyrics)
    (global-set-key [(control ?c) ?m ?m] #'jao-player-toggle)
    (global-set-key [(control ?c) ?m ?N] #'jao-player-random-album)
    (global-set-key [(control ?c) ?m ?n] #'jao-player-next)
    (global-set-key [(control ?c) ?m ?p] #'jao-player-previous)
    (global-set-key [(control ?c) ?m ?q] #'jao-player-search)
    (global-set-key [(control ?c) ?m ?u] #'jao-player-volume-raise)
    (global-set-key [(control ?c) ?m ?w] #'jao-player-osd)
    (global-set-key [(control ?c) ?m ?W] #'jao-player-echo)
    (global-set-key [(control ?c) ?m ?x] #'jao-player-start)

```

Over time, most of these bindings become second nature, and i remember easily the ones i use most. But there are those that i use rarely, and on occasion i simply forget they exist at all. To ameliorate that problem, i could always use `C-c C-m C-h`, which would show me a list of available completions (or, a bit more fancily, [which-key][2]), but with transient i can do even better: define a transient menu collecting all the commands, grouped by type, like this:

```

    (define-transient-command jao-media-menu ()
      [["Player"
        ("m" "toogle" jao-player-toggle)
        ("s" "start" jao-player-start)
        ("n" "next" jao-player-next)
        ("p" "previous" jao-player-previous)
        ("k" "stop" jao-player-stop)
        ("w" "now playing" jao-player-osd)
        ("W" "now playing (text)" jao-player-echo)]
       ["Songs"
        ("b" "browse" jao-player-browse)
        ("q" "search" jao-player-search)
        ("l" "show play list" jao-player-list)
        ("L" "show lyrics" jao-player-show-lyrics)
        ("N" "random album" jao-player-random-album)]
       ["Volume"
        ("v" "show volume" jao-player-show-volume)
        ("M" "master toggle" jao-mixer-master-toogle)
        ("d" "master down" jao-mixer-master-down)
        ("u" "master up" jao-mixer-master-up)
        ("D" "capture down" jao-mixer-capture-down)
        ("U" "capture up" jao-mixer-capture-up)
        ("x" "reset exwm" exwm-reset)]])

```

and bind the menu to my prefix, `C-c m`:

```

    (global-set-key (kbd "C-c m") #'jao-media-menu)

```

Now, upon pressing `C-c m` i see immediately a pop-up with all possible completions, as a nice reminder of what's available, and unobstrusive in that, for those key chords i do remember well, the invocation mechanics is exactly the same.

![][3]

Another really, really nice thing about transient is its excellent documentation. It is for such care and attention to detail that i am a fan of the work of [Jonas Bernoulli][4].

[Tags][5]: [emacs][6]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2020-05-02-transient.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://emacsair.me/2019/02/14/transient-0.1/
[2]: https://github.com/justbur/emacs-which-key
[3]: https://jao.io/img/transient.png
[4]: https://emacsair.me/
[5]: https://jao.io/blog/tags.html
[6]: https://jao.io/blog/tag-emacs.html
