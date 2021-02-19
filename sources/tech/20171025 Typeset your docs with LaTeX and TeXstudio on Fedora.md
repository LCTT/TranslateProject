[#]: collector: (Chao-zhi)
[#]: translator: (Chao-zhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Typeset your docs with LaTeX and TeXstudio on Fedora)
[#]: via: (https://fedoramagazine.org/typeset-latex-texstudio-fedora/)
[#]: author: (Julita Inca Chiroque )

Typeset your docs with LaTeX and TeXstudio on Fedora
======
![](https://fedoramagazine.org/wp-content/uploads/2017/07/latex-texstudio-945x400.jpg)

LaTeX is [a document preparation system][1] for high-quality typesetting. It’s often used for larger technical or scientific documents. However, you can use LaTeX for almost any form of publishing. Teachers can edit their exams and syllabi, and students can present their thesis and reports for classes. This article gets you started with the TeXstudio app. TeXstudio makes it easy to edit LaTeX documents.

### Launching TeXstudio

If you’re using Fedora Workstation, launch Software, and type TeXstudio to search for the app. Then select Install to add TeXstudio to your system. You can also launch the app from Software, or go to the shell overview as usual.

Alternately, if you use a terminal, type texstudio. If the package isn’t installed, the system prompts you to install it. Type y to start the installation.

```
$ texstudio
bash: texstudio: command not found...
Install package 'texstudio' to provide command 'texstudio'? [N/y] y
```

LaTeX commands typically start with a backslash (), and command parameters are enclosed in curly braces { }. Start by declaring the type of the documentclass. This example shows you the document class is an article.

Then, once you declare the documentclass, mark the beginning and the end of the document with begin and end. In between these commands, write a paragraph similar to the following:

```
\documentclass{article}
\begin{document}
The Fedora Project is a project sponsored by Red Hat primarily to co-ordinate the development of the Linux-based Fedora operating system, operating with the vision that the project "creates a world where free culture is welcoming and widespread, collaboration is commonplace, and people control their content and devices". The Fedora Project was founded on 22 September 2003 when Red Hat decided to split Red Hat Linux into Red Hat Enterprise Linux (RHEL) and a community-based operating system, Fedora.
\end{document}
```

![](https://fedoramagazine.org/wp-content/uploads/2017/07/Screenshot-from-2017-10-05-20-19-15.png)

### Working with spacing

To create a paragraph break, leave one or more blank spaces between text.  Here’s an example with four paragraphs:

![](https://fedoramagazine.org/wp-content/uploads/2017/07/Screenshot-from-2017-10-18-14-24-42.png)

You can see from the example that more than one line break doesn’t create additional blank space between paragraphs. However, if you do need to leave additional space, use the commands hspace and vspace. These add horizontal and vertical space, respectively. Here is some example code that shows additional spacing around paragraphs:

```
\documentclass{article}
\begin{document}

\hspace{2.5cm} The four essential freedoms

\vspace{0.6cm} 
A program is free software if the program's users have the 4 essential freedoms:

The freedom to run the program as you wish, for any purpose (freedom 0).\vspace{0.2cm} 
The freedom to study how the program works, and change it so it does your computing as you wish (freedom 1). Access to the source code is a precondition for this.\vspace{0.2cm}

The freedom to redistribute copies so you can help your neighbour (freedom 2).\vspace{0.2cm}

The freedom to distribute copies of your modified versions to others (freedom 3). By doing this you can give the whole community a chance to benefit from your changes. Access to the source code is a precondition for this.

\end{document}
```

![](https://fedoramagazine.org/wp-content/uploads/2017/07/Screenshot-from-2017-10-18-17-24-53.png)

### Using Lists and Formats

This example would look better if it presented the four essential freedoms of free software as a list. Set the list structure by using \begin{itemize} at the beginning of the list, and \end{itemize} at the end. Precede each item with the command \item.

Additional format also helps make the text more readable. Useful commands for formatting include bold, italic, underline, huge, large, tiny and textsc to help emphasize text:

```
\documentclass{article}
\begin{document}

\hspace{2cm} {\huge The four essential freedoms}

\vspace{0.6cm} 
\noindent {\large A program is free software if the program's users have the 4 essential freedoms}:
\begin{itemize}
\item \vspace{0.2cm} 
\noindent \textbf{The freedom to run} the program as you wish, for any purpose \textit{(freedom 0)}. \vspace{0.2cm} 
\item \noindent \textbf{The freedom to study} how the program works, and change it so it does your computing as you wish \textit{(freedom 1)}. Access to the source code is a precondition for this.\vspace{0.2cm}

\item \noindent \textbf{The freedom to redistribute} copies so you can help your neighbour \textit{(freedom 2)}.\vspace{0.2cm}

\item \noindent \textbf{The freedom to distribute copies of your modified versions} to others \textit{(freedom 3)}. \tiny{By doing this you can give the whole community a chance to benefit from your changes.\underline{\textsc{ Access to the source code is a precondition for this.}}}
\end{itemize}
\end{document}
```

### Adding columns, images and links

Columns, images and links help add further information to your text. LaTeX includes functions for some advanced features as packages. The \usepackage command loads the package so you can make use of these features.

For example, to make an image visible, you might use the command \usepackage{graphicx}. Or, to set up columns and links, use \usepackage{multicol} and \usepackage{hyperref}, respectively.

The \includegraphics command places an image inline in your document. (For simplicity, include the graphics file in the same directory as your LaTeX source file.)

Here’s an example that uses all these concepts. It also uses two PNG graphics files that were downloaded. Try your own graphics to see how they work.

```
\documentclass{article} 
\usepackage{graphicx}
\usepackage{multicol}
\usepackage{hyperref}
\begin{document} 
 \textbf{GNU}
 \vspace{1cm}

 GNU is a recursive acronym for "GNU's Not Unix!", chosen because GNU's design is Unix-like, but differs from Unix by being free software and containing no Unix code.

 Richard Stallman, the founder of the project, views GNU as a "technical means to a social end". Stallman has written about "the social aspects of software and how Free Software can create community and social justice." in his "Free Society" book.
 \vspace{1cm}

 \textbf{Some Projects}

 \begin{multicols}{2}
 Fedora
 \url{https://getfedora.org}
 \includegraphics[width=1cm]{fedora.png}

 GNOME
 \url{https://getfedora.org}
 \includegraphics[width=1cm]{gnome.png}
 \end{multicols} 

\end{document}
```

[][2]

The features here only scratch the surface of LaTeX capabilities. You can learn more about them at the project [help and documentation site][3].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/typeset-latex-texstudio-fedora/

作者：[Julita Inca Chiroque][a]
选题：[Chao-zhi][b]
译者：[Chao-zhi][b]
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/yulytas/
[b]: https://github.com/Chao-zhi
[1]:http://www.latex-project.org/about/
[2]:https://fedoramagazine.org/fedora-aarch64-on-the-solidrun-honeycomb-lx2k/
[3]:https://www.latex-project.org/help/
