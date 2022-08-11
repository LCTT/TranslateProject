[#]: subject: "Create beautiful PDFs in LaTeX"
[#]: via: "https://opensource.com/article/22/8/pdf-latex"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create beautiful PDFs in LaTeX
======
Use the LaTeX markup language to compose documents.

The LaTeX document preparation system has an interesting history. When programmer Don Knuth wrote his first book, The Art of Computer Programming, in 1968, it was produced using an old-style printing press method. When he published the second edition in 1976, the publisher had moved to modern phototypesetting.

Knuth was unhappy with how the new edition looked. Addressing the problem from a programmer's perspective, Knuth decided to create his own text processing system so his future books could be formatted to look the same way, for every book in the series. And so it was that Don Knuth wrote the first version of TeX in 1978.

A few years later, Leslie Lamport created a set of macros that help authors write complex documents more easily. Lamport's macro extensions, LaTeX, essentially extends TeX to easily produce all kinds of documents. For example, many academic organizations use LaTeX to publish journals and proceedings.

### Writing documents in LaTeX

It's easy to learn the basics of LaTeX by writing a short article. Let's start by borrowing from the [About Opensource.com][4] page to create this sample input file:

```
$ cat about.tex 
\documentclass{article}
\begin{document}

Opensource.com is a premier, daily publication focused on
open source and Linux tutorials, stories, and resources.

We're a diverse and inviting group, made up of staff
editors, Correspondents, contributors, and readers. We
value differences in skills, talents, backgrounds, and
experiences. There are a few different ways to get involved
as a reader or a writer.

\end{document}
```

Like other document formatting programs, LaTeX collects words and fills paragraphs. That means you can add new text in the middle of a paragraph and not worry about how the final document will look. As long as you don't add a blank line in the middle of a paragraph, LaTeX creates fully justified paragraphs. When it finds a blank line, LaTeX starts a new paragraph.

LaTeX needs a few control statements to define the document. Every LaTeX document should start with a declaration of the document's *class*. LaTeX supports several kinds of documents, including letters, books, and articles. For this example, I used `\documentclass{article}` to set the *article* class.

Tell LaTeX where the text begins and ends with the `\begin{document}` and `\end{document}` statements. If you add text before the `\begin{document}`, LaTeX generates an error. Any text after `\end{document}` is ignored.

Process this document using LaTeX with the `latex` command:

```
$ latex about.tex
This is pdfTeX, Version 3.141592653-2.6-1.40.22 (TeX Live 2021) (preloaded format=latex)
 restricted \write18 enabled.
entering extended mode
(./about.tex
LaTeX2e <2020-10-01> patch level 4
(/usr/share/texlive/texmf-dist/tex/latex/base/article.cls
Document Class: article 2020/04/10 v1.4m Standard LaTeX document class
(/usr/share/texlive/texmf-dist/tex/latex/base/size10.clo))
(/usr/share/texlive/texmf-dist/tex/latex/l3backend/l3backend-dvips.def)
No file about.aux.
[1] (./about.aux) )
Output written on about.dvi (1 page, 736 bytes).
Transcript written on about.log.
```

LaTeX produces a lot of text so you can see what it is doing. If your document contains errors, LaTeX prints a message, and possibly prompt for what it should do. In most cases, you can type `exit` at the prompt to force LaTeX to quit.

If LaTeX was successful in generating a document, it produces a file with a `.dvi` extension. The *DVI* stands for *Device Independent* because you can use a variety of tools to create other kinds of output. For example, the **dvipdf** program converts the DVI file to a PDF file.

```
$ dvipdf about.dvi
```

![LaTeX output][5]

### Adding lists

LaTeX supports two kinds of lists: an *enumerated* list where each item starts with a number, and an *itemized* or "bullet" list. Add a short enumerated list after the second paragraph to list the ways that folks can get involved with Opensource.com:

```
\begin{enumerate}
\item Be a writer
\item Be a reader
\end{enumerate}
```

Similar to how you need to provide `\begin` and `\end` statements around a document definition, you also need to provide `\begin` and `\end` statements around a list. Within the list, start each new item with an `\item` command. When you process this new file with LaTeX and convert it to PDF format, you see your list formatted as a numbered list:

![LaTeX output][6]

You can also add lists within a list. This is a neat feature if you need to provide a list with several options for each item. For example, you can add a few different resources for folks who want to become writers at Opensource.com. The embedded list uses its own `\begin` and `\end` statements. I'll add some extra space around this example so it's easier to see, but LaTeX doesn't really care about the blank lines and extra spaces:

```
\begin{enumerate}
\item Be a writer

  \begin{itemize}
  \item Resources for writers
  \item Contributor Club
  \item Correspondent Program
  \end{itemize}

\item Be a reader
\end{enumerate}
```

The new list is inserted as an embedded list inside item number 1 because you added the list between the two original `\item` statements. You could have instead inserted this list after item number 2 by adding the new list before the `\end{enumerate}` statement.

![LaTeX output][7]

### Sections and subsections

You can make a long document easier to read by breaking it up into sections. To add a section title to a LaTeX document, use the `\section{...}` statement, and write the section's title inside the braces. For example, you can add a new section titled "About Opensource.com" to the top of the document with this:

```
$ head about.tex 
\documentclass{article}
\begin{document}

\section{About Opensource.com}

Opensource.com is a premier, daily publication focused on
open source and Linux tutorials, stories, and resources.

We're a diverse and inviting group, made up of staff
editors, Correspondents, contributors, and readers. We
```

The *article* document class adds a number before each major section, and increases the font size so it stands out in the document.

![LaTeX output][8]

For documents that require more organization, you can add subsections using the `\subsection{...}` command. Like the `\section{...}` command, enter the subsection's title between the curly braces.

```
$ head about.tex
\documentclass{article}
\begin{document}

\section{About Opensource.com}

Opensource.com is a premier, daily publication focused on
open source and Linux tutorials, stories, and resources.

\subsection{Welcome to the Opensource.com community}
```

![LaTeX output][9]

### Title and author

Scientific articles meant for publication require a title, author, and publication date. LaTeX provides a method to add this information by inserting commands that define each, then generates the article's title with a separate `\maketitle` command.

Add "About Us" as the article's title, "Opensource.com Editors" for the author, and "July 10, 2022" as the publication date. You must enter this block after the `\begin{document}` and before the rest of the content, such as the first section:

```
\title{About Us}
\author{Opensource.com Editors}
\date{July 10, 2022}
\maketitle
```

When you process the document, LaTeX adds the title, author, and date to the top of the artcle:

![LaTeX output][10]

### Adding emphasis

Scientific and other technical documents often include terms and phrases that need to carry special emphasis. LaTeX provides several font effects you can use in technical documents, including emphasis text (usually displayed in italics), bold text, and small caps.

Update your LaTeX document to put the phrase "staff editors, Correspondents, contributors, and readers" in italics text, and the specific words "reader" and "writer" later in the paragraph in emphasis text. You can also put the phrase "skills, talents, backgrounds, and experiences" in bold. And while it's not the correct way to style it, you can use small caps to type "Linux."

```
$ head -20 about.tex 
\documentclass{article}
\begin{document}

\title{About Us}
\author{Opensource.com Editors}
\date{July 10, 2022}
\maketitle

\section{About Opensource.com}

Opensource.com is a premier, daily publication focused on
open source and \textsc{Linux} tutorials, stories, and resources.

\subsection{Welcome to the Opensource.com community}

We're a diverse and inviting group, made up of \textit{staff
editors, Correspondents, contributors, and readers}. We
value differences in \textbf{skills, talents, backgrounds, and
experiences}. There are a few different ways to get involved
as a \emph{reader} or a \emph{writer}.
```

This sample shows different ways to apply different styles to text. When you need to add emphasis, use the `\emph{...}` command, with the word or phrase between the curly braces. To display text in italics, boldface, or small caps, use a variation of the `\text` command: `\textit{...}` for italics, `\textbf{...}` for boldface, and `\textsc{...}` for small caps. LaTeX supports lots of other ways to style text, but these styles get you pretty far in writing scientific documents.

![LaTeX output][11]

### Using LaTeX

I've only touched on a few ways to write scientific and technical documents in LaTeX. Depending on your needs, you can also use LaTeX to insert footnotes and typeset mathematical equations and expressions. To explore other ways to use LaTeX for scientific writing, also read [A introduction to creating documents in LaTeX][12] here on Opensource.com.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/pdf-latex

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://opensource.com/about
[5]: https://opensource.com/sites/default/files/2022-08/latex-output.jpg
[6]: https://opensource.com/sites/default/files/2022-08/latex-output-list.jpg
[7]: https://opensource.com/sites/default/files/2022-08/latex-output-list-2.jpg
[8]: https://opensource.com/sites/default/files/2022-08/latex-output-heading.jpg
[9]: https://opensource.com/sites/default/files/2022-08/latex-output-subheading.jpg
[10]: https://opensource.com/sites/default/files/2022-08/latex-output-about.jpg
[11]: https://opensource.com/sites/default/files/2022-08/latex-output-emphasis.jpg
[12]: https://opensource.com/article/17/6/introduction-latex
