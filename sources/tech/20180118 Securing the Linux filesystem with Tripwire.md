Securing the Linux filesystem with Tripwire
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/file_system.jpg?itok=pzCrX1Kc)

While Linux is considered to be the most secure operating system (ahead of Windows and MacOS), it is still vulnerable to rootkits and other variants of malware. Thus, Linux users need to know how to protect their servers or personal computers from destruction, and the first step they need to take is to protect the filesystem.

In this article, we'll look at [Tripwire][1], an excellent tool for protecting Linux filesystems. Tripwire is an integrity checking tool that enables system administrators, security engineers, and others to detect alterations to system files. Although it's not the only option available ([AIDE][2] and [Samhain][3] offer similar features), Tripwire is arguably the most commonly used integrity checker for Linux system files, and it is available as open source under GPLv2.

### How Tripwire works

It's helpful to know how Tripwire operates in order to understand what it does once it's installed. Tripwire is made up of two major components: policy and database. Policy lists all the files and directories that the integrity checker should take a snapshot of, in addition to creating rules for identifying violations of changes to directories and files. Database consists of the snapshot taken by Tripwire.

Tripwire also has a configuration file, which specifies the locations of the database, policy file, and Tripwire executable. It also provides two cryptographic keys--site key and local key--to protect important files against tampering. The site key protects the policy and configuration files, while the local key protects the database and generated reports.

Tripwire works by periodically comparing the directories and files against the snapshot in the database and reporting any changes.

### Installing Tripwire

In order to use Tripwire, we need to download and install it first. Tripwire works on almost all Linux distributions; you can download an open source version from [Sourceforge][4] and install it as follows, depending on your version of Linux.

Debian and Ubuntu users can install Tripwire directly from the repository using `apt-get`. Non-root users should type the `sudo` command to install Tripwire via `apt-get`.
```


sudo apt-get update

sudo  apt-get install tripwire  
```

CentOS and other rpm-based distributions use a similar process. For the sake of best practice, update your repository before installing a new package such as Tripwire. The command `yum install epel-release` simply means we want to install extra repositories. (`epel` stands for Extra Packages for Enterprise Linux.)
```


yum update

yum install epel-release

yum install tripwire  
```

This command causes the installation to run a configuration of packages that are required for Tripwire to function effectively. In addition, it will ask if you want to select passphrases during installation. You can select "Yes" to both prompts.

Also, select or choose "Yes" if it's required to build the configuration file. Choose and confirm a passphrase for a site key and for a local key. (A complex passphrase such as `Il0ve0pens0urce` is recommended.)

### Build and initialize Tripwire's database

Next, initialize the Tripwire database as follows:
```


tripwire --init
```

You'll need to provide your local key passphrase to run the commands.

### Basic integrity checking using Tripwire

You can use the following command to instruct Tripwire to check whether your files or directories have been modified. Tripwire's ability to compare files and directories against the initial snapshot in the database is based on the rules you created in the active policy.
```


tripwire  --check  
```

You can also limit the `-check` command to specific files or directories, such as in this example:
```


tripwire   --check   /usr/tmp  
```

In addition, if you need extended help on using Tripwire's `-check` command, this command allows you to consult Tripwire's manual:
```


tripwire  --check  --help  
```

### Generating reports using Tripwire

To easily generate a daily system integrity report, create a `crontab` with this command:
```


crontab -e
```

Afterward, you can edit this file (with the text editor of your choice) to introduce tasks to be run by cron. For instance, you can set up a cron job to send Tripwire reports to your email daily at 5:40 a.m. by using this command:
```


40 5  *  *  *  usr/sbin/tripwire   --check
```

Whether you decide to use Tripwire or another integrity checker with similar features, the key issue is making sure you have a solution to protect the security of your Linux filesystem.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/securing-linux-filesystem-tripwire

作者：[Michael Kwaku Aboagye][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/revoks
[1]:https://www.tripwire.com/
[2]:http://aide.sourceforge.net/
[3]:http://www.la-samhna.de/samhain/
[4]:http://sourceforge.net/projects/tripwire
