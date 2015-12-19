translating by Ezio

How to Setup Drone - a Continuous Integration Service in Linux
==============================================================

Are you tired of cloning, building, testing, and deploying codes time and again? If yes, switch to continuous integration. Continuous Integration aka CI is practice in software engineering of making frequent commits to the code base, building, testing and deploying as we go. CI helps to quickly integrate new codes into the existing code base. If this process is made automated, then this will speed up the development process as it reduces the time taken for the developer to build and test things manually. [Drone][1] is a free and open source project which provides an awesome environment of continuous integration service and is released under Apache License Version 2.0. It integrates with many repository providers like Github, Bitbucket and Google Code and has the ability to pull codes from the repositories enabling us to build the source code written in number of languages including PHP, Node, Ruby, Go, Dart, Python, C/C++, JAVA and more. It is made such a powerful platform cause it uses containers and docker technology for every build making users a complete control over their build environment with guaranteed isolation.

### 1. Installing Docker ###

First of all, we'll gonna install Docker as its the most vital element for the complete workflow of Drone. Drone does a proper utilization of docker for the purpose of building and testing application. This container technology speeds up the development of the applications. To install docker, we'll need to run the following commands with respective the distribution of linux. In this tutorial, we'll cover the steps with Ubuntu 14.04 and CentOS 7 linux distributions.

#### On Ubuntu ####

To install Docker in Ubuntu, we can simply run the following commands in a terminal or console.

    # apt-get update
    # apt-get install docker.io

After the installation is done, we'll restart our docker engine using service command.

    # service docker restart

Then, we'll make docker start automatically in every system boot.

    # update-rc.d docker defaults

    Adding system startup for /etc/init.d/docker ...
    /etc/rc0.d/K20docker -> ../init.d/docker
    /etc/rc1.d/K20docker -> ../init.d/docker
    /etc/rc6.d/K20docker -> ../init.d/docker
    /etc/rc2.d/S20docker -> ../init.d/docker
    /etc/rc3.d/S20docker -> ../init.d/docker
    /etc/rc4.d/S20docker -> ../init.d/docker
    /etc/rc5.d/S20docker -> ../init.d/docker

#### On CentOS ####

First, we'll gonna update every packages installed in our centos machine. We can do that by running the following command.

    #  sudo yum update

To install docker in centos, we can simply run the following commands.

    #  curl -sSL https://get.docker.com/ | sh

After our docker engine is installed in our centos machine, we'll simply start it by running the following systemd command as systemd is the default init system in centos 7.

    # systemctl start docker

Then, we'll enable docker to start automatically in every system startup.

    # systemctl enable docker

    ln -s '/usr/lib/systemd/system/docker.service' '/etc/systemd/system/multi-user.target.wants/docker.service'

### 2. Installing SQlite Driver ###

It uses SQlite3 database server for storing its data and information by default. It will automatically create a database file named drone.sqlite under /var/lib/drone/ which will handle database schema setup and migration. To setup SQlite3 drivers, we'll need to follow the below steps.

#### On Ubuntu 14.04 ####

As SQlite3 is available on the default respository of Ubuntu 14.04, we'll simply install it by running the following apt command.

    # apt-get install libsqlite3-dev

#### On CentOS 7 ####

To install it on CentOS 7 machine, we'll need to run the following yum command.

    # yum install sqlite-devel

### 3. Installing Drone ###

Finally, after we have installed those dependencies successfully, we'll now go further towards the installation of drone in our machine. In this step, we'll simply download the binary package of it from the official download link of the respective binary formats and then install them using the default package manager.

#### On Ubuntu ####

We'll use wget to download the debian package of drone for ubuntu from the [official Debian file download link][2]. Here is the command to download the required debian package of drone.

    # wget downloads.drone.io/master/drone.deb

    Resolving downloads.drone.io (downloads.drone.io)... 54.231.48.98
    Connecting to downloads.drone.io (downloads.drone.io)|54.231.48.98|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7722384 (7.4M) [application/x-debian-package]
    Saving to: 'drone.deb'
    100%[======================================>] 7,722,384 1.38MB/s in 17s
    2015-11-06 14:09:28 (456 KB/s) - 'drone.deb' saved [7722384/7722384]

