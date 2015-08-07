Installation Guide for Puppet on Ubuntu 15.04
================================================================================
Hi everyone, today in this article we'll learn how to install puppet to manage your server infrastructure running ubuntu 15.04. Puppet is an open source software configuration management tool which is developed and maintained by Puppet Labs that allows us to automate the provisioning, configuration and management of a server infrastructure. Whether we're managing just a few servers or thousands of physical and virtual machines to orchestration and reporting, puppet automates tasks that system administrators often do manually which frees up time and mental space so sysadmins can work on improving other aspects of your overall setup. It ensures consistency, reliability and stability of the automated jobs processed. It facilitates closer collaboration between sysadmins and developers, enabling more efficient delivery of cleaner, better-designed code. Puppet is available in two solutions configuration management and data center automation. They are **puppet open source and puppet enterprise**. Puppet open source is a flexible, customizable solution available under the Apache 2.0 license, designed to help system administrators automate the many repetitive tasks they regularly perform. Whereas puppet enterprise edition is a proven commercial solution for diverse enterprise IT environments which lets us get all the benefits of open source puppet, plus puppet apps, commercial-only enhancements, supported modules and integrations, and the assurance of a fully supported platform. Puppet uses SSL certificates to authenticate communication between master and agent nodes.

In this tutorial, we will cover how to install open source puppet in an agent and master setup running ubuntu 15.04 linux distribution. Here, Puppet master is a server from where all the configurations will be controlled and managed and all our remaining servers will be puppet agent nodes, which is configured according to the configuration of puppet master server. Here are some easy steps to install and configure puppet to manage our server infrastructure running Ubuntu 15.04.

### 1. Setting up Hosts ###

In this tutorial, we'll use two machines, one as puppet master server and another as puppet node agent both running ubuntu 15.04 "Vivid Vervet" in both the machines. Here is the infrastructure of the server that we're gonna use for this tutorial.

puppet master server with IP 44.55.88.6 and hostname : puppetmaster
puppet node agent with IP 45.55.86.39 and hostname : puppetnode

Now we'll add the entry of the machines to /etc/hosts on both machines node agent and master server.

    # nano /etc/hosts

    45.55.88.6 puppetmaster.example.com puppetmaster
    45.55.86.39 puppetnode.example.com puppetnode

Please note that the Puppet Master server must be reachable on port 8140. So, we'll need to open port 8140 in it.

### 2. Updating Time with NTP ###

As puppet nodes needs to maintain accurate system time to avoid problems when it issues agent certificates. Certificates can appear to be expired if there is time difference, the time of the both the master and the node agent must be synced with each other. To sync the time, we'll update the time with NTP. To do so, here's the command below that we need to run on both master and node agent.

    # ntpdate pool.ntp.org

    17 Jun 00:17:08 ntpdate[882]: adjust time server 66.175.209.17 offset -0.001938 sec

Now, we'll update our local repository index and install ntp as follows.

    # apt-get update && sudo apt-get -y install ntp ; service ntp restart

### 3. Puppet Master Package Installation ###

There are many ways to install open source puppet. In this tutorial, we'll download and install a debian binary package named as **puppetlabs-release** packaged by the Puppet Labs which will add the source of the **puppetmaster-passenger** package. The puppetmaster-passenger includes the puppet master with apache web server. So, we'll now download the Puppet Labs package.

    # cd /tmp/
    # wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb

    --2015-06-17 00:19:26-- https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    Resolving apt.puppetlabs.com (apt.puppetlabs.com)... 192.155.89.90, 2600:3c03::f03c:91ff:fedb:6b1d
    Connecting to apt.puppetlabs.com (apt.puppetlabs.com)|192.155.89.90|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7384 (7.2K) [application/x-debian-package]
    Saving to: ‘puppetlabs-release-trusty.deb’

    puppetlabs-release-tr 100%[===========================>] 7.21K --.-KB/s in 0.06s

    2015-06-17 00:19:26 (130 KB/s) - ‘puppetlabs-release-trusty.deb’ saved [7384/7384]

