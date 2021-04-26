[#]: subject: (5 commands to level-up your Git game)
[#]: via: (https://opensource.com/article/21/4/git-commands)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 commands to level-up your Git game
======
Get more use out of Git by adding these commands to your repertoire.
![Business woman on laptop sitting in front of window][1]

If you use Git regularly, you might be aware that it has several reputations. It's probably the most popular version-control solution and is used by some of the [biggest software projects][2] around to [keep track of changes][3] to files. It provides a [robust interface][4] to review and incorporate experimental changes into existing documents. It's well-known for its flexibility, thanks to [Git hooks][5]. And partly because of its great power, it has earned its reputation for being complex.

You don't have to use all of Git's many features, but if you're looking to delve deeper into Git's subcommands, here are some that you might find useful.

### 1\. Finding out what changed

If you're familiar with Git's basics (`fetch`, `add`, `commit`, `push`, `log`, and so on) but you want to learn more, Git subcommands that query are a great, safe place to start. Querying your Git repository (your _work tree_) doesn't make any changes; it's only a reporting mechanism. You're not risking the integrity of your Git checkout; you're only asking Git about its status and history.

The [git whatchanged][6] command (almost a mnemonic itself) is an easy way to see what changed in a commit. A remarkably user-friendly command, it squashes the best features of `show` and `diff-tree` and `log` into one easy-to-remember command.

### 2\. Managing changes with git stash

The more you use Git, the more you use Git. That is, once you've become comfortable with the power of Git, the more often you use its powerful features. Sometimes, you may find yourself in the middle of working with a batch of files when you realize some other task is more urgent. With [git stash][7], you can gather up all the pieces of your work in progress and stash them away for safekeeping. With your workspace decluttered, you can turn your attention to some other task and then reapply stashed files to your work tree later to resume work.

### 3\. Making a linked copy with git worktree

When `git stash` isn't enough, Git also provides the powerful [git worktree][8] command. With it, you can create a new but _linked_ clone of your repository, forming a new branch and setting `HEAD` to whatever commit you want to base your new work on. In this linked clone, you can work on a task unrelated to what your primary clone is focused on. It's a good way to keep your work in progress safe from unintended changes. When you're finished with your new work tree, you can push your new branch to a remote, bundle the changes into an archive for later, or just fetch the changes from your other tree. Whatever you decide, your workspaces are kept separate, and the changes in one don't have to affect changes in the other until you are ready to merge.

### 4\. Selecting merges with git cherry-pick

It may seem counterintuitive, but the better at Git you get, the more merge conflicts you're likely to encounter. That's because merge conflicts aren't necessarily signs of errors but signs of activity. Getting comfortable with merge conflicts and how to resolve them is an important step in learning Git. The usual methods work well, but sometimes you need greater flexibility in how you merge, and for that, there's [git cherry-pick][9]. Cherry-picking merges allows you to be selective in what parts of commits you merge, so you never have to reject a merge request based on a trivial incongruity.

### 5\. Managing $HOME with Git

Managing your home directory with Git has never been easier, and thanks to Git's ability to be selective in what it manages, it's a realistic option for keeping your computers in sync. To work well, though, you must do it judiciously. To get started, read my tips on [managing $HOME with Git][10].

### Getting better at Git

Git is a powerful version-control system, and the more comfortable you become with it, the easier it becomes to use it for complex tasks. Try some new Git commands today, and share your favorites in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-commands

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/19/10/how-gnome-uses-git
[3]: https://opensource.com/article/18/2/how-clone-modify-add-delete-git-files
[4]: https://opensource.com/article/18/5/git-branching
[5]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[6]: https://opensource.com/article/21/3/git-whatchanged
[7]: https://opensource.com/article/21/3/git-stash
[8]: https://opensource.com/article/21/3/git-worktree
[9]: https://opensource.com/article/21/3/reasons-use-cherry-picking
[10]: https://opensource.com/article/21/3/git-your-home
