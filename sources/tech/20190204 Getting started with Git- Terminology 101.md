[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Git: Terminology 101)
[#]: via: (https://opensource.com/article/19/2/git-terminology)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Getting started with Git: Terminology 101
======
Want to learn Git? Check out this quick summary of the most important
terms and commands.
![Digital hand surrounding by objects, bike, light bulb, graphs][1]

Version control is an important tool for anyone looking to track their changes these days. It's especially helpful for programmers, sysadmins, and site reliability engineers (SREs) alike. The promise of recovering from mistakes to a known good state is a huge win and a touch friendlier than the previous strategy of adding **`.old`** to a copied file.

But learning Git is often oversimplified by well-meaning peers telling everyone to "get into open source." Before you know it, someone asks for a _pull request_ or *merge request *where you _rebase_ from _upstream_ before they can merge from your _remote_—and be sure to remove _merge commits_. Whatever well-working contribution you want to give back to an open source project feels much further from being added when you look at all these words you don't know.

![Git Cheat Sheet cover image][2]

[Download][3] our
Git cheat sheet.

If you have a month or two and enough curiosity, [Git SCM][4] is the definitive source for all the terms you need to learn. If you're looking for a summary from the trenches, keep reading.

### Reminder: What's a commit?

The toughest part of Git for me to internalize was the simplest idea of Git: _a commit is a collection of content, a message about how you got there, and the commits that came before it_. There's no inherent code release strategy or even strong opinions built in. The content doesn't even have to be code—it is _anything_ you want to add to the repository. The commit message annotates that content.

I like to think of a commit message as a gift to your future self: it may mention the files you edited, but more importantly it reminds you of your intention for changing those files. Adding more about why you have edited what you have helps anyone who uses your repository, even when that person is you.

### There's no place like 'origin/master'

Knowing where you are in a Git project starts with thinking of a tree. All Git projects have a root, similar to the idea of a filesystem's root directory. All commits branch off from that root. In this way, a branch is only a pointer to a commit. By convention, **master** is the default name for the default branch in your root directory.

Since Git is a distributed version control system, where the same codebase is distributed to multiple locations, people often use the term "repository" as a way of talking about all copies of the same project. There is the _local repository_, where you edit your code (more on that in a minute), and the _remote repository_, the place where you want to send it after you're finished. Remotes can be anywhere, even on the same computer where your local repository is located, but they are often hosted on repository services like GitLab or GitHub.

### What's the pwd of Git commands?

While it's not an official selling point, being lost is part of the fun of a Git repository. You can find your way by running through this reliable set of commands:

  * `git branch`—to find which branch you're on

  * `git log`—to see what commit you're on

  * `git status`—to see what edits you've made since the last commit

  * `git remote`—to see what remote repository you're tracking




Orienting yourself using these commands will give you a sense of direction when you're stuck.

### Have I stashed or cached my commit?

The code local to your computer is colloquially called your _workspace_. What is not immediately obvious is that you have two (yes, two!) other locations local to you when you are in a Git repository: _index_ and _stash_. When you write some content and then **add** it, you are adding it to the index, which is the cached content that is ready to commit. There are times when you have files in the index that you are not ready to commit, but you want to view another branch. That's where the stash comes in handy. You can store indexed-but-not-yet-committed files to the stash using `git stash`. When you're ready to retrieve the file, run `git stash pop` to bring changes back into the index.

Here are some commands you'll need to use your stash and cache.

  * `git diff ..origin/master`—to show the difference between the most recent local commit and the remote called "origin" and its branch called "master"

  * `git diff --cached`—to show any differences between the most recent local commit and what has been added to the local index

  * `git stash`—to place indexed (added but not committed) files in the stash stack

  * `git stash list`—to show what changes are in the stash stack

  * `git stash pop`—to take the most recent change off the stash stack




### HEADless horseman

Git is a collection of all kinds of metaphors. When I think of where the HEAD is, I think of train lines. If you end up in a _detached HEAD_ mode, it means you're off the metaphorical rails.

HEAD is a pointer to your most recent commit in the currently checked-out branch. The default "checkout" is when you create a Git repository and land on the **master** branch. Every time you create or change to another branch, you are on that branch line. If you `git checkout <commit>` somewhere in your current branch, HEAD will move to that commit. If there is no commit history connecting your current commit to the commit you checked out, then you'll be in a detached HEAD state. If you ever lose your head finding where HEAD is, you can always `git reset --hard origin/master` to delete changes and get back to a known state. _Warning: this will delete any changes you have made since you last pushed to master._

### Are you upstream or downstream?

The local copy of your project is considered your local repository. It may or may not have a remote repository—the place where you have a copy of your repository for collaboration or safekeeping. There may also be an _upstream_ repository where a third copy of the project is hosted and maintained by a different set of contributors.

For instance, let's say I want to contribute to Kubernetes. I would first fork the **kubernetes/kubernetes** project to my account, **mbbroberg/kubernetes**. I would then clone my project to my local workspace. In this scenario, my local clone is my local repository, **mbbroberg/kubernetes** is my remote repository, and **kubernetes/kubernetes** is the upstream.

### Merging the metaphors

The visual of a root system merges with the train tracks image when you get deeper into Git branches. Branches are often used as ways of developing a new feature that you eventually want to _merge_ into the master branch. When doing this, Git keeps the common history of commits in order then appends the new commits for your branch to the history. There are a ton of nuances to this process—whether to rebase or not, whether to add a merge commit or not—which [Brent Laster][5] explores in greater detail in "[How to reset, revert, and return to previous states in Git][6]."

### I think I Git it now

There is a ton of terminology and a lot to explore to master the world of Git commands. I hope this first-person exploration of how I use the terms day-to-day helps you acclimate to it all. If you ever feel stuck or frustrated, feel free to reach out to me on Twitter [@mbbroberg][7].

#### To review:

  * **Commit**—stores the current contents of the index in a new commit along with a log message from the user describing the changes

  * **Branch**—a pointer to a commit

  * **Master**—the default name for the first branch

  * **HEAD**—a pointer to the most recent commit on the current branch

  * **Merge**—joining two or more commit histories

  * **Workspace**—the colloquial name for your local copy of a Git repository

  * **Working tree**—the current branch in your workspace; you see this in `git status` output all the time

  * **Cache**—a space intended to temporarily store uncommitted changes

  * **Index**—the cache where changes are stored before they are committed

  * **Tracked and untracked files**—files either in the index cache or not yet added to it

  * **Stash**—another cache, that acts as a stack, where changes can be stored without committing them

  * **Origin**—the default name for a remote repository

  * **Local repository**—another term for where you keep your copy of a Git repository on your workstation

  * **Remote repository**—a secondary copy of a Git repository where you push changes for collaboration or backup

  * **Upstream repository**—the colloquial term for a remote repository that you track

  * **Pull request**—a GitHub-specific term to let others know about changes you've pushed to a branch in a repository

  * **Merge request**—a GitLab-specific term to let others know about changes you've pushed to a branch in a repository

  * **'origin/master'**—the default setting for a remote repository and its primary branch




Postscript: Puns are one of the best parts of Git. Have fun with them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/git-terminology

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://opensource.com/sites/default/files/uploads/git_cheat_sheet_cover.jpg (Git Cheat Sheet cover image)
[3]: https://opensource.com/downloads/cheat-sheet-git
[4]: https://git-scm.com/about
[5]: https://opensource.com/users/bclaster
[6]: https://opensource.com/article/18/6/git-reset-revert-rebase-commands
[7]: https://twitter.com/mbbroberg