After the download has been completed, we'll wanna install the package.

    # dpkg -i puppetlabs-release-trusty.deb

    Selecting previously unselected package puppetlabs-release.
    (Reading database ... 85899 files and directories currently installed.)
    Preparing to unpack puppetlabs-release-trusty.deb ...
    Unpacking puppetlabs-release (1.0-11) ...
    Setting up puppetlabs-release (1.0-11) ...

Then, we'll update the local respository index with the server using apt package manager.

    # apt-get update

Then, we'll install the puppetmaster-passenger package by running the below command.

    # apt-get install puppetmaster-passenger

**Note**: While installing we may get an error **Warning: Setting templatedir is deprecated. See http://links.puppetlabs.com/env-settings-deprecations (at /usr/lib/ruby/vendor_ruby/puppet/settings.rb:1139:in `issue_deprecation_warning')** but we no need to worry, we'll just simply ignore this as it says that the templatedir is deprecated so, we'll simply disbale that setting in the configuration. :)

To check whether puppetmaster has been installed successfully in our Master server not not, we'll gonna try to check its version.

    # puppet --version

    3.8.1

We have successfully installed puppet master package in our puppet master box. As we are using passenger with apache, the puppet master process is controlled by apache server, that means it runs when apache is running.

Before continuing, we'll need to stop the Puppet master by stopping the apache2 service.

    # systemctl stop apache2

### 4. Master version lock with Apt ###

As We have puppet version as 3.8.1, we need to lock the puppet version update as this will mess up the configurations while updating the puppet. So, we'll use apt's locking feature for that. To do so, we'll need to create a new file **/etc/apt/preferences.d/00-puppet.pref** using our favorite text editor.

    # nano /etc/apt/preferences.d/00-puppet.pref

Then, we'll gonna add the entries in the newly created file as:

    # /etc/apt/preferences.d/00-puppet.pref
    Package: puppet puppet-common puppetmaster-passenger
    Pin: version 3.8*
    Pin-Priority: 501

Now, it will not update the puppet while running updates in the system.

### 5. Configuring Puppet Config ###

Puppet master acts as a certificate authority and must generate its own certificates which is used to sign agent certificate requests. First of all, we'll need to remove any existing SSL certificates that were created during the installation of package. The default location of puppet's SSL certificates is /var/lib/puppet/ssl. So, we'll remove the entire ssl directory using rm command.

    # rm -rf /var/lib/puppet/ssl

Then, we'll configure the certificate. While creating the puppet master's certificate, we need to include every DNS name at which agent nodes can contact the master at. So, we'll edit the master's puppet.conf using our favorite text editor.

    # nano /etc/puppet/puppet.conf

The output seems as shown below.

    [main]
    logdir=/var/log/puppet
    vardir=/var/lib/puppet
    ssldir=/var/lib/puppet/ssl
    rundir=/var/run/puppet
    factpath=$vardir/lib/facter
    templatedir=$confdir/templates

    [master]
    # These are needed when the puppetmaster is run by passenger
    # and can safely be removed if webrick is used.
    ssl_client_header = SSL_CLIENT_S_DN
    ssl_client_verify_header = SSL_CLIENT_VERIFY

Here, we'll need to comment the templatedir line to disable the setting as it has been already depreciated. After that, we'll add the following line at the end of the file under [main].

    server = puppetmaster
    environment = production
    runinterval = 1h
    strict_variables = true
    certname = puppetmaster
    dns_alt_names = puppetmaster, puppetmaster.example.com

This configuration file has many options which might be useful in order to setup own configuration. A full description of the file is available at Puppet Labs [Main Config File (puppet.conf)][1].

After editing the file, we'll wanna save that and exit.

Now, we'll gonna generate a new CA certificates by running the following command.

    # puppet master --verbose --no-daemonize

    Info: Creating a new SSL key for ca
    Info: Creating a new SSL certificate request for ca
    Info: Certificate Request fingerprint (SHA256): F6:2F:69:89:BA:A5:5E:FF:7F:94:15:6B:A7:C4:20:CE:23:C7:E3:C9:63:53:E0:F2:76:D7:2E:E0:BF:BD:A6:78
    ...
    Notice: puppetmaster has a waiting certificate request
    Notice: Signed certificate request for puppetmaster
    Notice: Removing file Puppet::SSL::CertificateRequest puppetmaster at '/var/lib/puppet/ssl/ca/requests/puppetmaster.pem'
    Notice: Removing file Puppet::SSL::CertificateRequest puppetmaster at '/var/lib/puppet/ssl/certificate_requests/puppetmaster.pem'
    Notice: Starting Puppet master version 3.8.1
    ^CNotice: Caught INT; storing stop
    Notice: Processing stop

