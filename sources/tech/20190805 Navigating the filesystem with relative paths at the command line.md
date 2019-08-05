[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Navigating the filesystem with relative paths at the command line)
[#]: via: (https://opensource.com/article/19/8/navigating-filesystem-relative-paths)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/greg-p)

Navigating the filesystem with relative paths at the command line
======
Learn the difference between absolute and relative paths and how to use
them, and save yourself a lot of time and potential trouble.
![Blue folders flying in the clouds above a city skyline][1]

If you’re on your way to work, but you stop by a deli for breakfast first, you don’t go back home after breakfast so you can restart your journey. Instead, you continue from where you are because you understand where your office is located relative to your current location. Navigating your computer is the same way. If you change your working directory in a terminal to a subdirectory, such as **Pictures**, you don’t necessarily have to go home again just to make your way into **Documents**. Instead, you use a _relative_ path.

Conversely, absolute paths always begin from the start of your hard drive. You know that you’ve reached the start by a lone forward slash (**/**) with nothing to its left, because your drive’s root level is the biggest container, holding all your folders and files within it. For that reason, the path **/home/seth** (and its shorthand version **~**, although that’s less clear, because it lacks the leftmost slash) is considered an absolute path. It represents your hard drive’s base level, which contains the **home** directory, which in turn contains **seth** (my username).

Anything starting with a forward slash is an absolute path, which is the digital equivalent of you going 12 blocks back home just to reach a location that’s two blocks away from where you are now. That fact doesn’t mean absolute paths are bad, though. There are many valid reasons to use absolute paths, not the least of which is their clarity. If you can navigate your drive from absolute paths, then use that as a wayfinder. With auto-completion, typing a full path can be as quick as using a relative path, [especially with autocompletion][2].

That said, relative paths can be convenient, and in some cases vital. For instance, you can never be sure of a web server’s absolute path. If a web designer knows they keep [web fonts in a local directory][3] and they link to those fonts on their development laptop using the absolute path **/home/webdev/Public/[www.example.com/fonts][4]**, then all of their links break when the code is pushed to **/var/www/example.com/fonts** on the server.

Besides that, sometimes it really is quicker and easier to type **cd ../Documents** instead of **cd /home/seth/Documents**.

Relative paths use two control sequences: the single (**.**) and the double (**..**) dot. A single dot means _don’t move_. The double dot means _take one step back_. These dots work best when you’re somewhat familiar with what’s on your drive, and provided that you can visualize the corresponding paths.

It may help to visualize each directory as a room in a house. For instance, knowing that you have a home directory that contains both a **Pictures** and a **Documents** folder, you can visualize each subdirectory as a step forward from home:

![Stepping into a directory.][5]

To get from one room to the other, you must go back to the common area using the _step back_ control sequence, and then step forward into the other. You can get your current location at any time with the **pwd** (print working directory) command:


```
$ pwd
/home/seth/Pictures
$ cd ../Documents
$ pwd
/home/seth/Documents
```

Remember that a single dot means _don’t move_, and it does exactly that:


```
$ pwd
/home/seth
$ cd .
$ pwd
/home/seth
```

It might seem odd to have a special command representing a state of no change, but it’s a usefully explicit directive. For instance, were you to create a custom application to [list a directory’s contents][6] and save it in your home directory, foolishly naming the application **reboot**, then any time you used that custom application you would want to be careful that your computer knew _exactly_ which **reboot** command to execute.

One way you can specify which version is to provide an explicit path to your custom and poorly named application. The single dot reinforces your desire not to stray from your intended path when you’re already in the directory:


```
$ pwd
/home/seth
$ ./reboot
Documents/     Downloads/
Music/         Pictures/
Public/        Spheniscidae/
Videos/        Yugolothae/
```

Sometimes the single dot can be useful as a filler character in paths that you expect to contain a number of levels. For instance, take a web developer who used several links to a **font** directory that was once three steps back. Recently, though, this developer moved the **font** directory into the same directory as their HTML. If the developer doesn’t replace all instances of **../../../fonts** with **./././fonts**, their site will break.

**Note:** In the case of this example, changing **../../../fonts** to **./fonts** would work, but assume for the sake of this example that doing so would break a script that expects to see three levels before the **fonts** directory.

Relative paths can be confusing at first, so stick to absolute paths when navigating your computer until you’re comfortable with the concept of relativity. Many people find them useful, while others do not use them. It’s all relative.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/navigating-filesystem-relative-paths

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO (Blue folders flying in the clouds above a city skyline)
[2]: https://opensource.com/article/19/7/understanding-file-paths-and-how-use-them#autocomplete
[3]: https://opensource.com/article/19/3/webfonts
[4]: http://www.example.com/fonts
[5]: https://opensource.com/sites/default/files/uploads/path-layout.jpg (Stepping into a directory.)
[6]: https://opensource.com/article/19/7/master-ls-command
