Translating by GOLinux!
Managing Linux server configs with the SaltStack
================================================================================
![](http://techarena51.com/wp-content/uploads/2015/01/SaltStack+logo+-+black+on+white.png)

I came across Salt while searching for an alternative to [Puppet][1]. I like puppet, but I am falling in love with Salt :). This maybe a personal opinion but I found Salt easier to configure and get started with as compared to Puppet. Another reason I like Salt is that it let’s you manage your server configurations from the command line, for example:

To update all your servers with Salt, just run

    salt ‘*’ pkg.upgrade

**Installing the SaltStack on Linux.**

Salt is available in the EPEL repo if you are installing it on CentOS 6/7, Pi and Ubuntu linux users can add the Salt Repository from [here][2]. Since Salt is python based you can also use ‘pip’ to install it but you have take care of dependencies like yum-utils and other packages yourself.

Salt follows the Server-Client model, The Server is known as the master whereas clients are called minions.

**Installation and Configuration of a Salt Master**

    [root@salt-master~]# yum install salt-master

Salt configurations files are stored in /etc/salt and /srv/salt. Salt is good to go out of the box, but I would recommend you configure a bit more verbose logging to help your troubleshoot.

    [root@salt-master ~]# vim /etc/salt/master
    #Default is warning change to the following
    log_level: debug
    log_level_logfile: debug
    
    [root@salt-master ~]# systemctl start salt-master

**Installation and Configuration of a Salt minion**

    [root@salt-minion~]#yum install salt-minion
    
    #Add the hostname of your Salt Master
    [root@salt-minion~]#vim /etc/salt/minion
    master: salt-master.com
    #start the minion
    [root@salt-minion~] systemctl start salt-minion

On Startup, a minion will generate a cryptographic key and an id. It will then connect to the Salt Master and identify itself. The Salt Master must accept the minion’s key before allowing the minion to download a configuration.

**Listing and Accepting keys on the Salt Master**

    #List all keys
    [root@salt-master~] salt-key -L
    Accepted Keys:
    Unaccepted Keys:
    minion.com
    Rejected Keys:
    
    #Accept key with id ‘minion.com’
    [root@salt-master~]salt-key -a minion.com
    
    [root@salt-master~] salt-key -L
    Accepted Keys:
    minion.com
    Unaccepted Keys:
    Rejected Keys:

Once you have accepted a minions keys, you can get information on it immediately using the ‘salt’ command.

**Salt command line examples**

    #Check if a minion is up and running
    [root@salt-master~]  salt 'minion.com' test.ping
    minion.com:
        True
    # run shell commands on the minion
     [root@salt-master~]#  salt 'minion.com' cmd.run 'ls -l'
    minion.com:
        total 2988
        -rw-r--r--. 1 root root 1024 Jul 31 08:24 1g.img
        -rw-------. 1 root root     940 Jul 14 15:04 anaconda-ks.cfg
        -rw-r--r--. 1 root root 1024  Aug 14 17:21 test
    #install/update a software on all your servers
    [root@salt-master ~]# salt '*' pkg.install git

The salt command needs a few components to send information. One of these components is the minion id and another is the function to be called on the minion.
In the first example I used the ‘ping’ function of the ‘test’ module to check if the system is up. This function does not perform an actual ping, it just return’s ‘true’ if the minion responds.
‘cmd.run’ is used to execute remote commands and ‘pkg’ module contains functions for package management. The full list of builin modules is at the end of this post.

**Grains example**

Salt uses an interface called **Grains** to get system information. You can use grains to run commands on systems with particular properties.

    [root@vps4544 ~]# salt -G 'os:Centos' test.ping
    minion:
        True

More grain examples are available at http://docs.saltstack.com/en/latest/topics/targeting/grains.html

**Package Management via the State File System.**

In order to automate software configurations you will need to use the state system and create a state file. These files use the YAML format and python dictionaries, lists, strings and numbers for data structure. Reading up on them will help you understand the configurations better.

**VIM state file example**

    [root@salt-master~]# vim /srv/salt/vim.sls
    vim-enhanced:
      pkg.installed
    /etc/vimrc:
      file.managed:
        - source: salt://vimrc
        - user: root
        - group: root
        - mode: 644
  

The first and third line in this file are called state id. They must contain the exact name or path of the package or file to be managed. After the state ids are state and function declaration. ‘pkg’ and file are state declarations whereas ‘installed’ and ‘managed’ are function declarations. Functions accept arguments, user,group,mode and source are all arguments to the function ‘managed’.

To apply this configuration to a minion move your ‘vimrc’ file to ‘/srv/salt’ and run.

    [root@salt-master~]# salt 'minion.com' state.sls vim
    minion.com:
    ----------
              ID: vim-enhanced
        Function: pkg.installed
          Result: True
         Comment: The following packages were installed/updated: vim-enhanced.
         Started: 09:36:23.438571
        Duration: 94045.954 ms
         Changes:
                  ----------
                  vim-enhanced:
                      ----------
                      new:
                          7.4.160-1.el7
                      old:
    
    
    Summary
    ------------
    Succeeded: 1 (changed=1)
    Failed:    0
    ------------
    Total states run:     1
    
