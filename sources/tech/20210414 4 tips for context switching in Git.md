[#]: subject: (4 tips for context switching in Git)
[#]: via: (https://opensource.com/article/21/4/context-switching-git)
[#]: author: (Olaf Alders https://opensource.com/users/oalders)
[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 tips for context switching in Git
======
Compare the pros and cons of four options to switch branches while
working in Git.
![Computer screen with files or windows open][1]

Anyone who spends a lot of time working with Git will eventually need to do some form of context switching. Sometimes this adds very little overhead to your workflow, but other times, it can be a real pain.

Let's discuss the pros and cons of some common strategies for dealing with context switching using this example problem:

> Imagine you are working in a branch called `feature-X`. You have just discovered you need to solve an unrelated problem. This cannot be done in `feature-X`. You will need to do this work in a new branch, `feature-Y`.

### Solution #1: stash + branch

Probably the most common workflow to tackle this issue looks something like this:

  1. Halt work on the branch `feature-X`
  2. `git stash`
  3. `git checkout -b feature-Y origin/main`
  4. Hack, hack, hack…
  5. `git checkout feature-X` or `git switch -`
  6. `git stash pop`
  7. Resume work on `feature-X`



**Pros:** The nice thing about this approach is that this is a fairly easy workflow for simple changes. It can work quite well, especially for small repositories.

**Cons:** When using this workflow, you can have only one workspace at a time. Also, depending on the state of your repository, working with the stash can be non-trivial.

### Solution #2: WIP commit + branch

A variation on this solution looks quite similar, but it uses a WIP (Work in Progress) commit rather than the stash. When you're ready to switch back, rather than popping the stash, `git reset HEAD~1` unrolls your WIP commit, and you're free to continue, much as you did in the earlier scenario but without touching the stash.

  1. Halt work on the branch `feature-X`
  2. `git add -u` (adds only modified and deleted files)
  3. `git commit -m "WIP"`
  4. `git checkout -b feature-Y origin/master`
  5. Hack, hack, hack…
  6. `git checkout feature-X` or `git switch -`
  7. `git reset HEAD~1`



**Pros:** This is an easy workflow for simple changes and also good for small repositories. You don't have to work with the stash.

**Cons:** You can have only one workspace at any time. Also, WIP commits can sneak into your final product if you or your code reviewer are not vigilant.

When using this workflow, you _never_ want to add a `--hard` to `git reset`. If you do this accidentally, you should be able to restore your commit using `git reflog`, but it's less heartstopping to avoid this scenario entirely.

### Solution #3: new repository clone

In this solution, rather than creating a new branch, you make a new clone of the repository for each new feature branch.

**Pros:** You can work in multiple workspaces simultaneously. You don't need `git stash` or even WIP commits.

**Cons:** Depending on the size of your repository, this can use a lot of disk space. (Shallow clones can help with this scenario, but they may not always be a good fit.) Additionally, your repository clones will be agnostic about each other. Since they can't track each other, you must track where your clones live. If you need git hooks, you will need to set them up for each new clone.

### Solution #4: git worktree

To use this solution, you may need to learn about `git add worktree`. Don't feel bad if you're not familiar with worktrees in Git. Many people get by for years in blissful ignorance of this concept.

#### What is a worktree?

Think of a worktree as the files in the repository that belong to a project. Essentially, it's a kind of workspace. You may not realize that you're already using worktrees. When using Git, you get your first worktree for free.


```
$ mkdir /tmp/foo &amp;&amp; cd /tmp/foo
$ git init
$ git worktree list
/tmp  0000000 [master]
```

As you can see, the worktree exists even before the first commit. Now, add a new worktree to an existing project.

#### Add a worktree

To add a new worktree, you need to provide:

  1. A location on disk
  2. A branch name
  3. Something to branch from




```
$ git clone <https://github.com/oalders/http-browserdetect.git>
$ cd http-browserdetect/
$ git worktree list
/Users/olaf/http-browserdetect  90772ae [master]

$ git worktree add ~/trees/oalders/feature-X -b oalders/feature-X origin/master
$ git worktree add ~/trees/oalders/feature-Y -b oalders/feature-Y e9df3c555e96b3f1

$ git worktree list
/Users/olaf/http-browserdetect       90772ae [master]
/Users/olaf/trees/oalders/feature-X  90772ae [oalders/feature-X]
/Users/olaf/trees/oalders/feature-Y  e9df3c5 [oalders/feature-Y]
```

Like with most other Git commands, you need to be inside a repository when issuing this command. Once the worktrees are created, you have isolated work environments. The Git repository tracks where the worktrees live on disk. If Git hooks are already set up in the parent repository, they will also be available in the worktrees.

Don't overlook that each worktree uses only a fraction of the parent repository's disk space. In this case, the worktree requires about one-third of the original's disk space. This can scale very well. Once your repositories are measured in the gigabytes, you'll really come to appreciate these savings.


```
$ du -sh /Users/olaf/http-browserdetect
2.9M

$ du -sh /Users/olaf/trees/oalders/feature-X
1.0M
```

**Pros:** You can work in multiple workspaces simultaneously. You don't need the stash. Git tracks all of your worktrees. You don't need to set up Git hooks. This is also faster than `git clone` and can save on network traffic since you can do this in airplane mode. You also get more efficient disk space use without needing to resort to a shallow clone.

**Cons:** This is yet another thing to remember. However, if you can get into the habit of using this feature, it can reward you handsomely.

### A few more tips

When you need to clean up your worktrees, you have a couple of options. The preferable way is to let Git remove the worktree:


```
`git worktree remove /Users/olaf/trees/oalders/feature-X`
```

If you prefer a scorched-earth approach, `rm -rf` is also your friend:


```
`rm -rf /Users/olaf/trees/oalders/feature-X`
```

However, if you do this, you may want to clean up any remaining files with `git worktree prune`. Or you can skip the `prune` now, and this will happen on its own at some point in the future via `git gc`.

### Notable notes

If you're ready to get started with `git worktree`, here are a few things to keep in mind.

  * Removing a worktree does not delete the branch.
  * You can switch branches within a worktree.
  * You cannot simultaneously check out the same branch in multiple worktrees.
  * Like many other Git commands, `git worktree` needs to be run from inside a repository.
  * You can have many worktrees at once.
  * Create your worktrees from the same local checkout, or they will be agnostic about each other.



### git rev-parse

One final note: When using `git worktree`, your concept of where the root of the repository lives may depend on context. Fortunately, `git rev-parse` allows you to distinguish between the two.

  * To find the parent repository's root: [code]`git rev-parse --git-common-dir`
```
* To find the root of the repository you're in: [code]`git rev-parse --show-toplevel`
```



### Choose the best method for your needs

As in many things, TIMTOWDI (there's more than one way to do it). What's important is that you find a workflow that suits your needs. What your needs are may vary depending on the problem at hand. Maybe you'll occasionally find yourself reaching for `git worktree` as a handy tool in your revision-control toolbelt.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/context-switching-git

作者：[Olaf Alders][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/oalders
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
