【toutoudnf@gmail.com】翻译中
Creating TCP / IP (port forwarding) tunnels with SSH: The 8 possible scenarios using OpenSSH
============================================================

The typical function of the [Secure Shell (SSH)][21] network protocol is to access a remote system in terminal mode and execute commands there safely, because the data is encrypted. In addition, through this secure data connection, it is possible to create tunnels (  _port forwarding_  ) between the connected ends so that the TCP / IP connections are channeled through the SSH connection so that we can get away with any Firewall or port blocking whenever we have the possibility to connect with SSH.

As this topic is very much addressed by the entire network:

*   [Wikipedia: SSH Tunneling][12]

*   [O’Reilly: Using SSH Tunneling][13]

*   [Ssh.com: Tunneling Explained][14]

*   [Ssh.com: Port Forwarding][15]

*   [SecurityFocus: SSH Port Forwarding][16]

*   [Red Hat Magazine: SSH Port Forwarding][17]

In this entry we will not go into the details of port forwarding, but pretend to be a  _cheat sheet_ , a quick reference (  _cheat sheet_  ) on how to forward TCP ports with [OpenSSH][22] in the 8 different scenarios that can be given. Other SSH clients such as [PuTTY][23] also allow port forwarding, but the configuration will be done with a graphical interface. We will focus on OpenSSH.

In the following examples and situations we will assume that we have an external network and an internal network and between both networks, the only possible connection is an SSH connection between the node of the external external  _network1_  and the node of the internal internal  _network1_  . The  _external node2_  is on the external network and has full connectivity with  _external1_ . The node  _interno2_  is on the internal network and has full connectivity with  _interno1_ .

![SSH tunnels: no tunnel](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_sin_tunel.png)

Table of Contents [[hide][1]]

*   [1 Scenario 1: Use on external1 a TCP service offered by internal1 (Local port forwarding / bind_address = localhost / host = localhost)][2]

*   [2 Scenario 2: Use on external2 a TCP service offered by internal1 (Local port forwarding / bind_address = 0.0.0.0 / host = localhost)][3]

*   [3 Scenario 3: Use in internal1 a TCP service offered by external1 (Remote port forwarding / bind_address = localhost / host = localhost)][4]

*   [4 Scenario 4: Use in internal2 a TCP service offered by external1 (Remote port forwarding / bind_address = 0.0.0.0 / host = localhost)][5]

*   [5 Scenario 5: Use in external1 a TCP service offered by internal2 (Local port forwarding / bind_address = localhost / host = internal2)][6]

*   [6 Scenario 6: Use in internal1 a TCP service offered by external2 (Remote port forwarding / bind_address = localhost / host = external2)][7]

*   [7 Scenario 7: Use in external2 a TCP service offered by internal2 (Local port forwarding / bind_address = 0.0.0.0 / host = internal2)][8]

*   [8 Scenario 8: Use in internal2 a TCP service offered by external2 (Remote port forwarding / bind_address = 0.0.0.0 / host = external2)][9]

#### Scenario 1: Use on  _external1_  a TCP service offered by  _internal1_  (Local port forwarding / bind_address = localhost / host = localhost)

The system  _externo1_  can be connected to the system  _interno1 _ through OpenSSH and also wants to connect to the system server VNC (port 5900)  _interno1_ :

![SSH Tunnels: Scenario 1](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_1.png)

We will achieve this with this command:

```
External1  $  ssh  -L  7900:  localhost:  5900  user  @  internal1 
```

Now in the  _external system1_  we can verify that port 7900 is waiting for connections:

```
External1  $  netstat  -ltn
Active Internet connections  (only servers)
Proto Recv-Q  Send-Q  Local Address Foreign Address State      
...
Tcp  0  0  127.0.0.1:7900  0.0.0.0:*  LISTEN  
...
```

We only need to execute now on  _external1_  :

```
External1  $  vncviewer localhost  ::  7900 
```

To connect to the  _internal_  VNC  _server1_ .

Note: This way to change the port is not documented in the 

```
<a  href="http://www.realvnc.com/products/free/4.1/man/vncviewer.html">man vncviewer</a>
```

. Appears in: [About VNCViewer configuration of the output TCP port][18]. This is also how [the TightVNC vncviewer][19] does.

#### Scenario 2: Use on  _external2_  a TCP service offered by  _internal1_  (Local port forwarding / bind_address = 0.0.0.0 / host = localhost)

This time we start from a situation similar to the previous one but now we want it to be  _external2_  who connects to the  _internal_  VNC  _server1_ :

![SSH Tunnels: Scenario 2](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_2.png)

The appropriate command would be this:

```
External1  $  ssh  -L  0.0.0.0:7900:localhost:5900  user  @  internal1 
```

It is similar to the first scenario; But in that, if we look at the output of 

```
netstat
```

the port, 7900 had been associated with the address of localhost, at 127.0.0.1, so only local processes could connect to it. This time we specify that the port is associated with 0.0.0.0, so that the system accepts connections to any local IP of the machine:

