[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11926-1.html)
[#]: subject: (Handle Chromium & Firefox sessions with org-mode)
[#]: via: (https://acidwords.com/posts/2019-12-04-handle-chromium-and-firefox-sessions-with-org-mode.html)
[#]: author: (Sanel Z https://acidwords.com/)

通过 Org 模式管理 Chromium 和 Firefox 会话
======

![](https://img.linux.net.cn/data/attachment/album/202002/24/113047w8jtoh2o5j085750.jpg)

我是[会话管理器][1]的铁粉，它是 Chrome 和 Chromium 的小插件，可以保存所有打开的选项卡，为会话命名，并在需要时恢复会话。

它非常有用，特别是如果你像我一样，白天的时候需要在多个“思维活动”之间切换——研究、开发或者阅读新闻。或者你只是单纯地希望记住几天前的工作流（和选项卡）。

在我决定放弃 chromium 上除了 [uBlock Origin][2] 之外的所有扩展后，就必须寻找一些替代品了。我的主要目标是使之与浏览器无关，同时会话链接必须保存在文本文件中，这样我就可以享受所有纯文本的好处了。还有什么比 [org 模式][3]更好呢 ;)

很久以前我就发现了这个小诀窍：[通过命令行获取当前在谷歌 Chrome 中打开的标签][4] 再加上些 elisp 代码：

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

那么，它的工作原理是什么呢？

运行上述代码，打开一个新 org 模式文件并调用 `M-x save-chromium-session`。它会创建类似这样的东西：

```
* [2019-12-04 12:14:02]
  - https://www.reddit.com/r/emacs/comments/...
  - https://www.reddit.com/r/Clojure
  - https://news.ycombinator.com
```

也就是任何在 chromium 实例中运行着的 URL。要还原的话，则将光标置于所需日期上然后运行 `M-x restore-chromium-session`。所有标签都应该恢复了。

以下是我的使用案例，其中的数据是随机生成的：

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

请注意，用于读取 Chromium 会话的方法并不完美：`strings` 将从二进制数据库中读取任何类似 URL 字符串的内容，有时这将产生不完整的 URL。不过，你可以很方便地地编辑它们，从而保持会话文件简洁。

为了真正打开标签，elisp 代码中使用到了 [browse-url][5]，它可以通过 `browse-url-browser-function` 变量进一步定制成运行 Chromium、Firefox 或任何其他浏览器。请务必阅读该变量的相关文档。

别忘了把会话文件放在 git、mercurial 或 svn 中，这样你就再也不会丢失会话历史记录了 :)

### 那么 Firefox 呢？

如果你正在使用 Firefox（最近的版本），并且想要获取会话 URL，下面是操作方法。

首先，下载并编译 [lz4json][6]，这是一个可以解压缩 Mozilla lz4json 格式的小工具，Firefox 以这种格式来存储会话数据。会话数据（在撰写本文时）存储在 `$HOME/.mozilla/firefox/<unique-name>/sessionstore-backup /recovery.jsonlz4` 中。

如果 Firefox 没有运行，则没有 `recovery.jsonlz4`，这种情况下用 `previous.jsonlz4` 代替。

要提取网址，尝试在终端运行：

```
$ lz4jsoncat recovery.jsonlz4 | grep -oP '"(http.+?)"' | sed 's/"//g' | sort | uniq
```

然后更新 `save-chromium-session` 为：

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

更新本函数的文档字符串、函数名以及进一步的重构都留作练习。

--------------------------------------------------------------------------------

via: https://acidwords.com/posts/2019-12-04-handle-chromium-and-firefox-sessions-with-org-mode.html

作者：[Sanel Z][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://acidwords.com/
[b]: https://github.com/lujun9972
[1]: https://chrome.google.com/webstore/detail/session-manager/mghenlmbmjcpehccoangkdpagbcbkdpc?hl=en-US
[2]: https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en
[3]: https://orgmode.org/
[4]: https://superuser.com/a/1310873
[5]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Browse_002dURL.html
[6]: https://github.com/andikleen/lz4json
