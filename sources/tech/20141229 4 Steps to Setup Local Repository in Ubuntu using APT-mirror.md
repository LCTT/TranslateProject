4 Steps to Setup Local Repository in Ubuntu using APT-mirror
================================================================================
Today we will show you how to setup a local repository in your Ubuntu PC or Ubuntu Server straight from the official Ubuntu repository. There are a lot benefit of creating a local repository in your computer if you have a lot of computers to install software, security updates and fixes often in all systems, then having a local Ubuntu repository is an efficient way. Because all required packages are downloaded over the fast LAN connection from your local server, so that it will save your Internet bandwidth and reduces the annual cost of Internet..

You can setup a local repository of Ubuntu in your local PC or server using many tools, but we'll featuring about APT-Mirror in this tutorial. Here, we'll be mirroring packages from the default mirror to our Local Server or PC and we'll need at least **120 GB** or more free space in your local or external hard drive. It can be configured through a **HTTP** or **FTP** server to share its software packages with local system clients.

We'll need to install Apache Web Server and APT-Mirror to get our stuffs working out of the box. Here are the steps below to configure a working local repository:

### 1. Installing Required Packages ###

First of all, we are going to pull whole packages from the public repository of Ubuntu package server and save them in our local Ubuntu server hard disk.

We'll first install a web server to host our local repository. We'll install Apache web server but you can install any web server you wish, web server are necessary for the http protocol. You can additionally install FTP servers like proftpd, vsftpd,etc if you need to configure for ftp protocols and Rsync for rsync protocols.

    $ sudo apt-get install apache2

And then we'll need to install apt-mirror:

    $ sudo apt-get install apt-mirror

![apt-mirror-installation](http://blog.linoxide.com/wp-content/uploads/2014/12/apt-mirror-install.png)

**Note: As I have already mentioned that we'll need at least 120 GBs free space to get all the packages mirrored or download.**

### 2. Configuring APT-Mirror ###

Now create a directory on your harddisk to save all packages. For example, let us create a directory called “/linoxide”. We are going to save all packages in this directory:

     $ sudo mkdir /linoxide

![repo-dir](http://blog.linoxide.com/wp-content/uploads/2014/12/mkdir-linoxide.png)

Now, open the file **/etc/apt/mirror.list** file

     $ sudo nano /etc/apt/mirror.list

![apt-mirror-edit](http://blog.linoxide.com/wp-content/uploads/2014/12/edit-mirror-list-300x7.png)

Copy the below lines of configuration to mirror.list and edit as your requirements.

    ############# config ##################
    #
    set base_path    /linoxide
    #
    # set mirror_path  $base_path/mirror
    # set skel_path    $base_path/skel
    # set var_path     $base_path/var
    # set cleanscript $var_path/clean.sh
    # set defaultarch  <running host architecture>
    # set postmirror_script $var_path/postmirror.sh
    # set run_postmirror 0
    set nthreads     20
    set _tilde 0
    #
    ############# end config ##############

    deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
    deb http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
    deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
    #deb http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
    #deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

    deb-src http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
    #deb-src http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
    #deb-src http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

    clean http://archive.ubuntu.com/ubuntu

![mirror-list-config](http://blog.linoxide.com/wp-content/uploads/2014/12/mirror-list-config.png)

**Note: You can replace the above official mirror server url by the nearest one, you can get your nearest server by visiting the page [Ubuntu Mirror Server][1]. If you are not in hurry and can wait for the mirroring, you can go with the default official one.**

Here, we are going to mirror package repository of the latest and greatest LTS release of Ubuntu ie. Ubuntu 14.04 LTS (Trusty Tahr) so, we have configured trusty. If you need to mirror of Saucy or other version of Ubuntu, please edit it as its codename.

Now, we'll have to run apt-mirror which will now get/mirror all the packages in the repository.

    sudo apt-mirror

It will take time to download all the packages from the Ubuntu Server which depends upon the connection speed and performance with respect to you and the mirror server. I have interrupted the download as I have already done that...

![downloading-packages](http://blog.linoxide.com/wp-content/uploads/2014/12/downloading-index.png)

### 3.Configuring Web Server ###

To be able to access the repo from other computers you need a webserver. You can also do it via ftp but I choose to use a webserver as I mentioned in above step 1. So, we are now gonna configure Apache Server:

We will create a symlink from our local repo's directory to a directory ubuntu in the hosting directory of Apache ie /var/www/ubuntu

    $ sudo ln -s /linoxide /var/www/ubuntu
    $ sudo service apache2 start

![symlinks-apache2](http://blog.linoxide.com/wp-content/uploads/2014/12/symblink-apache2.png)

The above command will allow us to browse our Mirrored Repo from our localhost ie http://127.0.0.1 by default.
 
### 4. Configuring Client Side ###

Finally, we need to add repository source in other computers which will fetch the packages and repository from our computer. To do that, we'll need to edit /etc/apt/sources.list and add the following lines.

    $ sudo nano /etc/apt/sources.list

Add this line in /etc/apt/sources.list and save.

    deb http://192.168.0.100/ubuntu/ trusty main restricted universe

**Note: here 192.168.0.100 is the LAN IP address of our server computer, you need to replace that with yours.**

    $ sudo apt-get update

Finally, we are done. Now you can install the required packages using sudo apt-get install packagename from your local Ubuntu repository with high speed download and with low bandwidth.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-local-repository-ubuntu/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://launchpad.net/ubuntu/+archivemirrors