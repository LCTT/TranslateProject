Speed up your downloads with Axel command line downloader/accelerator
============================================================

[Axel][7] is a lightweight download utility, it does the same thing how other accelerator does. It opens multiple connections for one file and each connections download separate file fragment to complete the download more quickly.

Axel supports HTTP, HTTPS, FTP and FTPS protocols. It can also use multiple mirrors for single file download. So, Axel can speed up a download up to 40% (approximately, i personally realized). It’s very lightweight because no dependencies and uses very less CPU & RAM.

Axel downloads all the data directly to the destination file, using one single thread.

Note : There is no option to download the two file in single command

You can also try alternative Command Line Download Managers/Accelerators

*   [aria2 – The ultra fast download utility][1]
*   [wget – Standard command line download utility][2]
*   [curl – command line download utility][3]
*   [Best 4 Command Line Download Managers/Accelerators for Linux][4]

Most of the distribution (Debian, Ubuntu, Mint, Fedora, suse, openSUSE, Arch Linux, Manjaro, Mageia, etc.) has the axel package so we can easily install it from distribution official repository. For CentOS/RHEL we need to enable [EPEL Repository][5].

```
[Install Axel on Debian/Ubuntu/LinuxMint]
$ sudo apt-get install axel

[Install Axel on RHEL/CentOS]
$ sudo yum install axel

[Install Axel on Fedora]
$ sudo dnf install axel

[Install Axel on openSUSE]
$ sudo zypper install axel

[Install Axel on Mageia]
$ sudo urpmi axel

[Install Axel on Arch Linux based system]
$ sudo pacman -S axel
```

#### 1) Download Single File

The below command will download the file from given URL and stores in current directory, while downloading the file we can see the (No of connection established, download speed, download progress, how much time it took to complete the download & where connection finished) of file.

```
# axel https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
Starting download

[  0%]  .......... .......... .......... .......... ..........  [ 146.7KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 267.0KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 373.9KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 406.9KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 487.5KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 572.6KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 650.7KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 649.3KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 718.1KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 769.3KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 838.7KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 866.0KB/s]
Connection 0 finished
.
.
[ 99%]  .......... .......... .......... .......... ..........  [5721.0KB/s]
Connection 2 finished
[ 99%]  .......... .......... .......... .......... ..........  [5733.4KB/s]
Connection 1 finished
[ 99%]  .......... .......... .......... .......... ..........  [5745.4KB/s]
[100%]  .......... .......... .......... .......... ......

Downloaded 21.6 megabytes in 3 seconds. (5755.94 KB/s)
```

#### 2) Save the file with different name

You can save the file with different name while initiate downloading by adding -o (lowercase) option followed by file name. Here we are going to save the filename with owncloud.tar.bz2.

```
# axel -o cloud.tar.bz2 https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file cloud.tar.bz2
Starting download

[  0%]  .......... .......... .......... .......... ..........  [ 143.0KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 264.1KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 309.8KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 406.3KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 495.4KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 586.3KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 673.1KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 647.1KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 721.1KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 781.3KB/s]
Connection 2 finished
.
.
Connection 0 finished
[ 98%]  .......... .......... .......... .......... ..........  [6221.9KB/s]
[ 98%]  .......... .......... .....
Connection 1 finished
        ,,,,,,,,,, ,,,,,,,,,, ,,,,,..... .......... ..........  [6145.6KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [6159.2KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [6172.0KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [5977.9KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [5989.6KB/s]
[100%]  .......... .......... .......... .......... ......

Downloaded 21.6 megabytes in 3 seconds. (6001.05 KB/s)
```

#### 3) Limit download speed

By default axel Set the maximum speed for downloading file in Bytes per Second. We can use this option when we have a slow network connection. Just add `-s` option followed by bytes value. Here we are going to download a file with `512KB/s`.

```
# axel -s 512000 https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
Starting download

[  0%]  .......... .......... .......... .......... ..........  [ 141.5KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 266.1KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 308.0KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 405.9KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 496.7KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 526.4KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 507.0KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 505.6KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 504.8KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 503.9KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 503.4KB/s]
.
.
[ 99%]  .......... .......... .......... .......... ..........  [ 497.0KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [ 496.9KB/s]
[100%]  .......... ..
Connection 0 finished
        ,,,,,,,,,, ,,.....
Connection 1 finished
Connection 3 finished
        ,,,,,,,,,, ,,,,,,,... .......... .......... ......

Downloaded 21.6 megabytes in 44 seconds. (494.54 KB/s)
```

#### 4) Limit the Connections

By default axel establish 4 connection to get the file from different mirrors. Additionally we can boost the download speed by adding more connection with `-n` option followed by connections count `8`. We have added eight connection for safer side but unfortunately it took much time to get the file downloaded.

