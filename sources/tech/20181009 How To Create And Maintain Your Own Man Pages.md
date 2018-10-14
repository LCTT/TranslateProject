Translating by way-ww
How To Create And Maintain Your Own Man Pages
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Um-pages-1-720x340.png)

We already have discussed about a few [**good alternatives to Man pages**][1]. Those alternatives are mainly used for learning concise Linux command examples without having to go through the comprehensive man pages. If you’re looking for a quick and dirty way to easily and quickly learn a Linux command, those alternatives are worth trying. Now, you might be thinking – how can I create my own man-like help pages for a Linux command? This is where **“Um”** comes in handy. Um is a command line utility, used to easily create and maintain your own Man pages that contains only what you’ve learned about a command so far.

By creating your own alternative to man pages, you can avoid lots of unnecessary, comprehensive details in a man page and include only what is necessary to keep in mind. If you ever wanted to created your own set of man-like pages, Um will definitely help. In this brief tutorial, we will see how to install “Um” command line utility and how to create our own man pages.

### Installing Um

Um is available for Linux and Mac OS. At present, it can only be installed using **Linuxbrew** package manager in Linux systems. Refer the following link if you haven’t installed Linuxbrew yet.

Once Linuxbrew installed, run the following command to install Um utility.

```
$ brew install sinclairtarget/wst/um

```

If you will see an output something like below, congratulations! Um has been installed and ready to use.

```
[...]
==> Installing sinclairtarget/wst/um
==> Downloading https://github.com/sinclairtarget/um/archive/4.0.0.tar.gz
==> Downloading from https://codeload.github.com/sinclairtarget/um/tar.gz/4.0.0
-=#=# # #
==> Downloading https://rubygems.org/gems/kramdown-1.17.0.gem
######################################################################## 100.0%
==> gem install /home/sk/.cache/Homebrew/downloads/d0a5d978120a791d9c5965fc103866815189a4e3939
==> Caveats
Bash completion has been installed to:
/home/linuxbrew/.linuxbrew/etc/bash_completion.d
==> Summary
🍺 /home/linuxbrew/.linuxbrew/Cellar/um/4.0.0: 714 files, 1.3MB, built in 35 seconds
==> Caveats
==> openssl
A CA file has been bootstrapped using certificates from the SystemRoots
keychain. To add additional certificates (e.g. the certificates added in
the System keychain), place .pem files in
/home/linuxbrew/.linuxbrew/etc/openssl/certs

and run
/home/linuxbrew/.linuxbrew/opt/openssl/bin/c_rehash
==> ruby
Emacs Lisp files have been installed to:
/home/linuxbrew/.linuxbrew/share/emacs/site-lisp/ruby
==> um
Bash completion has been installed to:
/home/linuxbrew/.linuxbrew/etc/bash_completion.d

```

Before going to use to make your man pages, you need to enable bash completion for Um.

To do so, open your **~/.bash_profile** file:

```
$ nano ~/.bash_profile

```

And, add the following lines in it:

```
if [ -f $(brew --prefix)/etc/bash_completion.d/um-completion.sh ]; then
 . $(brew --prefix)/etc/bash_completion.d/um-completion.sh
fi

```

Save and close the file. Run the following commands to update the changes.

```
$ source ~/.bash_profile

```

All done. let us go ahead and create our first man page.

### Create And Maintain Your Own Man Pages

Let us say, you want to create your own man page for “dpkg” command. To do so, run:

```
$ um edit dpkg

```

The above command will open a markdown template in your default editor:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Create-dpkg-man-page.png)

My default editor is Vi, so the above commands open it in the Vi editor. Now, start adding everything you want to remember about “dpkg” command in this template.

Here is a sample:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Edit-dpkg-man-page.png)

As you see in the above output, I have added Synopsis, description and two options for dpkg command. You can add as many as sections you want in the man pages. Make sure you have given proper and easily-understandable titles for each section. Once done, save and quit the file (If you use Vi editor, Press **ESC** key and type **:wq** ).

Finally, view your newly created man page using command:

```
$ um dpkg

```

![](http://www.ostechnix.com/wp-content/uploads/2018/10/View-dpkg-man-page.png)

As you can see, the the dpkg man page looks exactly like the official man pages. If you want to edit and/or add more details in a man page, again run the same command and add the details.

```
$ um edit dpkg

```

To view the list of newly created man pages using Um, run:

```
$ um list

```

All man pages will be saved under a directory named**`.um`**in your home directory

Just in case, if you don’t want a particular page, simply delete it as shown below.

```
$ um rm dpkg

```

To view the help section and all available general options, run:

```
$ um --help
usage: um <page name>
 um <sub-command> [ARGS...]

The first form is equivalent to `um read <page name>`.

Subcommands:
 um (l)ist List the available pages for the current topic.
 um (r)ead <page name> Read the given page under the current topic.
 um (e)dit <page name> Create or edit the given page under the current topic.
 um rm <page name> Remove the given page.
 um (t)opic [topic] Get or set the current topic.
 um topics List all topics.
 um (c)onfig [config key] Display configuration environment.
 um (h)elp [sub-command] Display this help message, or the help message for a sub-command.

```

### Configure Um

To view the current configuration, run:

```
$ um config
Options prefixed by '*' are set in /home/sk/.um/umconfig.
editor = vi
pager = less
pages_directory = /home/sk/.um/pages
default_topic = shell
pages_ext = .md

```

In this file, you can edit and change the values for **pager** , **editor** , **default_topic** , **pages_directory** , and **pages_ext** options as you wish. Say for example, if you want to save the newly created Um pages in your **[Dropbox][2]** folder, simply change the value of **pages_directory** directive and point it to the Dropbox folder in **~/.um/umconfig** file.

```
pages_directory = /Users/myusername/Dropbox/um

```

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-create-and-maintain-your-own-man-pages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
[2]: https://www.ostechnix.com/install-dropbox-in-ubuntu-18-04-lts-desktop/
