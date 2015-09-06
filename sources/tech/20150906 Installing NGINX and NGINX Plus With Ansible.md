Installing NGINX and NGINX Plus With Ansible
================================================================================
Coming from a production operations background, I have learned to love all things related to automation. Why do something by hand if a computer can do it for you? But creating and implementing automation can be a difficult task given an ever-changing infrastructure and the various technologies surrounding your environments. This is why I love [Ansible][1]. Ansible is an open source tool for IT configuration management, deployment, and orchestration that is extremely easy to use.

One of my favorite features of Ansible is that it is completely clientless. To manage a system, a connection is made over SSH, using either [Paramiko][2] (a Python library) or native [OpenSSH][3]. Another attractive feature of Ansible is its extensive selection of modules. These modules can be used to perform some of the common tasks of a system administrator. In particular, they make Ansible a powerful tool for installing and configuring any application across multiple servers, environments, and operating systems, all from one central location.

In this tutorial I will walk you through the steps for using Ansible to install and deploy the open source [NGINX][4] software and [NGINX Plus][5], our commercial product. I’m showing deployment onto a [CentOS][6] server, but I have included details about deploying on Ubuntu servers in [Creating an Ansible Playbook for Installing NGINX and NGINX Plus on Ubuntu][7] below.

For this tutorial I will be using Ansible version 1.9.2 and performing the deployment from a server running CentOS 7.1.

    $ ansible --version
    ansible 1.9.2
    
    $ cat /etc/redhat-release
    CentOS Linux release 7.1.1503 (Core)

If you don’t already have Ansible, you can get instructions for installing it [at the Ansible site][8].

If you are using CentOS, installing Ansible is easy as typing the following command. If you want to compile from source or for other distributions, see the instructions at the Ansible link provided just above.

    $ sudo yum install -y epel-release && sudo yum install -y ansible

Depending on your environment, some of the commands in this tutorial might require sudo privileges. The path to the files, usernames, and destination servers are all values that will be specific to your environment.

### Creating an Ansible Playbook for Installing NGINX (CentOS) ###

First we create a working directory for our NGINX deployment, along with subdirectories and deployment configuration files. I usually recommend creating the directory in your home directory and show that in all examples in this tutorial.

    $ cd $HOME
    $ mkdir -p ansible-nginx/tasks/
    $ touch ansible-nginx/deploy.yml
    $ touch ansible-nginx/tasks/install_nginx.yml

The directory structure now looks like this. You can check by using the tree command.

    $ tree $HOME/ansible-nginx/
    /home/kjones/ansible-nginx/
    ├── deploy.yml
    └── tasks
        └── install_nginx.yml
    
    1 directory, 2 files

If you do not have tree installed, you can do so using the following command.

    $ sudo yum install -y tree

#### Creating the Main Deployment File ####

Next we open **deploy.yml** in a text editor. I prefer vim for editing configuration files on the command line, and will use it throughout the tutorial.

    $ vim $HOME/ansible-nginx/deploy.yml

The **deploy.yml** file is our main Ansible deployment file, which we’ll reference when we run the ansible‑playbook command in [Running Ansible to Deploy NGINX][9]. Within this file we specify the inventory for Ansible to use along with any other configuration files to include at runtime.

In my example I use the [include][10] module to specify a configuration file that has the steps for installing NGINX. While it is possible to create a playbook in one very large file, I recommend that you separate the steps into smaller included files to keep things organized. Sample use cases for an include are copying static content, copying configuration files, or assigning variables for a more advanced deployment with configuration logic.

Type the following lines into the file. I include the filename at the top in a comment for reference.

    # ./ansible-nginx/deploy.yml
    
    - hosts: nginx
      tasks:
        - include: 'tasks/install_nginx.yml'

The hosts statement tells Ansible to deploy to all servers in the **nginx** group, which is defined in **/etc/ansible/hosts**. We’ll edit this file in [Creating the List of NGINX Servers below][11].

