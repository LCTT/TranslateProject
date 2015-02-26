通过 SaltStack 管理服务器配置
================================================================================
![](http://techarena51.com/wp-content/uploads/2015/01/SaltStack+logo+-+black+on+white.png)

我在搜索[Puppet][1]的替代品时，偶然间碰到了Salt。我喜欢puppet，但是我又爱上Salt了:)。我发现Salt在配置和使用上都要比Puppet简单，当然这只是一家之言，你大可不必介怀。另外一个爱上Salt的理由是，它可以让你从命令行管理服务器配置，比如：

要通过Salt来更新所有服务器，你只需运行以下命令即可

    salt '*' pkg.upgrade


##安装SaltStack到Linux上##

如果你是在CentOS 6/7上安装的话，那么Salt可以通过EPEL仓库获取到。而对于Pi和Ubuntu Linux用户，你可以从[这里][2]添加Salt仓库。Salt是基于python的，所以你也可以使用‘pip’来安装，但是你得用yum-utils或是其它包管理器来自己处理它的依赖关系。

Salt采用服务器-客户端模式，服务器端称为领主，而客户端则称为下属。

###安装并配置Salt领主###

    [root@salt-master~]# yum install salt-master

Salt配置文件位于/etc/salt和/srv/salt。Salt虽然可以开箱即用，但我还是建议你将日志配置得更详细点，以方便日后排除故障。

    [root@salt-master ~]# vim /etc/salt/master
    # 默认是warning，修改如下
    log_level: debug
    log_level_logfile: debug
    
    [root@salt-master ~]# systemctl start salt-master

###安装并配置Salt下属###

    [root@salt-minion~]#yum install salt-minion
    
    # 添加你的Salt领主的主机名
    [root@salt-minion~]#vim /etc/salt/minion
    master: salt-master.com
    # 启动下属
    [root@salt-minion~] systemctl start salt-minion

在启动时，下属客户机会生成一个密钥和一个id。然后，它会连接到Salt领主服务器并验证自己的身份。Salt领主服务器在允许下属客户机下载配置之前，必须接受下属的密钥。

###在Salt领主服务器上列出并接受密钥###

    # 列出所有密钥
    [root@salt-master~] salt-key -L
    Accepted Keys:
    Unaccepted Keys:
    minion.com
    Rejected Keys:
    
    # 使用id 'minion.com'命令接受密钥
    [root@salt-master~]salt-key -a minion.com
    
    [root@salt-master~] salt-key -L
    Accepted Keys:
    minion.com
    Unaccepted Keys:
    Rejected Keys:

在接受下属客户机的密钥后，你可以使用‘salt’命令来立即获取信息。

##Salt命令行实例##

    # 检查下属是否启动并运行
    [root@salt-master~]  salt 'minion.com' test.ping
    minion.com:
        True
    # 在下属客户机上运行shell命令
     [root@salt-master~]#  salt 'minion.com' cmd.run 'ls -l'
    minion.com:
        total 2988
        -rw-r--r--. 1 root root 1024 Jul 31 08:24 1g.img
        -rw-------. 1 root root     940 Jul 14 15:04 anaconda-ks.cfg
        -rw-r--r--. 1 root root 1024  Aug 14 17:21 test
    # 安装/更新所有服务器上的软件
    [root@salt-master ~]# salt '*' pkg.install git

salt命令需要一些组件来发送信息，其中之一是下属客户机的id，而另一个是下属客户机上要调用的函数。

在第一个实例中，我使用‘test’模块的‘ping’函数来检查系统是否启动。该函数并不是真的实施一次ping，它仅仅是在下属客户机作出回应时返回‘真’。

‘cmd.run’用于执行远程命令，而‘pkg’模块包含了包管理的函数。本文结尾提供了全部内建模块的列表。

###颗粒实例###

