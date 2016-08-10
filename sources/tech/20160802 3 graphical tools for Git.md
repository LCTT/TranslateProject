zpl1025
3 graphical tools for Git
=============================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/government/BUSINESS_meritladder.png?itok=4CAH2wV0)

In this article, we'll take a look at some convenience add-ons to help you integrate Git comfortably into your everyday workflow.

I learned Git before many of these fancy interfaces existed, and my workflow is frequently text-based anyway, so most of the inbuilt conveniences of Git suit me pretty well. It is always best, in my opinion, to understand how Git works natively. However, it is always nice to have options, so these are some of the ways you can start using Git outside of the terminal.

### Git in KDE Dolphin

I am a KDE user, if not always within the Plasma desktop, then as my application layer in Fluxbox. Dolphin is an excellent file manager with lots of options and plenty of secret little features. Particularly useful are all the plugins people develop for it, one of which is a nearly-complete Git interface. Yes, you can manage your Git repositories natively from the comfort of your own desktop.

But first, you'll need to make sure the add-ons are installed. Some distros come with a filled-to-the-brim KDE, while others give you just the basics, so if you don't see the Git options in the next few steps, search your repository for something like dolphin-extras or dolphin-plugins.

To activate Git integration, go to the Settings menu in any Dolphin window and select Configure Dolphin.

In the Configure Dolphin window, click on the Services icon in the left column.

In the Services panel, scroll through the list of available plugins until you find Git.

