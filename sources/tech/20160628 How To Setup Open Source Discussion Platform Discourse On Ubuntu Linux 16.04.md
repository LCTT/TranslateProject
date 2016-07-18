How To Setup Open Source Discussion Platform Discourse On Ubuntu Linux 16.04
===============================================================================

Discourse is an open source discussion platform, that can work as a mailing list, a chat room and a forum as well. It is a popular tool and modern day implementation of a successful discussion platform. On server side, it is built using Ruby on Rails and uses Postgres on the backend, it also makes use of Redis caching to reduce the loading times, while on client’s side end, it runs in browser using Java Script. It is a pretty well optimized and well structured tool. It also offers converter plugins to migrate your existing discussion boards / forums like  vBulletin, phpBB, Drupal, SMF etc to Discourse. In this article, we will be learning how to install Discourse on Ubuntu operating system.

It is developed by keeping security in mind, so spammers and hackers might not be lucky with this application. It works well with all modern devices, and adjusts its display setting accordingly for mobile devices and tablets.

### Installing Discourse on Ubuntu 16.04

Let’s get started ! the minimum system RAM to run Discourse is 1 GB and the officially supported installation process for Discourse requires dockers to be installed on our Linux system. Besides dockers, it also requires Git. We can fulfill these two requirements by simply running the following command on our system’s terminal.

```
wget -qO- https://get.docker.com/ | sh
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/124.png)

It shouldn’t take longer to complete the installation for Docker and Git, as soon its installation process is complete, create a directory for Discourse inside /var partition of your system (You can choose any other partition here too).

```
mkdir /var/discourse 
```

Now clone the Discourse’s Github repository to this newly created directory.

```
git clone https://github.com/discourse/discourse_docker.git /var/discourse
```

Go into the cloned directory.

```
cd /var/discourse
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/314.png)

You should be able to locate “discourse-setup” script file here, simply run this script to initiate the installation wizard for Discourse.

```
./discourse-setup
```

**Side note: Please make sure  you have a ready email server setup before attempting install for discourse.**

Installation wizard will ask you following six questions.

```
Hostname for your Discourse? 
Email address for admin account? 
SMTP server address? 
SMTP user name? 
SMTP port [587]:
SMTP password? []:
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/411.png)

Once you supply these information, it will ask for the confirmation, if everything is fine, hit “Enter” and installation process will take off.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/511.png)

Sit back and relax! it will take sweet amount of time to complete the installation,  grab a cup of coffee, and keep an eye for any error messages.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/610.png)

Here is how the successful completion of the installation process should look alike.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/710.png)

Now launch your web browser, if the hostname for discourse installation resolves properly to IP, then you can use your hostname in browser , otherwise use your IP address to launch the Discourse page. Here is what you should see:

![](http://linuxpitstop.com/wp-content/uploads/2016/06/85.png)

That’s it, create new account by using “Sign Up” option and you should be good to go with your Discourse setup.

![](http://linuxpitstop.com/wp-content/uploads/2016/06/106.png)

### Conclusion

It is an easy to setup application and works flawlessly. It is equipped with all required features of modern day discussion board. It is available under General Public License and is 100% open source product. The simplicity, easy of use, powerful and long feature list are the most important feathers of this tool. Hope you enjoyed this article, Question? do let us know in comments please.

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/install-discourse-on-ubuntu-linux-16-04/

作者：[Aun][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://linuxpitstop.com/author/aun/