After its downloaded, we'll gonna install it with dpkg package manager.

    # dpkg -i drone.deb

    Selecting previously unselected package drone.
    (Reading database ... 28077 files and directories currently installed.)
    Preparing to unpack drone.deb ...
    Unpacking drone (0.3.0-alpha-1442513246) ...
    Setting up drone (0.3.0-alpha-1442513246) ...
    Your system ubuntu 14: using upstart to control Drone
    drone start/running, process 9512

#### On CentOS ####

In the machine running CentOS, we'll download the RPM package from the [official download link for RPM][3] using wget command as shown below.

    # wget downloads.drone.io/master/drone.rpm

    --2015-11-06 11:06:45-- http://downloads.drone.io/master/drone.rpm
    Resolving downloads.drone.io (downloads.drone.io)... 54.231.114.18
    Connecting to downloads.drone.io (downloads.drone.io)|54.231.114.18|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7763311 (7.4M) [application/x-redhat-package-manager]
    Saving to: ‘drone.rpm’
    100%[======================================>] 7,763,311 1.18MB/s in 20s
    2015-11-06 11:07:06 (374 KB/s) - ‘drone.rpm’ saved [7763311/7763311]

Then, we'll install the download rpm package using yum package manager.

    # yum localinstall drone.rpm

### 4. Configuring Port ###

After the installation is completed, we'll gonna configure drone to make it workable. The configuration of drone is inside **/etc/drone/drone.toml** file. By default, drone web interface is exposed under port 80 which is the default port of http, if we wanna change it, we can change it by replacing the value under server block as shown below.

    [server]
    port=":80"

### 5. Integrating Github ###

In order to run Drone we must setup at least one integration points between GitHub, GitHub Enterprise, Gitlab, Gogs, Bitbucket. In this tutorial, we'll only integrate github but if we wanna integrate other we can do that from the configuration file. In order to integrate github, we'll need to create a new application in our [github settings][4].

