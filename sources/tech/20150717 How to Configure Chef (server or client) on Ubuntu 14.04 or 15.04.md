How to Configure Chef (server/client) on Ubuntu 14.04 / 15.04
================================================================================
Chef is a configuration management and automation tool for information technology professionals that configures and manages your infrastructure whether it is on-premises or in the cloud. It can be used to speed up application deployment and to coordinate the work of multiple system administrators and developers involving hundreds, or even thousands, of servers and applications to support a large customer base. The key to Chef’s power is that it turns infrastructure into code. Once you master Chef, you will be able to enable web IT with first class support for managing your cloud infrastructure with an easy automation of your internal deployments or end users systems.

Here are the major components of Chef that we are going to setup and configure in this tutorial.
chef components

![](http://blog.linoxide.com/wp-content/uploads/2015/07/chef.png)

### Chef Prerequisites and Versions ###

We are going to setup Chef configuration management system under the following basic environment.

注：表格
<table width="701" style="height: 284px;">
<tbody>
<tr>
<td width="660" colspan="2"><strong>Chef, Configuration Management Tool</strong></td>
</tr>
<tr>
<td width="220"><strong>Base Operating System</strong></td>
<td width="492">Ubuntu 14.04.1 LTS&nbsp;(x86_64)</td>
</tr>
<tr>
<td width="220"><strong>Chef Server</strong></td>
<td width="492">Version 12.1.0</td>
</tr>
<tr>
<td width="220"><strong>Chef Manage</strong></td>
<td width="492">Version 1.17.0</td>
</tr>
<tr>
<td width="220"><strong>Chef Development Kit</strong></td>
<td width="492">Version 0.6.2</td>
</tr>
<tr>
<td width="220"><strong>RAM and CPU</strong></td>
<td width="492">4 GB&nbsp; , 2.0+2.0 GHZ</td>
</tr>
</tbody>
</table>

### Chef Server's Installation and Configurations ###

Chef Server is central core component that stores recipes as well as other configuration data and interact with the workstations and nodes. let's download the installation media by selecting the latest version of chef server from its official web link.

We will get its installation package and install it by using following commands.

**1) Downloading Chef Server**

    root@ubuntu-14-chef:/tmp# wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.1.0-1_amd64.deb

**2) To install Chef Server**

    root@ubuntu-14-chef:/tmp# dpkg -i chef-server-core_12.1.0-1_amd64.deb

**3) Reconfigure Chef Server**

Now Run the following command to start all of the chef server services ,this step may take a few minutes to complete as its composed of many different services that work together to create a functioning system.

    root@ubuntu-14-chef:/tmp# chef-server-ctl reconfigure

The chef server startup command 'chef-server-ctl reconfigure' needs to be run twice so that installation ends with the following completion output.

    Chef Client finished, 342/350 resources updated in 113.71139964 seconds
    opscode Reconfigured!

**4) Reboot OS**

Once the installation complete reboot the operating system for the best working without doing this we you might get the following SSL_connect error during creation of User.

    ERROR: Errno::ECONNRESET: Connection reset by peer - SSL_connect

**5) Create new Admin User**

Run the following command to create a new administrator user with its profile settings. During its creation user’s RSA private key is generated automatically that should be saved to a safe location. The --filename option will save the RSA private key to a specified path.

    root@ubuntu-14-chef:/tmp# chef-server-ctl user-create kashi kashi kashi kashif.fareedi@gmail.com kashi123 --filename /root/kashi.pem

### Chef Manage Setup on Chef Server ###

Chef Manage is a management console for Enterprise Chef that enables a web-based user interface for visualizing and managing nodes, data bags, roles, environments, cookbooks and role-based access control (RBAC).

**1) Downloading Chef Manage**

Copy the link for Chef Manage from the official web site and download the chef manage package.

    root@ubuntu-14-chef:~# wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/opscode-manage_1.17.0-1_amd64.deb

**2) Installing Chef Manage**

Let's install it into the root's home directory with below command.

    root@ubuntu-14-chef:~# chef-server-ctl install opscode-manage --path /root

**3) Restart Chef Manage and Server**

Once the installation is complete we need to restart chef manage and chef server services by executing following commands.

    root@ubuntu-14-chef:~# opscode-manage-ctl reconfigure
    root@ubuntu-14-chef:~# chef-server-ctl reconfigure

