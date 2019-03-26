[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Move your dotfiles to version control)
[#]: via: (https://opensource.com/article/19/3/move-your-dotfiles-version-control)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Move your dotfiles to version control
======
Back up or sync your custom configurations across your systems by sharing dotfiles on GitLab or GitHub.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ)

There is something truly exciting about customizing your operating system through the collection of hidden files we call dotfiles. In [What a Shell Dotfile Can Do For You][1], H. "Waldo" Grunenwald goes into excellent detail about the why and how of setting up your dotfiles. Let's dig into the why and how of sharing them.

### What's a dotfile?

"Dotfiles" is a common term for all the configuration files we have floating around our machines. These files usually start with a **.** at the beginning of the filename, like **.gitconfig** , and operating systems often hide them by default. For example, when I use **ls -a** on MacOS, it shows all the lovely dotfiles that would otherwise not be in the output.

```
dotfiles on master
➜ ls
README.md  Rakefile   bin       misc    profiles   zsh-custom

dotfiles on master
➜ ls -a
.               .gitignore      .oh-my-zsh      README.md       zsh-custom
..              .gitmodules     .tmux           Rakefile
.gemrc          .global_ignore .vimrc           bin
.git            .gvimrc         .zlogin         misc
.gitconfig      .maid           .zshrc          profiles
```

If I take a look at one, **.gitconfig** , which I use for Git configuration, I see a ton of customization. I have account information, terminal color preferences, and tons of aliases that make my command-line interface feel like mine. Here's a snippet from the **[alias]** block:

```
87   # Show the diff between the latest commit and the current state
88   d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"
89
90   # `git di $number` shows the diff between the state `$number` revisions ago and the current state
91   di = !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"
92
93   # Pull in remote changes for the current repository and all its submodules
94   p = !"git pull; git submodule foreach git pull origin master"
95
96   # Checkout a pull request from origin (of a github repository)
97   pr = !"pr() { git fetch origin pull/$1/head:pr-$1; git checkout pr-$1; }; pr"
```

Since my **.gitconfig** has over 200 lines of customization, I have no interest in rewriting it on every new computer or system I use, and either does anyone else. This is one reason sharing dotfiles has become more and more popular, especially with the rise of the social coding site GitHub. The canonical article advocating for sharing dotfiles is Zach Holman's [Dotfiles Are Meant to Be Forked][2] from 2008. The premise is true to this day: I want to share them, with myself, with those new to dotfiles, and with those who have taught me so much by sharing their customizations.

### Sharing dotfiles

Many of us have multiple systems or know hard drives are fickle enough that we want to back up our carefully curated customizations. How do we keep these wonderful files in sync across environments?

My favorite answer is distributed version control, preferably a service that will handle the heavy lifting for me. I regularly use GitHub and continue to enjoy GitLab as I get more experienced with it. Either one is a perfect place to share your information. To set yourself up:

  1. Sign into your preferred Git-based service.
  2. Create a repository called "dotfiles." (Make it public! Sharing is caring.)
  3. Clone it to your local environment.*
  4. Copy your dotfiles into the folder.
  5. Symbolically link (symlink) them back to their target folder (most often **$HOME** ).
  6. Push them to the remote repository.



* You may need to set up your Git configuration commands to clone the repository. Both GitHub and GitLab will prompt you with the commands to run.

![](https://opensource.com/sites/default/files/uploads/gitlab-new-project.png)

Step 4 above is the crux of this effort and can be a bit tricky. Whether you use a script or do it by hand, the workflow is to symlink from your dotfiles folder to the dotfiles destination so that any updates to your dotfiles are easily pushed to the remote repository. To do this for my **.gitconfig** file, I would enter:

```
$ cd dotfiles/
$ ln -nfs .gitconfig $HOME/.gitconfig
```

The flags added to the symlinking command offer a few additional benefits:

  * **-s** creates a symbolic link instead of a hard link
  * **-f** continues with other symlinking when an error occurs (not needed here, but useful in loops)
  * **-n** avoids symlinking a symlink (same as **-h** for other versions of **ln** )



You can review the IEEE and Open Group [specification of **ln**][3] and the version on [MacOS 10.14.3][4] if you want to dig deeper into the available parameters. I had to look up these flags since I pulled them from someone else's dotfiles.

You can also make updating simpler with a little additional code, like the [Rakefile][5] I forked from [Brad Parbs][6]. Alternatively, you can keep it incredibly simple, as Jeff Geerling does [in his dotfiles][7]. He symlinks files using [this Ansible playbook][8]. Keeping everything in sync at this point is easy: you can cron job or occasionally **git push** from your dotfiles folder.

### Quick aside: What not to share

Before we move on, it is worth noting what you should not add to a shared dotfile repository—even if it starts with a dot. Anything that is a security risk, like files in your **.ssh/** folder, is not a good choice to share using this method. Be sure to double-check your configuration files before publishing them online and triple-check that no API tokens are in your files.

### Where should I start?

If Git is new to you, my [article about the terminology][9] and [a cheat sheet][10] of my most frequently used commands should help you get going.

There are other incredible resources to help you get started with dotfiles. Years ago, I came across [dotfiles.github.io][11] and continue to go back to it for a broader look at what people are doing. There is a lot of tribal knowledge hidden in other people's dotfiles. Take the time to scroll through some and don't be shy about adding them to your own.

I hope this will get you started on the joy of having consistent dotfiles across your computers.

What's your favorite dotfile trick? Add a comment or tweet me [@mbbroberg][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/move-your-dotfiles-version-control

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/9/shell-dotfile
[2]: https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/
[3]: http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ln.html
[4]: https://www.unix.com/man-page/FreeBSD/1/ln/
[5]: https://github.com/mbbroberg/dotfiles/blob/master/Rakefile
[6]: https://github.com/bradp/dotfiles
[7]: https://github.com/geerlingguy/dotfiles
[8]: https://github.com/geerlingguy/mac-dev-playbook
[9]: https://opensource.com/article/19/2/git-terminology
[10]: https://opensource.com/downloads/cheat-sheet-git
[11]: http://dotfiles.github.io/
[12]: https://twitter.com/mbbroberg?lang=en
