Translating by SPccman
How to configure SNMPv3 on ubuntu 14.04 server
================================================================================
Simple Network Management Protocol (SNMP) is an "Internet-standard protocol for managing devices on IP networks". Devices that typically support SNMP include routers, switches, servers, workstations, printers, modem racks and more.It is used mostly in network management systems to monitor network-attached devices for conditions that warrant administrative attention. SNMP is a component of the Internet Protocol Suite as defined by the Internet Engineering Task Force (IETF). It consists of a set of standards for network management, including an application layer protocol, a database schema, and a set of data objects.[2]

SNMP exposes management data in the form of variables on the managed systems, which describe the system configuration. These variables can then be queried (and sometimes set) by managing applications.

### Why you want to use SNMPv3 ###

Although SNMPv3 makes no changes to the protocol aside from the addition of cryptographic security, it looks much different due to new textual conventions, concepts, and terminology.

SNMPv3 primarily added security and remote configuration enhancements to SNMP.

Security has been the biggest weakness of SNMP since the beginning. Authentication in SNMP Versions 1 and 2 amounts to nothing more than a password (community string) sent in clear text between a manager and agent.[1] Each SNMPv3 message contains security parameters which are encoded as an octet string. The meaning of these security parameters depends on the security model being used.

SNMPv3 provides important security features:

Confidentiality -- Encryption of packets to prevent snooping by an unauthorized source.

Integrity -- Message integrity to ensure that a packet has not been tampered while in transit including an optional packet replay protection mechanism.

Authentication -- to verify that the message is from a valid source.

### Install SNMP server and client in ubuntu ###

Open the terminal and run the following command

    sudo apt-get install snmpd snmp

After installation you need to do the following changes.

### Configuring SNMPv3 in Ubuntu ###

Get access to the daemon from the outside.

The default installation only provides access to the daemon for localhost. In order to get access from the outside open the file /etc/default/snmpd in your favorite editor 

    sudo vi /etc/default/snmpd

Change the following line

From

    SNMPDOPTS='-Lsd -Lf /dev/null -u snmp -g snmp -I -smux,mteTrigger,mteTriggerConf -p /var/run/snmpd.pid'

to

    SNMPDOPTS='-Lsd -Lf /dev/null -u snmp -I -smux -p /var/run/snmpd.pid -c /etc/snmp/snmpd.conf'

and restart snmpd

    sudo /etc/init.d/snmpd restart

### Define SNMPv3 users, authentication and encryption parameters ###

SNMPv3 can be used in a number of ways depending on the “securityLevel” configuration parameter:

noAuthNoPriv -- No authorisation and no encryption, basically no security at all!
authNoPriv -- Authorisation is required but collected data sent over the network is not encrypted.
authPriv -- The strongest form. Authorisation required and everything sent over the network is encrypted.

The snmpd configuration settings are all saved in a file called /etc/snmp/snmpd.conf. Open this file in your editor as in:

    sudo vi /etc/snmp/snmpd.conf

Add the following lines to the end of the file:

    #
    createUser user1
    createUser user2 MD5 user2password
    createUser user3 MD5 user3password DES user3encryption
    #
    rouser user1 noauth 1.3.6.1.2.1.1
    rouser user2 auth 1.3.6.1.2.1
    rwuser user3 priv 1.3.6.1.2.1

Note:- If you want to use your own username/password combinations you need to note that the password and encryption phrases should have a length of at least 8 characters

Also you need to do the following change so that snmp can listen for connections on all interfaces

From

    #agentAddress udp:161,udp6:[::1]:161

to

    agentAddress udp:161,udp6:[::1]:161

Save your modified snmpd.conf file and restart the daemon with:

    sudo /etc/init.d/snmpd restart

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/how-to-configure-snmpv3-on-ubuntu-14-04-server.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
