How To Scan And Check A WordPress Website Security Using WPScan, Nmap, And Nikto
================================================================================
### Introduction ###

Millions of websites are powered by WordPress software and there’s a reason for that. WordPress is the most developer-friendly content management system out there, so you can essentially do anything you want with it. Unfortunately, every day some scary report about a major site being hacked or a sensitive database being compromised hits the web … and freaks everyone out.

If you haven’t installed WordPress yet, check the following article.
On Debian based systems:

- [How to install WordPress On Ubuntu][1]

On RPM based systems:

- [How to install wordpress On CentOS][2]

Following on from my previous article [How To Secure WordPress Website][3]  show you **checklist** allows you to secure your WordPress site with as little effort as possible.

In this article, will describe to you  through the installation of **wpscan** and serve as a guide on how to use wpscan to locate any known vulnerable plugins and themes that may make your site vulnerable to attack. Also, how to install and use **nmap** the free Security Scanner For Network Exploration & Hacking . And at the end we will show you the steps to use **nikto**.

### WPScan to Test for Vulnerable Plugins and Themes in WordPress ###

**WPScan** is a black box WordPress Security Scanner written in Ruby which attempts to find known security weaknesses within WordPress installations. Its intended use it to be for security professionals or WordPress administrators to asses the security posture of their WordPress installations. The code base is Open Source and licensed under the GPLv3.

### Download and Install WPScan ###

Before we get started with the installation, it is important to note that wpscan will not work on Windows systems, so you will need access to a Linux or OSX installation to proceed. If you only have access to a Windows system you can download Virtualbox and install any Linux distro you like as a Virtual Machine.

WPScan is hosted on Github, so if it is not already installed we will need to install the git packages before we can continue.

    sudo apt-get install git

Once git is installed, we need to install the dependencies for wpscan.

    sudo apt-get install libcurl4-gnutls-dev libopenssl-ruby libxml2 libxml2-dev libxslt1-dev ruby-dev ruby1.9.3

Now we need to clone the wpscan package from github.

    git clone https://github.com/wpscanteam/wpscan.git

Now we can move to the newly created wpscan directory and install the necessary ruby gems through bundler.

    cd wpscan
    sudo gem install bundler && bundle install --without test development

Now that we have wpscan installed, we will walk through using the tool to search for potentially vulnerable files on our WordPress installation. Some of the most important aspects of wpscan are its ability to enumerate not only plugins and themes, but users and timthumb installations as well. WPScan can also perform bruteforce attacks against WordPress– but that is outside of the scope of this article.

#### Update wpscan ####

    ruby wpscan.rb --update

#### Enumerate Plugins ####

To enumerate plugins, all we need to do is launch wpscan with the `--enumerate p` arguments like so.

    ruby wpscan.rb --url http(s)://www.yoursiteurl.com --enumerate p

or to only display vulnerable plugins:

    ruby wpscan.rb --url http(s)://www.yoursiteurl.com --enumerate vp

Some example output is posted below:

    | Name: akismet
    | Location: http://********.com/wp-content/plugins/akismet/
    
    | Name: audio-player
    | Location: http://********.com/wp-content/plugins/audio-player/
    |
    | * Title: Audio Player - player.swf playerID Parameter XSS
    | * Reference: http://seclists.org/bugtraq/2013/Feb/35
    | * Reference: http://secunia.com/advisories/52083
    | * Reference: http://osvdb.org/89963
    | * Fixed in: 2.0.4.6
    
    | Name: bbpress - v2.3.2
    | Location: http://********.com/wp-content/plugins/bbpress/
    | Readme: http://********.com/wp-content/plugins/bbpress/readme.txt
    |
    | * Title: BBPress - Multiple Script Malformed Input Path Disclosure
    | * Reference: http://xforce.iss.net/xforce/xfdb/78244
    | * Reference: http://packetstormsecurity.com/files/116123/
    | * Reference: http://osvdb.org/86399
    | * Reference: http://www.exploit-db.com/exploits/22396/
    |
    | * Title: BBPress - forum.php page Parameter SQL Injection
    | * Reference: http://xforce.iss.net/xforce/xfdb/78244
    | * Reference: http://packetstormsecurity.com/files/116123/
    | * Reference: http://osvdb.org/86400
    | * Reference: http://www.exploit-db.com/exploits/22396/
    
    | Name: contact
    | Location: http://********.com/wp-content/plugins/contact/

