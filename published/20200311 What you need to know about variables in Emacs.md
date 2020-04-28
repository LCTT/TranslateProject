[#]: collector: (lujun9972)
[#]: translator: (cycoe)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12150-1.html)
[#]: subject: (What you need to know about variables in Emacs)
[#]: via: (https://opensource.com/article/20/3/variables-emacs)
[#]: author: (Clemens Radermacher https://opensource.com/users/clemera)

关于 Emacs 中的变量你需要知道的事情
======

> 学习 Elisp 是如何处理变量的，以及如何在你的脚本与配置中使用它们。

![](https://img.linux.net.cn/data/attachment/album/202004/25/190905pq1qfk1f8f9qs9v8.jpg)

GNU Emacs 是由 C 和 Emacs Lisp（Elisp，Lisp 编程语言的一种方言）写成，它是一个编辑器的同时，又碰巧是 Elisp 的沙盒。因此，理解 Elisp 中的一些基本编程概念会对你有一些帮助。

如果你是 [Emacs][2] 新手，请先阅读 Sacha Chua 的《[给 Emacs 新手的资源][3]》精品帖。本篇文章假定你熟悉常见的 Emacs 术语，并且能够阅读并求值 Elisp 代码的简单片段。最好你也听说过变量作用域的概念，知道它在其它编程语言中的作用。本篇文章中的示例假定你使用的是相对较新的 Emacs 版本（[v.25 之后的版本][4]）。

[Elisp 手册][5] 包含了 Elisp 的方方面面，但它是写给那些有明确查找目标的人们的（它在这方面也做得相当棒）。但是很多人想要能够在更高的层次上解释 Elisp 概念的材料，同时将信息压缩成最精华的部分。本篇文章也正是我回应这种呼声的一次尝试，为读者描绘基础的大体轮廓。使他们能在配置中用上这些技巧，也让他们在手册中查询细节变得更容易。

### 全局变量

用 `defcustom` 定义的用户设置和用 `defvar` 或 `defconst` 定义的变量是全局的。使用 `defcustom` 或 `defvar` 声明变量的一个非常重要的原因是，当一个变量已经被<ruby>绑定<rt>bind</rt></ruby>，对它们进行重新求值不会覆盖掉已有的值。举个栗子，如果你在初始化文件中对 `my-var` 进行如下绑定：

```
(setq my-var nil)
```

对如下表达式求值不会将变量覆盖为 `t`：

```
(defvar my-var t)
```

注意此处有*一个例外*：如果你用 `C-M-x` 快捷键对上述声明求值，它将调用 `eval-defun` 函数，并将变量覆盖为 `t`。通过此方式，你可以按需将变量强制覆盖。这种行为是刻意而为之的：你可能知道，Emacs 中的许多特性是按需加载的，也可以称为自动加载。如果那些文件中的声明将变量覆盖为它们的默认值，那它也就覆盖了你初始化文件中的设置。

### 用户选项

用户选项就是使用 `defcustom` 声明的全局变量。与使用 `defvar` 声明的变量不同，这些变量可以用 `M-x customize` 界面来配置。据我所知，大部分人因为觉得它开销较大而不经常使用。一旦你知道如何在你的初始化文件中设置变量，也就没有理由一定要去使用它了。许多用户没有意识到的一个细节是，通过 `customize` 的方式设置用户选项能够执行代码，有的时间可用来运行一些附加的配置说明：

```
(defcustom my-option t
  "My user option."
  :set (lambda (sym val)
         (set-default sym val)
         (message "Set %s to %s" sym val)))
```

若你对这段代码求值，并键入 `M-x customize-option RET my-option RET` 运行 `customize` 界面，lambda 匿名函数就会被调用，回显区域就会显示出该选项的符号名与值。

如果你在初始化文件中使用 `setq` 改变该选项的值，那么匿名函数不会运行。要想在 Elisp 中正确设置一个选项，你需要使用函数 `customize-set-variable`。或者，人们在他们的配置文件中使用了各种版本的 `csetq` 宏来自动处理（如你所愿，你可以通过 GitHub 的代码搜索发现更复杂的变体）。

```
(defmacro csetq (sym val)
  `(funcall (or (get ',sym 'custom-set) 'set-default) ',sym ,val))
```

若你正在使用 [use-package][6] 宏，`:custom` 关键字会替你处理好以上这些。

在你将以上代码放入到你的初始化文件中之后，你便可以使用 `csetq` 宏在设置变量的同时运行任何现存的 `setter` 函数。要证明这点，你可以使用此宏来改变上面定义的选项，并观察回显区域的消息输出。

```
(csetq my-option nil)
```

### 动态绑定与词法绑定

当你在使用其它编程语言时，你可能不会意识到动态绑定与词法绑定的区别。当今的大部分编程语言使用词法绑定，并且在学习变量作用域与变量查找时也没有必要去了解它们之间的区别。

如此看来，Emacs Lisp 比较特殊因为动态绑定是默认选项，词法绑定需要显式启用。这里有一些历史遗留原因，但在实际使用中，你应该*时刻*启用词法绑定，因为它更快并且不容易出错。要启用词法绑定，只需将如下的注释行作为你的 Emacs Lisp 文件的第一行：

```
;;; -*- lexical-binding: t; -*-
```

另一种方式，你可以调用 `add-file-local-variable-prop-line`，在你选择将变量 `lexical-binding` 置为 `t` 后，会自动插入如上的注释行。

在加载包含如上特殊格式行的文件时，Emacs 会相应地设置变量，这意味着该缓冲区中的代码加载时启用了词法绑定。若要采用交互式的方式，你可以调用 `M-x eval-buffer` 命令，它会将词法绑定考虑在内。

既然你已经知道了如何启用词法绑定，那么了解这些术语的含义就很明智了。对于动态绑定，在程序执行期间建立的最后一个绑定将用于变量查找。你可以通过将以下代码放入空缓冲区并执行 `M-x eval buffer`，以对此进行测试：

```
(defun a-exists-only-in-my-body (a)
  (other-function))

(defun other-function ()
  (message "I see `a', its value is %s" a))

(a-exists-only-in-my-body t)
```

你可能会很惊讶地发现，在 `other-function` 中查找变量 `a` 竟然成功了。

若你在顶部添加了特殊的词法绑定注释后，重新运行前面的示例，这段代码将抛出 `variable is void` 错误，因为 `other-functioin` 无法识别变量 `a`。如果你使用的是其它编程语言，这才是你所期望的行为。

启用词法绑定后，作用域会由周围的代码所定义。这并不单单是性能原因，时间也已经表明了词法绑定才是更受喜爱的。

### 特殊变量与动态绑定

如你所知，`let` 用于临时建立局部绑定：

```
(let ((a "I'm a")
      (b "I'm b"))
  (message "Hello, %s. Hello %s" a b))
```

接下来有趣的是——使用 `defcustom`、`defvar` 以及 `defconst` 定义的变量被称为*特殊变量*，不论词法绑定是否启用，它们都将使用动态绑定：

```
;;; -*- lexical-binding: t; -*-

(defun some-other-function ()
  (message "I see `c', its value is: %s" c))

(defvar c t)

(let ((a "I'm lexically bound")
      (c "I'm special and therefore dynamically bound"))
  (some-other-function)
  (message "I see `a', its values is: %s" a))
```

通过 `C-h e` 切换至 `Messages` 缓冲区，查看上述示例输出的消息。

使用 `let` 或者函数参数绑定的局部变量会遵循由 `lexical-binding` 变量定义的查找规则，但使用 `defvar`、`defconst` 或 `defcustom` 定义的全局变量，能够沿着调用栈在 `let` 表达式中被修改。

这种技巧允许方便地进行特殊定制，并且经常在 Emacs 中被使用。这并不奇怪，毕竟 Emacs Lisp 最开始只提供动态绑定作为唯一选择。下面是一个常见的示例，说明如何向只读缓冲区临时写入数据：

```
(let ((inhibit-read-only t))
  (insert ...))
```

这是另一个常见的示例，如何进行大小写敏感的搜索：

```
(let ((case-fold-search nil))
  (some-function-which-uses-search ...))
```

动态绑定允许你采用作者未曾预料的方式对函数进行修改。对于像 Emacs 这样设计使用的程序来说，这是个强大的工具与特性。

有一点需要注意：你可能会意外地使用局部变量名，该变量在其他地方被声明为特殊变量。防止这种冲突的一个技巧是避免在局部变量名中使用下划线。在我当前的 Emacs 会话中，以下代码只留下少数潜在冲突的候选：

```
(let ((vars ()))
  (mapatoms
   (lambda (cand)
     (when (and (boundp cand)
                (not (keywordp cand))
                (special-variable-p cand)
                (not (string-match "-"
                                   (symbol-name cand))))
       (push cand vars))))
  vars) ;; => (t obarray noninteractive debugger nil)
```

### 缓冲区局部变量

每个缓冲区都能够拥有变量的一个局部绑定。这就意味着对于任何变量，都会首先在当前缓冲区中查找缓冲区局部变量取代默认值。局部变量是 Emacs 中一个非常重要的特性，比如它们被主模式用来建立缓冲区范围内的行为与设置。

事实上你已经在本文中见过*缓冲区局部变量*——也就是将 `lexical-binding` 在缓冲区范围内设置为 `t` 的特殊注释行。在 Emacs 中，在特殊注释行中定义的缓冲区局部变量也被称为*文件局部变量*。

任何的全局变量都可以用缓冲区局部变量来遮掩，比如上面定义的变量 `my-var`，你可用如下方式设置局部变量：

```
(setq-local my-var t)
;; or (set (make-local-variable 'my-var) t)
```

此时 `my-var` 对于你在对上述代码进行求值时对应的缓冲区来说就是局部变量。若你对它调用 `describe-variable`，文档会同时告诉你局部与全局的值。从编程的角度来讲，你可以分别用 `buffer-local-value` 获取局部值，用 `default-value` 获取全局值。若要移除局部值，你可以调用 `kill-local-variable`。

另一个需要注意的重要性质就是，一旦一个变量成为缓冲区局部变量，后续在该缓冲区中使用的 `setq` 都将只能设置局部的值。要想设置默认值，你需要使用 `setq-default`。

因为局部变量意味着对缓冲区的定制，它们也就经常被用于模式钩子中。一个典型的例子如下所示：

```
(add-hook 'go-mode-hook
          (defun go-setup+ ()
            (setq-local compile-command
              (if (string-suffix-p "_test.go" buffer-file-name)
                  "go test -v"
                (format "go run %s"
                        (shell-quote-argument
                         (file-name-nondirectory buffer-file-name)))))))
```

这将设置 `go-mode` 缓冲区中 `M-x compile` 使用的编译命令。

另一个重要的方面就是一些变量会*自动*成为缓冲区局部变量。这也就意味着当你使用 `setq` 设置这样一个变量时，它会针对当前缓冲区设置局部绑定。这个特性不应该被经常使用，因为这种隐式的行为并不好。不过如果你想的话，你可以使用如下方法创建自动局部变量：

```
(defvar-local my-automatical-local-var t)
;; or (make-variable-buffer-local 'my-automatical-local-var)
```

变量 `indent-tabs-mode` 就是 Emacs 内建的一个例子。如果你在初始化文件中使用 `setq` 改变变量的值，根本不会影响默认值。只有在你加载初始化文件时正处在当前的缓冲区的局部值会被改变。因此，你需要使用 `setq-default` 来改变 `indent-tabs-mode` 的默认值。

### 结语

Emacs 是一个强大的编辑器，并且随着你的定制它将变得更加强大。现在，你知道了 Elisp 是如何处理变量的，以及你应如何在你自己的脚本与配置中使用它们。

*本篇文章此前采用 CC BY-NC-SA 4.0 许可证发布在 [With-Emacs][7] 上，经过修改（带有合并请求）并在作者允许的情况下重新发布。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/variables-emacs

作者：[Clemens Radermacher][a]
选题：[lujun9972][b]
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clemera
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (Programming keyboard.)
[2]: https://www.gnu.org/software/emacs/
[3]: http://sachachua.com/blog/p/27144
[4]: https://www.gnu.org/software/emacs/download.html
[5]: https://www.gnu.org/software/emacs/manual/html_node/elisp/
[6]: https://github.com/jwiegley/use-package#customizing-variables
[7]: https://with-emacs.com/posts/tutorials/almost-all-you-need-to-know-about-variables/
