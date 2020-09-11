[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding file paths and how to use them in Linux)
[#]: via: (https://opensource.com/article/19/8/understanding-file-paths-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/jrbarnett)

Understanding file paths and how to use them in Linux
======
If you're used to drag-and-drop environments, then file paths may be
frustrating. Learn here how they work, and some basic tricks to make
using them easier.
![open source button on keyboard][1]

A file path is the human-readable representation of a file or folder’s location on a computer system. You’ve seen file paths, although you may not realize it, on the internet: An internet URL, despite ancient battles fought by proprietary companies like AOL and CompuServe, is actually just a path to a (sometimes dynamically created) file on someone else’s computer. For instance, when you navigate to example.com/index.html, you are actually viewing the HTML file index.html, probably located in the **var** directory on the example.com server. Files on your computer have file paths, too, and this article explains how to understand them, and why they’re important.

When computers became a household item, they took on increasingly stronger analogies to real-world models. For instance, instead of accounts and directories, personal computers were said to have _desktops_ and _folders_, and eventually, people developed the latent impression that the computer was a window into a virtual version of the real world. It’s a useful analogy, because everyone is familiar with the concept of desktops and file cabinets, while fewer people understand digital storage and memory addresses.

Imagine for a moment that you invented computers or operating systems. You would probably have created a way to group common files together, because humans love to classify and organize things. Since all files on a computer are on the hard drive, the biggest container you probably would have designated is the drive itself; that is, all files on a drive are in the drive.

As it turns out, the creators of UNIX had the same instinct, only they called these units of organization _directories_ or _folders_. All files on your computer’s drive are in the system’s base (root) directory. Even external drives are brought into this root directory, just as you might place important related items into one container if you were organizing your office space or hobby room.

Files and folders on Linux are given names containing the usual components like the letters, numbers, and other characters on a keyboard. But when a file is inside a folder, or a folder is inside another folder, the **/** character shows the relationship between them. That’s why you often see files listed in the format **/usr/bin/python3** or **/etc/os-release**. The forward slashes indicate that one item is stored inside of the item preceding it.

Every file and folder on a [POSIX][2] system can be expressed as a path. If I have the file **penguin.jpg** in the **photos** folder within my home directory, and my username is **seth**, then the file path can be expressed as **/home/seth/Pictures/penguin.jpg**.

Most users interact primarily with their home directory, so the tilde (**~**) character is used as a shorthand. That fact means that I can express my example penguin picture as either **/home/seth/Pictures/penguin.jpg** or as **~/Pictures/penguin.jpg**.

### Practice makes perfect

Computers use file paths whether you’re thinking of what that path is or not. There’s not necessarily a reason for you to have to think of files in terms of a path. However, file paths are part of a useful framework for understanding how computers work, and learning to think of files in a path can be useful if you’re looking to become a developer (you need to understand the paths to support libraries), a web designer (file paths ensure you’re pointing your HTML to the appropriate CSS), a system administrator, or just a power user.

#### When in doubt, drag and drop

If you’re not used to thinking of the structure of your hard drive as a path, then it can be difficult to construct a full path for an arbitrary file. On Linux, most file managers either natively display (or have the option to) the full file path to where you are, which helps reinforce the concept on a daily basis:

![Dolphin file manager][3]

opensource.com

If you’re using a terminal, it might help to know that modern terminals, unlike the teletype machines they emulate, can accept files by way of drag-and-drop. When you copying a file to a server over SSH, for instance, and you’re not certain of how to express the file path, try dragging the file from your GUI file manager into your terminal. The GUI object representing the file gets translated into a text file path in the terminal:

![Terminals accept drag and drop actions][4]

opensource.com

Don’t waste time typing in guesses. Just drag and drop.

#### **Tab** is your friend

On a system famous for eschewing three-letter commands when two or even one-letter commands will do, rest assured that no seasoned POSIX user _ever_ types out everything. In the Bash shell, the **Tab** key means _autocomplete_, and autocomplete never lies. For instance, to type the example **penguin.jpg** file’s location, you can start with:


```
$ ~/Pi
```

and then press the **Tab** key. As long as there is only one item starting with Pi, the folder **Pictures** autocompletes for you.

If there are two or more items starting with the letters you attempt to autocomplete, then Bash displays what those items are. You manually type more until you reach a unique string that the shell can safely autocomplete. The best thing about this process isn’t necessarily that it saves you from typing (though that’s definitely a selling point), but that autocomplete is never wrong. No matter how much you fight the computer to autocomplete something that isn’t there, in the end, you’ll find that autocomplete understands paths better than anyone.

Assume that you, in a fit of late-night reorganization, move **penguin.jpg** from your **~/Pictures** folder to your **~/Spheniscidae** directory. You fall asleep and wake up refreshed, but with no memory that you’ve reorganized, so you try to copy **~/Pictures/penguin.jpg** to your web server, in the terminal, using autocomplete.

No matter how much you pound on the **Tab** key, Bash refuses to autocomplete. The file you want simply does not exist in the location where you think it exists. That feature can be helpful when you’re trying to point your web page to a font or CSS file _you were sure_ you’d uploaded, or when you’re pointing a compiler to a library you’re _100% positive_ you already compiled.

#### This isn’t your grandma’s autocompletion

If you like Bash’s autocompletion, you’ll come to scoff at it once you try the autocomplete in [Zsh][5]. The Z shell, along with the [Oh My Zsh][6] site, provides a dynamic experience filled with plugins for specific programming languages and environments, visual themes packed with useful feedback, and a vibrant community of passionate shell users:

![A modest Zsh configuration.][7]

If you’re a visual thinker and find the display of most terminals stagnant and numbing, Zsh may well change the way you interact with your computer.

### Practice more

File paths are important on any system. You might be a visual thinker who prefers to think of files as literal documents inside of literal folders, but the computer sees files and folders as named tags in a pool of data. The way it identifies one collection of data from another is by following its designated path. If you understand these paths, you can also come to visualize them, and you can speak the same language as your OS, making file operations much, much faster.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/understanding-file-paths-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/jrbarnett
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx (open source button on keyboard)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/sites/default/files/images/dolphin-file-path.jpg
[4]: https://opensource.com/sites/default/files/images/terminal-drag-drop.jpg
[5]: https://opensource.com/article/18/9/tips-productivity-zsh
[6]: https://ohmyz.sh/
[7]: https://opensource.com/sites/default/files/uploads/zsh-simple.jpg (A modest Zsh configuration.)