Salt使用一个名为**颗粒（Grains）**的界面来获取系统信息。你可以使用颗粒在指定属性的系统上运行命令。

    [root@vps4544 ~]# salt -G 'os:Centos' test.ping
    minion:
        True

更多颗粒实例，请访问http://docs.saltstack.com/en/latest/topics/targeting/grains.html

##通过状态文件系统进行包管理##

为了使软件配置自动化，你需要使用状态系统，并创建状态文件。这些文件使用YAML格式和python字典、列表、字符串以及编号来构成数据结构。将这些文件从头到尾研读一遍，这将有助于你更好地理解它的配置。

###VIM状态文件实例###

    [root@salt-master~]# vim /srv/salt/vim.sls
    vim-enhanced:
      pkg.installed
    /etc/vimrc:
      file.managed:
        - source: salt://vimrc
        - user: root
        - group: root
        - mode: 644

该文件的第一和第三行称为状态id，它们必须包含有需要管理的包或文件的确切名称或路径。在状态id之后是状态和函数声明，‘pkg’和‘file’是状态声明，而‘installed’和‘managed’是函数声明。函数接受参数，用户、组、模式和源都是函数‘managed’的参数。

要将该配置应用到下属客户端，请移动你的‘vimrc’文件到‘/src/salt’，然后运行以下命令。

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

你也可以添加依赖关系到你的配置中。
    
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

这里的‘require’声明是必须的，它在‘service’和‘pkg’状态之间创建依赖关系。该声明将首先检查包是否安装，然后运行服务。

但是，我更偏向于使用‘watch’声明，因为它也可以检查文件是否修改和重启服务。

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

在单一目录中维护所有的配置文件是一项复杂的大工程，因此，你可以创建子目录并在其中添加配置文件init.sls文件。

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

###Top文件和环境###

top文件（top.sls）是用来定义你的环境的文件，它允许你映射下属客户机到包，默认环境是‘base’。你需要定义在基本环境下，哪个包会被安装到哪台服务器。

如果对于一台特定的下属客户机而言，有多个环境，并且有多于一个的定义，那么默认情况下，基本环境将取代其它环境。

要定义环境，你需要将它添加到领主配置文件的‘file_roots’指针。

    [root@salt-master ~]# vim /etc/salt/master
    file_roots:
      base:
        - /srv/salt
      dev:
        - /srv/salt/dev

现在，添加一个top.sls文件到/src/salt。

    [root@salt-master ~]# vim /srv/salt/top.sls
    base:
      '*':
        - vim
      'minion.com':
         - ssh

应用top文件配置

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

下属客户机将下载top文件并搜索用于它的配置，领主服务器也会将配置应用到所有下属客户机。

---

这仅仅是一个Salt的简明教程，如果你想要深入学习并理解，你可以访问下面的链接。如果你已经在使用Salt，那么请告诉我你的建议和意见吧。

更新： [Foreman][3] 已经通过[插件][4]支持salt。

阅读链接

- http://docs.saltstack.com/en/latest/ref/states/top.html#how-top-files-are-compiled
- http://docs.saltstack.com/en/latest/topics/tutorials/states_pt1.html
- http://docs.saltstack.com/en/latest/ref/states/highstate.html#state-declaration

颗粒

- http://docs.saltstack.com/en/latest/topics/targeting/grains.html

Salt模块列表

Salt和Puppet的充分比较

- https://mywushublog.com/2013/03/configuration-management-with-salt-stack/

内建执行模块的完全列表

- http://docs.saltstack.com/en/latest/ref/modules/all/

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/getting-started-with-saltstack/

作者：[Leo G][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://techarena51.com/index.php/a-simple-way-to-install-and-configure-a-puppet-server-on-linux/
[2]:http://docs.saltstack.com/en/latest/topics/installation/index.html
[3]:http://techarena51.com/index.php/using-foreman-opensource-frontend-puppet/
[4]:https://github.com/theforeman/foreman_salt/wiki
