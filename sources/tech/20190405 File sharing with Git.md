[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (File sharing with Git)
[#]: via: (https://opensource.com/article/19/4/file-sharing-git)
[#]: author: (Seth Kenlon (Red Hat, Community Moderator) https://opensource.com/users/seth)

File sharing with Git
======
SparkleShare is an open source, Git-based, Dropbox-style file sharing
application. Learn more in our series about little-known uses of Git.
![][1]

[Git][2] is one of those rare applications that has managed to encapsulate so much of modern computing into one program that it ends up serving as the computational engine for many other applications. While it's best-known for tracking source code changes in software development, it has many other uses that can make your life easier and more organized. In this series leading up to Git's 14th anniversary on April 7, we'll share seven little-known ways to use Git. Today, we'll look at SparkleShare, which uses Git as the backbone for file sharing.

### Git for file sharing

One of the nice things about Git is that it's inherently distributed. It's built to share. Even if you're sharing a repository just with other computers on your own network, Git brings transparency to the act of getting files from a shared location.

As interfaces go, Git is pretty simple. It varies from user to user, but the common incantation when sitting down to get some work done is just **git pull** or maybe the slightly more complex **git pull && git checkout -b my-branch**. Still, for some people, the idea of _entering a command_ into their computer at all is confusing or bothersome. Computers are meant to make life easy, and computers are good at repetitious tasks, and so there are easier ways to share files with Git.

### SparkleShare

The [SparkleShare][3] project is a cross-platform, open source, Dropbox-style file sharing application based on Git. It automates all Git commands, triggering the add, commit, push, and pull processes with the simple act of dragging-and-dropping a file into a specially designated SparkleShare directory. Because it is based on Git, you get fast, diff-based pushes and pulls, and you inherit all the benefits of Git version control and backend infrastructure (like Git hooks). It can be entirely self-hosted, or you can use it with Git hosting services like [GitLab][4], GitHub, Bitbucket, and others. Furthermore, because it's basically just a frontend to Git, you can access your SparkleShare files on devices that may not have a SparkleShare client but do have Git clients.

Just as you get all the benefits of Git, you also get all the usual Git restrictions: It's impractical to use SparkleShare to store hundreds of photos and music and videos because Git is designed and optimized for text. Git certainly has the capability to store large files of binary data but it is designed to track history, so once a file is added to it, it's nearly impossible to completely remove it. This somewhat limits the usefulness of SparkleShare for some people, but it makes it ideal for many workflows, including [calendaring][5].

#### Installing SparkleShare

SparkleShare is cross-platform, with installers for Windows and Mac available from its [website][6]. For Linux, there's a [Flatpak][7] in your software installer, or you can run these commands in a terminal:


```
$ sudo flatpak remote-add flathub <https://flathub.org/repo/flathub.flatpakrepo>
$ sudo flatpak install flathub org.sparkleshare.SparkleShare
```

### Creating a Git repository

SparkleShare isn't software-as-a-service (SaaS). You run SparkleShare on your computer to communicate with a Git repository—SparkleShare doesn't store your data. If you don't have a Git repository to sync a folder with yet, you must create one before launching SparkleShare. You have three options: hosted Git, self-hosted Git, or self-hosted SparkleShare.

#### Git hosting

SparkleShare can use any Git repository you can access for storage, so if you have or create an account with GitLab or any other hosting service, it can become the backend for your SparkleShare. For example, the open source [Notabug.org][8] service is a Git hosting service like GitHub and GitLab, but unique enough to prove SparkleShare's flexibility. Creating a new repository differs from host to host depending on the user interface, but all of the major ones follow the same general model.

First, locate the button in your hosting service to create a new project or repository and click on it to begin. Then step through the repository creation process, providing a name for your repository, privacy level (repositories often default to being public), and whether or not to initialize the repository with a README file. Whether you need a README or not, enable an initial README file. Starting a repository with a file isn't strictly necessary, but it forces the Git host to instantiate a **master** branch in the repository, which helps ensure that frontend applications like SparkleShare have a branch to commit and push to. It's also useful for you to see a file, even if it's an almost empty README file, to confirm that you have connected.

![Creating a Git repository][9]

Once you've created a repository, obtain the URL it uses for SSH clones. You can get this URL the same way anyone gets any URL for a Git project: navigate to the page of the repository and look for the **Clone** button or field.

![Cloning a URL on GitHub][10]

Cloning a GitHub URL.

![Cloning a URL on GitLab][11]

Cloning a GitLab URL.

This is the address SparkleShare uses to reach your data, so make note of it. Your Git repository is now configured.

#### Self-hosted Git

You can use SparkleShare to access a Git repository on any computer you have access to. No special setup is required, aside from a bare Git repository. However, if you want to give access to your Git repository to anyone else, then you should run a Git manager like [Gitolite][12] or SparkleShare's own Dazzle server to help you manage SSH keys and accounts. At the very least, create a user specific to Git so that users with access to your Git repository don't also automatically gain access to the rest of your server.

Log into your server as the Git user (or yourself, if you're very good at managing user and group permissions) and create a repository:


```
$ mkdir ~/sparkly.git
$ cd ~/sparkly.git
$ git init --bare .
```

Your Git repository is now configured.

#### Dazzle

SparkleShare's developers provide a Git management system called [Dazzle][13] to help you self-host Git repositories.

On your server, download the Dazzle application to some location in your path:


```
$ curl <https://raw.githubusercontent.com/hbons/Dazzle/master/dazzle.sh> \
\--output ~/bin/dazzle
$ chmod +x ~/bin/dazzle
```

Dazzle sets up a user specific to Git and SparkleShare and also implements access rights based on keys generated by the SparkleShare application. For now, just set up a project:


```
`$ dazzle create sparkly`
```

Your server is now configured as a SparkleShare host.

### Configuring SparkleShare

When you launch SparkleShare for the first time, you are prompted to configure what server you want SparkleShare to use for storage. This process may feel like a first-run setup wizard, but it's actually the usual process for setting up a new shared location within SparkleShare. Unlike many shared drive applications, with SparkleShare you can have several locations configured at once. The first shared location you configure isn't any more significant than any shared location you may set up later, and you're not signing up with SparkleShare or any other service. You're just pointing SparkleShare at a Git repository so that it knows what to keep your first SparkleShare folder in sync with.

On the first screen, identify yourself by whatever means you want on record in the Git commits that SparkleShare makes on your behalf. You can use anything, even fake information that resolves to nothing. It's purely for the commit messages, which you may never even see if you have no interest in reviewing the Git backend processes.

The next screen prompts you to choose your hosting type. If you are using GitLab, GitHub, Planio, or Bitbucket, then select the appropriate one. For anything else, select **Own server**.

![Choosing a Sparkleshare host][14]

At the bottom of this screen, you must enter the SSH clone URL. If you're self-hosting, the address is something like **<ssh://username@example.com>** and the remote path is the absolute path to the Git repository you created for this purpose.

Based on my self-hosted examples above, the address to my imaginary server is **<ssh://git@example.com:22122>** (the **:22122** indicates a nonstandard SSH port) and the remote path is **/home/git/sparkly.git**.

If I use my Notabug.org account instead, the address from the example above is **[git@notabug.org][15]** and the path is **seth/sparkly.git**.

SparkleShare will fail the first time it attempts to connect to the host because you have not yet copied the SparkleShare client ID (an SSH key specific to the SparkleShare application) to the Git host. This is expected, so don't cancel the process. Leave the SparkleShare setup window open and obtain the client ID from the SparkleShare icon in your system tray. Then copy the client ID to your clipboard so you can add it to your Git host.

![Getting the client ID from Sparkleshare][16]

#### Adding your client ID to a hosted Git account

Minor UI differences aside, adding an SSH key (which is all the client ID is) is basically the same process on any hosting service. In your Git host's web dashboard, navigate to your user settings and find the **SSH Keys** category. Click the **Add New Key** button (or similar) and paste the contents of your SparkleShare client ID.

![Adding an SSH key][17]

Save the key. If you want someone else, such as collaborators or family members, to be able to access this same repository, they must provide you with their SparkleShare client ID so you can add it to your account.

#### Adding your client ID to a self-hosted Git account

A SparkleShare client ID is just an SSH key, so copy and paste it into your Git user's **~/.ssh/authorized_keys** file.

#### Adding your client ID with Dazzle

If you are using Dazzle to manage your SparkleShare projects, add a client ID with this command:


```
`$ dazzle link`
```

When Dazzle prompts you for the ID, paste in the client ID found in the SparkleShare menu.

### Using SparkleShare

Once you've added your client ID to your Git host, click the **Retry** button in the SparkleShare window to finish setup. When it's finished cloning your repository, you can close the SparkleShare setup window, and you'll find a new **SparkleShare** folder in your home directory. If you set up a Git repository with a hosting service and chose to include a README or license file, you can see them in your SparkleShare directory.

![Sparkleshare file manager][18]

Otherwise, there are some hidden directories, which you can see by revealing hidden directories in your file manager.

![Showing hidden files in GNOME][19]

You use SparkleShare the same way you use any directory on your computer: you put files into it. Anytime a file or directory is placed into a SparkleShare folder, it's copied in the background to your Git repository.

#### Excluding certain files

Since Git is designed to remember _everything_ , you may want to exclude specific file types from ever being recorded. There are a few reasons to manage excluded files. By defining files that are off limits for SparkleShare, you can avoid accidental copying of large files. You can also design a scheme for yourself that enables you to store files that logically belong together (MIDI files with their **.flac** exports, for instance) in one directory, but manually back up the large files yourself while letting SparkleShare back up the text-based files.

If you can't see hidden files in your system's file manager, then reveal them. Navigate to your SparkleShare folder, then to the directory representing your repository, locate a file called **.gitignore** , and open it in a text editor. You can enter file extensions or file names, one per line, into **.gitignore** , and any file matching what you list will be (as the file name suggests) ignored.


```
Thumbs.db
$RECYCLE.BIN/
.DS_Store
._*
.fseventsd
.Spotlight-V100
.Trashes
.directory
.Trash-*
*.wav
*.ogg
*.flac
*.mp3
*.m4a
*.opus
*.jpg
*.png
*.mp4
*.mov
*.mkv
*.avi
*.pdf
*.djvu
*.epub
*.od{s,t}
*.cbz
```

You know the types of files you encounter most often, so concentrate on the ones most likely to sneak their way into your SparkleShare directory. If you want to exercise a little overkill, you can find good collections of **.gitignore** files on Notabug.org and also on the internet at large.

With those entries in your **.gitignore** file, you can place large files that you don't want sent to your Git host in your SparkleShare directory, and SparkleShare will ignore them entirely. Of course, that means it's up to you to make sure they get onto a backup or distributed to your SparkleShare collaborators through some other means.

### Automation

[Automation][20] is part of the silent agreement we have with computers: they do the repetitious, boring stuff that we humans either aren't very good at doing or aren't very good at remembering. SparkleShare is a nice, simple way to automate the routine distribution of data. It isn't right for every Git repository, by any means. It doesn't have an interface for advanced Git functions; it doesn't have a pause button or a manual override. And that's OK because its scope is intentionally limited. SparkleShare does what SparkleShare sets out to do, it does it well, and it's one Git repository you won't have to think about.

If you have a use for that kind of steady, invisible automation, give SparkleShare a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/file-sharing-git

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO
[2]: https://git-scm.com/
[3]: http://www.sparkleshare.org/
[4]: http://gitlab.com
[5]: https://opensource.com/article/19/4/calendar-git
[6]: http://sparkleshare.org
[7]: /business/16/8/flatpak
[8]: http://notabug.org
[9]: https://opensource.com/sites/default/files/uploads/git-new-repo.jpg (Creating a Git repository)
[10]: https://opensource.com/sites/default/files/uploads/github-clone-url.jpg (Cloning a URL on GitHub)
[11]: https://opensource.com/sites/default/files/uploads/gitlab-clone-url.jpg (Cloning a URL on GitLab)
[12]: http://gitolite.org
[13]: https://github.com/hbons/Dazzle
[14]: https://opensource.com/sites/default/files/uploads/sparkleshare-host.jpg (Choosing a Sparkleshare host)
[15]: mailto:git@notabug.org
[16]: https://opensource.com/sites/default/files/uploads/sparkleshare-clientid.jpg (Getting the client ID from Sparkleshare)
[17]: https://opensource.com/sites/default/files/uploads/git-ssh-key.jpg (Adding an SSH key)
[18]: https://opensource.com/sites/default/files/uploads/sparkleshare-file-manager.jpg (Sparkleshare file manager)
[19]: https://opensource.com/sites/default/files/uploads/gnome-show-hidden-files.jpg (Showing hidden files in GNOME)
[20]: /downloads/ansible-quickstart
