How to Install Software from Source Code… and Remove it Afterwards
============================================================

![How to install software from source code](https://itsfoss.com/wp-content/uploads/2017/10/install-software-from-source-code-linux-800x450.jpg)

 _Brief: This detailed guide explains how to install a program from source code in Linux and how to remove the software installed from the source code._ 

One of the greatest strength of your Linux distribution is its package manager and the associated software repository. With them, you have all the necessary tools and resources to download and install a new software on your computer in a completely automated manner.

But despite all their efforts, the package maintainers cannot handle each and every use cases. Nor can they package all the software available out there. So there are still situations where you will have to compile and install a new software by yourself. As of myself, the most common reason, by far, I have to compile some software is when I need to run a very specific version. Or because I want to modify the source code or use some fancy compilation options.

If your needs belong to that latter category, there are chances you already know what you do. But for the vast majority of Linux users, compiling and installing a software from the sources for the first time might look like an initiation ceremony: somewhat frightening; but with the promise to enter a new world of possibilities and to be part of a privileged community if you overcome that.

[Suggested readHow To Install And Remove Software In Ubuntu [Complete Guide]][8]

### A. Installing software from source code in Linux

And that’s exactly what we will do here. For the purpose of that article, let’s say I need to install [NodeJS][9] 8.1.1 on my system. That version exactly. A version which is not available from the Debian repository:

```
sh$ apt-cache madison nodejs | grep amd64
    nodejs | 6.11.1~dfsg-1 | http://deb.debian.org/debian experimental/main amd64 Packages
    nodejs | 4.8.2~dfsg-1 | http://ftp.fr.debian.org/debian stretch/main amd64 Packages
    nodejs | 4.8.2~dfsg-1~bpo8+1 | http://ftp.fr.debian.org/debian jessie-backports/main amd64 Packages
    nodejs | 0.10.29~dfsg-2 | http://ftp.fr.debian.org/debian jessie/main amd64 Packages
    nodejs | 0.10.29~dfsg-1~bpo70+1 | http://ftp.fr.debian.org/debian wheezy-backports/main amd64 Packages
```

### Step 1: Getting the source code from GitHub

Like many open-source projects, the sources of NodeJS can be found on GitHub: [https://github.com/nodejs/node][10]

So, let’s go directly there.

![The NodeJS official GitHub repository](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-account.png)

If you’re not familiar with [GitHub][11], [git][12] or any other [version control system][13] worth mentioning the repository contains the current source for the software, as well as a history of all the modifications made through the years to that software. Eventually up to the very first line written for that project. For the developers, keeping that history has many advantages. For us today, the main one is we will be able to get the sources from for the project as they were at any given point in time. More precisely, I will be able to get the sources as they were when the 8.1.1 version I want was released. Even if there were many modifications since then.

![Choose the v8.1.1 tag in the NodeJS GitHub repository](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-choose-revision-tag.png)

On GitHub, you can use the “branch” button to navigate between different versions of the software. [“Branch” and “tags” are somewhat related concepts in Git][14]. Basically, the developers create “branch” and “tags” to keep track of important events in the project history, like when they start working on a new feature or when they publish a release. I will not go into the details here, all you need to know is I’m looking for the version  _tagged_  “v8.1.1”

![The NodeJS GitHub repository as it was at the time the v8.1.1 tag was created](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-revision-811.png)

After having chosen on the “v8.1.1” tag, the page is refreshed, the most obvious change being the tag now appears as part of the URL. In addition, you will notice the file change date are different too. The source tree you are now seeing is the one that existed at the time the v8.1.1 tag was created. In some sense, you can think of a version control tool like git as a time travel machine, allowing you to go back and forth into a project history.

![NodeJS GitHub repository download as a ZIP button](https://itsfoss.com/wp-content/uploads/2017/07/nodejs-github-revision-download-zip.png)

At this point, we can download the sources of NodeJS 8.1.1\. You can’t miss the big blue button suggesting to download the ZIP archive of the project. As of myself, I will download and extract the ZIP from the command line for the sake of the explanation. But if you prefer using a [GUI][15] tool, don’t hesitate to do that instead:

```
wget https://github.com/nodejs/node/archive/v8.1.1.zip
unzip v8.1.1.zip
cd node-8.1.1/
```

Downloading the ZIP archive works great. But if you want to do it “like a pro”, I would suggest using directly the `git` tool to download the sources. It is not complicated at all— and it will be a nice first contact with a tool you will often encounter:

```
# first ensure git is installed on your system
sh$ sudo apt-get install git
# Make a shallow clone the NodeJS repository at v8.1.1
sh$ git clone --depth 1 \
              --branch v8.1.1 \
              https://github.com/nodejs/node
sh$ cd node/
```

By the way, if you have any issue, just consider that first part of this article as a general introduction. Later I have more detailed explanations for Debian- and ReadHat-based distributions in order to help you troubleshoot common issues.

Anyway, whenever you downloaded the source using `git` or as a ZIP archive, you should now have exactly the same source files in the current directory:

```
sh$ ls
android-configure  BUILDING.md            common.gypi      doc            Makefile   src
AUTHORS            CHANGELOG.md           configure        GOVERNANCE.md  node.gyp   test
benchmark          CODE_OF_CONDUCT.md     CONTRIBUTING.md  lib            node.gypi  tools
BSDmakefile        COLLABORATOR_GUIDE.md  deps             LICENSE        README.md  vcbuild.bat
```

### Step 2: Understanding the Build System of the program

We usually talk about “compiling the sources”, but the compilation is only one of the phases required to produce a working software from its source. A build system is a set of tool and practices used to automate and articulate those different tasks in order to build entirely the software just by issuing few commands.

If the concept is simple, the reality is somewhat more complicated. Because different projects or programming language may have different requirements. Or because of the programmer’s tastes. Or the supported platforms. Or for historical reason. Or… or.. there is an almost endless list of reasons to choose or create another build system. All that to say there are many different solutions used out there.

NodeJS uses a [GNU-style build system][16]. This is a popular choice in the open source community. And once again, a good way to start your journey.

Writing and tuning a build system is a pretty complex task. But for the “end user”, GNU-style build systems resume themselves in using two tools: `configure` and `make`.

The `configure` file is a project-specific script that will check the destination system configuration and available feature in order to ensure the project can be built, eventually dealing with the specificities of the current platform.

An important part of a typical `configure` job is to build the `Makefile`. That is the file containing the instructions required to effectively build the project.

The [`make` tool][17]), on the other hand, is a POSIX tool available on any Unix-like system. It will read the project-specific `Makefile` and perform the required operations to build and install your program.

But, as always in the Linux world, you still have some latency to customize the build for your specific needs.

```
./configure --help
```

The `configure -help` command will show you all the available configuration options. Once again, this is very project-specific. And to be honest, it is sometimes required to dig into the project before fully understand the meaning of each and every configure option.

But there is at least one standard GNU Autotools option that you must know: the `--prefix` option. This has to do with the file system hierarchy and the place your software will be installed.

[Suggested read8 Vim Tips And Tricks That Will Make You A Pro User][18]

### Step 3: The FHS

The Linux file system hierarchy on a typical distribution mostly comply with the [Filesystem Hierarchy Standard (FHS)][19]

That standard explains the purpose of the various directories of your system: `/usr`, `/tmp`, `/var` and so on.

When using the GNU Autotools— and most other build systems— the default installation location for your new software will be `/usr/local`. Which is a good choice as according to the FSH  _“The /usr/local hierarchy is for use by the system administrator when installing software locally? It needs to be safe from being overwritten when the system software is updated. It may be used for programs and data that are shareable amongst a group of hosts, but not found in /usr.”_ 

The `/usr/local` hierarchy somehow replicates the root directory, and you will find there `/usr/local/bin` for the executable programs, `/usr/local/lib` for the libraries, `/usr/local/share` for architecture independent files and so on.

The only issue when using the `/usr/local` tree for custom software installation is the files for all your software will be mixed there. Especially, after having installed a couple of software, it will be hard to track to which file exactly of `/usr/local/bin` and `/usr/local/lib` belongs to which software. That will not cause any issue to the system though. After all, `/usr/bin` is just about the same mess. But that will become an issue the day you will want to remove a manually installed software.

To solve that issue, I usually prefer installing custom software in the `/opt`sub-tree instead. Once again, to quote the FHS:

_”/opt is reserved for the installation of add-on application software packages.

A package to be installed in /opt must locate its static files in a separate /opt/<package> or /opt/<provider> directory tree, where <package> is a name that describes the software package and <provider> is the provider’s LANANA registered name.”_

So we will create a sub-directory of `/opt` specifically for our custom NodeJS installation. And if someday I want to remove that software, I will simply have to remove that directory:

```
sh$ sudo mkdir /opt/node-v8.1.1
sh$ sudo ln -sT node-v8.1.1 /opt/node
# What is the purpose of the symbolic link above?
# Read the article till the end--then try to answer that
# question in the comment section!

sh$ ./configure --prefix=/opt/node-v8.1.1
sh$ make -j9 && echo ok
# -j9 means run up to 9 parallel tasks to build the software.
# As a rule of thumb, use -j(N+1) where N is the number of cores
# of your system. That will maximize the CPU usage (one task per
# CPU thread/core + a provision of one extra task when a process
# is blocked by an I/O operation.
```

Anything but “ok” after the `make` command has completed would mean there was an error during the build process. As we ran a parallel build because of the `-j` option, it is not always easy to retrieve the error message given the large volume of output produced by the build system.

In the case of issue, just restart `make`, but without the `-j` option this time. And the error should appear near the end of the output:

```
sh$ make
```

Finally, once the compilation has gone to the end, you can install your software to its location by running the command:

```
sh$ sudo make install
```

And test it:

```
sh$ /opt/node/bin/node --version
v8.1.1
```

### B. What if things go wrong while installing from source code?

What I’ve explained above is mostly what you can see on the “build instruction” page of a well-documented project. But given this article goal is to let you compile your first software from sources, it might worth taking the time to investigate some common issues. So, I will do the whole procedure again, but this time from a fresh and minimal Debian 9.0 and CentOS 7.0 systems. So you can see the error I encountered and how I solved them.

### From Debian 9.0 “Stretch”

```
itsfoss@debian:~$ git clone --depth 1 \
                             --branch v8.1.1 \
                             https://github.com/nodejs/node
-bash: git: command not found
```

This problem is quite easy to diagnosis and solve. Just install the `git` package:

```
itsfoss@debian:~$ sudo apt-get install git
```

```
itsfoss@debian:~$ git clone --depth 1 \
                             --branch v8.1.1 \
                             https://github.com/nodejs/node && echo ok
[...]
ok
```

```
itsfoss@debian:~/node$ sudo mkdir /opt/node-v8.1.1
itsfoss@debian:~/node$ sudo ln -sT node-v8.1.1 /opt/node
```

No problem here.

```
itsfoss@debian:~/node$ ./configure --prefix=/opt/node-v8.1.1/
WARNING: failed to autodetect C++ compiler version (CXX=g++)
WARNING: failed to autodetect C compiler version (CC=gcc)
Node.js configure error: No acceptable C compiler found!
        Please make sure you have a C compiler installed on your system and/or
        consider adjusting the CC environment variable if you installed
        it in a non-standard prefix.
```

Obviously, to compile a project, you need a compiler. NodeJS being written using the [C++ language][20], we need a C++ [compiler][21]. Here I will install `g++`, the GNU C++ compiler for that purpose:

```
itsfoss@debian:~/node$ sudo apt-get install g++
itsfoss@debian:~/node$ ./configure --prefix=/opt/node-v8.1.1/ && echo ok
[...]
ok
```

```
itsfoss@debian:~/node$ make -j9 && echo ok
-bash: make: command not found
```

One other missing tool. Same symptoms. Same solution:

```
itsfoss@debian:~/node$ sudo apt-get install make
itsfoss@debian:~/node$ make -j9 && echo ok
[...]
ok
```

```
itsfoss@debian:~/node$ sudo make install
[...]
itsfoss@debian:~/node$ /opt/node/bin/node --version
v8.1.1
```

Success!

Please notice: I’ve installed the various tools one by one to show how to diagnosis the compilation issues and to show you the typical solution to solve those issues. But if you search more about that topic or read other tutorials, you will discover that most distributions have “meta-packages” acting as an umbrella to install some or all the typical tools used for compiling a software. On Debian-based systems, you will probably encounter the [build-essentials][22]package for that purpose. And on Red-Hat-based distributions, that will be the  _“Development Tools”_  group.

### From CentOS 7.0

```
[itsfoss@centos ~]$ git clone --depth 1 \
                               --branch v8.1.1 \
                               https://github.com/nodejs/node
-bash: git: command not found
```

Command not found? Just install it using the `yum` package manager:

```
[itsfoss@centos ~]$ sudo yum install git
```

```
[itsfoss@centos ~]$ git clone --depth 1 \
                               --branch v8.1.1 \
                               https://github.com/nodejs/node && echo ok
[...]
ok
```

```
[itsfoss@centos ~]$ sudo mkdir /opt/node-v8.1.1
[itsfoss@centos ~]$ sudo ln -sT node-v8.1.1 /opt/node
```

```
[itsfoss@centos ~]$ cd node
[itsfoss@centos node]$ ./configure --prefix=/opt/node-v8.1.1/
WARNING: failed to autodetect C++ compiler version (CXX=g++)
WARNING: failed to autodetect C compiler version (CC=gcc)
Node.js configure error: No acceptable C compiler found!

        Please make sure you have a C compiler installed on your system and/or
        consider adjusting the CC environment variable if you installed
        it in a non-standard prefix.
```

You guess it: NodeJS is written using the C++ language, but my system lacks the corresponding compiler. Yum to the rescue. As I’m not a regular CentOS user, I actually had to search on the Internet the exact name of the package containing the g++ compiler. Leading me to that page: [https://superuser.com/questions/590808/yum-install-gcc-g-doesnt-work-anymore-in-centos-6-4][23]

```
[itsfoss@centos node]$ sudo yum install gcc-c++
[itsfoss@centos node]$ ./configure --prefix=/opt/node-v8.1.1/ && echo ok
[...]
ok
```

```
[itsfoss@centos node]$ make -j9 && echo ok
[...]
ok
```

```
[itsfoss@centos node]$ sudo make install && echo ok
[...]
ok
```

```
[itsfoss@centos node]$ /opt/node/bin/node --version
v8.1.1
```

Success. Again.

### C. Making changes to the software installed from source code

You may install a software from the source because you need a very specific version not available in your distribution repository. Or because you want to  _modify_  that program. Either to fix a bug or add a feature. After all, open-source is all about that. So I will take that opportunity to give you a taste of the power you have at hand now you are able to compile your own software.

Here, we will make a minor change to the sources of NodeJS. And we will see if our change will be incorporated into the compiled version of the software:

Open the file `node/src/node.cc` in your favorite [text editor][24] (vim, nano, gedit, … ). And try to locate that fragment of code:

```
   if (debug_options.ParseOption(argv[0], arg)) {
      // Done, consumed by DebugOptions::ParseOption().
    } else if (strcmp(arg, "--version") == 0 || strcmp(arg, "-v") == 0) {
      printf("%s\n", NODE_VERSION);
      exit(0);
    } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
      PrintHelp();
      exit(0);
    }
```

It is around [line 3830 of the file][25]. Then modify the line containing `printf` to match that one instead:

```
      printf("%s (compiled by myself)\n", NODE_VERSION);
```

Then head back to your terminal. Before going further— and to give you some more insight of the power behind git— you can check if you’ve modified the right file:

```
diff --git a/src/node.cc b/src/node.cc
index bbce1022..a5618b57 100644
--- a/src/node.cc
+++ b/src/node.cc
@@ -3828,7 +3828,7 @@ static void ParseArgs(int* argc,
     if (debug_options.ParseOption(argv[0], arg)) {
       // Done, consumed by DebugOptions::ParseOption().
     } else if (strcmp(arg, "--version") == 0 || strcmp(arg, "-v") == 0) {
-      printf("%s\n", NODE_VERSION);
+      printf("%s (compiled by myself)\n", NODE_VERSION);
       exit(0);
     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
       PrintHelp();
```

You should see a “-” (minus sign) before the line as it was before you changed it. And a “+” (plus sign) before the line after your changes.

It is now time to recompile and re-install your software:

```
make -j9 && sudo make install && echo ok
[...]
ok
```

This times, the only reason it might fail is that you’ve made a typo while changing the code. If this is the case, re-open the `node/src/node.cc` file in your text editor and fix the mistake.

Once you’ve managed to compile and install that new modified NodeJS version, you will be able to check if your modifications were actually incorporated into the software:

```
itsfoss@debian:~/node$ /opt/node/bin/node --version
v8.1.1 (compiled by myself)
```

Congratulations! You’ve made your first change to an open-source program!

### D. Let the shell locate our custom build software

You may have noticed until now, I always launched my newly compiled NodeJS software by specifying the absolute path to the binary file.

```
/opt/node/bin/node
```

It works. But this is annoying, to say the least. There are actually two common ways of fixing that. But to understand them, you must first know your shell locates the executable files by looking for them only into the directories specified by the `PATH` [environment variable][26].

```
itsfoss@debian:~/node$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```

Here, on that Debian system, if you do not specify explicitly any directory as part of a command name, the shell will first look for that executable programs into `/usr/local/bin`, then if not found into `/usr/bin`, then if not found into `/bin` then if not found into `/usr/local/games` then if not found into `/usr/games`, then if not found … the shell will report an error  _“command not found”_ .

Given that, we have two way to make a command accessible to the shell: by adding it to one of the already configured `PATH` directories. Or by adding the directory containing our executable file to the `PATH`.

### Adding a link from /usr/local/bin

Just  _copying_  the node binary executable from `/opt/node/bin` to `/usr/local/bin` would be a bad idea since by doing so, the executable program would no longer be able to locate the other required components belonging to `/opt/node/` (it’s a common practice for a software to locate its resource files relative to its own location).

So, the traditional way of doing that is by using a symbolic link:

```
itsfoss@debian:~/node$ sudo ln -sT /opt/node/bin/node /usr/local/bin/node
itsfoss@debian:~/node$ which -a node || echo not found
/usr/local/bin/node
itsfoss@debian:~/node$ node --version
v8.1.1 (compiled by myself)
```

This is a simple and effective solution, especially if a software package is made of just few well known executable programs— since you have to create a symbolic link for each and every user-invokable commands. For example, if you’re familiar with NodeJS, you know the `npm` companion application I should symlink from `/usr/local/bin` too. But I let that to you as an exercise.

### Modifying the PATH

First, if you tried the preceding solution, remove the node symbolic link created previously to start from a clear state:

```
itsfoss@debian:~/node$ sudo rm /usr/local/bin/node
itsfoss@debian:~/node$ which -a node || echo not found
not found
```

And now, here is the magic command to change your `PATH`:

```
itsfoss@debian:~/node$ export PATH="/opt/node/bin:${PATH}"
itsfoss@debian:~/node$ echo $PATH
/opt/node/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```

Simply said, I replaced the content of the `PATH` environment variable by its previous content, but prefixed by `/opt/node/bin`. So, as you can imagine it now, the shell will look first into the `/opt/node/bin` directory for executable programs. We can confirm that using the `which` command:

```
itsfoss@debian:~/node$ which -a node || echo not found
/opt/node/bin/node
itsfoss@debian:~/node$ node --version
v8.1.1 (compiled by myself)
```

Whereas the “link” solution is permanent as soon as you’ve created the symbolic link into `/usr/local/bin`, the `PATH` change is effective only into the current shell. I let you do some researches by yourself to know how to make changes of the `PATH` permanents. As a hint, it has to do with your “profile”. If you find the solution, don’t hesitate to share that with the other readers by using the comment section below!

### E. How to remove that newly installed software from source code

Since our custom compiled NodeJS software sits completely in the `/opt/node-v8.1.1` directory, removing that software is not more work than using the `rm` command to remove that directory:

```
sudo rm -rf /opt/node-v8.1.1
```

BEWARE: `sudo` and `rm -rf` are a dangerous cocktail! Always check your command twice before pressing the “enter” key. You won’t have any confirmation message and no undelete if you remove the wrong directory…

Then, if you’ve modified your `PATH`, you will have to revert those changes. Which is not complicated at all.

And if you’ve created links from `/usr/local/bin` you will have to remove them all:

```
itsfoss@debian:~/node$ sudo find /usr/local/bin \
                                 -type l \
                                 -ilname "/opt/node/*" \
                                 -print -delete
/usr/local/bin/node
```

### Wait? Where was the Dependency Hell?

As a final comment, if you read about compiling your own custom software, you might have heard about the [dependency hell][27]. This is a nickname for that annoying situation where before being able to successfully compile a software, you must first compile a pre-requisite library, which in its turn requires another library that might in its turn be incompatible with some other software you’ve already installed.

Part of the job of the package maintainers of your distribution is to actually resolve that dependency hell and to ensure the various software of your system are using compatible libraries and are installed in the right order.

In that article, I chose on purpose to install NodeJS as it virtually doesn’t have dependencies. I said “virtually” because, in fact, it  _has_  dependencies. But the source code of those dependencies are present in the source repository of the project (in the `node/deps` subdirectory), so you don’t have to download and install them manually before hand.

But if you’re interested in understanding more about that problem and learn how to deal with it, let me know that using the comment section below: that would be a great topic for a more advanced article!

--------------------------------------------------------------------------------

作者简介：

Engineer by Passion, Teacher by Vocation. My goals : to share my enthusiasm for what I teach and prepare my students to develop their skills by themselves. You can find me on my website as well.

--------------------

via: https://itsfoss.com/install-software-from-source-code/

作者：[Sylvain Leroux ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/sylvain/
[1]:https://itsfoss.com/author/sylvain/
[2]:https://itsfoss.com/install-software-from-source-code/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Finstall-software-from-source-code%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=How+to+Install+Software+from+Source+Code%E2%80%A6+and+Remove+it+Afterwards&url=https://itsfoss.com/install-software-from-source-code/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=Yes_I_Know_IT
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Finstall-software-from-source-code%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Finstall-software-from-source-code%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.reddit.com/submit?url=https://itsfoss.com/install-software-from-source-code/&title=How+to+Install+Software+from+Source+Code%E2%80%A6+and+Remove+it+Afterwards
[8]:https://itsfoss.com/remove-install-software-ubuntu/
[9]:https://nodejs.org/en/
[10]:https://github.com/nodejs/node
[11]:https://en.wikipedia.org/wiki/GitHub
[12]:https://en.wikipedia.org/wiki/Git
[13]:https://en.wikipedia.org/wiki/Version_control
[14]:https://stackoverflow.com/questions/1457103/how-is-a-tag-different-from-a-branch-which-should-i-use-here
[15]:https://en.wikipedia.org/wiki/Graphical_user_interface
[16]:https://en.wikipedia.org/wiki/GNU_Build_System
[17]:https://en.wikipedia.org/wiki/Make_%28software
[18]:https://itsfoss.com/pro-vim-tips/
[19]:http://www.pathname.com/fhs/
[20]:https://en.wikipedia.org/wiki/C%2B%2B
[21]:https://en.wikipedia.org/wiki/Compiler
[22]:https://packages.debian.org/sid/build-essential
[23]:https://superuser.com/questions/590808/yum-install-gcc-g-doesnt-work-anymore-in-centos-6-4
[24]:https://en.wikipedia.org/wiki/List_of_text_editors
[25]:https://github.com/nodejs/node/blob/v8.1.1/src/node.cc#L3830
[26]:https://en.wikipedia.org/wiki/Environment_variable
[27]:https://en.wikipedia.org/wiki/Dependency_hell
