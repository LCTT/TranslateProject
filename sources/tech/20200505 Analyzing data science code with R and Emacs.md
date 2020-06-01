[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Analyzing data science code with R and Emacs)
[#]: via: (https://opensource.com/article/20/5/r-emacs-data-science)
[#]: author: (Peter Prevos https://opensource.com/users/danderzei)

Analyzing data science code with R and Emacs
======
Emacs' versatility and extensibility bring the editor's full power into
play for writing data science code.
![metrics and data shown on a computer screen][1]

Way back in 2012, _Harvard Business Review_ published an article that proclaimed "data scientist" to be the [sexiest job][2] of the 21st century. Interest in data science has exploded since then. Many great open source projects, such as [Python][3] and the [R language][4] for statistical computing, have facilitated the rapid developments in how we analyze data.

I started my career using pencil and paper and moved to spreadsheets. Now the R language is my weapon of choice when I need to create value from data. Emacs is another one of my favorite tools. This article briefly explains how to use the [Emacs Speaks Statistics][5] (ESS) package to get started with developing R projects in this venerable editor.

The vast majority of R developers use the [RStudio][6] IDE to manage their projects. RStudio is a powerful open source editor with specialized functionality to develop data science projects. RStudio is a great integrated development environment (IDE), but its editing functions are limited.

Using Emacs to write data science code means that you have access to the full power of this extensible editor. I prefer using Emacs for my data science projects because I can do many other tasks within the same application, leveraging the multifunctionality of this venerable editor. If you are just getting started with Emacs, then please first read Seth Kenlon's [Emacs getting started][7] article.

### Setting up Emacs for R

Emacs is an almost infinitely extensible text editor, which unfortunately means that many things don't work the way you want them to out of the box. Before you can write and execute R scripts, you need to install some packages and configure them. The ESS package provides an interface between Emacs and R. Other packages, such as [Company][8] and [highlight-parentheses][9] help with completion and balancing parentheses.

Emacs uses a version of Lisp for configuration. The lines of [Emacs Lisp][10] code below install the required extensions and define a minimal configuration to get you started. These lines were tested for GNU Emacs version 26.3.

Copy these lines and save them in a file named **init.el** in your **.emacs.d** folder. This is the folder that Emacs uses to store configurations, including the [init file][11]. If you already have an init file, then you can append these lines to your config. This minimal configuration is enough to get you started.


```
;; Elisp file for R coding with Emacs

;; Add MELPA repository and initialise the package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "<https://melpa.org/packages/>"))
(package-initialize)

;; Install use-package,in case it does not exist yet
;; The use-package software will install all other packages as required
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ESS configurationEmacs Speaks Statistics
(use-package ess
  :ensure t
)

;; Auto completion
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (global-company-mode t)
)

; Parentheses
(use-package highlight-parentheses
  :ensure t
  :config
  (progn
    (highlight-parentheses-mode)
    (global-highlight-parentheses-mode))
  )
```

### Using the R console

To start an R console session, press **M-x R** and hit **Enter** (**M** is the Emacs way to denote the **Alt** or **Command** key). ESS will ask you to nominate a working directory, which defaults to the folder of the current buffer. You can use more than one console in the same Emacs session by repeating the R command.

Emacs opens a new buffer for your new R console. You can also use the **Up** and **Down** arrow keys to go to previous lines and re-run them. Use the **Ctrl** and **Up/Down** arrow keys to recycle old commands.

The Company ("complete anything") package manages autocompletion in both the console and R scripts. When entering a function, the mini-buffer at the bottom of the screen shows the relevant parameters. When the autocompletion dropdown menu appears, you can press **F1** to view the chosen option's Help file before you select it.

The [highlight-parentheses][9] package does what its name suggests. Several other Emacs packages are available to help you balance parentheses and other structural elements in your code.

### Writing R scripts

Emacs recognizes R mode for any buffer with a **.R** extension (the file extension is case-sensitive). Open or create a new file with the **C-x C-f** shortcut and type the path and file name. You can start writing your code and use all of the powerful editing techniques that Emacs provides.

Several functions are available to evaluate the code. You can evaluate each line separately with **C-&lt;return&gt;**, while **C-c C-c** will evaluate a contiguous region. Keying **C-c C-b** will evaluate the whole buffer.

When you evaluate some code, Emacs will use any running console or ask you to open a new console to run the code.

The output of any plotting functions appears in a window outside of Emacs. If you prefer to view the output within Emacs, then you need to save the output to disk and open the resulting file in a separate buffer.

![Literate programming in Org mode, the ESS buffer, and graphics output.][12]

Literate programming in Org mode, the ESS buffer, and graphics output.

### Advanced use

This article provides a brief introduction to using R in Emacs. Many parameters can be fine-tuned to make Emacs behave according to your preferences, but it would take too much space to cover them here. The [ESS manual][13] describes these in detail. You can also extend functionality with additional packages.

Org mode can integrate R code, providing a productive platform for literate programming. If you prefer to use RMarkdown, the [Polymode][14] package has you covered.

Emacs has various packages to make your editing experience more efficient. The best part of using Emacs to write R code is that the program is more than just an IDE; it is a malleable computer system that you can configure to match your favorite workflow.

Learning how to configure Emacs can be daunting. The best way to learn quickly is to copy ideas from people who share their configurations. Miles McBain manages a [list of Emacs configurations][15] that could be useful if you want to explore using the R language in Emacs further.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/r-emacs-data-science

作者：[Peter Prevos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/danderzei
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://hbr.org/2012/10/data-scientist-the-sexiest-job-of-the-21st-century
[3]: https://www.python.org/
[4]: https://www.r-project.org/
[5]: https://ess.r-project.org/
[6]: https://opensource.com/article/18/2/getting-started-RStudio-IDE
[7]: https://opensource.com/article/20/3/getting-started-emacs
[8]: https://company-mode.github.io/
[9]: https://github.com/tsdh/highlight-parentheses.el
[10]: https://en.wikipedia.org/wiki/Emacs_Lisp
[11]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
[12]: https://opensource.com/sites/default/files/uploads/r-ess-screenshot.jpg (Literate programming in Org mode, the ESS buffer, and graphics output.)
[13]: https://ess.r-project.org/index.php?Section=documentation&subSection=manuals
[14]: https://github.com/polymode/polymode
[15]: https://github.com/MilesMcBain/esscss
