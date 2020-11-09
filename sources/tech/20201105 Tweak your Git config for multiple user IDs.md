[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tweak your Git config for multiple user IDs)
[#]: via: (https://opensource.com/article/20/10/git-config)
[#]: author: (Ramanathan M https://opensource.com/users/muthiahramanathan)

Tweak your Git config for multiple user IDs
======
Use the same machine for your work and personal Git commits without
manually resetting your config.
![Chat via email][1]

Git's [git config][2] command (hereafter referred to as "config") enables you to set repository or global options for Git. It has many options, and one of them, `includeIf`, is handy when you have dual roles using Git, for example, working full time as a developer and contributing to open source projects in your spare time. Most people in this situation don't want to use a common config for both roles or, at the very least, would rather keep certain portions of their config distinct, especially if they use the same computer in both roles.

This is my situation, so I keep two separate sets of mail IDs as part of my Git config. This way, commits in repositories related to projects at my workplace carry my office mail ID, whereas the commits made to repositories hosted in my personal GitHub account use my personal mail ID.

To illustrate, here is a sample snippet from my global config (maintained at `$HOME/.gitconfig`), which I will describe below.


```
[includeIf "gitdir:~/priv_scm/"]
        path = ~/priv_scm/.gitconfig
[includeIf "gitdir:~/work_scm/"]
        path = ~/work_scm/.gitconfig
```

### What's includeIf?

The `includeIf.condition.path` variable, part of the `include` config directives, allows you to set a custom config conditionally. Also, the path to the custom config can be set as part of the directive.

This directive supports three keywords: `gitdir`, `gitdir/I`, and `onbranch`. I will briefly explain `gitdir`, which I use in the code snippet above; you can learn about the other two in the [docs][3].

Using the `gitdir` keyword in the `includeIf` directive causes a conditional check to be performed on the pattern. Per the rule, if the current working directory matches the specified directory pattern in `gitdir`, then it picks the config from the given path. I'll apply this rule on the config snippet to show how it's evaluated.

In the config snippet, you can see a simple pattern, `~/`, used along with the `gitdir` keyword. This pattern is substituted with the value stored in the `$HOME` environment variable.

### How to use it

If you're using the same system to work on open source projects hosted on GitHub or GitLab and committing to Git repositories at work, you can have two top-level directories, like `$HOME/priv_scm` and `$HOME/work_scm`. Within these two directories, you can have two separate `.gitconfig` files with settings related to your `user.name` and `user.email`. However, they can also be included in a global `.gitconfig` stored at `$HOME` that can hold all the customizations common to both environments.

Here is a snippet of an example `$HOME/priv_scm/.gitconfig`:


```
$ cat $HOME/priv_scm/.gitconfig
[user]
    name  = Ramanathan Muthiah
    email = &lt;personal-mailid-goes-here&gt;
```

With this config in place, you can switch directories and start working on open source projects without resetting some of the config related to Git manually. These changes are handled automatically in the main `.gitconfig` with the aid of the `includeIf` conditional directive.

### Git tips

I hope this tip helps you organize your Git projects. What are your favorite Git tips? Share them in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/git-config

作者：[Ramanathan M][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/muthiahramanathan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://git-scm.com/docs/git-config
[3]: https://git-scm.com/docs/git-config#_conditional_includes
