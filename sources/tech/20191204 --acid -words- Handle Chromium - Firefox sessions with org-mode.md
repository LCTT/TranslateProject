[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (#:acid 'words: Handle Chromium & Firefox sessions with org-mode)
[#]: via: (https://acidwords.com/posts/2019-12-04-handle-chromium-and-firefox-sessions-with-org-mode.html)
[#]: author: (Sanel Z https://acidwords.com/)

Handle Chromium & Firefox sessions with org-mode
======

I was big fan of [Session Manager][1], small addon for Chrome and Chromium that will save all open tabs, assign the name to session and, when is needed, restore it.

Very useful, especially if you are like me, switching between multiple "mind sessions" during the day - research, development or maybe news reading. Or simply, you'd like to remember workflow (and tabs) you had few days ago.

After I decided to ditch all extensions from Chromium except [uBlock Origin][2], it was time to look for alternative. My main goal was it to be browser agnostic and session links had to be stored in text file, so I can enjoy all the goodies of plain text file. What would be better for that than good old [org-mode][3] ;)

Long time ago I found this trick: [Get the currently open tabs in Google Chrome via the command line][4] and with some elisp sugar and coffee, here is the code:

```
(require 'cl-lib)

(defun save-chromium-session ()
  "Reads chromium current session and generate org-mode heading with items."
  (interactive)
  (save-excursion
    (let* ((cmd "strings ~/'.config/chromium/Default/Current Session' | 'grep' -E '^https?://' | sort | uniq")
           (ret (shell-command-to-string cmd)))
      (insert
       (concat
        "* "
        (format-time-string "[%Y-%m-%d %H:%M:%S]")
        "\n"
        (mapconcat 'identity
                   (cl-reduce (lambda (lst x)
                                (if (and x (not (string= "" x)))
                                    (cons (concat "  - " x) lst)
                                  lst))
                              (split-string ret "\n")
                              :initial-value (list))
                   "\n"))))))

(defun restore-chromium-session ()
  "Restore session, by openning each link in list with (browse-url).
Make sure to put cursor on date heading that contains list of urls."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (when (looking-at "^\\*")
      (forward-line 1)
      (while (looking-at "^[ ]+-[ ]+\\(http.?+\\)$")
        (let* ((ln (thing-at-point 'line t))
               (ln (replace-regexp-in-string "^[ ]+-[ ]+" "" ln))
               (ln (replace-regexp-in-string "\n" "" ln)))
          (browse-url ln))
        (forward-line 1)))))
```

So, how does it work?

Evaluate above code, open new org-mode file and call `M-x save-chromium-session`. It will create something like this:

```
* [2019-12-04 12:14:02]
  - https://www.reddit.com/r/emacs/comments/...
  - https://www.reddit.com/r/Clojure
  - https://news.ycombinator.com
```

or whatever urls are running in Chromium instance. To restore it back, put cursor on desired date and run `M-x restore-chromium-session`. All tabs should be back.

Here is how I use it, with randomly generated data for the purpose of this text:

```
#+TITLE: Browser sessions

* [2019-12-01 23:15:00]...
* [2019-12-02 18:10:20]...
* [2019-12-03 19:00:12]
  - https://www.reddit.com/r/emacs/comments/...
  - https://www.reddit.com/r/Clojure
  - https://news.ycombinator.com

* [2019-12-04 12:14:02]
  - https://www.reddit.com/r/emacs/comments/...
  - https://www.reddit.com/r/Clojure
  - https://news.ycombinator.com
```

Note that hack for reading Chromium session isn't perfect: `strings` will read whatever looks like string and url from binary database and sometimes that will yield small artifacts in urls. But, you can easily edit those and keep session file lean and clean.

To actually open tabs, elisp code will use [browse-url][5] and it can be further customized to run Chromium, Firefox or any other browser with `browse-url-browser-function` variable. Make sure to read documentation for this variable.

Don't forget to put session file in git, mercurial or svn and enjoy the fact that you will never loose your session history again :)

### What about Firefox?

If you are using Firefox (recent versions) and would like to pull session urls, here is how to do it.

First, download and compile [lz4json][6], small tool that will decompress Mozilla lz4json format, where Firefox stores session data. Session data (at the time of writing this post) is stored in `$HOME/.mozilla/firefox/<unique-name>/sessionstore-backups/recovery.jsonlz4`.

If Firefox is not running, `recovery.jsonlz4` will not be present, but use `previous.jsonlz4` instead.

To extract urls, try this in terminal:

```
$ lz4jsoncat recovery.jsonlz4 | grep -oP '"(http.+?)"' | sed 's/"//g' | sort | uniq
```

and update `save-chromium-session` with:

```
(defun save-chromium-session ()
  "Reads chromium current session and converts it to org-mode chunk."
  (interactive)
  (save-excursion
    (let* ((path "~/.mozilla/firefox/<unique-name>/sessionstore-backups/recovery.jsonlz4")
           (cmd (concat "lz4jsoncat " path " | grep -oP '\"(http.+?)\"' | sed 's/\"//g' | sort | uniq"))
           (ret (shell-command-to-string cmd)))
...
;; rest of the code is unchanged
```

Updating documentation strings, function name and any further refactoring is left for exercise.

--------------------------------------------------------------------------------

via: https://acidwords.com/posts/2019-12-04-handle-chromium-and-firefox-sessions-with-org-mode.html

作者：[Sanel Z][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://acidwords.com/
[b]: https://github.com/lujun9972
[1]: https://chrome.google.com/webstore/detail/session-manager/mghenlmbmjcpehccoangkdpagbcbkdpc?hl=en-US
[2]: https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en
[3]: https://orgmode.org/
[4]: https://superuser.com/a/1310873
[5]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Browse_002dURL.html
[6]: https://github.com/andikleen/lz4json
