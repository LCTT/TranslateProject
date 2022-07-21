[#]: subject: "notmuch threads folding in emacs"
[#]: via: "https://jao.io/blog/2021-08-19-notmuch-threads-folding-in-emacs.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

notmuch threads folding in emacs
======

In the last couple of months, i've been moving from Gnus (after more than twenty years using it!) to notmuch, as part of a simplification journey (simpler code means a more hackable (emacs) environment) and also because tagging finally clicked-in (but don't believe anyone telling you that notmuch is only about tagging, it allows search and folder-based workflows just as nicely). Naturally, i've found several things i liked in Gnus's interface missing in notmuch's, but the simplicity of the latter has made possible implementing most of them, sometimes with remarkably little code. One of them is thread folding.

notmuch comes with a tree-view (for searches of kind _tree_ in notmuch's lingo) where you see your messages in a split window, with the upper half showing a forest of trees, similar to what you'd see in Gnus summary buffer (and many other clients, i suppose). Similar but not quite the same. In notmuch, all threads are always expanded, while Gnus has a nice mode in which all but the current one are folded. I _really_ wanted that in notmuch.

Well, emacs to the rescue. Folding and unfolding sections of a buffer is the bread and butter of many emacs packages (i'm sure you've heard of org mode), and one of the simpler and more robust of them is outline-mode. So how about we activate `outline-minor-mode` in `notmuch-tree-mode` buffers, with an appropriate regular expression definition making the first message of each thread a header of the buffer? Is there a common pattern in that first message that we can use? Well, not quite: since the format of the message lines is customizable by the user, it's difficult to come up with a pattern that is not brittle. Unless we insert in the buffer, invisibly, our own section marker:

```

    (defun jao-notmuch-tree--msg-prefix (msg)
      (insert (propertize (if (plist-get msg :first) "> " "  ") 'display "")))

```

and advice the notmuch function inserting messages (`notmuch-tree-insert-msg`) to call us:

```

    (advice-add 'notmuch-tree-insert-msg :before #'jao-notmuch-tree--msg-prefix)

```

With that, we've put an invisible `"> "` prefix on message lines that are the first in a thread (notmuch handily marks them with `:first` in the message metadata passed to `notmuch-tree-insert-msg`).

Now all we need is to tell outline mode to use a regular expression that recognises the marker above:

```

    (defun jao-notmuch-tree--mode-setup ()
      (setq-local outline-regexp "^> \\|^En")
      (outline-minor-mode t))
    (add-hook 'notmuch-tree-mode-hook #'jao-notmuch-tree--mode-setup)

```

And that's (almost) it! We have now at our disposal all outline commands in the tree view, with thread folding that is even more powerful than Gnus's. For starters, we can use `outline-cycle`: i have it in `TAB`:

```

    (define-key notmuch-tree-mode-map (kbd "TAB") #'outline-cycle)
    (define-key notmuch-tree-mode-map (kbd "M-TAB") #'outline-cycle-buffer)

```

and let's define a command that shows only the current thread and folds the others:

```

    (defun jao-notmuch-tree-hide-others (&optional and-show)
      (interactive)
      (outline-hide-body)
      (outline-show-entry)
      (when and-show (notmuch-tree-show-message nil)))

```

We can bind it to a convenient key, or perhaps just define a keymap with the most common outline commands and let my user bind it to the prefix they prefer:

```

    (defvar jao-notmuch-tree-prefix-map
      (let ((m (make-keymap "Thread operations")))
        (define-key m (kbd "TAB") #'outline-cycle)
        (define-key m (kbd "t") #'outline-toggle-children)
        (define-key m (kbd "s") #'outline-show-entry)
        (define-key m (kbd "S") #'outline-show-all)
        (define-key m (kbd "h") #'outline-hide-entry)
        (define-key m (kbd "H") #'outline-hide-body)
        (define-key m (kbd "o") #'jao-notmuch-tree-hide-others)
        (define-key m (kbd "n") #'outline-hide-other)
        m))

```

i like to have it at `"T"`:

```

    (define-key notmuch-tree-mode-map (kbd "T") jao-notmuch-tree-prefix-map)

```

There's still one gnusim i missed: i wanted to have a command that goes to the next (or previous) message (or thread) folding and unfolding threads if i went from one to another. That takes a little more work, but it's not too bad:

```

    (defun jao-notmuch--looking-at-new-p ()
      (when-let (ts (notmuch-show-get-tags))
        (or (member "unread" ts) (member "new" ts))))

    (defun jao-notmuch-tree--next (prev thread no-exit)
      (let ((line-move-ignore-invisible nil))
        (cond ((jao-notmuch--looking-at-new-p))
              (thread
               (when (notmuch-tree-next-thread prev)
                 (unless (jao-notmuch--looking-at-new-p)
                   (notmuch-tree-matching-message prev (not no-exit)))))
              ((notmuch-tree-get-message-id)
               (notmuch-tree-matching-message prev (not no-exit)))))
      (when (notmuch-tree-get-message-id)
        (jao-notmuch-tree-hide-others t)))

    (defun jao-notmuch-tree-next (thread &optional no-exit)
      "Next message or thread in forest, taking care of thread visibility."
      (interactive "P")
      (jao-notmuch-tree--next nil thread no-exit))

    (defun jao-notmuch-tree-previous (thread)
      "Previous message or thread in forest, taking care of thread visibility.."
      (interactive "P")
      (jao-notmuch-tree--next t thread t))

```

I just bind the two new commands to `n` and `p` in `notmuch-tree-mode-map`. The final icing on the cake is having the tree view start folded. Since notmuch doesn't provide a proper hook informing you when it's been fully populated, we have to recur again to a little advice, this time for the function that is called when the notmuch process filling the buffer is done, namely `notmuch-tree-process-sentinel`:

```

    (defun jao-notmuch--tree-sentinel (proc &rest _)
      (when (eq (process-status proc) 'exit) (jao-notmuch-tree-hide-others)))

    (advice-add 'notmuch-tree-process-sentinel :after #'jao-notmuch--tree-sentinel))

```

And we're done. As mentioned, i find it very remarkable how little code is needed to get such a robust feature, thanks to the plethora of libraries already available in the elisp environment and the flexibility of the means at your disposal to combine them.

You can find the current status of this hack as part of my little [jao-notmuch][1] personal package for notmuch extensions.

Happy folding!

[Tags][2]: [emacs][3]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-08-19-notmuch-threads-folding-in-emacs.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://codeberg.org/jao/elibs/src/branch/main/lib/net/jao-notmuch.el#L302
[2]: https://jao.io/blog/tags.html
[3]: https://jao.io/blog/tag-emacs.html
