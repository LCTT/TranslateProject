[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10625-1.html)
[#]: subject: (Advanced Techniques for Reducing Emacs Startup Time)
[#]: via: (https://blog.d46.us/advanced-emacs-startup/)
[#]: author: (Joe Schafer https://blog.d46.us/)

降低 Emacs 启动时间的高级技术
======

> 《[Emacs Start Up Profiler][1]》 的作者教你六项减少 Emacs 启动时间的技术。

简而言之：做下面几个步骤：

1. 使用 Esup 进行性能检测。
2. 调整垃圾回收的阀值。
3. 使用 use-package 来自动（延迟）加载所有东西。
4. 不要使用会引起立即加载的辅助函数。
5. 参考我的 [配置][2]。

### 从 .emacs.d 的失败到现在

我最近宣布了 .emacs.d 的第三次失败，并完成了第四次 Emacs 配置的迭代。演化过程为：

1. 拷贝并粘贴 elisp 片段到 `~/.emacs` 中，希望它能工作。
2. 借助 `el-get` 来以更结构化的方式来管理依赖关系。
3. 放弃自己从零配置，以 Spacemacs 为基础。
4. 厌倦了 Spacemacs 的复杂性，基于 `use-package` 重写配置。

本文汇聚了三次重写和创建 《[Emacs Start Up Profiler][1]》过程中的技巧。非常感谢 Spacemacs、use-package 等背后的团队。没有这些无私的志愿者，这项任务将会困难得多。

### 不过守护进程模式又如何呢

在我们开始之前，让我反驳一下优化 Emacs 时的常见观念：“Emacs 旨在作为守护进程来运行的，因此你只需要运行一次而已。”

这个观点很好，只不过：

- 速度总是越快越好。
- 配置 Emacs 时，可能会有不得不通过重启 Emacs 的情况。例如，你可能为 `post-command-hook` 添加了一个运行缓慢的 `lambda` 函数，很难删掉它。
- 重启 Emacs 能帮你验证不同会话之间是否还能保留配置。

### 1、估算当前以及最佳的启动时间

第一步是测量当前的启动时间。最简单的方法就是在启动时显示后续步骤进度的信息。

```
;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
    (lambda ()
        (message "Emacs ready in %s with %d garbage collections."
            (format "%.2f seconds"
                (float-time
                    (time-subtract after-init-time before-init-time)))
        gcs-done)))
```

第二步、测量最佳的启动速度，以便了解可能的情况。我的是 0.3 秒。

```
# -q ignores personal Emacs files but loads the site files.
emacs -q --eval='(message "%s" (emacs-init-time))' 

;; For macOS users:
open -n /Applications/Emacs.app --args -q --eval='(message "%s" (emacs-init-time))'  
```

### 2、检测 Emacs 启动指标对你大有帮助

《[Emacs StartUp Profiler][1]》（ESUP）将会给你顶层语句执行的详细指标。

![esup.png][3]

*图 1: Emacs Start Up Profiler 截图*

> 警告：Spacemacs 用户需要注意，ESUP 目前与 Spacemacs 的 init.el 文件有冲突。遵照 <https://github.com/jschaf/esup/issues/48> 上说的进行升级。

### 3、调高启动时垃圾回收的阀值

这为我节省了 **0.3 秒**。

Emacs 默认值是 760kB，这在现代机器看来极其保守。真正的诀窍在于初始化完成后再把它降到合理的水平。这为我节省了 0.3 秒。

```
;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; The rest of the init file.

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
```

*~/.emacs.d/init.el*

### 4、不要 require 任何东西，而是使用 use-package 来自动加载

让 Emacs 变坏的最好方法就是减少要做的事情。`require` 会立即加载源文件，但是很少会出现需要在启动阶段就立即需要这些功能的。

在 [use-package][4] 中你只需要声明好需要哪个包中的哪个功能，`use-package` 就会帮你完成正确的事情。它看起来是这样的：

```
(use-package evil-lisp-state ; the Melpa package name

  :defer t ; autoload this package

  :init ; Code to run immediately.
  (setq evil-lisp-state-global nil)

  :config ; Code to run after the package is loaded.
  (abn/define-leader-keys "k" evil-lisp-state-map))
```

可以通过查看 `features` 变量来查看 Emacs 现在加载了那些包。想要更好看的输出可以使用 [lpkg explorer][5] 或者我在 [abn-funcs-benchmark.el][6] 中的变体。输出看起来类似这样的：

```
479 features currently loaded
  - abn-funcs-benchmark: /Users/jschaf/.dotfiles/emacs/funcs/abn-funcs-benchmark.el
  - evil-surround: /Users/jschaf/.emacs.d/elpa/evil-surround-20170910.1952/evil-surround.elc
  - misearch: /Applications/Emacs.app/Contents/Resources/lisp/misearch.elc
  - multi-isearch: nil
  - <many more>
```

### 5、不要使用辅助函数来设置模式

通常，Emacs 包会建议通过运行一个辅助函数来设置键绑定。下面是一些例子：

  * `(evil-escape-mode)`
  * `(windmove-default-keybindings) ; 设置快捷键。`
  * `(yas-global-mode 1) ; 复杂的片段配置。`

可以通过 `use-package` 来对此进行重构以提高启动速度。这些辅助函数只会让你立即加载那些尚用不到的包。

下面这个例子告诉你如何自动加载 `evil-escape-mode`。

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

下面来看一个关于 `org-babel` 的例子，这个例子更为复杂。我们通常的配置时这样的：

```
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (emacs-lisp . nil)))
```

这不是个好的配置，因为 `org-babel-do-load-languages` 定义在 `org.el` 中，而该文件有超过 2 万 4 千行的代码，需要花 0.2 秒来加载。通过查看源代码可以看到 `org-babel-do-load-languages` 仅仅只是加载 `ob-<lang>` 包而已，像这样：

```
;; From org.el in the org-babel-do-load-languages function.
(require (intern (concat "ob-" lang)))
```

而在 `ob-<lang>.el` 文件中，我们只关心其中的两个方法 `org-babel-execute:<lang>` 和 `org-babel-expand-body:<lang>`。我们可以延时加载 org-babel 相关功能而无需调用 `org-babel-do-load-languages`，像这样：

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

### 6、使用惰性定时器来推迟加载非立即需要的包

我推迟加载了 9 个包，这帮我节省了 **0.4 秒**。

有些包特别有用，你希望可以很快就能使用它们，但是它们本身在 Emacs 启动过程中又不是必须的。这些软件包包括：

- `recentf`：保存最近的编辑过的那些文件。
- `saveplace`：保存访问过文件的光标位置。
- `server`：开启 Emacs 守护进程。
- `autorevert`：自动重载被修改过的文件。
- `paren`：高亮匹配的括号。
- `projectile`：项目管理工具。
- `whitespace`：高亮行尾的空格。

不要 `require` 这些软件包，**而是等到空闲 N 秒后再加载它们**。我在 1 秒后加载那些比较重要的包，在 2 秒后加载其他所有的包。

```
(use-package recentf
  ;; Loads after 1 second of idle time.
  :defer 1)

(use-package uniquify
  ;; Less important than recentf.
  :defer 2)
```

### 不值得的优化

不要费力把你的 Emacs 配置文件编译成字节码了。这只节省了大约 0.05 秒。把配置文件编译成字节码还可能导致源文件与编译后的文件不一致从而难以重现错误进行调试。

--------------------------------------------------------------------------------

via: https://blog.d46.us/advanced-emacs-startup/

作者：[Joe Schafer][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.d46.us/
[b]: https://github.com/lujun9972
[1]: https://github.com/jschaf/esup
[2]: https://github.com/jschaf/dotfiles/blob/master/emacs/start.el
[3]: https://blog.d46.us/images/esup.png
[4]: https://github.com/jwiegley/use-package
[5]: https://gist.github.com/RockyRoad29/bd4ca6fdb41196a71662986f809e2b1c
[6]: https://github.com/jschaf/dotfiles/blob/master/emacs/funcs/abn-funcs-benchmark.el
