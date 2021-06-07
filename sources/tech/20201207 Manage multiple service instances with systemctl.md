[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage multiple service instances with systemctl)
[#]: via: (https://opensource.com/article/20/12/multiple-service-instances-systemctl)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Manage multiple service instances with systemctl
======
Running several instances of a service on a single host gets easier with
a systemd hack.
![People work on a computer server with devices][1]

Services, services, services. A service is a huge part of computing. You're reading this article on a service. Your computer is running services. The internet is filled with them.

### About systemctl

On Linux, the standard way of running and managing services is through the systemd utility and the command `systemctl`. Its usage is fairly simple: you just need to know the name of the service you want to manage, then you can use this command to start or stop the service, check its status, or do other functions:


```
# systemctl start httpd

# systemctl stop httpd

# systemctl status httpd
```

### Unit files

A service is defined in a file called a unit file. They are generally located in the directory `/usr/lib/systemd/system`. Here's a sample list:


```
# ls /usr/lib/systemd/system
 auditd.service                              multi-user.target                    sys-kernel-debug.mount
 [autovt@.service][2]                             multi-user.target.wants              sys-kernel-tracing.mount
 basic.target                                NetworkManager-dispatcher.service    syslog.socket
 basic.target.wants                          NetworkManager.service               syslog.target.wants
 blk-availability.service                    NetworkManager-wait-online.service  
```

Sometimes you need to run more than one instance of a service on a single host. For example, if you are maintaining websites for several clients, security regulations demand that each client has its own individual instance. This means you need to run a new Apache HTTP service for each, but having a lot of services can be tough to manage. If you have 10 different customers, you would have to create 10 separate unit files to manage them. Fortunately, there is a better way to handle multiple instances of a service.

### The @ symbol

Notice that some of the unit files have an @ symbol in their name. This symbol has an interesting significance. As a matter of fact, after installing Apache HTTP Server, you may notice several service unit files, including one that has the @ symbol in its name—`httpd@.service`.

I will show you how this can make a system administrator's life a little easier, using the Apache HTTP Server for this example:


```
# dnf -y install httpd

# cd /usr/lib/systemd/system
# ls -d http*
httpd.service  [httpd@.service][3]  httpd.service.d  httpd.socket  httpd.socket.d
```

The @ symbol indicates that a substitution will be made. Systemd will take whatever you type after it and replace the variable `%i` inside the service unit file. The variable can be seen in this excerpt of the `httpd@.service` file:


```
[Unit]
Description=The Apache HTTP Server
After=network.target remote-fs.target nss-lookup.target
Documentation=man:[httpd@.service][3](8)

[Service]
Type=notify
Environment=LANG=C
Environment=HTTPD_INSTANCE=%i
ExecStartPre=/bin/mkdir -m 710 -p /run/httpd/instance-%i
ExecStartPre=/bin/chown root.apache /run/httpd/instance-%i
ExecStartPre=/bin/mkdir -m 700 -p /var/lib/httpd/instance-%i
ExecStartPre=/bin/chown apache.apache /var/lib/httpd/instance-%i
ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND -f conf/%i.conf
ExecReload=/usr/sbin/httpd $OPTIONS -k graceful -f conf/%i.conf
```

Note that the default httpd unit file, `httpd.service`, does not have the @ symbol in its name and looks different. It is used for a single basic default instance of the Apache HTTP server.

### Run multiple instances

To run multiple instances using this special unit file, each one needs a unique name. Suppose you have two clients, The Little Bank and The Big Bank. Name the instances littlebank and bigbank. To manage one, just append its name after the @ symbol. Start each instance with the appropriate command:

  * littlebank: `systemctl start httpd@littlebank`
  * bigbank: `systemctl start httpd@bigbank`



Keep in mind that most services need certain configurations to avoid conflicts between different instances. I will not cover all of them here, but Apache needs several things, including unique listen port numbers, PID files, and document roots.

I'll demonstrate by trying to start the littlebank instance. I expect it to fail, but it will provide a useful status message:


```
# systemctl start httpd@littlebank

# systemctl status httpd@littlebank
● [httpd@littlebank.service][4] \- The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd@.service; disabled; vendor preset: disabled)
     Active: failed (Result: exit-code) since Tue 2020-11-10 11:41:20 EST; 1min 58s ago
       Docs: man:[httpd@.service][3](8)
    Process: 2205 ExecStartPre=/bin/mkdir -m 710 -p /run/httpd/instance-littlebank (code=exited, status=0/SUCCESS)
    Process: 2207 ExecStartPre=/bin/chown root.apache /run/httpd/instance-littlebank (code=exited, status=0/SUCCESS)
    Process: 2208 ExecStartPre=/bin/mkdir -m 700 -p /var/lib/httpd/instance-littlebank (code=exited, status=0/SUCCESS)
    Process: 2209 ExecStartPre=/bin/chown apache.apache /var/lib/httpd/instance-littlebank (code=exited, status=0/SUCCESS)
    Process: 2210 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND -f conf/littlebank.conf (code=exited, status=1/FAILURE)
   Main PID: 2210 (code=exited, status=1/FAILURE)
        CPU: 26ms

Nov 10 11:41:20 localhost.localdomain systemd[1]: Starting The Apache HTTP Server...
Nov 10 11:41:20 localhost.localdomain httpd[2210]: httpd: Could not open configuration file /etc/httpd/conf/littlebank.conf&gt;
Nov 10 11:41:20 localhost.localdomain systemd[1]: [httpd@littlebank.service][4]: Main process exited, code=exited, status=1/FAIL&gt;
Nov 10 11:41:20 localhost.localdomain systemd[1]: [httpd@littlebank.service][4]: Failed with result 'exit-code'.
Nov 10 11:41:20 localhost.localdomain systemd[1]: Failed to start The Apache HTTP Server.
```

You can see that systemd correctly substitutes the instance name in place of the `%i` variable in the unit file. However, Apache fails to start because it could not open a configuration file. So, now I'll set up the instances to include creating the necessary configuration files (`littlebank.conf` and `bigbank.conf`) in `/etc/httpd/conf/`:


```
# ls /etc/httpd/conf
bigbank.conf  httpd.conf  littlebank.conf
```

Now you can manage each instance with `systemctl`. Issue `start` and `status` commands to each. I've shortened the output to the most relevant details:


```
# systemctl start httpd@bigbank
# systemctl start httpd@littlebank

# systemctl status httpd@bigbank
● [httpd@bigbank.service][5] \- The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd@.service; disabled; vendor preset: disabled)
     Active: active (running) since Tue 2020-11-10 12:26:06 EST; 56min ago
     
# systemctl status httpd@littlebank
● [httpd@littlebank.service][4] \- The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd@.service; disabled; vendor preset: disabled)
     Active: active (running) since Tue 2020-11-10 12:25:58 EST; 55min ago
```

Here is the process view of these instances. There is more than one because Apache is forking server processes, which it normally does:


```
# pgrep -a httpd
2834 /usr/sbin/httpd -DFOREGROUND -f conf/littlebank.conf
2835 /usr/sbin/httpd -DFOREGROUND -f conf/littlebank.conf
2836 /usr/sbin/httpd -DFOREGROUND -f conf/littlebank.conf
3061 /usr/sbin/httpd -DFOREGROUND -f conf/bigbank.conf
3062 /usr/sbin/httpd -DFOREGROUND -f conf/bigbank.conf
3064 /usr/sbin/httpd -DFOREGROUND -f conf/bigbank.conf
```

### Put it to use

This small systemd feature is very useful when you need many instances of a service. I hope you will be able to put it to good use in your work.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/multiple-service-instances-systemctl

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: mailto:autovt@.service
[3]: mailto:httpd@.service
[4]: mailto:httpd@littlebank.service
[5]: mailto:httpd@bigbank.service
