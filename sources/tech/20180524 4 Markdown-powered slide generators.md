4 Markdown-powered slide generators
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_presentation.png?itok=CQeyO61b)

Imagine you've been tapped to give a presentation. As you're preparing your talk, you think, "I should whip up a few slides."

Maybe you prefer the simplicity of [plain text][1], or maybe you think software like LibreOffice Writer is overkill for what you need to do. Or perhaps you just want to embrace your inner geek.

It's easy to turn files formatted with [Markdown][2] into attractive presentation slides. Here are four tools that can do help you do the job.

### Landslide

One of the more flexible applications on this list, [Landslide][3] is a command-line application that takes files formatted with Markdown, [reStructuredText][4], or [Textile][5] and converts them into an HTML file based on [Google’s HTML5 slides template][6].

All you need to do is write up your slides with Markdown, crack open a terminal window, and run the command `landslide` followed by the name of the file. Landslide will spit out presentation.html, which you can open in any web browser. Simple, isn’t it?

Don't let that simplicity fool you. Landslide offers more than a few useful features, such as the ability to add notes and create configuration files for your slides. Why would you want to do that? According to Landslide's developer, it helps with aggregating and reusing source directories across presentations.


![landslide.png][8]

Viewing presenter notes in a Landslide presentation

### Marp

[Marp][9] is a work in progress, but it shows promise. Short for "Markdown Presentation Writer," Marp is an [Electron][10] app in which you craft slides using a simple two-pane editor: Write in Markdown in the left pane and you get a preview in the right pane.

Marp supports [GitHub Flavored Markdown][11]. If you need a quick tutorial on using GitHub Flavored Markdown to write slides, check out the [sample presentation][12]. It's a bit more flexible than baseline Markdown.

While Marp comes with only two very basic themes, you can add background images to your slides, resize them, and include math. On the down side, it currently lets you export your slides only as PDF files. To be honest, I wonder why HTML export wasn’t a feature from day one.


![marp.png][14]

Editing some simple slides in Marp

### Pandoc

You probably know [pandoc][15] as a magic wand for converting between various markup languages. What you might not know is that pandoc can take a file formatted with Markdown and create attractive HTML slides that work with the [Slidy][16], [Slideous][17], [DZSlides][18], [S5][19], and [Reveal.js][20] presentation frameworks. If you prefer [LaTeX][21], you can also output PDF slides using the [Beamer package][22].

You'll need to [use specific formatting][23] for your slides, but you can add some [variables][24] to control how they behave. You can also change the look and feel of your slides, add pauses between slides, and include speaker notes.

Of course, you must have the supporting files for your preferred presentation framework installed on your computer. Pandoc spits out only the raw slide file.


![pandoc.png][26]

Viewing slides created with Pandoc and DZSlides

### Hacker Slides

[Hacker Slides][27] is an application for [Sandstorm][28] and [Sandstorm Oasis][29] that mates Markdown and the [Reveal.js][20] slide framework. The slides are simple, but they can be visually striking.

Craft your slide deck in a two-pane editor in your browser—type in Markdown on the left and see it rendered on the right. When you're ready to present, you can do it from within Sandstorm or get a link that you can share with others to present remotely.

What’s that—you say that you don’t use Sandstorm or Sandstorm Oasis? No worries.There's a [version of Hacker Slides][30] that you can run on your desktop or server.


![hacker-slides.png][32]

Editing slides in Hacker Slides

### Two honorable mentions

If you use [Jupyter Notebooks][33] (see community moderator Don Watkins' [article][34]) to publish data or instructional texts, then [Jupyter2slides][35] is for you. It works with Reveal.js to convert a notebook into a nice set of HTML slides.

If you prefer your applications hosted, test-drive [GitPitch][36]. It works with GitHub, GitLab, and Bitbucket. Just push the source files for your slides to a repository on one of those services, point GitPitch to that repository, and your slides are ready to view at the GitPitch site.

Do you have a favorite Markdown-powered slide generator? Share it by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/markdown-slide-generators

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://plaintextproject.online/
[2]:https://en.wikipedia.org/wiki/Markdown
[3]:https://github.com/adamzap/landslide
[4]:https://en.wikipedia.org/wiki/ReStructuredText
[5]:https://en.wikipedia.org/wiki/Textile_(markup_language)
[6]:https://github.com/skaegi/html5slides
[7]:/file/397441
[8]:https://opensource.com/sites/default/files/uploads/landslide.png (landslide.png)
[9]:https://yhatt.github.io/marp/
[10]:https://en.wikipedia.org/wiki/Electron_(software_framework)
[11]:https://guides.github.com/features/mastering-markdown/
[12]:https://raw.githubusercontent.com/yhatt/marp/master/example.md
[13]:/file/397446
[14]:https://opensource.com/sites/default/files/uploads/marp.png (marp.png)
[15]:https://pandoc.org/
[16]:https://www.w3.org/Talks/Tools/Slidy2/Overview.html#(1)
[17]:http://goessner.net/articles/slideous/
[18]:http://paulrouget.com/dzslides/
[19]:https://meyerweb.com/eric/tools/s5/
[20]:https://revealjs.com/#/
[21]:https://www.latex-project.org/
[22]:https://en.wikipedia.org/wiki/Beamer_(LaTeX)
[23]:https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc
[24]:https://pandoc.org/MANUAL.html#variables-for-slides
[25]:/file/397451
[26]:https://opensource.com/sites/default/files/uploads/pandoc.png (pandoc.png)
[27]:https://github.com/jacksingleton/hacker-slides
[28]:https://sandstorm.io/
[29]:https://oasis.sandstorm.io/
[30]:https://github.com/msoedov/hacker-slides
[31]:/file/397456
[32]:https://opensource.com/sites/default/files/uploads/hacker-slides.png (hacker-slides.png)
[33]:http://jupyter.org/
[34]:https://opensource.com/article/18/3/getting-started-jupyter-notebooks
[35]:https://github.com/datitran/jupyter2slides
[36]:https://gitpitch.com/
