Turn your book into a website and an ePub using Pandoc
======
Write once, publish twice using Markdown and Pandoc.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Pandoc is a command-line tool for converting files from one markup language to another. In my [introduction to Pandoc][1], I explained how to convert text written in Markdown into a website, a slideshow, and a PDF.

In this follow-up article, I'll dive deeper into [Pandoc][2], showing how to produce a website and an ePub book from the same Markdown source file. I'll use my upcoming e-book, [GRASP Principles for the Object-Oriented Mind][3], which I created using this process, as an example.

First I will explain the file structure used for the book, then how to use Pandoc to generate a website and deploy it in GitHub. Finally, I demonstrate how to generate its companion ePub book.

You can find the code in my [Programming Fight Club][4] GitHub repository.

### Setting up the writing structure

I do all of my writing in Markdown syntax. You can also use HTML, but the more HTML you introduce the highest risk that problems arise when Pandoc converts Markdown to an ePub document. My books follow the one-chapter-per-file pattern. Declare chapters using the Markdown heading H1 ( **#** ). You can put more than one chapter in each file, but putting them in separate files makes it easier to find content and do updates later.

The meta-information follows a similar pattern: each output format has its own meta-information file. Meta-information files define information about your documents, such as text to add to your HTML or the license of your ePub. I store all of my Markdown documents in a folder named parts (this is important for the Makefile that generates the website and ePub). As an example, let's take the table of contents, the preface, and the about chapters (divided into the files toc.md, preface.md, and about.md) and, for clarity, we will leave out the remaining chapters.

My about file might begin like:

```
# About this book {-}

## Who should read this book {-}

Before creating a complex software system one needs to create a solid foundation.
General Responsibility Assignment Software Principles (GRASP) are guidelines to assign
responsibilities to software classes in object-oriented programming.
```

Once the chapters are finished, the next step is to add meta-information to setup the format for the website and the ePub.

### Generating the website

#### Create the HTML meta-information file

The meta-information file (web-metadata.yaml) for my website is a simple YAML file that contains information about the author, title, rights, content for the **< head>** tag, and content for the beginning and end of the HTML file.

I recommend (at minimum) including the following fields in the web-metadata.yaml file:

```
---
title: <a href="/grasp-principles/toc/">GRASP principles for the Object-oriented mind</a>
author: Kiko Fernandez-Reyes
rights: 2017 Kiko Fernandez-Reyes, CC-BY-NC-SA 4.0 International
header-includes:
- |
  \```{=html}
  <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Gentium+Basic|Inconsolata" rel="stylesheet">
  \```
include-before:
- |
  \```{=html}
  <p>If you like this book, please consider
      spreading the word or
      <a href="https://www.buymeacoffee.com/programming">
        buying me a coffee
      </a>
  </p>
  \```
include-after:
- |
  ```{=html}
  <div class="footnotes">
    <hr>
    <div class="container">
        <nav class="pagination" role="pagination">
          <ul>
          <p>
          <span class="page-number">Designed with</span> ❤️  <span class="page-number"> from Uppsala, Sweden</span>
           </p>
           <p>
           <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
           </p>
           </ul>
        </nav>
    </div>
  </div>
  \```
---
```

Some variables to note:

  * The **header-includes** variable contains HTML that will be embedded inside the **< head>** tag.
  * The line after calling a variable must be **\- |**. The next line must begin with triple backquotes that are aligned with the **|** or Pandoc will reject it. **{=html}** tells Pandoc that this is raw text and should not be processed as Markdown. (For this to work, you need to check that the **raw_attribute** extension in Pandoc is enabled. To check, type **pandoc --list-extensions | grep raw** and make sure the returned list contains an item named **+raw_html** ; the plus sign indicates it is enabled.)
  * The variable **include-before** adds some HTML at the beginning of your website, and I ask readers to consider spreading the word or buying me a coffee.
  * The **include-after** variable appends raw HTML at the end of the website and shows my book's license.



These are only some of the fields available; take a look at the template variables in HTML (my article [introduction to Pandoc][1] covered this for LaTeX but the process is the same for HTML) to learn about others.

#### Split the website into chapters

The website can be generated as a whole, resulting in a long page with all the content, or split into chapters, which I think is easier to read. I'll explain how to divide the website into chapters so the reader doesn't get intimidated by a long website.

To make the website easy to deploy on GitHub Pages, we need to create a root folder called docs (which is the root folder that GitHub Pages uses by default to render a website). Then we need to create folders for each chapter under docs, place the HTML chapters in their own folders, and the file content in a file named index.html.

For example, the about.md file is converted to a file named index.html that is placed in a folder named about (about/index.html). This way, when users type **http:// <your-website.com>/about/**, the index.html file from the folder about will be displayed in their browser.

The following Makefile does all of this:

```
# Your book files
DEPENDENCIES= toc preface about

# Placement of your HTML files
DOCS=docs

all: web

web: setup $(DEPENDENCIES)
        @cp $(DOCS)/toc/index.html $(DOCS)


# Creation and copy of stylesheet and images into
# the assets folder. This is important to deploy the
# website to Github Pages.
setup:
        @mkdir -p $(DOCS)
        @cp -r assets $(DOCS)


# Creation of folder and index.html file on a
# per-chapter basis

$(DEPENDENCIES):
        @mkdir -p $(DOCS)/$@
        @pandoc -s --toc web-metadata.yaml parts/$@.md \
        -c /assets/pandoc.css -o $(DOCS)/$@/index.html

clean:
        @rm -rf $(DOCS)

.PHONY: all clean web setup
```

The option **-c /assets/pandoc.css** declares which CSS stylesheet to use; it will be fetched from **/assets/pandoc.css**. In other words, inside the **< head>** HTML tag, Pandoc adds the following line:

```
<link rel="stylesheet" href="/assets/pandoc.css">
```

To generate the website, type:

```
make
```

The root folder should contain now the following structure and files:

```
.---parts
|    |--- toc.md
|    |--- preface.md
|    |--- about.md
|
|---docs
    |--- assets/
    |--- index.html
    |--- toc
    |     |--- index.html
    |
    |--- preface
    |     |--- index.html
    |
    |--- about
          |--- index.html
   
```

#### Deploy the website

To deploy the website on GitHub, follow these steps:

  1. Create a new repository
  2. Push your content to the repository
  3. Go to the GitHub Pages section in the repository's Settings and select the option for GitHub to use the content from the Master branch



You can get more details on the [GitHub Pages][5] site.

Check out [my book's website][6], generated using this process, to see the result.

### Generating the ePub book

#### Create the ePub meta-information file

The ePub meta-information file, epub-meta.yaml, is similar to the HTML meta-information file. The main difference is that ePub offers other template variables, such as **publisher** and **cover-image**. Your ePub book's stylesheet will probably differ from your website's; mine uses one named epub.css.

```
---
title: 'GRASP principles for the Object-oriented Mind'
publisher: 'Programming Language Fight Club'
author: Kiko Fernandez-Reyes
rights: 2017 Kiko Fernandez-Reyes, CC-BY-NC-SA 4.0 International
cover-image: assets/cover.png
stylesheet: assets/epub.css
...
```

Add the following content to the previous Makefile:

```
epub:
        @pandoc -s --toc epub-meta.yaml \
        $(addprefix parts/, $(DEPENDENCIES:=.md)) -o $(DOCS)/assets/book.epub
```

The command for the ePub target takes all the dependencies from the HTML version (your chapter names), appends to them the Markdown extension, and prepends them with the path to the folder chapters' so Pandoc knows how to process them. For example, if **$(DEPENDENCIES)** was only **preface about** , then the Makefile would call:

```
@pandoc -s --toc epub-meta.yaml \
parts/preface.md parts/about.md -o $(DOCS)/assets/book.epub
```

Pandoc would take these two chapters, combine them, generate an ePub, and place the book under the Assets folder.

Here's an [example][7] of an ePub created using this process.

### Summarizing the process

The process to create a website and an ePub from a Markdown file isn't difficult, but there are a lot of details. The following outline may make it easier for you to follow.

  * HTML book:
    * Write chapters in Markdown
    * Add metadata
    * Create a Makefile to glue pieces together
    * Set up GitHub Pages
    * Deploy
  * ePub book:
    * Reuse chapters from previous work
    * Add new metadata file
    * Create a Makefile to glue pieces together
    * Set up GitHub Pages
    * Deploy



--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/book-to-website-epub-using-pandoc

作者：[Kiko Fernandez-Reyes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kikofernandez
[1]: https://opensource.com/article/18/9/intro-pandoc
[2]: https://pandoc.org/
[3]: https://www.programmingfightclub.com/
[4]: https://github.com/kikofernandez/programmingfightclub
[5]: https://pages.github.com/
[6]: https://www.programmingfightclub.com/grasp-principles/
[7]: https://github.com/kikofernandez/programmingfightclub/raw/master/docs/web_assets/demo.epub
