[#]: subject: "Manage your files in your Linux terminal with ranger"
[#]: via: "https://opensource.com/article/22/7/manage-files-linux-terminal-ranger"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage your files in your Linux terminal with ranger
======
Try this lightweight open source tool to preview files without leaving the terminal.

![Filing cabinet for organization][1]

The most basic way to look at your files and folders is to use the commands `ls` and `ll`. But sometimes, I want to see not just the file metadata but also the contents of a file at a glance. For that, I use ranger.

If you love working out of your console and using [Vim][2] or Vi, and you don’t want to leave your terminal for any reason, ranger is your new best friend. Ranger is a minimal file manager that allows you not only to navigate through the files but also to preview them. Ranger comes bundled with rifle, a file executor that can efficiently choose programs that work with a given file type.

### Installing ranger on Linux

Ranger can be installed in Fedora or any RPM-based distro by running

```
$ sudo dnf install ranger
```

Ranger is also available for [other distros and macOS][3].

### Using ranger for the first time

As a user, you can start ranger by simply typing `$ ranger` on your favorite terminal. The arrow keys give way to the navigation. This screenshot is an excellent example of how I can preview the code of the `config.example` file stored in `Kernel-tests`.

![Screenshot of terminal showing config.example highlighted and a preview of the file in the terminal to the right][4]

Picking any file and hitting F4 opens up your default editor and lets you edit the files right away!

### What about images and videos?

Using [rifle][5] with ranger lets you quickly find the program associated with a given file. Hovering over an image and then trying to open it is very simple; just hit Enter. Here’s how that looks:

![Screenshot of a PNG file preview over a terminal window][6]

Hitting i on an image file will give the user all the EXIF data. Hitting **S****hift+Enter** will open the PDF file.

![A screenshot showing a preview of a PDF file (tickets to a museum) floating over the terminal window][7]

The same key combo will open and start playing videos in the system's default video player that supports the codec. The example below is an mp4 video, which plays just fine on [VLC][8].

![Screenshot of a Bugcrowd University Cross Site Scripting video in VLC media player, previewed over the terminal][9]

### File ops

The following key bindings work well unless otherwise configured by the Vim user.

j: Move down
k: Move up
h: Move to parent directory
gg: Go to the top of the list
i: Preview file
r: Open file
zh: View hidden files
cw: Rename current file
yy: Yank (copy) file
dd: Cut file
pp: Paste file
u: Undo
z: Change settings
dD: Delete file

### Console commands

Sometimes I have a folder that contains screenshots of a particular software when I am drafting articles. Selecting or marking files by hitting Space and then typing `:bulkrename` helps me move all the weird timestamps to, for example, lorax1, lorax2 , and so on. An example is below:

![Screenshot of terminal showing timestamped files that can be renamed with the bulkrename command][10]

Other useful console commands include:

`:openwith` : Open a select file with a program of your choice
`:touch FILENAME` : Create a file
`:mkdir FILENAME` : Create a directory
`:shell <command>` : Run a command in shell
`:delete` : Delete files

### Will it work in tty2/3/4?

As someone who works in quality assurance (QA), I've found that searching for logs and reading them has never been easier. Even when my Gnome Display Manager crashes, I can switch over to my tty2, log in with my username and password, and start ranger with superuser permission, and then I am all sorted to explore!

Ranger is a great tool for working with files without ever having to leave the terminal. Ranger is minimal and customizable, so give it go!

Image by: (Sumantro Mukherjee, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/manage-files-linux-terminal-ranger

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/files_documents_organize_letter.png
[2]: https://opensource.com/tags/vim
[3]: https://opensource.com/article/20/3/ranger-file-navigator
[4]: https://opensource.com/sites/default/files/2022-06/ranger%201.png
[5]: https://www.systutorials.com/docs/linux/man/1-rifle/
[6]: https://opensource.com/sites/default/files/2022-06/ranger%202.png
[7]: https://opensource.com/sites/default/files/2022-06/ranger%203.png
[8]: https://opensource.com/article/21/2/linux-media-players
[9]: https://opensource.com/sites/default/files/2022-06/ranger%204.png
[10]: https://opensource.com/sites/default/files/2022-06/ranger%205.png