```
External1  $  netstat  -ltn
Active Internet connections  (only servers)
Proto Recv-Q  Send-Q  Local Address Foreign Address State      
...
Tcp  0  0  0.0.0.0:7900  0.0.0.0:*  LISTEN
... 
```

So now, from  _external2_  , we can execute:

```
External2  $  vncviewer external1  ::  7900 
```

To connect to the  _internal_  VNC  _server1_ .

Instead of specifying the IP 

```
0.0.0.0 
```

, we could also use the option 

```
-g
```

(  _Allows remote hosts to connect to local forwarded ports_  ) like this:

```
External1  $  ssh  -g  -L  7900:  localhost:  5900  user  @  internal1 
```

With exactly the same result as the previous command:

```
External1  $  ssh  -L  0.0.0.0:7900:localhost:5900  user  @  internal1 
```

On the other hand, if we had wanted to restrict the connection to only one of the local IPs of the system, we could have been more specific:

```
External1 $ ssh -L 192.168.24.80:7900:localhost:5900 user @ internal1

External1 $ netstat -ltn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address Foreign Address State      
...  
Tcp 0 0 192.168.24.80:7900 0.0.0.0:* LISTEN
...
```

#### Scenario 3: Use in  _internal1_  a TCP service offered by  _external1_  (Remote port forwarding / bind_address = localhost / host = localhost)

In the first scenario, it was the system itself with the SSH server that offered another service. Now the system with the SSH client is the one that offers the service that the system with the SSH server wants to use:

![SSH Tunnels: Scenario 3](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_3.png)

The command we will use is the same as in the first scenario by changing the parameter 

``` 
-L 
```

to 

```
-R 
```

:

```
External1  $  ssh  -R  7900:  localhost:  5900  user  @  internal1 
```


And now where we will see that we have port 7900 listening is in  _interno1_ :

```
Internal1 $ netstat -lnt
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address Foreign Address State      
...  
Tcp 0 0 127.0.0.1:7900 0.0.0.0:* LISTEN
...
```

So now from  _internal1_  we can use the VNC server from  _external1_  like this:

```
Internal1  $  vncviewer localhost  ::  7900 
```


#### Scenario 4: Use in  _internal2_  a TCP service offered by  _external1_  (Remote port forwarding / bind_address = 0.0.0.0 / host = localhost)

Similar to the third scenario but now, as we did in the second scenario, we will associate the forwarded port with the IP 

```
0.0.0.0 
```

so that other nodes can use the service:

![SSH Tunnels: Scenario 4](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_4-1.png)

The appropriate command is:

```
External1  $  ssh  -R  0.0.0.0:7900:localhost:5900  user  @  internal1 
```


However, it is important to understand that, for security reasons, this will not work if in the configuration of the SSH server we do not modify the value of the parameter 

```
GatewayPorts 
```


that by default is 

```
no 
```

:

```
GatewayPorts 
```

> Specifies whether remote hosts are allowed to connect to ports forwarded for the client. By default, sshd(8) binds remote port forwardings to the loopback address. This prevents other remote hosts from connecting to forwarded ports. GatewayPorts can be used to specify that sshd should allow remote port forwardings to bind to non-loopback addresses, thus allowing other hosts to connect. The argument may be “no” to force remote port forwardings to be available to the local host only, “yes” to force remote port forwardings to bind to the wildcard address, or “clientspecified” to allow the client to select the address to which the forwarding is bound. The default is “no”.



If we do not have the possibility to modify the configuration of the server, we will not be able to use this type of port forwarding. At least not simply because, if there are no other impediments, a user can open a port (> 1024) to listen to external connections and forward that request to 

```
localhost:7900 
```


