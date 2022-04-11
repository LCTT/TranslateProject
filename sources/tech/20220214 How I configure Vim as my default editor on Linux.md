[#]: subject: "How I configure Vim as my default editor on Linux"
[#]: via: "https://opensource.com/article/22/2/configure-vim-default-editor"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I configure Vim as my default editor on Linux
======
Vim is my favorite editor. These changes to my system make Vim available
as the default in programs that use a different editor by default.
![Person using a laptop][1]

I have used Linux for about 25 years and Unix for a few years before that. During that time, I have developed preferences for some tools that I use daily. One of the most important tools I use is the Vim editor.

I started using Vi when I learned Solaris in the early ‘90s because I was told that it would always be available on any system, which is true in my experience. I have tried other editors, and they all do the job. However, I find that Vim works best for me, and I use it so much that my Vim muscle memory causes me to attempt to use its command keystrokes even with other editors.

Plus, I just really like Vim.

Many configuration files use Vi instead of Vim, and you can run the `vi` command. However, the `vi` command is a link to `vim`.

Many Linux tools use editors that emulate or just call [Nano][2], [Emacs][3], or Vim. Some other tools allow users—like those with clear preferences—to link to their favorite editor. The two examples that affected me the most were Bash command-line editing, which defaults to Emacs, and the Alpine text-mode email client, which defaults to the Pico editor. In fact, the Pico editor was written explicitly for use in the Pine email client, which is the predecessor to Alpine.

Not all programs that use external editors are configurable. Some use only the editor specified by the developer. For those applications that are configurable, there are different methods for selecting your preferred editor.

### Linux command-line editing

Besides actually editing text files, the other tool I use that requires the most editing is the Bash shell. The default Bash editor is Emacs. Although I have used Emacs, I definitely prefer Vim. So many years ago, I switched the default editing style for Bash command-line editing from Emacs to Vim, which is much more comfortable for me.

There are a couple of ways to configure Bash. You can use a local configuration file, such as `/home/yourhomedirectory/.bashrc`, which only changes the default for your user account and not for other users on the same system. I prefer to make these types of changes global, which basically means my personal account and root. In this second case, you can create your own configuration file and place it in the `/etc/profile.d` directory.

I added a file named `myBashConfig.sh` to `/etc/profile.d`. There are files for all the installed shells in the `/etc/profile.d` directory. During the launch of a terminal session, each shell reads only the files intended for it based on the file name extensions. For example, the Bash shell only reads the files with a `.sh` extension.


```


&lt;SNIP&gt;
alias vim='vim -c "colorscheme desert" '
# Set vi for bash editing mode
set -o vi
# Set vi as the default editor for all apps that check this
EDITOR=vi
&lt;SNIP&gt;

```

The line **set -o vi** in this global Bash configuration file segment sets Vi as the default editor. The **-o** option on this **set** command defines vi as the editor. You need to close any running Bash sessions and open new ones for this to take effect.

At this point, you can now use all of your familiar Vim editing commands, including cursor movement. Just press the **Escape** key to enter Vim editing mode. I especially like the ability to use **b** multiple times to move the cursor back multiple words.

### Set Vim as the default for other programs

Some Linux command-line tools and programs check the **$EDITOR** environment variable to determine which editor to use. You can check the current value of this variable for yourself using the following command. I did this on one of my newly installed virtual machines to verify what the default actually is.


```


# echo $EDITOR
/usr/bin/nano
#

```

By default, Fedora programs that check the **$EDITOR** environment variable will use the Nano editor. Adding the line **EDITOR=vi** as shown in the snippet above to `myBashConfig.sh` changes the default to the Vi (Vim) editor. Not all command-line programs that use an external editor check this environment variable.

### Edit email in Alpine

A few weeks ago, I decided that Pico was just not working well for me as my email editor. I could make it work and did for some time after switching to [Alpine][4] from Thunderbird. I found that Pico was getting in my way when I tried to use Vim key sequences, impacting my productivity.

I read in the Alpine Help that it is possible to change the default editor. I decided to change it to Vim. This is actually very easy to do.

On the Alpine main menu, press the **S** key to enter setup and then **C** for configuration. In the _Composer Preferences_ section, select the _Enable Alternate Editor Command_ and _Enable Alternate Editor Implicitly_ items with an **X**. Several pages down in the _Advanced User Preferences_ section, find the **Editor** line. It should look like this if it has not already been changed.


```
`Editor    = <No Value Set>`
```

Highlight this **Editor** line with the cursor bar, and press **Enter** to edit the line. Change **&lt;No Value Set&gt;** to **vim**, press **Enter**, and then press the **E** key to exit and **Y** to save the changes you have made.

To edit an email message using Vim, just enter the email body, and Vim starts automatically, just like Pico does. All of my favorite editing capabilities are there because it is actually using Vim. Even the **Esc :wq** sequence to exit Vim is the same.

### Final thoughts

I much prefer Vim to other editors, and these changes to my system make it available as the default in programs that use a different editor by default. Some programs use the **$EDITOR** environment variable, so you only need to make that change once. Other programs like Alpine have user configuration options that you must set individually for each program.

This ability to select your preferred external editor is quite in line with the Unix Philosophy tenet, “Each program should do one thing and do it well.” Why write another editor when there are several perfectly good ones out there? And it also meets the Linux Philosophy tenet, “Use your favorite editor.”

Of course, you can change your default text-mode editor to Nano, Pico, EMACS, or any other one that you prefer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/configure-vim-default-editor

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/12/gnu-nano
[3]: https://opensource.com/tags/emacs
[4]: https://opensource.com/article/21/5/alpine-linux-email
