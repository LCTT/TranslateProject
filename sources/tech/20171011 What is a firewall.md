Tranlating by zjon
What is a firewall?
======
Network-based firewalls have become almost ubiquitous across US enterprises for their proven defense against an ever-increasing array of threats.

A recent study by network testing firm NSS Labs found that up to 80% of US large businesses run a next-generation firewall. Research firm IDC estimates the firewall and related unified threat management market was a $7.6 billion industry in 2015 and expected to reach $12.7 billion by 2020.

 **[ If you 're upgrading, here's [What to consider when deploying a next generation firewall][1].]**

### What is a firewall?

Firewalls act as a perimeter defense tool that monitor traffic and either allow it or block it. Over the years functionality of firewalls has increased, and now most firewalls can not only block a set of known threats and enforce advanced access control list policies, but they can also deeply inspect individual packets of traffic and test packets to determine if they're safe. Most firewalls are deployed as network hardware that processes traffic and software that allow end users to configure and manage the system. Increasingly, software-only versions of firewalls are being deployed in highly virtualized environments to enforce policies on segmented networks or in the IaaS public cloud.

Advancements in firewall technology have created new options firewall deployments over the past decade, so now there are a handful of options for end users looking to deploy a firewall. These include:

### Stateful firewalls

When firewalls were first created they were stateless, meaning that the hardware that the traffic traverse through while being inspected monitored each packet of network traffic individually and either blocking or allowing it in isolation. Beginning in the mid to late 1990s, the first major advancements in firewalls was the introduction of state. Stateful firewalls examine traffic in a more holistic context, taking into account the operating state and characteristics of the network connection to provide a more holistic firewall. Maintaining this state allows the firewall to allow certain traffic to access certain users while blocking at same traffic to other users, for example.

### Next-generation firewalls

Over the years firewalls have added myriad new features, including deep packet inspection, intrusion detection and prevention and inspection of encrypted traffic. Next-generation firewalls (NGFWs) refer to firewalls that have integrated many of these advanced features into the firewall.

### Proxy-based firewalls

These firewalls act as a gateway between end users who request data and the source of that data. All traffic is filtered through this proxy before being passed on to the end user. This protects the client from exposure to threats by masking the identity of the original requester of the information.

### Web application firewalls

These firewalls sit in front of specific applications as opposed to sitting on an entry or exit point of a broader network. Whereas proxy-based firewalls are typically thought of as protecting end-user clients, WAFs are typically thought of as protecting the application servers.

### Firewall hardware

Firewall hardware is typically a straightforward server that can act as a router for filtering traffic and running firewall software. These devices are placed at the edge of a corporate network, between a router and the Internet service provider's connection point. A typical enterprise may deploy dozens of physical firewalls throughout a data center. Users need to determine what throughput capacity they need the firewall to support based on the size of the user base and speed of the Internet connection.

### Firewall software

Typically end users deploy multiple firewall hardware endpoints and a central firewall software system to manage the deployment. This central system is where policies and features are configured, where analysis can be done and threats can be responded to.

### Next-generation firewalls

Over the years firewalls have added myriad new features, including deep packet inspection, intrusion detection and prevention and inspection of encrypted traffic. Next-generation firewalls (NGFWs) refer to firewalls that have integrated many of these advanced features, and here is a description of some of them.

### Stateful inspection

This is the basic firewall functionality in which the device blocks known unwanted traffic

### Anti-virus

This functionality that searches for known virus and vulnerabilities in network traffic is aided by the firewall receiving updates on the latest threats and being constantly updated to protect against them.

### Intrusion Prevention Systems (IPS)

This class of security products can be deployed as a standalone product, but IPS functionality is increasingly being integrated into NGFWs. Whereas basic firewall technologies identify and block certain types of network traffic, IPS uses more granular security measures such as signature tracing and anomaly detection to prevent unwanted threats from entering corporate networks. IPS systems have replaced the previous version of this technology, Intrusion Detection Systems (IDS) which focused more on identifying threats rather than containing them.

### Deep Packet Inspection (DPI)

DPI can be part of or used in conjunction with an IPS, but its nonetheless become an important feature of NGFWs because of the ability to provide granular analysis of traffic, most specifically the headers of traffic packets and traffic data. DPI can also be used to monitor outbound traffic to ensure sensitive information is not leaving corporate networks, a technology referred to as Data Loss Prevention (DLP).

### SSL Inspection

Secure Sockets Layer (SSL) Inspection is the idea of inspecting encrypted traffic to test for threats. As more and more traffic is encrypted, SSL Inspection is becoming an important component of DPI technology that is being implemented in NGFWs. SSL Inspection acts as a buffer that unencrypts the traffic before it's delivered to the final destination to test it.

### Sandboxing

This is one of the newer features being rolled into NGFWs and refers to the ability of a firewall to take certain unknown traffic or code and run it in a test environment to determine if it is nefarious.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3230457/lan-wan/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html

作者：[Brandon Butler][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Brandon-Butler/
[1]:https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html


