How to manage configurations in Linux with Puppet and Augeas
================================================================================
Although [Puppet][1](注：此文原文原文中曾今做过，文件名：“20140808 How to install Puppet server and client on CentOS and RHEL.md”,如果翻译发布过，可修改此链接为发布地址) is a really unique and useful tool, there are situations where you could use a bit of a different approach. Situations like modification of configuration files which are already present on several of your servers and are unique on each one of them at the same time. Folks from Puppet labs realized this as well, and integrated a great tool called [Augeas][2] that is designed exactly for this usage.

Augeas can be best thought of as filling for the gaps in Puppet's capabilities where an object­specific resource type (such as the host resource to manipulate /etc/hosts entries) is not yet available. In this howto, you will learn how to use Augeas to ease your configuration file management. 

### What is Augeas? ###

Augeas is basically a configuration editing tool. It parses configuration files in their native formats and transforms them into a tree. Configuration changes are made by manipulating this tree and saving it back into native config files. 

### What are we going to achieve in this tutorial? ###

We will install and configure the Augeas tool for use with our previously built Puppet server. We will create and test several different configurations with this tool, and learn how to properly use it to manage our system configurations. 

### Prerequisites ###

We will need a working Puppet server and client setup. If you don't have it, please follow my previous tutorial.

Augeas package can be found in our standard CentOS/RHEL repositories. Unfortunately, Puppet uses Augeas ruby wrapper which is only available in the puppetlabs repository (or [EPEL][4]). If you don't have this repository in your system already, add it using following command:

On CentOS/RHEL 6.5:

     # rpm -­ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs­release­6­10.noarch.rpm 

On CentOS/RHEL 7: 

     # rpm -­ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs­release­7­10.noarch.rpm 

After you have successfully added this repository, install Ruby­Augeas in your system: 

     # yum install ruby­augeas 

Or if you are continuing from my last tutorial, install this package using the Puppet way. Modify your custom_utils class inside of your /etc/puppet/manifests/site.pp to contain "ruby­augeas" inside of the packages array: 

    class custom_utils {
            package { ["nmap","telnet","vim­enhanced","traceroute","ruby­augeas"]:
                    ensure => latest,
                    allow_virtual => false,
            }
    } 

### Augeas without Puppet ###

As it was said in the beginning, Augeas is not originally from Puppet Labs, which means we can still use it even without Puppet itself. This approach can be useful for verifying your modifications and ideas before applying them in your Puppet environment. To make this possible, you need to install one additional package in your system. To do so, please execute following command:

    # yum install augeas 

### Puppet Augeas Examples ###

For demonstration, here are a few example Augeas use cases. 

#### Management of /etc/sudoers file ####

1. Add sudo rights to wheel group

This example will show you how to add simple sudo rights for group %wheel in your GNU/Linux system. 

    # Install sudo package
    package { 'sudo':
        ensure => installed, # ensure sudo package installed
    }
      
    # Allow users belonging to wheel group to use sudo
    augeas { 'sudo_wheel':
        context => '/files/etc/sudoers', # The target file is /etc/sudoers
        changes => [
            # allow wheel users to use sudo
            'set spec[user = "%wheel"]/user %wheel',
            'set spec[user = "%wheel"]/host_group/host ALL',
            'set spec[user = "%wheel"]/host_group/command ALL',
            'set spec[user = "%wheel"]/host_group/command/runas_user ALL',
        ]
    } 

Now let's explain what the code does: **spec** defines the user section in /etc/sudoers, **[user]** defines given user from the array, and all definitions behind slash ( / ) are subparts of this user. So in typical configuration this would be represented as: 

    user host_group/host host_group/command host_group/command/runas_user

Which is translated into this line of /etc/sudoers: 

    %wheel ALL = (ALL) ALL 

2. Add command alias

The following part will show you how to define command alias which you can use inside your sudoers file. 

    # Create new alias SERVICES which contains some basic privileged commands
    augeas { 'sudo_cmdalias':
        context => '/files/etc/sudoers', # The target file is /etc/sudoers
        changes => [
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/name SERVICES",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[1] /sbin/service",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[2] /sbin/chkconfig",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[3] /bin/hostname",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[4] /sbin/shutdown",
        ]
    } 

Syntax of sudo command aliases is pretty simple: **Cmnd_Alias** defines the section of command aliases, **[alias/name]** binds all to given alias name, /alias/name **SERVICES** defines the actual alias name and alias/command is the array of all the commands that should be part of this alias. The output of this command will be following: 

    Cmnd_Alias SERVICES = /sbin/service , /sbin/chkconfig , /bin/hostname , /sbin/shutdown

For more information about /etc/sudoers, visit the [official documentation][5].

#### Adding users to a group ####

To add users to groups using Augeas, you might want to add the new user either after the gid field or after the last user. We'll use group SVN for the sake of this example. This can be achieved by using the following command:

In Puppet:

    augeas { 'augeas_mod_group:
        context => '/files/etc/group', # The target file is /etc/group
        changes => [
            "ins user after svn/*[self::gid or self::user][last()]",
            "set svn/user[last()] john",
        ]
    }

Using augtool:

     augtool> ins user after /files/etc/group/svn/*[self::gid or self::user][last()] augtool> set /files/etc/group/svn/user[last()] john 

### Summary ###

By now, you should have a good idea on how to use Augeas in your Puppet projects. Feel free to experiment with it and definitely go through the official Augeas documentation. It will help you get the idea how to use Augeas properly in your own projects, and it will show you how much time you can actually save by using it.

If you have any questions feel free to post them in the comments and I will do my best to answer them and advise you. 

### Useful Links ###

- [http://www.watzmann.net/categories/augeas.html][6]: contains a lot of tutorials focused on Augeas usage.
- [http://projects.puppetlabs.com/projects/1/wiki/puppet_augeas][7]: Puppet wiki with a lot of practical examples. 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/manage-configurations-linux-puppet-augeas.html

作者：[Jaroslav Štěpánek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/jaroslav
[1]:http://xmodulo.com/2014/08/install-puppet-server-client-centos-rhel.html
[2]:http://augeas.net/
[3]:http://xmodulo.com/manage-configurations-linux-puppet-augeas.html
[4]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[5]:http://augeas.net/docs/references/lenses/files/sudoers-aug.html
[6]:http://www.watzmann.net/categories/augeas.html
[7]:http://projects.puppetlabs.com/projects/1/wiki/puppet_augeas