![](https://opensource.com/sites/default/files/4_dolphinconfig.jpg)

Save your changes and close your Dolphin window. When you re-launch Dolphin, navigate to a Git repository and have a look around. Notice that all icons now have emblems: green boxes for committed files, solid green boxes for modified files, no icon for untracked files, and so on.

Your right-click menu now has contextual Git options when invoked inside a Git repository. You can initiate a checkout, push or pull when clicking inside a Dolphin window, and you can even do a git add or git remove on your files.

![](https://opensource.com/sites/default/files/4_dolphingit.jpg)

You can't clone a repository or change remote paths in Dolphin, but will have to drop to a terminal, which is just an F4 away.

Frankly, this feature of KDE is so kool [sic] that this article could just end here. The integration of Git in your native file manager makes working with Git almost transparent; everything you need to do just happens no matter what stage of the process you are in. Git in the terminal, and Git waiting for you when you switch to the GUI. It is perfection.

But wait, there's more!

### Sparkleshare

From the other side of the desktop pond comes SparkleShare, a project that uses a file synchronization model ("like Dropbox!") that got started by some GNOME developers. It is not integrated into any specific part of GNOME, so you can use it on all platforms.

If you run Linux, install SparkleShare from your software repository. Other operating systems should download from the SparkleShare website. You can safely ignore the instructions on the SparkleShare website, which are for setting up a SparkleShare server, which is not what we will do here. You certainly can set up a SparkleShare server if you want, but SparkleShare is compatible with any Git repository, so you don't need to create your own server.

After it is installed, launch SparkleShare from your applications menu. Step through the setup wizard, which is two steps plus a brief tutorial, and optionally set SparkleShare as a startup item for your desktop.

![](https://opensource.com/sites/default/files/4_sparklesetup.jpg)

An orange SparkleShare directory is now in your system tray. Currently, SparkleShare is oblivious to anything on your computer, so you need to add a hosted project.

To add a directory for SparkleShare to track, click the SparkleShare icon in your system tray and select Add Hosted Project.

![](https://opensource.com/sites/default/files/4_sparklehost.jpg)

SparkleShare can work with self-hosted Git projects, or projects hosted on public Git services like GitHub and Bitbucket. For full access, you'll probably need to use the Client ID that SparkleShare provides to you. This is an SSH key acting as the authentication token for the service you use for hosting, including your own Git server, which should also use SSH public key authentication rather than password login. Copy the Client ID into the authorized_hosts  file of your Git user on your server, or into the SSH key panel of your Git host.

After configuring the host you want to use, SparkleShare downloads the Git project, including, at your option, the commit history. Find the files in ~/SparkleShare.

Unlike Dolphin's Git integration, SparkleShare is unnervingly invisible. When you make a change, it quietly syncs the change to your remote project. For many people, that is a huge benefit: all the power of Git with none of the maintenance. To me, it is unsettling, because I like to govern what I commit and which branch I use.

SparkleShare may not be for everyone, but it is a powerful and simple Git solution that shows how different open source projects fit together in perfect harmony to create something unique.

### Git-cola

Yet another model of working with Git repositories is less native and more of a monitoring approach; rather than using an integrated application to interact directly with your Git project, you can use a desktop client to monitor changes in your project and deal with each change in whatever way you choose. An advantage to this approach is focus. You might not care about all 125 files in your project when only three of them are actively being worked on, so it is helpful to bring them to the forefront.

If you thought there were a lot of Git web hosts out there, you haven't seen anything yet. [Git clients for your desktop][1] are a dime-a-dozen. In fact, Git actually ships with an inbuilt graphical Git client. The most cross-platform and most configurable of them all is the open source Git-cola client, written in Python and Qt.

If you're on Linux, Git-cola may be in your software repository. Otherwise, just download it from the site and install it:

```
$ python setup.py install
```

When Git-cola launches, you're given three buttons to open an existing repository, create a new repo, or clone an existing repository.

Whichever you choose, at some point you end up with a Git repository. Git-cola, and indeed most desktop clients that I've used, don't try to be your interface into your repository; they leave that up to your normal operating system tools. In other words, I might start a repository with Git-cola, but then I would open that repository in Thunar or Emacs to start my work. Leaving Git-cola open as a monitor works quite well, because as you create new files, or change existing ones, they appear in Git-cola's Status panel.

The default layout of Git-cola is a little non-linear. I prefer to move from left-to-right, and because Git-cola happens to be very configurable, you're welcome to change your layout. I set mine up so that the left-most panel is Status, showing any changes made to my current branch, then to the right, a Diff panel in case I want to review a change, and the Actions panel for quick-access buttons to common tasks, and finally the right-most panel is a Commit panel where I can write commit messages.

![](https://opensource.com/sites/default/files/4_gitcola.jpg)

Even if you use a different layout, this is the general flow of Git-cola:

Changes appear in the Status panel. Right-click a change entry, or select a file and click the Stage button in the Action panel, to stage a file.

A staged file's icon changes to a green triangle to indicate that it has been both modified and staged. You can unstage a file by right-clicking and selecting Unstage Selected, or by clicking the Unstage button in the Actions panel.

Review your changes in the Diff panel.

When you are ready to commit, enter a commit message and click the Commit button.

There are other buttons in the Actions panel for other common tasks like a git pull or git push. The menus round out the task list, with dedicated actions for branching, reviewing diffs, rebasing, and a lot more.

I tend to think of Git-cola as a kind of floating panel for my file manager (and I only use Git-cola when Dolphin is not available). On one hand, it's less interactive than a fully integrated and Git-aware file manager, but on the other, it offers practically everything that raw Git does, so it's actually more powerful.

There are plenty of graphical Git clients. Some are paid software with no source code available, others are viewers only, others attempt to reinvent Git with special terms that are specific to the client ("sync" instead of "push"..?), and still others are platform-specific. Git-Cola has consistently been the easiest to use on any platform, and the one that stays closest to pure Git so that users learn Git whilst using it, and experts feel comfortable with the interface and terminology.

### Git or graphical?

I don't generally use graphical tools to access Git; mostly I use the ones I've discussed when helping other people find a comfortable interface for themselves. At the end of the day, though, it comes down to what fits with how you work. I like terminal-based Git because it integrates well with Emacs, but on a day where I'm working mostly in Inkscape, I might naturally fall back to using Git in Dolphin because I'm in Dolphin anyway.

It's up to you how you use Git; the most important thing to remember is that Git is meant to make your life easier and those crazy ideas you have for your work safer to try out. Get familiar with the way Git works, and then use Git from whatever angle you find works best for you.

In our next installment, we will learn how to set up and manage a Git server, including user access and management, and running custom scripts.



--------------------------------------------------------------------------------

via: https://opensource.com/life/16/8/graphical-tools-git

作者：[Seth Kenlon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]: https://git-scm.com/downloads/guis
