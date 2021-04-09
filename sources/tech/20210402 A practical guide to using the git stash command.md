[#]: subject: (A practical guide to using the git stash command)
[#]: via: (https://opensource.com/article/21/4/git-stash)
[#]: author: (Ramakrishna Pattnaik https://opensource.com/users/rkpattnaik780)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A practical guide to using the git stash command
======
Learn how to use the git stash command and when you should use it.
![woman on laptop sitting at the window][1]

Version control is an inseparable part of software developers' daily lives. It's hard to imagine any team developing software without using a version control tool. It's equally difficult to envision any developer who hasn't worked with (or at least heard of) Git. In the 2018 Stackoverflow Developer Survey, 87.2% of the 74,298 participants [use Git][2] for version control.

Linus Torvalds created git in 2005 for developing the Linux kernel. This article walks through the `git stash` command and explores some useful options for stashing changes. It assumes you have basic familiarity with [Git concepts][3] and a good understanding of the working tree, staging area, and associated commands.

### Why is git stash important?

The first thing to understand is why stashing changes in Git is important. Assume for a moment that Git doesn't have a command to stash changes. Suppose you are working on a repository with two branches, A and B. The A and B branches have diverged from each other for quite some time and have different heads. While working on some files in branch A, your team asks you to fix a bug in branch B. You quickly save your changes to A and try to check out branch B with `git checkout B`. Git immediately aborts the operation and throws the error, "Your local changes to the following files would be overwritten by checkout … Please commit your changes or stash them before you switch branches."

There are few ways to enable branch switching in this case:

  * Create a commit at that point in branch A, commit and push your changes to fix the bug in B, then check out A again and run `git reset HEAD^` to get your changes back.
  * Manually keep the changes in files not tracked by Git.



The second method is a bad idea. The first method, although appearing conventional, is less flexible because the unfinished saved changes are treated as a checkpoint rather than a patch that's still a work in progress. This is exactly the kind of scenario git stash is designed for.

Git stash saves the uncommitted changes locally, allowing you to make changes, switch branches, and perform other Git operations. You can then reapply the stashed changes when you need them. A stash is locally scoped and is not pushed to the remote by `git push`.

### How to use git stash

Here's the sequence to follow when using git stash:

  1. Save changes to branch A.
  2. Run `git stash`.
  3. Check out branch B.
  4. Fix the bug in branch B.
  5. Commit and (optionally) push to remote.
  6. Check out branch A
  7. Run `git stash pop` to get your stashed changes back.



Git stash stores the changes you made to the working directory locally (inside your project's .git directory; `/.git/refs/stash`, to be precise) and allows you to retrieve the changes when you need them. It's handy when you need to switch between contexts. It allows you to save changes that you might need at a later stage and is the fastest way to get your working directory clean while keeping changes intact.

### How to create a stash

The simplest command to stash your changes is `git stash`:


```
$ git stash
Saved working directory and index state WIP on master; d7435644 Feat: configure graphql endpoint
```

By default, `git stash` stores (or "stashes") the uncommitted changes (staged and unstaged files) and overlooks untracked and ignored files. Usually, you don't need to stash untracked and ignored files, but sometimes they might interfere with other things you want to do in your codebase.

You can use additional options to let `git stash` take care of untracked and ignored files:

  * `git stash -u` or `git stash --include-untracked` stash untracked files.
  * `git stash -a` or `git stash --all` stash untracked files and ignored files.



To stash specific files, you can use the command `git stash -p` or `git stash –patch`:


```
$ git stash --patch
diff --git a/.gitignore b/.gitignore
index 32174593..8d81be6e 100644
\--- a/.gitignore
+++ b/.gitignore
@@ -3,6 +3,7 @@
 # dependencies
 node_modules/
 /.pnp
+f,fmfm
 .pnp.js

 # testing
(1/1) Stash this hunk [y,n,q,a,d,e,?]?
```

### Listing your stashes

You can view your stashes with the command `git stash list`. Stashes are saved in a last-in-first-out (LIFO) approach:


```
$ git stash list
stash@{0}: WIP on master: d7435644 Feat: configure graphql endpoint
```

By default, stashes are marked as WIP on top of the branch and commit that you created the stash from. However, this limited amount of information isn't helpful when you have multiple stashes, as it becomes difficult to remember or individually check their contents. To add a description to the stash, you can use the command `git stash save <description>`:


```
$ git stash save "remove semi-colon from schema"
Saved working directory and index state On master: remove semi-colon from schema

$ git stash list
stash@{0}: On master: remove semi-colon from schema
stash@{1}: WIP on master: d7435644 Feat: configure graphql endpoint
```

### Retrieving stashed changes

You can reapply stashed changes with the commands `git stash apply` and `git stash pop`. Both commands reapply the changes stashed in the latest stash (that is, `stash@{0}`). A `stash` reapplies the changes while `pop` removes the changes from the stash and reapplies them to the working copy. Popping is preferred if you don't need the stashed changes to be reapplied more than once.

You can choose which stash you want to pop or apply by passing the identifier as the last argument:


```
`$ git stash pop stash@{1}`
```

or


```
`$ git stash apply stash@{1}`
```

### Cleaning up the stash

It is good practice to remove stashes that are no longer needed. You must do this manually with the following commands:

  * `git stash clear` empties the stash list by removing all the stashes.
  * `git stash drop <stash_id>` deletes a particular stash from the stash list.



### Checking stash diffs

The command `git stash show <stash_id>` allows you to view the diff of a stash:


```
$ git stash show stash@{1}
console/console-init/ui/.graphqlrc.yml        |   4 +-
console/console-init/ui/generated-frontend.ts | 742 +++++++++---------
console/console-init/ui/package.json          |   2 +-
```

To get a more detailed diff, pass the `--patch` or `-p` flag:


```
$ git stash show stash@{0} --patch
diff --git a/console/console-init/ui/package.json b/console/console-init/ui/package.json
index 755912b97..5b5af1bd6 100644
\--- a/console/console-init/ui/package.json
+++ b/console/console-init/ui/package.json
@@ -1,5 +1,5 @@
 {
\- "name": "my-usepatternfly",
\+ "name": "my-usepatternfly-2",
  "version": "0.1.0",
  "private": true,
  "proxy": "<http://localhost:4000>"
diff --git a/console/console-init/ui/src/AppNavHeader.tsx b/console/console-init/ui/src/AppNavHeader.tsx
index a4764d2f3..da72b7e2b 100644
\--- a/console/console-init/ui/src/AppNavHeader.tsx
+++ b/console/console-init/ui/src/AppNavHeader.tsx
@@ -9,8 +9,8 @@ import { css } from "@patternfly/react-styles";

interface IAppNavHeaderProps extends PageHeaderProps {
\- toolbar?: React.ReactNode;
\- avatar?: React.ReactNode;
\+ toolbar?: React.ReactNode;
\+ avatar?: React.ReactNode;
}

export class AppNavHeader extends React.Component&lt;IAppNavHeaderProps&gt;{
  render()
```

### Checking out to a new branch

You might come across a situation where the changes in a branch and your stash diverge, causing a conflict when you attempt to reapply the stash. A clean fix for this is to use the command `git stash branch <new_branch_name stash_id>`, which creates a new branch based on the commit the stash was created _from_ and pops the stashed changes to it:


```
$ git stash branch test_2 stash@{0}
Switched to a new branch 'test_2'
On branch test_2
Changes not staged for commit:
(use "git add &lt;file&gt;..." to update what will be committed)
(use "git restore &lt;file&gt;..." to discard changes in working directory)
modified: .graphqlrc.yml
modified: generated-frontend.ts
modified: package.json
no changes added to commit (use "git add" and/or "git commit -a")
Dropped stash@{0} (fe4bf8f79175b8fbd3df3c4558249834ecb75cd1)
```

### Stashing without disturbing the stash reflog

In rare cases, you might need to create a stash while keeping the stash reference log (reflog) intact. These cases might arise when you need a script to stash as an implementation detail. This is achieved by the `git stash create` command; it creates a stash entry and returns its object name without pushing it to the stash reflog:


```
$ git stash create "sample stash"
63a711cd3c7f8047662007490723e26ae9d4acf9
```

Sometimes, you might decide to push the stash entry created via `git stash create` to the stash reflog:


```
$ git stash store -m "sample stash testing.." "63a711cd3c7f8047662007490723e26ae9d4acf9"
$ git stash list
stash @{0}: sample stash testing..
```

### Conclusion

I hope you found this article useful and learned something new. If I missed any useful options for using stash, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-stash

作者：[Ramakrishna Pattnaik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rkpattnaik780
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://insights.stackoverflow.com/survey/2018#work-_-version-control
[3]: https://opensource.com/downloads/cheat-sheet-git
