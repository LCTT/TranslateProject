[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A quick introduction to Toolbox on Fedora)
[#]: via: (https://fedoramagazine.org/a-quick-introduction-to-toolbox-on-fedora/)
[#]: author: (Ryan Walter https://fedoramagazine.org/author/rwaltr/)

A quick introduction to Toolbox on Fedora
======

![][1]

Toolbox allows you to [sort and manage your development environments in containers][2] without requiring root privileges or manually attaching volumes. It creates a container where you can install your own CLI tools, without installing them on the base system itself. You can also utilize it when you do not have root access or cannot install programs directly. This article gives you an introduction to toolbox and what it does.

### Installing Toolbox

[Silverblue][3] includes Toolbox by default. For the Workstation and Server editions, you can grab it from the default repositories using _dnf install toolbox_.

### Creating Toolboxes

Open your terminal and run _toolbox enter_. The utility will automatically request permission to download the latest image, create your first container, and place your shell inside this container.

```
$ toolbox enter
No toolbox containers found. Create now? [y/N] y
Image required to create toolbox container.
Download registry.fedoraproject.org/f30/fedora-toolbox:30 (500MB)? [y/N]: y
```

Currently there is no difference between the toolbox and your base system. Your filesystems and packages appear unchanged. Here is an example using a repository that contains documentation source for a resume under a _~/src/resume_ folder. The resume is built using the _pandoc_ tool.

```
$ pwd
/home/rwaltr
$ cd src/resume/
$ head -n 5 Makefile
all: pdf html rtf text docx

pdf: init
 pandoc -s -o BUILDS/resume.pdf markdown/*

$ make pdf
bash: make: command not found
$ pandoc -v
bash: pandoc: command not found
```

This toolbox does not have the programs required to build the resume. You can remedy this by installing the tools with _dnf_. You will not be prompted for the root password, because you are running in a container.

```
$ sudo dnf groupinstall "Authoring and Publishing" -y && sudo dnf install pandoc make -y
...
$ make all #Successful builds
mkdir -p BUILDS
pandoc -s -o BUILDS/resume.pdf markdown/*
pandoc -s -o BUILDS/resume.html markdown/*
pandoc -s -o BUILDS/resume.rtf markdown/*
pandoc -s -o BUILDS/resume.txt markdown/*
pandoc -s -o BUILDS/resume.docx markdown/*
$ ls BUILDS/
resume.docx  resume.html  resume.pdf  resume.rtf  resume.txt
```

Run _exit_ at any time to exit the toolbox.

```
$ cd BUILDS/
$ pandoc --version || ls
pandoc 2.2.1
Compiled with pandoc-types 1.17.5.4, texmath 0.11.1.2, skylighting 0.7.5
...
for a particular purpose.
resume.docx  resume.html  resume.pdf  resume.rtf  resume.txt
$ exit
logout
$ pandoc --version || ls
bash: pandoc: command not found...
resume.docx  resume.html  resume.pdf  resume.rtf  resume.txt
```

You retain the files created by your toolbox in your home directory. None of the programs installed in your toolbox will be available outside of it.

### Tips and tricks

This introduction to toolbox only scratches the surface. Here are some additional tips, but you can also check out [the official documentation][2].

  * _Toolbox –help_ will show you the man page for Toolbox
  * You can have multiple toolboxes at once. Use _toolbox create -c Toolboxname_ and _toolbox enter -c Toolboxname_
  * Toolbox uses [Podman][4] to do the heavy lifting. Use _toolbox list_ to find the IDs of the containers Toolbox creates. Podman can use these IDs to perform actions such as _rm_ and _stop_. (You can also read more about Podman [in this Magazine article][5].)



* * *

_Photo courtesy of [Florian Richter][6] from [Flickr][7]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/a-quick-introduction-to-toolbox-on-fedora/

作者：[Ryan Walter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rwaltr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/toolbox-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
[3]: https://fedoramagazine.org/what-is-silverblue/
[4]: https://podman.io/
[5]: https://fedoramagazine.org/running-containers-with-podman/
[6]: https://flickr.com/photos/florianric/
[7]: https://flickr.com/photos/florianric/7263382550/
