[#]: subject: "Hide Files and Folders in Linux Without Renaming Them"
[#]: via: "https://itsfoss.com/hide-files-folders-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hide Files and Folders in Linux Without Renaming Them
======
Brief: This beginner-focused article discusses how you can hide files and folders from normal view in Linux. Both GUI and command-line methods have been discussed.

There will be times when you need to hide files in Linux.

No, I am not talking about those ‘special files’ that you don’t want your family to see. Although you can hide these special files, it is better to lock them with a password for an extra layer of protection.

Back to hiding files. **Any file or folder whose name begins with a . (dot) is “hidden” in Linux.**

Linux has plenty of such files and folders that are hidden from the normal view. These are mainly config files that are needed by the system and programs.

The users don’t need them normally and hence they are hidden from the normal view so that you don’t get overwhelmed by so many strange-looking files that you never created.

Here’s a look at the hidden files and folders in my home directory.

![linux normal view][1]

![linux show hiiden files][2]

You can easily [view the hidden files][3] by pressing Ctrl+H in the file manager if you are using desktop Linux. In the terminal, you can use the ls -a command to display the hidden files along with the normal ones.

So, how do you create hidden files in Linux? You simply name them with a dot. Here’s how.

### Create hidden files and folders in Linux desktop (GUI method)

If you are using the file manager, right click on the file or folder and choose the rename option. Now all you have to do is to add a . at the beginning of the filename.

GNOME’s Nautilus file manager also shows a warning when you are creating a hidden file in this manner.

![hide files ubuntu linux][4]

You can hide a folder along with all its contents in the same way.

You can press Ctrl+H keys to display the hidden files. Oh! how much I love [keyboard shortcuts in Ubuntu][5] or any other program or OS I use.

To make the hidden files normal again, just rename them again by removing the dot from the beginning of the file name.

### Create hidden files and folders in Linux terminal (CLI method)

If you are stuck with the terminal, you can [use the mv command][6] to rename the file. You just have to rename the file by adding a . at the beginning of the original filename.

```
mv filename .filename
```

You can display the hidden files using this command:

```
ls -la
```

You may also use ls -lA. This one won’t show the dot files (. and ..).

### Bonus tip: Hide files and folders without renaming them (works in GUI only)

You just learned to hide files in Linux. The problem is that you have to rename the files and that’s not ideal in all situations.

For example, in Ubuntu, you’ll see a folder named ‘snap’ in your directory. You are not going to use it but if you rename it, your snap apps won’t work as expected. Similarly, there’s a firefox.tmp folder under the Downloads directory in Ubuntu 22.04 (for the snap version of Firefox).

There is a neat trick that can be used in the Linux desktop. It should work under various file managers like Nemo, Thunar, Dolphin etc but I cannot vouch for it. It sure works in the Nautilus file manager of GNOME.

So, what you do here is to create a new file named .hidden in the directory where your desired files or folders (to be hidden) are located.

![alternate way of hiding files in linux][7]

Press Ctrl+H to show the hidden files and **open .hidden file** for editing. **Add the name of the files or folders in separate lines**. Keep in mind that it doesn’t take absolute or relative path. Your desired **files and folders should be in the same location as this special .hidden file**.

Here’s a sample which I used to hide the cpufetch directory and pcloud file without renaming them:

```
pcloud
cpufetch
```

Press Ctrl+H again to hide the .hidden files again.

Now, **close your file explorer and start it again**. You won’t see the files and directories mentioned in the .hidden file anymore.

If you want to see them again, press Ctrl+H keys.

When you don’t want the files hidden anymore, remove their name from the .hidden file or remove .hidden file altogether.

### Bonus Trivia: The hidden files ‘feature’ was actually a bug

Do you know that this ‘feature’ to hide a file by adding a . at the beginning of the file name was [actually a bug][8]?

In the early UNIX days, when the filesystem was created, the . (current directory) and .. (parent directory) files were added for ease of navigation.

As these special . and .. files had no real data in them, a new ‘feature’ was added to the ls command.

The feature was to check the first character of a filename and if it’s a dot (.), it was no longer displayed with the ls command.

That worked for the . and .. files but it introduced a ‘bug’ where any filename starting with . was hidden from the output of the ls command.

This bug turned into a feature as programmers like it for ‘hiding’ their config files. The ls command was probably modified later to add options to display hidden dot files.

The same convention gets followed in Linux as Linux was modeled after UNIX.

### Conclusion

I have discussed creating files that are hidden from the normal view. If you want to create secret files or folders that cannot be accessed by other people, you should encrypt them. I have written about [locking folders with passwords in Linux][9]. It’s a bit old article but it may still work.

I hope you liked this simple topic and learned something new. Use the comment section and let me know your thoughts.

--------------------------------------------------------------------------------

via: https://itsfoss.com/hide-files-folders-linux/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/06/linux-normal-view.png
[2]: https://itsfoss.com/wp-content/uploads/2022/06/linux-show-hiiden-files.png
[3]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[4]: https://itsfoss.com/wp-content/uploads/2022/06/hide-files-ubuntu-linux.png
[5]: https://itsfoss.com/ubuntu-shortcuts/
[6]: https://linuxhandbook.com/mv-command/
[7]: https://itsfoss.com/wp-content/uploads/2022/06/alternate-way-of-hiding-files-in-linux.png
[8]: https://linux-audit.com/linux-history-how-dot-files-became-hidden-files/
[9]: https://itsfoss.com/password-protect-folder-linux/