The include statement tells Ansible to read in and execute the contents of the **install_nginx.yml** file from the **tasks** directory during deployment. The file includes the steps for downloading, installing, and starting NGINX. We’ll create this file in the next section.

#### Creating the Deployment File for NGINX ####

Now let’s save our work to **deploy.yml** and open up **install_nginx.yml** in the editor.

    $ vim $HOME/ansible-nginx/tasks/install_nginx.yml

The file is going to contain the instructions – written in [YAML][12] format – for Ansible to follow when installing and configuring our NGINX deployment. Each section (step in the process) starts with a name statement (preceded by hyphen) that describes the step. The string following name: is written to stdout during the Ansible deployment and can be changed as you wish. The next line of a section in the YAML file is the module that will be used during that deployment step. In the configuration below, both the [yum][13] and [service][14] modules are used. The yum module is used to install packages on CentOS. The service module is used to manage UNIX services. The final line or lines in a section specify any parameters for the module (in the example, these lines start with name and state).

Type the following lines into the file. As with **deploy.yml**, the first line in our file is a comment that names the file for reference. The first section tells Ansible to install the **.rpm** file for CentOS 7 from the NGINX repository. This directs the package manager to install the most recent stable version of NGINX directly from NGINX. Modify the pathname as necessary for your CentOS version. A list of available packages can be found on the [open source NGINX website][15]. The next two sections tell Ansible to install the latest NGINX version using the yum module and then start NGINX using the service module.

**Note:** In the first section, the pathname to the CentOS package appears on two lines only for space reasons. Type the entire path on a single line.

    # ./ansible-nginx/tasks/install_nginx.yml
     
    - name: NGINX | Installing NGINX repo rpm
      yum:
        name: http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
     
    - name: NGINX | Installing NGINX
      yum:
        name: nginx
        state: latest
     
    - name: NGINX | Starting NGINX
      service:
        name: nginx
        state: started

#### Creating the List of NGINX Servers ####

Now that we have our Ansible deployment configuration files all set up, we need to tell Ansible exactly which servers to deploy to. We specify this in the Ansible **hosts** file I mentioned earlier. Let’s make a backup of the existing file and create a new one just for our deployment.

    $ sudo mv /etc/ansible/hosts /etc/ansible/hosts.backup
    $ sudo vim /etc/ansible/hosts

Type (or edit) the following lines in the file to create a group called **nginx** and list the servers to install NGINX on. You can designate servers by hostname, IP address, or in an array such as **server[1-3].domain.com**. Here I designate one server by its IP address.

    # /etc/ansible/hosts
    
    [nginx]
    172.16.239.140

#### Setting Up Security ####

We are almost all set, but before deployment we need to ensure that Ansible has authorization to access our destination server over SSH.

The preferred and most secure method is to add the Ansible deployment server’s RSA SSH key to the destination server’s **authorized_keys** file, which gives Ansible unrestricted SSH permissions on the destination server. To learn more about this configuration, see [Securing OpenSSH][16] on wiki.centos.org. This way you can automate your deployments without user interaction.

Alternatively, you can request the password interactively during deployment. I strongly recommend that you use this method during testing only, because it is insecure and there is no way to track changes to a destination host’s fingerprint. If you want to do this, change the value of StrictHostKeyChecking from the default yes to no in the **/etc/ssh/ssh_config** file on each of your destination hosts. Then add the --ask-pass flag on the ansible-playbook command to have Ansible prompt for the SSH password.

Here I illustrate how to edit the **ssh_config** file to disable strict host key checking on the destination server. We manually SSH into the server to which we’ll deploy NGINX and change the value of StrictHostKeyChecking to no.

    $ ssh kjones@172.16.239.140
    kjones@172.16.239.140's password:***********
     
    [kjones@nginx ]$ sudo vim /etc/ssh/ssh_config

