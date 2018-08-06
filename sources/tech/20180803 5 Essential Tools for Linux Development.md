5 Essential Tools for Linux Development
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dev-tools.png?itok=kkDNylRg)

Linux has become a mainstay for many sectors of work, play, and personal life. We depend upon it. With Linux, technology is expanding and evolving faster than anyone could have imagined. That means Linux development is also happening at an exponential rate. Because of this, more and more developers will be hopping on board the open source and Linux dev train in the immediate, near, and far-off future. For that, people will need tools. Fortunately, there are a ton of dev tools available for Linux; so many, in fact, that it can be a bit intimidating to figure out precisely what you need (especially if you’re coming from another platform).

To make that easier, I thought I’d help narrow down the selection a bit for you. But instead of saying you should use Tool X and Tool Y, I’m going to narrow it down to five categories and then offer up an example for each. Just remember, for most categories, there are several available options. And, with that said, let’s get started.

### Containers

Let’s face it, in this day and age you need to be working with containers. Not only are they incredibly easy to deploy, they make for great development environments. If you regularly develop for a specific platform, why not do so by creating a container image that includes all of the tools you need to make the process quick and easy. With that image available, you can then develop and roll out numerous instances of whatever software or service you need.

Using containers for development couldn’t be easier than it is with [Docker][1]. The advantages of using containers (and Docker) are:

  * Consistent development environment.

  * You can trust it will “just work” upon deployment.

  * Makes it easy to build across platforms.

  * Docker images available for all types of development environments and languages.

  * Deploying single containers or container clusters is simple.




Thanks to [Docker Hub][2], you’ll find images for nearly any platform, development environment, server, service… just about anything you need. Using images from Docker Hub means you can skip over the creation of the development environment and go straight to work on developing your app, server, API, or service.

Docker is easily installable of most every Linux platform. For example: To install Docker on Ubuntu, you only have to open a terminal window and issue the command:
```
sudo apt-get install docker.io

```

With Docker installed, you’re ready to start pulling down specific images, developing, and deploying (Figure 1).

![Docker images][4]

Figure 1: Docker images ready to deploy.

[Used with permission][5]

### Version control system

If you’re working on a large project or with a team on a project, you’re going to need a version control system. Why? Because you need to keep track of your code, where your code is, and have an easy means of making commits and merging code from others. Without such a tool, your projects would be nearly impossible to manage. For Linux users, you cannot beat the ease of use and widespread deployment of [Git][6] and [GitHub][7]. If you’re new to their worlds, Git is the version control system that you install on your local machine and GitHub is the remote repository you use to upload (and then manage) your projects. Git can be installed on most Linux distributions. For example, on a Debian-based system, the install is as simple as:
```
sudo apt-get install git

```

Once installed, you are ready to start your journey with version control (Figure 2).

![Git installed][9]

Figure 2: Git is installed and available for many important tasks.

[Used with permission][5]

Github requires you to create an account. You can use it for free for non-commercial projects, or you can pay for commercial project housing (for more information check out the price matrix [here][10]).

### Text editor

Let’s face it, developing on Linux would be a bit of a challenge without a text editor. Of course what a text editor is varies, depending upon who you ask. One person might say vim, emacs, or nano, whereas another might go full-on GUI with their editor. But since we’re talking development, we need a tool that can meet the needs of the modern day developer. And before I mention a couple of text editors, I will say this: Yes, I know that vim is a serious workhorse for serious developers and, if you know it well vim will meet and exceed all of your needs. However, getting up to speed enough that it won’t be in your way, can be a bit of a hurdle for some developers (especially those new to Linux). Considering my goal is to always help win over new users (and not just preach to an already devout choir), I’m taking the GUI route here.

As far as text editors are concerned, you cannot go wrong with the likes of [Bluefish][11]. Bluefish can be found in most standard repositories and features project support, multi-threaded support for remote files, search and replace, open files recursively, snippets sidebar, integrates with make, lint, weblint, xmllint, unlimited undo/redo, in-line spell checker, auto-recovery, full screen editing, syntax highlighting (Figure 3), support for numerous languages, and much more.

![Bluefish][13]

Figure 3: Bluefish running on Ubuntu Linux 18.04.

[Used with permission][5]

### IDE

Integrated Development Environment (IDE) is a piece of software that includes a comprehensive set of tools that enable a one-stop-shop environment for developing. IDEs not only enable you to code your software, but document and build them as well. There are a number of IDEs for Linux, but one in particular is not only included in the standard repositories it is also very user-friendly and powerful. That tool in question is [Geany][14]. Geany features syntax highlighting, code folding, symbol name auto-completion, construct completion/snippets, auto-closing of XML and HTML tags, call tips, many supported filetypes, symbol lists, code navigation, build system to compile and execute your code, simple project management, and a built-in plugin system.

Geany can be easily installed on your system. For example, on a Debian-based distribution, issue the command:
```
sudo apt-get install geany

```

Once installed, you’re ready to start using this very powerful tool that includes a user-friendly interface (Figure 4) that has next to no learning curve.

![Geany][16]

Figure 4: Geany is ready to serve as your IDE.

[Used with permission][5]

### diff tool

There will be times when you have to compare two files to find where they differ. This could be two different copies of what was the same file (only one compiles and the other doesn’t). When that happens, you don’t want to have to do that manually. Instead, you want to employ the power of tool like [Meld][17]. Meld is a visual diff and merge tool targeted at developers. With Meld you can make short shrift out of discovering the differences between two files. Although you can use a command line diff tool, when efficiency is the name of the game, you can’t beat Meld.

Meld allows you to open a comparison between to files and it will highlight the differences between each. Meld also allows you to merge comparisons either from the right or the left (as the files are opened side by side - Figure 5).

![Comparing two files][19]

Figure 5: Comparing two files with a simple difference.

[Used with permission][5]

Meld can be installed from most standard repositories. On a Debian-based system, the installation command is:
```
sudo apt-get install meld

```

### Working with efficiency

These five tools not only enable you to get your work done, they help to make it quite a bit more efficient. Although there are a ton of developer tools available for Linux, you’re going to want to make sure you have one for each of the above categories (maybe even starting with the suggestions I’ve made).

Learn more about Linux through the free ["Introduction to Linux" ][20]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/8/5-essential-tools-linux-development

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.docker.com/
[2]:https://hub.docker.com/
[3]:/files/images/5devtools1jpg
[4]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_1.jpg?itok=V1Bsbkg9 (Docker images)
[5]:/licenses/category/used-permission
[6]:https://git-scm.com/
[7]:https://github.com/
[8]:/files/images/5devtools2jpg
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_2.jpg?itok=YJjhe4O6 (Git installed)
[10]:https://github.com/pricing
[11]:http://bluefish.openoffice.nl/index.html
[12]:/files/images/5devtools3jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_3.jpg?itok=66A7Svme (Bluefish)
[14]:https://www.geany.org/
[15]:/files/images/5devtools4jpg
[16]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_4.jpg?itok=jRcA-0ue (Geany)
[17]:http://meldmerge.org/
[18]:/files/images/5devtools5jpg
[19]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/5devtools_5.jpg?itok=eLkfM9oZ (Comparing two files)
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
