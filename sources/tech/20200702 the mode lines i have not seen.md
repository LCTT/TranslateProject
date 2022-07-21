[#]: subject: "the mode lines i have not seen"
[#]: via: "https://jao.io/blog/2020-07-02-the-mode-lines-i-have-not-seen.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

the mode lines i have not seen
======

i don't dislike emacs' mode line, i just wish (possibly out of a fetish for simplicity and minimalistic user interfaces) sometimes it wasn't there.

There are lots of packages out there "modding" the content and looks of the mode line, but in general it's not looks that bother me and i've seen a tendency among them of not being good at covering all the bases: when using any of these packages, i've always found myself having to write extra code to bring back some bit of information or another.

What i really wanted was the ability to hide the mode line for inactive buffers (and, every now and then, the active one too), and, ideally, to do that on a per frame basis (as frames double as my workspaces, and they're thematic, i want, for instance, mode lines in all my w3m inactive buffers, and usually no mode line for my active PDF document).

Sometimes, one's wishes just come effortlessly true:

```

    (defun jao-toggle--face-height (face &optional all-frames)
      (let* ((h (face-attribute face :height (window-frame)))
             (nh (if (eq 'unspecified h) 1 'unspecified)))
        (set-face-attribute face (when (not all-frames) (window-frame)) :height nh)))

    (defun jao-toggle-mode-line (&optional all-frames)
      (interactive)
      (jao-toggle--face-height 'mode-line all-frames))

    (defun jao-toggle-inactive-mode-line (&optional all-frames)
      (interactive)
      (jao-toggle--face-height 'mode-line-inactive all-frames))

    (defun jao-echo-mode-line ()
      (interactive)
      (message "%s" (format-mode-line mode-line-format)))

```

That's it: all the requirements above fullfilled in a dozen lines of elisp. As you see, the trick is very simple: one can set the height of the mode line's face to 1, making it display as a line, and faces are frame-local entities.

In my init file, i then call `(jao-toggle-inactive-mode-line t)`, turn it back on some functions initialising my dedicated frames. `jao-echo-mode-line` comes in handy when i just want to see my active mode line's contents momentarily. i even found a good place in the thinkpad keyboard for shortcuts, with keys i literally never use for anything:

```

    (global-set-key (kbd "<home>") #'jao-toggle-inactive-mode-line)
    (global-set-key (kbd "<end>") #'jao-toggle-mode-line)
    (global-set-key (kbd "<insert>") #'jao-echo-mode-line)

```

[Tags][1]: [emacs][2]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2020-07-02-the-mode-lines-i-have-not-seen.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://jao.io/blog/tags.html
[2]: https://jao.io/blog/tag-emacs.html
