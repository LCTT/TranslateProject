                    O<M>G Luox 占舰

Five Examples Of The ping Utility
================================================================================
### What is ping Utility? ###

Before going through some real world examples of the ping utility, let me explain what this commandline tool is and its purpose. The ping utility is used to test the reachability of a host on an Internet Protocol (IP) network. Its names comes from the active sonar method which is used to create a pulse of sound (ping) under the water and listening to echo requests from surrounding objects. This method is the best way to explain how the network ping utility works. The ping utility sends echo requests to a host and waits for an ICMP response.

Some Examples Of The ping Utility In Practice:

### Find Out The Ip Address Of A Host ###

Sometimes you need the ip address of a host, you can use the ping tool like shown in Figure 1. Just type the ping command and after it type the hostname.

    ping www.omgubuntu.com

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping1.png)

### Find Out The Version Of The ping Utility You Are Using ###

The -V flag can be used to find out which version of the ping tool you have. Type the following command and it will display the current version of the ping utility.

    ping -V

As you can see from Figure 2, I am using ping utility, iputils-sss20101006.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping2.png)

### Exit Pinging ###

When you ping a machine with the ‘ping host’ command, pinging doesn’t stop and you have to pres CTRL+C to stop it, or you can use the -c (count) option to send a specified number of packets. When using the -c option, after the number of packets specified by the network admin (user whatever) is sent, the pinging process stops automatically instead of pressing CTRL+C.

    ping -c 13 127.0.0.1

The above command is used to send 13 packets to my localhost.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping3.png)

As you can see from Figure 3 i did not press CTRL+C to exit pinging,it stopped automatically.

### Specify The Interval Between Packets ###

Did you know that ping sends a packet every second? Do you like to speed up or slow down? The -i option can be used to specify the interval between packets. Use the following commands to send packets very fast or very slow.

### Send A Packet Every 0.13 Seconds ###

    ping -i 0.13

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping4.png)

### Send A Packet Every 13 Seconds ###

    ping -i 13

### Combine the -i option with -c option ###

    ping -c 13 -i 3

It will take 39 seconds to send 13 packets with the specified interval of 3 seconds.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/ping6.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/five-examples-ping-utility/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
