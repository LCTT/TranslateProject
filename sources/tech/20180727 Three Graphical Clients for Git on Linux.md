[tarepanda1024 翻译中]
Three Graphical Clients for Git on Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/git-tools.jpg?itok=Be56iPT0)

Those that develop on Linux are likely familiar with [Git][1]. With good reason. Git is one of the most widely used and recognized version control systems on the planet. And for most, Git use tends to lean heavily on the terminal. After all, much of your development probably occurs at the command line, so why not interact with Git in the same manner?

In some instances, however, having a GUI tool to work with can make your workflow slightly more efficient (at least for those that tend to depend upon a GUI). To that end, what options do you have for Git GUI tools? Fortunately, we found some that are worthy of your time and (in some cases) money. I want to highlight three such Git clients that run on the Linux operating system. Out of these three, you should be able to find one that meets all of your needs.
I am going to assume you understand how Git and repositories like GitHub function, [which I covered previously][2], so I won’t be taking the time for any how-tos with these tools. Instead, this will be an introduction, so you (the developer) know these tools are available for your development tasks.

A word of warning: Not all of these tools are free, and some are released under proprietary licenses. However, they all work quite well on the Linux platform and make interacting with GitHub a breeze.

With that said, let’s look at some outstanding Git GUIs.

### SmartGit

[SmartGit][3] is a proprietary tool that’s free for non-commercial usage. If you plan on employing SmartGit in a commercial environment, the license cost is $99 USD per year for one license or $5.99 per month. There are other upgrades (such as Distributed Reviews and SmartSynchronize), which are both $15 USD per licence. You can download either the source or a .deb package for installation. I tested SmartGit on Ubuntu 18.04 and it worked without issue.

But why would you want to use SmartGit? There are plenty of reasons. First and foremost, SmartGit makes it incredibly easy to integrate with the likes of GitHub and Subversion servers. Instead of spending your valuable time attempting to configure the GUI to work with your remote accounts, SmartGit takes the pain out of that task. The SmartGit GUI (Figure 1) is also very well designed to be uncluttered and intuitive.


![SmartGit][5]

Figure 1: The SmartGit UI helps to simplify your workflow.

[Used with permission][6]

After installing SmartGit, I had it connected with my personal GitHub account in seconds. The default toolbar makes working with a repository, incredibly simple. Push, pull, check out, merge, add branches, cherry pick, revert, rebase, reset — all of Git’s most popular features are there to use. Outside of supporting most of the standard Git and GitHub functions/features, SmartGit is very stable. At least when using the tool on the Ubuntu desktop, you feel like you’re working with an application that was specifically designed and built for Linux.

SmartGit is probably one of the best tools that makes working with even advanced Git features easy enough for any level of user. To learn more about SmartGit, take a look at the [extensive documentation][7].

### GitKraken

[GitKraken][8] is another proprietary GUI tool that makes working with both Git and GitHub an experience you won’t regret. Where SmartGit has a very simplified UI, GitKraken has a beautifully designed interface that offers a bit more feature-wise at the ready. There is a free version of GitKraken available (and you can test the full-blown paid version with a 15 day trial period). After the the trial period ends, you can continue using the free version, but for non-commercial use only.

For those who want to get the most out of their development workflow, GitKraken might be the tool to choose. This particular take on the Git GUI features the likes of visual interactions, resizable commit graphs, drag and drop, seamless integration (with GitHub, GitLab, and BitBucket), easy in-app tasks, in-app merge tools, fuzzy finder, gitflow support, 1-click undo & redo, keyboard shortcuts, file history & blame, submodules, light & dark themes, git hooks support, git LFS, and much more. But the one feature that many users will appreciate the most is the incredibly well-designed interface (Figure 2).


![GitKraken][10]

Figure 2: The GitKraken interface is tops.

[Used with permission][6]

Outside of the amazing interface, one of the things that sets GitKraken above the rest of the competition is how easy it makes working with multiple remote repositories and multiple profiles. The one caveat to using GitKraken (besides it being proprietary) is the cost. If you’re looking at using GitKraken for commercial use, the license costs are:

  * $49 per user per year for individual

  * $39 per user per year for 10+ users

  * $29 per user per year for 100+ users




The Pro accounts allow you to use both the Git Client and the Glo Boards (which is the GitKraken project management tool) commercially. The Glo Boards are an especially interesting feature as they allow you to sync your Glo Board to GitHub Issues. Glo Boards are sharable and include search & filters, issue tracking, markdown support, file attachments, @mentions, card checklists, and more. All of this can be accessed from within the GitKraken GUI.
GitKraken is available for Linux as either an installable .deb file, or source.

### Git Cola

[Git Cola][11] is our free, open source entry in the list. Unlike both GitKraken and Smart Git, Git Cola is a pretty bare bones, no-nonsense Git client. Git Cola is written in Python with a GTK interface, so no matter what distribution and desktop combination you use, it should integrate seamlessly. And because it’s open source, you should find it in your distribution's package manager. So installation is nothing more than a matter of opening your distribution’s app store, searching for “Git Cola” and installing. You can also install from the command line like so:
```
sudo apt install git-cola

```

Or:
```
sudo dnf install git-cola

```

The Git Cola interface is pretty simple (Figure 3). In fact, you won’t find much in the way of too many bells and whistles, as Git Cola is all about the basics.


![Git Cola][13]

Figure 3: The Git Cola interface is a much simpler affair.

[Used with permission][6]

Because of Git Cola’s return to basics, there will be times when you must interface with the terminal. However, for many Linux users this won’t be a deal breaker (as most are developing within the terminal anyway). Git Cola does include features like:

  * Multiple subcommands

  * Custom window settings

  * Configurable and environment variables

  * Language settings

  * Supports custom GUI settings

  * Keyboard shortcuts




Although Git Cola does support connecting to remote repositories, the integration to the likes of Github isn’t nearly as intuitive as it is on either GitKraken or SmartGit. But if you’re doing most of your work locally, Git Cola is an outstanding tool that won’t get in between you and Git.

Git Cola also comes with an advanced (Directed Acyclic Graph) DAG visualizer, called Git Dag. This tool allows you to get a visual representation of your branches. You start Git Dag either separately from Git Cola or within Git Cola from the View > DAG menu entry. Git DAG is a very powerful tool, which helps to make Git Cola one of the top open source Git GUIs on the market.

### There’s more where that came from

There are plenty more Git GUI tools available. However, from these three tools you can do some serious work. Whether you’re looking for a tool with all the bells and whistles (regardless of license) or if you’re a strict GPL user, one of these should fit the bill.

Learn more about Linux through the free ["Introduction to Linux" ][14]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/7/three-graphical-clients-git-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://git-scm.com/
[2]:https://www.linux.com/learn/intro-to-linux/2018/7/introduction-using-git
[3]:https://www.syntevo.com/smartgit/
[4]:/files/images/gitgui1jpg
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gitgui_1.jpg?itok=LEZ_PYIf (SmartGit)
[6]:/licenses/category/used-permission
[7]:http://www.syntevo.com/doc/display/SG/Manual
[8]:https://www.gitkraken.com/
[9]:/files/images/gitgui2jpg
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gitgui_2.jpg?itok=Y8crSLhf (GitKraken)
[11]:https://git-cola.github.io/
[12]:/files/images/gitgui3jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gitgui_3.jpg?itok=bS9OYPQo (Git Cola)
[14]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
