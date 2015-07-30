Must-Know Linux Commands For New Users
================================================================================
![Manage system updates via the command line with dnf on Fedora.](http://www.linux.com/images/stories/41373/fedora-cli.png)
Manage system updates via the command line with dnf on Fedora.

One of the beauties of Linux-based systems is that you can manage your entire system right from the terminal using the command line. The advantage of using the command line is that you can use the same knowledge and skills to manage any Linux distribution.

This is not possible through the graphical user interface (GUI) as each distro, and desktop environment (DE), offers its own user interfaces. To be clear, there are cases in which you will need different commands to perform certain tasks on different distributions, but more or less the concept and ideas remain the same.

In this article, we are going to talk about some of the basic commands that a new Linux user should know. I will show you how to update your system, manage software, manipulate files and switch to root using the command line on three major distributions: Ubuntu (which also includes its flavors and derivatives, and Debian), openSUSE and Fedora.

*Let's get started!*

### Keep your system safe and up-to-date ###

Linux is secure by design, but the fact is that all software has bugs and there could be security holes. So it's very important to keep your system updated. Think of it this way: Running an out-of-date operating system is like being in an armored tank with the doors unlocked. Will the armor protect you? Anyone can enter through the open doors and cause harm. Similarly there can be un-patched holes in your OS which can compromise your systems. Open source communities, unlike the proprietary world, are extremely quick at patching holes, so if you keep your system updated you'll stay safe.

Keep an eye on news sites to be aware of security vulnerabilities. If there is a hole discovered, read about it and update your system as soon as a patch is out. Either way you must make it a practice to run the update commands at least once a week on production machines. If you are running a complicated server then be extra careful and go through the changelog to ensure updates won't break your customization.

**Ubuntu**: Bear one thing in mind: you must always refresh repositories (aka repos) before upgrading the system or installing any software. On Ubuntu, you can update your system with the following commands. The first command refreshes repositories:

    sudo apt-get update

Once the repos are updated you can now run the system update command:

    sudo apt-get upgrade

However this command doesn't update the kernel and some other packages, so you must also run this command:

    sudo apt-get dist-upgrade

**openSUSE**: If you are on openSUSE, you can update the system using these commands (as usual, the first command is meant to update repos)

    sudo zypper refresh
    sudo zypper up

**Fedora**: If you are on Fedora, you can use the 'dnf' command which is 'kind' of equivalent to zypper and apt-get:

    sudo dnf update
    sudo dnf upgrade

### Software installation and removal ###

You can install only those packages which are available in the repositories enabled on your system. Every distro comes with some official or third-party repos enabled by default.

**Ubuntu**: To install any package on Ubuntu, first update the repo and then use this syntax:

    sudo apt-get install [package_name]

Example:

    sudo apt-get install gimp

**openSUSE**: The commands would be:

    sudo zypper install [package_name]

**Fedora**: Fedora has dropped 'yum' and now uses 'dnf' so the command would be:

    sudo dnf install [package_name]

The procedure to remove the software is the same, just exchange 'install' with 'remove'.

**Ubuntu**:

    sudo apt-get remove [package_name]

**openSUSE**:

    sudo zypper remove [package_name]

**Fedora**:

    sudo dnf remove [package_name]

### How to manage third party software? ###

There is a huge community of developers who offer their software to users. Different distributions use different mechanisms to make third party software available to their users. It also depends on how a developer offers their software to users; some offer binaries and others offer it through repositories.

Ubuntu heavily relies on PPAs (personal package archives) but, unfortunately, there is no built-in tool which can assist a user in searching PPAs. You will need to Google the PPA and then add the repository manually before installing the software. This is how you would add any PPA to your system:

    sudo add-apt-repository ppa:<repository-name>

Example: Let's say I want to add LibreOffice PPA to my system. I would Google the PPA and then acquire the repo name from Launchpad, which in this case is "libreoffice/ppa". Then add the ppa using the following command:

    sudo add-apt-repository ppa:libreoffice/ppa

It will ask you to hit the Enter key in order to import the keys. Once it's done, refresh the repos with the 'update' command and then install the package.

openSUSE has an elegant solution for third-party apps. You can visit software.opensuse.org, search for the package and install it with one click. It will automatically add the repo to your system. If you want to add any repo manually, use this command:.

    sudo zypper ar -f url_of_the_repo name_of_repo
    sudo zypper ar -f http://download.opensuse.org/repositories/LibreOffice:Factory/openSUSE_13.2/LibreOffice:Factory.repo LOF

Then refresh the repo and install software:

    sudo zypper refresh
    sudo zypper install libreoffice

Fedora users can simply add RPMFusion (both free and non-free repos) which contain a majority of applications. In case you do need to add a repo, this is the command:

dnf config-manager --add-repo http://www.example.com/example.repo

### Some basic commands ###

I have written a few [articles][1] on how to manage files on your system using the CLI, here are some of the basic commands which are common across all distributions.

Copy files or directories to a new location:

    cp path_of_file_1 path_of_the_directory_where_you_want_to_copy/

Copy all files from a directory to a new location (notice the slash and asterisk, which implies all files within that directory):

    cp path_of_files/* path_of_the_directory_where_you_want_to_copy/

Move a file from one location to another (the trailing slash means inside that directory):

    mvÂ path_of_file_1 path_of_the_directory_where_you_want_to_move/

Move all file from one location to another:

    mvÂ path_of_directory_where_files_are/* path_of_the_directory_where_you_want_to_move/

Delete a file:

    rm path_of_file

Delete a directory:

    rm -r path_of_directory

Remove all content from the directory, leaving the directory folder intact:

    rm -r path_of_directory/*

### Create new directory ###

To create a new directory, first enter the location where you want to create a directory. Let's say you want to create a 'foundation' folder inside your Documents directory. Let's change the directory using the cd (aka change directory) command:

    cd /home/swapnil/Documents

(exchange 'swapnil with the user on your system)

Then create the directory with mkdir command:

    mkdir foundation

You can also create a directory from anywhere, by giving the path of the directory. For example:

    mdkir /home/swapnil/Documents/foundation

If you want to create parent-child directories, which means directories within other directories then use the -p option. It will create all directories in the given path:

    mdkir -p /home/swapnil/Documents/linux/foundation

### Become root ###

You either need to be root or the user should have sudo powers to perform some administrative tasks such as managing packages or making changes to the root directories or files. An example would be to edit the 'fstab' file which keeps a record of mounted hard drives. It's inside the 'etc' directory which is within the root directory. You can make changes to this file only as a super user. In most distros you can become root by 'switching user'. Let's say on openSUSE I want to become root as I am going to work inside the root directory. You can use either command:

    sudo su -

Or

    su -

That will ask for the password and then you will have root privileges. Keep one point in mind: never run your system as root user unless you know what you are doing. Another important point to note is that the files or directories you modify as root also change ownership of those files from that user or specific service to root. You may have to revert the ownership of those files otherwise the services or users won't be able to to access or write to those files. To change users, this is the command:

    sudo chown -R user:user /path_of_file_or_directory

You may often need this when you have partitions from other distros mounted on the system. When you try to access files on such partitions, you may come across a permission denied error. You can simply change the ownership of such partitions to access them. Just be extra careful, don't change permissions or ownership of root directories.

These are the basic commands any new Linux user needs. If you have any questions or if you want us to cover a specific topic, please mention them in the comments below.

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/842251-must-know-linux-commands-for-new-users

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/61003
[1]:http://www.linux.com/learn/tutorials/828027-how-to-manage-your-files-from-the-command-line