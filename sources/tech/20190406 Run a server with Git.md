[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run a server with Git)
[#]: via: (https://opensource.com/article/19/4/server-administration-git)
[#]: author: (Seth Kenlon (Red Hat, Community Moderator) https://opensource.com/users/seth/users/seth)

Run a server with Git
======
Thanks to Gitolite, you can manage a Git server with Git. Learn how in
our series about little-known Git uses.
![computer servers processing data][1]

As I've tried to demonstrate in this series leading up to Git's 14th anniversary on April 7, [Git][2] can do a wide range of things beyond tracking source code. Believe it or not, Git can even manage your Git server, so you can, more or less, run a Git server with Git itself.

Of course, this involves a lot of components beyond everyday Git, not the least of which is [Gitolite][3], the backend application managing the fiddly bits that you configure using Git. The great thing about Gitolite is that, because it uses Git as its frontend interface, it's easy to integrate Git server administration within the rest of your Git-based workflow. Gitolite provides precise control over who can access specific repositories on your server and what permissions they have. You can manage that sort of thing yourself with the usual Linux system tools, but it takes a lot of work if you have more than just one or two repos across a half-dozen users.

Gitolite's developers have done the hard work to make it easy for you to provide many users with access to your Git server without giving them access to your entire environment—and you can do it all with Git.

What Gitolite is _not_ is a GUI admin and user panel. That sort of experience is available with the excellent [Gitea][4] project, but this article focuses on the simple elegance and comforting familiarity of Gitolite.

### Install Gitolite

Assuming your Git server runs Linux, you can install Gitolite with your package manager ( **yum** on CentOS and RHEL, **apt** on Debian and Ubuntu, **zypper** on OpenSUSE, and so on). For example, on RHEL:


```
`$ sudo yum install gitolite3`
```

Many repositories still have older versions of Gitolite for legacy support, but the current version is version 3.

You must have passwordless SSH access to your server. You can use a password to log in if you prefer, but Gitolite relies on SSH keys, so you must configure the option to log in with keys. If you don't know how to configure a server for passwordless SSH access, go learn how to do that first (the [Setting up SSH key authentication][5] section of Steve Ovens's Ansible article explains it well). It's an essential part of secure server administration—as well as of running Gitolite.

### Configure a Git user

Without Gitolite, if a person requests access to a Git repository you host on a server, you have to provide that person with a user account. Git provides a special shell, the **git-shell** , which is an ultra-specific shell that performs only Git tasks. This lets you have users who can access your server only through the filter of a very limited shell environment.

That solution works, but it usually means a user gains access to all repositories on your server unless you have a very good schema for group permissions and maintain those permissions strictly whenever a new repository is created. It also requires a lot of manual configuration at the system level, an area usually reserved for a specific tier of sysadmins and not necessarily the person usually in charge of Git repositories.

Gitolite sidesteps this issue entirely by designating one username for every person who needs access to any repository. By default, the username is **git** , and because Gitolite's documentation assumes that's what is used, it's a good default to keep when you're learning the tool. It's also a well-known convention for anyone who's ever used GitLab or GitHub or any other Git hosting service.

Gitolite calls this user the _hosting user_. Create an account on your server to act as the hosting user (I'll stick with **git** because that's the convention):


```
` $ sudo adduser --create-home git`
```

For you to control the **git** user account, it must have a valid public SSH key that belongs to you. You should already have this set up, so **cp** your public key ( _not your private key_ ) to the **git** user's home directory:


```
$ sudo cp ~/.ssh/id_ed25519.pub /home/git/
$ sudo chown git:git /home/git/id_ed25519.pub
```

If your public key doesn't end with the extension **.pub** , Gitolite will not use it, so rename the file accordingly. Change to that user account to run Gitolite's setup:


```
$ sudo su - git
$ gitolite setup --pubkey id_ed25519.pub
```

After the setup script runs, the **git** home's user directory will have a **repositories** directory, which (for now) contains the files **git-admin.git** and **testing.git**. That's all the setup the server requires, so log out.

### Use Gitolite

Managing Gitolite is a matter of editing text files in a Git repository, specifically **gitolite-admin.git**. You won't SSH into your server for Git administration, and Gitolite encourages you not to try. The repositories you and your users store on the Gitolite server are _bare_ repositories, so it's best to stay out of them.


```
$ git clone [git@example.com][6]:gitolite-admin.git gitolite-admin.git
$ cd gitolite-admin.git
$ ls -1
conf
keydir
```

The **conf** directory in this repository contains a file called **gitolite.conf**. Open it in a text editor or use **cat** to view its contents:


```
repo gitolite-admin
RW+ = id_ed22519

repo testing
RW+ = @all
```

You may have an idea of what this configuration file does: **gitolite-admin** represents this repository, and the owner of the **id_ed25519** key has read, write, and Git administrative privileges. In other words, rather than mapping users to normal local Unix users (because all your users log in using the **git** hosting user identity), Gitolite maps users to SSH keys listed in the **keydir** directory.

The **testing.git** repository gives full permissions to everyone with access to the server using special group notation.

#### Add users

If you want to add a user called **alice** to your Git server, the person Alice must send you her public SSH key. Gitolite uses whatever is to the left of the **.pub** extension as the identifier for your Git users. Rather than using the default key name values, give keys a name indicative of the key owner. If a user has more than one key (e.g., one for her laptop, one for her desktop), you can use subdirectories to avoid file name collisions. For instance, the key Alice uses from her laptop might come to you as the default **id_rsa.pub** , so rename it **alice.pub** or similar (or let the users name the key according to their local user accounts on their computers), and place it into the **gitolite-admin.git/keydir/work/laptop/** directory. If she sends you another key from her desktop, name it **alice.pub** (the same as the previous one) and add it to **keydir/work/desktop/**. Another key might go into **keydir/home/desktop/** , and so on. Gitolite recursively searches **keydir** for a **.pub** file matching a repository "user" and treats any match as the same identity.

When you add keys to the **keydir** directory, you must commit them back to your server. This is such an easy thing to forget that there's a real argument here for using an automated Git application like [**Sparkleshare**][7] so any change is committed back to your Gitolite admin immediately. The first time you forget to commit and push—and waste three hours of your time and your user's time troubleshooting—you'll see that Gitolite is the perfect justification for using Sparkleshare.


```
$ git add keydir
$ git commit -m 'added alice-laptop-0.pub'
$ git push origin HEAD
```

Alice, by default, gains access to the **testing.git** directory so she can test connectivity and functionality with that.

#### Set permissions

As with users, directory permissions and groups are abstracted away from the normal Unix tools you might be used to (or find information about online). Permissions to projects are granted in the **gitolite.conf** file in **gitolite-admin.git/conf** directory. There are four levels of permissions:

  * **R** allows read-only. A user with **R** permissions on a repository may clone it, and that's all.
  * **RW** allows a user to perform a fast-forward push of a branch, create new branches, and create new tags. More or less, this one feels like a "normal" Git repository to most users.
  * **RW+** allows Git actions that are potentially destructive. A user can perform normal fast-forward pushes, as well as rewind pushes, do rebases, and delete branches and tags. This may or may not be something you want to grant to all contributors on a project.
  * **-** explicitly denies access to a repository. This is essentially the same as a user not being listed in the repository's configuration.



Create a new repository or modify an existing repository's permissions by adjusting **gitolite.conf**. For instance, to give Alice permissions to administrate a new repository called **widgets.git** :


```
repo gitolite-admin
RW+ = id_ed22519

repo testing
RW+ = @all

repo widgets
RW+ = alice
```

Now Alice—and Alice alone—can clone the repo:


```
[alice]$ git clone [git@example.com][6]:widgets.git
Cloning into 'widgets'...
warning: You appear to have cloned an empty repository.
```

On her initial push, Alice must use the **-u** option to send her branch to the empty repository (as she would have to do with any Git host).

To make user management easier, you can define groups of repositories:


```
@qtrepo = widgets
@qtrepo = games

repo gitolite-admin
RW+ = id_ed22519

repo testing
RW+ = @all

repo @qtrepo
RW+ = alice
```

Just as you can create group repositories, you can group users. One user group exists by default: **@all**. As you might expect, it includes all users, without exception. You can create your own:


```
@qtrepo = widgets
@qtrepo = games

@developers = alice bob

repo gitolite-admin
RW+ = id_ed22519

repo testing
RW+ = @all

repo @qtrepo
RW+ = @developers
```

As with adding or modifying key files, any change to the **gitolite.conf** file must be committed and pushed to take effect.

### Create a repository

By default, Gitolite assumes repository creation happens from the top down. For instance, a project manager with access to the Git server creates a project repository and, through the Gitolite administration repo, adds developers.

In practice, you might prefer to grant users permission to create repositories. Gitolite calls these "wild repos" (I'm not sure whether that's commentary on how the repos come into being or a reference to the wildcard characters required by the configuration file to let it happen). Here's an example:


```
@managers = alice bob

repo foo/CREATOR/[a-z]..*
C = @managers
RW+ = CREATOR
RW = WRITERS
R = READERS
```

The first line defines a group of users: the group is called **@managers** and contains users **alice** and **bob**. The next line sets up a wildcard allowing repositories that do not yet exist to be created in a directory called **foo** followed by a subdirectory named for the user creating the repo. For example:


```
[alice]$ git clone [git@example.com][6]:foo/alice/cool-app.git
Cloning into cool-app'...
Initialized empty Git repository in /home/git/repositories/foo/alice/cool-app.git
warning: You appear to have cloned an empty repository.
```

There are some mechanisms for the creator of a wild repo to define who can read and write to their repository, but they're limited in scope. For the most part, Gitolite assumes that a specific set of users governs project permission. One solution is to grant all users access to **gitolite-admin** using a Git hook to require manager approval to merge changes into the master branch.

### Learn more

Gitolite has many more features than what this introductory article covers, so try it out. The [documentation][8] is excellent, and once you read through it, you can customize your Gitolite server to provide your users whatever level of control you are comfortable with. Gitolite is a low-maintenance, simple system that you can install, set up, and then more or less forget about.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/server-administration-git

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8 (computer servers processing data)
[2]: https://git-scm.com/
[3]: http://gitolite.com
[4]: http://gitea.io
[5]: Setting%20up%20SSH%20key%20authentication
[6]: mailto:git@example.com
[7]: https://opensource.com/article/19/4/file-sharing-git
[8]: http://gitolite.com/gitolite/quick_install.html