After you make the change, save **ssh_config**, and connect to your Ansible server via SSH. The setting should look as below before you save your work.

    # /etc/ssh/ssh_config
    
    StrictHostKeyChecking no

#### Running Ansible to Deploy NGINX ####

If you have followed the steps in this tutorial, you can run the following command to have Ansible deploy NGINX. (Again, if you have set up RSA SSH key authentication, then the --ask-pass flag is not needed.) Run the command on the Ansible server with the configuration files we created above.

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx/deploy.yml

Ansible prompts for the SSH password and produces output like the following. A recap that reports failed=0 like this one indicates that deployment succeeded.

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx/deploy.yml
    SSH password:
     
    PLAY [all] ********************************************************************
     
    GATHERING FACTS ***************************************************************
    ok: [172.16.239.140]
     
    TASK: [NGINX | Installing NGINX repo rpm] *************************************
    changed: [172.16.239.140]
     
    TASK: [NGINX | Installing NGINX] **********************************************
    changed: [172.16.239.140]
     
    TASK: [NGINX | Starting NGINX] ************************************************
    changed: [172.16.239.140]
     
    PLAY RECAP ********************************************************************
    172.16.239.140             : ok=4    changed=3    unreachable=0    failed=0

If you didn’t get a successful play recap, you can try running the ansible-playbook command again with the -vvvv flag (verbose with connection debugging) to troubleshoot the deployment process.

When deployment succeeds (as it did for us on the first try), you can verify that NGINX is running on the remote server by running the following basic [cURL][17] command. Here it returns 200 OK. Success! We have successfully installed NGINX using Ansible.

    $ curl -Is 172.16.239.140 | grep HTTP
    HTTP/1.1 200 OK

### Creating an Ansible Playbook for Installing NGINX Plus (CentOS) ###

Now that I’ve shown you how to install the open source version of NGINX, I’ll walk you through the steps for installing NGINX Plus. This requires some additional changes to the deployment configuration and showcases some of Ansible’s other features.

#### Copying the NGINX Plus Certificate and Key to the Ansible Server ####

To install and configure NGINX Plus with Ansible, we first need to copy the key and certificate for our NGINX Plus subscription from the [NGINX Plus Customer Portal][18] to the standard location on the Ansible deployment server.

Access to the NGINX Plus Customer Portal is available for customers who have purchased NGINX Plus or are evaluating it. If you are interested in evaluating NGINX Plus, you can request a 30-day free trial [here][19]. You will receive a link to your trial certificate and key shortly after you sign up.

On a Mac or Linux host, use the [scp][20] utility as I show here. On a Microsoft Windows host, you can use [WinSCP][21]. For this tutorial, I downloaded the files to my Mac laptop, then used scp to copy them to the Ansible server. These commands place both the key and certificate in my home directory.

    $ cd /path/to/nginx-repo-files/
    $ scp nginx-repo.* user@destination-server:.

Next we SSH to the Ansible server, make sure the SSL directory for NGINX Plus exists, and move the files there.

    $ ssh user@destination-server
    $ sudo mkdir -p /etc/ssl/nginx/
    $ sudo mv nginx-repo.* /etc/ssl/nginx/

Verify that your **/etc/ssl/nginx** directory contains both the certificate (**.crt**) and key (**.key**) files. You can check by using the tree command.

    $ tree /etc/ssl/nginx
    /etc/ssl/nginx
    ├── nginx-repo.crt
    └── nginx-repo.key
     
    0 directories, 2 files

If you do not have tree installed, you can do so using the following command.

    $ sudo yum install -y tree

#### Creating the Ansible Directory Structure ####

The remaining steps are very similar to the ones for open source NGINX that we performed in [Creating an Ansible Playbook for Installing NGINX (CentOS)][22]. First we set up a working directory for our NGINX Plus deployment. Again I prefer creating it as a subdirectory of my home directory.

    $ cd $HOME
    $ mkdir -p ansible-nginx-plus/tasks/
    $ touch ansible-nginx-plus/deploy.yml
    $ touch ansible-nginx-plus/tasks/install_nginx_plus.yml

