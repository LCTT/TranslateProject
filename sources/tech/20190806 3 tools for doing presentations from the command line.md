[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 tools for doing presentations from the command line)
[#]: via: (https://opensource.com/article/19/8/command-line-presentation-tools)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitthttps://opensource.com/users/murphhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/scottnesbitt)

3 tools for doing presentations from the command line
======
mdp, tpp, and sent may not win you any design awards, but they'll give
you basic slides that you can run from a terminal.
![Files in a folder][1]

Tired of creating and displaying presentation slides using [LibreOffice Impress][2] or various slightly geeky [tools][3] and [frameworks][4]? Instead, consider running the slides for your next talk from a terminal window.

Using the terminal to present slides sounds strange, but it isn't. Maybe you want to embrace your inner geek a bit more. Perhaps you want your audience to focus on your ideas rather than your slides. Maybe you're a devotee of the [Takahashi method][5]. Whatever your reasons for turning to the terminal, there's a (presentation) tool for you.

Let's take a look at three of them.

### mdp

Seeing as how I'm something of a Markdown person, I took [mdp][6] for a spin the moment I heard about it.

You create your slides in a text editor, prettying the text up with Markdown. mpd recognizes most Markdown formatting—from headings and lists to code blocks to character formatting and URLs.

You can also add a [Pandoc metadata block][7], which can contain your name, the title of your presentation, and the date you're giving your talk. That adds the title to the top of every slide and your name and the date to the bottom.

Your slides are in a single text file. To let mdp know where a slide starts, add a line of dashes after each slide.

Here's a very simple example:


```
%title: Presentation Title
%author: Your Name
%date: YYYY-MM-DD

-&gt; # Slide 1 &lt;-

Intro slide

\--------------------------------------------------
-&gt; # Slide 2 &lt;-
==============

* Item 1
* Item 2
* Item 3

\-------------------------------------------------
-&gt; # Slide 3  &lt;-

This one with a numbered list

1\. Item 1
2\. Item 2
3\. Item 3

\-------------------------------------------------

-&gt; # Conclusion  &lt;-

mdp supports *other* **formatting**, too. Give it a try!
```

See the **-&gt;** and **&lt;-** surrounding the titles of each slide? Any text between those characters is centered in a terminal window.

Run your slideshow by typing **mdp slides.md** (or whatever you named your file) in a terminal window. Here's what the example slides I cobbled together look like:

![Example mdp slide][8]

Cycle through them by pressing the arrow keys or the spacebar on your keyboard.

### tpp

[tpp][9] is another simple, text-based presentation tool. It eschews Markdown for its own formatting. While the formatting is simple, it's very concise and offers a couple of interesting—and useful—surprises.

You use dashes to indicate most of the formatting. You can add a metadata block at the top of your slide file to create the title slide for your presentation. Denote headings by typing **\--heading** followed by the heading's text. Center text on a slide by typing **\--center** and then the text.

To create a new slide, type:


```
\---
\--newpage
```

Here's an example of some basic slides:


```
\--title Presentation Title
\--date YYYY-MM-DD
\--author Your Name

\---
\--newpage

\--heading Slide 1

  * Item 1

\---
\--newpage

\--heading Slide 2
  * Item 1
  * Item 2

\---
\--newpage

\--heading Slide 3

  * Item 1
  * Item 2
  * Item 3
```

Here's what they look like in a terminal window:

![tpp slide example][10]

Move through your slides by pressing the arrow keys on your keyboard.

What about those interesting and useful surprises I mentioned earlier? You can add a splash of color to the text on a slide by typing **\--color** and then the name of the color you want to use—for example, **red**. Below that, add the text whose color you want to change, like this:


```
\--color red
Some text
```

If you have a terminal command that you want to include on a slide, wrap it between **\--beginoutput** and **\--endoutput**. Taking that a step further, you can simulate typing the command by putting it between **\--beginshelloutput** and **\--endshelloutput**. Here's an example:

![Typing a command on a slide with tpp][11]

### Sent

[Sent][12] isn't strictly a command-line presentation tool. You run it from the command line, but it opens an X11 window containing your slides.

Sent is built around the Takahashi method for presenting that I mentioned at the beginning of this article. The core idea behind the Takahashi method is to have one or two keywords in large type on a slide. The keywords distill the idea you're trying to get across at that point in your presentation.

As with mpd and tpp, you craft your slides in [plain text][13] in a text editor. Sent doesn't use markup, and there are no special characters to indicate where a new slide begins. Sent assumes each new paragraph is a slide.

You're not limited to using text. Sent also supports images. To add an image to a slide, type **@** followed by the name of the image—for example, **@mySummerVacation.jpg**.

Here's an excerpt from a slide file:


```
On Writing Evergreen Articles

Evergreen?

8 Keys to Good Evergreen Articles

@images/typewriter.jpg

Be Passionate

Get Your Hands Dirty

Focus
```

Fire up your slides by typing **sent filename** in a terminal window. The X11 window that opens goes into full-screen mode and displays text in as large a font as possible. Any images in your slides are centered in the window.

![Example Sent slide][14]

### Drawbacks of these tools

You're not going to win any design awards for the slides you create with mdp, tpp, or sent. They're plain. They're utilitarian. But, as I pointed out at the beginning of this article, the slides you create and present with those tools can help your audience focus on what you're saying rather than your visuals.

If you use mdp or tpp, you need to do some fiddling with your terminal emulator's settings to get the fonts and sizes right. Out of the box, the fonts might be too small—as you see in the screen captures above. If your terminal emulator supports profiles, create one for presentations with the font you want to use at the size you want. Then go full-screen.

Neither mdp, tpp, nor sent will appeal to everyone. That's fine. There's no one presentation tool to rule them all, no matter what some people say. But if you need, or just want, to go back to basics, these three tools are good options.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/command-line-presentation-tools

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitthttps://opensource.com/users/murphhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.libreoffice.org/discover/impress/
[3]: https://opensource.com/article/18/5/markdown-slide-generators
[4]: https://opensource.com/article/18/2/how-create-slides-emacs-org-mode-and-revealjs
[5]: https://presentationzen.blogs.com/presentationzen/2005/09/living_large_ta.html
[6]: https://github.com/visit1985/mdp
[7]: https://pandoc.org/MANUAL.html#metadata-blocks
[8]: https://opensource.com/sites/default/files/uploads/mdp-slides.png (Example mdp slide)
[9]: https://synflood.at/tpp.html
[10]: https://opensource.com/sites/default/files/uploads/tpp-example.png (tpp slide example)
[11]: https://opensource.com/sites/default/files/uploads/tpp-code_1.gif (Typing a command on a slide with tpp)
[12]: https://tools.suckless.org/sent/
[13]: https://plaintextproject.online
[14]: https://opensource.com/sites/default/files/uploads/sent-example.png (Example Sent slide)
