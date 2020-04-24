[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Git scripts I can't live without)
[#]: via: (https://opensource.com/article/20/4/git-extras)
[#]: author: (Vince Power https://opensource.com/users/vincepower)

4 Git scripts I can't live without
======
The Git Extras repo hosts more than 60 scripts that add to Git's basic
functionality. Here's how to install, use, and contribute to it.
![Person using a laptop][1]

In 2005, [Linus Torvalds][2] created [Git][3] to replace the proprietary distributed source control management solution that he had previously used to maintain the Linux kernel. Since then, Git has become a dominant version-control solution for open source and cloud-native development teams.

Even feature-rich applications like Git don't have every feature that people want or need, so they make the effort to create them. In the case of Git, that person would be [TJ Holowaychuk][4]. His [Git Extras][5] project hosts more than 60 "extras" with features that expand Git's basic functionality.

### Using Git Extras

Here's how to use four of the most popular Git Extras.

#### git-ignore

git-ignore is a convenient extra that allows you to manually add file types and comments to the **.git-ignore** file without having to open a text editor. It works with both the global ignore file for your user account and the individual ignore file for the repository you are working in.

Executing git-ignore without a parameter will list the global ignore file first, then the local ignore files.


```
$ git ignore
Global gitignore: /home/alice/.gitignore
# Numerous always-ignore extensions
*.diff
*.err
*.orig
*.rej
*.swo
*.swp
*.vi
*~
*.sass-cache

# OS or Editor folders
Thumbs.db
\---------------------------------
Local gitignore: .gitignore
nbproject
```

#### git-info

git-info retrieves all the information you need to get your head in the context of a repo you are working with. It includes any remote URLs, remote branches, local branches, configuration info, and the last commit.


```
$ git info

## Remote URLs:

origin      [git@github.com][6]:sampleAuthor/git-extras.git (fetch)
origin      [git@github.com][6]:sampleAuthor/git-extras.git (push)

## Remote Branches:

origin/HEAD -&gt; origin/master
origin/myBranch

## Local Branches:

myBranch
* master

## Most Recent Commit:

commit e3952df2c172c6f3eb533d8d0b1a6c77250769a7
Author: Sample Author &lt;[sampleAuthor@gmail.com][7]&gt;

Added git-info command.

Type ´git log´ for more commits, or ´git show &lt;commit id&gt;´ for full commit details.

## Configuration (.git/config):

color.diff=auto
color.status=auto
color.branch=auto
user.name=Sample Author
user.email=[sampleAuthor@gmail.com][7]
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
remote.origin.url=[git@github.com][6]:mub/git-extras.git
branch.master.remote=origin
branch.master.merge=refs/heads/master
```

#### git-mr and git-pr

These extras do similar things and work in basically the same way.

  * git-mr checks out a merge request from GitLab
  * git-pr checks out a pull request on GitHub



In either case, you just need the merge or pull request number or the full URL, and it will fetch the remote reference, check out the branch, and adjust the config, so Git knows which branch it will replace.


```
$ git mr 51
From gitlab.com:owner/repository
 * [new ref]         refs/merge-requests/51/head -&gt; mr/51
Switched to branch 'mr/51'
```

#### git-release

By combining **commit**, **tag**, and **push** into a single command, git-release saves a lot of keystrokes for executing three commands that often run in sequence.

To commit with a specific **&lt;tagname&gt;** and a custom message:


```
`$ git release 0.1.0 -m <+ powerful feature added>`
```

#### Other extras

These are just four of the 60+ Git Extras in the repo. To access the full list of commands available in Git Extras, either review the [Commands.md][8] file in the source repository or run the following command after you install Git Extras.


```
`$ git extras --help`
```

### Install Git Extras

The main prerequisite for Git Extras is having the command-line version of Git installed. If you plan to build from source, you also need additional utilities (e.g., **make**) to be available.

If you are using a recent version of macOS, Git Extras installation is best handled using [Homebrew][9] (as with most open source tools):


```
`$ brew install git-extras`
```

On Linux, Git Extras is available on each platform's native package manager. Sometimes, you need to enable an extra repository, like [EPEL][10] on CentOS, then run a single command:


```
`$ sudo yum install git-extras`
```

Full installation instructions for other Linux distributions, BSD, and other platforms are available in the [Installation.md][11] file in the repository.

### Contributing

Do you have a piece of functionality you think is missing from Git and have built or want to build a script to handle it? Why not share it with the world by making it part of the Git Extras distribution!

To do so, contribute the functionality to the Git Extras repository. There are more specific details in the [CONTRIBUTING.md][12] file in the repository, but the basics are easy:

  1. Create a Bash script that handles the functionality.
  2. Create a basic man file so people will know how to use it.
  3. Update the command list and completion scripts to let people know the functionality exists.
  4. Run the integrity check to make sure you didn't break anything.
  5. Create a pull request for your functionality.



Contributing to Git Extras will go a long way towards making life a little easier for your fellow Git users. You can learn more about it in the project's [README][13].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/git-extras

作者：[Vince Power][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vincepower
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://en.wikipedia.org/wiki/Linus_Torvalds
[3]: https://git-scm.com/
[4]: https://github.com/tj
[5]: https://github.com/tj/git-extras
[6]: mailto:git@github.com
[7]: mailto:sampleAuthor@gmail.com
[8]: https://github.com/tj/git-extras/blob/master/Commands.md
[9]: https://brew.sh/
[10]: https://fedoraproject.org/wiki/EPEL
[11]: https://github.com/tj/git-extras/blob/master/Installation.md
[12]: https://github.com/tj/git-extras/blob/master/CONTRIBUTING.md
[13]: https://github.com/tj/git-extras/blob/master/Readme.md