The directory structure now looks like this.

    $ tree $HOME/ansible-nginx-plus/
    /home/kjones/ansible-nginx-plus/
    ├── deploy.yml
    └── tasks
    └── install_nginx_plus.yml
     
    1 directory, 2 files

#### Creating the Main Deployment File ####

Next we use vim to create the **deploy.yml** file as for open source NGINX.

    $ vim ansible-nginx-plus/deploy.yml

The only difference from the open source NGINX deployment is that we change the name of the included file to **install_nginx_plus.yml**. As a reminder, the file tells Ansible to deploy NGINX Plus on all servers in the **nginx** group (which is defined in **/etc/ansible/hosts**), and to read in and execute the contents of the **install_nginx_plus.yml** file from the **tasks** directory during deployment.

    # ./ansible-nginx-plus/deploy.yml
     
    - hosts: nginx
      tasks:
        - include: 'tasks/install_nginx_plus.yml'

If you have not done so already, you also need to create the hosts file as detailed in [Creating the List of NGINX Servers][23] above.

#### Creating the Deployment File for NGINX Plus ####

Open **install_nginx_plus.yml** in a text editor. The file is going to contain the instructions for Ansible to follow when installing and configuring your NGINX Plus deployment. The commands and modules are specific to CentOS and some are unique to NGINX Plus.

    $ vim ansible-nginx-plus/tasks/install_nginx_plus.yml

The first section uses the [file][24] module, telling Ansible to create the SSL directory for NGINX Plus as specified by the path and state arguments, set the ownership to root, and change the mode to 0700.

    # ./ansible-nginx-plus/tasks/install_nginx_plus.yml
     
    - name: NGINX Plus | Creating NGINX Plus ssl cert repo directory
      file: path=/etc/ssl/nginx state=directory group=root mode=0700

The next two sections use the [copy][25] module to copy the NGINX Plus certificate and key from the Ansible deployment server to the NGINX Plus server during the deployment, again setting ownership to root and the mode to 0700.

    - name: NGINX Plus | Copying NGINX Plus repository certificate
      copy: src=/etc/ssl/nginx/nginx-repo.crt dest=/etc/ssl/nginx/nginx-repo.crt owner=root group=root mode=0700
     
    - name: NGINX Plus | Copying NGINX Plus repository key
      copy: src=/etc/ssl/nginx/nginx-repo.key dest=/etc/ssl/nginx/nginx-repo.key owner=root group=root mode=0700

Next we tell Ansible to use the [get_url][26] module to download the CA certificate from the NGINX Plus repository at the remote location specified by the url argument, put it in the directory specified by the dest argument, and set the mode to 0700.

    - name: NGINX Plus | Downloading NGINX Plus CA certificate
      get_url: url=https://cs.nginx.com/static/files/CA.crt dest=/etc/ssl/nginx/CA.crt mode=0700

Similarly, we tell Ansible to download the NGINX Plus repo file using the get_url module and copy it to the **/etc/yum.repos.d** directory on the NGINX Plus server.

    - name: NGINX Plus | Downloading yum NGINX Plus repository
      get_url: url=https://cs.nginx.com/static/files/nginx-plus-7.repo dest=/etc/yum.repos.d/nginx-plus-7.repo mode=0700

The final two name sections tell Ansible to install and start NGINX Plus using the yum and service modules.

    - name: NGINX Plus | Installing NGINX Plus
      yum:
        name: nginx-plus
        state: latest
     
    - name: NGINX Plus | Starting NGINX Plus
      service:
        name: nginx
        state: started

#### Running Ansible to Deploy NGINX Plus ####

