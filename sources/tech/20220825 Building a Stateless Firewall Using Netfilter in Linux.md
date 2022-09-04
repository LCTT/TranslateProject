[#]: subject: "Building a Stateless Firewall Using Netfilter in Linux"
[#]: via: "https://www.opensourceforu.com/2022/08/building-a-stateless-firewall-using-netfilter-in-linux/"
[#]: author: "Supriyo Ganguly https://www.opensourceforu.com/author/supriyo-ganguly/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Building a Stateless Firewall Using Netfilter in Linux
======
*The Linux kernel has a Netfilter framework that allows us to perform various networking-related operations. This article is a simple tutorial on how to build firewall modules using Netfilter.*

The Netfilter framework is a collection of hooks or handlers in the Linux kernel, which helps to filter or capture socket buffers. We can implement packet filtering at the input or output, or even at the forwarding path of a network packet. *Iptables* is a popular tool that is implemented using the Netfilter framework.

As shown in Figure 1, a packet can be filtered or processed at five different stages. So there are five possible hooks where programmers can attach a customised handler and implement their own firewall. These hooks are (only for Linux kernel 5.10 or above):

![Figure 1: Processing stages][1]

* NF_INET_PRE_ROUTING: This hook is called once a network packet enters the stack, before any routing decision takes place.
* NF_INET_LOCAL_IN: After routing, if it is found that the packet is for a local network, this hook is triggered.
* NF_INET_FORWARD: This hook is called if, after routing, it is found that the packet is for another networking domain, and not for a local process.
* NF_INET_LOCAL_OUT: This is called in case the packet is sent from a local process using send or sendto (POSIX calls).
* NF_INET_POST_ROUTING: This handler is called just before any local or forwarded packet is about to hit the interface after handling by the entire stack is over.

I have written an example code to show how to build a firewall using the Netfilter framework. I have used Linux kernel 5.10. In this example I have blocked all ICMP and HTTP/HTTPS packet sending from a local process. This program has to run from kernel space, and not in user space. So a kernel module has been developed.

The entire code is available at*https://github.com/SupriyoGanguly/Linux-Firewall-by-netfilter*. You can download the code files to check and understand the implementation.

#### Packet filtering

We have created a firewall.c file that is available in the download from the above link. In *firewall.c*, the *netfilter_ops* is a *struct nf_hook_ops* variable. In the init-module section, *netfilter_ops* is initialised with the following:

```
netfilter_ops.hook = main_hook; //the handler function
netfilter_ops.pf = PF_INET; //tells the Protocol is IPv4
netfilter_ops.hooknum = NF_INET_POST_ROUTING; //process at post-routing stage
netfilter_ops.priority = NF_IP_PRI_FIRST; //priority
```

Given below is the snippet from firewall.c:

```
static struct nf_hook_ops netfilter_ops;

/* This function is called by hook. */

static unsigned int main_hook(void *priv, struct sk_buff *skb, const struct nf_hook_state *state)
{
    //struct udphdr *udp_header;
    int dstPort;
    struct tcphdr *hdr;
    struct iphdr *ip_header = (struct iphdr *)skb_network_header(skb);

    if (ip_header->protocol == IPPROTO_ICMP) {
        // udp_header = (struct udphdr *)skb_transport_header(skb);
        printk(KERN_INFO “Drop icmp packet.\n”);
        return NF_DROP;
    }

    if (ip_header->protocol == IPPROTO_TCP) {
        hdr = (struct tcphdr *) skb_transport_header(skb);
        dstPort = ntohs(hdr->dest);
        if ((dstPort==443) || (dstPort==80)) /*drop https and http*/ {
            printk(“Drop HTTPS/HTTP packet\n”);
            return NF_DROP;
        }
    }
    return NF_ACCEPT;
}
```

*main_hook* is the name of the handler function for the *NF_INET_POST_ROUTING hook*. In this function, any packet (whether forwarded or sent from the local interface with ICMP protocol) will be dropped using the first ‘if’ statement, where it checks for the IP_PROTOCOL in the IPv4 header of the socket buffer. As the hook is returning *NF_DROP*, it tells the kernel driver not to proceed with the packet.

The second ‘if’ statement checks whether any TCP packet with destination port number 443 (for HTTPS) or with port number 80 (for HTTP) will be dropped.

Now we can use the*Make* statement to compile this module*(filewall.c)*. Figure 2 shows that we can ping an IP of a local network device with IP address 192.168.29.1 successfully just before we have implemented *firewall.c.*

![Figure 2: Successful ping][2]

But after insertion of the module, ping starts to fail (as shown in Figure 3).

![Figure 3: Unsuccessful ping][3]

This indicates that in the*POST_ROUTING* hook, the packet is dropped and not sent to wire. A log from*dmesg* command is shown in Figure 4 and describes the functionality of the module.

![Figure 4: Output of dmesg][4]

In this example you can also see the use of *NF_DROP* or *NF_ACCEPT* return values. The meaning of these values is self-explanatory. But there are a few more return values as well, which include:

* NF_REPEAT: Repeat the hook function.
* NF_QUEUE: Queue the packet for user space processing.  To implement this in user space, we need to use the libraries nfnetlink and netfilter_queue.
* NF_STOLEN: Further processing of the packet and freeing memory is up to your module.

#### Packet mangling

Netfilter can also be used for packet mangling or modification. In the same URL (https://github.com/SupriyoGanguly/Linux-Firewall-by-netfilter), you can find one more file *Mangle.c*. The corresponding makefile is*Makefile_mangle*.

In this hook, the ICMP ping packet source IP is modified just before sending out the packet. You can see the code below:

```
/* This function to be called by hook. */

static unsigned int main_hook(void *priv, struct sk_buff *skb, const struct nf_hook_state *state)
{

    struct iphdr *ip_header = (struct iphdr *)skb_network_header(skb);

    if (ip_header->protocol == IPPROTO_ICMP) {
        printk(KERN_INFO “Mangle icmp packet. %x\n”,ip_header->saddr);
        ip_header->saddr = 0xd01da8c0;
    }

    return NF_ACCEPT;
}
```

The output of Wireshark capture shown in Figure 5 depicts that before loading this module, the ping request to destination IP 192.168.29.1 goes from the original IP of the interface, i.e., 192.168.29.207. But after loading the module, the ping request goes from the modified IP of the interface, i.e., 192.168.29.208. However, the physical interface IP is unchanged.

![Figure 5: Output of Wireshark][5]

#### Compiling the code

To compile and test the downloaded module, just use:

```
$ make

$ sudo insmod firewall
```

To remove it, use the following command:

```
$ sudo rmmod firewall
```

This article is a simple tutorial on building firewall modules using Netfilter. You can also do packet capturing by simply using the*NF_INET_PRE_ROUTING* hook number in this example. You can even use this example to simulate a man-in-the-middle attack for your devices, to test the cybersecurity.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/building-a-stateless-firewall-using-netfilter-in-linux/

作者：[Supriyo Ganguly][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/supriyo-ganguly/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-1-Processing-stages.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-2-Successful-ping.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-3-Unsuccessful-ping.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-4-Output-of-dmesg.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/06/Figure-5-Output-of-Wireshark.jpg