### Chef Manage Web Console ###

We can access chef manage web console from the localhost as wel as its fqdn and login with the already created admin user account.

![chef amanage](http://blog.linoxide.com/wp-content/uploads/2015/07/5-chef-web.png)

**1) Create New Organization with Chef Manage**

You would be asked to create new organization or accept the invitation from the organizations. Let's create a new organization by providing its short and full name as shown.

![Create Org](http://blog.linoxide.com/wp-content/uploads/2015/07/7-create-org.png)

**2) Create New Organization with Command line**

We can also create new Organization from the command line by executing the following command.

    root@ubuntu-14-chef:~# chef-server-ctl org-create linux Linoxide Linux Org. --association_user kashi --filename linux.pem

### Configuration and setup of Workstation ###

As we had done with successful installation of chef server now we are going to setup its workstation to create and configure any recipes, cookbooks, attributes, and other changes that we want to made to our Chef configurations.

**1) Create New User and Organization on Chef Server**

In order to setup workstation we create a new user and an organization for this from the command line.

    root@ubuntu-14-chef:~# chef-server-ctl user-create bloger Bloger Kashif bloger.kashif@gmail.com bloger123 --filename bloger.pem

    root@ubuntu-14-chef:~# chef-server-ctl org-create blogs Linoxide Blogs Inc. --association_user bloger --filename blogs.pem

**2) Download Starter Kit for Workstation**

Now Download and Save starter-kit from the chef manage web console on a workstation and use it to work with Chef server.

![Starter Kit](http://blog.linoxide.com/wp-content/uploads/2015/07/8-download-kit.png)

**3) Click to "Proceed" with starter kit download**

![starter kit](http://blog.linoxide.com/wp-content/uploads/2015/07/9-download-kit.png)

### Chef Development Kit Setup for Workstation ###

Chef Development Kit is a software package suite with all the development tools need to code Chef. It combines with the best of the breed tools developed by Chef community with Chef Client.

**1) Downloading Chef DK**

We can Download chef development kit from its official web link and choose the required operating system to get its chef development tool kit.

![Chef DK](http://blog.linoxide.com/wp-content/uploads/2015/07/10-CDK.png)

Copy the link and download it with wget command.

    root@ubuntu-15-WKS:~# wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.2-1_amd64.deb

**1) Chef Development Kit Installatoion**

Install chef-development kit using dpkg command

    root@ubuntu-15-WKS:~# dpkg -i chefdk_0.6.2-1_amd64.deb

**3) Chef DK Verfication**

Verify using the below command that the client got installed properly.

    root@ubuntu-15-WKS:~# chef verify

----------

    Running verification for component 'berkshelf'
    Running verification for component 'test-kitchen'
    Running verification for component 'chef-client'
    Running verification for component 'chef-dk'
    Running verification for component 'chefspec'
    Running verification for component 'rubocop'
    Running verification for component 'fauxhai'
    Running verification for component 'knife-spork'
    Running verification for component 'kitchen-vagrant'
    Running verification for component 'package installation'
    Running verification for component 'openssl'
    ..............
    ---------------------------------------------
    Verification of component 'rubocop' succeeded.
    Verification of component 'knife-spork' succeeded.
    Verification of component 'openssl' succeeded.
    Verification of component 'berkshelf' succeeded.
    Verification of component 'chef-dk' succeeded.
    Verification of component 'fauxhai' succeeded.
    Verification of component 'test-kitchen' succeeded.
    Verification of component 'kitchen-vagrant' succeeded.
    Verification of component 'chef-client' succeeded.
    Verification of component 'chefspec' succeeded.
    Verification of component 'package installation' succeeded.

**Connecting to Chef Server**

We will Create ~/.chef and copy the two user and organization pem files to this folder from chef server.

    root@ubuntu-14-chef:~# scp bloger.pem blogs.pem kashi.pem linux.pem root@172.25.10.172:/.chef/

----------

    root@172.25.10.172's password:
    bloger.pem 100% 1674 1.6KB/s 00:00
    blogs.pem 100% 1674 1.6KB/s 00:00
    kashi.pem 100% 1678 1.6KB/s 00:00
    linux.pem 100% 1678 1.6KB/s 00:00

**Knife Configurations to Manage your Chef Environment**

