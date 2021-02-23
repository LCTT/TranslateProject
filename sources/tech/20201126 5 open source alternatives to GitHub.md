[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 open source alternatives to GitHub)
[#]: via: (https://opensource.com/article/20/11/open-source-alternatives-github)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 open source alternatives to GitHub
======
Stay resilient by keeping your open source code in an open source
repository.
![Woman programming][1]

Git is a popular version-control system, primarily used for code but popular in [other disciplines][2], too. It can run locally on your computer for personal use, it can run on a server for collaboration, and it can also run as a hosted service for widespread public participation. There are many hosted services out there, and one of the most popular brands is [GitHub][3].

GitHub is not open source. Pragmatically, this doesn't make much of a difference to most users. The vast majority of code put onto GitHub is, presumably, encouraged to be shared by everyone, so GitHub's primary function is a sort of public backup service. Should GitHub fold or drastically change its terms of service, recovering data would be relatively simple because it's expected that you have a local copy of the code you keep on GitHub. However, some organizations have come to rely on the non-Git parts of GitHub's service offerings, making migration away from GitHub difficult. That's an awkward place to be, so for many people and organizations, insurance against vendor lock-in is a worthwhile investment.

If that's the position you're in, check out these five GitHub alternatives, all of which are open source.

### 1\. GitLab

![GitLab][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

GitLab is more than just a GitHub alternative; it's more like a complete DevOps platform. GitLab is nearly all the infrastructure a software development house requires, as it provides code and project management tools, issue reporting, continuous delivery, and monitoring. You can use GitLab on [GitLab.com][6], or you can download the codebase and run it locally with or without paid support. GitLab has a web interface, but all Git-specific commands work as expected.

GitLab is committed to open source, both in its code and the organization behind it, and to Git itself. The organization publishes much of its business documentation, including [how employees are onboarded][7], their [marketing policies][8], and much more. As a site, GitLab is ardent in promoting Git. When you use a site-specific feature (such as a merge request), GitLab's interface explains how to resolve the request in pure Git, should you prefer to work in the terminal.

### 2\. Gitolite

[Gitolite][9] is quite probably the minimal amount of code required to provide a server administrator a frontend for Git repository management. Unlike GitHub, it has no web interface, no desktop client, and adds nothing to Git from the user perspective. In fact, your users don't really use Gitolite directly. They just use Git, as usual, whether they're used to Git in a terminal or Git in a frontend client like [Git Cola][10].

From the server administrator's perspective, though, Gitolite solves all the permission and access problems you'd have to manage manually if you ran a plain Git server. With Gitolite, you create only one user (for instance, a user called `git`) on your server. You allow your users to use this single login identity to access your Git server, but when they log in, they must deal with your Git server through Gitolite. It's Gitolite that verifies users' access permissions, manages their SSH keys, verifies their privilege level when accessing specific repositories, and more. Instead of creating and managing countless Unix user accounts, all the administrator has to do is list users (identified by their SSH public keys) to the repositories they are allowed to access. Gitolite takes care of everything else.

Gitolite is nearly invisible to users, and it makes Git management nearly invisible to the server admin. As long as you don't require a web interface, Gitolite is a net win for everyone involved.

### 3\. Gitea and Gogs

![Gitea][11]

(Seth Kenlon, [CC BY-SA 4.0][5])

The [Gogs project][12] is an MIT-Licensed Git server framework and web user interface. In 2016, some Gogs users felt development was hindered because only its initial developer had write access to its development repository, so they forked the code to [Gitea][13]. Today, both projects co-exist independently of one another, and from a user's perspective, they are basically the same experience. Ironically, both projects are hosted on GitHub.

With Gitea and Gogs, you download the source code and run it as a service on your server. This provides a website for users, where they can create an account, log in, create their own repositories, upload code, navigate through code, file issues and bug reports, request code merges, manage SSH keys, and so on. The interface is similar in look and feel to GitLab, GitHub, or Bitbucket, so if users have any experience with an online-code management system, they're already essentially familiar with Gitea and Gogs.

Gitea or Gogs can be installed as a package on any Linux server, including a Raspberry Pi, as a container, on BSD, macOS, or Windows, or compiled from source code. They're both cross-platform, so they can be run on anything that runs Go. Read Ricardo Gerardi's article about [setting up a Gogs container using Podman][14] for more information.

### 4\. Independent communities

![Notabug][15]

(Seth Kenlon, [CC BY-SA 4.0][5])

If you're not up for self-hosting, you can cheat a little by using a self-hosted option on somebody else's server. There are many independent sites out there, such as [Codeberg][16], Nixnet, Tinfoil-hat, and [Notabug.org][17]. Some run Gitea and others run Gogs, but the result is the same: free code hosting to help you keep your work safe and public. These solutions may not be as complex as something like GitLab or GitHub, they may not offer on-demand Jenkins pipelines and continuous integration/continuous development (CI/CD) solutions, but they're great mirrors for your work.

There are purpose-specific providers, too: a [Gitea instance for FSFE supporters][18], a Gitlab instance for [Freedesktop projects][19], and another for [GNOME projects][20].

Because these independent servers are smaller communities, you might also find that the "social" aspect of social coding is more significant. I've made several online friends through an independent Git provider, while GitHub has proven to be, at least socially, underwhelming.

The message is clear: there's no requirement or advantage for there to be a centralized, dominant, non-free Git software hosting service.

### 5\. Git

It might surprise you to know that Git is surprisingly self-reliant as a server. While it lacks user management and permission settings, Git integrates with SSH and ships with a special `git-shell` application designed specifically to serve as a limited environment for using Git commands. By setting users' default shell to `git-shell`, you can limit what actions are available to them when they interact with your server.

What Git alone does not offer is repository permission tools to help you manage what each user has access to. For this, you'll have to fall back on the operating system's user and access control list (ACL) controls, which can become tedious should you have more than just a handful of users. For small projects or projects just starting, running Git on a Linux server is an easy and immediate solution to the need for a collaborative space. For more information, read my article on [building a Git server][21].

### Bonus: Fossil

![Fossil UI][22]

(Klaatu, [CC BY-SA 4.0][5])

Fossil isn't by any means Git, and in a sense, that's its appeal as an alternative to GitHub. In fact, Fossil is an alternative to the entire Git system. It's a complete version-control system, like Git, and it also has bug tracking, wiki, forum, and documentation features _built into every repository you create_. It also has a web interface included and is entirely self-contained. If it all sounds too good to be true, you can see it in action at [fossil-scm.org][23], because Fossil's homepage runs on Fossil!

Read Klaatu's article on [getting started with Fossil][24] for more information.

### Open source means choice

The best thing about Git (and Fossil) is that they're open source technologies. You can choose whatever solution works best for you. In fact, because Git is also distributed, you can even choose _multiple_ solutions. There's nothing stopping you from hosting your code on several services and writing to all of them with each push. Take a look at your options, decide what works best for you, and get to work!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/open-source-alternatives-github

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://opensource.com/article/19/4/write-git
[3]: https://github.com/
[4]: https://opensource.com/sites/default/files/uploads/gitlab.jpg (GitLab)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://gitlab.com
[7]: https://about.gitlab.com/handbook/people-group/general-onboarding/onboarding-processes
[8]: https://about.gitlab.com/handbook
[9]: https://gitolite.com/gitolite/index.html
[10]: https://opensource.com/article/20/3/git-cola
[11]: https://opensource.com/sites/default/files/uploads/gitea.jpg (Gitea)
[12]: https://gogs.io
[13]: https://gitea.io
[14]: https://www.redhat.com/sysadmin/git-gogs-podman
[15]: https://opensource.com/sites/default/files/uploads/notabug.jpg (Notabug)
[16]: https://join.codeberg.org/
[17]: https://notabug.org
[18]: https://git.fsfe.org/
[19]: https://gitlab.freedesktop.org
[20]: https://gitlab.gnome.org
[21]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[22]: https://opensource.com/sites/default/files/uploads/fossil-ui.jpg (Fossil UI)
[23]: https://www.fossil-scm.org
[24]: https://opensource.com/article/20/11/fossil
