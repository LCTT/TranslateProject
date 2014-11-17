Translating by GOLinux!
How to perform system backup with backup-manager on Linux
================================================================================
One thing that we all may have had the chance to learn in either easy or hard ways is that the importance of backups can never be underestimated. Considering that there are as many backup methods as the number of fish in the sea, you may wonder how you can effectively choose the right tool and strategy for your system.

In this article I will introduce you to [backup-manager][1], a simple yet handy command-line backup tool which is available in the standard repositories of most Linux distributions.

What makes backup-manager stand out among other backup tools or strategies? Let me mention just a few of its distinguishing features:


- **Simple design and management**: configuration file is easy to read and edit, even for beginners.
- **Set and forget**: can be scheduled to run through cron on a periodic basis.
- **Multi-protocol support for remote backup**: integrates seamlessly with various transfer protocols, applications and cloud backend (e.g., FTP, SCP, SSH-GPG, rsync, AWS S3) to transfer generated archives to a list of remote hosts.
- **Database backup support**: includes out-of-the-box support for backing up MySQL/MariaDB and PostgreSQL databases.
- **Encryption support**: supports GPG-based file encryption during backup. 

### Installing Backup-Manager on Linux ###

Installation of backup-manager is quick and effortless since it is included in the base repositories of most Linux distributions.

#### Debian, Ubuntu and their derivatives ####

    # aptitude install backup-manager 

During the installation process on Debian-based systems, you will be prompted to enter the directory where you want to store generated backup archives. If the chosen directory does not exist, it will be created automatically when you run backup-manager for the first time. 

Select OK and press ENTER.

![](https://farm6.staticflickr.com/5614/15600105060_8cf4491e3b_z.jpg)

In the next step, you will be asked to enter all the directories (separated by space) that you want to be backed up. It is advised, though not strictly required, to list several sub-directories of the same parent directory instead of entering only the parent directory.

You can skip this step and configure the list of directories later using the variable BM_TARBALL_DIRECTORIES in the configuration file. Otherwise, feel free to add as many directories as you wish, and then choose OK:

![](https://farm6.staticflickr.com/5610/15761238616_c9651fea1c_z.jpg)

#### Fedora or CentOS/RHEL ####

    # yum install backup-manager 

On CentOS/RHEL, you will need to enable [EPEL repository][2] first before running the above yum command.

### Configuring Backup-Manager ###

The main configuration file for backup-manager is /etc/backup-manager.conf. This file is divided into sections where the backup methods and their associated variables (or "keys") are defined, making backup-manager a versatile tool that can be used in a wide variety of cases.

For demonstration purposes, we will consider the following scenario: 

- Perform a full system backup of the /etc, /home, and /var/log directories on a weekly basis (we will set up the frequency later through cron).
- Transfer generated .tar.gz backup archives to a specific target directory in two different hosts, dev1 and dev3, over SSH.
- Back up a local MySQL database to the same destination hosts over SSH. 

Open /etc/backup-manager.conf with your favorite text editor and edit the following variables. Feel free to disregard the lines beginning with # if you want. They are provided only as explanatory comments in this article:

    # Specify the backup method(s) that will be used.
    # tarball: takes a list of directories and builds the corresponding tarballs.
    # mysql: archives MySQL databases using mysqldump. To restore the database, you # need to use the same tool manually.
    export BM_ARCHIVE_METHOD="tarball mysql"
    
    # Where to store the backups.
    export BM_REPOSITORY_ROOT="/var/archives"
    
    # The following directive indicates backup-manager to name 
    # the generated files after the directory that was backed up.
    export BM_TARBALL_NAMEFORMAT="long"
    
    # Define the compression type for the generated files.
    export BM_TARBALL_FILETYPE="tar.gz"
    
    # List the directories that you want to backup.
    export BM_TARBALL_DIRECTORIES="/etc /home /var/log"
    
    # Exclude some subdirectories or file extensions.
    export BM_TARBALL_BLACKLIST="/var/log/myotherapp.log *.mp3 *.mp4"
    
    # List the database(s) that you want to backup, separated by spaces.
    export BM_MYSQL_DATABASES="mysql mybase wordpress dotclear phpbb2"
    
    # MySQL username.
    export BM_MYSQL_ADMINLOGIN="root"
    
    # MySQL password for username.
    export BM_MYSQL_ADMINPASS="mypassword"
    
    # Add support for DROP statements (optional).
    export BM_MYSQL_SAFEDUMPS="true"
    
    # The hostname or IP address where the database(s) reside.
    export BM_MYSQL_HOST="localhost"
    
    # Port where MySQL server is listening.
    export BM_MYSQL_PORT="3306"
    
    # Compression type (optional).
    export BM_MYSQL_FILETYPE="gzip"
    
    # Do not archive remote hosts, but only localhost.
    BM_TARBALL_OVER_SSH="false"
    
    # User account for SSH upload.
    export BM_UPLOAD_SSH_USER="root"
    
    # Absolute path of the user's private key for passwordless SSH login.
    export BM_UPLOAD_SSH_KEY="/root/.ssh/id_rsa"
    
    # Remote hosts (make sure you have exported your public key to them):
    export BM_UPLOAD_SSH_HOSTS="dev1 dev3"
    
    # Remote destination for uploading backups. If it doesn't exist, 
    # this directory will be created automatically the first time
    # backup-manager runs.
    export BM_UPLOAD_SSH_DESTINATION="/var/archives/backups/$HOSTNAME"

### Running Backup-Manager ###

To run backup-manager manually, type the following command. Optionally, you can add the '-v' flag in order to examine the process step by step, in a verbose way.

    # backup-manager 

The directories listed in BM_TARBALL_DIRECTORIES will be backed up in BM_REPOSITORY_ROOT as tarballs, and then transferred over SSH to hosts dev1 and dev3 specified in BM_UPLOAD_SSH_DESTINATION.

![](https://farm8.staticflickr.com/7497/15761238646_945620d8b7_z.jpg)

As can be seen in the above image, backup-manager during runtime creates a file named /root/.backup-manager_my.cnf with the MySQL password provided in BM_MYSQL_ ADMINPASS. That way, mysqldump can authenticate to a MySQL server without having to accept login password through the command line in plain-text format, which poses a security risk.

### Running Backup-Manager through Cron ###

Once you have decided what is the best day of the week (and the best time) to perform your weekly backup, you can have cron run backup-manager for you.

Open root's crontab file (note that you must be logged on as root):

    # crontab -e 

Assuming that you want to run backup-manager on Sunday at 5:15 am, add the following line.

    15 05 * * 0 /usr/sbin/backup-manager > /dev/null 2>&1

### Summary ###

In this article we have shown how backup-manager is a simple, yet powerful and easy-to-use backup tool. There are several other options that you may want to consider in your backup strategy, so feel free to refer to the man page or to the user guide, which also contains several implementation examples and advice.

Hope it helps. Feel free to leave your questions and comments below.

--------------------------------------------------------------------------------

via: http://xmodulo.com/linux-backup-manager.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:https://github.com/sukria/Backup-Manager
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