Now, the certificate is being generated. Once we see **Notice: Starting Puppet master version 3.8.1**, the certificate setup is complete. Then we'll press CTRL-C to return to the shell.

If we wanna look at the cert information of the certificate that was just created, we can get the list by running in the following command.

    # puppet cert list -all

    + "puppetmaster" (SHA256) 33:28:97:86:A1:C3:2F:73:10:D1:FB:42:DA:D5:42:69:71:84:F0:E2:8A:01:B9:58:38:90:E4:7D:B7:25:23:EC (alt names: "DNS:puppetmaster", "DNS:puppetmaster.example.com")

### 6. Creating a Puppet Manifest ###

The default location of the main manifest is /etc/puppet/manifests/site.pp. The main manifest file contains the definition of configuration that is used to execute in the puppet node agent. Now, we'll create the manifest file by running the following command.

    # nano /etc/puppet/manifests/site.pp

Then, we'll add the following lines of configuration in the file that we just opened.

    # execute 'apt-get update'
    exec { 'apt-update': # exec resource named 'apt-update'
    command => '/usr/bin/apt-get update' # command this resource will run
    }

    # install apache2 package
    package { 'apache2':
    require => Exec['apt-update'], # require 'apt-update' before installing
    ensure => installed,
    }

    # ensure apache2 service is running
    service { 'apache2':
    ensure => running,
    }

The above lines of configuration are responsible for the deployment of the installation of apache web server across the node agent.

### 7. Starting Master Service ###

We are now ready to start the puppet master. We can start it by running the apache2 service.

    # systemctl start apache2

Here, our puppet master is running, but it isn't managing any agent nodes yet. Now, we'll gonna add the puppet node agents to the master.

**Note**: If you get an error **Job for apache2.service failed. See "systemctl status apache2.service" and "journalctl -xe" for details.** then it must be that there is some problem with the apache server. So, we can see the log what exactly has happened by running  **apachectl start** under root or sudo mode. Here, while performing this tutorial, we got a misconfiguration of the certificates under **/etc/apache2/sites-enabled/puppetmaster.conf** file. We replaced  **SSLCertificateFile /var/lib/puppet/ssl/certs/server.pem with  SSLCertificateFile /var/lib/puppet/ssl/certs/puppetmaster.pem** and commented **SSLCertificateKeyFile** line. Then we'll need to rerun the above command to run apache server.

### 8. Puppet Agent Package Installation ###

Now, as we have our puppet master ready and it needs an agent to manage, we'll need to install puppet agent into the nodes. We'll need to install puppet agent in every nodes in our infrastructure we want puppet master to manage. We'll need to make sure that we have added our node agents in the DNS. Now, we'll gonna install the latest puppet agent in our agent node ie.  puppetnode.example.com .

We'll run the following command to download the Puppet Labs package in our puppet agent nodes.

    # cd /tmp/
    # wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb\

    --2015-06-17 00:54:42-- https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    Resolving apt.puppetlabs.com (apt.puppetlabs.com)... 192.155.89.90, 2600:3c03::f03c:91ff:fedb:6b1d
    Connecting to apt.puppetlabs.com (apt.puppetlabs.com)|192.155.89.90|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 7384 (7.2K) [application/x-debian-package]
    Saving to: ‘puppetlabs-release-trusty.deb’

    puppetlabs-release-tr 100%[===========================>] 7.21K --.-KB/s in 0.04s

    2015-06-17 00:54:42 (162 KB/s) - ‘puppetlabs-release-trusty.deb’ saved [7384/7384]

Then, as we're running ubuntu 15.04, we'll use debian package manager to install it.

    # dpkg -i puppetlabs-release-trusty.deb

