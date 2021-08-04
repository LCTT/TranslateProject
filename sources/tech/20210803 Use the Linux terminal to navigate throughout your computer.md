[#]: subject: (Use the Linux terminal to navigate throughout your computer)
[#]: via: (https://opensource.com/article/21/8/navigate-linux-directories)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use the Linux terminal to navigate throughout your computer
======
Learn to navigate from directory to directory in the Linux terminal.
![Move around your computer][1]

To navigate through the directories of your computer in a graphical interface, you're probably used to opening a window to get "into" your computer, and then double-clicking on a folder, and then on a subfolder, and so on. You may also use arrow buttons or keys to back track.

To navigate through your computer in the terminal, you use the **cd** command. You can use **cd ..** to move one directory _back_, or **cd ./path/to/another/folder** to jump through many folders into a specific location.

The concept of a URL, which you use on the Internet already, is actually pulled directly from [POSIX][2]. When you navigate to a specific page on some website, like `http://www.example.com/tutorials/lesson2.html`, you are actually changing directory to `/var/www/imaginarysite/tutorials/` and opening a file called `lesson2.html`. Of course, you open it in a web browser, which interprets all that weird-looking HTML code into pretty text and pictures. But the idea is exactly the same.

If you think of your computer as the Internet (or the Internet as a computer, more appropriately), then you can understand how to wander through your folders and files. If you start out in your user folder (your home, or `~` for short) then everywhere you want to go is relative to that:


```
$ cd ~/Documents
$ pwd
/home/tux/Documents

$ cd ..
$ pwd
/home/tux
```

This requires some practise, but after a while it becomes far faster than opening and closing windows, clicking on back buttons and folder icons.

### Auto-completion with Tab

The **Tab** key on your keyboard auto-completes names of directories and files you're starting to type. If you're going to **cd** into `~/Documents`, then all you need to type is `cd ~/Doc` and then press **Tab**. Your shell auto-completes `uments`. This isn't just a pleasant convenience, it's also a way to prevent error. If you're pressing **Tab** and nothing's being auto-completed, then probably the file or directory you _think_ is in a location isn't actually there. Even experienced Linux users try to change directory to a place that doesn't exist in their current location, so use **pwd** and **ls** often to confirm you are where you think you are, and that your current directory actually contains the files you think it contains.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/navigate-linux-directories

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s04.svg_.png?itok=bC8Bcapk (Move around your computer)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
