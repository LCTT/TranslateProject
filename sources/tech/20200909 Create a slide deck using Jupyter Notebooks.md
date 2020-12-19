[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a slide deck using Jupyter Notebooks)
[#]: via: (https://opensource.com/article/20/9/presentation-jupyter-notebooks)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Create a slide deck using Jupyter Notebooks
======
Jupyter may not be the most straightforward way to create presentation
slides and handouts, but it affords more control than simpler options.
![Person reading a book and digital copy][1]

There are many options when it comes to creating slides for a presentation. There are straightforward ways, and generating slides directly from [Jupyter][2] is not one of them. But I was never one to do things the easy way. I also have high expectations that no other slide-generation software quite meets.

### Why transition from slides to Jupyter?

I want four features in my presentation software:

  1. An environment where I can run the source code to check for errors
  2. A way to include speaker notes but hide them during the presentation
  3. To give attendees a useful handout for reading
  4. To give attendees a useful handout for exploratory learning



There is nothing more uncomfortable about giving a talk than having someone in the audience point out that there is a coding mistake on one of my slides. Often, it's misspelling a word, forgetting a return statement, or doing something else that becomes invisible as soon as I leave my development environment, where I have [a linter][3] running to catch these mistakes.

After having one too many of these moments, I decided to find a way to run the code directly from my slide editor to make sure it is correct. There are three "gotchas" I needed to consider in my solution:

  * A lot of code is boring. Nobody cares about three slides worth of `import` statements, and my hacks to mock out the `socket` module distract from my point. But it's essential that I can test the code without creating a network outage.
  * Including boilerplate code is _almost_ as boring as hearing me read words directly off of the slide. We have all heard (or even given) talks where there are three bullet points, and the presenter reads them verbatim. I try to avoid this behavior by using speaker notes.
  * There is nothing more annoying to the audience when the talk's reference material doesn't have any of the speaker notes. So I want to generate a beautiful handout containing all of my notes and the slides from the same source. Even better, I don't want to have slides on one handout and a separate GitHub repository for the source code.



As is often the case, to solve this issue, I found myself reaching for [JupyterLab][4] and its notebook management capabilities.

### Using Jupyter Notebooks for presentations

I begin my presentations by using Markdown and code blocks in a Jupyter Notebook, just like I would for anything else in JupyterLab. I write out my presentation using separate Markdown sections for the text I want to show on the slides and for the speaker notes. Code snippets go into their own blocks, as you would expect.

Because you can add a "tag" to cells, I tag any cell that has "boring" code as `no_markdown`.

![Using tags in Jupyter Notebook][5]

(Moshe Zadka, [CC BY-SA 4.0][6])

Then I convert my Notebook to Markdown with:


```
`$ jupyter nbconvert presentation.ipynb --to markdown --TagRemovePreprocessor.remove_cell_tags='{"no_markdown"}'  --output build/presentation.md`
```

There are ways to [convert Markdown to slides][7]—but I have no idea how to use any of them and even less desire to learn. Plus, I already have my favorite presentation-creation tool: [Beamer][8].

But Beamer requires custom LaTeX, and that is not usually generated when you convert Markdown to LaTeX. Thankfully, one Markdown implementation–[Pandoc Markdown][9]—has a feature that lets me do what I want. Its [raw_attribute][10] extension allows including "raw" bits of the target format in the Markdown.

This means if I run `pandoc` on the Markdown export from a notebook that includes `raw_attribute` LaTeX bits, I can have as much control over the LaTeX as I want:


```
`$ pandoc --listings -o build/presentation.tex build/presentation.md`
```

The `--listings` makes `pandoc` use LaTeX's `listings` package, which makes code look much prettier. Putting those two pieces together, I can generate LaTeX from the notebook.

Through a series of conversion steps, I was able to hide the parts I wanted to hide by using:

  * LaTeX `raw_attribute` bits inside Jupyter Notebook's Markdown cells
  * Tagging boring cells as `no_markdown`
  * Jupyter's "nbconvert" to convert the notebook to Markdown
  * Pandoc to convert the Markdown to LaTeX while interpolating the `raw_attribute` bits
  * Beamer to convert the Pandoc output to a PDF slide-deck
  * Beamer's beamerarticle mode



All combined with a little bit of duct-tape, in the form of a UNIX shell script, to produce slide-deck creation software. Ultimately, this pipeline works for me. With these tools, or similar, and some light UNIX scripting, you can make your own customized slide created pipeline, optimized to your needs and preferences.

What is the most complicated pipeline you have ever used to build a slide deck? Let me know about it—and whether you would use it again—in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/presentation-jupyter-notebooks

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://jupyter.org/
[3]: https://opensource.com/article/19/5/python-flake8
[4]: https://jupyterlab.readthedocs.io/en/stable/index.html
[5]: https://opensource.com/sites/default/files/uploads/jupyter_presentations_tags.png (Using tags in Jupyter Notebook)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/18/5/markdown-slide-generators
[8]: https://opensource.com/article/19/1/create-presentations-beamer
[9]: https://pandoc.org/MANUAL.html#pandocs-markdown
[10]: https://pandoc.org/MANUAL.html#extension-raw_attribute
