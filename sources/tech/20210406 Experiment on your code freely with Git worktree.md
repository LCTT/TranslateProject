[#]: subject: (Experiment on your code freely with Git worktree)
[#]: via: (https://opensource.com/article/21/4/git-worktree)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Experiment on your code freely with Git worktree
======
Get freedom to try things out alongside the security of having a new,
linked clone of your repository if your experiment goes wrong.
![Science lab with beakers][1]

Git is designed in part to enable experimentation. Once you know that your work is safely being tracked and safe states exist for you to fall back upon if something goes horribly wrong, you're not afraid to try new ideas. Part of the price of innovation, though, is that you're likely to make a mess along the way. Files get renamed, moved, removed, changed, and cut into pieces. New files are introduced. Temporary files that you don't intend to track take up residence in your working directory.

In short, your workspace becomes a house of cards, balancing precariously between _"it's almost working!"_ and _"oh no, what have I done?"_. So what happens when you need to get your repository back to a known state for an afternoon so that you can get some _real_ work done? The classic commands git branch and [git stash][2] come immediately to mind, but neither is designed to deal, one way or another, with untracked files, and changed file paths and other major shifts can make it confusing to just stash your work away for later. The answer is Git worktree.

### What is a Git worktree

A Git worktree is a linked copy of your Git repository, allowing you to have multiple branches checked out at a time. A worktree has a separate path from your main working copy, but it can be in a different state and on a different branch. The advantage of a new worktree in Git is that you can make a change unrelated to your current task, commit the change, and then merge it at a later date, all without disturbing your current work environment.

The canonical example, straight from the `git-worktree` man page, is that you're working on an exciting new feature for a project when your project manager tells you there's an urgent fix required. The problem is that your working repository (your "worktree") is in disarray because you're developing a major new feature. You don't want to "sneak" the fix into your current sprint, and you don't feel comfortable stashing changes to create a new branch for the fix. Instead, you decide to create a fresh worktree so that you can make the fix there:


```
$ git branch | tee
* dev
trunk
$ git worktree add -b hotfix ~/code/hotfix trunk
Preparing ../hotfix (identifier hotfix)
HEAD is now at 62a2daf commit
```

In your `code` directory, you now have a new directory called `hotfix`, which is a Git worktree linked to your main project repository, with its `HEAD` parked at the branch called `trunk`. You can now treat this worktree as if it were your main workspace. You can change directory into it, make the urgent fix, commit it, and eventually remove the worktree:


```
$ cd ~/code/hotfix
$ sed -i 's/teh/the/' hello.txt
$ git commit --all --message 'urgent hot fix'
```

Once you've finished your urgent work, you can return to your previous task. You're in control of when your hotfix gets integrated into the main project. For instance, you can push the change directly from its worktree to the project's remote repo:


```
$ git push origin HEAD
$ cd ~/code/myproject
```

Or you can archive the worktree as a TAR or ZIP file:


```
$ cd ~/code/myproject
$ git archive --format tar --output hotfix.tar master
```

Or you can fetch the changes locally from the separate worktree:


```
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
/home/seth/code/hotfix     09e585d [master]
```

From there, you can merge your changes using whatever strategy works best for you and your team.

### Listing active worktrees

You can get a list of the worktrees and see what branch each has checked out using the `git worktree list` command:


```
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
/home/seth/code/hotfix     09e585d [master]
```

You can use this from within either worktree. Worktrees are always linked (unless you manually move them, breaking Git's ability to locate a worktree, and therefore severing the link).

### Moving a worktree

Git tracks the locations and states of a worktree in your project's `.git` directory:


```
$ cat ~/code/myproject/.git/worktrees/hotfix/gitdir
/home/seth/code/hotfix/.git
```

If you need to relocate a worktree, you must do that using `git worktree move`; otherwise, when Git tries to update the worktree's status, it fails:


```
$ mkdir ~/Temp
$ git worktree move hotfix ~/Temp
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
/home/seth/Temp/hotfix     09e585d [master]
```

### Removing a worktree

When you're finished with your work, you can remove it with the `remove` subcommand:


```
$ git worktree remove hotfix
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
```

To ensure your `.git` directory is clean, use the `prune` subcommand after removing a worktree:


```
`$ git worktree remove prune`
```

### When to use worktrees

As with many options, whether it's tabs or bookmarks or automatic backups, it's up to you to keep track of the data you generate, or it could get overwhelming. Don't use worktrees so often that you end up with 20 copies of your repo, each in a slightly different state. I find it best to create a worktree, do the task that requires it, commit the work, and then remove the tree. Keep it simple and focused.

The important thing is that worktrees provide improved flexibility for how you manage a Git repository. Use them when you need them, and never again scramble to preserve your working state just to check something on another branch.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-worktree

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/article/21/4/git-stash
