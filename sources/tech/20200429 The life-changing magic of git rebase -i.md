[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The life-changing magic of git rebase -i)
[#]: via: (https://opensource.com/article/20/4/git-rebase-i)
[#]: author: (Dave Neary https://opensource.com/users/dneary)

The life-changing magic of git rebase -i
======
Make everyone think you write perfect code the first time (and make your
patches easier to review and merge).
![Hands programming][1]

Software development is messy. So many wrong turns, typos to fix, quick hacks and kludges to correct later, off-by-one errors you find late in the process. With version control, you have a pristine record of every wrong turn and correction made during the process of creating the "perfect" final product—a patch ready to submit upstream. Like the outtakes from movies, they are a little embarrassing and sometimes amusing.

Wouldn't it be great if you could use version control to save your work regularly at waypoints, and then when you have something you are ready to submit for review, you could hide all of that private drafting work and just submit a single, perfect patch? Meet **git rebase -i**, the perfect way to rewrite history and make everyone think that you produce perfect code the first time!

### What does git rebase do?

In case you're not familiar with the intricacies of Git, here is a brief overview. Under the covers, Git associates different versions of your project with a unique identifier, which is made up of a hash of the parent node's unique identifier, and the difference between the new version and its parent node. This creates a tree of revisions, and each person who checks out the project gets their own copy. Different people can take the project in different directions, each starting from potentially different branch points.

![Master branch vs. private branch][2]

The master branch in the "origin" repo on the left and the private branch on your personal copy on the right.

There are two ways to integrate your work back with the master branch in the original repository: one is to use **git merge**, and the other is to use **git rebase**. They work in very different ways.

When you use **git merge**, a new commit is created on the master branch that includes all of the changes from origin plus all of your local changes. If there are any conflicts (for example, if someone else has changed a file you are also working with), these will be marked, and you have an opportunity to resolve the conflicts before committing this merge commit to your local repository. When you push your changes back to the parent repository, all of your local work will appear as a branch for other users of the Git repository.

But **git rebase** works differently. It rewinds your commits and replays those commits again from the tip of the master branch. This results in two main changes. First, since your commits are now branching off a different parent node, their hashes will be recalculated, and anyone who has cloned your repository may now have a broken copy of the repository. Second, you do not have a merge commit, so any merge conflicts are identified as your changes are being replayed onto the master branch, and you need to fix them before proceeding with the rebase. When you push your changes now, your work does not appear on a branch, and it looks as though you wrote all of your changes off the very latest commit to the master branch.

![Merge commits preserve history, and rebase rewrites history.][3]

Merge commits (left) preserve history, while rebase (right) rewrites history.

However, both of these options come with a downside: everyone can see all your scribbles and edits as you worked through problems locally before you were ready to share your code. This is where the **\--interactive** (or **-i** for short) flag to **git rebase** comes into the picture.

### Introducing git rebase -i

The big advantage of **git rebase** is that it rewrites history. But why stop at just pretending you branched off a later point? There is a way to go even further and rewrite how you arrived at your ready-to-propose code: **git rebase -i**, an interactive **git rebase**.

This feature is the "magic time machine" function in Git. The flag allows you to make sophisticated changes to revision history while doing a rebase. You can hide your mistakes! Merge many small changes into one pristine feature patch! Reorder how things appear in revision history!

![output of git rebase -i][4]

When you run **git rebase -i**, you get an editor session listing all of the commits that are being rebased and a number of options for what you can do to them. The default choice is **pick**.

  * **Pick** maintains the commit in your history.
  * **Reword** allows you to change a commit message, perhaps to fix a typo or add additional commentary.
  * **Edit** allows you to make changes to the commit while in the process of replaying the branch.
  * **Squash** merges multiple commits into one.
  * You can reorder commits by moving them around in the file.



When you are finished, simply save the final result, and the rebase will execute. At each stage where you have chosen to modify a commit (either with **reword**, **edit**, **squash**, or when there is a conflict), the rebase stops and allows you to make the appropriate changes before continuing.

The example above results in "One-liner bug fix" and "Integrate new header everywhere" being merged into one commit, and "New header for docs website" and "D'oh - typo. Fixed" into another. Like magic, the work that went into the other commits is still there on your branch, but the associated commits have disappeared from your history!

This makes it easy to submit a clean patch to an upstream project using **git send-email** or by creating a pull request against the parent repository with your newly tidied up patchset. This has a number of advantages, including that it makes your code easier to review, easier to accept, and easier to merge.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/git-rebase-i

作者：[Dave Neary][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dneary
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/sites/default/files/uploads/master-private-branches.png (Master branch vs. private branch)
[3]: https://opensource.com/sites/default/files/uploads/merge-commit-vs-rebase.png (Merge commits preserve history, and rebase rewrites history.)
[4]: https://opensource.com/sites/default/files/uploads/git-rebase-i.png (output of git rebase -i)
