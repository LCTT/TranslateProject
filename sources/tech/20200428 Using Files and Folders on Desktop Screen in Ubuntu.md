[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Files and Folders on Desktop Screen in Ubuntu)
[#]: via: (https://itsfoss.com/add-files-on-desktop-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Using Files and Folders on Desktop Screen in Ubuntu
======

_**This beginner tutorial discusses a few difficulties you may face while adding files and folders on the desktop screen on Ubuntu.**_

I know a few people who are habitual of putting all the important/frequently used files on the desktop screen for quick access.

![][1]

I am not a fan of a cluttered desktop screen but I can imagine that it might actually be helpful to some people.

For the past few releases, it has been difficult to add files on the desktop screen in Ubuntu’s default GNOME desktop. It’s not really Ubuntu’s fault.

The [GNOME][2] developers thinks that there is no place for icons and files on the desktop screen. There is no need of putting files on the desktop when you can easily search for it in the menu. And that’s part true.

This is why the newer version of [GNOME’s File Manager Nautilus][3] doesn’t support icons and files on the desktop very well.

That said, it’s not impossible to add files and folders on the desktop. Let me show you how you can still use it.

### Adding files and folders on the desktop screen in Ubuntu

![][4]

I am using Ubuntu 20.04 in this tutorial. The steps may or may not vary for other Ubuntu versions.

#### Add the files and folders to the “Desktop folder”

If you open the file manager, you should see an entry called Desktop in the left sidebar or in the folders list. This folder represents your desktop screen (in a way).

![Desktop folder can be used to add files to the desktop screen][5]

Anything you add to this folder will be reflected on the desktop screen.

![Anything added to the Desktop folder will be reflected on the desktop screen][6]

If you delete files from this ‘Desktop folder’, it will be removed from the desktop screen as well.

#### Drag and drop files to desktop screen doesn’t work

Now, if you try to drag and drop files from the file manager on the desktop, it won’t work. It’s not a bug, it’s a feature that irks a lot of people.

A workaround would be to open two instances of the file manager. Open Desktop folder in one of them and then drag and drop files to this folder and they will be added on the desktop.

I know that’s not ideal but you don’t have a lot of choices here.

#### You cannot use Ctrl+C and Ctrl+V to copy-paste on the desktop, use the right click menu

To add salt to injury, you cannot use Ctrl+V the famous keyboard shortcut to paste files on the desktop screen.

But you can still use the right click context menu and select Paste from there to put the copied files on the desktop. You can even create new folders this way.

![Right click menu can be used for copy-pasting files to desktop][7]

Does it make sense? Not to me but that’s how it is in Ubuntu 20.04.

#### You cannot delete files and folder using the Delete key, use the right click menu again

What’s worse is that you cannot use the delete key or shift delete key to remove files from the desktop screen. But you can still right click on the files or folders and select “Move to trash” to delete the file.

![Delete files from desktop using right click][8]

Alright, so now you know that at least there is a way to add files on the desktop with some restrictions. But it doesn’t end here unfortunately.

You cannot search for files with their names on the desktop screen. Normally, if you start typing ‘abc’, files starting with ‘abc’ are highlighted. You don’t get it here.

I don’t know why so many restrictions have been put on adding files on the desktop. Thankfully, I don’t use it a lot otherwise I have been way too frustrated.

If interested, you may read about [adding application shortcut on the desktop in Ubuntu][9] as well.

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-files-on-desktop-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/files-on-desktop-ubuntu.jpg?ssl=1
[2]: https://www.gnome.org/
[3]: https://wiki.gnome.org/Apps/Files
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/adding-files-desktop-ubuntu.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/desktop-folder-ubuntu.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/adding-files-desktop-screen-ubuntu.jpg?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/adding-new-files-ubuntu-desktop.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/delete-files-from-desktop-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/ubuntu-desktop-shortcut/
