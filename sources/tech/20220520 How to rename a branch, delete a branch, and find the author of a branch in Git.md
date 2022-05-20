[#]: subject: "How to rename a branch, delete a branch, and find the author of a branch in Git"
[#]: via: "https://opensource.com/article/22/5/git-branch-rename-delete-find-author"
[#]: author: "Agil Antony https://opensource.com/users/agantony"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to rename a branch, delete a branch, and find the author of a branch in Git
======
Become an expert at the most common Git tasks for managing local and remote branches.

![tree branches][1]
Image by [Erik Fitzpatrick][2], [CC BY-SA 4.0][3]

One of Git's primary strengths is its ability to "fork" work into different branches.

If you're the only person using a repository, the benefits are modest, but once you start working with many other contributors, branching is essential. Git's branching mechanism allows multiple people to work on a project, and even on the same file, at the same time. Users can introduce different features, independent of one another, and then merge the changes back to a main branch later. A branch created specifically for one purpose, such as adding a new feature or fixing a known bug, is sometimes called a topic branch.

Once you start working with branches, it's helpful to know how to manage them. Here are the most common tasks developers do with Git branches in the real world.

### Rename a branch using Git

Renaming a topic branch is useful if you have named a branch incorrectly or you want to use the same branch to switch between different bugs or tasks after merging the content into the main branch.

#### Rename a local branch

1. Rename the local branch:

```
$ git branch -m <old_branch_name> <new_branch_name>
```

Of course, this only renames your copy of the branch. If the branch exists on the remote Git server, continue to the next steps.

2. Push the new branch to create a new remote branch:

```
$ git push origin <new_branch_name>
```

3. Delete the old remote branch:

```
$ git push origin -d -f <old_branch_name>
```

#### Rename the current branch

When the branch you want to rename is your current branch, you don't need to specify the existing branch name.

1. Rename the current branch:

```
$ git branch -m <new_branch_name>
```

2. Push the new branch to create a new remote branch:

```
$ git push origin <new_branch_name>
```

3. Delete the old remote branch:

```
$ git push origin -d -f <old_branch_name>
```

### Delete local and remote branches using Git

As part of good repository hygiene, it's often recommended that you delete a branch after ensuring you have merged the content into the main branch.

#### Delete a local branch

Deleting a local branch only deletes the copy of that branch that exists on your system. If the branch has already been pushed to the remote repository, it remains available to everyone working with the repo.

1. Checkout the central branch of your repository (such as main or master):

```
$ git checkout <central_branch_name>
```

2. List all the branches (local as well as remote):

```
$ git branch -a
```

3. Delete the local branch:

```
$ git branch -d <name_of_the_branch>
```

To remove all your local topic branches and retain only the *main* branch:

```
$ git branch | grep -v main | xargs git branch -d
```

#### Delete a remote branch

Deleting a remote branch only deletes the copy of that branch that exists on the remote server. Should you decide that you didn't want to delete the branch after all, you can re-push it to the remote, such as GitHub, as long as you still have your local copy.

1. Checkout the central branch of your repository (usually main or master):

```
$ git checkout <central_branch_name>
```

2. List all branches (local as well as remote):

```
$ git branch -a
```

3. Delete the remote branch:

```
$ git push origin -d <name_of_the_branch>
```

### Find the author of a remote topic branch using Git

If you are the repository manager, you might need to do this so you can inform the author of an unused branch that it should be deleted.

1. Checkout the central branch of your repository (such as main or master):

```
$ git checkout <central_branch_name>
```

2. Delete branch references to remote branches that do not exist:

```
$ git remote prune origin
```

3. List the author of all the remote topic branches in the repository, using the `--format` option along with special selectors (in this example, `%(authorname)` and `%(refname)` for author and branch name) to print just the information you want:

```
$ git for-each-ref --sort=authordate --format='%(authorname) %(refname)' refs/remotes
```

Example output:

```
tux  refs/remotes/origin/dev
agil refs/remotes/origin/main
```

You can add further formatting, including color coding and string manipulation, for easier readability:

```
$ git for-each-ref --sort=authordate \
--format='%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)%(align:25,left)%(color:yellow) %(authorname)%(end)%(color:reset)%(refname:strip=3)' \
refs/remotes
```

Example output:

```
01/16/2019 03:18 PM tux      dev
05/15/2022 10:35 PM agil     main
```

You can use grep to get the author of a specific remote topic branch:

```
$ git for-each-ref --sort=authordate \
--format='%(authorname) %(refname)' \
refs/remotes | grep <topic_branch_name>
```

### Get good at branching

There are nuances to how Git branching works depending on the point at which you want to fork the code base, how the repository maintainer manages branches, squashing, rebasing, and so on. Here are three articles for further reading on this topic:

* [Explaining Git branches with a LEGO analogy][4], by Seth Kenlon
* [My guide to using the Git push command safely][5], by Noaa Barki
* [A guide to Git branching][6], by Kedar Vijay Kulkarni

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/git-branch-rename-delete-find-author

作者：[Agil Antony][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/agantony
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/tree-branches.jpg
[2]: https://www.flickr.com/photos/22244945@N00/3353319002
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/22/4/git-branches
[5]: https://opensource.com/article/22/4/git-push
[6]: https://opensource.com/article/18/5/git-branching