After saving the **install_nginx_plus.yml** file, we run the ansible-playbook command to deploy NGINX Plus. Again here we include the --ask-pass flag to have Ansible prompt for the SSH password and pass it to each NGINX Plus server, and specify the path to the main Ansible **deploy.yml** file.

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx-plus/deploy.yml
     
    PLAY [nginx] ******************************************************************
     
    GATHERING FACTS ***************************************************************
    ok: [172.16.239.140]
     
    TASK: [NGINX Plus | Creating NGINX Plus ssl cert repo directory] **************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Copying NGINX Plus repository certificate] ****************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Copying NGINX Plus repository key] ************************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Downloading NGINX Plus CA certificate] ********************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Downloading yum NGINX Plus repository] ********************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Installing NGINX Plus] ************************************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Starting NGINX Plus] **************************************
    changed: [172.16.239.140]
     
    PLAY RECAP ********************************************************************
    172.16.239.140             : ok=8    changed=7    unreachable=0    failed=0

The playbook recap was successful. Now we can run a quick curl command to verify that NGINX Plus is running. Great, we get 200 OK! Success! We have successfully installed NGINX Plus with Ansible.

    $ curl -Is http://172.16.239.140 | grep HTTP
    HTTP/1.1 200 OK

### Creating an Ansible Playbook for Installing NGINX and NGINX Plus on Ubuntu ###

The process for deploying NGINX and NGINX Plus on [Ubuntu servers][27] is pretty similar to the process on CentOS, so instead of providing step-by-step instructions I’ll show the complete deployment files and and point out the slight differences from CentOS.

First create the Ansible directory structure and the main Ansible deployment file, as for CentOS. Also create the **/etc/ansible/hosts** file as described in [Creating the List of NGINX Servers][28]. For NGINX Plus, you need to copy over the key and certificate as described in [Copying the NGINX Plus Certificate and Key to the Ansible Server][29].

Here’s the **install_nginx.yml** deployment file for open source NGINX. In the first section, we use the [apt_key][30] module to import the NGINX signing key. The next two sections use the [lineinfile][31] module to add the package URLs for Ubuntu 14.04 to the **sources.list** file. Lastly we use the [apt][32] module to update the cache and install NGINX (apt replaces the yum module we used for deploying to CentOS).

    # ./ansible-nginx/tasks/install_nginx.yml
     
    - name: NGINX | Adding NGINX signing key
      apt_key: url=http://nginx.org/keys/nginx_signing.key state=present
     
    - name: NGINX | Adding sources.list deb url for NGINX
      lineinfile: dest=/etc/apt/sources.list line="deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx"
     
    - name: NGINX Plus | Adding sources.list deb-src url for NGINX
      lineinfile: dest=/etc/apt/sources.list line="deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx"
     
    - name: NGINX | Updating apt cache
      apt:
        update_cache: yes
     
    - name: NGINX | Installing NGINX
      apt:
        pkg: nginx
        state: latest
     
    - name: NGINX | Starting NGINX
      service:
        name: nginx
        state: started

