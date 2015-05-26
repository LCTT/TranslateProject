Translating by GOLinux!
Linux ntopng - Network Monitoring Tool Installation (Screenshots)
================================================================================
Nowdays computers are connected between each other. From the small area such as your home Local Area Network (LAN) until the the biggest one which we call - Internet. When you are managing a network computer, you are managing one of the most critical component. Since most of developed application is web based application, the network between critical.

There is why we need a network monitoring tool. One of the best network monitoring tool is called ntop. From [Wikipedia][1] “ntop is a network probe that shows network usage in a way similar to what top does for processes. In interactive mode, it displays the networkstatus on the user's terminal. In Web mode, it acts as a web server, creating a HTML dump of the network status. It supports a NetFlow/sFlowemitter/collector, a HTTP-based client interface for creating ntop-centric monitoring applications, and RRD for persistently storing traffic statistics”

Now after 15 years, you will find ntopng - the next generation ntop.

### What is ntopng ###

Ntopng is a high-speed web-based traffic analysis and flow collection. Ntopng is based from ntop. It’s run on every Unix platform, MacOS X and Windows.

### Features ###

From [ntopng website][2], they said there are many features of it. Here’s some of the list :

- Sort network traffic according to many protocols
- Show network traffic and IPv4/v6 active hosts
- Store on disk persistent traffic statistics in RRD format Geolocate hosts
- Discover application protocols by leveraging on nDPI, ntop’s DPI framework
- Show IP traffic distribution among the various protocols
- Analyse IP traffic and sort it according to the source/destination
- Display IP Traffic Subnet matrix (who’s talking to who?)
- Report IP protocol usage sorted by protocol type
- Produce HTML5/AJAX network traffic statistics

### Installation ###

Ntop is available in pre-compiled packages for CentOS dan Ubuntu **64-bit based**. You may find the packages in [their download page][3]. For 32-bit operating system, you have to compile it from the source. This article is **tested** on **CentOS 6.4 32-bit** version. But it may works also in other version of CentOS / RedHat based Linux. Let’s start.

#### Prerequisites ####

#### Development Tools ####

You have to make sure that you have all development tools which is needed to compile ntopng. To install the development tools you can use yum command :

    # yum groupinstall ‘Development Tools’

#### Install TCL ####

    # yum install tcl

#### Install libpcap ####

    # yum install libpcap libcap-devel

#### Install Redis ####

    # wget http://redis.googlecode.com/files/redis-2.6.13.tar.gz
    # tar zxfv redis-2.6.13.tar.gz
    # cd redis-2.6.13
    # make 32bit
    # make test
    # make install

### Install ntopng ###

#### Method 1 : ####

    # wget http://sourceforge.net/projects/ntop/files/ntopng/ntopng-1.1_6932.tgz/download
    # tar zxfv ntopng-1.1_6932.tgz
    # cd ntopng-1.1_6932
    # ./configure
    # make
    # make install 

#### Method 2 : ####

On my CentOS 6.4 , I got an error message when using Method 1. Here’s the error message :

    ./third-party/LuaJIT-2.0.2/src/libluajit.a : could not read symbols : File in wrong format

So I **switch** to install it using **SVN**. Internet connection is required for this installation method. Here’s the steps :

    # svn co https://svn.ntop.org/svn/ntop/trunk/ntopng/
    # ./autogen.sh
    # ./configure
    # make
    # make install

*Since ntopng is a web-based application, your system must have a working web-server installed*

### Create configuration files for ntopng ###

If everything is installed, then it’s time for us to running it. By default, redis and ntopng will installed in /usr/local/ folder if we don’t change the installation folder explicitly in ./configure step. Next we need to create configuration files for ntopng. In this article we use vi as text editor. You can use your favorite text editor to create ntopng configuration files.

    # cd /usr/local/etc
    # mkdir ntopng
    # cd ntopng
    # vi ntopng.start

    Put these lines :
    --local-network “10.0.2.0/24”
    --interface 1

    # vi ntopng.pid

    Put this line :
    -G=/var/run/ntopng.pid

Save those files and we can continue to the next step

### Run ntopng ###

We assume that you have installed web server correctly, then the next step is to run redis server.

    # /usr/local/bin/redis-server

![Starting Redis Server](http://blog.linoxide.com/wp-content/uploads/2013/11/redis-server-start.png)

Then **run** ntopng

    # /usr/local/bin/ntopng

![Starting Ntopng](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng-start.png)

### Testing ntopng ###

Now you can test your ntopng application by typing [http://yourserver.name:3000][4] . You will see ntopng login page. For the first time, you can use user ‘**admin**’ and password ‘**admin**’.

![Ntop Login page](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_login.png)

The dashboard is quite simple. After you logged in, you will see an information about Top Flow Talkers.

![Ntopng Flow Talker](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_talkers.png)

If you click **Flows menu** on the right top, ntopng will show you more detail about Active Flows.

![Ntopng Flows](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_flows.png)

On **Hosts menu**, you can see all hosts which are connected to the flows

![Ntopng Hosts List](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_hoslist.png)

If you click **Hosts > Interactions**, ntop will show you a nice graphic about interaction which happen between them.

![Ntopng Hosts Interaction](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_hosts_interaction.png)

**Dashboard menu** consist of :

#### Top Hosts (Send+Receive) ####

![Ntopng Hosts](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_hosts.png)

#### Top Application Protocol ####

![Ntopng Apps](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_apps.png)

**Interfaces menu** will bring you more menus inside. Packets menu shows you size distribution of packets.

![Ntopng packets](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_packets.png)

**Protocols menus** will give you information about how many protocols that have been used and its percentage.

![Ntopng protocol](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_protocol.png)

![Ntopng protocols - detail](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_protocol_detail.png)

You can also see the activity by using **Historical Activity menu**

![Ntopng Historical Activity](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_historical.png)

![Ntopng Historical Activity detail](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_historical_detail.png)

Last but not least, you can also manage the user who can access ntopng via **Settings menu** on the top right area (the one that have a gear icon). Then click **Manage Users**.

![Ntopng Users](http://blog.linoxide.com/wp-content/uploads/2013/11/ntopng_users.png)

Ntopng provide you with a wide range of timeframe, from every 5 minutes until 1 year. You just need to click the timeframe you want to show. The graphic itself is clickable. You can click it to zoom it.

Of course, ntopng is more than just pictures above. You can also integrates it with GeoLocation and GeoMap services. From ntopng website it self, there are a paid modul such as nprobe to enrich the information provided by ntopng. For more detail usage of ntopng, please visit [ntopng website][5].

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/ntopng-network-monitoring-tool/

作者：[Pungki Arianto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/pungki/
[1]:http://en.wikipedia.org/wiki/Ntop
[2]:http://www.ntop.org/products/ntop/
[3]:http://www.nmon.net/packages/
[4]:http://yourserver.name:3000/
[5]:http://www.ntop.org/
