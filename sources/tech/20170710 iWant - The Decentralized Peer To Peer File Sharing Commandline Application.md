iWant – The Decentralized Peer To Peer File Sharing Commandline Application
======

![](https://www.ostechnix.com/wp-content/uploads/2017/07/p2p-720x340.jpg)

A while ago, we have written a guide about two file sharing utilities named [**transfer.sh**][1], a free web service that allows you to share files over Internet easily and quickly, and [**PSiTransfer**][2], a simple open source self-hosted file sharing solution. Today, we will see yet another file sharing utility called **“iWant”**. It is a free and open source CLI-based decentralized peer to peer file sharing application.

What’s makes it different from other file sharing applications? You might wonder. Here are some prominent features of iWant.

  * It’s commandline application. You don’t need any memory consuming GUI utilities. You need only the Terminal.
  * It is decentralized. That means your data will not be stored in any central location. So, there is no central point of failure.
  * iWant allows you to pause the download and you can resume it later when you want. You don’t need to download it from beginning, it just resumes the downloads from where you left off.
  * Any changes made in the files in the shared directory (such as deletion, addition, modification) will be reflected instantly in the network.
  * Just like torrents, iWant downloads the files from multiple peers. If any seeder left the group or failed to respond, it will continue the download from another seeder.
  * It is cross-platform, so, you can use it in GNU/Linux, MS Windows, and Mac OS X.



### iWant – A CLI-based Decentralized Peer To Peer File Sharing Solution

#### Install iWant

iWant can be easily installed using PIP package manager. Make sure you have pip installed in your Linux distribution. if it is not installed yet, refer the following guide.

[How To Manage Python Packages Using Pip](https://www.ostechnix.com/manage-python-packages-using-pip/)

After installing PIP, make sure you have installed the the following dependencies:

  * libffi-dev
  * libssl-dev



Say for example, on Ubuntu, you can install these dependencies using command:
```
$ sudo apt-get install libffi-dev libssl-dev

```

Once all dependencies installed, install iWant using the following command:
```
$ sudo pip install iwant

```

We have now iWant in our system. Let us go ahead and see how to use it to transfer files over network.

#### Usage

First, start iWant server using command:
```
$ iwanto start

```

At the first time, iWant will ask the Shared and Download folder’s location. Enter the actual location of both folders. Then, choose which interface you want to use:

Sample output would be:
```
Shared/Download folder details looks empty..
Note: Shared and Download folder cannot be the same
SHARED FOLDER(absolute path):/home/sk/myshare
DOWNLOAD FOLDER(absolute path):/home/sk/mydownloads
Network interface available
1. lo => 127.0.0.1
2. enp0s3 => 192.168.43.2
Enter index of the interface:2
now scanning /home/sk/myshare
[Adding] /home/sk/myshare 0.0
Updating Leader 56f6d5e8-654e-11e7-93c8-08002712f8c1
[Adding] /home/sk/myshare 0.0
connecting to 192.168.43.2:1235 for hashdump

```

If you see an output something like above, you can start using iWant right away.

Similarly, start iWant service on all systems in the network, assign valid Shared and Downloads folder’s location, and select the network interface card.

The iWant service will keep running in the current Terminal window until you press **CTRL+C** to quit it. You need to open a new tab or new Terminal window to use iWant.

iWant usage is very simple. It has few commands as listed below.

  * **iwanto start** – Starts iWant server.
  * **iwanto search <name>** – Search for files.
  * **iwanto download <hash>** – Download a file.
  * **iwanto share <path>** – Change the Shared folder’s location.
  * **iwanto download to <destination>** – Change the Download folder’s location.
  * **iwanto view config** – View Shared and Download folders.
  * **iwanto –version** – Displays the iWant version.
  * **iwanto -h** – Displays the help section.



Allow me to show you some examples.

**Search files**

To search for a file, run:
```
$ iwanto search <filename>

```

Please note that you don’t need to specify the accurate name.

Example:
```
$ iwanto search command

```

The above command will search for any files that contains the string “command”.

Sample output from my Ubuntu system:
```
Filename Size Checksum
------------------------------------------- ------- --------------------------------
/home/sk/myshare/THE LINUX COMMAND LINE.pdf 3.85757 efded6cc6f34a3d107c67c2300459911

```

**Download files**

You can download the files from any system on your network. To download a file, just mention the hash (checksum) of the file as shown below. You can get hash value of a share using “iwanto search” command.
```
$ iwanto download efded6cc6f34a3d107c67c2300459911

```

The file will be saved in your Download location (/home/sk/mydownloads/ in my case).
```
Filename: /home/sk/mydownloads/THE LINUX COMMAND LINE.pdf
Size: 3.857569 MB

```

**View configuration**

To view the configuration i.e the Shared and Download folders, run:
```
$ iwanto view config

```

Sample output:
```
Shared folder:/home/sk/myshare
Download folder:/home/sk/mydownloads

```

**Change Shared and Download folder’s location**

You can change the Shared folder and Download folder location to some other path like below.
```
$ iwanto share /home/sk/ostechnix

```

Now, the Shared location has been changed to /home/sk/ostechnix location.

Also, you can change the Downloads location using command:
```
$ iwanto download to /home/sk/Downloads

```

To view the changes made, run the config command:
```
$ iwanto view config

```

**Stop iWant**

Once you done with iWant, you can quit it by pressing **CTRL+C**.

If it is not working by any chance, it might be due to Firewall or your router doesn’t support multicast. You can view all logs in** ~/.iwant/.iwant.log** file. For more details, refer the project’s GitHub page provided at the end.

And, that’s all. Hope this tool helps. I will be here again with another interesting guide. Till then, stay tuned with OSTechNix!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/iwant-decentralized-peer-peer-file-sharing-commandline-application/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/easy-fast-way-share-files-internet-command-line/
[2]:https://www.ostechnix.com/psitransfer-simple-open-source-self-hosted-file-sharing-solution/
