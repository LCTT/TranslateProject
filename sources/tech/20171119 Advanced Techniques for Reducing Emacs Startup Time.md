[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Advanced Techniques for Reducing Emacs Startup Time)
[#]: via: (https://blog.d46.us/advanced-emacs-startup/)
[#]: author: (Joe Schafer https://blog.d46.us/)

Advanced Techniques for Reducing Emacs Startup Time
======

Six techniques to reduce Emacs startup time by the author of the [Emacs Start Up Profiler][1].

tl;dr: Do these steps:

  1. Profile with Esup.
  2. Adjust the garbage collection threshold.
  3. Autoload **everything** with use-package.
  4. Avoid helper functions which cause eager loads.
  5. See my Emacs [config][2] for an example.



### From .emacs.d Bankruptcy to Now

I recently declared my third .emacs.d bankruptcy and finished the fourth iteration of my Emacs configuration. The evolution was:

  1. Copy and paste elisp snippets into `~/.emacs` and hope it works.
  2. Adopt a more structured approach with `el-get` to manage dependencies.
  3. Give up and outsource to Spacemacs.
  4. Get tired of Spacemacs intricacies and rewrite with `use-package`.



This article is a collection of tips collected during the 3 rewrites and from creating the Emacs Start Up Profiler. Many thanks to the teams behind Spacemacs, use-package and general. Without these dedicated voluteers, this task would be vastly more difficult.

### But What About Daemon Mode

Before we get started, let me acknowledge the common retort when optimizing Emacs: “Emacs is meant to run as a daemon so you’ll only start it once.” That’s all well and good except:

  * Fast things feel nicer.
  * When customizing Emacs, you sometimes get into weird states that can be hard to recover from without restarting. For example, if you add a slow `lambda` function to your `post-command-hook`, it’s tough to remove it.
  * Restarting Emacs helps verify that customization will persist between sessions.



### 1\. Establish the Current and Best Possible Start Up Time

The first step is to measure the current start up time. The easy way is to display the information at startup which will show progress through the next steps.

```
(add-hook 'emacs-startup-hook
 (lambda ()
 (message "Emacs ready in %s with %d garbage collections."
 (format "%.2f seconds"
 (float-time
 (time-subtract after-init-time before-init-time)))
 gcs-done)))
```

Second, measure the best possible startup speed so you know what’s possible. Mine is 0.3 seconds.

```
emacs -q --eval='(message "%s" (emacs-init-time))'

;; For macOS users:
open -n /Applications/Emacs.app --args -q --eval='(message "%s" (emacs-init-time))'
```

### 2\. Profile Emacs Startup for Easy Wins

The [Emacs StartUp Profiler][1] (ESUP) will give you detailed metrics for top-level expressions.

![esup.png][3]

Figure 1:

Emacs Start Up Profiler Screenshot

WARNING: Spacemacs users, ESUP currently chokes on the Spacemacs init.el file. Follow <https://github.com/jschaf/esup/issues/48> for updates.

### 3\. Set the Garbage Collection Threshold Higher during Startup

This saves about ****0.3 seconds**** on my configuration.

The default value for Emacs is 760kB which is extremely conservative on a modern machine. The real trick is to lower it back to something reasonable after initialization. This saves about 0.3 seconds on my init files.

```
;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; The rest of the init file.

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
```

### 4\. Never require anything; autoload with use-package instead

The best way to make Emacs faster is to do less. Running `require` eagerly loads the underlying source file. It’s rare the you’ll need functionality immediately at startup time.

With [`use-package`][4], you declare which features you need from a package and `use-package` does the right thing. Here’s what it looks like:

```
(use-package evil-lisp-state ; the Melpa package name

  :defer t ; autoload this package

  :init ; Code to run immediately.
  (setq evil-lisp-state-global nil)

  :config ; Code to run after the package is loaded.
  (abn/define-leader-keys "k" evil-lisp-state-map))
```

To see what packages Emacs currently has loaded, examine the `features` variable. For nice output see [lpkg explorer][5] or my variant in [abn-funcs-benchmark.el][6]. The output looks like:

```
479 features currently loaded
 - abn-funcs-benchmark: /Users/jschaf/.dotfiles/emacs/funcs/abn-funcs-benchmark.el
 - evil-surround: /Users/jschaf/.emacs.d/elpa/evil-surround-20170910.1952/evil-surround.elc
 - misearch: /Applications/Emacs.app/Contents/Resources/lisp/misearch.elc
 - multi-isearch: nil
 - <many more>
```

### 5\. Avoid Helper Functions to Set Up Modes

Often, Emacs packages will suggest running a helper function to set up keybindings. Here’s a few examples:

  * `(evil-escape-mode)`
  * `(windmove-default-keybindings) ; Sets up keybindings.`
  * `(yas-global-mode 1) ; Complex snippet setup.`



Rewrite these with use-package to improve startup speed. These helper functions are really just sneaky ways to trick you into eagerly loading packages before you need them.

As an example, here’s how to autoload `evil-escape-mode`.

```
;; The definition of evil-escape-mode.
(define-minor-mode evil-escape-mode
  (if evil-escape-mode
      (add-hook 'pre-command-hook 'evil-escape-pre-command-hook)
    (remove-hook 'pre-command-hook 'evil-escape-pre-command-hook)))

;; Before:
(evil-escape-mode)

;; After:
(use-package evil-escape
  :defer t
  ;; Only needed for functions without an autoload comment (;;;###autoload).
  :commands (evil-escape-pre-command-hook) 

  ;; Adding to a hook won't load the function until we invoke it.
  ;; With pre-command-hook, that means the first command we run will
  ;; load evil-escape.
  :init (add-hook 'pre-command-hook 'evil-escape-pre-command-hook))
```

For a much trickier example, consider `org-babel`. The common recipe is:

```
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
 (emacs-lisp . nil)))
```

This is bad because `org-babel-do-load-languages` is defined in `org.el`, which is over 24k lines of code and takes about 0.2 seconds to load. After examining the source code, `org-babel-do-load-languages` is simply requiring the `ob-<lang>` package like so:

```
;; From org.el in the org-babel-do-load-languages function.
(require (intern (concat "ob-" lang)))
```

In the `ob-<lang>.el`, there’s only two methods we care about, `org-babel-execute:<lang>` and `org-babel-expand-body:<lang>`. We can autoload the org-babel functionality instead of `org-babel-do-load-languages` like so:

```
;; Avoid `org-babel-do-load-languages' since it does an eager require.
(use-package ob-python
  :defer t
  :ensure org-plus-contrib
  :commands (org-babel-execute:python))

(use-package ob-shell
  :defer t
  :ensure org-plus-contrib
  :commands
  (org-babel-execute:sh
   org-babel-expand-body:sh

   org-babel-execute:bash
   org-babel-expand-body:bash))
```

### 6\. Defer Packages you don’t need Immediately with Idle Timers

This saves about ****0.4 seconds**** for the 9 packages I defer.

Some packages are useful and you want them available soon, but are not essential for immediate editing. These modes include:

  * `recentf`: Saves recent files.
  * `saveplace`: Saves point of visited files.
  * `server`: Starts Emacs daemon.
  * `autorevert`: Automatically reloads files that changed on disk.
  * `paren`: Highlight matching parenthesis.
  * `projectile`: Project management tools.
  * `whitespace`: Highlight trailing whitespace.



Instead of requiring these modes, ****load them after N seconds of idle time****. I use 1 second for the more important packages and 2 seconds for everything else.

```
(use-package recentf
  ;; Loads after 1 second of idle time.
  :defer 1)

(use-package uniquify
  ;; Less important than recentf.
  :defer 2)
```

### Optimizations that aren’t Worth It

Don’t bother byte-compiling your personal Emacs files. It saved about 0.05 seconds. Byte compiling causes difficult to debug errors when the source file gets out of sync with compiled file.


--------------------------------------------------------------------------------

via: https://blog.d46.us/advanced-emacs-startup/

作者：[Joe Schafer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.d46.us/
[b]: https://github.com/lujun9972
[1]: https://github.com/jschaf/esup
[2]: https://github.com/jschaf/dotfiles/blob/master/emacs/start.el
[3]: https://blog.d46.us/images/esup.png
[4]: https://github.com/jwiegley/use-package
[5]: https://gist.github.com/RockyRoad29/bd4ca6fdb41196a71662986f809e2b1c
[6]: https://github.com/jschaf/dotfiles/blob/master/emacs/funcs/abn-funcs-benchmark.el