```
# axel -n 10 https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
Starting download

[  0%]  .......... .......... .......... .......... ..........  [ 140.8KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 265.7KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 305.4KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 402.1KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 496.3KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 522.1KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 567.5KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 640.5KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 710.8KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 780.5KB/s]
.
.
[ 98%]  .......... .......... .......... .......... ..........  [7544.9KB/s]
[ 98%]  .......... .......... .......... .......... ..........  [7557.9KB/s]
[ 98%]  .......... .......... .......... .......... ..........  [7570.4KB/s]
[ 98%]  .......... .......... .......... .......... ..........  [7495.3KB/s]
[ 99%]  .......... .......... .......... .......... ......
Connection 2 finished
        ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ,,,,,,....  [7311.6KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [7318.9KB/s]
[ 99%]  .......... .......... .......... .......... ..........
Connection 9 finished
        ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,,  [7331.0KB/s]
[ 99%]  .......... .......... .......... ..........
Connection 3 finished
        ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ..........  [4300.7KB/s]
[100%]  .......... .......... .......... .......... ......

Downloaded 21.6 megabytes in 5 seconds. (4109.41 KB/s)
```

#### 5) Resume Incomplete download

By default axel have the behavior of Resume Incomplete download. Axel used to update the state file `(.st extension)` regularly while downloading the file. Due to some reason, the download get hang in middle ? don’t worry, just use the same axel command which will check `file` & `file.st`, if found, download is resumed where it stopped.

```
# axel https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
Starting download

[  0%]  .......... .......... .......... .......... ..........  [ 140.8KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 265.7KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 305.4KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 402.1KB/s]
[  0%]  .......... .......... .......... .......... ..........  [ 496.3KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 522.1KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 567.5KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 640.5KB/s]
[  1%]  .......... .......... .......... .......... ..........  [ 710.8KB/s]
[  2%]  .......... .......... .......... .......... ..........  [ 780.5KB/s]
.
.
[ 84%]  .......... .......... .......... .......... ..........  [7100.7KB/s]
[ 84%]  .......... .......... .......... .......... ..........  [7104.3KB/s]
[ 84%]  .......... .......... .......... .^C

Downloaded 18.3 megabytes in 2 seconds. (7009.79 KB/s)
```

The following output clearly showing two files `owncloud-9.0.0.tar.bz2` & `owncloud-9.0.0.tar.bz2.st` when we disconnect the download. When re initiating the download again, it starts exactly where it stopped before.

```
# ls -lh
total 19M
-rw------- 1 root root 22M Dec 27 08:33 owncloud-9.0.0.tar.bz2
-rw------- 1 root root  44 Dec 27 08:33 owncloud-9.0.0.tar.bz2.st

# axel https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
State file found: 19180828 bytes downloaded, 3497380 to go.
Starting download

        ,,,,,,,,,, ,,,,,,,,,, ,,,,,,,,,, ,......... ..........  [  66.5KB/s]
[ 84%]  .......... .......... .......... .......... ..........  [ 186.0KB/s]
[ 85%]  .......... .......... .......... .......... ..........  [ 241.7KB/s]
[ 85%]  .......... .......... .......... .......... ..........  [ 335.6KB/s]
[ 85%]  .......... .......... .......... .......... ..........  [ 351.5KB/s]
[ 85%]  .......... .......... .......... .......... ..........  [ 427.1KB/s]
[ 85%]  .......... .......... .......... .......... ..........  [ 427.4KB/s]
[ 86%]  .......... .......... .......... .......... ..........  [ 491.5KB/s]
.
.
[ 98%]  ...
Connection 0 finished
        ,,,....... .......... .......... .......... ..........  [2106.6KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [2140.5KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [2172.4KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [2203.2KB/s]
[ 99%]  .......... .......... .......... .......... ..........  [2236.2KB/s]
[100%]  .......... .......... .......... .......... ......

Downloaded 3415.4 kilobytes in 1 second. (2264.93 KB/s)
```

#### 6) Get the file without progress

If you don’t want to see the file download progress, simply add `-q` option with axel command.

```
# axel -q https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
```

#### 7) Alternate progress indicator

If you don’t like the default progress bar, you can use alternate progress indicator by adding -a option with axel command.

```
# axel -a https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
Initializing download: https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
Starting download

[ 66%] [......0      ...1        ..........2  ...........3] [   5.8MB/s] [00:01]^C

Downloaded 14.3 megabytes in 2 seconds. (5916.11 KB/s)
```

We have interrupted the above download to show you the alternate progress indicator status clearly while downloading the file. Once the file get downloaded successfully you can see the same output like below.

```
# axel -a https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
File size: 22678208 bytes
Opening output file owncloud-9.0.0.tar.bz2
Starting download

Connection 2 finished                                                          ]
Connection 1 finished                                                          ]
Connection 3 finished                                                          ]
Connection 0 finished                                                          ]

Downloaded 21.6 megabytes in 4 seconds. (5062.32 KB/s)
```

#### 8) Read more about axel

If you want to know more option which is available for axel, simply navigate to man page.

```
# man axel
or
# axel --help
```

Enjoy…)

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/axel-command-line-downloader-accelerator-for-linux/

作者：[ MAGESH MARUTHAMUTHU][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[2]:http://www.2daygeek.com/wget-command-line-download-utility-tool/
[3]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[4]:http://www.2daygeek.com/best-4-command-line-download-managers-accelerators-for-linux/
[5]:http://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]:http://www.2daygeek.com/author/magesh/
[7]:https://axel.alioth.debian.org/