. This could be done, for example, with [netcat][24] ( [Debian # 310431: sshd_config should warn about the GatewayPorts workaround.][25] )

So we 

```
/etc/ssh/sshd_config 
```

will add:

```
GatewayPorts clientspecified 
```


After which we will have to reread the configuration with ” 

```
sudo  /etc/init.d/ssh reload 
```


” (Debian and Ubuntu).

We verify that  _internal1_  is listening for requests from all IPs:

```
Internal1 $ netstat -ltn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address Foreign Address State      
...    
Tcp 0 0 0.0.0.0:7900 0.0.0.0:* LISTEN
...
```

And we can already use the VNC service from  _internal2_  :

```
Internal2 $ internal vncviewer1 :: 7900
```


#### Scenario 5: Use in  _external1_  a TCP service offered by  _internal2_  (Local port forwarding / bind_address = localhost / host = internal2)

![SSH Tunnels: Scenario 5](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_5.png)

In this scenario we will use the following command:

```
External1 $ ssh -L 7900: internal2: 5900 user @ internal1
```

And we will access the service by running the command in  _external1_ :

```
External1 $ vncviewer localhost :: 7900
```

#### Scenario 6: Use in  _internal1_  a TCP service offered by  _external2_  (Remote port forwarding / bind_address = localhost / host = external2)

![SSH Tunnels: Scenario 6](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_6.png)

In this scenario we will use the following command:

```
External1  $  ssh  -R  7900:  external2:  5900  user  @  internal1 
```

And we will access the service by running the command in  _internal1_ :

```
Internal1  $  vncviewer localhost  ::  7900 
```

#### Scenario 7: Use in  _external2_  a TCP service offered by  _internal2_  (Local port forwarding / bind_address = 0.0.0.0 / host = internal2)

![SSH Tunnels: Scenario 7](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_7.png)

In this scenario we will use the following command:

```
External1  $  ssh  -L  0.0.0.0:7900:internal2:5900  user  @  internal1 
```


Or alternatively:

```
External1  $  ssh  -g  -L  7900:  internal2:  5900  user  @  internal1 
```


And we will access the service by running the command in  _external2_  :

```
External2  $  vncviewer external1  ::  7900 
```

#### Scenario 8: Use in  _internal2_  a TCP service offered by  _external2_  (Remote port forwarding / bind_address = 0.0.0.0 / host = external2)

![SSH Tunnels: Scenario 8](https://wesharethis.com/wp-content/uploads/2017/07/ssh_tunnel_8.png)

In this scenario we will use the following command:

```
External1  $  ssh  -R  0.0.0.0:7900:external2:5900  user  @  internal1 
```

The SSH server must be configured with ” 

```
GatewayPorts clientspecified 
```

”, as we have seen in scenario 4.

And we will access the service by running the command in  _internal2_ :

```
Internal2  $  internal vncviewer1  ::  7900 
```

If we want to create many tunnels at once, it may be convenient to use a configuration file instead of composing a very long command. Let’s imagine that our only entry point to a network is through SSH and we need to create tunnels to access the different servers in the network via SSH, VNC or [Remote Desktop][26]. We could compose a file like the following with all the redirects that we will need (in relation to the mentioned SOCKS server.

```
# SOCKS server
DynamicForward 1080

# SSH redirects
LocalForward 2221 serverlinux1: 22
LocalForward 2222 serverlinux2: 22
LocalForward 2223 172.16.23.45:22
LocalForward 2224 172.16.23.48:22

# RDP redirects for Windows systems
LocalForward 3391 serverwindows1: 3389
LocalForward 3392 serverwindows2: 3389

# VNC redirects for systems with "vncserver"
LocalForward 5902 serverlinux1: 5901
LocalForward 5903 172.16.23.45:5901
```


And we only need to execute this to create all the redirects:

```
External1  $  ssh  -F  $  HOME  /  redirects user  @  internal1 
```

--------------------------------------------------------------------------------

via: https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/

作者：[ Ahmad][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://wesharethis.com/author/ahmad/
[1]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#
[2]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_1_Use_onexternal1a_TCP_service_offered_byinternal1Local_port_forwarding_bind_address_localhost_host_localhost
[3]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_2_Use_onexternal2a_TCP_service_offered_byinternal1Local_port_forwarding_bind_address_0000_host_localhost
[4]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_3_Use_ininternal1a_TCP_service_offered_byexternal1Remote_port_forwarding_bind_address_localhost_host_localhost
[5]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_4_Use_ininternal2a_TCP_service_offered_byexternal1Remote_port_forwarding_bind_address_0000_host_localhost
[6]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_5_Use_inexternal1a_TCP_service_offered_byinternal2Local_port_forwarding_bind_address_localhost_host_internal2
[7]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_6_Use_ininternal1a_TCP_service_offered_byexternal2Remote_port_forwarding_bind_address_localhost_host_external2
[8]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_7_Use_inexternal2a_TCP_service_offered_byinternal2Local_port_forwarding_bind_address_0000_host_internal2
[9]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#Scenario_8_Use_ininternal2a_TCP_service_offered_byexternal2Remote_port_forwarding_bind_address_0000_host_external2
[10]:https://wesharethis.com/author/ahmad/
[11]:https://wesharethis.com/2017/07/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/#comments
[12]:http://en.wikipedia.org/wiki/Tunneling_protocol#SSH_tunneling
[13]:http://www.oreillynet.com/pub/a/wireless/2001/02/23/wep.html
[14]:http://www.ssh.com/support/documentation/online/ssh/winhelp/32/Tunneling_Explained.html
[15]:http://www.ssh.com/support/documentation/online/ssh/adminguide/32/Port_Forwarding.html
[16]:http://www.securityfocus.com/infocus/1816
[17]:http://magazine.redhat.com/2007/11/06/ssh-port-forwarding/
[18]:http://www.realvnc.com/pipermail/vnc-list/2006-April/054551.html
[19]:http://www.tightvnc.com/vncviewer.1.html
[20]:https://bufferapp.com/add?url=https%3A%2F%2Fwesharethis.com%2F2017%2F07%2Fcreating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh%2F&text=Creating%20TCP%20/%20IP%20(port%20forwarding)%20tunnels%20with%20SSH:%20The%208%20possible%20scenarios%20using%20OpenSSH
[21]:http://en.wikipedia.org/wiki/Secure_Shell
[22]:http://www.openssh.com/
[23]:http://www.chiark.greenend.org.uk/~sgtatham/putty/
[24]:http://en.wikipedia.org/wiki/Netcat
[25]:http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=310431
[26]:http://en.wikipedia.org/wiki/Remote_Desktop_Services
