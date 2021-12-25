[#]: subject: "Write your screenplay on Linux in Fountain markdown"
[#]: via: "https://opensource.com/article/21/12/linux-fountain"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Write your screenplay on Linux in Fountain markdown
======
The Fountain markdown technique requires just a plain text editor, like Atom, Kate, Gedit, or similar, and it exports to a properly formatted HTML or PDF screenplay.
![Typewriter in the grass][1]

A screenplay is the blueprint for a movie, and it used to be written on a typewriter. You bought the typewriter, and you could write a screenplay. And not just one screenplay, but lots of them. You could write screenplays until typewriters fell out of fashion.

The puzzling thing is, though, that as technology for writing became "better," the harder it got to write screenplays. There are strict formatting rules in the screenplay world implemented to help the Assistant Director (AD) on a film shoot estimate how long each scene would take to shoot. You'd think that a computer would make this easier than the exclusively manual process required on a typewriter. Yet, popular computers managed to restrict writers with expensive software that became embedded in Hollywood culture. If you didn't have the right software, you were told that you could never be a serious screenwriter.

All that changed with open source software, though, and one of the simplest methods of writing screenplays is not to use special software at all. The [Fountain][2] markdown technique requires just a plain text editor, like [Atom][3], [Kate][4], [Gedit][5], or similar, and it exports to a properly formatted HTML or PDF screenplay.

### Install Fountain

Fountain doesn't require installation because it's not software; it's a set of rules you use as you write. You already follow rules when writing: you capitalize the first letter of a sentence, end each sentence with a full-stop, and so on. When you write in Fountain, you add a few new rules specific to screenplays.

### Slugs

In a screenplay, each scene is delimited by a line written in capital letters, starting with either INT. or EXT., a location, a dash, and the time of day. These instructions are referred to as _slugs_. Conveniently, that's also the rule in Fountain, so there's nothing new to remember to create a slug.


```
`EXT. CASTLE COURTYARD - DAY`
```

### Action

When an actor is required to perform a specific action, a screenplay contains action text. This is normal prose, written exactly as you'd write text in a book. All normal rules apply, so nothing new to remember for action text.


```


A wizard wanders out of a great stone door. She approaches the center of the courtyard and pauses. Something's caught her eye.

It's a book. She leans down and picks it up.

```

### Dialog

Screenplays format dialog indented from both left and right margins. To a casual viewer, it might appear centered, but it's actually left-justified. It's formatted this way to help actors locate their lines and to force the screenplay to take up more space for spoken dialog because, in movies, that's often what occupies much of the running time.

In Fountain, the rule for dialog is to write the name of the character who's speaking in capital letters. On the next line, write the dialog normally.


```


WIZARD

I can sense your power. Grep? Sed? What strange terms!

```

When you export your screenplay, the dialog gets adjusted with the appropriate formatting.

### Transitions

It's somewhat fallen out of favor now, but traditionally, there were indications of special transitions in screenplays because, long ago, some transitions cost a lot of money. You still see transitions in screenplays today, but it's often meant more as a sort of punctuation mark for a group of scenes (or, in the case of the classic FADE OUT., the whole movie) rather than an actual instruction for the editor.

To create a transition in Fountain, prefix your text with the greater-than symbol (&gt;).


```


&gt;ANGLE ON:

The book's title page. It reads "Introduction to Linux."

&gt;FADE OUT.

```

### More rules

You can use many other markdown conventions in your screenplays, such as asterisks to italicize, embolden, and underline text. And there are yet more rules in Fountain for edge cases and stylistic exceptions, but these four rules are all you need most of the time.

The simplicity of Fountain, though, demonstrates how well designed the screenplay format was a hundred years ago. It had a standard structure that made it easy for human eyes to parse, and such predictability translates well for computer parsing, as well.

### Exporting and rendering

Once you're done writing, you can export your screenplay to its proper format using a rendering application. There are [several renderers available][6], but one of my favorites is the Atom editor. To configure Atom to display Fountain previews files in the appropriate format, and to export them to PDF when you're done, go to the **Edit** menu, select **Preferences**, and click the **Install** link in the left panel. In the search field, type **fountain** and install the Fountain plugin released by developer _superlou_.

![Install a Fountain plugin for Atom][7]

(Seth Kenlon, CC BY-SA 4.0)

You're prompted to agree to install some of its dependencies as it installs. Once everything's installed, you can go to the **Packages** menu, select **Fountain**, and either view a preview of your screenplay or export a PDF version.

There's a **fountain-mode** for Emacs, too, which has the added convenience of performing some basic formatting as you type.

![Fountain-mode in Emacs][8]

(Seth Kenlon, CC BY-SA 4.0)

Regardless of what text editor you use, you can always render your screenplay using dedicated applications. There's a Python module called Screenplain that works well for me. To install it, type this into a terminal:


```
`$ python3 -m pip install 'screenplain[PDF]' --user`
```

To render a screenplay to PDF:


```
`$ screenplain --format pdf myscreenplay.fountain > script.pdf`
```

![A rendered Fountain file][9]

(Seth Kenlon, CC BY-SA 4.0)

### Screenplays with open source

Fountain is about convenience. You can write your screenplay without the complexity of a special application.

Fountain is about budget. You can write your screenplay without costly software.

Fountain is about flexibility. You can create in the application you already use for writing.

And Fountain is about preservation. You won't lose access to your work because an application goes out of style, or out of business, or because you can't afford it.

There are many great reasons to use Fountain, but the most important one is that it helps you focus on creativity. If you've got a movie in mind, write it in Fountain. It's the first step to what could be a very exciting journey.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/linux-fountain

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead.png?itok=h3fCkVmU (Typewriter in the grass)
[2]: http://fountain.io
[3]: https://opensource.com/article/20/12/atom
[4]: https://opensource.com/article/20/12/kate-text-editor
[5]: https://opensource.com/article/20/12/gedit
[6]: https://fountain.io/apps
[7]: https://opensource.com/sites/default/files/fountain-atom.jpg (Install a Fountain plugin for Atom)
[8]: https://opensource.com/sites/default/files/fountain-emacs_0.jpg (Fountain-mode in Emacs)
[9]: https://opensource.com/sites/default/files/fountain-render.jpg (A rendered Fountain file)
