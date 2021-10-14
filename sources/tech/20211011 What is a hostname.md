[#]: subject: "What is a hostname?"
[#]: via: "https://opensource.com/article/21/10/what-hostname"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is a hostname?
======
Hostnames are labels for humans to refer to a specific computer.
![Computer screen with files or windows open][1]

Computers have network addresses, but they're usually difficult for humans to remember. Hostnames are labels intended to help humans refer to a specific computer. Instead of navigating to 192..168.1.4, for instance, you might navigate to  `linuxlaptop `or `linuxlaptop.local`.

### Addresses and Names

All networked computers (also referred to as hosts) need an address—a unique number associated with it that allows for datagrams to route among them for correct data communications. This is known as the Internet Protocol (IP) address. The number 54.204.39.132 is an Internet Protocol version 4 (IPv4) address. The newer IPv6 addresses are much longer, like this: 2001:0db6:3c4d:0017:0000:0000:2a2f:1a2b. WHOA! That is going to be hard to memorize!


```
`$ ip addr show`
```

Computers can also be given labels. Known as the hostname, these are friendly names for easier reference. I could set my computer's hostname to be _copperhead_. As long as that name is unique on the network, all other users and computers can refer to it as copperhead instead of the IP address number.


```
`$ hostname -s`
```

You can update your computer's hostname.

Read Seth Kenlon's article [How to change a hostname on Linux][2] to learn how to do that on Linux.

#### Fully qualified domain name

Technically, the hostname includes a domain name. If my domain name is mycompany.com, then together—delimited by periods, my computer's hostname is copperhead.mycompany.com. This forms a fully qualified domain name (FQDN). This is important because the IP address resolves to the FQDN.


```
`host.domain.topleveldomain`
```

For example: `www.example.com` is a fully qualified domain name.

Your domain name is generally determined already, so you're only responsible for providing the host portion. This article focuses on the host. 

#### Name resolution

The process of translating the IP address to the corresponding hostname is known as name resolution. The first place that this occurs is in a local hosts table. Linux uses the file `/etc/hosts` to store this table.


```
`cat /etc/hosts`
```

There is also a hierarchical and decentralized network-based system that provides resolution called the Domain Name System (DNS). This is when the FQDN becomes really important.


```
`$ dig www.opensource.com`
```

### Fun with names

It can be fun to think up names for our computers. If you have many, you could use a theme. I once worked for a company that named all of its servers after snakes.

A later company I worked for, where I was a data center manager, used beer brands. It was exciting when we received a new server because I would email the development team for suggestions. We had roughly 100 servers. These provided an interesting list that reflected the diversity of the company. We had everything from coors and bud to amstel and deleriumtremens. We had tiger and singha and sapporo and many others too!

We thought it was cool! Then again, imagine what happens when you try to remember that lowenbrau is the virtualization server with the most RAM and peroni is the SQL database server and heineken is the new domain controller, particularly for new employees in a rapidly growing company.

### Conventions

Hostnames are the choice of the owner, of course, so have fun with it. However, depending on the environment, it might make more sense to use names that are easy to remember or based on a naming convention that lends to being descriptive to the host. 

#### Useful names

If you want to forego the fun and helpfully name your systems, perhaps consider their function. Database servers might be named database1, database2, database3, and so on. Web servers might be webserver1, webserver2, and so on.

#### Positional names

I have used a technique with many clients to name server hosts with sets of characters in positions that describe an aspect of that system that helps identification. For example, if I were working on a Business Process Management (BPM) system for the Department of the Interior (DOI), I would incorporate their acronyms in the naming convention.

Furthermore, just as with many large corporations, financial institutions, and governments, they might have various data centers located in disparate geographical locations for purposes of performance or disaster recovery. So, say, a data center on the East coast of the North American continent is referred to as ED, and those on the West coast are WD. East Data center and West Data center.

All of this information would come together in a name such as doibpm1ed or doibpm1wd. So, while these names don't look like much, someone working on this project would readily be able to identify each as to their purpose and location, and the name may even help to obfuscate their usage to would-be mal-actors. In other words, the owner could choose naming that would only make sense to insiders. 

### Internet standards

Several standards govern hostnames. You can find these in Requests for Comment (RFC) maintained by The Internet Engineering Task Force (IETF). As of now, adhere to the following:

  *  A hostname should be between 1 and 63 ASCII characters in length
  *  A FQDN has a maximum length of 253 ASCII characters
  *  Case-insensitive
  *  Allowed characters: a to z, 0 to 9, - (hyphen), and _ (underscore)



I hope this article helps to clarify hostnames. Have some fun and be creative.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/what-hostname

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/21/10/how-change-hostname-linux
