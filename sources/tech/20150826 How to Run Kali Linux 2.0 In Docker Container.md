How to Run Kali Linux 2.0 In Docker Container
================================================================================
### Introduction ###

Kali Linux is a well known operating system for security testers and ethical hackers. It comes bundled with a large list of security related applications and make it easy to perform penetration testing. Recently, [Kali Linux 2.0][1] is out and it is being considered as one of the most important release for this operating system. On the other hand, Docker technology is getting massive popularity due to its scalability and ease of use. Dockers make it super easy to ship your software applications to your users. Breaking news is that you can now run Kali Linux via Dockers; let’s see how  :)

### Running Kali Linux 2.0 In Docker ###

**Related Notes**

If you don’t have docker installed on your system, you can do it by using the following commands:

**For Ubuntu/Linux Mint/Debian:**

    sudo apt-get install docker 

**For Fedora/RHEL/CentOS:**

    sudo yum install docker 

**For Fedora 22:**

    dnf install docker 

You can start docker service by running:

    sudo docker start 

First of all make sure that docker service is running fine by using the following command:

    sudo docker status 

Kali Linux docker image has been uploaded online by Kali Linux development team, simply run following command to download this image to your system.

    docker pull kalilinux/kali-linux-docker 

![Pull Kali Linux docker](http://linuxpitstop.com/wp-content/uploads/2015/08/129.png)

Once download is complete, run following command to find out the Image ID for your downloaded Kali Linux docker image file.

    docker images 

![Kali Linux Image ID](http://linuxpitstop.com/wp-content/uploads/2015/08/230.png)

Now run following command to start your kali Linux docker container from image file (Here replace Image ID with correct one).

    docker run -i -t 198cd6df71ab3 /bin/bash 

It will immediately start the container and will log you into the operating system, you can start working on Kali Linux here.

![Kali Linux Login](http://linuxpitstop.com/wp-content/uploads/2015/08/328.png)

You can verify that container is started/running fine, by using the following command:

    docker ps 

![Docker Kali](http://linuxpitstop.com/wp-content/uploads/2015/08/421.png)

### Conclusion ###

Dockers are the smartest way to deploy and distribute your packages. Kali Linux docker image is pretty handy, does not consume any high amount of space on the disk and it is pretty easy to test this wonderful distro on any docker installed operating system now.

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/run-kali-linux-2-0-in-docker-container/

作者：[Aun][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxpitstop.com/author/aun/
[1]:http://linuxpitstop.com/install-kali-linux-2-0/