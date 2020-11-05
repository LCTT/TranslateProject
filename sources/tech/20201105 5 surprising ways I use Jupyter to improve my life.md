[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 surprising ways I use Jupyter to improve my life)
[#]: via: (https://opensource.com/article/20/11/surprising-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

5 surprising ways I use Jupyter to improve my life
======
Jupyter is much more than a data-analysis tool. Learn about some of the
most creative ways you can use the Python-based software.
![Computer laptop in space][1]

The [Jupyter][2] project offers interactive ways to write software with technology like JupyterLab and Jupyter Notebook. This software is commonly used for data analysis, but what you might not know (and the Jupyter community didn't expect) is how many things you can do with it.

Here are my top five unexpected and creative ways to use Jupyter.

### 1\. Manipulate images

There are great open source tools out there for [image editing and manipulation][3]—from those that rival Photoshop to the experimental work of [Glimpse][4]. Even with all those options, sometimes I just don't want to leave the world of [Python][5].

Luckily, Jupyter is a great option for doing light image manipulation. Taking advantage of the fact that Jupyter directly shows [Pillow][6] objects as images lets you experiment with pictures as much as you want. I even used it to [make a coloring book page][7] for my child.

### 2\. Make an SSH jumpbox remote control

Since JupyterLab lets you [upload and download][8] files, [edit][9] files, and even [run terminals][10], it has all the pieces necessary to make an SSH jumpbox environment.

With some SSH-forwarding magic, you can make Jupyter your [remote console][11] on the other side of a firewall.

### 3\. Develop web applications

One of my favorite ways to use Jupyter is for an unexpected kind of software development. I [gave a talk][12] where I developed a [web application in real time][13] using a Jupyter notebook. The talk concluded with a simple form that is XSS- and CSS-safe and included some light server-side computation.

A day-to-day Jupyter user may not expect it to be a great web development environment, but it's a remarkably powerful one.

### 4\. Pull reports from your favorite services

Data analysis in JupyterLab is a common use, but what about self-improvement analysis?

You can use Jupyter to [analyze your calendar][14]. If your favorite services allow API export, or even let you export a CSV, you can correlate those against your calendar. If you find out that you were posting on social media when your calendar said you were supposed to be in a meeting with your manager, however, Jupyter can't do much to help you!

### 5\. Develop games

My favorite way to expand the expectations of what I can accomplish in a Jupyter Notebook is by building a game with my child. I wrote about this previously, with a step-by-step tutorial on [writing a game][15] using [PursuedPyBear][16] and Jupyter.

This iterative approach to game development is especially helpful when trying to figure out game mechanics. It's a game-changer (sorry, I had to) to be able to change the rules mid-game.

You can even use IPywidgets to modify the numeric parameters, as [this video][17] shows.

### [Download the eBook][18]

JupyterLab and Jupyter Notebooks offer an incredible environment for experimenting. [Download this guide][18] that contains tutorials on the surprising ways to use Jupyter. 

How are you using it in creative ways? Share your favorites in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/surprising-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://jupyter.org/
[3]: https://opensource.com/life/12/6/design-without-debt-five-tools-for-designers
[4]: https://glimpse-editor.github.io/
[5]: https://opensource.com/resources/python
[6]: https://pillow.readthedocs.io/en/stable/index.html
[7]: https://opensource.com/article/20/8/edit-images-python
[8]: https://jupyterlab.readthedocs.io/en/stable/user/files.html#uploading-and-downloading
[9]: https://jupyterlab.readthedocs.io/en/stable/user/files.html#opening-files
[10]: https://jupyterlab.readthedocs.io/en/stable/user/terminal.html
[11]: https://opensource.com/article/20/8/remote-management-jupyter
[12]: https://opensource.com/article/20/8/write-talk-using-jupyter-notebooks
[13]: https://github.com/moshez/interactive-web-development/blob/e31ae72d8cab7637d18bc734c4e8afc10c60251f/interactive-web-development.ipynb
[14]: https://opensource.com/article/20/9/analyze-your-life-jupyter
[15]: https://opensource.com/article/20/5/python-games
[16]: https://ppb.dev/
[17]: https://www.youtube.com/watch?v=JaTf_ZT7tE8
[18]: https://opensource.com/downloads/jupyter-guide