#### Enumerate Themes ####

Enumeration of themes works the same as enumeration of plugins, just with the `--enumerate t` argument.

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate t

Or to only display vulnerable themes:

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate vt

Sample output:

    | Name: path
    | Location: http://********.com/wp-content/themes/path/
    | Style URL: http://********.com/wp-content/themes/path/style.css
    | Description: 
    
    | Name: pub
    | Location: http://********.com/wp-content/themes/pub/
    | Style URL: http://********.com/wp-content/themes/pub/style.css
    | Description: 
    
    | Name: rockstar
    | Location: http://********.com/wp-content/themes/rockstar/
    | Style URL: http://********.com/wp-content/themes/rockstar/style.css
    | Description: 
    |
    | * Title: WooThemes WooFramework Remote Unauthenticated Shortcode Execution
    | * Reference: https://gist.github.com/2523147
    
    | Name: twentyten
    | Location: http://********.com/wp-content/themes/twentyten/
    | Style URL: http://********.com/wp-content/themes/twentyten/style.css
    | Description: 

#### Enumerate Users ####

WPScan can also be used to enumerate users with valid logins to the WordPress installation. This is usually performed by attackers in order to get a list of users in preparation for a bruteforce attack.

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate u

#### Enumerate Timthumb Files ####

The last function of wpscan we’ll discuss in this article is the ability to enumerate timthumb installations. In recent years, timthumb has become a very common target of attackers due to the numerous vulnerabilities found and posted to online forums, message lists, and advisory boards. Using wpscan to find vulnerable timthumb files is done with the following command.

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate tt

### Nmap to Scan for Open Ports on your VPS ###

**Nmap**  is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks, although it works fine against single hosts. Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics

### Download and install nmap on Debian and Ubuntu ###

To install nmap for Debian and Ubuntu Linux based server systems type the following apt-get command:

    sudo apt-get install nmap

