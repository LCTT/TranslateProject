[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create presentations with Beamer)
[#]: via: (https://opensource.com/article/19/1/create-presentations-beamer)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to create presentations with Beamer
======
Beamer brings LaTeX's powerful typesetting features and ecosystem to creating slides.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_presentation.png?itok=CQeyO61b)

[Beamer][1] is a LaTeX package for generating presentation slide decks. One of its nicest features is that it can take advantage of LaTeX's powerful typesetting system and all the other packages in its ecosystem. For example, I often use LaTeX's [listings][2] package in Beamer presentations that include code.

### Starting a presentation

To begin a Beamer document, enter:

```
\documentclass{beamer}
```

As you would with any other LaTeX document, add any packages you want to use. For example, to use the **listings** package, enter:

```
\usepackage{listings}
```

Place all content inside the **document** environment:

```
\begin{document}
```

Beamer documents are usually a sequence of **frame** environments. Frames that contain code should be marked **fragile** :

```
\begin{frame}[fragile]
```

Begin your frames with a title:

```
\frametitle{Function to Do Stuff}
```

### Testing your code before you present it

One of the worst feelings in the world is giving a talk and realizing, as you walk through the code, that there is a glaring bug in it—maybe a misspelled keyword or an unclosed brace.

The solution is to test code that is presented. In most presentation environments, this means creating a separate file, writing tests, then copying and pasting.

However, with Beamer, there is a better way. Imagine you have a file named **do_stuff.py** that contains code. You can write tests for the **do_stuff.py** code in a second file, which you call **test_do_stuff.py** , and can exercise it with, say, [pytest][3]. However, most of the lines in **do_stuff.py** lack pedagogic value, like defining helper functions.

To simplify things for your audience, you can import just the lines you want to talk about into the frame in your presentation :

```
\lstinputlisting[
    language=Python,
    firstline=8,
    lastline=15
]{do_stuff.py}
```

Since you will be talking through those lines (from 8 to 15), you don't need any other content on the slide. Close the frame:

```
\end{frame}
```

On the next slide, you want to show a usage example for the **do_stuff()** function you just presented:

```
\begin{frame}[fragile]
\frametitle{Calling Function to Do Stuff}
\lstinputlisting[
    language=Python,
    firstline=17,
    lastline=19
]{do_stuff.py}
\end{frame}
```

You use the same file, but this time you show the lines that call the function. Finally, close the document:

```
\end{document}
```

Assuming you have an appropriate Python file in **do_stuff.py** , this will produce a short two-slide presentation.

Beamer also supports necessary features such as progressive revelation, showing only one bullet at a time to prevent the audience from being distracted by reading ahead.": **\pause** inside a list will divide bullets into pages:

```
\begin{frame}
Remember:
\begin{itemize}
\item This will show up on the first slide. \pause
\item This will show up on the
      second slide, as well as the preceding point. \pause
\item Finally, on the third slide,
       all three bullets will show up.
\end{frame}
```

### Creating handouts

My favorite feature in Beamer is that you can set it to ignore everything outside a frame with **\documentclass[ignorenonframetext]{beamer}**. When I prepare a presentation, I leave off the top (where the document class is declared) and auto-generate two versions of it: one with Beamer that ignores all text outside any frame, which I use for my presentation, and one with a header like:

```
\documentclass{article}
\usepackage{beamerarticle}
```

which generates a handout—a PDF that has all the frames and all the text between them.

When a conference organizer asks me to publish my slides, I include the original slide deck as a reference, but the main thing I like people to have is the handout, which has all the explanatory text that I don't want to include on the slide deck itself.

When creating presentation slides, people often wonder whether it's better to optimize their materials for the presentation or for people who want to read them afterward. Fortunately, Beamer provides the best of both worlds.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/create-presentations-beamer

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://www.overleaf.com/learn/latex/Beamer
[2]: https://www.overleaf.com/learn/latex/Code_listing
[3]: https://docs.pytest.org/en/latest/
