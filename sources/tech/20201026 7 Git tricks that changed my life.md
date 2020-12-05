[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 Git tricks that changed my life)
[#]: via: (https://opensource.com/article/20/10/advanced-git-tips)
[#]: author: (Rajeev Bera https://opensource.com/users/acompiler)

7 Git tricks that changed my life
======
These helpful tips will change the way you work with the popular version
control system.
![Computer screen with files or windows open][1]

Git is one of the most common version control systems available, and it's used on private systems and publicly hosted websites for all kinds of development work. Regardless of how proficient with Git I become, it seems there are always features left to discover. Here are seven tricks that have changed the way I work with Git.

### 1\. Autocorrection in Git

We all make typos sometimes, but if you have Git's auto-correct feature enabled, you can let Git automatically fix a mistyped subcommand.

Suppose you want to check the status with `git status` but you type `git stats` by accident. Under normal circumstances, Git tells you that 'stats' is not a valid command:


```
$ git stats
git: ‘stats’ is not a git command. See ‘git --help’.

The most similar command is
status
```

To avoid similar scenarios, enable Git autocorrection in your Git configuration:


```
`$ git config --global help.autocorrect 1`
```

If you want this to apply only to your current repository, omit the `--global` option.

This command enables the autocorrection feature. An in-depth tutorial is available at [Git Docs][2], but trying the same errant command as above gives you a good idea of what this configuration does:


```
$ git stats
git: ‘stats’ is not a git command. See ‘git --help’.
On branch master
Your branch is up to date with ‘origin/master’.

nothing to commit, working tree clean
```

Instead of suggesting an alternative subcommand, Git now just runs the top suggestion, which in this case was **git status**.

### 2\. Count your commits

There are many reasons you might need to count your commits. Many developers count the number of commits to judge when to increment the build number, for instance, or just to get a feel for how the project is progressing.

To count your commits is really easy and straightforward; here is the Git command:


```
`$ git rev-list --count`
```

In the above command, the **branch-name** should be a valid branch name in your current repository.


```
$ git rev-list –count master
32
$ git rev-list –count dev
34
```

### 3\. Optimize your repo

Your code repository is valuable not only for you but also for your organization. You can keep your repository clean and up to date with a few simple practices. One of the best practices is to [use the .gitignore file][3]. By using this file, you are telling Git not to store many unwanted files like binaries, temporary files, and so on.

To optimize your repository further, you can use Git garbage collection.


```
`$ git gc --prune=now --aggressive`
```

This command helps when you or your team heavily uses **pull** or **push** commands.

This command is an internal utility that cleans up unreachable or "orphaned" Git objects in your repository.

### 4\. Take a backup of untracked files

Most of the time, it's safe to delete all the untracked files. But many times, there is a situation wherein you want to delete, but also to create a backup of your untracked files just in case you need them later.

Git, along with some Bash command piping, makes it easy to create a zip archive for your untracked files.


```
$ git ls-files --others --exclude-standard -z |\
xargs -0 tar rvf ~/backup-untracked.zip
```

The above command makes an archive (and excludes files listed in .gitignore) with the name backup-untracked.zip

### 5\. Know your .git folder

Every repository has a .git folder. It is a special hidden folder.


```
$ ls -a
. … .git
```

Git mainly works with two things:

  1. The working tree (the state of files in your current checkout)
  2. The path of your Git repository (specifically, the location of the .git folder, which contains the versioning information)



This folder stores all references and other important details like configurations, repository data, the state of HEAD, logs, and much more.

If you delete this folder, the current state of your source code is not deleted, but your remote information, such as your project history, is. Deleting this folder means your project (at least, the local copy) isn't under version control anymore. It means you cannot track your changes; you cannot pull or push from a remote.

Generally, there's not much you need to do, or should do, in your .git folder. It's managed by Git and is considered mostly off-limits. However, there are some interesting artifacts in this directory, including the current state of HEAD:


```
$ cat .git/HEAD
ref: refs/heads/master
```

It also contains, potentially, a description of your repository:


```
`$ cat .git/description`
```

This is an unnamed repository; edit this file 'description' to name the repository.

The Git hooks folder is also here, complete with example hook files. You can read these samples to get an idea of what's possible through Git hooks, and you can also [read this Git hook introduction by Seth Kenlon][4].

### 6\. View a file of another branch

Sometimes you want to view the content of the file from another branch. It's possible with a simple Git command, and without actually switching your branch.

Suppose you have a file called [README.md][5], and it's in the **main** branch. You're working on a branch called **dev**.

With the following Git command, you can do it from the terminal.


```
`$ git show main:README.md`
```

Once you execute this command, you can view the content of the file in your terminal.

### 7\. Search in Git

You can search in Git like a pro with one simple command. Better still, you can search in Git even if you aren't sure which commit—or even branch—you made your changes.


```
`$ git rev-list --all | xargs git grep -F ‘’`
```

For example, suppose you want to search for the string "font-size: 52 px;" in your repository:


```
$ git rev-list –all | xargs git grep -F ‘font-size: 52 px;’
F3022…9e12:HtmlTemplate/style.css: font-size: 52 px;
E9211…8244:RR.Web/Content/style/style.css: font-size: 52 px;
```

### Try these tips

I hope these advanced tips are useful and boost your productivity, saving you lots of time.

Do you have [Git tips][6] you love? Share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/advanced-git-tips

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_code_help_autocorrect_code
[3]: https://opensource.com/article/20/8/dont-ignore-gitignore
[4]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[5]: http://README.md
[6]: https://acompiler.com/git-tips/
