Translating by qhwdw # How I created my first RPM package in Fedora

![](https://i0.wp.com/blog.justinwflory.com/wp-content/uploads/2017/11/newpackage.png?resize=1024%2C433&ssl=1)

Over the summer, I migrated my desktop environment to i3, a tiling window manager. Switching to i3 was a challenge at first, since I had to replace many things that GNOME handled for me. One of these things was changing screen brightness. xbacklight, the standard way of changing backlight brightness on laptops, doesn’t work on my hardware.

Recently, I discovered [brightlight][1], a tool that changes backlight brightness. I decided to try it, and it worked with root privileges. However, I found there was no RPM package in Fedora for brightlight. I decided this was the right time to try creating a package in Fedora and learn how to create an RPM.

In this article, I’ll cover and share how I…

*Created the RPM SPEC file
*Built the package in Koji and Copr
*Worked through an issue with debug package
*Submitted the package to Fedora package collection

### Pre-requisites

On Fedora, I installed these packages for all steps of the package building process.

```
sudo dnf install fedora-packager fedpkg fedrepo_req copr-cli
```

### Creating the RPM SPEC file

The first step to create a RPM is to create the SPEC file. These are the specifications, or instructions, that tell RPM how to build the package. This is how you tell RPM to create a binary file from the package’s source code. Creating the SPEC file is likely the hardest part of the packaging process and its difficulty depends on the project.

Fortunately for me, brightlight is a simple application written in C. The maintainer made it easy to create a binary application with a Makefile. Building it was a matter of simply running make in the repo. So now I had a simple project to learn RPM packaging.

### Finding documentation

Googling “how to create an RPM package” yields many results. I started with [IBM’s documentation][2]. However, I found it confusing and difficult to understand (although quite detailed; it might be more useful for a complicated app). I also found the [package creation][3] instructions on the Fedora wiki. The documentation here was good at explaining the composition and process, but I was still confused on how to begin.

Finally, I found the [RPM Packaging Guidelines][4], written by the amazing [Adam Miller][5]. These instructions were helpful and included three excellent examples for Bash, C, and Python applications. This guide helped me better understand how to compose a RPM SPEC, and more importantly, how all the pieces fit together.

After this, I was able to write my [first SPEC file][6] for brightlight. Since it is so simple, the SPEC file is short and easy to understand. Once I had my SPEC file, I linted the file for errors. After cleaning a few mistakes, I created the source RPM (SRPM) and the binary RPM, then linted each for errors.

```
rpmlint SPECS/brightlight.spec
rpmbuild -bs SPECS/brightlight.spec
rpmlint SRPMS/brightlight-5-1.fc26.src.rpm
rpmbuild -bb SPECS/brightlight-5-1.fc26.x86_64.rpm
rpmlint RPMS/x86_64/brightlight-5-1.fc26.x86_64.rpm
```

Now, I had a valid RPM to send to the Fedora repositories.

### Building in Copr and Koji

Next, I read the [guidelines][7] to becoming a Fedora packager. Before submitting anything, they encouraged packagers to test their packages by hosting the project in a [Copr][8] repo and building in [Koji][9].

#### Using Copr

First, I created a [Copr repository][10] for brightlight. [Copr][11] is a service in Fedora’s infrastructure that builds your package and sets up a custom repo for whatever version of Fedora or EPEL that you choose. It’s handy to get your RPM hosted quickly and to share it with others for testing. You don’t need special approval to host a Copr.

I created my Copr project from the web interface, but you can also use the copr-cli tool. There is an [excellent guide][12] in the Fedora Developer portal. After I created my repo on the website, I built my package with this command.

```
copr-cli build brightlight SRPMS/brightlight.5-1.fc26.src.rpm
```

My packages successfully built for Copr and I was able to install it on my Fedora system easily.

#### Using Koji

Anyone can use [Koji][13] to test their package on multiple architectures and versions of Fedora or CentOS / RHEL. To test on Koji, you must have a source RPM. I wanted to package brightlight on all supported versions of Fedora, so I ran these commands.

```
koji build --scratch f25 SRPMS/brightlight-5-1.fc26.src.rpm
koji build --scratch f26 SRPMS/brightlight-5-1.fc26.src.rpm
koji build --scratch f27 SRPMS/brightlight-5-1.fc26.src.rpm
```

It took some time, but Koji built all the packages. Everything was fine for Fedora 25 and 26, but Fedora 27 failed. Koji scratch builds keep me on the right track and make sure my packages build successfully.

### Problem: Fedora 27 builds failing!

Now I know that my Fedora 27 package was failing to build on Koji. But why? I discovered two relevant changes for Fedora 27.

*[Subpackage and Source Debuginfo][14]
*[RPM 4.14][15] (specifically, the debuginfo package rewrite)

These changes mean that RPM packages must build with a debuginfo package. This is helpful for troubleshooting or debugging an application. In my case, this wasn’t critical or too necessary, but I needed to build one.

Thanks to Igor Gnatenko, he helped me understand what I needed to add to my package SPEC for it to build on Fedora 27. Before the %make_build macro, I added these lines.

```
export CFLAGS="%{optflags}"
export LDFLAGS="%{__global_ldflags}"
```

I built a new SRPM and submitted it to Koji to build on Fedora 27. And success! It built successfully.

### Submitting the package

Now that I verified my package successfully built on Fedora 25 to 27, it’s time to begin the packaging process for Fedora. The first step to submitting a package is to create a new bug in the Red Hat Bugzilla to ask for a package review. I [created a ticket][16] for brightlight. Since this was my first package, I made an explicit note that this was my first package and I was seeking a sponsor. In the ticket, I linked to the SPEC and SRPM files in my git repository.

#### Getting into dist-git

[Igor Gnatenko][17] sponsored me into the Fedora Packagers group and left feedback on my package. I learned of some other things specific for packaging C applications. After he sponsored me, I was able to ask for a repo in [dist-git][18], Fedora’s collection of RPM package repositories that host SPEC files for all of Fedora.

A handy Python tool helps make this part easy. fedrepo-req is a tool that creates a request for a new dist-git repository. I submitted my request with this command.

```
fedrepo-req brightlight \
    --ticket 1505026 \
    --description "CLI tool to change screen back light brightness" \
    --upstreamurl https://github.com/multiplexd/brightlight
```

This created a new ticket for me in the fedora-scm-requests repo. The next day, an admin [created the repository][19] for me. Now, I was in business!

![](https://i0.wp.com/blog.justinwflory.com/wp-content/uploads/2017/11/Screenshot-from-2017-11-05-19-58-47.png?w=1366&ssl=1)
My first RPM in Fedora dist-git – woohoo!

#### Working with dist-git

Next, fedpkg is the tool used for interacting with dist-git repositories. I changed directories into my git working directory and ran this command.

```
fedpkg clone brightlight
```

fedpkg then clones my package’s repo from dist-git. For the first branch only, you need to import the SRPM.

```
fedpkg import SRPMS/brightlight-5-1.fc26.src.rpm
```

fedpkg imports your package’s SRPM into the repo and sets up the sources for you. It’s important to use fedpkg for this because it helps provision the repo in a Fedora-friendly way (as compared to adding the files manually yourself). Once you import the SRPM, push the changes to the dist-git repo.

```
git commit -m "Initial import (#1505026)."
git push
```

#### Building the package

Once you push the first import to your dist-git repo, you’re ready to do a real Koji build of your project. To build your project, run this command.

```
fedpkg build
```

This builds your package in Koji for Rawhide, the unversioned branch of Fedora. You must build successfully for Rawhide before you can build for other branches. IF everything builds successfully, you can now ask for other branches for your project.

```
fedrepo-req brightlight f27 -t 1505026
fedrepo-req brightlight f26 -t 1505026
fedrepo-req brightlight f25 -t 1505026
```

#### Note about building other branches

Once you import the SRPM initially, remember to merge your master branch to other branches, if you choose to create them. For example, if you later request a branch for Fedora 27, you would want to use these commands.

```
fedpkg switch-branch f27
git merge master
git push
fedpkg build
```

#### Submitting update to Bodhi

The last step of the process is to submit your new package as an update to Bodhi. When you first submit your package as an update, it goes to the testing repositories. Anyone can test your package and add karma to the update. If your update receives +3 votes (or as Bodhi calls it, karma), your package automatically pushes to the stable repositories. Otherwise, it pushes after a week in the testing repositories.

To submit your update to Bodhi, you only need one command.

```
fedpkg update
```

This opens a Vim window with different configuration options for your package. Usually, you only need to specify the type (e.g. newpackage) and the ticket ID number for your package review. For a more in-depth explanation, there is an update guide on the Fedora wiki.

After saving and exiting the file, fedpkg submits your package as an update to Bodhi and eventually synchronizes to the Fedora testing repositories. I was able to install my package with this command.

```
sudo dnf install brightlight -y --enablerepo=updates-testing --refresh
```

### We’re stable!

My package was recently submitted to [Fedora 26 stable repositories][20] and will soon enter [Fedora 25][21] and [Fedora 27][22] stable repositories. Thanks for everyone who helped me with my first package. I look forward to more opportunities to add more packages to the distribution.

--------------------------------------------------------------------------------

via: https://blog.justinwflory.com/2017/11/first-rpm-package-fedora/

作者：[JUSTIN W. FLORY ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.justinwflory.com/author/jflory7/
[1]:https://github.com/multiplexd/brightlight
[2]:https://www.ibm.com/developerworks/library/l-rpm1/index.html
[3]:https://fedoraproject.org/wiki/How_to_create_an_RPM_package
[4]:https://fedoraproject.org/wiki/How_to_create_an_RPM_package
[5]:https://github.com/maxamillion
[6]:https://src.fedoraproject.org/rpms/brightlight/blob/master/f/brightlight.spec
[7]:https://fedoraproject.org/wiki/Join_the_package_collection_maintainers
[8]:https://copr.fedoraproject.org/
[9]:https://koji.fedoraproject.org/koji/
[10]:https://copr.fedorainfracloud.org/coprs/jflory7/brightlight/
[11]:https://developer.fedoraproject.org/deployment/copr/about.html
[12]:https://developer.fedoraproject.org/deployment/copr/copr-cli.html
[13]:https://koji.fedoraproject.org/koji/
[14]:https://fedoraproject.org/wiki/Changes/SubpackageAndSourceDebuginfo
[15]:https://fedoraproject.org/wiki/Changes/RPM-4.14
[16]:https://bugzilla.redhat.com/show_bug.cgi?id=1505026
[17]:https://fedoraproject.org/wiki/User:Ignatenkobrain
[18]:https://src.fedoraproject.org/
[19]:https://src.fedoraproject.org/rpms/brightlight
[20]:https://bodhi.fedoraproject.org/updates/brightlight-5-1.fc26
[21]:https://bodhi.fedoraproject.org/updates/FEDORA-2017-8071ee299f
[22]:https://bodhi.fedoraproject.org/updates/FEDORA-2017-f3f085b86e
