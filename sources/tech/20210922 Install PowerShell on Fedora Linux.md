[#]: subject: "Install PowerShell on Fedora Linux"
[#]: via: "https://fedoramagazine.org/install-powershell-on-fedora-linux/"
[#]: author: "TheEvilSkeletonOzymandias42 https://fedoramagazine.org/author/theevilskeleton/https://fedoramagazine.org/author/ozymandias42/"
[#]: collector: "lujun9972"
[#]: translator: "cool-summer-021"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install PowerShell on Fedora Linux
======

![][1]

Photos by [NOAA][2] and [Cedric Fox][3] on [Unsplash][4]

PowerShell (also written pwsh) is a powerful open source command-line and object-oriented shell developed and maintained by Microsoft. It is syntactically verbose and intuitive for the user. This article is a guide on how to install PowerShell on the host and inside a Podman or Toolbox container.

### Table of contents

  * [Why use PowerShell][5]
    * [Demonstration][6]
    * [Comparison between Bash and PowerShell][7]
  * [Install PowerShell][8]
    * [Install PowerShell on a host using the package manager][9]
      * [Method 1: Microsoft repositories][10]
      * [Method 2: RPM file][11]
    * [Install via container][12]
      * [Method 1: Podman container][13]
      * [Method 2: Fedora Linux Toolbox container][14]



### Why use PowerShell

PowerShell, as the name suggests, is _power_ful. The syntax is verbose and semantically clear to the end user. For those that don’t want to write long commands all the time, most commands are aliased. The aliases can be viewed with _Get-Alias_ or [here][15].

The most important difference between PowerShell and traditional shells, however, is its output pipeline. While normal shells output strings or character streams, PowerShell outputs objects. This has far reaching implications for how command pipelines work and comes with quite a few advantages.

#### Demonstration

The following examples illustrate the verbosity and simplicity. Lines that start with the pound symbol (**#**) are comments. Lines that start with **PS &gt;** are commands, **PS &gt;** being the prompt:

```
# Return all files greater than 50MB in the current directory.
## Longest form
PS > Get-Childitem | Where-Object Length -gt 50MB
## Shortest form (with use of aliases)
PS > gci | ? Length -gt 40MB
## Output looks like this
    Directory: /home/Ozymandias42/Downloads
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-----          20/08/2020    13:55     2000683008 40MB-file.img


# In order: get VMs, get snapshots, only select the last 3 and remove selected list:
PS > Get-VM VM-1 | Get-Snapshot | Select-Object -Last 3 | Remove-Snapshot
```

What this shows quite well is that input-output reformatting with tools like _cut_, _sed_, _awk_ or similar, which Bash scripts often need, is usually not necessary in PowerShell. The reason for this is that PowerShell works fundamentally different than traditional POSIX shells such as Bash, Zsh, or other shells like Fish. The commands of traditional shells are output as strings whereas in PowerShell they are output as objects.

#### Comparison between Bash and PowerShell

The following example illustrates the advantages of the object-output in PowerShell in contrast to the traditional string-output in Bash. Suppose you want a script that outputs all processes that occupy 200MB or more in RAM. With Bash, this might look something like this:

```
$ ps -eO rss | awk -F' ' \
    '{ if($2 >= (1024*200)) { \
        printf("%s\t%s\t%s\n",$1,$2,$6);} \
     }'

PID    RSS     COMMAND
A      B       C
[...]
```

The first obvious difference is readability or more specifically, semantic clarity. Neither _ps_ nor _awk_ are self-descriptive. _ps_ shows the **p**rocess **s**tatus and _awk_ is a text processing tool and language whose letters are the initials of its developers’ last names, **A**ho, **W**einberger, **K**ernighan (see [Wikipedia][16]). Before contrasting it with PowerShell however, examine the script:

  * _ps -e_ outputs all running processes;

  * _-O rss_ outputs the default output of _ps_ plus the amount of kilobytes each process uses, the _rss_ field; this output looks like this:

```
PID  RSS   S TTY TIME     COMMAND  1    13776 S ?   00:00:01 /usr/lib/systemd/systemd
```

  * | pipe operator uses the output of the command on the left side as input for the command on the right side.

  * _awk -F’ ‘_ declares “space” as the input field separator. So going with the above example, PID is the first, RSS the second and so on.

  * _‘{ if($2 &gt;= (1024*200)_ is the beginning of the actual AWK-script. It checks whether field 2 ([RSS][17]) contains a number larger than or equal to 1024*200KB (204800KB, or 200MB);

  * _{ printf(“%s\t%s\t%s\n”,$1,$2,$6);} }’_ continues the script. If the previous part evaluates to true, this outputs the first, second and sixth field ([PID][18], [RSS][17] and COMMAND fields respectively).




With this in mind, step back and look at what was required for this script to be written and for it to work:

  * The input command _ps_ had to have the field we wanted to filter against in its output. This was not the case by default and required us to use the _-O_ flag with the _rss_ field as argument.
  * We had to treat the output of _ps_ as a list of input fields, requiring us to know their order and structure. Or in other words, we had to at least _know_ that _RSS_ would be the second field. Meaning we had to know how the output of _ps_ would look beforehand.
  * We then had to know what unit the data we were filtering against was in as well as what unit the processing tool would work in. Meaning we had to know that the _RSS_ field uses kilobytes and that _awk_ does too. Otherwise we would not have been able to write the expression _($2 &lt;= 1024*200)_



Now, contrast the above with the PowerShell equivalent:

```
# Longest form
PS > Get-Process | Where-Object WorkingSet -ge 200MB
# Shortest form (with use of aliases)
PS > gps | ? ws -ge 200MB

NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName
------    -----      -----     ------      --  -- -----------
     A        B          C          D       E   F           G
[...]
```

This first thing to notice is that we have perfect semantic clarity. The commands are perfectly self-descriptive in what they do.

Furthermore there is no requirement for input-output reformatting, nor is there concern about the unit used by the input command. The reason for this is that PowerShell does not output strings, but objects.

To understand this think about the following. In Bash the output of a command is equal to that what it prints out in the terminal. In PowerShell what is printed on the terminal is not equal to the information, that is actually available. This is, because the output-printing system in PowerShell also works with objects. So every command in PowerShell marks some of the properties of its output objects as printable and others not. However, it always includes all properties, whereas Bash only includes what it actually prints. One can think of it like JSON objects. Where output in Bash would be separated into “fields” by a delimiter such as a space or tab, it becomes an easily addressable object property in PowerShell, with the only requirement being, that one has to know its name. Like _WorkingSet_ in the above example.

To see all available properties of a command’s output objects and their types, one can simply do something like:

```
PS > Get-Process | Get-Member
```

### Install PowerShell

PowerShell is available in several package formats, including RPM used by Fedora Linux. This article shows how to install PowerShell on Fedora Linux using various methods.

I recommend installing it natively. But I will also show how to do it in a container. I will show using both the official Microsoft PowerShell container and a Fedora Linux 30 toolbox container. The advantage of the container-method is that it’s guaranteed to work, since all dependencies are bundled in it, and isolation from the host. Regardless, I recommend doing it natively, despite the official docs only explicitly stating Fedora Linux releases 28 to 30 as being supported.

**Note:** Supported means guaranteed to work. It does not necessarily mean incompatible with other releases. This means, that while not guaranteed, releases higher than 30 should still work. They did in fact work in our tests.

It is more difficult to set up PowerShell and run it in a container than to run it directly on a host. It takes more time to install and you will not be able to run host commands directly.

#### Install PowerShell on a host using the package manager

##### Method 1: Microsoft repositories

Installation is as straight-forward as can be and the procedure doesn’t differ from any other software installed through third party repositories.

It can be split into four general steps:

  1. Adding the new repository’s GPG key
  2. Adding repository to DNF repository list
  3. Refreshing DNF cache to include available packages from the new repository
  4. Installing new packages



Powershell is then launched with the command _pwsh_.

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
$ sudo dnf makecache
$ sudo dnf install powershell
$ pwsh
```

To remove the repository and packages, run the following.

```
$ sudo rm /etc/yum.repos.d/microsoft.repo
$ sudo dnf remove powershell
```

##### Method 2: RPM file

This method is not meaningfully different from the first method. In fact it adds the GPG key and the repository implicitly when installing the RPM file. This is because the RPM file contains the link to both in it’s metadata.

First, get the _.rpm_ file for the version you want from the [PowerShell Core GitHub repository][19]. See the readme.md
“Get Powershell” table for links.

Second, enter the following:

```
$ sudo dnf install powershell-<version>.rhel.7.<architecture>.rpm
```

Substitute _&lt;version&gt;_ and _&lt;architecture&gt;_ with the version and architecture you want to use respectively, for example [powershell-7.1.3-1.rhel.7.x86_64.rpm][20].

Alternatively you could even run it with the link instead, skipping the need to download it first.

```
$ sudo dnf install https://github.com/PowerShell/PowerShell/releases/download/v<version>/powershell-<version>.rhel.7.<architecture>.rpm
```

To remove PowerShell, run the following.

```
$ sudo dnf remove powershell
```

#### Install via container

##### Method 1: Podman container

Podman is an [Open Container Initiative][21] (OCI) compliant drop-in replacement for Docker.

Microsoft provides a [PowerShell Docker container][22]. The following example will use that container with Podman.

For more information about Podman, visit [Podman.io][23]. Fedora Magazine has a [tag][24] dedicated to Podman.

To use PowerShell in Podman, run the following script:

```
$ podman run \
 -it \
 --privileged \
 --rm \
 --name powershell \
 --env-host \
 --net=host --pid=host --ipc=host \
 --volume $HOME:$HOME \
 --volume /:/var/host \
 mcr.microsoft.com/powershell \
 /usr/bin/pwsh -WorkingDirectory $(pwd)
```

This script creates a Podman container for PowerShell and immediately attaches to it. It also mounts the _/home_ and the host’s root directories into the container so they’re available there. However, the host’s root directory is available in _/var/host_.

Unfortunately, you can only indirectly run host commands while inside the container. As a workaround, run _chroot /var/host_ to chroot to the root and then run host commands.

To break the command down, everything is mandatory unless specified:

  * -it creates a persistent environment that does not kick you out when you enter it;
  * \--privileged gives extended privileges to the container (optional);
  * \--rm removes the container when you exit;
  * \--name powershell sets the name of the container to _powershell_;
  * \--env-host sets all host environment variables to the container’s variables (optional);
  * \--volume $HOME:$HOME mounts the user directory;
  * \--volume /:/var/host mounts the root directory to _/var/host_ (optional);
  * \--net=host --pid=host --ipc=host runs the process in the host’s namespaces instead of a separate set of namespaces for the contained process;
  * docker.io/microsoft/powershell enters the container;
  * /usr/bin/pwsh -WorkingDirectory $(pwd) enters the container in the current directory (optional).



Optional but very convenient: alias _pwsh_ with the script to easily access the Podman container by typing _pwsh_.

To remove the PowerShell image, run the following.

```
$ podman rmi mcr.microsoft.com/powershell
```

##### Method 2: Fedora Linux Toolbox container

Toolbox is an elegant solution to setup persistent environments without affecting the host system as a whole. It acts as a wrapper around Podman and takes care of supplying a lot of the flags demonstrated in the previous method. For this reason, Toolbox is a lot easier to use than Podman. It was designed to work for development and debugging. With Toolbox, you can run any command the same as you would directly on the Fedora Workstation host (including _dnf_).

The installation procedure is similar to the installation on the host methods, with the only difference being that those steps are done inside a container. Make sure you have the _toolbox_ package installed.

Preparing and entering the Fedora 34 Toolbox container is a two step process:

  1. Creating the Fedora 34 Toolbox container
  2. Running the Fedora 34 Toolbox container



```
$ toolbox create --image registry.fedoraproject.org/f34/fedora-toolbox
$ toolbox enter --container fedora-toolbox
```

Then, follow the instructions at [Method 1: Microsoft repositories][10].

Optional but very convenient: alias _pwsh_ with _toolbox run –container fedora-toolbox_ _pwsh_ to easily access the Toolbox container by typing _pwsh_.

To remove the Toolbox container, make certain you have stopped the Toolbox session by entering _exit_ and then run the following:

```
$ podman kill fedora-toolbox
$ toolbox rm fedora-toolbox
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-powershell-on-fedora-linux/

作者：[TheEvilSkeletonOzymandias42][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/theevilskeleton/https://fedoramagazine.org/author/ozymandias42/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/powershell-816x345.jpg
[2]: https://unsplash.com/@noaa?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/@thecedfox?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/shell?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: tmp.c7U2gcu9Hl#why-use-powershell
[6]: tmp.c7U2gcu9Hl#demonstration
[7]: tmp.c7U2gcu9Hl#comparison-between-bash-and-powershell
[8]: tmp.c7U2gcu9Hl#install-powershell
[9]: tmp.c7U2gcu9Hl#install-on-host-via-package-manager
[10]: tmp.c7U2gcu9Hl#method-1-microsoft-repositories
[11]: tmp.c7U2gcu9Hl#method-2-rpm-file
[12]: tmp.c7U2gcu9Hl#install-via-container
[13]: tmp.c7U2gcu9Hl#method-1-podman-container
[14]: tmp.c7U2gcu9Hl#method-2-fedora-toolbox-container
[15]: https://ilovepowershell.com/2011/11/03/list-of-top-powershell-alias/
[16]: https://en.wikipedia.org/wiki/AWK
[17]: https://en.wikipedia.org/wiki/Resident_set_size
[18]: https://en.wikipedia.org/wiki/Process_identifier
[19]: https://github.com/PowerShell/PowerShell
[20]: https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/powershell-7.1.3-1.rhel.7.x86_64.rpm
[21]: https://opencontainers.org/
[22]: https://hub.docker.com/_/microsoft-powershell
[23]: https://podman.io/
[24]: https://fedoramagazine.org/tag/podman/
