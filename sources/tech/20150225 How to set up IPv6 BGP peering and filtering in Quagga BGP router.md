How to set up IPv6 BGP peering and filtering in Quagga BGP router
================================================================================
In the previous tutorials, we demonstrated how we can set up a [full-fledged BGP router][1] and configure [prefix filtering][2] with Quagga. In this tutorial, we are going to show you how we can set up IPv6 BGP peering and advertise IPv6 prefixes through BGP. We will also demonstrate how we can filter IPv6 prefixes advertised or received by using prefix-list and route-map features.

### Topology ###

For this tutorial, we will be considering the following topology.

![](https://farm9.staticflickr.com/8599/15944659374_1c65852df2_c.jpg)

Service providers A and B want to establish an IPv6 BGP peering between them. Their IPv6 and AS information is as follows.

- Peering IP block: 2001:DB8:3::/64
- Service provider A: AS 100, 2001:DB8:1::/48
- Service provider B: AS 200, 2001:DB8:2::/48 

### Installing Quagga on CentOS/RHEL ###

If Quagga has not already been installed, we can install it using yum.

    # yum install quagga 

On CentOS/RHEL 7, the default SELinux policy, which prevents /usr/sbin/zebra from writing to its configuration directory, can interfere with the setup procedure we are going to describe. Thus we want to disable this policy as follows. Skip this step if you are using CentOS/RHEL 6.

    # setsebool -P zebra_write_config 1 

### Creating Configuration Files ###

After installation, we start the configuration process by creating the zebra/bgpd configuration files.

    # cp /usr/share/doc/quagga-XXXXX/zebra.conf.sample /etc/quagga/zebra.conf
    # cp /usr/share/doc/quagga-XXXXX/bgpd.conf.sample /etc/quagga/bgpd.conf

Next, enable auto-start of these services.

**On CentOS/RHEL 6:**

    # service zebra start; service bgpd start
    # chkconfig zebra on; chkconfig bgpd on 

**On CentOS/RHEL 7:**

    # systemctl start zebra; systemctl start bgpd
    # systemctl enable zebra; systmectl enable bgpd 

Quagga provides a built-in shell called vtysh, whose interface is similar to those of major router vendors such as Cisco or Juniper. Launch vtysh command shell:

    # vtysh

The prompt will be changed to:

    router-a#

or

    router-b# 

In the rest of the tutorials, these prompts indicate that you are inside vtysh shell of either router.

### Specifying Log File for Zebra ###

Let's configure the log file for Zebra, which will be helpful for debugging.

First, enter the global configuration mode by typing:

    router-a# configure terminal 

The prompt will be changed to:

    router-a(config)#

Now specify log file location. Then exit the configuration mode:

    router-a(config)# log file /var/log/quagga/quagga.log
    router-a(config)# exit 

Save configuration permanently by:

    router-a# write 

### Configuring Interface IP Addresses ###

Let's now configure the IP addresses for Quagga's physical interfaces.

First, we check the available interfaces from inside vtysh.

    router-a# show interfaces 

----------

    Interface eth0 is up, line protocol detection is disabled
    ## OUTPUT TRUNCATED ###
    Interface eth1 is up, line protocol detection is disabled
    ## OUTPUT TRUNCATED ##

Now we assign necessary IPv6 addresses.

    router-a# conf terminal
    router-a(config)# interface eth0
    router-a(config-if)# ipv6 address 2001:db8:3::1/64
    router-a(config-if)# interface eth1
    router-a(config-if)# ipv6 address 2001:db8:1::1/64

We use the same method to assign IPv6 addresses to router-B. I am summarizing the configuration below.

    router-b# show running-config 

----------

    interface eth0
    ipv6 address 2001:db8:3::2/64
    
    interface eth1
    ipv6 address 2001:db8:2::1/64

Since the eth0 interface of both routers are in the same subnet, i.e., 2001:DB8:3::/64, you should be able to ping from one router to another. Make sure that you can ping successfully before moving on to the next step.

    router-a# ping ipv6 2001:db8:3::2 

----------

    PING 2001:db8:3::2(2001:db8:3::2) 56 data bytes
    64 bytes from 2001:db8:3::2: icmp_seq=1 ttl=64 time=3.20 ms
    64 bytes from 2001:db8:3::2: icmp_seq=2 ttl=64 time=1.05 ms

### Phase 1: IPv6 BGP Peering ###

In this section, we will configure IPv6 BGP between the two routers. We start by specifying BGP neighbors in router-A.

    router-a# conf t
    router-a(config)# router bgp 100
    router-a(config-router)# no auto-summary
    router-a(config-router)# no synchronization
    router-a(config-router)# neighbor 2001:DB8:3::2 remote-as 200

Next, we define the address family for IPv6. Within the address family section, we will define the network to be advertised, and activate the neighbors as well.

    router-a(config-router)# address-family ipv6
    router-a(config-router-af)# network 2001:DB8:1::/48
    router-a(config-router-af)# neighbor 2001:DB8:3::2 activate

We will go through the same configuration for router-B. I'm providing the summary of the configuration.

    router-b# conf t
    router-b(config)# router bgp 200
    router-b(config-router)# no auto-summary
    router-b(config-router)# no synchronization
    router-b(config-router)# neighbor 2001:DB8:3::1 remote-as 100
    router-b(config-router)# address-family ipv6
    router-b(config-router-af)# network 2001:DB8:2::/48
    router-b(config-router-af)# neighbor 2001:DB8:3::1 activate

If all goes well, an IPv6 BGP session should be up between the two routers. If not already done, please make sure that necessary ports (TCP 179) are [open in your firewall][3].

We can check IPv6 BGP session information using the following commands.

**For BGP summary:**

    router-a# show bgp ipv6 unicast summary 

**For BGP advertised routes:**

    router-a# show bgp ipv6 neighbors <neighbor-IPv6-address> advertised-routes 

**For BGP received routes:**

    router-a# show bgp ipv6 neighbors <neighbor-IPv6-address> routes 

![](https://farm8.staticflickr.com/7317/16379555088_6e29cb6884_b.jpg)

### Phase 2: Filtering IPv6 Prefixes ###

As we can see from the above output, the routers are advertising their full /48 IPv6 prefix. For demonstration purposes, we will consider the following requirements.

- Router-B will advertise one /64 prefix, one /56 prefix, as well as one full /48 prefix.
- Router-A will accept any IPv6 prefix owned by service provider B, which has a netmask length between /56 and /64. 

We are going to filter the prefix as required, using prefix-list and route-map in router-A.

![](https://farm8.staticflickr.com/7367/16381297417_6549218289_c.jpg)

#### Modifying prefix advertisement for Router-B ####

Currently, router-B is advertising only one /48 prefix. We will modify router-B's BGP configuration so that it advertises additional /56 and /64 prefixes as well.

    router-b# conf t
    router-b(config)# router bgp 200
    router-b(config-router)# address-family ipv6
    router-b(config-router-af)# network 2001:DB8:2::/56
    router-b(config-router-af)# network 2001:DB8:2::/64

We will verify that all prefixes are received at router-A.

![](https://farm9.staticflickr.com/8598/16379761980_7c083ae977_b.jpg)

Great! As we are receiving all prefixes in router-A, we will move forward and create prefix-list and route-map entries to filter these prefixes.

#### Creating Prefix-List ####

As described in the [previous tutorial][4], prefix-list is a mechanism that is used to match an IP address prefix with a subnet length. Once a matched prefix is found, we can apply filtering or other actions to the matched prefix. To meet our requirements, we will go ahead and create a necessary prefix-list entry in router-A.

    router-a# conf t
    router-a(config)# ipv6 prefix-list FILTER-IPV6-PRFX permit 2001:DB8:2::/56 le 64

The above commands will create a prefix-list entry named 'FILTER-IPV6-PRFX' which will match any prefix in the 2001:DB8:2:: pool with a netmask between 56 and 64.

#### Creating and Applying Route-Map ####

Now that the prefix-list entry is created, we will create a corresponding route-map rule which uses the prefix-list entry.

    router-a# conf t
    router-a(config)# route-map FILTER-IPV6-RMAP permit 10
    router-a(config-route-map)# match ipv6 address prefix-list FILTER-IPV6-PRFX

The above commands will create a route-map rule named 'FILTER-IPV6-RMAP'. This rule will permit IPv6 addresses matched by the prefix-list 'FILTER-IPV6-PRFX' that we have created earlier.

Remember that a route-map rule is only effective when it is applied to a neighbor or an interface in a certain direction. We will apply the route-map in the BGP neighbor configuration. As the filter is meant for inbound prefixes, we apply the route-map in the inbound direction.

    router-a# conf t
    router-a(config)# router bgp 100
    router-a(config-router)# address-family ipv6
    router-a(config-router-af)# neighbor 2001:DB8:3::2 route-map FILTER-IPV6-RMAP in

Now when we check the routes received at router-A, we should see only two prefixes that are allowed.

![](https://farm8.staticflickr.com/7337/16379762020_ec2dc39b31_c.jpg)

**Note**: You may need to reset the BGP session for the route-map to take effect.

All IPv6 BGP sessions can be restarted using the following command:

    router-a# clear bgp ipv6 * 

I am summarizing the configuration of both routers so you get a clear picture at a glance.

![](https://farm9.staticflickr.com/8672/16567240165_eee4398dc8_c.jpg)

### Summary ###

To sum up, this tutorial focused on how to set up BGP peering and filtering using IPv6. We showed how to advertise IPv6 prefixes to a neighboring BGP router, and how to filter the prefixes advertised or received are advertised. Note that the process described in this tutorial may affect production networks of a service provider, so please use caution. 

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/ipv6-bgp-peering-filtering-quagga-bgp-router.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://xmodulo.com/centos-bgp-router-quagga.html
[2]:http://xmodulo.com/filter-bgp-routes-quagga-bgp-router.html
[3]:http://ask.xmodulo.com/open-port-firewall-centos-rhel.html
[4]:http://xmodulo.com/filter-bgp-routes-quagga-bgp-router.html