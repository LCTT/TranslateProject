How to create LaTeX documents with Emacs
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

In his excellent article, [An introduction to creating documents in LaTeX][1], author [Aaron Cocker][2] introduces the [LaTeX typesetting system][3] and explains how to create a LaTeX document using [TeXstudio][4]. He also lists a few LaTeX editors that many users find helpful in creating LaTeX documents.

This comment on the article by [Greg Pittman][5] caught my attention: "LaTeX seems like an awful lot of typing when you first start...". This is true. LaTeX involves a lot of typing and debugging, if you missed a special character like an exclamation mark, which can discourage many users, especially beginners. In this article, I will introduce you to [GNU Emacs][6] and describe how to use it to create LaTeX documents.

### Creating your first document

Launch Emacs by typing:
```
emacs -q --no-splash helloworld.org

```

The `-q` flag ensures that no Emacs initializations will load. The `--no-splash-screen` flag prevents splash screens to ensure that only one window is open, with the file `helloworld.org`.

![Emacs startup screen][8]

GNU Emacs with the helloworld.org file opened in a buffer window

Let's add some LaTeX headers the Emacs way: Go to **Org** in the menu bar and select **Export/Publish**.

![template_flow.png][10]

Inserting a default template

In the next window, Emacs offers options to either export or insert a template. Insert the template by entering **#** ([#] Insert template). This will move a cursor to a mini-buffer, where the prompt reads **Options category:**. At this time you may not know the category names; press Tab to see possible completions. Type  "default" and press Enter. The following content will be inserted:
```
#+TITLE: helloworld

#+DATE: <2018-03-12 Mon>

#+AUTHOR:

#+EMAIL: makerpm@nubia

#+OPTIONS: ':nil *:t -:t ::t <:t H:3 \n:nil ^:t arch:headline

#+OPTIONS: author:t c:nil creator:comment d:(not "LOGBOOK") date:t

#+OPTIONS: e:t email:nil f:t inline:t num:t p:nil pri:nil stat:t

#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:t todo:t |:t

#+CREATOR: Emacs 25.3.1 (Org mode 8.2.10)

#+DESCRIPTION:

#+EXCLUDE_TAGS: noexport

#+KEYWORDS:

#+LANGUAGE: en

#+SELECT_TAGS: export

```

Change the title, date, author, and email as you wish. Mine looks like this:
```
#+TITLE: Hello World! My first LaTeX document

#+DATE: \today

#+AUTHOR: Sachin Patil

#+EMAIL: psachin@redhat.com

```

We don't want to create a Table of Contents yet, so change the value of `toc` from `t` to `nil` inline, as shown below:
```
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:nil todo:t |:t

```

Let's add a section and paragraphs. A section starts with an asterisk (*). We'll copy the content of some paragraphs from Aaron's post (from the [Lipsum Lorem Ipsum generator][11]):
```
* Introduction



  \paragraph{}

  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem

  nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in

  diam libero. Nunc tristique ex a nibh egestas sollicitudin.



  \paragraph{}

  Mauris efficitur vitae ex id egestas. Vestibulum ligula felis,

  pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non

  elementum leo. Nullam molestie congue placerat. Phasellus tempor et

  libero maximus commodo.

```


![helloworld_file.png][13]

The helloworld.org file

With the content in place, we'll export the content as a PDF. Select **Export/Publish** from the **Org** menu again, but this time, type **l** (export to LaTeX), followed by **o** (as PDF file and open). This not only opens PDF file for you to view, but also saves the file as `helloworld.pdf` in the same path as `helloworld.org`.

![org_to_pdf.png][15]

Exporting helloworld.org to helloworld.pdf

![org_and_pdf_file.png][17]

Opening the helloworld.pdf file

You can also export org to PDF by pressing `Alt + x`, then typing "org-latex-export-to-pdf". Use Tab to auto-complete.

Emacs also creates the `helloworld.tex` file to give you control over the content.

