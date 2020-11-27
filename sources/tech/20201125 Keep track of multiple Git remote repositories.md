[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Keep track of multiple Git remote repositories)
[#]: via: (https://opensource.com/article/20/11/multiple-git-repositories)
[#]: author: (Peter Portante https://opensource.com/users/portante)

Keep track of multiple Git remote repositories
======
Having consistent naming standards is key to keeping local and upstream
Git repos straight.
![Digital hand surrounding by objects, bike, light bulb, graphs][1]

Working with remote repositories gets confusing when the names of the remote repositories in your local Git repo are inconsistent.

One approach to solving this issue is to standardize the use and meaning of two words: `origin`, referring to your personal `example.com/<USER>/*` repos, and `upstream`, referring to the `example.com` repo from which you forked the `origin` repo. In other words, `upstream` refers to the upstream repo where work is publicly submitted, while `origin` refers to your local fork of the upstream repo from which you generate pull requests (PRs), for example.

Using the [pbench][2] repo as an example, here is a step-by-step approach to set up a new local clone with `origin` and `upstream` defined consistently.

  1. On most Git hosting services, you must fork a project when you want to work on it. When you run your own Git server, that's not necessary, but for a codebase that's open to the public, it's an easy way to transfer diffs among contributors.

Create a fork of a Git repository. For this example, assume your fork is located at `example.com/<USER>/pbench`.

  2. Next, you must obtain a Uniform Resource Identifier ([URI][3]) for cloning over SSH. On most Git hosting services, such as GitLab or GitHub, it's in a button or panel labeled **Clone** or **Clone over SSH**. Copy the clone URI to your clipboard.

  3. On your development system, clone the repo using the text you copied:


```
`$ git clone git@example.com:<USER>/pbench.git`
```

This clones the Git repository with the default name `origin` for your forked copy of the pbench repo.

  4. Change directory to the repo you just cloned:


```
`$ cd ~/pbench`
```

  5. Next, obtain the SSH URI of the source repo (the one you originally forked). This is probably done the same way as above: Find the **Clone** button or panel and copy the clone address. In software development, this is typically referred to as "upstream" because (in theory) this is where most commits happen, and you intend to let those commits flow downstream into your copy of the repository.

  6. Add the URI to your local copy of the repository. Yes, there will be _two different_ remotes assigned to your local copy of the repository:


```
`$ git remote add upstream \ git@example.com:bigproject/pbench.git`
```

  7. You now have two named remote repos: `origin` and `upstream`. You can see your remote repos with the remote subcommand:


```
`$ git remote -v`
```

Right now, your local `master` branch is tracking the `origin` master, which is not necessarily what you want. You probably want to track the `upstream` version of this branch because upstream is where most development takes place. The idea is that you are adding your changes on top of whatever you get from upstream.

  8. Change your local master branch to track `upstream/master`:


```
$ git fetch upstream
$ git branch --set-upstream-to=upstream/master master
```

You can do this for any branch you want, not just `master`. For instance, some projects use a `dev` branch for all unstable changes, reserving `master` for code approved for release.

  9. Once you've set your tracking branches, be sure to `rebase` your master to bring it up to date to any new changes made to the upstream repo:


```
$ git remote update
$ git checkout master
$ git rebase
```




This is a great way to keep your Git repositories synchronized between forks. If you want to automate this, read Seth Kenlon's article on [cohosting Git repositories with Ansible][4] to learn how.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/multiple-git-repositories

作者：[Peter Portante][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/portante
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://github.com/distributed-system-analysis/pbench
[3]: https://en.wikipedia.org/wiki/Uniform_Resource_Identifier
[4]: https://opensource.com/article/19/11/how-host-github-gitlab-ansible
