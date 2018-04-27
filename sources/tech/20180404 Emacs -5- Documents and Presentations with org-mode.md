Emacs #5: Documents and Presentations with org-mode
======

### 1 About org-mode exporting

#### 1.1 Background

org-mode isn't just an agenda-making program. It can also export to lots of formats: LaTeX, PDF, Beamer, iCalendar (agendas), HTML, Markdown, ODT, plain text, man pages, and more complicated formats such as a set of web pages.

This isn't just some afterthought either; it's a core part of the system and integrates very well.

One file can be source code, automatically-generated output, task list, documentation, and presentation, all at once.

Some use org-mode as their preferred markup format, even for things like LaTeX documents. The org-mode manual has an extensive [section on exporting][13].

#### 1.2 Getting started

From any org-mode document, just hit C-c C-e. From there will come up a menu, letting you choose various export formats and options. These are generally single-key options so it's easy to set and execute. For instance, to export a document to a PDF, use C-c C-e l p or for HTML export, C-c C-e h h.

There are lots of settings available for all of these export options; see the manual. It is, in fact, quite possible to use LaTeX-format equations in both LaTeX and HTML modes, to insert arbitrary preambles and settings for different modes, etc.

#### 1.3 Add-on packages

ELPA containts many addition exporters for org-mode as well. Check there for details.

### 2 Beamer slides with org-mode

#### 2.1 About Beamer

[Beamer][14] is a LaTeX environment for making presentations. Its features include:

*   Automated generating of structural elements in the presentation (see, for example, [the Marburg theme][1]). This provides a visual reference for the audience of where they are in the presentation.

*   Strong help for structuring the presentation

*   Themes

*   Full LaTeX available

#### 2.2 Benefits of Beamer in org-mode

org-mode has a lot of benefits for working with Beamer. Among them:

*   org-mode's very easy and strong support for visualizing and changing the structure makes it very quick to reorganize your material.

*   Combined with org-babel, live source code (with syntax highlighting) and results can be embedded.

*   The syntax is often easier to work with.

I have completely replaced my usage of LibreOffice/Powerpoint/GoogleDocs with org-mode and beamer. It is, in fact, rather frustrating when I have to use one of those tools, as they are nowhere near as strong as org-mode for visualizing a presentation structure.

#### 2.3 Headline Levels

org-mode's Beamer export will convert sections of your document (defined by headings) into slides. The question, of course, is: which sections? This is governed by the H [export setting][15] (org-export-headline-levels).

There are many ways to go, which suit people. I like to have my presentation like this:

```
#+OPTIONS: H:2
#+BEAMER_HEADER: \AtBeginSection{\frame{\sectionpage}}
```

This gives a standalone section slide for each major topic, to highlight major transitions, and then takes the level 2 (two asterisks) headings to set the slide. Many Beamer themes expect a third level of indirection, so you would set H:3 for them.

#### 2.4 Themes and settings

You can configure many Beamer and LaTeX settings in your document by inserting lines at the top of your org file. This document, for instance, defines:

```
#+TITLE:  Documents and presentations with org-mode
#+AUTHOR: John Goerzen
#+BEAMER_HEADER: \institute{The Changelog}
#+PROPERTY: comments yes
#+PROPERTY: header-args :exports both :eval never-export
#+OPTIONS: H:2
#+BEAMER_THEME: CambridgeUS
#+BEAMER_COLOR_THEME: default
```

#### 2.5 Advanced settings

I like to change some colors, bullet formatting, and the like. I round out my document with:

```
# We can't just +BEAMER_INNER_THEME: default because that picks the theme default.
# Override per https://tex.stackexchange.com/questions/11168/change-bullet-style-formatting-in-beamer
#+BEAMER_INNER_THEME: default
#+LaTeX_CLASS_OPTIONS: [aspectratio=169]
#+BEAMER_HEADER: \definecolor{links}{HTML}{0000A0}
#+BEAMER_HEADER: \hypersetup{colorlinks=,linkcolor=,urlcolor=links}
#+BEAMER_HEADER: \setbeamertemplate{itemize items}[default]
#+BEAMER_HEADER: \setbeamertemplate{enumerate items}[default]
#+BEAMER_HEADER: \setbeamertemplate{items}[default]
#+BEAMER_HEADER: \setbeamercolor*{local structure}{fg=darkred}
#+BEAMER_HEADER: \setbeamercolor{section in toc}{fg=darkred}
#+BEAMER_HEADER: \setlength{\parskip}{\smallskipamount}
```

Here, aspectratio=169 sets a 16:9 aspect ratio, and the remaining are standard LaTeX/Beamer configuration bits.

#### 2.6 Shrink (to fit)

Sometimes you've got some really large code examples and you might prefer to just shrink the slide to fit.

Just type C-c C-x p, set the BEAMER_opt property to shrink=15\.

(Or a larger value of shrink). The previous slide uses this here.

#### 2.7 Result

Here's the end result:

 [![screenshot1](https://farm1.staticflickr.com/889/26366340577_fbde8ff266_o.png)][16] 

### 3 Interactive Slides

#### 3.1 Interactive Emacs Slideshows

With the [org-tree-slide package][17], you can display your slideshow from right within Emacs. Just run M-x org-tree-slide-mode. Then, use C-> and C-< to move between slides.

You might find C-c C-x C-v (which is org-toggle-inline-images) helpful to cause the system to display embedded images.

#### 3.2 HTML Slideshows

There are a lot of ways to export org-mode presentations to HTML, with various levels of JavaScript integration. See the [non-beamer presentations section][18] of the org-mode wiki for details.

### 4 Miscellaneous

#### 4.1 Additional resources to accompany this post

*   [orgmode.org beamer tutorial][2]

*   [LaTeX wiki][3]

*   [Generating section title slides][4]

*   [Shrinking content to fit on slide][5]

*   A great resource: refcard-org-beamer See its [Github repo][6] Make sure to check out both the PDF and the .org file

*   A nice [Theme matrix][7]

#### 4.2 Up next in my Emacs series…

mu4e for email!


--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9900-emacs-5-documents-and-presentations-with-org-mode

作者：[John Goerzen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/archives/author/jgoerzen
[1]:https://hartwork.org/beamer-theme-matrix/all/beamer-albatross-Marburg-1.png
[2]:https://orgmode.org/worg/exporters/beamer/tutorial.html
[3]:https://en.wikibooks.org/wiki/LaTeX/Presentations
[4]:https://tex.stackexchange.com/questions/117658/automatically-generate-section-title-slides-in-beamer/117661
[5]:https://tex.stackexchange.com/questions/78514/content-doesnt-fit-in-one-slide
[6]:https://github.com/fniessen/refcard-org-beamer
[7]:https://hartwork.org/beamer-theme-matrix/
[8]:https://changelog.complete.org/archives/tag/emacs2018
[9]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/emacs-org-beamer/emacs-org-beamer.org
[10]:http://changelog.complete.org/archives/9900-emacs-5-documents-and-presentations-with-org-mode
[11]:https://github.com/jgoerzen/public-snippets/raw/master/emacs/emacs-org-beamer/emacs-org-beamer.pdf
[12]:https://github.com/jgoerzen/public-snippets/raw/master/emacs/emacs-org-beamer/emacs-org-beamer-document.pdf
[13]:https://orgmode.org/manual/Exporting.html#Exporting
[14]:https://en.wikipedia.org/wiki/Beamer_(LaTeX)
[15]:https://orgmode.org/manual/Export-settings.html#Export-settings
[16]:https://www.flickr.com/photos/jgoerzen/26366340577/in/dateposted/
[17]:https://orgmode.org/worg/org-tutorials/non-beamer-presentations.html#org-tree-slide
[18]:https://orgmode.org/worg/org-tutorials/non-beamer-presentations.html
