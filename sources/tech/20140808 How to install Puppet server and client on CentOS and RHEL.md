[sailing]
How to install Puppet server and client on CentOS and RHEL
================================================================================
As a system administrator acquires more and more systems to manage, automation of mundane tasks gets quite important. Many administrators adopted the way of writing custom scripts, that are simulating complex orchestration software. Unfortunately, scripts get obsolete, people who developed them leave, and without an enormous level of maintenance, after some time these scripts will end up unusable. It is certainly more desirable to share a system that everyone can use, and invest in tools that can be used regardless of one's employer. For that we have several systems available, and in this howto you will learn how to use one of them - Puppet.

### What is Puppet? ###

Puppet is an automation software for IT system administrators and consultants. It allows you to automate repetitive tasks such as the installation of applications and services, patch management, and deployments. Configuration for all resources are stored in so called "manifests", that can be applied to multiple machines or just a single server. If you would like to know more information, The Puppet Labs site has a more complete description of [what Puppet is and how it works][1].

### What are we going to achieve in this tutorial? ###

We will install and configure a Puppet server, and set up some basic configuration for our client servers. You will discover how to write and manage Puppet manifests and how to push it into your servers.

### Prerequisites ###

Since Puppet is not in basic CentOS or RHEL distribution repositories, we have to add a custom repository provided by Puppet Labs. On all servers in which you want to use Puppet, install the repository by executing following command (RPM file name can change with new release):

**On CentOS/RHEL 6.5:**

     # rpm -ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs-release-6-10.noarch.rpm 

**On CentOS/RHEL 7:**

     # rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-10.noarch.rpm 

### Server Installation ###

Install the package "puppet-server" on the server you want to use as a master.

    # yum install puppet-server

When the installation is done, set the Puppet server to automatically start on boot and turn it on.

    # chkconfig puppetmaster on
    # service puppetmaster start

Now when we have the server working, we need to make sure that it is reachable from our network.

On CentOS/RHEL 6, where iptables is used as firewall, add following line into section ":OUTPUT ACCEPT" of /etc/sysconfig/iptables.

> -A INPUT -m state --state NEW -m tcp -p tcp --dport 8140 -j ACCEPT

To apply this change, it's necessary to restart iptables.

    # service iptables restart

On CentOS/RHEL 7, where firewalld is used, the same thing can be achieved by:

    # firewall-cmd --permanent --zone=public --add-port=8140/tcp
    # firewall-cmd --reload 

### Client Installation ###

Install the Puppet client package on your client nodes by executing the following:

    # yum install puppet

When the installation finishes, make sure that Puppet will start after boot.

    # chkconfig puppet on

Your Puppet client nodes have to know where the Puppet master server is located. The best practice for this is to use a DNS server, where you can configure the Puppet domain name. If you don't have a DNS server running, you can use the /etc/hosts file, by simply adding the following line:

> 1.2.3.4 server.your.domain

> 2.3.4.5 client-node.your.domain

