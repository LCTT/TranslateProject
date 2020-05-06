[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing Git projects with submodules and subtrees)
[#]: via: (https://opensource.com/article/20/5/git-submodules-subtrees)
[#]: author: (Manaswini Das https://opensource.com/users/manaswinidas)

Managing Git projects with submodules and subtrees
======
Submodules and subtrees help you manage child projects across multiple
repositories.
![Digital creative of a browser on the internet][1]

If you are into open source development, you have probably worked with Git to manage source code. You might have come across projects with numerous dependencies and/or sub-projects. How do you manage them?

For an open source organization, it can be tricky to achieve single-source documentation and dependency management for the community _and_ the product. The documentation and project often end up fragmented and redundant, which makes them difficult to maintain.

### The need

Suppose you want to use a single project as a child project inside a repository. The traditional method is just to copy the project to the parent repository. But, what if you want to use the same child project in many parent repositories? It wouldn't be feasible to copy the child project into every parent and have to make changes in all of them whenever you update it. This would create redundancy and inconsistency in the parent repositories and make it difficult to update and maintain the child project.

### Git submodules and subtrees

What if you could put one project within another using a single command? What if you could just add the project as a child to any number of projects and push changes on the go, whenever you want to? Git provides solutions for this: Git submodules and Git subtrees. These tools were created to support code-sharing development workflows on a more modular level, aspiring to bridge the gap between the Git repository's source-code management (SCM) and the sub-repos within it.

![Cherry tree growing on a mulberry tree][2]

Cherry tree growing on a mulberry tree

This is a real-life scenario of the concepts this article will cover in detail. If you're already familiar with trees, here is what this model will look like:

![Tree with subtrees][3]

CC BY-SA opensource.com

### What are Git submodules?

Git provides submodules in its default package that enable Git repositories to be nested within other repositories. To be precise, the Git submodule points to a specific commit on the child repository. Here is what Git submodules look like in my [Docs-test][4] GitHub repo:

![Git submodules screenshot][5]

The format **[folder@commitId][6]** indicates that the repository is a submodule, and you can directly click on the folder to go to the child repository. The config file called **.gitmodules** contains all the submodule repository details. My repo's **.gitmodules** file looks like this:

![Screenshot of .gitmodules file][7]

You can use the following commands to use Git submodules in your repositories.

#### Clone a repository and load submodules

To clone a repository containing submodules:


```
`$ git clone --recursive <URL to Git repo>`
```

If you have already cloned a repository and want to load its submodules:


```
`$ git submodule update --init`
```

If there are nested submodules:


```
`$ git submodule update --init --recursive`
```

#### Download submodules

Downloading submodules sequentially can be a tedious task, so **clone** and **submodule update** will support the **\--jobs** or **-j** parameter.

For example, to download eight submodules at once, use:


```
$ git submodule update --init --recursive -j 8
$ git clone --recursive --jobs 8 &lt;URL to Git repo&gt;
```

#### Pull submodules

Before running or building the parent repository, you have to make sure that the child dependencies are up to date.

To pull all changes in submodules:


```
`$ git submodule update --remote`
```

#### Create repositories with submodules

To add a child repository to a parent repository:


```
`$ git submodule add <URL to Git repo>`
```

To initialize an existing Git submodule:


```
`$ git submodule init`
```

You can also create branches and track commits in your submodules by adding **\--update** to your **submodule update** command:


```
`$ git submodule update --remote`
```

#### Update submodule commits

As explained above, a submodule is a link that points to a specific commit in the child repository. If you want to update the commit of the submodule, don't worry. You don't need to specify the latest commit explicitly. You can just use the general **submodule update** command:


```
`$ git submodule update`
```

Just add and commit as you normally would to create and push the parent repository to GitHub.

#### Delete a submodule from a parent repository

Merely deleting a child project folder manually won't remove the child project from the parent repository. To delete a submodule named **childmodule**, use:


```
`$ git rm -f childmodule`
```

Although Git submodules may appear easy to work with, it can be difficult for beginners to find their way around them.

### What are Git subtrees?

Git subtrees, introduced in Git 1.7.11, allow you to insert a copy of any repository as a subdirectory of another one. It is one of several ways Git projects can inject and manage project dependencies. It stores the external dependencies in regular commits. Git subtrees provide clean integration points, so they're easier to revert.

If you use the [subtrees tutorial provided by GitHub][8] to use subtrees, you won't see a **.gittrees** config file in your local whenever you add a subtree. This makes it difficult to recognize subtrees because subtrees look like general folders, but they are copies of the child repository. The version of Git subtree with the **.gittrees** config file is not available with the default Git package, so to get the git-subtree with **.gittrees** config file, you must download git-subtree from the [**/contrib/subtree** folder][9] in the Git source repository.

You can clone any repository containing subtrees, just like any other general repository, but it may take longer because entire copies of the child repository reside in the parent repository.

You can use the following commands to use Git subtrees in your repositories.

#### Add a subtree to a parent repository

To add a new subtree to a parent repository, you first need to **remote add** it and then run the **subtree add** command, like:


```
$ git remote add remote-name &lt;URL to Git repo&gt;
$ git subtree add --prefix=folder/ remote-name &lt;URL to Git repo&gt; subtree-branchname
```

This merges the whole child project's commit history to the parent repository.

#### Push and pull changes to and from the subtree


```
`$ git subtree push-all`
```

or


```
`$ git subtree pull-all`
```

### Which should you use?

Every tool has pros and cons. Here are some features that may help you decide which is best for your use case.

  * Git submodules have a smaller repository size since they are just links that point to a specific commit in the child project, whereas Git subtrees house the entire child project along with its history.
  * Git submodules need to be accessible in a server, but subtrees are decentralized.
  * Git submodules are mostly used in component-based development, whereas Git subtrees are used in system-based development.



A Git subtree isn't a direct alternative to a Git submodule. There are certain caveats that guide where each can be used. If there is an external repository you own and are likely to push code back to, use Git submodule since it is easier to push. If you have third-party code that you are unlikely to push to, use Git subtree since it is easier to pull.

Give Git subtrees and submodules a try and let me know how it goes in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/git-submodules-subtrees

作者：[Manaswini Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/manaswinidas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/sites/default/files/uploads/640px-bialbero_di_casorzo.jpg (Cherry tree growing on a mulberry tree)
[3]: https://opensource.com/sites/default/files/subtree_0.png (Tree with subtrees)
[4]: https://github.com/manaswinidas/Docs-test/
[5]: https://opensource.com/sites/default/files/uploads/git-submodules_github.png (Git submodules screenshot)
[6]: mailto:folder@commitId
[7]: https://opensource.com/sites/default/files/uploads/gitmodules.png (Screenshot of .gitmodules file)
[8]: https://help.github.com/en/github/using-git/about-git-subtree-merges
[9]: https://github.com/git/git/tree/master/contrib/subtree
