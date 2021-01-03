[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 things to love about Git)
[#]: via: (https://opensource.com/article/20/12/git)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)

10 things to love about Git
======
Knowing more about how Git works makes working with Git easier. Learn
more in our readers' favorite Git articles of the year.
![Business woman on laptop sitting in front of window][1]

Git is an essential tool in the open source developer's toolkit. This powerful version-control system has a lot of complex features. Not all of the features are necessary to use Git, but knowing more about how Git works makes working with Git easier.

During 2020, Opensource.com published many excellent articles about Git, including the top 10 covered below. Each article provides tips and tricks for improving and enhancing your Git experience.

### How to resolve a git merge conflict

This tutorial by Brian Breniser begins by defining `git merge` and explaining what merge conflicts are. Then he provides a detailed tutorial about how to [work through a merge conflict][2] when one arises. Breniser also provides a few suggestions for where you can go to learn more about resolving merge conflicts and other Git functions.

### 4 Git scripts I can't live without

Vince Power shares his [most important Git scripts][3]. These scripts come from the Git Extras package, which provides over 60 scripts for enhancing Git. Power's favorite scripts are `git-ignore` for editing `.git-ignore` without opening a text editor; `git-info` for providing a summary about a Git repository; `git-mr` and `git-pr` for dealing with merge requests on GitLab and pull requests on GitHub; and `git-release`, which combines Git's `commit`, `tag`, and `push` into a single command.

### The life-changing magic of git rebase -i

Learn how to use [git rebase -i to revise your Git history][4] in this article by Dave Neary. Neary starts by explaining how Git handles the history of commits to a repository and the differences between `git commit` and `git rebase`. Next, he explains how to use `git rebase -i` to alter the history of a Git repository to make things cleaner. This allows you to move changes from "fixed typo" commits into other commits and merge similar smaller commits into combined larger commits.

### Make Git easy with Git Cola

Opensource.com editor Seth Kenlon demonstrates [how to use Git Cola][5]. Git is a command-line tool, which might turn some people off from using it. Git Cola provides a graphical interface to Git, so users who are not comfortable working on the command line can still take advantage of Git's features. In this article, Kenlon shows how to install Git Cola and accomplish many Git commit tasks using Git Cola's graphical user interface.

### 6 best practices for teams using Git

By design, Git is a collaborative tool, but many of the specifics about how to collaborate are left up to teams to decide. Ravi Chandran provides suggestions that any team could adopt [to use Git more effectively][6]. The six best practices, which Chandran explains in the article, are "formalize Git conventions," "merge changes properly," "rebase your feature branch often," "squash commits before merging," "use tags," and "make the software executable print the tag."

### 7 Git tricks that changed my life

Rajeev Bera shares [seven Git tricks][7] that improve the user experience when working with Git. The article explores Git's autocorrect option, counting commits, repo optimization, backing up untracked files, knowing the `.git` folder, viewing a file on another branch, and searching in Git.

### Customizing my Linux terminal with tmux and Git

Moshe Zadka demonstrates how he [used tmux and Git][8] to customize his Linux terminal. Zadka's article is a fascinating exploration of one person's workflow. He uses GNOME Terminal but enhances it by using tmux and features that allow him to see the status of a Git repository quickly. If files need to be committed or a commit needs to be pushed, a single letter indicates that.

### Make advanced Git tasks simple with Lazygit

Jesse Duffield explains how to use [Lazygit, a terminal interface that makes using Git easier][9]. Duffield, who developed Lazygit, details how to use the interface to stage files, rebase interactively, do cherry-picking, search through commits, and open a pull request.

### Managing Git projects with submodules and subtrees

Submodules and subtrees are two different ways to include nested subprojects in a Git repository. In [_Managing Git projects with submodules and subtrees_][10], Manaswini Das explains how the two options work and how they differ.

### Don't love diff? Use Meld instead

Ben Nuttall shows how to [use Meld instead of diff][11] to compare and merge changes. Meld is a graphical alternative to `diff` with output that is easier to understand. Nuttall demonstrates the difference between comparing two files using `diff` and Meld. He also explains how Meld is Git-aware, which means it can be used to explore changes made to a file since the last time it was committed in Git.

* * *

What do you want to learn about Git? Please share your ideas in the comments, and if you have knowledge to share, please [consider writing about it for Opensource.com][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/git

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/4/git-merge-conflict
[3]: https://opensource.com/article/20/4/git-extras
[4]: https://opensource.com/article/20/4/git-rebase-i
[5]: https://opensource.com/article/20/3/git-cola
[6]: https://opensource.com/article/20/7/git-best-practices
[7]: https://opensource.com/article/20/10/advanced-git-tips
[8]: https://opensource.com/article/20/7/tmux-git
[9]: https://opensource.com/article/20/3/lazygit
[10]: https://opensource.com/article/20/5/git-submodules-subtrees
[11]: https://opensource.com/article/20/3/meld
[12]: https://opensource.com/how-submit-article
