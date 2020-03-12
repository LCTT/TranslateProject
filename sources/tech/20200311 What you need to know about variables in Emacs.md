[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about variables in Emacs)
[#]: via: (https://opensource.com/article/20/3/variables-emacs)
[#]: author: (Clemens Radermacher https://opensource.com/users/clemera)

What you need to know about variables in Emacs
======
Learn how Elisp deals with variables and to use them in your scripts and
configurations.
![Programming keyboard.][1]

GNU Emacs is written in C and Emacs Lisp (Elisp), a dialect of the Lisp programming language. Because it's a text editor that happens to be an Elisp sandbox, it is helpful to understand how basic programming concepts work in Elisp.

If you're new to [Emacs][2], visit Sacha Chua's excellent list of [resources for Emacs beginners][3]. This article assumes you're familiar with common Emacs terminology and that you know how to read and evaluate basic snippets of Elisp code. Ideally, you should also have heard of variable scope and how it works in another programming language. The examples also assume you use a fairly recent Emacs version ([v.25 or later][4]).

The [Elisp manual][5] includes everything there is to know, but it is written for people who already know what they are looking for (and it is really great for that). But many people want resources that explain Elisp concepts at a higher level and reduce the amount of information to the most useful bits. This article is my attempt to respond to that—to give readers a good grasp of the basics so they can use them for their configuration and make it easier for people to look up some detail in the manual.

### Global variables

User options defined with **defcustom** and variables defined with **defvar** or **defconst** are global. One important aspect of variables declared by **defcustom** or **defvar** is that reevaluating them won't reset a variable if it is already bound. For example, if you establish a binding for **my-var** in your init file like this:


```
`(setq my-var nil)`
```

evaluating the following form won't reset the variable to **t**:


```
`(defvar my-var t)`
```

Note that there is _one exception_: If you evaluate the declaration above with **C-M-x** that calls **eval-defun**, the value will be reset to **t**. This way, you can enforce setting the value if you need to. This behavior is intentional: As you might know, many features in Emacs load only on demand (i.e., they are autoloaded). If the declarations in those files reset variables to their default value, this would override any settings in your init.

### User options

A user option is simply a global variable that is declared with **defcustom**. Unlike variables declared with **defvar**, such a variable is configurable with the  **M-x customize** interface. As far as I know, most people don't use it much because it feels clunky. Once you know how to set variables in your init file, there's no compelling reason to use it. One detail many users aren't aware of is that setting user options with **customize** might execute code, and this is sometimes used to run additional setup instructions:


```
(defcustom my-option t
  "My user option."
  :set (lambda (sym val)
         (set-default sym val)
         (message "Set %s to %s" sym val)))
```

If you evaluate this code and change the value using the **customize** interface with **M-x customize-option RET my-option RET **the lambda will be called, and the message in the echo area will tell you the symbol and value of the option.

If you use **setq** in your init file, to change the value of such an option, the setter function will _not_ run. To set such an option correctly with Elisp, you need to use the function **customize-set-variable**. Alternatively, people use various versions of **csetq** macros in their configs to automatically take care of this (you can use GitHub code search to discover more sophisticated variants if you like):


```
(defmacro csetq (sym val)
  `(funcall (or (get ',sym 'custom-set) 'set-default) ',sym ,val))
```

If you are using the [use-package][6] macro, the **:custom** keyword will handle this for you.

After putting the code above into your init file, you can use **csetq** to set variables in a way that respects any existing setter functions. You can prove this by watching the message in the echo area when using this macro to change the option defined above:


```
`(csetq my-option nil)`
```

### Dynamic binding and lexical binding

If you use other programming languages, you may not be aware of the differences between dynamic and lexical binding. Most programming languages today use lexical binding, and there is no need to know the difference when you learn about variable scope/lookup.

Emacs Lisp is special in this regard because dynamic binding is the default, and lexical binding must be enabled explicitly. There are historical reasons for this, and in practice, you should _always_ enable lexical binding because it is faster and less error-prone. To enable it, simply put the following comment line as the first line in your Emacs Lisp file:


```
`;;; -*- lexical-binding: t; -*-`
```

Alternatively, you can call M-x **add-file-local-variable-prop-line**, which will insert the comment line above when you choose the variable **lexical-binding** with value **t**.

When a file with such a specially formatted line is loaded, Emacs sets the variable accordingly, which means the code in that buffer is loaded with lexical binding enabled. Interactively, you can use **M-x eval-buffer**, which takes the lexical binding setting into account.

Now that you know how to enable lexical binding, it's smart to learn what the terms mean. With dynamic binding, the last binding established during program execution is used for variable lookup. You can test this by putting the following code in an empty buffer and executing **M-x eval-buffer**:


```
(defun a-exists-only-in-my-body (a)
  (other-function))

(defun other-function ()
  (message "I see `a', its value is %s" a))

(a-exists-only-in-my-body t)
```

You may be surprised to see that the lookup of variable **a** in the **other-function** is successful.

If you retry the preceding example with the special lexical-binding comment at the top, the code will throw a "variable is void" error because **other-function** does not know about the **a** variable. If you're coming from another programming language, this is the behavior you would expect.

With lexical binding, the scope is defined by the surrounding source code. This is not only for performance reasons—experience and time have shown that this behavior is preferred.

### Special variables and dynamic binding

As you may know, **let** is used to temporary establish local bindings:


```
(let ((a "I'm a")
      (b "I'm b"))
  (message "Hello, %s. Hello %s" a b))
```

Here is the thing: Variables declared with **defcustom**, **defvar**, or **defconst** are called _special variables_, and they continue to use dynamic binding regardless of whether lexical binding is enabled:


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

To see both messages in the example above, switch to the ***Messages*** buffer using **C-h e**.

Local variables bound with **let** or function arguments follow the lookup rules defined by the **lexical-binding** variable, but global variables defined with **defvar**, **defconst**, or **defcustom** can be changed deep down in the call stack for the duration of the **let** body.

This behavior allows for convenient ad-hoc customizations and is often used in Emacs, which isn't surprising given that Emacs Lisp started out with dynamic binding being the only option. Here is a common example showing how you can temporarily write to a read-only buffer:


```
(let ((inhibit-read-only t))
  (insert ...))
```

Here is another often-seen example for performing case-sensitive searches:


```
(let ((case-fold-search nil))
  (some-function-which-uses-search ...))
```

Dynamic binding allows you to change the behavior of functions in ways the authors of those functions may have never anticipated. It's a powerful tool and a great feature for a program that is designed and used like Emacs.

There is one caveat to be aware of: You might accidentally use a local variable name that is declared as a special variable elsewhere. One trick to prevent such conflicts is to avoid dashes in local variables' names. In my current Emacs session, this leaves only a handful of potential conflicting candidates:


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
  vars) ;; =&gt; (t obarray noninteractive debugger nil)
```

### Buffer-local variables

Each buffer can have a local binding for a variable. This means any variable lookup made while this buffer is current will reveal the buffer's local value of that variable instead of the default value. Local variables are an important feature in Emacs; for example, they are used by major modes to establish their buffer-local behavior and settings.

You have already seen a buffer-local variable in this article: the special comment line for **lexical-binding** that binds the buffer locally to **t**. In Emacs, such buffer-local variables defined in special comment lines are also called _file-local variables_.

Any global variable can be shadowed by a buffer-local variable. Take, for example, the **my-var** variable defined above, which you can set locally like this:


```
(setq-local my-var t)
;; or (set (make-local-variable 'my-var) t)
```

**my-var** is local to the buffer, which is current when you evaluate the code above. If you call **describe-variable** on it, the documentation tells you both the local value and the global one. Programmatically, you can check the local value using **buffer-local-value** and the default value with **default-value**. To remove the local version, you could invoke  **M-x kill-local-variable**.

Another important property to be aware of is that once a variable is buffer-local, any further use of **setq** (while this buffer is current) will continue to set the local value. To set the default value, you would need to use **setq-default**.

Because local variables are meant for buffer customization, they're used most often in mode hooks. A typical example would be something like this:


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

This sets the compile command used by **M-x compile** for go-mode buffers.

Another important aspect is that some variables are _automatically_ buffer-local. This means as soon as you **setq** such a variable, it sets a local binding for the current buffer. This feature shouldn't be used often (because this implicit behavior isn't nice), but if you want, you can create such automatically local variables like this:


```
(defvar-local my-automatical-local-var t)
;; or (make-variable-buffer-local 'my-automatical-local-var)
```

The variable **indent-tabs-mode** is a built-in example of this. If you use **setq** in your init file to change the value of this variable, it won't affect the default value at all. Only the value for the buffer that is current while loading your init file will be changed. Therefore, you need to use **setq-default** to change the default value of **indent-tabs-mode**.

### Closing words

Emacs is a powerful editor, and it only gets more powerful the more you change it to suit your needs. Now you know how Elisp deals with variables and how you can use them in your own scripts and configurations.

* * *

_This previously appeared on [With-Emacs][7] under a CC BY-NC-SA 4.0 license and has been adapted (with a merge request) and republished with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/variables-emacs

作者：[Clemens Radermacher][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
