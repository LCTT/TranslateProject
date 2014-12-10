How to use Evernote from the command line on Linux
================================================================================
This week let's continue our journey into the depth of the Linux command line to manage and organize information. After managing [your personal expenses][1] from the command line, I propose you to manage your notes from the command line, in particular, when your notes are stored in Evernote. In case you have never heard about it, [Evernote][2] specializes in a user-friendly online service for note-taking with cloud synchronization across multiple devices. Besides offering fancy web-based APIs, Evernote has released Evernote clients for Windows, Mac, [Android][3] and iOS. However, there is, up to today, no official Linux client available. Hopefully, among the plethora of unofficial Linux programs, one emerges and attracts all the command line warriors that we are: [Geeknote][4]

### Installation of Geeknote ###

Geeknote is developed in Python. So before trying anything, make sure that you have Python (version 2.7 preferably) and git installed.

#### Debian, Ubuntu and Linux Mint ####

    $ sudo apt-get install python2.7 git python-setuptools
    $ git clone git://github.com/VitaliyRodnenko/geeknote.git
    $ cd geeknote
    $ sudo python2.7 setup.py install 

#### Fedora or CentOS/RHEL ####

    $ sudo yum install git
    $ git clone git://github.com/VitaliyRodnenko/geeknote.git
    $ cd geeknote
    $ sudo python setup.py install 

#### Arch Linux ####

For Arch Linux users, just use the package from the [AUR][5].

### Basic Usage of Geeknote ###

Once you installed Geeknote, you should link Geeknote with your Evernote account with:

    $ geeknote login 

Then enter your email address, your password, and your two-factor authentication code. If you do not have the latter, just ignore it and press ENTER. 

![](https://farm8.staticflickr.com/7525/15761947888_7bc71bf216_o.jpg)

Obviously you need an Evernote account to do all of this, so go register first.

Once you are all set and ready, you can start playing around, creating new notes and editing them.

But first, you should set your favorite text editor with:

    $ geeknote settings --editor vim 

Then, the general syntax to create a new note is:

    $ geeknote create --title [title of the new note] (--content [content] --tags [comma-separated tags] --notebook [comma-separated notebooks]) 

In the above, only the title field is required, which corresponds to the title of the new note. The other flags serve to add additional metadata for the note: add some tag(s) as relevant keywords for your note, and specify in which notebook(s) to place the note. Also, if your title or content contain spaces, don't forget to place them in quotation marks.

For example:

    $ geeknote create --title "My note" --content "This is a test note" --tags "finance, business, important" --notebook "Family" 

Naturally, the next step is to edit your notes. The syntax is very similar:

    $ geeknote edit --note [title of the note to edit] (--title [new title] --tags [new tags] --notebook [new notebooks]) 

Note that the optional parameters such as title, tags, and notebook, serve to modify the metadata of the note. For example, you can rename a note with:

    $ geeknote edit --note [old title] --title [new title] 

Now that the basis of creating and editing is done, the more advanced features are search and deletion. You can search through your notes with the syntax:

    $ geeknote find --search [text-to-search] --tags [comma-separated tags] --notebook [comma-separated notebooks] --date [date-or-date-range] --content-search 

By default, the above command will search notes by their titles. With "--content-search" option, it will search notes by their content.

For example:

    $ geeknote find --search "*restaurant" --notebooks "Family" --date 31.03.2014-31.08.2014 

Show all the notes with a specific title by running:

    $ geeknote show [title] 

![](https://farm8.staticflickr.com/7538/15327089024_32867cded6_o.jpg)

My favorite trick though is probably to use:

    $ geeknote show "*" 

which will display all your notes and allow you to chose one in particular.

And remove a note with:

    $ geeknote remove --note [title] 

Be careful as this is a real removal. It will delete the note from your cloud storage.

Finally, there are a lot of options to manage tags and notebooks. I think that the most useful one is probably to display the list of notebooks.

    $ geeknote notebook-list 

![](https://farm8.staticflickr.com/7472/15762063420_43e3ee17da_o.jpg)

From there, everything is pretty similar. As you can guess, listing all your tags is via:

    $ geeknote tag-list 

Creating a notebook is done via:

    $ geeknote notebook-create --title [notebook title] 

While creating a tag is:

    $ geeknote tag-create --title [tag title] 

Once you get the hang of it, the syntax is really coherent and clear, which is very appreciable.

If you still want more, don't forget to go checkout the [official documentation][6].

### Bonus ###

As a bonus, Geeknote comes with the utility gnsync, which allows for file synchronization between your Evernote account and your local computer. However, I find its syntax a bit dry:

    $ gnsync --path [where to sync] (--mask [what kind of file to sync] --format [in which format] --logpath [where to write the log] --notebook [which notebook to use]) 

What all of this means is the following.


- **--path /home/adrien/Documents/notes/**: location of note files to synchronize with Evernote.
- **--mask "*.txt"**: synchronize only plain text files. By default, gnsync will try to sync every file.
- **--format markdown**: whether you want them as plain or markdown format (the default is plain).
- **--logpath /home/adrien/gnsync.log**: where to write the log for synchronization. In case it goes wrong, gnsync will write logging information there.
- **--notebook "Family"**: in which notebook to synchronize note files. Note that if you leave it empty, a new notebook named after your synced folder will be created. 

To conclude, Geeknote is a fancy little command-line client for Evernote. I personally don't use Evernote that much, but it remains pretty nice and useful. The command line aspect makes it both geeky and easy to combine with a shell script of some sort. Also, there exists a fork program of Geeknote on Git, named [geeknote-improved-git][7] in Archlinux AUR, which pretends to have a few more features and a more active development than the other branch. From what I could see, it is really worth taking a look at.

What do you think of Geeknote? Is it something you would consider using? Or would you rather stick to the traditional applications? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/evernote-command-line-linux.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/manage-personal-expenses-command-line.html
[2]:https://evernote.com/
[3]:http://xmodulo.com/go/android_tutorial
[4]:http://www.geeknote.me/
[5]:https://aur.archlinux.org/packages/geeknote-git/
[6]:http://www.geeknote.me/documentation/
[7]:https://aur.archlinux.org/packages/geeknote-improved-git/