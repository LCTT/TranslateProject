'Getting to Done' on the Linux command line
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)
There is a lot of talk about getting things done at the command line. How many articles are there about using obscure flags with `ls`, nifty regular expressions with Sed and Awk, and how to parse out lots of text with Perl? That isn't what this is about.

This is about [Getting _to_ Done][1], making sure that the stuff we have to do actually gets tracked and done using tools that don't require a graphical desktop, a web browser, or an internet connection. To do this, we'll look at four ways of tracking your to-do list: plaintext files, Todo.txt, TaskWarrior, and Org-mode.

### Plain (and simple) text


![plaintext][3]

I like to use Vim, but you can use Nano too.

The most straightforward way to manage your to-do list is using a plaintext file in your editor of choice. Just open an empty file and add tasks, one per line. When you are done, delete the line. Simple, effective, and it doesn't matter what you use to do it. There are a couple of drawbacks to this method, though. Once you delete a line and save the file, it is gone forever. That can be a problem if you have to report on what you have done this week or last week. And while using a simple file is flexible, it can also get cluttered really easily.

### Todo.txt: Plaintext leveled up


![todo.txt screen][5]

Neat, organized, and easy to use

That leads us to the [Todo.txt][6] file format and application. Installation is simple—[download][7] the latest release from GitHub and run `sudo make install` from the unpacked archive.


![Installing todo.txt][9]

It works from a Git clone as well.

Todo.txt makes it very easy to add tasks, list tasks, and mark them as done:

| `todo.sh add "Some Task"`   | add "Some Task" to my todo list         |
| `todo.sh ls`                | list all my tasks                       |
| `todo.sh ls due:2018-02-15` | list all tasks due on February 15, 2018 |
| `todo.sh do 3`              | mark task number 3 as "done"            |

The actual list is still in plaintext, and you can edit it with your favorite text editor as long as you follow the [correct format][10].

There is also a very robust help built into the application.


![Syntax highlighting in todo.txt][12]

You can even get syntax highlighting.

There is also a large selection of add-ons, as well as specifications for writing your own. There are even browser extensions, mobile apps, and desktop apps that support the Todo.txt format.


![GNOME extensions in todo.txt][14]

Even GNOME extensions.

The biggest drawback to Todo.txt is the lack of an automatic or built-in synchronization mechanism. Most (if not all) of the browser extensions and mobile apps require Dropbox to perform synchronization between the app and the copy on your desktop. If you would like something with sync built-in, we have...

### Taskwarrior: Now we're cooking with Python

[Taskwarrior][15] is a Python application with many of the same features as Todo.txt. However, it stores the data in a database and has built-in synchronization capabilities. It also keeps track of what is next, notes how old tasks are, and will warn you if you have something more important to do than what you just did.

[Installation][16] of Taskwarrior can be done either with your distribution's package manager, through Python's `pip` utility, or built from source. Using it is also pretty straightforward, with commands similar to Todo.txt:

| `task add "Some Task"`   | Add "Some Task" to the list        |
| `task list`              | List all tasks                     |
| `task list due ``:today` | List all tasks due on today's date |
| `task do 3`              | Complete task number 3             |

Taskwarrior also has some pretty nice text user interfaces.

![Taskwarrior in Vit][18]

I like Vit, which was inspired by Vim.

Unlike Todo.txt, Taskwarrior can synchronize with a local or remote server. A very basic synchronization server called `taskd` is available if you wish to run your own, and there are several services available if you do not.

Taskwarrior also has a thriving and extensive ecosystem of add-ons and extensions, as well as mobile and desktop apps.

![Taskwarrior on GNOME][20]

Taskwarrior looks really nice on GNOME.

The only disadvantage to Taskwarrior is that, unlike the other programs listed here, you cannot directly modify the to-do list itself. You can export the task list to various formats, modify the export, and then re-import the files, but it is a lot clunkier than just opening the file directly in a text editor.

Which brings us to the most powerful of them all...

### Emacs Org-mode: Hulk smash tasks

![Org-mode][22]

Emacs has everything.

Emacs [Org-mode][23] is by far the most powerful, most flexible open source to-do list manager out there. It supports multiple files, uses plaintext, is almost infinitely customizable, and understands calendars, due dates, and schedules. It is also significantly more complicated to set up than the other applications listed here. But once it is set up, it does everything the other applications do and more. If you are familiar with or a fan of [Bullet Journals][24], Org-mode is possibly the closest you can get on a computer.

Org-mode will run anywhere Emacs runs, and there are a few mobile applications that can interact with it as well. Unfortunately, there are no desktop apps or browser extensions that support Org. Despite all that, Org-mode is still one of the best applications for tracking your to-do list, since it is so very powerful.

### Choose your tool

In the end, the goal of all these programs is to help you track what you need to do and make sure you don't forget to do something. While they all have the same basic functions, choosing which one is right for you depends on a lot of factors. Do you want synchronization built-in or not? Do you need a mobile app? Do any of the add-ons include a "must have" feature? Whatever your choice, remember that the program alone cannot make you more organized, but it can help.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/getting-to-done-agile-linux-command-line

作者：[Kevin Sonney][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://www.scruminc.com/getting-done/
[3]:https://opensource.com/sites/default/files/u128651/plain-text.png (plaintext)
[5]:https://opensource.com/sites/default/files/u128651/todo-txt.png (todo.txt screen)
[6]:http://todotxt.org/
[7]:https://github.com/todotxt/todo.txt-cli/releases
[9]:https://opensource.com/sites/default/files/u128651/todo-txt-install.png (Installing todo.txt)
[10]:https://github.com/todotxt/todo.txt
[12]:https://opensource.com/sites/default/files/u128651/todo-txt-vim.png (Syntax highlighting in todo.txt)
[14]:https://opensource.com/sites/default/files/u128651/tod-txt-gnome.png (GNOME extensions in todo.txt)
[15]:https://taskwarrior.org/
[16]:https://taskwarrior.org/download/
[18]:https://opensource.com/sites/default/files/u128651/taskwarrior-vit.png (Taskwarrior in Vit)
[20]:https://opensource.com/sites/default/files/u128651/taskwarrior-gnome.png (Taskwarrior on GNOME)
[22]:https://opensource.com/sites/default/files/u128651/emacs-org-mode.png (Org-mode)
[23]:https://orgmode.org/
[24]:http://bulletjournal.com/
