[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 Emacs modes for taking notes)
[#]: via: (https://opensource.com/article/18/7/emacs-modes-note-taking)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

3 Emacs modes for taking notes
======
Keep track of information easily with these Emacs modes.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/notebook-writing-pen.jpg?itok=uA3dCfu_)

No matter what line of work you're in, it's inevitable you have to take a few notes. Often, more than a few. If you're like many people in this day and age, you take your notes digitally.

Open source enthusiasts have a variety of options for jotting down their ideas, thoughts, and research in electronic format. You might use a [web-based tool][1]. You might go for a [desktop application][2]. Or, you might [turn to the command line][3].

If you use [Emacs][4], that wonderful operating system disguised as a text editor, there are modes that can help you take notes more efficiently. Let's look at three of them.

### Deft
![](https://opensource.com/sites/default/files/uploads/deft.png)

On those rare occasions I'm forced to use a Mac, there's one tool I can't do without: the [nvALT][5] note-taking application. [Deft mode][6] brings the nvALT experience to Emacs.

Deft stores your notes as text files in a single folder on your computer. When you enter Deft mode, it displays a list of your notes along with a short summary. The summary is taken from the first line of the text file. If you add, say, Markdown, LaTeX, or even Emacs Org mode formatting to the first line, Deft ignores the formatting and displays only the text.

To open a note, just scroll down to it and press Enter. Deft does a bit more, though. According to Deft's developer, Jason Blevins, its _primary operation is searching and filtering_. Deft does that simply but efficiently. Type a keyword and Deft displays only the notes that have that keyword in their title. That's useful if you have a lot of notes and want to find one quickly.

### Org mode
![](https://opensource.com/sites/default/files/uploads/orgmode.png)

There would be a couple or three people who would have jumped all over me if I didn't include [Org mode][7] in this article. Why? It's arguably the most flexible and the most widely used Emacs mode for taking notes. Used in the right way, Org mode can supercharge your note-taking.

Org mode's main strength is how it organizes your notes. In Org mode, a note file is set up as a large outline. Each section is a node in the outline, which you can expand and collapse. Those sections can have subsections, which also expand and collapse. That not only lets you focus on one section at a time, but it also gives you an at-a-glance overview of the information you have.

You can [link][8] between sections of your notes, quickly move sections without cutting and pasting, and [attach files][9] to your notes. Org mode supports character formatting and tables. If you need to convert your notes to something else, Org mode has a number of [export options][10].

### Howm

![](https://opensource.com/sites/default/files/uploads/howm.png)

When I started using Emacs regularly, [howm][11] quickly became one of the modes I leaned heavily on. And even though I'm deep into using Org mode, I still have a soft spot for howm.

Howm acts like a small wiki. You can create notes and task lists and link between them. By typing or clicking a link, you can jump between notes. If you need to, you can also tag your notes with a keyword. On top of that, you can search, sort, and concatenate your notes.

Howm isn't the prettiest Emacs mode, and it doesn't have the best UX. It takes a bit of getting used to. Once you do, taking and maneuvering around notes is a breeze.

Do you have a favorite Emacs mode for taking notes? Feel free to share it by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/emacs-modes-note-taking

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/alternatives/evernote
[2]: https://opensource.com/life/16/9/4-desktop-note-taking-applications
[3]: https://opensource.com/article/18/3/command-line-note-taking-applications
[4]: https://www.gnu.org/software/emacs/
[5]: http://brettterpstra.com/projects/nvalt/
[6]: https://jblevins.org/projects/deft/
[7]: https://orgmode.org/
[8]: https://orgmode.org/org.html#Hyperlinks
[9]: https://orgmode.org/org.html#Attachments
[10]: https://orgmode.org/org.html#Exporting
[11]: https://howm.osdn.jp/
