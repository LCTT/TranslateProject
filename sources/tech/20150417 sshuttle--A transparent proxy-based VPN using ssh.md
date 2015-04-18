Translating---geekpi

sshuttle – A transparent proxy-based VPN using ssh
================================================================================
sshuttle allows you to create a VPN connection from your machine to any remote server that you can connect to via ssh, as long as that server has python 2.3 or higher.To work, you must have root access on the local machine, but you can have a normal account on the server.

It's valid to run sshuttle more than once simultaneously on a single client machine, connecting to a different server every time, so you can be on more than one VPN at once.If run on a router, sshuttle can forward traffic for your entire subnet to the VPN.

### Install sshuttle on ubuntu ###

Open the terminal and run the following command

    sudo apt-get install sshuttle

### Using sshuttle ###

#### sshuttle Syntax ####

    sshuttle [options...] [-r [username@]sshserver[:port]] [subnets]

#### Option details ####

-r, —remote=[username@]sshserver[:port]

the remote hostname and optional username and ssh port number to use for connecting to the remote server. For example,example.com, testuser@example.com, testuser@example.com:2222, or example.com:2244.

#### sshuttle Examples ####

From the machine use the following command

    sudo sshuttle -r username@sshserver 0.0.0.0/0 -vv

When it starts, sshuttle creates an ssh session to the server specified by the -r option. If -r is omitted, it will start both its client and server locally, which is sometimes useful for testing.

After connecting to the remote server, sshuttle uploads its (python) source code to the remote end and executes it there. Thus, you don't need to install sshuttle on the remote server, and there are never sshuttle version conflicts between client and server.

#### More Examples From Man page ####

Test locally by proxying all local connections, without using ssh:

    $ sudo sshuttle -v 0/0
    
    Starting sshuttle proxy.
    Listening on (‘0.0.0.0′, 12300).
    [local sudo] Password:
    firewall manager ready.
    c : connecting to server...
    s: available routes:
    s: 192.168.42.0/24
    c : connected.
    firewall manager: starting transproxy.
    c : Accept: ‘192.168.42.106':50035 -> ‘192.168.42.121':139.
    c : Accept: ‘192.168.42.121':47523 -> ‘77.141.99.22':443.
    ...etc...
    ^C
    firewall manager: undoing changes.
    KeyboardInterrupt
    c : Keyboard interrupt: exiting.
    c : SW#8:192.168.42.121:47523: deleting
    c : SW#6:192.168.42.106:50035: deleting

Test connection to a remote server, with automatic hostname and subnet
guessing:

    $ sudo sshuttle -vNHr example.org
    
    Starting sshuttle proxy.
    Listening on (‘0.0.0.0′, 12300).
    firewall manager ready.
    c : connecting to server...
    s: available routes:
    s: 77.141.99.0/24
    c : connected.
    c : seed_hosts: []
    firewall manager: starting transproxy.
    hostwatch: Found: testbox1: 1.2.3.4
    hostwatch: Found: mytest2: 5.6.7.8
    hostwatch: Found: domaincontroller: 99.1.2.3
    c : Accept: ‘192.168.42.121':60554 -> ‘77.141.99.22':22.
    ^C
    firewall manager: undoing changes.
    c : Keyboard interrupt: exiting.
    c : SW#6:192.168.42.121:60554: deleting

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/sshuttle-a-transparent-proxy-based-vpn-using-ssh.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