![org_tex_pdf.png][19]

Emacs with LaTeX, org, and PDF files open in three different windows

You can compile the `.tex` file to `.pdf` using the command:
```
pdflatex helloworld.tex

```

You can also export the `.org` file to HTML or as a simple text file. What I like about .org files is they can be pushed to [GitHub][20], where they are rendered just like any other markdown formats.

### Creating a LaTeX Beamer presentation

Let's go a step further and create a LaTeX [Beamer][21] presentation using the same file with some modifications as shown below:
```
#+TITLE: LaTeX Beamer presentation

#+DATE: \today

#+AUTHOR: Sachin Patil

#+EMAIL: psachin@redhat.com

#+OPTIONS: ':nil *:t -:t ::t <:t H:3 \n:nil ^:t arch:headline

#+OPTIONS: author:t c:nil creator:comment d:(not "LOGBOOK") date:t

#+OPTIONS: e:t email:nil f:t inline:t num:t p:nil pri:nil stat:t

#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:nil todo:t |:t

#+CREATOR: Emacs 25.3.1 (Org mode 8.2.10)

#+DESCRIPTION:

#+EXCLUDE_TAGS: noexport

#+KEYWORDS:

#+LANGUAGE: en

#+SELECT_TAGS: export

#+LATEX_CLASS: beamer

#+BEAMER_THEME: Frankfurt

#+BEAMER_INNER_THEME: rounded





* Introduction

*** Programming

    - Python

    - Ruby



*** Paragraph one



    Lorem ipsum dolor sit amet, consectetur adipiscing

    elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat

    ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas

    sollicitudin.



*** Paragraph two



    Mauris efficitur vitae ex id egestas. Vestibulum

    ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac

    imperdiet orci, non elementum leo. Nullam molestie congue

    placerat. Phasellus tempor et libero maximus commodo.



* Thanks

*** Links

    - Link one

    - Link two

```

We have added three more lines to the header:
```
#+LATEX_CLASS: beamer

#+BEAMER_THEME: Frankfurt

#+BEAMER_INNER_THEME: rounded

```

To export to PDF, press `Alt + x` and type "org-beamer-export-to-pdf".

![latex_beamer_presentation.png][23]

The Latex Beamer presentation, created using Emacs and Org mode

I hope you enjoyed creating this LaTeX and Beamer document using Emacs (note that it's faster to use keyboard shortcuts than a mouse). Emacs Org-mode offers much more than I can cover in this post; you can learn more at [orgmode.org][24].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/how-create-latex-documents-emacs

作者：[Sachin Patil][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psachin
[1]:https://opensource.com/article/17/6/introduction-latex
[2]:https://opensource.com/users/aaroncocker
[3]:https://www.latex-project.org
[4]:http://www.texstudio.org/
[5]:https://opensource.com/users/greg-p
[6]:https://www.gnu.org/software/emacs/
[7]:/file/392261
[8]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/emacs_startup.png?itok=UnT4PgK5 (Emacs startup screen)
[9]:/file/392266
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/insert_template_flow.png?itok=V_c2KipO (template_flow.png)
[11]:https://www.lipsum.com/feed/html
[12]:/file/392271
[13]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/helloworld_file.png?itok=o8IX0TsJ (helloworld_file.png)
[14]:/file/392276
[15]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/org_to_pdf.png?itok=fNnC1Y-L (org_to_pdf.png)
[16]:/file/392281
[17]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/org_and_pdf_file.png?itok=HEhtw-cu (org_and_pdf_file.png)
[18]:/file/392286
[19]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/org_tex_pdf.png?itok=poZZV_tj (org_tex_pdf.png)
[20]:https://github.com
[21]:https://www.sharelatex.com/learn/Beamer
[22]:/file/392291
[23]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/latex_beamer_presentation.png?itok=rsPSeIuM (latex_beamer_presentation.png)
[24]:https://orgmode.org/worg/org-tutorials/org-latex-export.html