![Registering App Github](http://blog.linoxide.com/wp-content/uploads/2015/11/registering-app-github.png)

To create, we'll need to click on Register a New Application then fill out the form as shown in the following image.

![Registering OAuth app github](http://blog.linoxide.com/wp-content/uploads/2015/11/registering-OAuth-app-github.png)

We should make sure that **Authorization callback URL** looks like http://drone.linoxide.com/api/auth/github.com under the configuration of the application. Then, we'll click on Register application. After done, we'll note the Client ID and Client Secret key as we'll need to configure it in our drone configuration.

![Client ID and Secret Token](http://blog.linoxide.com/wp-content/uploads/2015/11/client-id-secret-token.png)

After thats done, we'll need to edit our drone configuration using a text editor by running the following command.

    # nano /etc/drone/drone.toml

Then, we'll find the [github] section and append the section with the above noted configuration as shown below.

    [github]
    client="3dd44b969709c518603c"
    secret="4ee261abdb431bdc5e96b19cc3c498403853632a"
    # orgs=[]
    # open=false

![Configuring Github Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-github-drone-e1446835124465.png)

### 6. Configuring SMTP server ###

If we wanna enable drone to send notifications via emails, then we'll need to specify the SMTP configuration of our SMTP server. If we already have an SMTP server, we can use its configuration but as we don't have an SMTP server, we'll need to install an MTA ie Postfix and then specify the SMTP configuration in the drone configuration.

#### On Ubuntu ####

We can install postfix in ubuntu by running the following apt command.

    # apt-get install postfix

#### On CentOS ####

We can install postfix in CentOS by running the following yum command.

    # yum install postfix

After installing, we'll need to edit the configuration of our postfix configuration using a text editor.

    # nano /etc/postfix/main.cf

Then, we'll need to replace the value of myhostname parameter to our FQDN ie drone.linoxide.com .

    myhostname = drone.linoxide.com

Now, we'll gonna finally configure the SMTP section of our drone configuration file.

    # nano /etc/drone/drone.toml

Then, we'll find the [stmp] section and then we'll need to append the setting as follows.

    [smtp]
    host = "drone.linoxide.com"
    port = "587"
    from = "root@drone.linoxide.com"
    user = "root"
    pass = "password"

![Configuring SMTP Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-smtp-drone.png)

Note: Here, **user** and **pass** parameters are strongly recommended to be changed according to one's user configuration.

### 7. Configuring Worker ###

As we know that drone utilizes docker for its building and testing task, we'll need to configure docker as the worker for our drone. To do so, we'll need to edit the [worker] section in the drone configuration file.

    # nano /etc/drone/drone.toml

Then, we'll uncomment the following lines and append as shown below.

    [worker]
    nodes=[
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock"
    ]

Here, we have set only 2 node which means the above configuration is capable of executing only 2 build at a time. In order to increase concurrency, we can increase the number of nodes.

    [worker]
    nodes=[
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock",
    "unix:///var/run/docker.sock"
    ]

Here, in the above configuration, drone is configured to process four builds at a time, using the local docker daemon.

### 8. Restarting Drone ###

Finally, after everything is done regarding the installation and configuration, we'll now start our drone server in our linux machine.

#### On Ubuntu ####

To start drone in our Ubuntu 14.04 machine, we'll simply run service command as the default init system of Ubuntu 14.04 is SysVinit.

    # service drone restart

To make drone start automatically in every boot of the system, we'll run the following command.

    # update-rc.d drone defaults

#### On CentOS ####

To start drone in CentOS machine, we'll simply run systemd command as CentOS 7 is shipped with systemd as init system.

    # systemctl restart drone

Then, we'll enable drone to start automatically in every system boot.

    # systemctl enable drone

### 9. Allowing Firewalls ###

As we know drone utilizes port 80 by default and we haven't changed the port, we'll gonna configure our firewall programs to allow port 80 (http) and be accessible from other machines in the network.

#### On Ubuntu 14.04 ####

Iptables is a popular firewall program which is installed in the ubuntu distributions by default. We'll make iptables to expose port 80 so that we can make our Drone web interface accessible in the network.

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    # /etc/init.d/iptables save

#### On CentOS 7 ####

As CentOS 7 has systemd installed by default, it contains firewalld running as firewall problem. In order to open the port 80 (http service) on firewalld, we'll need to execute the following commands.

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 10. Accessing Web Interface ###

Now, we'll gonna open the web interface of drone using our favourite web browser. To do so, we'll need to point our web browser to our machine running drone in it. As the default port of drone is 80 and we have also set 80 in this tutorial, we'll simply point our browser to http://ip-address/ or http://drone.linoxide.com according to our configuration. After we have done that correctly, we'll see the first page of it having options to login into our dashboard.

![Login Github Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/login-github-drone-e1446834688394.png)

As we have configured Github in the above step, we'll simply select github and we'll go through the app authentication process and after its done, we'll be forwarded to our Dashboard.

![Drone Dashboard](http://blog.linoxide.com/wp-content/uploads/2015/11/drone-dashboard.png)

Here, it will synchronize all our github repository and will ask us to activate the repo which we want to build with drone.

![Activate Repository](http://blog.linoxide.com/wp-content/uploads/2015/11/activate-repository-e1446835574595.png)

After its activated, it will ask us to add a new file named .drone.yml in our repository and define the build process and configuration in that file like which image to fetch and which command/script to run while compiling, etc.

We'll need to configure our .drone.yml as shown below.

    image: python
    script:
     - python helloworld.py
     - echo "Build has been completed."

After its done, we'll be able to build our application using the configuration YAML file .drone.yml in our drone appliation. All the commits made into the repository is synced in realtime. It automatically syncs the commit and changes made to the repository. Once the commit is made in the repository, build is automatically started in our drone application.

![Building Application Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/building-application-drone.png)

After the build is completed, we'll be able to see the output of the build with the output console.

![Build Success Drone](http://blog.linoxide.com/wp-content/uploads/2015/11/build-success-drone.png)

### Conclusion ###

In this article, we learned to completely setup a workable Continuous Intergration platform with Drone. If we want, we can even get started with the services provided by the official Drone.io project. We can start with free service or paid service according to our requirements. It has changed the world of Continuous integration with its beautiful web interface and powerful bunches of features. It has the ability to integrate with many third party applications and deployment platforms. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-drone-continuous-integration-linux/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://drone.io/
[2]:http://downloads.drone.io/master/drone.deb
[3]:http://downloads.drone.io/master/drone.rpm
[4]:https://github.com/settings/developers