Here’s the **install_nginx.yml** deployment file for NGINX Plus. The first four sections set up the NGINX Plus key and certificate. Then we use the apt_key module to import the signing key as for open source NGINX, and the get_url module to download the apt configuration file for NGINX Plus. The [shell][33] module evokes a printf command that writes its output to the **nginx-plus.list** file in the **sources.list.d** directory. The final name modules are the same as for open source NGINX.

    # ./ansible-nginx-plus/tasks/install_nginx_plus.yml
     
    - name: NGINX Plus | Creating NGINX Plus ssl cert repo directory
      file: path=/etc/ssl/nginx state=directory group=root mode=0700
     
    - name: NGINX Plus | Copying NGINX Plus repository certificate
      copy: src=/etc/ssl/nginx/nginx-repo.crt dest=/etc/ssl/nginx/nginx-repo.crt owner=root group=root mode=0700
     
    - name: NGINX Plus | Copying NGINX Plus repository key
      copy: src=/etc/ssl/nginx/nginx-repo.key dest=/etc/ssl/nginx/nginx-repo.key owner=root group=root mode=0700
     
    - name: NGINX Plus | Downloading NGINX Plus CA certificate
      get_url: url=https://cs.nginx.com/static/files/CA.crt dest=/etc/ssl/nginx/CA.crt mode=0700
     
    - name: NGINX Plus | Adding NGINX Plus signing key
      apt_key: url=http://nginx.org/keys/nginx_signing.key state=present
     
    - name: NGINX Plus | Downloading Apt-Get NGINX Plus repository
      get_url: url=https://cs.nginx.com/static/files/90nginx dest=/etc/apt/apt.conf.d/90nginx mode=0700
     
    - name: NGINX Plus | Adding sources.list url for NGINX Plus
      shell: printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" >/etc/apt/sources.list.d/nginx-plus.list
     
    - name: NGINX Plus | Running apt-get update
      apt:
        update_cache: yes
     
    - name: NGINX Plus | Installing NGINX Plus via apt-get
      apt:
        pkg: nginx-plus
        state: latest
     
    - name: NGINX Plus | Start NGINX Plus
      service:
        name: nginx
        state: started

We’re now ready to run the ansible-playbook command:

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx-plus/deploy.yml

You should get a successful play recap. If you did not get a success, you can use the verbose flag to help troubleshoot your deployment as described in [Running Ansible to Deploy NGINX][34].

### Summary ###

What I demonstrated in this tutorial is just the beginning of what Ansible can do to help automate your NGINX or NGINX Plus deployment. There are many useful modules ranging from user account management to custom configuration templates. If you are interested in learning more about these, please visit the extensive [Ansible documentation][35 site.

To learn more about Ansible, come hear my talk on deploying NGINX Plus with Ansible at [NGINX.conf 2015][36], September 22–24 in San Francisco.

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/

作者：[Kevin Jones][a]
译者：[struggling](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.nginx.com/blog/author/kjones/
[1]:http://www.ansible.com/
[2]:http://www.paramiko.org/
[3]:http://www.openssh.com/
[4]:http://nginx.org/en/
[5]:https://www.nginx.com/products/
[6]:http://www.centos.org/
[7]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#ubuntu
[8]:http://docs.ansible.com/ansible/intro_installation.html#installing-the-control-machine
[9]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#deploy-nginx
[10]:http://docs.ansible.com/ansible/playbooks_roles.html#task-include-files-and-encouraging-reuse
[11]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#list-nginx
[12]:http://docs.ansible.com/ansible/YAMLSyntax.html
[13]:http://docs.ansible.com/ansible/yum_module.html
[14]:http://docs.ansible.com/ansible/service_module.html
[15]:http://nginx.org/en/linux_packages.html
[16]:http://wiki.centos.org/HowTos/Network/SecuringSSH
[17]:http://curl.haxx.se/
[18]:https://cs.nginx.com/
[19]:https://www.nginx.com/#free-trial
[20]:http://linux.die.net/man/1/scp
[21]:https://winscp.net/eng/download.php
[22]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#playbook-nginx
[23]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#list-nginx
[24]:http://docs.ansible.com/ansible/file_module.html
[25]:http://docs.ansible.com/ansible/copy_module.html
[26]:http://docs.ansible.com/ansible/get_url_module.html
[27]:http://www.ubuntu.com/
[28]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#list-nginx
[29]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#copy-cert-key
[30]:http://docs.ansible.com/ansible/apt_key_module.html
[31]:http://docs.ansible.com/ansible/lineinfile_module.html
[32]:http://docs.ansible.com/ansible/apt_module.html
[33]:http://docs.ansible.com/ansible/shell_module.html
[34]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#deploy-nginx
[35]:http://docs.ansible.com/
[36]:https://www.nginx.com/nginxconf/