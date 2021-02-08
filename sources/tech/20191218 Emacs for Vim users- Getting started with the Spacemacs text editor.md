[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Emacs for Vim users: Getting started with the Spacemacs text editor)
[#]: via: (https://opensource.com/article/19/12/spacemacs)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Emacs for Vim users: Getting started with the Spacemacs text editor
======
Spacemacs offers all the power of Emacs combined with the keystroke
commands and functionality you are used to in Vim.
![Hands programming][1]

I use [Vim][2] a lot. I'm a site reliability engineer (SRE), and Vim is the one thing I know I can access on every machine in our fleet. I also like [Emacs][3], with its wide variety of useful packages, ease of extending, and its many built-in tools. Because they each have their own set of commands, I have to actively switch codes in my head (usually after typing **:wq** in Emacs or trying to **C+X** in Vim). The [Evil][4] package for Emacs helps quite a bit by making Emacs behave more like Vim, but there is some effort required to set it up the first time.

### Enter Spacemacs

![Spacemacs splash screen][5]

[Spacemacs][6] is a set of configurations for Emacs that combines an easy setup, Evil, and a system to manage and set up additional Emacs packages with pre-built configurations to make them easier to use out of the box.

### Installation and setup

As I mentioned above, Spacemacs is easy to install. No, really: it takes just one command:


```
`git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d`
```

Then just start Emacs. It will prompt you through the basic configuration options and generate a **.spacemacs** configuration file. The defaults are as safe as can be: Vim keybindings, Spacemacs' recommended packages, and the Helm search engine. When the configuration completes, you will see a help screen with some basic information and commands.

![Spacemacs help screen][7]

Now Spacemacs is set up and ready to go and will behave like Vim. You can start right away by entering **:e &lt;/path/to/file&gt;** to open and edit a file and using good old **:wq** to save (among other commands). As a bonus, if you are a seasoned Emacs user, many of the commands you are used to are still there.

### Using Spacemacs

On the main splash screen, you'll notice a lot of information. There are buttons to update Spacemacs and the packages, access different forms of documentation, and open recently edited files.

Whenever you're not in insert mode, you can press the **Space Bar** to bring up a menu of other available options. The default options include access to the Helm search engine and the basic functions for opening and editing files. As you add packages, they will also show up in the menu. In most special screens (i.e., those that are not a document you are editing), the **q** key will exit the screen.

### Configuring Spacemacs

Before getting into Spacemacs' configuration, you need to understand **layers**. Layers are self-contained configuration files that load on top of one another. A layer is comprised of the instructions to download and install the package and any dependencies, as well as the basic configuration and key mappings for the package.

Spacemacs has quite a few [layers available][8], and more are being added all the time. You can find the complete list in the **~/.emacs.d/layers** directory tree. They are organized by type; to use one, just add it in the main **.spacemacs** configuration file to the **dotspacemacs-configuration-layers** list.

I generally enable the Git, Version-Control, Markdown, and Colors (theme support) layers. If you are familiar with configuring Emacs, you can also add custom configurations in [Lisp][9] to the **dotspacemacs/user-config** section.

You can also enable a Nyan Cat progress bar by adding the following line in your layers list:


```
`(colors :variables colors-enable-nyan-cat-progress-bar t)`
```

 

![Nyan Cat progress bar in Spacemacs][10]

### Using Org mode in Spacemacs

One of my other favorite layers is [Org mode][11], probably one of the most popular notes, to-do, and project management applications in the open source world.

To install Org, just open up the **.spacemacs** file and uncomment the line for **org** under **dotspacemacs-configuration-layers**.

![Installing Org mode in Spacemacs][12]

Exit and restart Emacs, and it will download the Org packages and set them up. Type **Space Bar+a**, and you see a new menu item for Org with the hotkey **o**, and the common Org functions—agenda, to-do list, etc.—are under that menu. They are  blank until you configure the default Org files. The easiest way to do that is with the built-in Emacs configuration tool, which you can access by typing **Space Bar+?** and searching for **Customize**. When the Customize screen opens, search for **org-agenda-files**. Add a file or two to the list (I used **~/todo.org** and **~/notes.org**), click Apply and Save, then exit Customize.

![Emacs Customize tool in Spacemacs][13]

Next, create a file so that Org can read them into the agenda and to-do list. Even if the file is blank, that's OK—it just has to exist. Since I added two files—todo.org and notes.org—to my configuration, I can type **:e todo.org** and **:e notes.org** to open both, and then **:w** to save the blank files.

Next, enter the Org agenda with **Space Bar+a+o+a** or the Org to-do list with **Space Bar+a+o+t**. If you have added actionable items or scheduled events to the notes or to-do files, you will see them now. You can find out more about Org's structure and syntax in _[Get started with Org mode without Emacs][14]_ or on the [Org mode][11] website.

![Spacemacs todo.org and the Org todo agenda][15]

Spacemacs offers all the power of Emacs combined with the keystroke commands and functionality you are used to with Vim. Give it a try, and please let me know what you think in the comments.

This is a short list of my favorite graphical text editors for Linux that can be classified as IDE...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/spacemacs

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/emacs
[4]: https://www.emacswiki.org/emacs/Evil
[5]: https://opensource.com/sites/default/files/uploads/spacemacs_spash.png (Spacemacs splash screen)
[6]: https://www.spacemacs.org/
[7]: https://opensource.com/sites/default/files/uploads/spacemacs_help.png (Spacemacs help screen)
[8]: https://www.spacemacs.org/layers/LAYERS.html
[9]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
[10]: https://opensource.com/sites/default/files/uploads/nyan-cat-progress.png (Nyan Cat progress bar in Spacemacs)
[11]: https://orgmode.org
[12]: https://opensource.com/sites/default/files/uploads/spacemacs_org_change.png (Installing Org mode in Spacemacs)
[13]: https://opensource.com/sites/default/files/uploads/emacs_customize.png (Emacs Customize tool in Spacemacs)
[14]: https://opensource.com/article/19/1/productivity-tool-org-mode
[15]: https://opensource.com/sites/default/files/uploads/spacemacs_org.png (Spacemacs todo.org and the Org todo agenda)