Now create "~/.chef/knife.rb" with following content as configured in previous steps.

    root@ubuntu-15-WKS:/.chef# vim knife.rb
    current_dir = File.dirname(__FILE__)

    log_level :info
    log_location STDOUT
    node_name "kashi"
    client_key "#{current_dir}/kashi.pem"
    validation_client_name "kashi-linux"
    validation_key "#{current_dir}/linux.pem"
    chef_server_url "https://172.25.10.173/organizations/linux"
    cache_type 'BasicFile'
    cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
    cookbook_path ["#{current_dir}/../cookbooks"]

Create "~/cookbooks" folder for cookbooks as specified knife.rb file.

    root@ubuntu-15-WKS:/# mkdir cookbooks

**Testing with Knife Configurations**

Run "knife user list" and "knife client list" commands to verify whether knife configuration is working.

    root@ubuntu-15-WKS:/.chef# knife user list

You might get the following error while first time you run this command.This occurs because we do not have our Chef server's SSL certificate on our workstation.

    ERROR: SSL Validation failure connecting to host: 172.25.10.173 - SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
    ERROR: Could not establish a secure connection to the server.
    Use `knife ssl check` to troubleshoot your SSL configuration.
    If your Chef Server uses a self-signed certificate, you can use
    `knife ssl fetch` to make knife trust the server's certificates.

To recover from the above error run the following command to fetch ssl certs and once again run the knife user and client list command and it should be fine then.

    root@ubuntu-15-WKS:/.chef# knife ssl fetch
    WARNING: Certificates from 172.25.10.173 will be fetched and placed in your trusted_cert
    directory (/.chef/trusted_certs).

    Knife has no means to verify these are the correct certificates. You should
    verify the authenticity of these certificates after downloading.

    Adding certificate for ubuntu-14-chef.test.com in /.chef/trusted_certs/ubuntu-14-chef_test_com.crt

Now after fetching ssl certs with above command, let's again run the below command.

    root@ubuntu-15-WKS:/.chef#knife client list
    kashi-linux

### New Node Configuration to interact with chef-server ###

Nodes contain chef-client which performs all the infrastructure automation. So, Its time to begin with adding new servers to our chef environment by Configuring a new node to interact with chef-server after we had Configured chef-server and knife workstation combinations.

To configure a new node to work with chef server use below command.

    root@ubuntu-15-WKS:~# knife bootstrap 172.25.10.170 --ssh-user root --ssh-password kashi123 --node-name mydns

----------

    Doing old-style registration with the validation key at /.chef/linux.pem...
    Delete your validation key in order to use your user credentials instead

    Connecting to 172.25.10.170
    172.25.10.170 Installing Chef Client...
    172.25.10.170 --2015-07-04 22:21:16-- https://www.opscode.com/chef/install.sh
    172.25.10.170 Resolving www.opscode.com (www.opscode.com)... 184.106.28.91
    172.25.10.170 Connecting to www.opscode.com (www.opscode.com)|184.106.28.91|:443... connected.
    172.25.10.170 HTTP request sent, awaiting response... 200 OK
    172.25.10.170 Length: 18736 (18K) [application/x-sh]
    172.25.10.170 Saving to: ‘STDOUT’
    172.25.10.170
    100%[======================================>] 18,736 --.-K/s in 0s
    172.25.10.170
    172.25.10.170 2015-07-04 22:21:17 (200 MB/s) - written to stdout [18736/18736]
    172.25.10.170
    172.25.10.170 Downloading Chef 12 for ubuntu...
    172.25.10.170 downloading https://www.opscode.com/chef/metadata?v=12&prerelease=false&nightlies=false&p=ubuntu&pv=14.04&m=x86_64
    172.25.10.170 to file /tmp/install.sh.26024/metadata.txt
    172.25.10.170 trying wget...

After all we can see the vewly created node under the knife node list and new client list as it it will also creates a new client with the node.

    root@ubuntu-15-WKS:~# knife node list
    mydns

Similarly we can add multiple number of nodes to our chef infrastructure by providing ssh credentials with the same above knofe bootstrap command.

### Conclusion ###

In this detailed article we learnt about the Chef Configuration Management tool with its basic understanding and overview of its components with installation and configuration settings. We hope you have enjoyed learning the installation and configuration of Chef server with its workstation and client nodes.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-configure-chef-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/