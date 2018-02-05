Translating by FelixYFZ
How to test internet speed in Linux terminal
======
Learn how to use speedtest cli tool to test internet speed in Linux terminal. Also includes one liner python command to get speed details right away.

![test internet speed in linux terminal][1]

Most of us check the internet bandwidth speed whenever we connect to new network or wifi. So why not our servers! Here is a tutorial which will walk you through to test internet speed in Linux terminal.

Everyone of us generally uses [Speedtest by Ookla][2] to check internet speed. Its pretty simple process for a desktop. Goto their website and just click GO button. It will scans your location and speed test with nearest server. If you are on mobile, they have their app for you. But if you are on terminal with command line interface things are little different. Lets see how to check internet speed from Linux terminal.

If you want to speed check only once and dont want to download tool on server, jump here and see one liner command.

### Step 1 : Download speedtest cli tool

First of all, you have to download speedtest CLI tool from [github repository][3]. Now a days, its also included in many well known Linux repositories as well. If its their in yours then you can directly [install that package on your Linux distro][4].

Lets proceed with Github download and install process. [Install git package][4] depending on your distro. Then clone Github repo of speedtest like belwo :

```
[root@kerneltalks ~]# git clone https://github.com/sivel/speedtest-cli.git
Cloning into 'speedtest-cli'...
remote: Counting objects: 913, done.
remote: Total 913 (delta 0), reused 0 (delta 0), pack-reused 913
Receiving objects: 100% (913/913), 251.31 KiB | 143.00 KiB/s, done.
Resolving deltas: 100% (518/518), done.
 
```

It will be cloned to your present working directory. New directory named `speedtest-cli` will be created. You can see below files in it.

```
[root@kerneltalks ~]# cd speedtest-cli
[root@kerneltalks speedtest-cli]# ll
total 96
-rw-r--r--. 1 root root  1671 Oct  7 16:55 CONTRIBUTING.md
-rw-r--r--. 1 root root 11358 Oct  7 16:55 LICENSE
-rw-r--r--. 1 root root    35 Oct  7 16:55 MANIFEST.in
-rw-r--r--. 1 root root  5215 Oct  7 16:55 README.rst
-rw-r--r--. 1 root root    20 Oct  7 16:55 setup.cfg
-rw-r--r--. 1 root root  3196 Oct  7 16:55 setup.py
-rw-r--r--. 1 root root  2385 Oct  7 16:55 speedtest-cli.1
-rw-r--r--. 1 root root  1200 Oct  7 16:55 speedtest_cli.py
-rwxr-xr-x. 1 root root 47228 Oct  7 16:55 speedtest.py
-rw-r--r--. 1 root root   333 Oct  7 16:55 tox.ini
```

The python script `speedtest.py` is the one we will be using to check internet speed.

You can link this script for a command in /usr/bin so that all users on server can use it. Or you can even create [command alias][5] for it and it will be easy for all users to use it.

### Step 2 : Run python script

Now, run python script without any argument and it will search nearest server and test your internet speed.

```
[root@kerneltalks speedtest-cli]# python speedtest.py
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Spectra (Mumbai) [1.15 km]: 8.174 ms
Testing download speed................................................................................
Download: 548.13 Mbit/s
Testing upload speed................................................................................................
Upload: 323.95 Mbit/s
```

Oh! Dont amaze with speed. 😀 I am on [AWS EC2 Linux server][6]. Thats the bandwidth of Amazon data center! 🙂

### Different options with script

Few options which might be useful are as below :

 **To search speedtest servers** nearby your location use `--list` switch and `grep` for your location name.

```
[root@kerneltalks speedtest-cli]#  python speedtest.py --list | grep -i mumbai
 2827) Bharti Airtel Ltd (Mumbai, India) [1.15 km]
 8978) Spectra (Mumbai, India) [1.15 km]
 4310) Hathway Cable and Datacom Ltd (Mumbai, India) [1.15 km]
 3315) Joister Broadband (Mumbai, India) [1.15 km]
 1718) Vodafone India (Mumbai, India) [1.15 km]
 6454) YOU Broadband India Pvt Ltd. (Mumbai, India) [1.15 km]
 9764) Railtel Corporation of india Ltd (Mumbai, India) [1.15 km]
 9584) Sheng Li Telecom (Mumbai, India) [1.15 km]
 7605) Idea Cellular Ltd. (Mumbai, India) [1.15 km]
 8122) Sify Technologies Ltd (Mumbai, India) [1.15 km]
 9049) I-ON (Mumbai, India) [1.15 km]
 6403) YOU Broadband India Pvt Ltd., Mumbai (Mumbai, India) [1.15 km]
```

You can see here, first column is server identifier followed by name of company hosting that server, location and finally its distance from your location.

 **To test internet speed using specific server** use `--server` switch and server identifier from previous output as argument.

```
[root@kerneltalks speedtest-cli]# python speedtest.py --server 2827
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Bharti Airtel Ltd (Mumbai) [1.15 km]: 13.234 ms
Testing download speed................................................................................
Download: 93.47 Mbit/s
Testing upload speed................................................................................................
Upload: 69.25 Mbit/s
```

**To get share link of your speed test** , use `--share` switch. It will give you URL of your test hosted on speedtest website. You can share this URL.

```
[root@kerneltalks speedtest-cli]# python speedtest.py --share
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Spectra (Mumbai) [1.15 km]: 7.471 ms
Testing download speed................................................................................
Download: 621.00 Mbit/s
Testing upload speed................................................................................................
Upload: 367.37 Mbit/s
Share results: http://www.speedtest.net/result/6687428141.png
 
```

Observe last line which includes URL of your test result. If I download that image its the one below :

![Speedtest result on Linux][7]

Thats it! But hey if you dont want all this technical jargon, you can even use below one liner to get speed test done right away.

### Internet speed test using one liner in terminal

We are going to use [curl tool ][8]to fetch above said python script online and supply it to python for execution on the go!

```
[root@kerneltalks ~]# curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
```

Above command will run the script and show you result on screen!

```
[root@kerneltalks speedtest-cli]# curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Spectra (Mumbai) [1.15 km]: 12.599 ms
Testing download speed................................................................................
Download: 670.88 Mbit/s
Testing upload speed................................................................................................
Upload: 355.84 Mbit/s
```

I tested this tool on RHEL 7 server but process is same on Ubuntu, Debian, Fedora or CentOS.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tips-tricks/how-to-test-internet-speed-in-linux-terminal/

作者：[Shrikant Lavhate][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://c1.kerneltalks.com/wp-content/uploads/2017/10/check-internet-speed-from-Linux.png
[2]:http://www.speedtest.net/
[3]:https://github.com/sivel/speedtest-cli
[4]:https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[5]:https://kerneltalks.com/commands/command-alias-in-linux-unix/
[6]:https://kerneltalks.com/howto/install-ec2-linux-server-aws-with-screenshots/
[7]:https://c3.kerneltalks.com/wp-content/uploads/2017/10/speedtest-on-linux.png
[8]:https://kerneltalks.com/tips-tricks/4-tools-download-file-using-command-line-linux/