**Sample outputs:**

    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following NEW packages will be installed:
      nmap
    0 upgraded, 1 newly installed, 0 to remove and 2 not upgraded.
    Need to get 1,643 kB of archives.
    After this operation, 6,913 kB of additional disk space will be used.
    Get:1 http://mirrors.service.networklayer.com/ubuntu/ precise/main nmap amd64 5.21-1.1ubuntu1 [1,643 kB]
    Fetched 1,643 kB in 0s (16.4 MB/s)
    Selecting previously unselected package nmap.
    (Reading database ... 56834 files and directories currently installed.)
    Unpacking nmap (from .../nmap_5.21-1.1ubuntu1_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up nmap (5.21-1.1ubuntu1) ...

#### Examples ####

To find the nmap version, enter:

    nmap -V

OR

    nmap --version

**Sample outputs:**

    Nmap version 5.21 ( http://nmap.org )

### Dowonlad and  install nmap on Centos ###

To install nmap on RHEL based Linux distributions, type the following yum command:

    yum install nmap

**Sample outputs:**

    Loaded plugins: protectbase, rhnplugin, security
    0 packages excluded due to repository protections
    Setting up Install Process
    Resolving Dependencies
    --> Running transaction check
    ---> Package nmap.x86_64 2:5.51-2.el6 will be installed
    --> Finished Dependency Resolution
     
    Dependencies Resolved
     
    ================================================================================
     Package    Arch         Version               Repository                  Size
    ================================================================================
    Installing:
     nmap       x86_64       2:5.51-2.el6          rhel-x86_64-server-6       2.8 M
     
    Transaction Summary
    ================================================================================
    Install       1 Package(s)
     
    Total download size: 2.8 M
    Installed size: 0
    Is this ok [y/N]: y
    Downloading Packages:
    nmap-5.51-2.el6.x86_64.rpm                               | 2.8 MB     00:00
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : 2:nmap-5.51-2.el6.x86_64                                     1/1
      Verifying  : 2:nmap-5.51-2.el6.x86_64                                     1/1
     
    Installed:
      nmap.x86_64 2:5.51-2.el6
     
    Complete!

#### Examples ####

To find the nmap version, enter:

    nmap --version

**Sample outputs:**

    Nmap version 5.51 ( http://nmap.org )

#### Scan Ports with Nmap ####

You can got a lot of information about your server or host using nmap and it let you to think like someone has malicious intent.

For this reason, only test it on servers that you own or in situations where you’ve notified the owners.

The nmap creators actually provide a test server located at:

    scanme.nmap.org

Some commands may take a long while to complete:

To scan an IP address or a host name (FQDN), run:

    nmap 192.168.1.1

Sample outputs:

![Fig.01: nmap in action](http://s0.cyberciti.org/uploads/faq/2012/11/redhat-nmap-command-output.png)

Scan for the host operating system:

    sudo nmap -O 192.168.1.1

pecify a range with “-” or “/24″ to scan a number of hosts at once:

    sudo nmap -PN xxx.xxx.xxx.xxx-yyy

Scan a network range for available services:

    sudo nmap -sP network_address_range

Scan without preforming a reverse DNS lookup on the IP address specified. This should speed up your results in most cases:

    sudo nmap -n remote_host

Scan a specific port instead of all common ports:

    sudo nmap -p port_number remote_host

Scan a network and find out which servers and devices are up and running

This is known as host discovery or ping scan:

    nmap -sP 192.168.1.0/24

Sample outputs:

    Host 192.168.1.1 is up (0.00035s latency).
    MAC Address: BC:AE:C5:C3:16:93 (Unknown)
    Host 192.168.1.2 is up (0.0038s latency).
    MAC Address: 74:44:01:40:57:FB (Unknown)
    Host 192.168.1.5 is up.
    Host nas03 (192.168.1.12) is up (0.0091s latency).
    MAC Address: 00:11:32:11:15:FC (Synology Incorporated)
    Nmap done: 256 IP addresses (4 hosts up) scanned in 2.80 second

Understanding port configuration and how to discover what the attack vectors are on your server is only one step to securing your information and your VPS.

### Nikto to Scan for vulnerabilities in your website ###

[Nikto][4] Web-scanner is a open source web-server scanner which can be used to scan the web-servers for malicious programs and files. Nikto can be used to scan the outdated versions of programs too. Nikto will provide us a quick and easy scan to find out the dangerous files and programs in server, At the end of scan result with a log file.

### Download and  install Nikto on Linux server ###

Perl is pre-installed in linux so all you need to do is download nikto from the [project page][5], unpack it into a directory and start your testing.

    wget https://cirt.net/nikto/nikto-2.1.4.tar.gz

You can unpack it with an archive manager tool or use tar and gzip together with this command.

    tar zxvf nikto-2.1.4.tar.gz
    cd nikto-2.1.4
    perl nikto.pl

This should be your results from a working installation:

     - ***** SSL support not available (see docs for SSL install) *****
    - Nikto v2.1.4
    ---------------------------------------------------------------------------
    + ERROR: No host specified
    
           -config+            Use this config file
           -Cgidirs+           scan these CGI dirs: 'none', 'all', or values like "/cgi/ /cgi-a/"
           -dbcheck            check database and other key files for syntax errors
           -Display+           Turn on/off display outputs
           -evasion+           ids evasion technique
           -Format+            save file (-o) format
           -host+              target host
           -Help               Extended help information
           -id+                Host authentication to use, format is id:pass or id:pass:realm
           -list-plugins       List all available plugins
           -mutate+            Guess additional file names
           -mutate-options+    Provide extra information for mutations
           -output+            Write output to this file
           -nocache            Disables the URI cache
           -nossl              Disables using SSL
           -no404              Disables 404 checks
           -port+              Port to use (default 80)
           -Plugins+           List of plugins to run (default: ALL)
           -root+              Prepend root value to all requests, format is /directory
           -ssl                Force ssl mode on port
           -Single             Single request mode
           -timeout+           Timeout (default 2 seconds)
           -Tuning+            Scan tuning
           -update             Update databases and plugins from CIRT.net
           -vhost+             Virtual host (for Host header)
           -Version            Print plugin and database versions
               + requires a value
    
        Note: This is the short help output. Use -H for full help.

The error is merely telling us we did not fill in the necessary parameters for a test to run. The SSL support can be enabled by installing the necessary perl ssl module (sudo apt-get install libnet-ssleay-perl).

#### Update the nikto Database ####

Before performing any scan we need to update the nikto database packages using.

    /usr/local/bin/nikto.pl -update

To list the available Plugins for nikto we can use the below command.

    nikto.pl -list-plugins // To list the installed plugins //

#### Scan for vulnerabilities ####

For a simple test for  we will use test a single url.

    perl nikto.pl -h http://www.host-name.com

**Sample outputs:**

This will produce fairly verbose output that may be somewhat confusing at first. Take the time to read through the output to understand what each advisory means. Many of the alerts in Nikto will refer to OSVDB numbers. These are Open Source Vulnerability Database ([http://osvdb.org/][6]) designations. You can search on OSVDB for further information about any vulnerabilities identified.

    $ nikto -h http://www.host-name.com
    - Nikto v2.1.4
    ---------------------------------------------------------------------------
    + Target IP:         1.2.3.4
    + Target Hostname:    host-name.com
    + Target Port:        80
    + Start Time:         2012-08-11 14:27:31
    ---------------------------------------------------------------------------
    + Server: Apache/2.2.22 (FreeBSD) mod_ssl/2.2.22 OpenSSL/1.0.1c DAV/2
    + robots.txt contains 4 entries which should be manually viewed.
    + mod_ssl/2.2.22 appears to be outdated (current is at least 2.8.31) (may depend on server version)
    + ETag header found on server, inode: 5918348, size: 121, mtime: 0x48fc943691040
    + mod_ssl/2.2.22 OpenSSL/1.0.1c DAV/2 - mod_ssl 2.8.7 and lower are vulnerable to a remote buffer overflow which may allow a remote shell (difficult to exploit). CVE-2002-0082, OSVDB-756.
    + Allowed HTTP Methods: GET, HEAD, POST, OPTIONS, TRACE 
    + OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST
    + /lists/admin/: PHPList pre 2.6.4 contains a number of vulnerabilities including remote administrative access, harvesting user info and more. Default login to admin interface is admin/phplist
    + OSVDB-2322: /gallery/search.php?searchstring=<script>alert(document.cookie)</script>: Gallery 1.3.4 and below is vulnerable to Cross Site Scripting (XSS). Upgrade to the latest version. http://www.securityfocus.com/bid/8288.
    + OSVDB-7022: /calendar.php?year=<script>alert(document.cookie);</script>&month=03&day=05: DCP-Portal v5.3.1 is vulnerable to  Cross Site Scripting (XSS). http://www.cert.org/advisories/CA-2000-02.html.
    + OSVDB-3233: /phpinfo.php: Contains PHP configuration information
    + OSVDB-3092: /system/: This might be interesting...
    + OSVDB-3092: /template/: This may be interesting as the directory may hold sensitive files or reveal system information.
    + OSVDB-3092: /updates/: This might be interesting...
    + OSVDB-3092: /README: README file found.
    + 6448 items checked: 1 error(s) and 14 item(s) reported on remote host
    + End Time:           2012-08-11 15:52:57 (5126 seconds)
    ---------------------------------------------------------------------------
    + 1 host(s) tested
    $

**Nikto** is an extremely lightweight, and versatile tool. Because of the fact that Nikto is written in Perl it can be run on almost any host operating system.

Hope this will will bring you a good idea to scan vulnerbalites for your wordpress website. Following on from my previous article [How To Secure WordPress Website][7]  show you **checklist** allows you to secure your WordPress site with as little effort as possible.

If you have any feedback or comments, feel free to post them in the comment section below.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/scan-check-wordpress-website-security-using-wpscan-nmap-nikto/

作者：[anismaj][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/anis/
[1]:http://www.unixmen.com/install-wordpress-ubuntu-14-10/
[2]:http://www.unixmen.com/install-configure-wordpress-4-0-benny-centos-7/
[3]:http://www.unixmen.com/secure-wordpress-website/
[4]:http://www.unixmen.com/install-nikto-web-scanner-check-vulnerabilities
[5]:https://cirt.net/nikto/
[6]:http://osvdb.org/
[7]:http://www.unixmen.com/secure-wordpress-website/