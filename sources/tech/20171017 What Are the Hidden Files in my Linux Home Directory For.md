What Are the Hidden Files in my Linux Home Directory For?
======

![](https://www.maketecheasier.com/assets/uploads/2017/06/hidden-files-linux-hero.png)

In your Linux system you probably store a lot of files and folders in your Home directory. But beneath those files, do you know that your Home directory also comes with a lot of hidden files and folders? If you run `ls -a` on your home directory, you'll discover a pile of hidden files and directories with dot prefixes. What do these hidden files do anyway?

### What are hidden files in the home directory for?

![hidden-files-liunux-2][1]

Most commonly, hidden files and directories in the home directory contain settings or data that's accessed by that user's programs. They're not intended to be edited by the user, only the application. That's why they're hidden from the user's normal view.

In general files from your own home directory can be removed and changed without damaging the operating system. The applications that rely on those hidden files, however, might not be as flexible. When you remove a hidden file from the home directory, you'll typically lose the settings for the application associated with it.

The program that relied on that hidden file will typically recreate it. However, you'll be starting from the "out-of-the-box" settings, like a brand new user. If you're having trouble with an application, that can actually be a huge help. It lets you remove customizations that might be causing trouble. But if you're not, it just means you'll need to set everything back the way you like it.


### What are some specific uses of hidden files in the home directory?
![hidden-files-linux-3][2]

Everyone will have different hidden files in their home directory. There are some that everyone has. However, the files serve a similar purpose, regardless of the parent application.

### System Settings

System settings include the configuration for your desktop environment and your shell.

  *  **Configuration files** for your shell and command line utilities: Depending on the specific shell and command-like utilities you use, the specific file name will change. You 'll see files like ".bashrc," ".vimrc" and ".zshrc." These files contain any settings you've changed about your shell's operating environment or tweaks you've made to the settings of command-line utilities like `vim`. Removing these files will return the associated application to its default state. Considering many Linux users build up an array of subtle tweaks and settings over the years, removing this file could be a huge headache.
  *  **User profiles:** Like the configuration files above, these files (typically ".profile" or ".bash_profile") save user settings for the shell. This file often contains your PATH. It also contains [aliases][3] you've set. Users can also put aliases in `.bashrc` or other locations. The PATH governs where the shell looks for executable commands. By appending or modifying your PATH, you can change where your shell looks for commands. Aliases change the names of commands. One alias might set `ll` to call `ls -l`, for example. This provides text-based shortcuts to often-used commands. If you delete `.profile`, you can often find the default version in the "/etc/skel" directory.
  *  **Desktop environment settings:** This saves any customization of your desktop environment. That includes the desktop background, screensavers, shortcut keys, menu bar and taskbar icons, and anything else that the user has set about their desktop environment. When you remove this file, the user's environment reverts to the new user environment at the next login.



### Application configuration files

You'll find these in the ".config" folder in Ubuntu. These are settings for your specific applications. They'll include things like the preference lists and settings.

  *  **Configuration files for applications** : This includes settings from the application preferences menu, workspace configurations and more. Exactly what you'll find here depends on the parent application.
  *  **Web browser data:** This may include things like bookmarks and browsing history. The majority of files make up the cache. This is where the web browser stores temporarily download files, like images. Removing this might slow down some media-heavy websites the first time you visit them.
  *  **Caches** : If a user application caches data that's only relevant to that user (like the [Spotify app storing cache of your playlist][4]), the home directory is a natural place to store it. These caches might contain masses of data or just a few lines of code: it depends on what the parent application needs. If you remove these files, the application recreates them as necessary.
  *  **Logs:** Some user applications might store logs here as well. Depending on how developers set up the application, you might find log files stored in your home directory. This isn't a common choice, however.


### Conclusion
In most cases the hidden files in your Linux home directory as used to store user settings. This includes settings for command-line utilities as well as GUI-based applications. Removing them will remove user settings. Typically, it won't cause a program to break.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/hidden-files-linux-home-directory/

作者：[Alexander Fox][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/alexfox/
[1]:https://www.maketecheasier.com/assets/uploads/2017/06/hidden-files-liunux-2.png (hidden-files-liunux-2)
[2]:https://www.maketecheasier.com/assets/uploads/2017/06/hidden-files-linux-3.png (hidden-files-linux-3)
[3]:https://www.maketecheasier.com/making-the-linux-command-line-a-little-friendlier/#aliases
[4]:https://www.maketecheasier.com/clear-spotify-cache/
