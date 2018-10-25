translating by dianbanjiu
How to use Pandoc to produce a research paper
======
Learn how to manage section references, figures, tables, and more in Markdown.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T)

This article takes a deep dive into how to produce a research paper using (mostly) [Markdown][1] syntax. We'll cover how to create and reference sections, figures (in Markdown and [LaTeX][2]) and bibliographies. We'll also discuss troublesome cases and why writing them in LaTeX is the right approach.

### Research

Research papers usually contain references to sections, figures, tables, and a bibliography. [Pandoc][3] by itself cannot easily cross-reference these, but it can leverage the [pandoc-crossref][4] filter to do the automatic numbering and cross-referencing of sections, figures, and tables.

Let’s start by rewriting [an example of an educational research paper][5] originally written in LaTeX and rewrites it in Markdown (and some LaTeX) with Pandoc and pandoc-crossref.

#### Adding and referencing sections

Sections are automatically numbered and must be written using the Markdown heading H1. Subsections are written with subheadings H2-H4 (it is uncommon to need more than that). For example, to write a section titled “Implementation”, write `# Implementation {#sec:implementation}`, and Pandoc produces `3. Implementation` (or the corresponding numbered section). The title “Implementation” uses heading H1 and declares a label `{#sec:implementation}` that authors can use to refer to that section. To reference a section, type the `@` symbol followed by the label of the section and enclose it in square brackets: `[@sec:implementation]`.

[In this paper][5], we find the following example:

```
we lack experience (consistency between TAs, [@sec:implementation]).
```

Pandoc produces:

```
we lack experience (consistency between TAs, Section 4).
```

Sections are numbered automatically (this is covered in the `Makefile` at the end of the article). To create unnumbered sections, type the title of the section, followed by `{-}`. For example, `### Designing a game for maintainability {-}` creates an unnumbered subsection with the title “Designing a game for maintainability”.

#### Adding and referencing figures

Adding and referencing a figure is similar to referencing a section and adding a Markdown image:

```
![Scatterplot matrix](data/scatterplots/RScatterplotMatrix2.png){#fig:scatter-matrix}
```

The line above tells Pandoc that there is a figure with the caption Scatterplot matrix and the path to the image is `data/scatterplots/RScatterplotMatrix2.png`. `{#fig:scatter-matrix}` declares the name that should be used to reference the figure.

Here is an example of a figure reference from the example paper:

```
The boxes "Enjoy", "Grade" and "Motivation" ([@fig:scatter-matrix]) ...
```

Pandoc produces the following output:

```
The boxes "Enjoy", "Grade" and "Motivation" (Fig. 1) ...
```

#### Adding and referencing a bibliography

Most research papers keep references in a BibTeX database file. In this example, this file is named [biblio.bib][6] and it contains all the references of the paper. Here is what this file looks like:

```
@inproceedings{wrigstad2017mastery,
    Author =       {Wrigstad, Tobias and Castegren, Elias},
    Booktitle =    {SPLASH-E},
    Title =        {Mastery Learning-Like Teaching with Achievements},
    Year =         2017
}

@inproceedings{review-gamification-framework,
  Author =       {A. Mora and D. Riera and C. Gonzalez and J. Arnedo-Moreno},
  Publisher =    {IEEE},
  Booktitle =    {2015 7th International Conference on Games and Virtual Worlds
                  for Serious Applications (VS-Games)},
  Doi =          {10.1109/VS-GAMES.2015.7295760},
  Keywords =     {formal specification;serious games (computing);design
                  framework;formal design process;game components;game design
                  elements;gamification design frameworks;gamification-based
                  solutions;Bibliographies;Context;Design
                  methodology;Ethics;Games;Proposals},
  Month =        {Sept},
  Pages =        {1-8},
  Title =        {A Literature Review of Gamification Design Frameworks},
  Year =         2015,
  Bdsk-Url-1 =   {http://dx.doi.org/10.1109/VS-GAMES.2015.7295760}
}

...
```

The first line, `@inproceedings{wrigstad2017mastery,`, declares the type of publication (`inproceedings`) and the label used to refer to that paper (`wrigstad2017mastery`).

To cite the paper with its title, Mastery Learning-Like Teaching with Achievements, type:

```
the achievement-driven learning methodology [@wrigstad2017mastery]
```

Pandoc will output:

```
the achievement- driven learning methodology [30]
```

The paper we will produce includes a bibliography section with numbered references like these:

