Linux FAQs with Answers--How to show a MAC learning table of Linux bridge
================================================================================
> **Question**: I would like to check MAC address learning status of a Linux bridge that I created with brctl tool. How can I view the MAC learning table (or forwarding table) of a Linux bridge? 

A Linux bridge is software implementation of a network bridge, which is part of Linux kernel. Similar to hardware bridge, Linux bridge maintains a layer-2 forwarding table (also known as MAC learning table, forwarding database, or just FDB), which keeps track of what MAC addresses are associated with which ports. When a bridge receives a packet (with source MAC address X) at port N, it records in FDB that MAC address X is reachable from port N. That way, later when a bridge needs to forward a packet destined to address X, it knows where to forward the packet from FDB lookup. Building a FDB is often called "MAC learning" or just "learning" process.

You can check the current forwarding table or MAC learning table of a Linux bridge using the following command.

    $ sudo brctl showmacs <bridge-name>

![](https://farm4.staticflickr.com/3856/14963353726_8971873948_z.jpg)

This command will show a list of all learned MAC addresses along with their associated port number. Each entry has a corresponding aging timer attached to it, so that the forwarding entries get refreshed after some time, making the MAC learning table up-to-date.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/show-mac-learning-table-linux-bridge.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出