translating---geekpi

Aria2 Vs Wget – Choose your Download Manager
============================================================


Any Linux operating system is incomplete without a download manager. From many years, Linux based distros are using wget as default download manager. Its pretty little application which works fine from command line, if you need to install anything, download any stuff, you need to run shell scripts etc, everything uses wget on some level to complete tasks. Over the past many years, it has been identified that wget is lacking some advance features and its alternative, **Aria2, **has received the attention of many users due to fulfilling the thirst of advance linux users. We will be reviewing the installation process of **Aria2 ** and the difference between Wget and Aria 2 in this article, so you may decide which download manager best suits your needs.

### Installing Aria2

**Installing aria2 on Ubuntu/Debian:**

Simply run following command on your terminal to install it on ubuntu:

sudo apt-get install aria2

[
 ![aria2](http://linuxpitstop.com/wp-content/uploads/2015/06/aria2.png) 
][1]

**Installing aria2 on Fedora/RHEL/Centos:**

Run following command to install it on Fedora/RHEL and Centos based systems.

sudo yum install aria2

**Installing aria2 on Arch Linux:**

Run following command to install it on arch Linux based operating systems.

sudo pacman -Sy aria2

### Prominent Features of Aria2

Let’s discuss the prominent features of Aria2 that makes it so popular:

*   Utilizes available bandwidth to maximum by downloading file using multiple connections.
*   Download multiple files simultaneously and ability for simultaneously download.
*   All features that a torrent client app offers are available in this little command line utility.
*   It offers meta link downloads.
*   Supports remote procedure calls using JSON-RPC and XML-RPC protocols.
*   No need to wait for current download to finish, batch download files easily.

### Some side effects of using Aria 2:

The multi threaded mechanism of aria2 can overload the destination server. Wget is still lightweight as compared to this, wget consumes 20% less resources than aria2\. Aria2 has not yet been tested on the huge level that wget is being used, so it may not yet be 100% ready to be adopted as default download manager.

### Prominent Features of Wget

*   Off course, it is most widely used and tested download Manager.
*   A simple program, with fewer features, but working stable over the decades.
*   Comes by default with all Linux distro, no heavy installation needed.
*   Lightweight as compared to Aria 2.

### Conclusion

Although, not very feature rich, but Wget is still doing the job pretty well, however, advance users will definitely prefer aria2 as it caters the needs for faster and simultaneous download. It might take a long time for aria2 to replace wget as default download manager because wget is being used in almost all installer scripts available for linux distros at the moment.

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/aria-2-vs-wget/

作者：[Aun][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxpitstop.com/author/aun/
[1]:http://linuxpitstop.com/wp-content/uploads/2015/06/aria2.png
