A introduction to creating documents in LaTeX
============================================================

### Learn to typeset documents in the LaTeX text markup language.

![A introduction to creating documents in LaTeX](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/idea_innovation_kid_education.png?itok=jpetC9wJ "A introduction to creating documents in LaTeX")
Image by : opensource.com

LaTeX (pronounced  _lay-tech_ ) is a method of creating documents using plain text, stylized using markup tags, similar to HTML/CSS or Markdown. LaTeX is most commonly used to create documents for academia, such as academic journals. In LaTeX, the author doesn't stylize the document directly, like in a word processor such as Microsoft Word, LibreOffice Writer, or Apple Pages; instead they write code in plain text that must be compiled to produce a PDF document.

### [intro.png][1]

![computer screen with LaTeX markup language](https://opensource.com/sites/default/files/u128651/intro.png "computer screen with LaTeX markup language")

### How to get started

To write in LaTeX, you'll need to install a LaTeX editor. I use a piece of free and open source software (FOSS) popular with academics called [TexStudio][8], which runs on Windows, Unix/Linux, BSD, and Mac OS X. You'll also need to install a distribution of the **Tex** typesetting system. I am writing on MacOS, so I use a distribution called [MacTex or BasicTex][9]. For Windows you can use [MiKTex][10], and Linux users should be able to find it in their repository.

Once you have downloaded TexStudio and a distribution of LaTeX, you should be ready to start typesetting your documents.

### Create your first document

In this short tutorial, we'll create a simple article with a headline, a subhead, and two paragraphs.

After you launch TexStudio, save your new document. (I called mine **helloworld.tex**, since I'm writing this tutorial in the Hello, World! tradition from programming.) Next, you need to add some boilerplate code at the top of your **.tex** file that specifies the type and size of your document. This is similar to the boilerplate code used in HTML5 documents.

My code (below) sets the page size to A4 and the text size to 12pt. You can put this code into TexStudio and edit it with your own page size, font size, name, title, and other details:

```
\documentclass[a4paper,12pt]{article}
\begin{document}
\title{Hello World! My first LaTeX document}
\author{Aaron Cocker}
\date{\today}
\maketitle

content will go here 

\end{document}
```

Next, click on the large green arrow to compile the document. That's the middle button in the screenshot below.

### [compile.png][2]

![compile button in TexStudio](https://opensource.com/sites/default/files/u128651/compile.png "compile button in TexStudio")

If there are any errors, they'll appear in the dialog box at the bottom.

After you compile the document, you can see what it will look like by viewing a PDF within the program as a sort of WYSIWYG preview. Remember it must be recompiled whenever you make a change to the code, as you would when programming in C++, for example.

To view your document, click on **Tools > Commands > View PDF**, as shown in the screenshot below.

### [view_as_pdf.png][3]

![Menu to view a PDF](https://opensource.com/sites/default/files/u128651/view_as_pdf.png "Menu to view a PDF")

The PDF output will be shown on the right, like this:

### [pdf_output.png][4]

![Viewing the LaTeX code as PDF](https://opensource.com/sites/default/files/u128651/pdf_output.png "Viewing the LaTeX code as PDF")

Now you can add a paragraph. First give it a subhead by using the **\section{}**command. Type the subhead title between the curly braces of the command; I called my subhead **Introduction**.

```
\section{Introduction}
```

Now that you have labeled the paragraph with its subhead, it's time to write the paragraph. For this example, I used the Lipsum [lorem ipsum generator][11]. To create the paragraph, type the **\paragraph{}** command, then add your text  _underneath_ ,  _NOT within_ , the curly braces, inserted between **\maketitle** and **\end{document}**.

This is what my paragraph code looks like:

```
\section{Introduction}

\paragraph{}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas sollicitudin. 

\paragraph{}
Mauris efficitur vitae ex id egestas. Vestibulum ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non elementum leo. Nullam molestie congue placerat. Phasellus tempor et libero maximus commodo.
```

Your document is now finished, so you can export and save it as a PDF file by using **Save As** (just as you would with most programs).

Here's what my finished document and the corresponding code look like:

### [finished_document.png][5]

![The finished document with code and the PDF output side-by-side](https://opensource.com/sites/default/files/u128651/finished_document.png "The finished document with code and the PDF output side-by-side")

All my code from this tutorial is available below:

```
\documentclass[a4paper,12pt]{article}
\begin{document}
\title{Hello World! My first LaTeX document}
\author{Aaron Cocker}
\date{\today}
\maketitle

\section{Introduction}

\paragraph{}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas sollicitudin. 

\paragraph{}
Mauris efficitur vitae ex id egestas. Vestibulum ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non elementum leo. Nullam molestie congue placerat. Phasellus tempor et libero maximus commodo.

\end{document}
```

### Learn more

Among the thousands of excellent resources on writing in LaTeX are the guides produced by most universities, which are indexable and can be found on Google search. [Princeton University][12] offers a good extended tutorial, and for a deeper dive, the Princeton guide's creator, Donald Knuth, offers [The TexBook][13], the ultimate guide to LaTeX.

--------------------------------------------------------------------------------

作者简介：

Aaron Cocker - BSc Computing student attending university in the UK. I am an aspiring Data Scientist. My favourite language is Python. Feel free to contact me at aaron@aaroncocker.org.uk or visit my personal website: https://aaroncocker.org.uk


---------------

via: https://opensource.com/article/17/6/introduction-latex

作者：[ Aaron Cocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/aaroncocker
[1]:https://opensource.com/file/356521
[2]:https://opensource.com/file/356526
[3]:https://opensource.com/file/356541
[4]:https://opensource.com/file/356536
[5]:https://opensource.com/file/356531
[6]:https://opensource.com/article/17/6/introduction-latex?rate=n5CmhY55ZhQRMjd6n5-f2p9f7iGg0nAWh_Bi6jqMMyc
[7]:https://opensource.com/user/123226/feed
[8]:http://www.texstudio.org/
[9]:https://www.tug.org/mactex/morepackages.html
[10]:https://miktex.org/download
[11]:http://www.lipsum.com/feed/html
[12]:https://www.cs.princeton.edu/courses/archive/spr10/cos433/Latex/latex-guide.pdf
[13]:http://www.ctex.org/documents/shredder/src/texbook.pdf
[14]:https://opensource.com/users/aaroncocker
[15]:https://opensource.com/article/17/6/introduction-latex#comments
