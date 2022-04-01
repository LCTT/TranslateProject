[#]: subject: "Archive files on your Linux desktop with Ark for KDE"
[#]: via: "https://opensource.com/article/22/2/archives-files-linux-ark-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Archive files on your Linux desktop with Ark for KDE
======
Create, examine, and expand compressed archives on KDE.
![Hand putting a Linux file folder into a drawer][1]

When I finish with a project, I often like to take all the files I've created for the project and put them into an archive. It not only [saves space][2], but it gets those files out of my way, and prevents them from turning up as results when I use [find][3] and [grep][4] to search through files I consider current. Once files are in an archive, they're treated as a single object by your filesystem, which means that you can't browse them the way you can a normal folder. You could unarchive them, or you could open a terminal and run the appropriate archive command, such as [tar][5], to list the contents of the archive. Or you can use an application like Ark to list, preview, modify, and manage your archives.

### Install Ark on Linux

If you're running the KDE Plasma Desktop, you already have Ark installed, but if not then it's available from your package manager. On Fedora, Mageia, and similar:


```
`$ sudo dnf install ark`
```

On Debian, Elementary, and similar:


```
`$ sudo apt install ark`
```

You can [install it as a Flatpak][6] from [Flathub][7], too.

### Create an archive

The best way to get comfortable with archives is to create one for yourself, and then explore it. All of this can be done with just Ark.

First, launch Ark from your application menu, and then go to the **Archive** menu and select **New**.

![Creating a new archive with Ark][8]

(Seth Kenlon, [CC BY-SA 4.0][9])

Give your archive a filename, accept the default compression settings, and save it to your home directory.

Ark won't create an empty archive, but after you've set a name and location, Ark is poised to create an archive as soon as you add a file to it.

To add a file to your soon-to-be archive, just drag and drop a file into the Ark window.

![Items in an archive][10]

(Seth Kenlon, [CC BY-SA 4.0][9])

There are two benefits to archiving: consolidation and compression. By adding files to the archive, you've consolidated files into one place. They exist in the archive now, so you can throw the original copies in the trash if it's part of your goal to get files out of the way.

To see how much disk space you've saved by compressing your files, go to the **Archive** menu and select **Properties**. This shows you the size of the unpacked archive as well as the size of the packed archive, and a lot of other useful metadata.

![Archive properties and metadata][11]

(Seth Kenlon, [CC BY-SA 4.0][9])

There's a lot more that Ark can do, but for now close Ark as if you were finished. Your achive now exists in the location where you saved it (in this example, it's **example.tar.gz** in my home folder.)

### Viewing files in an archive

Any archive can be opened in Ark, just as if it were a normal folder. To open an archive in Ark, just click on it in your file manager, or right-click on it and select **Open with Ark**.

Once the archive is open in Ark, you can perform most actions you could do from a file manager, including removing files, adding new files, previewing the contents of a file, and more.

### Removing a file from an archive

Sometimes you put a file into an archive you don't need. When you want to remove a file from an archive, right-click on the file and select **Delete**.

![Right-click menu][12]

(Seth Kenlon, [CC BY-SA 4.0][9])

### Adding files to an archive

Adding a file to an archive is even easier. You can just drag and drop a file from your file manager into Ark. Alternately, you can select **Add Files** from the right-click menu in Ark.

### Extracting just one file from an archive

When faced with an archive, many people just unarchive the entire thing and then fish for the one or two files they actually need. For small archives, that's fine, but for big archives that takes time and disk space, even if only temporarily.

With Ark, you can extract only the files you need by dragging them from the Ark window to the destination you want to save them to. Alternately, select **Extract** from the right-click menu.

### Previewing files in an archive

You don't always need to extract a file. If you just need to refer to a file quickly, Ark may be able to show you a preview of the file without extracting it to your drive.

To preview a file, double-click on it in Ark.

![Previewing a file in Ark][13]

(Seth Kenlon, [CC BY-SA 4.0][9])

### Archive it

Managing archives on a Linux desktop is easy and intuitive. Ark is a great archive tool, and many other Linux desktops have similar tools, so even if you're not using Ark you might find something similar to it equally as useful. For me, archiving has been an important part of keeping my files organized, and conserving disk space. As for Ark, it makes interacting with those archives convenient.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/archives-files-linux-ark-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/21/11/linux-commands-convert-files
[3]: https://opensource.com/article/21/9/linux-find-command
[4]: https://opensource.com/article/21/3/grep-cheat-sheet
[5]: https://opensource.com/article/17/7/how-unzip-targz-file
[6]: https://opensource.com/article/21/11/install-flatpak-linux
[7]: https://flathub.org/apps/details/org.kde.ark
[8]: https://opensource.com/sites/default/files/ark-new.jpg (Creating a new archive in Ark)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/ark-items.jpg (Items in an archive)
[11]: https://opensource.com/sites/default/files/ark-properties.jpg (Archive properties and metadata)
[12]: https://opensource.com/sites/default/files/ark-menu-click-right.jpg (Right-click menu)
[13]: https://opensource.com/sites/default/files/ark-preview.jpg (Previewing a file in Ark)
