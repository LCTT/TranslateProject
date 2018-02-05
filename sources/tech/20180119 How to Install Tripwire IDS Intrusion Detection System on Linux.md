How to Install Tripwire IDS (Intrusion Detection System) on Linux
============================================================


Tripwire is a popular Linux Intrusion Detection System (IDS) that runs on systems in order to detect if unauthorized filesystem changes occurred over time.

In CentOS and RHEL distributions, tripwire is not a part of official repositories. However, the tripwire package can be installed via [Epel repositories][1].

To begin, first install Epel repositories in CentOS and RHEL system, by issuing the below command.

```
# yum install epel-release
```

After you’ve installed Epel repositories, make sure you update the system with the following command.

```
# yum update
```

After the update process finishes, install Tripwire IDS software by executing the below command.

```
# yum install tripwire
```

Fortunately, tripwire is a part of Ubuntu and Debian default repositories and can be installed with following commands.

```
$ sudo apt update
$ sudo apt install tripwire
```

On Ubuntu and Debian, the tripwire installation will be asked to choose and confirm a site key and local key passphrase. These keys are used by tripwire to secure its configuration files.

 [![Create Tripwire Site and Local Key](https://www.tecmint.com/wp-content/uploads/2018/01/Create-Site-and-Local-key.png)][2] 

Create Tripwire Site and Local Key

On CentOS and RHEL, you need to create tripwire keys with the below command and supply a passphrase for site key and local key.

```
# tripwire-setup-keyfiles
```
 [![Create Tripwire Keys](https://www.tecmint.com/wp-content/uploads/2018/01/Create-Tripwire-Keys.png)][3] 

Create Tripwire Keys

In order to validate your system, you need to initialize Tripwire database with the following command. Due to the fact that the database hasn’t been initialized yet, tripwire will display a lot of false-positive warnings.

```
# tripwire --init
```
 [![Initialize Tripwire Database](https://www.tecmint.com/wp-content/uploads/2018/01/Initialize-Tripwire-Database.png)][4] 

Initialize Tripwire Database

Finally, generate a tripwire system report in order to check the configurations by issuing the below command. Use `--help` switch to list all tripwire check command options.

```
# tripwire --check --help
# tripwire --check
```

After tripwire check command completes, review the report by opening the file with the extension `.twr` from /var/lib/tripwire/report/ directory with your favorite text editor command, but before that you need to convert to text file.

```
# twprint --print-report --twrfile /var/lib/tripwire/report/tecmint-20170727-235255.twr > report.txt
# vi report.txt
```
 [![Tripwire System Report](https://www.tecmint.com/wp-content/uploads/2018/01/Tripwire-System-Report.png)][5] 

Tripwire System Report

That’s It! you have successfully installed Tripwire on Linux server. I hope you can now easily configure your [Tripwire IDS][6].

--------------------------------------------------------------------------------

作者简介:

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

-------

via: https://www.tecmint.com/install-tripwire-ids-intrusion-detection-system-on-linux/

作者：[ Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/cezarmatei/
[1]:https://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[2]:https://www.tecmint.com/wp-content/uploads/2018/01/Create-Site-and-Local-key.png
[3]:https://www.tecmint.com/wp-content/uploads/2018/01/Create-Tripwire-Keys.png
[4]:https://www.tecmint.com/wp-content/uploads/2018/01/Initialize-Tripwire-Database.png
[5]:https://www.tecmint.com/wp-content/uploads/2018/01/Tripwire-System-Report.png
[6]:https://www.tripwire.com/
[7]:https://www.tecmint.com/author/cezarmatei/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/