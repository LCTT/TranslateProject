[#]: subject: "a gnus enters a side-bar"
[#]: via: "https://jao.io/blog/2020-05-08-a-gnus-enters-a-side-bar.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

a gnus enters a side-bar
======

![][1]

i typically organize my computing sessions around _workspaces_, which in emacs are simply glorified default window configurations, sometimes in a one-to-one relationship with emacs frames[1][2]. That's specially natural if you use exwm, where there's a concept of workspace essentially equivalent to emacs frame. So here too i'll have a "coding" workspace with programming buffers, a "browsing" one inhabited by emacs-w3m buffers in a two-pane layout, an "X" for the few non-emacs applications i use, and one devoted to "email/calendar/agenda", where Gnus plays a central role.

Until recently, my "Gnus" workspace consisted only of Gnus-related windows (the group, summary, message triumvirate, basically) and i would open my org agenda, or visit the calendar in that workspace as needed. But the thing is, a 1920x1080 frame (or 272x70 columns one, with my current default font) is a lot of space for browsing email alone, and it'd be nice to have there a "side bar" of sorts always displaying (say, on a right column occupying a third of the horizontal space) my "inbox.org", agenda and calendar, while browsing emails and news with Gnus' three usual panes sharing the other two thirds on the left of the screen.

Enter Gnus window configurations, which can fulfill my desires with the following configuration:

```

    (let ((side-bar '(vertical 1.0
                               ("inbox.org" 0.4)
                               ("*Org Agenda*" 1.0)
                               ("*Calendar*" 8))))
      (gnus-add-configuration
       `(article
         (horizontal 1.0
                     (vertical 63 (group 1.0))
                     (vertical 120
                               (summary 0.25 point)
                               (article 1.0))
                     ,side-bar)))

      (gnus-add-configuration
       `(group (horizontal 1.0 (group 183 point) ,side-bar)))

      (gnus-add-configuration
       `(message (horizontal 1.0 (message 183 point) ,side-bar)))

      (gnus-add-configuration
       `(reply-yank (horizontal 1.0 (message 183 point) ,side-bar)))

      (gnus-add-configuration
       `(summary
         (horizontal 1.0
                     (vertical 63 (group 1.0))
                     (vertical 120 (summary 1.0 point))
                     ,side-bar)))

      (gnus-add-configuration
       `(reply
         (horizontal 1.0
                     (message 90 point)
                     (article 100)
                     ,side-bar))))

```

You can see the "side bar" with the three buffers there, which one can change for whatever others are useful, and how we define layouts for the basic Gnus views: one for the group view, another for seeing the summary and messages (in a 3-pane configuration), and we also keep the side-bar visible when composing and replying to email.

All that i needed besides that in my `gnus.org` was a function to initialize the workspace calling `calendar` and `org-agenda-list` and visiting my `inbox.org` file and this hook:

```

      (defun jao-gnus--summary-done ()
        (save-window-excursion
          (org-agenda-list)))

    (add-hook 'gnus-summary-prepared-hook #'jao-gnus--summary-done)

```

which updates my agenda view in the side-bar every time i enter an email or news group (which is often enough to keep it fresh). As a nice side-effect of this arrangement, i've managed to pay more attention to my Org agenda: i kept forgetting looking at it, but i never forget to check my email :)

### Footnotes:

[1][3]

But not necessarily; all one needs is a way to store the current window configuration in a register and give it a name, and then creating a bunch of shortcuts to recover those configurations by name.

[Tags][4]: [emacs][5]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2020-05-08-a-gnus-enters-a-side-bar.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://jao.io/img/gnus-side-bar.png
[2]: tmp.pAT1SJrBiN#fn.1
[3]: tmp.pAT1SJrBiN#fnr.1
[4]: https://jao.io/blog/tags.html
[5]: https://jao.io/blog/tag-emacs.html
