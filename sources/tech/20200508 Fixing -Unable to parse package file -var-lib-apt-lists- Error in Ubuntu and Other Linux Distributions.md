[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fixing “Unable to parse package file /var/lib/apt/lists” Error in Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/unable-to-parse-package-file/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Fixing “Unable to parse package file /var/lib/apt/lists” Error in Ubuntu and Other Linux Distributions
======

I have discussed a number of [Ubuntu update errors][1] in the past. If you [use the command line to update Ubuntu][2], you might run into some ‘errors’.

Some of these ‘errors’ are basically built-in features to prevent unwarranted changes to your system. I am not going into those details in this quick tutorial.

In this quick tip, I’ll show you how to tackle the following error that you could encounter while updating your system or installing new software:

**Reading package lists… Error!
E: Unable to parse package file /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease
E: The package lists or status file could not be parsed or opened.**

A similar error can be encountered in Debian:

**E: Unable to parse package file /var/lib/apt/extended_states (1)**

There is absolutely no need to panic even thought it says ‘**The package cache file is corrupted**‘. This is really easy to ‘fix’.

### Handling “Unable to parse package file” error in Ubuntu and Debian-based Linux distributions

![][3]

Here’s what you need to do. Take a closer look at the name and path of the file the [Ubuntu][4] is complaining about.

Reading package lists… Error!
**E: Unable to parse package file /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease**
E: The package lists or status file could not be parsed or opened.

For example, in the above error, it was complaining about /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease

This gives you the idea that something is not right with this file. Now all you need to do is to remove this file and regenerate the cache.

```
sudo rm <file_that_is_not_parsed>
```

So in my case, I could use this command: **sudo rm /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease** and then rebuild the cache with sudo apt update command.

#### Step by step for beginners

If you are familiar with Linux commands, you may know how to do delete the file with its absolute path. For novice users, let me guide you to safely delete the file.

First, you should go to the directory where the file is stored:

```
cd /var/lib/apt/lists/
```

Now delete the file which is not being parsed:

```
sudo rm archive.ubuntu.com_ubuntu_dists_bionic_InRelease
```

Now if you run the update again, the apt cache will be regenerated.

```
sudo apt update
```

#### Too many files cannot be parsed?

This is fine if you have one or two files that are not being parsed while updating the system. But if the system complains about ten or twenty such files, removing them one by one is too tiring.

What you can do in such a case to remove the entire cache and then generate it again:

```
sudo rm -r /var/lib/apt/lists/*
sudo apt update
```

#### Explanation of how it fixed your problem

The /var/lib/apt is the directory where files and data related to the apt package manager are stored. The /var/lib/apt/lists is the directory which is used for storing information for each package resource specified in your system’s sources.list.

In slightly non complicated terms, this /var/lib/apt/lists stores the package information cache. When you want to install or update a program, your system checks in this directory for the information on the said package. If it finds the detail on the package, then it goes to remote repository and actually download the program or its update.

When you run the “sudo apt update”, it builds the cache. This is why even when you remove everything in the /var/lib/apt/lists directory, running the update will build a fresh cache.

This is how it handles the issue of file not being parsed. Your system complained about a particular package or repository information that somehow got corrupted (either a failed download or manual change to sources.list). Removing that file (or everything) and rebuilding the cache solves the issue.

#### Still facing error?

This should fix the issue for you. But if the problem still persists or if you have some other related issue, let me know in the comment section and I’ll try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/unable-to-parse-package-file/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-update-error/
[2]: https://itsfoss.com/update-ubuntu/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/Unable-to-parse-package-file.png?ssl=1
[4]: https://ubuntu.com/
