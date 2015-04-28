Interface (NICs) Bonding in Linux using nmcli
================================================================================
Today, we'll learn how to perform Interface (NICs) bonding in our CentOS 7.x using nmcli (Network Manager Command Line Interface).

NICs (Interfaces) bonding is a method for linking **NICs** together logically to allow fail-over or higher throughput. One of the ways to increase the network availability of a server is by using multiple network interfaces. The Linux bonding driver provides a method for aggregating multiple network interfaces into a single logical bonded interface. It is a new implementation that does not affect the older bonding driver in linux kernel; it offers an alternate implementation.

**NIC bonding is done to provide two main benefits for us:**

1. **High bandwidth**
1. **Redundancy/resilience**

Now lets configure NICs bonding in CentOS 7. We'll need to decide which interfaces that we would like to configure a Team interface.

run **ip link**  command to check the available interface in the system.

     $ ip link

![ip link](http://blog.linoxide.com/wp-content/uploads/2015/01/ip-link.png)

Here we are using **eno16777736** and **eno33554960** NICs to create a team interface in **activebackup** mode.

Use **nmcli** command to create a connection for the network team interface,with the following syntax.

    # nmcli con add type team con-name CNAME ifname INAME [config JSON]

Where **CNAME** will be the name used to refer the connection ,**INAME** will be the interface name and  **JSON** (JavaScript Object Notation) specifies the runner to be used.**JSON** has the following syntax:

    '{"runner":{"name":"METHOD"}}' 

where **METHOD** is one of the following: **broadcast, activebackup, roundrobin, loadbalance** or **lacp**.

### 1. Creating Team Interface ###

Now let us create the team interface. here is the command we used to create the team interface.

     # nmcli con add type team con-name team0 ifname team0 config '{"runner":{"name":"activebackup"}}'

![nmcli con create](http://blog.linoxide.com/wp-content/uploads/2015/01/nmcli-con-create.png)

run **# nmcli con show** command to verify the team configuration.

    # nmcli con show

![Show Teamed Interace](http://blog.linoxide.com/wp-content/uploads/2015/01/show-team-interface.png)

### 2. Adding Slave Devices ###

Now lets add the slave devices to the master team0. here is the syntax for adding the slave devices.

    # nmcli con add type team-slave con-name CNAME ifname INAME master TEAM

Here we are adding **eno16777736** and **eno33554960** as slave devices for **team0** interface.

    # nmcli con add type team-slave con-name team0-port1 ifname eno16777736 master team0

    # nmcli con add type team-slave con-name team0-port2 ifname eno33554960 master team0

![adding slave devices to team](http://blog.linoxide.com/wp-content/uploads/2015/01/adding-to-team.png)

Verify the connection configuration using  **#nmcli con show** again. now we could see the slave configuration.

    #nmcli con show

![show slave config](http://blog.linoxide.com/wp-content/uploads/2015/01/show-slave-config.png)

### 3. Assigning IP Address ###

All the above command will create the required configuration files under **/etc/sysconfig/network-scripts/**.

Lets assign an IP address to this team0 interface and enable the connection now. Here is the command to perform the IP assignment.

    # nmcli con mod team0 ipv4.addresses "192.168.1.24/24 192.168.1.1"
    # nmcli con mod team0 ipv4.method manual
    # nmcli con up team0

![ip assignment](http://blog.linoxide.com/wp-content/uploads/2015/01/ip-assignment.png)

### 4. Verifying the Bonding ###

Verify the IP address information in **#ip add show team0** command.

    #ip add show team0

![verfiy ip address](http://blog.linoxide.com/wp-content/uploads/2015/01/verfiy-ip-adress.png)

Now lets check the **activebackup** configuration functionality using the **teamdctl** command.

    # teamdctl team0 state

![teamdctl active backup check](http://blog.linoxide.com/wp-content/uploads/2015/01/teamdctl-activebackup-check.png)

Now lets disconnect the active port and check the state again. to confirm whether the active backup configuration is working as expected.

    # nmcli dev dis eno33554960

![disconnect activeport](http://blog.linoxide.com/wp-content/uploads/2015/01/disconnect-activeport.png)

disconnected the active port and now check the state again using **#teamdctl team0 state**.

    # teamdctl team0 state

![teamdctl check activeport disconnect](http://blog.linoxide.com/wp-content/uploads/2015/01/teamdctl-check-activeport-disconnect.png)

Yes its working cool !!  we will connect the disconnected connection back to team0 using the following command.

    #nmcli dev con eno33554960

![nmcli dev connect disconected](http://blog.linoxide.com/wp-content/uploads/2015/01/nmcli-dev-connect-disconected.png)

We have one more command called **teamnl** let us show some options with **teamnl** command.

to check the ports in team0 run the following command.

    # teamnl team0 ports

![teamnl check ports](http://blog.linoxide.com/wp-content/uploads/2015/01/teamnl-check-ports.png)

Display currently active port of **team0**.

    # teamnl team0 getoption activeport

![display active port team0](http://blog.linoxide.com/wp-content/uploads/2015/01/display-active-port-team0.png)

Hurray, we have successfully configured NICs bonding :-) Please share feedback if any.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/interface-nics-bonding-linux/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/