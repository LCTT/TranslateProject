Getting Started with PowerShell 6.0 in Linux [Beginner Guide]
============================================================

After Microsoft falling in love with Linux (what has popularly come to be known as “Microsoft Loves Linux”), PowerShell which was originally a Windows-only component, was open-sourced and made cross-platform on 18 August 2016, available on Linux and Mac OS.

PowerShell is a task automation and configuration management system developed by Microsoft. It is made up of a command language interpreter (shell) and scripting language built on the .NET Framework.

It offers complete access to COM (Component Object Model) and WMI (Windows Management Instrumentation), thereby allowing [system administrators to carry out administrative tasks][1] on both local and remote Windows systems as well as WS-Management and CIM (Common Information Model) enabling administration of remote Linux systems plus network devices.

Under this framework, administrative tasks are fundamentally carried out by particular .NET classes called cmdlets (pronounced command-lets). Similar to shell scripts in Linux, users can build scripts or executables by storing groups of cmdlets in files by following certain rules. These scripts can be used as independent [command line utilities or tools][2].

### Install PowerShell Core 6.0 in Linux Systems

To install PowerShell Core 6.0 in Linux, we will use official Microsoft Ubuntu repository that will allows us to install through most popular Linux package management tools such as [apt-get][3] and [yum][4].

#### On Ubuntu 16.04

First import the public repository GPG keys, then register the Microsoft Ubuntu repository in APT package sources list to install Powershell:

```
$ curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
$ curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list
$ sudo apt-get update
$ sudo apt-get install -y powershell
```

#### On Ubuntu 14.04

```
$ curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
$ curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list
$ sudo apt-get update
$ sudo apt-get install -y powershell
```

#### On CentOS 7

First register the Microsoft RedHat repository in YUM package manager repository list and install Powershell:

```
$ sudo curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/microsoft.repo
$ sudo yum install -y powershell
```

### How to Use Powershell Core 6.0 in Linux

In this section, we will have a brief introduction to Powershell; where we will see how to start powershell, run some basic commands, look at how to work with files, directories and processes. Then later dive into how to list all available commands, show command help and aliases.

To start Powershell, type:

```
$ powershell
```
[
 ![Start Powershell in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/start-powershell.png) 
][5]

Start Powershell in Linux

You can check the Powershell version with the command below:

```
$PSVersionTable
```
[
 ![Check Powershell Version](http://www.tecmint.com/wp-content/uploads/2017/02/check-powershell-version.png) 
][6]

Check Powershell Version

Running some basic Powershell commands on Linux.

```
get-date          [# Display current date]
get-uptime        [# Display server uptime]
get-location      [# Display present working directory]
```

#### Working with Files and Directories in Powershell

1. Create a new empty file using the two methods below:

```
new-item  tecmint.tex
OR
“”>tecmint.tex
```

Then add content to it and view the file content.

```
set-content tecmint.tex -value "TecMint Linux How Tos Guides"
get-content tecmint.tex
```
[
 ![Create New File in Powershell](http://www.tecmint.com/wp-content/uploads/2017/02/Create-New-File-in-Powershell.png) 
][7]

Create New File in Powershell

2. Delete a file in powershell.

```
remove-item tecmint.tex
get-content tecmint.tex
```
[
 ![Delete File in Powershell](http://www.tecmint.com/wp-content/uploads/2017/02/Delete-File-in-Powershell.png) 
][8]

Delete File in Powershell

3. Create a new directory.

```
mkdir  tecmint-files
cd  tecmint-files
“”>domains.list
ls
```
[
 ![Create Directory in Powershell](http://www.tecmint.com/wp-content/uploads/2017/02/create-new-directory-in-Powershell.png) 
][9]

Create Directory in Powershell

4. To perform a long listing, which displays details of a file/directory including mode (file type), last modification time, type:

```
dir
```
[
 ![Directory Long Listing in Powershell](http://www.tecmint.com/wp-content/uploads/2017/02/Directory-Long-Listing-in-Powershell.png) 
][10]

Directory Long Listing in Powershell

5. View all running processes on your system:

```
get-process
```
[
 ![View Running Processes in Powershell](http://www.tecmint.com/wp-content/uploads/2017/02/View-Running-Processes-in-Powershell.png) 
][11]

View Running Processes in Powershell

6. To view details of a single/group of running processes with a given name, provide the process name as an argument to the previous command as follows:

```
get-process apache2
```
[
 ![View Specific Process in Powershell](http://www.tecmint.com/wp-content/uploads/2017/02/View-Specific-Process-in-Powershell.png) 
][12]

View Specific Process in Powershell

Meaning of the units in the output above:

1.  NPM(K) – amount of non-paged memory that the process is using, in kilobytes.
2.  PM(K) – amount of pageable memory that the process is using, in kilobytes.
3.  WS(K) – size of the working set of the process, in kilobytes. The working set consists of the pages of memory that were recently referenced by the process.
4.  CPU(s) – amount of processor time that the process has used on all processors, in seconds.
5.  ID – process ID (PID).
6.  ProcessName – name of the process.

7. To know more, get a list of all Powershell commands for different tasks:

```
get-command
```
[
 ![List Powershell Commands](http://www.tecmint.com/wp-content/uploads/2017/02/List-Powershell-Commands.png) 
][13]

List Powershell Commands

8. To learn how to use a command, view its help page (similar to man page in Unix/Linux); in this example, you can get help for the Describe command:

```
get-help Describe
```
[
 ![Powershell Help Manual](http://www.tecmint.com/wp-content/uploads/2017/02/Powershell-Help-Manual.png) 
][14]

Powershell Help Manual

9. view all available command aliases, type:

```
get-alias
```
[
 ![List Powershell Command Aliases](http://www.tecmint.com/wp-content/uploads/2017/02/List-Powershell-Command-Aliases.png) 
][15]

List Powershell Command Aliases

10. Last but not least, display command history (list of commands you had run previously) like so:

```
history
```
[
 ![List Powershell Commands History](http://www.tecmint.com/wp-content/uploads/2017/02/List-Powershell-Command-History.png) 
][16]

List Powershell Commands History

That’s all! for now, in this article, we showed you how to install Microsoft’s Powershell Core 6.0 in Linux. To me, Powershell still has a very long way to go in comparison to the traditional Unix/Linux shells which offer, by far better, more exciting and productive features to operate a machine from the command line and importantly, for programming (scripting) purposes as well.

Visit Powershell Github repository: [https://github.com/PowerShell/PowerShell][17]

However, you can give it a try and share your views with us in the comments.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-powershell-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
[2]:http://www.tecmint.com/tag/commandline-tools/
[3]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[4]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/start-powershell.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/check-powershell-version.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Create-New-File-in-Powershell.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Delete-File-in-Powershell.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/create-new-directory-in-Powershell.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Directory-Long-Listing-in-Powershell.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/View-Running-Processes-in-Powershell.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/View-Specific-Process-in-Powershell.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/List-Powershell-Commands.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/02/Powershell-Help-Manual.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/02/List-Powershell-Command-Aliases.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/02/List-Powershell-Command-History.png
[17]:https://github.com/PowerShell/PowerShell
[18]:http://www.tecmint.com/author/aaronkili/
[19]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[20]:http://www.tecmint.com/free-linux-shell-scripting-books/
