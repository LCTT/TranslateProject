[#]: subject: (What is Git cherry-picking?)
[#]: via: (https://opensource.com/article/21/4/cherry-picking-git)
[#]: author: (Rajeev Bera https://opensource.com/users/acompiler)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What is Git cherry-picking?
======
Learn the what, why, and how of the git cherry-pick command.
![Measuring and baking a cherry pie recipe][1]

Whenever you're working with a group of programmers on a project, whether small or large, handling changes between multiple Git branches can become difficult. Sometimes, instead of combining an entire Git branch into a different one, you want to select and move a couple of specific commits. This procedure is known as "cherry-picking."

This article will cover the what, why, and how of cherry-picking.

So let's start.

### What is cherry-pick?

With the `cherry-pick` command, Git lets you incorporate selected individual commits from any branch into your current [Git HEAD][2] branch.

When performing a `git merge` or `git rebase`, all the commits from a branch are combined. The `cherry-pick` command allows you to select individual commits for integration.

### Benefits of cherry-pick

The following situation might make it easier to comprehend the way cherry-picking functions.

Imagine you are implementing new features for your upcoming weekly sprint. When your code is ready, you will push it into the remote branch, ready for testing.

However, the customer is not delighted with all of the modifications and requests that you present only certain ones. Because the client hasn't approved all changes for the next launch, `git rebase` wouldn't create the desired results. Why? Because `git rebase` or `git merge` will incorporate every adjustment from the last sprint.

Cherry-picking is the answer! Because it focuses only on the changes added in the commit, cherry-picking brings in only the approved changes without adding other commits.

There are several other reasons to use cherry-picking:

  * It is essential for bug fixing because bugs are set in the development branch using their commits.
  * You can avoid unnecessary battles by using `git cherry-pick` instead of other options that apply changes in the specified commits, e.g., `git diff`.
  * It is a useful tool if a full branch unite is impossible because of incompatible versions in the various Git branches.



### Using the cherry-pick command

In the `cherry-pick` command's simplest form, you can just use the [SHA][3] identifier for the commit you want to integrate into your current HEAD branch.

To get the commit hash, you can use the `git log` command:


```
`$ git log --oneline`
```

Once you know the commit hash, you can use the `cherry-pick` command.

The syntax is:


```
`$ git cherry-pick <commit sha>`
```

For example:


```
`$ git cherry-pick 65be1e5`
```

This will dedicate the specified change to your currently checked-out branch.

If you'd like to make further modifications, you can also instruct Git to add commit changes to your working copy.

The syntax is:


```
`$ git cherry-pick <commit sha> --no-commit`
```

For example:


```
`$ git cherry-pick 65be1e5 --no-commit`
```

If you would like to select more than one commit simultaneously, add their commit hashes separated by a space:


```
`$ git cherry-pick hash1 hash3`
```

When cherry-picking commits, you can't use the `git pull` command because it fetches _and_ automatically merges commits from one repository into another. The `cherry-pick` command is a tool you use to specifically not do that; instead, use `git fetch`, which fetches commits but does not apply them. There's no doubt that `git pull` is convenient, but it's imprecise.

### Try it yourself

To try the process, launch a terminal and generate a sample project:


```
$ mkdir fruit.git
$ cd fruit.git
$ git init .
```

Create some data and commit it:


```
$ echo "Kiwifruit" &gt; fruit.txt
$ git add fruit.txt
$ git commit -m 'First commit'
```

Now, represent a remote developer by creating a fork of your project:


```
$ mkdir ~/fruit.fork
$ cd !$
$ echo "Strawberry" &gt;&gt; fruit.txt
$ git add fruit.txt
$ git commit -m 'Added a fruit"
```

That's a valid commit. Now, create a bad commit to represent something you wouldn't want to merge into your project:


```
$ echo "Rhubarb" &gt;&gt; fruit.txt
$ git add fruit.txt
$ git commit -m 'Added a vegetable that tastes like a fruit"
```

Return to your authoritative repo and fetch the commits from your imaginary developer:


```
$ cd ~/fruit.git
$ git remote add dev ~/fruit.fork
$ git fetch dev
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 6 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (6/6), done...

[/code] [code]

$ git log –oneline dev/master
e858ab2 Added a vegetable that tastes like a fruit
0664292 Added a fruit
b56e0f8 First commit
```

You've fetched the commits from your imaginary developer, but you haven't merged them into your repository yet. You want to accept the second commit but not the third, so use `cherry-pick`:


```
`$ git cherry-pick 0664292`
```

The second commit is now in your repository:


```
$ cat fruit.txt
Kiwifruit
Strawberry
```

Push your changes to your remote server, and you're done!

### Reasons to avoid cherry-picking

Cherry-picking is usually discouraged in the developer community. The primary reason is that it creates duplicate commits, but you also lose the ability to track your commit history.

If you're cherry-picking a lot of commits out of order, those commits will be recorded in your branch, and it might lead to undesirable results in your Git branch.

Cherry-picking is a powerful command that might cause problems if it's used without a proper understanding of what might occur. However, it may save your life (or at least your day job) when you mess up and make commits to the wrong branches.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/cherry-picking-git

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/pictures/cherry-picking-recipe-baking-cooking.jpg?itok=XVwse6hw (Measuring and baking a cherry pie recipe)
[2]: https://acompiler.com/git-head/
[3]: https://en.wikipedia.org/wiki/Secure_Hash_Algorithms
