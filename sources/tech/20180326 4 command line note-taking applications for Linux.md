translating---geekpi

4 command line note-taking applications for Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/note-taking.jpeg?itok=fiF5EBEb)
When you need to save a code snippet or a URL, an idea or a quote, you probably fire up a text editor or turn to a [desktop][1] or [web-based][2] note-taking tool. But those aren't your only options. If you spend time working in terminal windows, you can use one of the many note-taking tools available for the Linux command line.

Let's take a look at of those four apps.

### tnote

[tnote][3] makes taking notes in a terminal window very simple—almost too simple.

tnote is a single Python script. When you start it for the first time, it asks you to enter a password and a passphrase to encrypt the [SQLite database][4] that stores your notes. Once you've done that, press "A" to create a note. Type your note, then press CTRL-D to save it.

Once you have a few (or more than a few) notes, you can view them or search for specific ones, words or phrases, or tags. tnote doesn't pack a lot of features, but it does get the job done.

### Terminal Velocity

If you've used Mac OS, you might have come across a popular open source note-taking application called [Notational Velocity][5], a simple and effective way to take notes. [Terminal Velocity][6] does a good job of bringing the Notational Velocity experience to the command line.

Terminal Velocity opens your default text editor (set by the `$EDITOR` variable in your `.profile` or `.bashrc` file). Type your note, then save it. The note appears in the list in the Terminal Velocity window.

Use the arrow keys on your keyboard to scroll through your list of notes. To view or edit a note, press Enter. If you have a long list of notes, you can enter the first few characters of the note's title in the `Find or Create` field to narrow down the list. From there, scroll to the note and press Enter to open it.

### pygmynote

Of the four applications in this article, [pygmynote][7] is probably the least user-friendly. It is, however, the most flexible.

Like tnote, pygmynote saves your notes and attachments in an SQLite database. When you fire it up, pygmynote doesn’t look particularly useful. At any time, type `help` and press Enter to get a list of commands.

You can add and edit notes, view and search for them, and add [tags][8] to your notes. Tags make finding notes easier, especially if you have a lot of them.

What gives pygmynote flexibility is its ability to add attachments to your notes. Those attachments can be anything: an image, a text or word processor file, a PDF, a spreadsheet, or anything else relevant to the note.

### jrnl

[jrnl][9] is the odd application out here. As you've probably guessed from its name, jrnl is intended to be a journaling tool. But that doesn't mean you can't take notes with it. jrnl does that job very well.

When you first start jrnl, it asks you where you want to put the file `journal.txt` (which stores your notes), and if you want to password-protect the file. If you decide to add a password, you need to enter it whenever you do anything with the application.

You can enter notes in two ways: directly from the command line, or with your computer's default editor. You can add tags—for example,`@opensource.com`—to your notes, and give them a date and timestamp. Adding tags and dates can help you search for your notes (jrnl has a pretty decent search feature) if you have a lot of them.

Since jrnl saves your notes in a plain text file, you can sync it across your devices using [ownCloud][10], [Nextcloud][11], or whatever file sharing/syncing service your prefer.

Do you have a favorite tool or hack for taking notes at the command line? Feel free to share it with the community by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/command-line-note-taking-applications

作者：[Scott Nesbitt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/life/16/9/4-desktop-note-taking-applications
[2]:https://opensource.com/alternatives/evernote
[3]:https://github.com/tasdikrahman/tnote
[4]:http://en.wikipedia.org/wiki/SQLite
[5]:http://notational.net/
[6]:https://vhp.github.io/terminal_velocity/
[7]:https://github.com/dmpop/pygmynote
[8]:https://en.wikipedia.org/wiki/Tag_(metadata)
[9]:http://jrnl.sh/
[10]:https://owncloud.com/
[11]:https://nextcloud.com/
