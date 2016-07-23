Being translated by ChrisLeeGit

Getting started with Git
=========================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/get_started_lead.jpeg?itok=r22AKc6P)
>Image by : opensource.com


In the introduction to this series we learned who should use Git, and what it is for. Today we will learn how to clone public Git repositories, and how to extract individual files without cloning the whole works.

Since Git is so popular, it makes life a lot easier if you're at least familiar with it at a basic level. If you can grasp the basics (and you can, I promise!), then you'll be able to download whatever you need, and maybe even contribute stuff back. And that, after all, is what open source is all about: having access to the code that makes up the software you run, the freedom to share it with others, and the right to change it as you please. Git makes this whole process easy, as long as you're comfortable with Git.

So let's get comfortable with Git.

### Read and write

Broadly speaking, there are two ways to interact with a Git repository: you can read from it, or you can write to it. It's just like a file: sometimes you open a document just to read it, and other times you open a document because you need to make changes.

In this article, we'll cover reading from a Git repository. We'll tackle the subject of writing back to a Git repository in a later article.

### Git or GitHub?

A word of clarification: Git is not the same as GitHub (or GitLab, or Bitbucket). Git is a command-line program, so it looks like this:

```
$ git
usage: Git [--version] [--help] [-C <path>] 
  [-p | --paginate | --no-pager] [--bare]
  [--Git-dir=<path>] <command> [<args>]

```

As Git is open source, lots of smart people have built infrastructures around it which, in themselves, have become very popular.

My articles about Git teach pure Git first, because if you understand what Git is doing then you can maintain an indifference to what front end you are using. However, my articles also include common ways of accomplishing each task through popular Git services, since that's probably what you'll encounter first.

### Installing Git

To install Git on Linux, grab it from your distribution's software repository. BSD users should find Git in the Ports tree, in the devel section.

For non-open source operating systems, go to the [project site][1] and follow the instructions. Once installed, there should be no difference between Linux, BSD, and Mac OS X commands. Windows users will have to adapt Git commands to match the Windows file system, or install Cygwin to run Git natively, without getting tripped up by Windows file system conventions.

### Afternoon tea with Git

Not every one of us needs to adopt Git into our daily lives right away. Sometimes, the most interaction you have with Git is to visit a repository of code, download a file or two, and then leave. On the spectrum of getting to know Git, this is more like afternoon tea than a proper dinner party. You make some polite conversation, you get the information you need, and then you part ways without the intention of speaking again for at least another three months.

And that's OK.

Generally speaking, there are two ways to access Git: via command line, or by any one of the fancy Internet technologies providing quick and easy access through the web browser.

Say you want to install a trash bin for use in your terminal because you've been burned one too many times by the rm command. You've heard about Trashy, which calls itself "a sane intermediary to the rm command", and you want to look over its documentation before you install it. Lucky for you, [Trashy is hosted publicly on GitLab.com][2].

### Landgrab

The first way we'll work with this Git repository is a sort of landgrab method: we'll clone the entire thing, and then sort through the contents later. Since the repository is hosted with a public Git service, there are two ways to do this: on the command line, or through a web interface.

To grab an entire repository with Git, use the git clone command with the URL of the Git repository. If you're not clear on what the right URL is, the repository should tell you. GitLab gives you a copy-and-paste repository URL [for Trashy][3].

