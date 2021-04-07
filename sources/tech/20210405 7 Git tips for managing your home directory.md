[#]: subject: (7 Git tips for managing your home directory)
[#]: via: (https://opensource.com/article/21/4/git-home)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

7 Git tips for managing your home directory
======
Here is how I set up Git to manage my home directory.
![Houses in a row][1]

I have several computers. I've got a laptop at work, a workstation at home, a Raspberry Pi (or four), a [Pocket CHIP][2], a [Chromebook running various forms of Linux][3], and so on. I used to set up my user environment on each computer by more or less following the same steps, and I often told myself that I enjoyed that each one was slightly unique. For instance, I use [Bash aliases][4] more often at work than at home, and the helper scripts I use at home might not be useful at work.

Over the years, my expectations across devices began to merge, and I'd forget that a feature I'd built up on my home machine wasn't ported over to my work machine, and so on. I needed a way to standardize my customized toolkit. The answer, to my surprise, was Git.

Git is version-tracker software. It's famously used by the biggest and smallest open source projects and even by the largest proprietary software companies. But it was designed for source code—not a home directory filled with music and video files, games, photos, and so on. I'd heard of people managing their home directory with Git, but I assumed that it was a fringe experiment done by coders, not real-life users like me.

Managing my home directory with Git has been an evolving process. I've learned and adapted along the way. Here are the things you might want to keep in mind should you decide to manage your home directory with Git.

### 1\. Text and binary locations

![home directory][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

When managed by Git, your home directory becomes something of a no-man 's-land for everything but configuration files. That means when you open your home directory, you should see nothing but a list of predictable directories. There shouldn't be any stray photos or LibreOffice documents, and no "I'll put this here for just a minute" files.

The reason for this is simple: when you manage your home directory with Git, everything in your home directory that's _not_ being committed becomes noise. Every time you do a `git status`, you'll have to scroll past any file that Git isn't tracking, so it's vital that you keep those files in subdirectories (which you add to your `.gitignore` file).

Many Linux distributions provide a set of default directories:

  * Documents
  * Downloads
  * Music
  * Photos
  * Templates
  * Videos



You can create more if you need them. For instance, I differentiate between the music I create (Music) and the music I purchase to listen to (Albums). Likewise, my Cinema directory contains movies by other people, while Videos contains video files I need for editing. In other words, my default directory structure has more granularity than the default set provided by most Linux distributions, but I think there's a benefit to that. Without a directory structure that works for you, you'll be more likely to just stash stuff in your home directory, for lack of a better place for it, so think ahead and plan out directories that work for you. You can always add more later, but it's best to start strong.

### 2\. Setting up your very best .gitignore

Once you've cleaned up your home directory, you can instantiate it as a Git repository as usual:


```
$ cd
$ git init .
```

Your Git repository contains nothing yet, so everything in your home directory is untracked. Your first job is to sift through the list of untracked files and determine what you want to remain untracked. To see untracked files:


```
$ git status
  .AndroidStudio3.2/
  .FBReader/
  .ICEauthority
  .Xauthority
  .Xdefaults
  .android/
  .arduino15/
  .ash_history
[...]
```

Depending on how long you've been using your home directory, this list may be long. The easy ones are the directories you decided on in the first step. By adding these to a hidden file called `.gitignore`, you tell Git to stop listing them as untracked files and never to track them:


```
`$ \ls -lg | grep ^d | awk '{print $8}' >> ~/.gitignore`
```

With that done, go through the remaining untracked files shown by `git status` and determine whether any other files warrant exclusion. This process helped me discover several stale old configuration files and directories, which I ended up trashing altogether, but also some that were very specific to one computer. I was fairly strict here because many configuration files do better when they're auto-generated. For instance, I never commit my KDE configuration files because many contain information like recent documents and other elements that don't exist on another machine.

I track my personalized configuration files, scripts and utilities, profile and Bash configs, and cheat sheets and other snippets of text that I refer to frequently. If the software is mostly responsible for maintaining a file, I ignore it. And when in doubt about a file, I ignore it. You can always un-ignore it later (by removing it from your `.gitignore` file).

### 3\. Get to know your data

I'm on KDE, so I use the open source scanner [Filelight][7] to get an overview of my data. Filelight gives you a chart that lets you see the size of each directory. You can navigate through each directory to see what's taking up all the space and then backtrack to investigate elsewhere. It's a fascinating view of your system, and it lets you see your files in a completely new light.

![Filelight][8]

(Seth Kenlon, [CC BY-SA 4.0][6])

Use Filelight or a similar utility to find unexpected caches of data you don't need to commit. For instance, the KDE file indexer (Baloo) generates quite a lot of data specific to its host that I definitely wouldn't want to transport to another computer.

### 4\. Don't ignore your .gitignore file

On some projects, I tell Git to ignore my `.gitignore` file because what I want to ignore is sometimes specific to my working directory, and I don't presume other developers on the same project need me to tell them what their `.gitignore` file ought to look like. Because my home directory is for my use only, I do _not_ ignore my home's `.gitignore` file. I commit it along with other important files, so it's inherited across all of my systems. And of course, all of my systems are identical from the home directory's viewpoint: they have the same set of default folders and many of the same hidden configuration files.

### 5\. Don't fear the binary

I put my system through weeks and weeks of rigorous testing, convinced that it was _never_ wise to commit binary files to Git. I tried GPG encrypted password files, I tried LibreOffice documents, JPEGs, PNGs, and more. I even had a script that unarchived LibreOffice files before adding them to Git, extracted the XML inside so I could commit just the XML, and then rebuilt the LibreOffice file so that I could work on it within LibreOffice. My theory was that committing XML would render a smaller Git repository than a ZIP file (which is all a LibreOffice document really is).

To my great surprise, I found that committing a few binary files every now and then did not substantially increase the size of my Git repository. I've worked with Git long enough to know that if I were to commit gigabytes of binary data, my repository would suffer, but the occasional binary file isn't an emergency to avoid at all costs.

Armed with this new confidence, I add font OTF and TTF files to my standard home repo, my `.face` file for GDM, and other incidental minor binary blobs. Don't overthink it, don't waste time trying to avoid it; just commit it.

### 6\. Use a private repo

Don't commit your home directory to a public Git repository, even if the host offers private accounts. If you're like me, you have SSH keys and GPG keychains and GPG-encrypted files that ought not end up on anybody's server but my own.

I [run a local Git server][9] on a Raspberry Pi (it's easier than you think), so I can update any computer any time I'm home. I'm a remote worker, so that's usually good enough, but I can also reach the computer when traveling over my [VPN][10].

### 7\. Remember to push

The thing about Git is that it only pushes changes to your server when you tell it to. If you're a longtime Git user, this process is probably natural to you. For new users who might be accustomed to the automatic synchronization in Nextcloud or Syncthing, this may take some getting used to.

### Git at home

Managing my common files with Git hasn't just made life more convenient across devices. Knowing that I have a full history for all my configurations and utility scripts encourages me to try out new ideas because it's always easy to roll back my changes if they turn out to be _bad_ ideas. Git has rescued me from an ill-advised umask setting in `.bashrc`, a poorly executed late-night addition to my package management script, and an it-seemed-like-a-cool-idea-at-the-time change of my [rxvt][11] color scheme—and probably a few other mistakes in my past. Try Git in your home because a home that commits together merges together.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-home

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://opensource.com/article/17/2/pocketchip-or-pi
[3]: https://opensource.com/article/21/2/chromebook-linux
[4]: https://opensource.com/article/17/5/introduction-alias-command-line-tool
[5]: https://opensource.com/sites/default/files/uploads/home-git.jpg (home directory)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://utils.kde.org/projects/filelight
[8]: https://opensource.com/sites/default/files/uploads/filelight.jpg (Filelight)
[9]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[10]: https://www.redhat.com/sysadmin/run-your-own-vpn-libreswan
[11]: https://opensource.com/article/19/10/why-use-rxvt-terminal
