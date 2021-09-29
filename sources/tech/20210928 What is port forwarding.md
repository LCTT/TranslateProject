[#]: subject: "What is port forwarding?"
[#]: via: "https://opensource.com/article/21/9/what-port-forwarding"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is port forwarding?
======
This article demonstrates the most common scenarios for port forwarding.
![Multi-colored and directional network computer cables][1]

Port forwarding transfers network traffic from one network listener (called a "port") to another, either on the same computer or a different computer. Ports, in this context, are not physical objects but a software routine listening for network activity.

When traffic directed at a specific port arrives at a router or a firewall, or other networked application, the response it receives can be defined according to the port it's trying to communicate with. When you use port forwarding, you can catch communication coming in on port 8080, for instance, and forward it on to port 80 instead. The new destination port may be on the same device as the one receiving the signal or on a different device. There are many ways to forward ports, and there are different reasons for doing it. This article demonstrates the most common scenarios.

### Port forwarding with your router

You usually need to forward ports when you host a server at home. Your home router (usually the WiFi appliance you get from your ISP) has a built-in firewall designed to prevent the outside world from getting onto your home network. You can use port forwarding to allow traffic on a specific port through your router's firewall, sending it to a specific IP address on your network.

For instance, say you're hosting a [Minetest server][2] and want to invite friends. For them to get through your router and into your Minetest server, you must forward a port from the router to the computer hosting Minetest. By default, a Minetest server runs on port 30000. You can port forward 30000 on your router to port 30000 on your Minetest server, or you could arbitrarily invent a simpler port for your players to remember and then forward that instead. I find that people inevitably miscount the zeroes in 30000 (especially without the benefit of a comma to help), so I use port 1234 and forward it to my internal 30000 port.

Router interfaces differ from manufacturer to manufacturer, but the idea is the same regardless of what brand of router you have in your home. First, log in to your router.
Its IP address and login information is often printed on the router itself or in its documentation. I own a TP-Link GX90 router, and I log in to it by pointing my web browser to 10.0.1.1, but your router might be 192.168.0.1 or some other address.

My GX90 router calls port forwarding "Virtual servers," which is a category found in the router's **NAT forwarding** tab. NAT stands for _Network Address Translation_. Other routers may just call it **Port forwarding** or **Firewall** or **Services**. It may take a little clicking around to find the right category, or you may need to spend some time studying your router's documentation.

When you find the port forwarding setting, add a new rule that names an external port (1234, in my example) and an internal one (30000). Forward the external port to the internal port on the IP address of the computer you want people to be able to access. If you need help finding your IP address, read Archit Modi's _[How to find your IP address on Linux][3]_ article.

![A sample port forwarding rule][4]

A sample port forwarding rule
(Seth Kenlon, [CC BY-SA 4.0][5])

In this example, I'm forwarding traffic that reaches my home network at port 1234 to port 30000 of my home server located at 10.0.1.2.

Save the rule to proceed.

Next, you need to know your home network's public IP address. You can obtain this from websites like [ifconfig.me][6] or [icanhazip.com][7]. Either open a browser to one of those sites or get the IP using the [curl][8] command:


```
$ curl ifconfig.me
93.184.216.34
```

Your friends can now join your Minetest server by entering the `169.169.23.49:1234` into their Minetest client.

### Port forwarding with a firewall

Sysadmins sometimes need to forward ports for traffic reaching a server. For example, you may want to accept traffic to port 80 but present the user with a service running on port 8065. Without port forwarding, your users would have to remember to append a specific port at the end of the URL they enter into their browser, such as `example.com:8065`.  Most users aren't used to thinking about ports, so intercepting a call to the common web port 80 and redirecting it to the obscure one your web app runs on is a big convenience for your users.

You can forward traffic on a server using [firewall-cmd][9], the front-end command to the `firewalld` daemon.

First, set the ports and protocols you want to forward:


```
$ sudo firewall-cmd \
\--add-forward-port \
port=80:proto=tcp:toport=8065
```

To make the change permanent, use the `--runtime-to-permanent` option:


```
`$ sudo firewall-cmd --runtime-to-permanent`
```

### Network forwarding

In networking, there are other kinds of forwarding aside from port forwarding. For instance, both IP forwarding and proxying are forms of forwarding. As you get familiar with how network information is processed as it's routed, you can try different kinds of forwarding (and watch it with `tcpdump` or similar) to see what works best for your setup.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/what-port-forwarding

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connections_wires_sysadmin_cable.png?itok=d5WqHmnJ (Multi-colored and directional network computer cables)
[2]: https://opensource.com/alternatives/minecraft#minetest
[3]: https://opensource.com/article/18/5/how-find-ip-address-linux
[4]: https://opensource.com/sites/default/files/uploads/router-port-forward.jpg (A sample port forwarding rule)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: http://ifconfig.me
[7]: http://icanhazip.com
[8]: https://opensource.com/article/20/5/curl-cheat-sheet
[9]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
