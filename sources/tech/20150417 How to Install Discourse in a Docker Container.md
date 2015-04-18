How to Install Discourse in a Docker Container
================================================================================
Hi all, today we'll learn how to install Discourse using Docker Platform. Discourse is the 100% open source discussion platform built for the next decade of the Internet featuring as a mailing list, a discussion forum and a long-form chat room. It is a smart way of attempt to reimagine what a modern, sustainable, fully open-source Internet discussion platform should be today, both from a technology standpoint and a sociology standpoint. Discourse is simple, clean, and straightforward way for discussion. It is really an awesome platform for any kinds of discussions on internet featuring such a cool services out of the box. Docker is an open source platform that provides an open platform to pack, ship and run any application as a lightweight container. Docker containers makes Discourse a lot handy and easy to setup app.

So, here are some quick and easy steps in order to install Discourse inside a Docker environment.

### 1. Installing Docker ###

First of all, we need to make sure that we have Docker installed in our host Operating System. To install, we'll need to the run the following command in a shell or terminal.

#### On Ubuntu ####

Package docker is available in Ubuntu's repository so, we'll be using apt manager to install it in sudo or root mode.

    # apt-get install docker

#### On CentOS 7 ####

On CentOS 7 machine, we'll use yum manager to install docker as it is also available in CentOS's repository.

    # yum install docker

![Installing Docker](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-docker.png)

### 2. Setting Swap Memory ###

If you have RAM size less than 1 GB then, make sure you upgrade your system to 1 GB or above cause Discourse doesn't get installed in 512 MB RAM. If you are now ready to install Discourse with 1 GB or above, follow the following steps to setup swap memory for you VPS or Server.

We'll create an empty swapfile by running the following command.

    # install -o root -g root -m 0600 /dev/null /swapfile

If you want your swap memory to be 1 GB, then do the below step and skip the next step.

    # dd if=/dev/zero of=/swapfile bs=1k count=1024k

if you want it to be 2 GB, follow the below. Make sure you skip the above step.

    # dd if=/dev/zero of=/swapfile bs=1k count=2048k

Then, we'll point Swap Memory as swapfile .

    #mkswap /swapfile

To activate it run the following command.

    #swapon /swapfile

Now, we'll add it to the file system table so its there after reboot:

    # echo "/swapfile swap swap auto 0 0" | sudo tee -a /etc/fstab

Set the swappiness to 10 so its only uses as an emergency buffer.

    # sudo sysctl -w vm.swappiness=10
    # echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf

### 3. Installing Discourse ###

After installing Docker in our host machine, we'll now go further towards installing Discourse. We'll now clone Discourse from the official Discourse Github into /var/discourse directory. To do so, we'll need to run the following command.

    # mkdir /var/discourse/

    # cd /var/discourse/

    # git clone https://github.com/discourse/discourse_docker.git /var/discourse/

After cloning the git repository, we'll copy the configuration file for our discourse server.

    # cp samples/standalone.yml containers/app.yml

![Cloning Discourse Docker](http://blog.linoxide.com/wp-content/uploads/2015/04/cloning-discourse-docker.png)

### 4. Configuring Discourse ###

Next, we'll edit the discourse configuration ie app.yml located inside containers directory using our favorite text editor.

    # nano containers/app.yml

Now, we need to set the developer's email address to DISCOURSE_DEVELOPER_EMAILS as follows.

    DISCOURSE_DEVELOPER_EMAILS: 'arun@linoxide.com'

Then, we'll set the hostname as the domain name of our server.

    DISCOURSE_HOSTNAME: 'discourse.linoxide.com'

Then, set the mail credentials per our SMTP Server hosted in the same discourse machine or vps. The SMTP settings are required to send mail from your Discourse instance

    DISCOURSE_SMTP_ADDRESS: smtp.linoxide.com
    DISCOURSE_SMTP_PORT: 587 # (optional)
    DISCOURSE_SMTP_USER_NAME: admin@linoxide.com # (optional)
    DISCOURSE_SMTP_PASSWORD: test123 # (optional)

![](http://blog.linoxide.com/wp-content/uploads/2015/04/discourse-configuration.png)

    Discourse Configuration

If you are using a 1 GB instance, set UNICORN_WORKERS to 2 and db_shared_buffers to 128MB so you have more memory room.

It is compulsory to create a mailing server to run Discourse. If you have a server then its cool, we can use its credentials. If you have no existing mail server, or you don't know what it is? No problem, create a free account on [Mandrill][1] ([Mailgun][2], or [Mailjet][3]), and use the credentials provided in the dashboard.

### 5. Starting Discourse App ###

After configuring the discourse configuration file, we'll surely wanna start our Discourse server. To do so, first we'll launch discourse bootstrap by running the following command under the current directory ie /var/discourse/ .

    # ./launcher bootstrap app

![Starting Discourse Bootstrap](http://blog.linoxide.com/wp-content/uploads/2015/04/starting-discourse-bootstrap.png)

The above command may take some minutes which automatically configures our Discourse environment. Then, after the processes are finished, we'll need to run the following to start our Discourse App.

    #./launcher start app

![Starting Discourse](http://blog.linoxide.com/wp-content/uploads/2015/04/starting-discourse.png)

If everything went as expected accordingly, we'll be able to access our fresh Discourse Web Interface using our favorite Web Browser by pointing the url to http://ip-address/ or http://discourse.linoxide.com/ . Then, we can create a new account and become admin.

![Discourse Web interface](http://blog.linoxide.com/wp-content/uploads/2015/04/Discourse-web-interface.png)

### Maintenance ###

Here below are the usages of the launcher command inside /var/discourse/ directory so that we can commit maintenance and control  over the Discourse Docker Container.

    Usage: launcher COMMAND CONFIG [--skip-prereqs]
    Commands:
    start: Start/initialize a container
    stop: Stop a running container
    restart: Restart a container
    destroy: Stop and remove a container
    enter: Use nsenter to enter a container
    ssh: Start a bash shell in a running container
    logs: Docker logs for container
    mailtest: Test the mail settings in a container
    bootstrap: Bootstrap a container for the config based on a template
    rebuild: Rebuild a container (destroy old, bootstrap, start new)
    cleanup: Remove all containers that have stopped for > 24 hours

    Options:
    --skip-prereqs Don't check prerequisites
    --docker-args Extra arguments to pass when running docker

### Conclusion ###

Hurray! We have successfully installed Discourse with Docker Technology. Docker technology makes Discourse very much easy to install in any Platform with all the requirement fulfilled. We need our own mailing server or credentials of a mailing server to get started with it. It is a great platform for easy modern mailing list, discussion platform.

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-discourse-docker-container/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://mandrillapp.com/
[2]:http://www.mailgun.com/
[3]:https://www.mailjet.com/pricing