![](https://opensource.com/sites/default/files/1_gitlab-url.jpg)

You might notice that on some services, both SSH and HTTPS links are provided. You can use SSH only if you have write permissions to the repository. Otherwise, you must use the HTTPS URL.

Once you have the right URL, cloning the repository is pretty simple. Just git clone the URL, and optionally name the directory to clone it into. The default behaviour is to clone the git directory to your current directory; for example, 'trashy.git' gets put in your current location as 'trashy'. I use the .clone extension as a shorthand for repositories that are read-only, and the .git extension as shorthand for repositories I can read and write, but that's not by any means an official mandate.

```
$ git clone https://gitlab.com/trashy/trashy.git trashy.clone
Cloning into 'trashy.clone'...
remote: Counting objects: 142, done.
remote: Compressing objects: 100% (91/91), done.
remote: Total 142 (delta 70), reused 103 (delta 47)
Receiving objects: 100% (142/142), 25.99 KiB | 0 bytes/s, done.
Resolving deltas: 100% (70/70), done.
Checking connectivity... done.
```

Once the repository has been cloned successfully, you can browse files in it just as you would any other directory on your computer.

The other way to get a copy of the repository is through the web interface. Both GitLab and GitHub provide a snapshot of any repository in a .zip file. GitHub has a big green download button, but on GitLab, look for an inconspicuous download button on the far right of your browser window:

![](https://opensource.com/sites/default/files/1_gitlab-zip.jpg)

### Pick and choose

An alternate method of obtaining a file from a Git repository is to find the file you're after and pluck it right out of the repository. This method is only supported via web interfaces, which is essentially you looking at someone else's clone of a repository; you can think of it as a sort of HTTP shared directory.

The problem with using this method is that you might find that certain files don't actually exist in a raw Git repository, as a file might only exist in its complete form after a make command builds the file, which won't happen until you download the repository, read the README or INSTALL file, and run the command. Assuming, however, that you are sure a file does exist and you just want to go into the repository, grab it, and walk away, you can do that.

In GitLab and GitHub, click the Files link for a file view, view the file in Raw mode, and use your web browser's save function, e.g. in Firefox, File > Save Page As. In a GitWeb repository (a web view of personal git repositories used some who prefer to host git themselves), the Raw view link is in the file listing view.

![](https://opensource.com/sites/default/files/1_webgit-file.jpg)

### Best practices

Generally, cloning an entire Git repository is considered the right way of interacting with Git. There are a few reasons for this. Firstly, a clone is easy to keep updated with the git pull command, so you won't have to keep going back to some web site for a new copy of a file each time an improvement has been made. Secondly, should you happen to make an improvement yourself, then it is easier to submit those changes to the original author if it is all nice and tidy in a Git repository.

For now, it's probably enough to just practice going out and finding interesting Git repositories and cloning them to your drive. As long as you know the basics of using a terminal, then it's not hard to do. Don't know the basics of terminal usage? Give me five more minutes of your time.

### Terminal basics

The first thing to understand is that all files have a path. That makes sense; if I told you to open a file for me on a regular non-terminal day, you'd have to get to where that file is on your drive, and you'd do that by navigating a bunch of computer windows until you reached that file. For example, maybe you'd click your home directory > Pictures > InktoberSketches > monkey.kra.

In that scenario, we could say that the file monkeysketch.kra has the path $HOME/Pictures/InktoberSketches/monkey.kra.

In the terminal, unless you're doing special sysadmin work, your file paths are generally going to start with $HOME (or, if you're lazy, just the ~ character) followed by a list of folders up to the filename itself. This is analogous to whatever icons you click in your GUI to reach the file or folder.

If you want to clone a Git repository into your Documents directory, then you could open a terminal and run this command:

```
$ git clone https://gitlab.com/foo/bar.git 
$HOME/Documents/bar.clone
```

Once that is complete, you can open a file manager window, navigate to your Documents folder, and you'll find the bar.clone directory waiting for you.

If you want to get a little more advanced, you might revisit that repository at some later date, and try a git pull to see if there have been updates to the project:

```
$ cd $HOME/Documents/bar.clone
$ pwd
bar.clone
$ git pull
```

For now, that's all the terminal commands you need to get started, so go out and explore. The more you do it, the better you get at it, and that is, at least give or take a vowel, the name of the game.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/7/stumbling-git

作者：[Seth Kenlon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]: https://git-scm.com/download
[2]: https://gitlab.com/trashy/trashy
[3]: https://gitlab.com/trashy/trashy.git
 