![](https://opensource.com/sites/default/files/uploads/bibliography-example_0.png)

Citing a collection of articles is easy: Simply cite each article, separating the labeled references using a semi-colon: `;`. If there are two labeled references—i.e., `SEABORN201514` and `gamification-leaderboard-benefits`—cite them together, like this:

```
Thus, the most important benefit is its potential to increase students' motivation

and engagement [@SEABORN201514;@gamification-leaderboard-benefits].
```

Pandoc will produce:

```
Thus, the most important benefit is its potential to increase students’ motivation

and engagement [26, 28]
```

### Problematic cases

A common problem involves objects that do not fit in the page. They then float to wherever they fit best, even if that position is not where the reader expects to see it. Since papers are easier to read when figures or tables appear close to where they are mentioned, we need to have some control over where these elements are placed. For this reason, I recommend the use of the `figure` LaTeX environment, which enables users to control the positioning of figures.

Let’s take the figure example shown above:

```
![Scatterplot matrix](data/scatterplots/RScatterplotMatrix2.png){#fig:scatter-matrix}
```

And rewrite it in LaTeX:

```
\begin{figure}[t]
\includegraphics{data/scatterplots/RScatterplotMatrix2.png}
\caption{\label{fig:matrix}Scatterplot matrix}
\end{figure}
```

In LaTeX, the `[t]` option in the `figure` environment declares that the image should be placed at the top of the page. For more options, refer to the Wikibooks article [LaTex/Floats, Figures, and Captions][7].

### Producing the paper

So far, we've covered how to add and reference (sub-)sections and figures and cite the bibliography—now let's review how to produce the research paper in PDF format. To generate the PDF, we will use Pandoc to generate a LaTeX file that can be compiled to the final PDF. We will also discuss how to generate the research paper in LaTeX using a customized template and a meta-information file, and how to compile the LaTeX document into its final PDF form.

Most conferences provide a **.cls** file or a template that specifies how papers should look; for example, whether they should use a two-column format and other design treatments. In our example, the conference provided a file named **acmart.cls**.

Authors are generally expected to include the institution to which they belong in their papers. However, this option was not included in the default Pandoc’s LaTeX template (note that the Pandoc template can be inspected by typing `pandoc -D latex`). To include the affiliation, take the default Pandoc’s LaTeX template and add a new field. The Pandoc template was copied into a file named `mytemplate.tex` as follows:

```
pandoc -D latex > mytemplate.tex
```

The default template contains the following code:

```
$if(author)$
\author{$for(author)$$author$$sep$ \and $endfor$}
$endif$
$if(institute)$
\providecommand{\institute}[1]{}
\institute{$for(institute)$$institute$$sep$ \and $endfor$}
$endif$
```

Because the template should include the author’s affiliation and email address, among other things, we updated it to include these fields (we made other changes as well but did not include them here due to the file length):

```
latex
$for(author)$
    $if(author.name)$
        \author{$author.name$}
        $if(author.affiliation)$
            \affiliation{\institution{$author.affiliation$}}
        $endif$
        $if(author.email)$
            \email{$author.email$}
        $endif$
    $else$
        $author$
    $endif$
$endfor$
```

With these changes in place, we should have the following files:

  * `main.md` contains the research paper
  * `biblio.bib` contains the bibliographic database
  * `acmart.cls` is the class of the document that we should use
  * `mytemplate.tex` is the template file to use (instead of the default)



Let’s add the meta-information of the paper in a `meta.yaml`file:

```
---
template: 'mytemplate.tex'
documentclass: acmart
classoption: sigconf
title: The impact of opt-in gamification on `\\`{=latex} students' grades in a software design course
author:
- name: Kiko Fernandez-Reyes
  affiliation: Uppsala University
  email: kiko.fernandez@it.uu.se
- name: Dave Clarke
  affiliation: Uppsala University
  email: dave.clarke@it.uu.se
- name: Janina Hornbach
  affiliation: Uppsala University
  email: janina.hornbach@fek.uu.se
bibliography: biblio.bib
abstract: |
  An achievement-driven methodology strives to give students more control over their learning with enough flexibility to engage them in deeper learning. (more stuff continues)

include-before: |
      \```{=latex}
      \copyrightyear{2018}
      \acmYear{2018}
      \setcopyright{acmlicensed}
      \acmConference[MODELS '18 Companion]{ACM/IEEE 21th International Conference on Model Driven Engineering Languages and Systems}{October 14--19, 2018}{Copenhagen, Denmark}
      \acmBooktitle{ACM/IEEE 21th International Conference on Model Driven Engineering Languages and Systems (MODELS '18 Companion), October 14--19, 2018, Copenhagen, Denmark}
      \acmPrice{XX.XX}
      \acmDOI{10.1145/3270112.3270118}
      \acmISBN{978-1-4503-5965-8/18/10}

      \begin{CCSXML}
      <ccs2012>
      <concept>
      <concept_id>10010405.10010489</concept_id>
      <concept_desc>Applied computing~Education</concept_desc>
      <concept_significance>500</concept_significance>
      </concept>
      </ccs2012>
      \end{CCSXML}

      \ccsdesc[500]{Applied computing~Education}

      \keywords{gamification, education, software design, UML}
      \```
figPrefix:
  - "Fig."
  - "Figs."
secPrefix:
  - "Section"
  - "Sections"
...
```

This meta-information file sets the following variables in LaTeX:

  * `template` refers to the template to use (‘mytemplate.tex’)
  * `documentclass` refers to the LaTeX document class to use (`acmart`)
  * `classoption` refers to the options of the class, in this case `sigconf`
  * `title` specifies the title of the paper
  * `author` is an object that contains other fields, such as `name`, `affiliation`, and `email`.
  * `bibliography`refers to the file that contains the bibliography (biblio.bib)
  * `abstract` contains the abstract of the paper
  * `include-before`is information that should be included before the actual content of the paper; this is known as the [preamble][8] in LaTeX. I have included it here to show how to generate a computer science paper, but you may choose to skip it
  * `figPrefix` specifies how to refer to figures in the document, i.e., what should be displayed when one refers to the figure `[@fig:scatter-matrix]`. For example, the current `figPrefix` produces in the example `The boxes "Enjoy", "Grade" and "Motivation" ([@fig:scatter-matrix])` this output: `The boxes "Enjoy", "Grade" and "Motivation" (Fig. 3)`. If there are multiple figures, the current setup declares that it should instead display `Figs.` next to the figure numbers.
  * `secPrefix` specifies how to refer to sections mentioned elsewhere in the document (similar to figures, described above)



Now that the meta-information is set, let’s create a `Makefile` that produces the desired output. This `Makefile` uses Pandoc to produce the LaTeX file, `pandoc-crossref` to produce the cross-references, `pdflatex` to compile the LaTeX to PDF, and `bibtex `to process the references.

The `Makefile` is shown below:

```
all: paper

paper:
        @pandoc -s -F pandoc-crossref --natbib meta.yaml --template=mytemplate.tex -N \
         -f markdown -t latex+raw_tex+tex_math_dollars+citations -o main.tex main.md
        @pdflatex main.tex &> /dev/null
        @bibtex main &> /dev/null
        @pdflatex main.tex &> /dev/null
        @pdflatex main.tex &> /dev/null

clean:
        rm main.aux main.tex main.log main.bbl main.blg main.out

.PHONY: all clean paper
```

Pandoc uses the following flags:

  * `-s` to create a standalone LaTeX document
  * `-F pandoc-crossref` to make use of the filter `pandoc-crossref`
  * `--natbib` to render the bibliography with `natbib` (you can also choose `--biblatex`)
  * `--template` sets the template file to use
  * `-N` to number the section headings
  * `-f` and `-t` specify the conversion from and to which format. `-t` usually contains the format and is followed by the Pandoc extensions used. In the example, we declared `raw_tex+tex_math_dollars+citations` to allow use of `raw_tex` LaTeX in the middle of the Markdown file. `tex_math_dollars` enables us to type math formulas as in LaTeX, and `citations` enables us to use [this extension][9].



To generate a PDF from LaTeX, follow the guidelines [from bibtex][10] to process the bibliography:

```
@pdflatex main.tex &> /dev/null
@bibtex main &> /dev/null
@pdflatex main.tex &> /dev/null
@pdflatex main.tex &> /dev/null
```

The script contains `@` to ignore the output, and we redirect the file handle of the standard output and error to `/dev/null`so that we don’t see the output generated from the execution of these commands.

The final result is shown below. The repository for the article can be found [on GitHub][11]:

![](https://opensource.com/sites/default/files/uploads/abstract-image.png)

### Conclusion

In my opinion, research is all about collaboration, dissemination of ideas, and improving the state of the art in whatever field one happens to be in. Most computer scientists and engineers write papers using the LaTeX document system, which provides excellent support for math. Researchers from the social sciences seem to stick to DOCX documents.

When researchers from different communities write papers together, they should first discuss which format they will use. While DOCX may not be convenient for engineers if there is math involved, LaTeX may be troublesome for researchers who lack a programming background. As this article shows, Markdown is an easy-to-use language that can be used by both engineers and social scientists.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/pandoc-research-paper

作者：[Kiko Fernandez-Reyes][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kikofernandez
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Markdown
[2]: https://www.latex-project.org/
[3]: https://pandoc.org/
[4]: http://lierdakil.github.io/pandoc-crossref/
[5]: https://dl.acm.org/citation.cfm?id=3270118
[6]: https://github.com/kikofernandez/pandoc-examples/blob/master/research-paper/biblio.bib
[7]: https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures
[8]: https://www.sharelatex.com/learn/latex/Creating_a_document_in_LaTeX#The_preamble_of_a_document
[9]: http://pandoc.org/MANUAL.html#citations
[10]: http://www.bibtex.org/Using/
[11]: https://github.com/kikofernandez/pandoc-examples/tree/master/research-paper