1.2.3.4 corresponds to the IP address of your Puppet master server, "server.your.domain" is the domain name of your master server (the default is usually the server's hostname), "client-node.your.domain" is your client node. This hosts file should be configured accordingly on all involved servers (both Puppet master and clients).

When you are done with these settings, we need to show the Puppet client what is its master. By default Puppet looks for a server called "puppet", but this setting is usually inappropriate for your network configuration, therefore we will exchange it for the proper FQDN of the Puppet master server. Open the file /etc/sysconfig/puppet and change the "PUPPET_SERVER" value to your Puppet master server domain name specified in /etc/hosts:

> PUPPET_SERVER=server.your.domain

The master server name also has to be defined in the section "[agent]" of /etc/puppet/puppet.conf:

> server=server.your.domain

Now you can start your Puppet client:

    # service puppet start

We need to force our client to check in with the Puppet master by using:

    # puppet agent --test 

You should see something like the following output. Don't panic, this is desired as the server is still not verified on the Puppet master server.

> Exiting; no certificate found and waitforcert is disabled

Go back to your puppet master server and check certificate verification requests:

    # puppet cert list 

You should see a list of all the servers that requested a certificate signing from your puppet master. Find the hostname of your client server and sign it using the following command (client-node is the domain name of your client node):

     # puppet cert sign client-node 

At this point you have a working Puppet client and server. Congratulations! However, right now there is nothing for the Puppet master to instruct the client to do. So, let's create some basic manifest and set our client node to install basic utilities.

Connect back to your Puppet server and make sure the directory /etc/puppet/manifests exists.

     # mkdir -p /etc/puppet/manifests 

Now create the manifest file /etc/puppet/manifests/site.pp with the following content

    node 'client-node' {
            include custom_utils
    }
     
    class custom_utils {
            package { ["nmap","telnet","vim-enhanced","traceroute"]:
                    ensure => latest,
                    allow_virtual => false,
            }
    }

and restart the puppetmaster service.

     # service puppetmaster restart 

The default refresh interval of the client configuration is 30 minutes, if you want to force the application of your changes manually, execute the following command on your client node:

    # puppet agent -t 

If you would like to change the default client refresh interval, add:

> runinterval = <yourtime>

to the "[agent]" section of /etc/puppet/puppet.conf on your client node. This setting can be a time interval in seconds (30 or 30s), minutes (30m), hours (6h), days (2d), or years (5y). Note that a runinterval of 0 means "run continuously" rather than "never run".

### Tips & Tricks ###

#### 1. Debugging ####

It can happen from time to time that you will submit a wrong configuration and you have to debug where the Puppet failed. For that you will always start with either checking logs in /var/log/puppet/ or running the agent manually to see the output:

    # puppet agent -t

By default "-t" activates verbose mode, so it allows you to see the output of Puppet. This command also has several parameters that might help you identify your problem a bit more. The first useful option is:

    # puppet agent -t --debug

Debug shows you basically all steps that Puppet goes through during its runtime. It can be really useful during debug of really complicated rules. Another parameter you might find really useful is:

    # puppet agent -t --noop 

This option sets puppet in so called dry-run mode, where no changes are performed. Puppet only writes what it would do on the screen but nothing is written on the disk.

#### 2. Modules ####

After some time you find yourself in the situation where you will want to have more complicated manifests. But before you will sit down and start to program them, you should invest some time and browse [https://forge.puppetlabs.com][2]. Forge is a repository of the Puppet community modules and it's very likely that you find the solution for your problem already made there. If not, feel free to write your own and submit it, so other people can benefit from the Puppet modularity.

Now, let's assume that you have already found a module that would fix your problem. How to install it into the system? It is actually quite easy, because Puppet already contains an interface to download modules directly. Simply type the following command:

     # puppet module install <module_name> --version 0.0.0 

<module_name> is the name of your chosen module, the version is optional (if not specified then the latest release is taken). If you don't remember the name of the module you want to install, you can try to find it by using module search:

    # puppet module search <search_string> 

As a result you will get a list of all modules that contain your search string.

    # puppet module search apache

----------

    Notice: Searching https://forgeapi.puppetlabs.com ...
    NAME                               DESCRIPTION                                                                                         AUTHOR          KEYWORDS                                        
    example42-apache                   Puppet module for apache                                                                            @example42      example42, apache                               
    puppetlabs-apache                  Puppet module for Apache                                                                            @puppetlabs     apache web httpd centos rhel ssl wsgi proxy     
    theforeman-apache                  Apache HTTP server configuration                                                                    @theforeman     foreman apache httpd DEPRECATED               

And if you would like to see what modules you already installed, type:

    # puppet module list 

### Summary ###

By now, you should have a fully functional Puppet master that is delivering basic configuration to one or more client servers. At this point feel free to add more settings into your configuration to adapt it to your infrastructure. Don't worry about experimenting with Puppet and you will see that it can be a genuine lifesaver.

Puppet labs is trying to maintain a top quality documentation for their projects, so if you would like to learn more about Puppet and its configuration, I strongly recommend visiting the Puppet project page at [http://docs.puppetlabs.com][3].

If you have any questions feel free to post them in the comments and I will do my best to answer and advise. 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/install-puppet-server-client-centos-rhel.html

作者：[Jaroslav Štěpánek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/jaroslav
[1]:https://puppetlabs.com/puppet/what-is-puppet/
[2]:https://forge.puppetlabs.com/
[3]:http://docs.puppetlabs.com/