You can also add dependencies to your configurations.
    
    [root@salt-master~]# vim /srv/salt/ssh.sls
    openssh-server:
      pkg.installed
    
    
    /etc/ssh/sshd_config:
      file.managed:
        - user: root
        - group: root
        - mode: 600
        - source: salt://ssh/sshd_config
    
    sshd:
      service.running:
        - require:
          - pkg: openssh-server

The ‘require’ statement here is a requisite declaration, it creates a dependency between the ‘service’ and ‘pkg’ states. This declaration will first check if the package is installed and then run the service.

However, I prefer using the ‘watch’ statement as it also checks for file modifications and restarts the service.

    [root@salt-master~]# vim /srv/salt/ssh.sls
    openssh-server:
      pkg.installed
    
    
    /etc/ssh/sshd_config:
      file.managed:
        - user: root
        - group: root
        - mode: 600
        - source: salt://sshd_config
    
    sshd:
      service.running:
        - watch:
          - pkg: openssh-server
          - file: /etc/ssh/sshd_config
    
    [root@vps4544 ssh]# salt 'minion.com' state.sls ssh
    seven.leog.in:
         Changes:
    ----------
              ID: openssh-server
        Function: pkg.installed
          Result: True
         Comment: Package openssh-server is already installed.
         Started: 13:01:55.824367
        Duration: 1.156 ms
         Changes:
    ----------
              ID: /etc/ssh/sshd_config
        Function: file.managed
          Result: True
         Comment: File /etc/ssh/sshd_config updated
         Started: 13:01:55.825731
        Duration: 334.539 ms
         Changes:
                  ----------
                  diff:
                      ---
                      +++
                      @@ -14,7 +14,7 @@
                       # SELinux about this change.
                       # semanage port -a -t ssh_port_t -p tcp #PORTNUMBER
                       #
                      -Port 22
                      +Port 422
                       #AddressFamily any
                       #ListenAddress 0.0.0.0
                       #ListenAddress ::
    
    ----------
              ID: sshd
        Function: service.running
          Result: True
         Comment: Service restarted
         Started: 13:01:56.473121
        Duration: 407.214 ms
         Changes:
                  ----------
                  sshd:
                      True
    
    Summary
    ------------
    Succeeded: 4 (changed=2)
    Failed:    0
    ------------
    Total states run:     4

Maintaining all config files in single directory can make scaling a complex task, hence you can create sub-directories and add your configuration in them with a init.sls file

    [root@salt-master~]# mkdir /srv/salt/ssh
    [root@salt-master~]# vim /srv/salt/ssh/init.sls
    openssh-server:
      pkg.installed
    
    
    /etc/ssh/sshd_config:
      file.managed:
        - user: root
        - group: root
        - mode: 600
        - source: salt://ssh/sshd_config
    
    sshd:
      service.running:
        - watch:
          - pkg: openssh-server
          - file: /etc/ssh/sshd_config
    
    [root@vps4544 ssh]# cp /etc/ssh/sshd_config /srv/salt/ssh/
    [root@vps4544 ssh]# salt 'minion.com' state.sls ssh

**Top File and Environments.**

A Top file (top.sls) is where you define your environments. A top file allows you to map minions to packages. The default environment is ‘base’. You need to define which packages will be installed on which server under the base environment.

If there are multiple environments and more than one definitions for a particular minion is used then by default the base environment will supersede the others.

To define an environment you need to add it to the ‘file_roots’ directive in the master configuration file.

    [root@salt-master ~]# vim /etc/salt/master
    file_roots:
      base:
        - /srv/salt
      dev:
        - /srv/salt/dev

Now add a top.sls file in /srv/salt

    [root@salt-master ~]# vim /srv/salt/top.sls
    base:
      '*':
        - vim
      'minion.com':
         - ssh

Apply the top file configuration with

    [root@salt-master~]# salt '*' state.highstate
    minion.com:
    ----------
              ID: vim-enhanced
        Function: pkg.installed
          Result: True
         Comment: Package vim-enhanced is already installed.
         Started: 13:10:55
        Duration: 1678.779 ms
         Changes:
    ----------
              ID: openssh-server
        Function: pkg.installed
          Result: True
         Comment: Package openssh-server is already installed.
         Started: 13:10:55.
        Duration: 2.156 ms

The minion will download the top file and search for it’s configuration. It will also apply the configuration for all minions.

This is just a brief introduction to Salt, for in depth understanding you can go through the links below and if you are already using Salt and have any recommendations do let me know.

Update: [Foreman][3] has support for salt via [plugins][4].

Read

- http://docs.saltstack.com/en/latest/ref/states/top.html#how-top-files-are-compiled
- http://docs.saltstack.com/en/latest/topics/tutorials/states_pt1.html
- http://docs.saltstack.com/en/latest/ref/states/highstate.html#state-declaration

Grains

- http://docs.saltstack.com/en/latest/topics/targeting/grains.html

List of Salt Modules

Good comparison of Salt and puppet

- https://mywushublog.com/2013/03/configuration-management-with-salt-stack/

Full list of builtin execution modules

- http://docs.saltstack.com/en/latest/ref/modules/all/

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/getting-started-with-saltstack/

作者：[Leo G][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://techarena51.com/index.php/a-simple-way-to-install-and-configure-a-puppet-server-on-linux/
[2]:http://docs.saltstack.com/en/latest/topics/installation/index.html
[3]:http://techarena51.com/index.php/using-foreman-opensource-frontend-puppet/
[4]:https://github.com/theforeman/foreman_salt/wiki
