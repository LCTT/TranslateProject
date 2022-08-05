[#]: subject: "Delete the local reference to a remote branch in Git"
[#]: via: "https://opensource.com/article/22/8/delete-local-reference-remote-branch-git"
[#]: author: "Agil Antony https://opensource.com/users/agantony"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Delete the local reference to a remote branch in Git
======
Follow a few simple steps to keep your Git repository tidy.

![A diagram of a branching process][1]

Image by: Opensource.com

After you merge a GitLab or GitHub pull request, you usually delete the topic branch in the remote repository to maintain repository hygiene. However, this action deletes the topic branch only in the remote repository. Your local Git repository also benefits from routine cleanup.

To synchronize the information in your local repository with the remote repository, you can execute the `git prune` command to delete the local reference to a remote branch in your local repository.

Follow these three simple steps:

### 1. Checkout the central branch of your repository (such as main or master)

```
$ git checkout <central_branch_name>
```

### 2. List all the remote and local branches

```
$ git branch -a
```

Example output:

```
4.10.z
* master
  remotes/mydata/4.9-stage
  remotes/mydata/4.9.z
  remotes/mydata/test-branch
```

In this example, `test-branch` is the name of the topic branch that you deleted in the remote repository.

### 3. Delete the local reference to the remote branch

First, list all the branches that you can delete or prune on your local repository:

```
$ git remote prune origin --dry-run
```

Example output:

```
Pruning origin
URL: git@example.com:myorg/mydata-4.10.git
* [would prune] origin/test-branch
```

Next, prune the local reference to the remote branch:

```
$ git remote prune origin
```

Example output:

```
Pruning origin
URL: git@example.com:myorg/mydata-4.10.git
* [pruned] origin/test-branch
```

That's it!

### Maintaining your Git repository

Keeping your Git repository tidy may not seem urgent at first, but the more a repository grows, the more important it becomes to prune unnecessary data. Don't slow yourself down by forcing yourself to sift through data you no longer need.

Regularly deleting local references to remote branches is a good practice for maintaining a usable Git repository.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/delete-local-reference-remote-branch-git

作者：[Agil Antony][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/agantony
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/freesoftwareway_law3.png
