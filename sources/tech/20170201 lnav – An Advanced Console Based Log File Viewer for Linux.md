lnav – An Advanced Console Based Log File Viewer for Linux
============================================================

[LNAV][3] stands for Log file Navigator is an advanced console based log file viewer for Linux. It does the same job how other file viewers doing like cat, more, tail, etc but have more enhanced features which is not available in normal file viewers (especially, it will comes with set of color and easy to read format).

This can decompresses all the compressed log files (zip, gzip, bzip) on the fly and merge them together for easy navigation. lnav Merge more than one log files (Single Log View) into a single view based on message timestamps which will reduce multiple windows open. The color bars on the left-hand side help to show which file a message belongs to.

The number of warnings and errors are highlighted in the display (Yellow & Red), so that we can easily see where the problems have occurred. New log lines are automatically loaded.

It display the log messages from all files sorted by the message timestamps. Top & Bottom status bars will tell you, where you are in the logs. If you want to grep any particular pattern, just type your inputs on search prompt which will be highlighted instantly.

The built-in log message parser can automatically discover and extract the each lines with detailed information.

A server log is a log file which is created and frequently updated by a server to capture all the activity for the particular service or application. This can be very useful when you have an issue with application or service. In log files you can get all the information about the issue like when it start behaving abnormal based on warning or error message.

When you open a log file with normal file viewer, it will display all the details in plain format (If i want to tell you in straight forward, plain white) it’s very difficult to identify/understand where is warning & errors messages are there. To overcome this kind of situation and quickly find the warning & error message to troubleshoot the issue, lnav comes in handy for a better solution.

Most of the common Linux log files are located at `/var/log/`.

**lnav automatically detect below log formats**

*   Common Web Access Log format
*   CUPS page_log
*   Syslog
*   Glog
*   VMware ESXi/vCenter Logs
*   dpkg.log
*   uwsgi
*   “Generic” – Any message that starts with a timestamp
*   Strace
*   sudo
*   gzib & bizp

**Awesome lnav features**

*   Single Log View – All log file contents are merged into a single view based on message timestamps.
*   Automatic Log Format Detection – Most of the log format is supported by lnav
*   Filters – regular expressions based filters can be performed.
*   Timeline View
*   Pretty-Print View
*   Query Logs Using SQL
*   Automatic Data Extraction
*   “Live” Operation
*   Syntax Highlighting
*   Tab-completion
*   Session information is saved automatically and restored when you are viewing the same set of files.
*   Headless Mode

#### How to install lnav on Linux

Most of the distribution (Debian, Ubuntu, Mint, Fedora, suse, openSUSE, Arch Linux, Manjaro, Mageia, etc.) has the lnav package by default, so we can easily install it from distribution official repository with help of package manager. For CentOS/RHEL we need to enable **[EPEL Repository][1]**.

```
[Install lnav on Debian/Ubuntu/LinuxMint]
$ sudo apt-get install lnav

[Install lnav on RHEL/CentOS]
$ sudo yum install lnav

[Install lnav on Fedora]
$ sudo dnf install lnav

[Install lnav on openSUSE]
$ sudo zypper install lnav

[Install lnav on Mageia]
$ sudo urpmi lnav

[Install lnav on Arch Linux based system]
$ yaourt -S lnav
```

If the distribution doesn’t have the lnav package don’t worry, Developer offering the `.rpm & .deb`packages, so we can easily install without any issues. Make sure you have to download the latest one from [developer github page][4].

```
[Install lnav on Debian/Ubuntu/LinuxMint]
$ sudo wget https://github.com/tstack/lnav/releases/download/v0.8.1/lnav_0.8.1_amd64.deb
$ sudo dpkg -i lnav_0.8.1_amd64.deb

[Install lnav on RHEL/CentOS]
$ sudo yum install https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm

[Install lnav on Fedora]
$ sudo dnf install https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm

[Install lnav on openSUSE]
$ sudo zypper install https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm

[Install lnav on Mageia]
$ sudo rpm -ivh https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-1.x86_64.rpm
```

#### Run lnav without any argument

By default lnav brings `syslog` file when you are running without any arguments.

```
# lnav
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-1.png) 
][5]

#### To view specific logs with lnav

To view specific logs with lnav, add the log file `path` followed by lnav command. For example we are going to view `/var/log/dpkg.log` logs.

```
# lnav /var/log/dpkg.log
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-2.png) 
][6]

#### To view multiple log files with lnav

To view multiple log files with lnav, add the log files `path` one by one with single space followed by lnav command. For example we are going to view `/var/log/dpkg.log` & `/var/log/kern.log` logs.

The color bars on the left-hand side help to show which file a message belongs to. Alternatively top bar also showing the current log file name. Most of the application used to open multiple windows or horizontal or vertical windows within the window to display more than one log but lnav doing in different way (It display multiple logs in the same window based on date combination).

```
# lnav /var/log/dpkg.log /var/log/kern.log
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-3.png) 
][7]

#### To view older/compressed logs with lnav

To view older/compressed logs which will decompresses all the compressed log files (zip, gzip, bzip) on the fly, add `-r` option followed by lnav command.

```
# lnav -r /var/log/Xorg.0.log.old.gz
```

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-6.png) 
][8]

#### Histogram view

First run `lnav` then hit `i` to Switch to/from the histogram view.
[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-4.png) 
][9]

#### View log parser results

First run `lnav` then hit `p` to Toggle the display of the log parser results.
[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-5.png) 
][10]

#### Syntax Highlighting

You can search any given string which will be highlighting on screen. First run `lnav` then hit `/` and type the string which you want to grep. For testing purpose, i’m searching `Default` string, See the below screenshot.
[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-7.png) 
][11]

#### Tab-completion

The command prompt supports tab-completion for almost all operations. For example, when doing a search, you can tab-complete words that are displayed on screen rather than having to do a copy & paste. For testing purpose, i’m searching `/var/log/Xorg` string, See the below screenshot.
[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-8.png) 
][12]


--------------------------------------------------------------------------------

via: http://www.2daygeek.com/install-and-use-advanced-log-file-viewer-navigator-lnav-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]:http://www.2daygeek.com/author/magesh/
[3]:http://lnav.org/
[4]:https://github.com/tstack/lnav/releases
[5]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-1.png
[6]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-2.png
[7]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-3.png
[8]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-6.png
[9]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-4.png
[10]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-5.png
[11]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-7.png
[12]:http://www.2daygeek.com/wp-content/uploads/2017/01/lnav-advanced-log-file-viewer-8.png