Now, we'll gonna update the repository index using apt-get.

    # apt-get update

Finally, we'll gonna install the puppet agent directly from the remote repository.

    # apt-get install puppet

Puppet agent is always disabled by default, so we'll need to enable it. To do so we'll need to edit /etc/default/puppet file using a text editor.

    # nano /etc/default/puppet

Then, we'll need to change value of **START** to "yes" as shown below.

    START=yes

Then, we'll need to save and exit the file.

### 9. Agent Version Lock with Apt ###

As We have puppet version as 3.8.1, we need to lock the puppet version update as this will mess up the configurations while updating the puppet. So, we'll use apt's locking feature for that. To do so, we'll need to create a file /etc/apt/preferences.d/00-puppet.pref using our favorite text editor.

    # nano /etc/apt/preferences.d/00-puppet.pref

Then, we'll gonna add the entries in the newly created file as:

    # /etc/apt/preferences.d/00-puppet.pref
    Package: puppet puppet-common
    Pin: version 3.8*
    Pin-Priority: 501

Now, it will not update the Puppet while running updates in the system.

### 10. Configuring Puppet Node Agent ###

Next, We must make a few configuration changes before running the agent. To do so, we'll need to edit the agent's puppet.conf

    # nano /etc/puppet/puppet.conf

It will look exactly like the Puppet master's initial configuration file.

This time also we'll comment the **templatedir** line. Then we'll gonna delete the [master] section, and all of the lines below it.

Assuming that the puppet master is reachable at "puppet-master", the agent should be able to connect to the master. If not we'll need to use its fully qualified domain name ie. puppetmaster.example.com .

    [agent]
    server = puppetmaster.example.com
    certname = puppetnode.example.com

After adding this, it will look alike this.

    [main]
    logdir=/var/log/puppet
    vardir=/var/lib/puppet
    ssldir=/var/lib/puppet/ssl
    rundir=/var/run/puppet
    factpath=$vardir/lib/facter
    #templatedir=$confdir/templates

    [agent]
    server = puppetmaster.example.com
    certname = puppetnode.example.com

After done with that, we'll gonna save and exit it.

Next, we'll wanna start our latest puppet agent in our Ubuntu 15.04 nodes. To start our puppet agent, we'll need to run the following command.

    # systemctl start puppet

If everything went as expected and configured properly, we should not see any output displayed by running the above command. When we run an agent for the first time, it generates an SSL certificate and sends a request to the puppet master then if the master signs the agent's certificate, it will be able to communicate with the agent node.

**Note**: If you are adding your first node, it is recommended that you attempt to sign the certificate on the puppet master before adding your other agents. Once you have verified that everything works properly, then you can go back and add the remaining agent nodes further.

### 11. Signing certificate Requests on Master ###

While puppet agent runs for the first time, it generates an SSL certificate and sends a request for signing to the master server. Before the master will be able to communicate and control the agent node, it must sign that specific agent node's certificate.

To get the list of the certificate requests, we'll run the following command in the puppet master server.

    # puppet cert list

    "puppetnode.example.com" (SHA256) 31:A1:7E:23:6B:CD:7B:7D:83:98:33:8B:21:01:A6:C4:01:D5:53:3D:A0:0E:77:9A:77:AE:8F:05:4A:9A:50:B2

As we just setup our first agent node, we will see one request. It will look something like the following, with the agent node's Domain name as the hostname.

Note that there is no + in front of it which indicates that it has not been signed yet.

Now, we'll go for signing a certification request. In order to sign a certification request, we should simply run **puppet cert sign** with the **hostname** as shown below.

    # puppet cert sign puppetnode.example.com

    Notice: Signed certificate request for puppetnode.example.com
    Notice: Removing file Puppet::SSL::CertificateRequest puppetnode.example.com at '/var/lib/puppet/ssl/ca/requests/puppetnode.example.com.pem'

The Puppet master can now communicate and control the node that the signed certificate belongs to.

If we want to sign all of the current requests, we can use the -all option as shown below.

    # puppet cert sign --all

### Removing a Puppet Certificate ###

