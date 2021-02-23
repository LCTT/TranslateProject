[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Emacs Org mode to easily create LaTeX documents)
[#]: via: (https://opensource.com/article/20/4/emacs-org-mode)
[#]: author: (Peter Prevos https://opensource.com/users/danderzei)

Use Emacs Org mode to easily create LaTeX documents
======
You can use LaTeX for scientific and technical documents without all of
the confusing commands and syntax you would normally need.
![Filing cabinet for organization][1]

LaTeX is a powerful system, especially for writing scientific and technical documents. But writing documents in LaTeX can be confusing because you need to know a lot of commands, and your text is littered with backslashes, curly braces, and other syntax distractions. But being productive as a writer requires that you focus on the text's content instead of how it looks. Fortunately, the [GNU Emacs][2] Org mode extension makes it easy to write plain-text documents and seamlessly export them to LaTeX and PDF.

[Org mode][3] is a built-in Emacs extension that helps you keep notes, maintain to-do lists, manage projects, and author documents with a fast and effective plain-text system. Emacs also comes with [AUCTeX][4], an extensible package for writing TeX files in Emacs. AUCTeX has a preview module that shows the results of what you type, but I find it distracting because it draws my attention away from the document's content to its design. Writing text in Org mode is my preferred option because the source remains a plain-text file with minimal typesetting elements. The text is independent of its result because Org mode can export it to multiple formats, including LaTeX and PDF.

Emacs is known for being difficult to use with a steep learning curve. But Emacs is only difficult when you want to fine-tune the default settings. By following a minimalist approach to using the vanilla GNU Emacs, this article will get you quickly and easily on your way to writing beautiful documents without any complex configuration.

### First steps

Before you begin, [install Emacs][5] and a fully functioning version of [LaTeX][6] on your computer.

Next, you need to learn some conventions. In Emacs lingo, the abbreviation **C-c** means to enter **Ctrl+C** on your keyboard. The abbreviation **M-x** means **Alt+X**. The M stands for the mod key, which no longer exists in modern systems. The **S** prefix indicates the **Shift** key.

The **find-file** function, which you start with the **C-x C-f** keystroke combination, creates a new document or opens an existing document. Entering this function opens a dialog in the mini-buffer at the bottom of the screen, which is where Emacs communicates with the user. Type the name of the file you want to create or open into the mini-buffer. Emacs is sensitive to file extensions, so make sure that the name of your document ends in **.org**.

In Emacs speak, opening or creating a file is called ["visiting" a file][7]. Visiting a file means reading its contents into an Emacs buffer so that it is available for editing. Emacs generates a new buffer for each file you visit.

### Writing prose with Org mode

Once you're visiting a file, you can start typing your text the same way you would in any text editor or word processor. Some conventions: Begin the file with **#+TITLE:** to denote the title of the document and **#+AUTHOR** for your name. These options are used when exporting the file. Org mode recognizes a range of [export settings][8] to configure the output. For example, to suppress the table of contents, enter **#+OPTIONS: toc:nil**.

Org mode has its own Markdown-like conventions to format your document. [Headlines][9] start with one or more asterisks. Org mode can [collapse a headline][10] to render parts of it invisible with the **TAB** or **S-TAB** keys. You can make words ***bold***, **/italic/**, **_underlined_**, or **=verbatim=**. The Org manual describes the many options for [rich text][11].

One minor issue with plain-vanilla Emacs that you will quickly notice is it does not wrap lines at the end of the visible screen. Emacs has several line-wrapping functions, and [Visual Line mode][12] is the most useful for writing long-form text. To activate this mode, use **M-x** and enter **visual-line-mode** in the mini-buffer at the bottom of the screen. The **M-x** keyboard shortcut enables executing functions for which there is no direct keyboard shortcut.

Adding [images][13] is as easy as adding a link to the image file within double square brackets:


```
`[[file:path_to_image.png]]`
```

Org has a great system for [formatting tables][14] in plain ASCII. Any line with **|** is considered part of a table. The vertical line is also the column separator. A line starting with **|-** is rendered as a horizontal rule, and rows before the first horizontal rule are header lines. A table might look like this in the source file:


```
| Name  |   id | Age |
|-------+------+-----|
| Peter | 1234 |  50 |
| Sue   | 4321 |  54 |
```

Both images and tables are preceded with **#+CAPTION:** to add a [caption][15]. Advanced options are also available to control float placement and size of figures.

Emacs has extensive [editing functions][16] to make you more efficient when typing text. Spell checking, thesaurus, auto-completion, and an undo tree are just some of the tools that help you write efficiently.

### Adding LaTeX snippets to Org

In addition to the text itself, Org mode-text can include simple LaTeX commands, such as **\newpage**, within the text. Equations in standard LaTeX syntax are placed between dollar signs **$e^{i\pi} + 1 = 0$**. The **org-latex-preview** function (**C-c C-x C-l**) shows a [preview][17] of any LaTeX equations within the text buffer. Last, you can also add complete LaTeX snippets to insert complex content. The code has to be placed in an export block:


```
#+BEGIN_EXPORT latex
\setlength{\unitlength}{1cm}
\thicklines
\begin{picture}(10,6)
\put(2,2.2){\line(1,0){6}}
\put(2,2.2){\circle{2}}
\put(6,2.2){\oval(4,2)[r]}
\end{picture}
#+END_EXPORT
```

### Exporting to LaTeX

Org mode includes a powerful export module to convert your files to many formats using the powerful [Pandoc][18] software. Start the export module with the **org-export-dispatch** function, which you can run with the **C-c C-e** keyboard shortcut. The dispatch will split your screen and provide a range of options.

First, Pandoc converts the Org mode file to a LaTeX file. Then you can choose to open the LaTeX file in a new buffer or save it as a file. Org mode can also directly render a PDF file, which you can view within Emacs or save to disk.

![Emacs with Org mode source and PDF preview][19]

### Advanced use

This article provides a first taste of writing prose in Org mode and LaTeX. Org mode has numerous configuration options to fine-tune your document or to change default settings.

By default, Org mode uses the article style to export documents, but you can change this with export settings. These settings can also be used to add commands to the document header, for example:


```
#+LATEX_CLASS: report
#+LATEX_CLASS_OPTIONS: [a4paper]
#+LATEX_HEADER: \usepackage{times}
```

If you write scientific documents, the [org-ref][20] package by John Kitchin provides Org-mode modules for citations, cross-references, and bibliographies in Org mode and useful BibTeX tools to go with it.

The Org mode manual's [LaTex export][21] section provides a detailed discussion of the functionality available.

### Conclusion

Org mode is a perfect editor for writing LaTeX. The main advantage is that you lose the clutter of LaTeX syntax and can focus on the text. This comes at no cost because you can still add LaTeX code as much as you need, and you get access to the powerful editing functions in Emacs.

Using Org to write books and articles allows you to focus on the text as you combine two of the oldest and most powerful pieces of open source software.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/emacs-org-mode

作者：[Peter Prevos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/danderzei
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://opensource.com/article/20/3/getting-started-emacs
[3]: https://orgmode.org
[4]: https://www.gnu.org/software/auctex/
[5]: https://www.gnu.org/software/emacs/
[6]: https://www.latex-project.org/get/
[7]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Visiting.html
[8]: https://orgmode.org/manual/Export-Settings.html
[9]: https://orgmode.org/manual/Headlines.html#Headlines
[10]: https://orgmode.org/manual/Global-and-local-cycling.html#Global-and-local-cycling
[11]: https://orgmode.org/manual/Markup-for-Rich-Contents.html#Markup-for-Rich-Contents
[12]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Visual-Line-Mode.html
[13]: https://orgmode.org/manual/Images.html
[14]: https://orgmode.org/manual/Built_002din-Table-Editor.html#Built_002din-Table-Editor
[15]: https://orgmode.org/manual/Captions.html#Captions
[16]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Basic.html#Basic
[17]: https://orgmode.org/manual/Previewing-LaTeX-fragments.html
[18]: https://pandoc.org/
[19]: https://opensource.com/sites/default/files/uploads/org-mode-latex-screenshot.png (Emacs with Org mode source and PDF preview.)
[20]: https://github.com/jkitchin/org-ref
[21]: https://orgmode.org/manual/LaTeX-Export.html#LaTeX-Export