If we wanna remove a host from it or wanna rebuild a host then add it back to it. In this case, we will want to revoke the host's certificate from the puppet master. To do this, we will want to use the clean action as follows.

    # puppet cert clean hostname

    Notice: Revoked certificate with serial 5
    Notice: Removing file Puppet::SSL::Certificate puppetnode.example.com at '/var/lib/puppet/ssl/ca/signed/puppetnode.example.com.pem'
    Notice: Removing file Puppet::SSL::Certificate puppetnode.example.com at '/var/lib/puppet/ssl/certs/puppetnode.example.com.pem'

If we want to view all of the requests signed and unsigned, run the following command:

    # puppet cert list --all

    + "puppetmaster" (SHA256) 33:28:97:86:A1:C3:2F:73:10:D1:FB:42:DA:D5:42:69:71:84:F0:E2:8A:01:B9:58:38:90:E4:7D:B7:25:23:EC (alt names: "DNS:puppetmaster", "DNS:puppetmaster.example.com") 

### 12. Deploying a Puppet Manifest ###

After we configure and complete the puppet manifest, we'll wanna deploy the manifest to the agent nodes server. To apply and load the main manifest we can simply run the following command in the agent node.

    # puppet agent --test

    Info: Retrieving pluginfacts
    Info: Retrieving plugin
    Info: Caching catalog for puppetnode.example.com
    Info: Applying configuration version '1434563858'
    Notice: /Stage[main]/Main/Exec[apt-update]/returns: executed successfully
    Notice: Finished catalog run in 10.53 seconds

This will show us all the processes how the main manifest will affect a single server immediately.

If we wanna run a puppet manifest that is not related to the main manifest, we can simply use puppet apply followed by the manifest file path. It only applies the manifest to the node that we run the apply from.

    # puppet apply /etc/puppet/manifest/test.pp

### 13. Configuring Manifest for a Specific Node ###

If we wanna deploy a manifest only to a specific node then we'll need to configure the manifest as follows.

We'll need to edit the manifest on the master server using a text editor.

    # nano /etc/puppet/manifest/site.pp

Now, we'll gonna add the following lines there.

    node 'puppetnode', 'puppetnode1' {
    # execute 'apt-get update'
    exec { 'apt-update': # exec resource named 'apt-update'
    command => '/usr/bin/apt-get update' # command this resource will run
    }

    # install apache2 package
    package { 'apache2':
    require => Exec['apt-update'], # require 'apt-update' before installing
    ensure => installed,
    }

    # ensure apache2 service is running
    service { 'apache2':
    ensure => running,
    }
    }

Here, the above configuration will install and deploy the apache web server only to the two specified nodes having shortname puppetnode and puppetnode1. We can add more nodes that we need to get deployed with the manifest specifically.

### 14. Configuring Manifest with a Module ###

Modules are useful for grouping tasks together, they are many available in the Puppet community which anyone can contribute further.

On the puppet master, we'll gonna install the **puppetlabs-apache** module using the puppet module command.

    # puppet module install puppetlabs-apache

**Warning**: Please do not use this module on an existing apache setup else it will purge your apache configurations that are not managed by puppet.

Now we'll gonna edit the main manifest ie **site.pp** using a text editor.

    # nano /etc/puppet/manifest/site.pp

Now add the following lines to install apache under puppetnode.

    node 'puppet-node' {
    class { 'apache': } # use apache module
    apache::vhost { 'example.com': # define vhost resource
    port => '80',
    docroot => '/var/www/html'
    }
    }

Then we'll wanna save and exit it. Then, we'll wanna rerun the manifest to deploy the configuration to the agents for our infrastructure.

### Conclusion ###

Finally we have successfully installed puppet to manage our Server Infrastructure running Ubuntu 15.04 "Vivid Vervet" linux operating system. We learned how puppet works, configure a manifest configuration, communicate with nodes and deploy the manifest on the agent nodes with secure SSL certification. Controlling, managing and configuring repeated task in several N number of nodes is very easy with puppet open source software configuration management tool. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-puppet-ubuntu-15-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://docs.puppetlabs.com/puppet/latest/reference/config_file_main.html