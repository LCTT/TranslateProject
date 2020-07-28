[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Easy DNS configuration with PowerDNS for nameservers)
[#]: via: (https://opensource.com/article/20/5/powerdns)
[#]: author: (Jonathan Garrido https://opensource.com/users/jgarrido)

Easy DNS configuration with PowerDNS for nameservers
======
Use PDNS to provide a stable and reliable Domain Name System (DNS)
server for your project.
![Computer laptop in space][1]

A few months ago, we got a requirement to provide a stable and reliable Domain Name System ([DNS][2]) server for a new project. The project dealt with auto-deployment using containers and where each new environment would generate a unique, random URL. After a lot of research on possible solutions, we decided to give [PowerDNS][3] (PDNS) a try.

At the outset, we discovered that PowerDNS is supported in all major Linux distros, is available under the GPL license, and keeps its repositories up to date. We also found neat and well-organized [documentation][4] on the official site and tons of how-to's around the web from people who really like and use the product. After reading a few pages and learning some basic commands, PDNS was installed, up, and running, and our journey began.

### Database-driven

PowerDNS keeps its records in a SQL database. This was new for us, and not having to use flat files to keep records was a good change. We picked MariaDB as our power tool of choice, and since there is tons of advance information about the proper settings for installing the nameserver, we could set up and harden our database flawlessly.

### Easy configuration

The second thing that engaged us was all the features PDNS has in its config file. This file, pdns.conf, has a lot of options that you can enable or disable just by adding or removing the # sign. This was truly amazing because it gave us the chance to integrate this new service into our current infrastructure with only the values that we want, no more, no less, just the features that we need. A quick example:

Who can access your webserver?


```
`webserver-allow-from=172.10.0.1,172.10.1.2`
```

Can I forward requests based in a domain? Sure!


```
forward-zones=mylocal.io=127.0.0.1:5300
forward-zones+=example.com=172.10.0.5:53
forward-zones+=lucky.tech=172.10.1.5:53
```

### API included

We could activate using this config file, and this is when we started to meet PDNS's "power" by solving the first request from our development team, the API service. This feature gave us the ability to send requests to simply and cleanly create, modify, or remove records in our DNS server.

This API has some basic security parameters, so in just a few steps, you can control who has the right to interact with the nameserver based on a combination of an IP address and a pre-share key as a way of authentication. Here's what the configuration for this looks like:


```
api=yes
api-key=lkjdsfpoiernf
webserver-allow-from=172.10.7.13,172.10.7.5
```

### Logging

PDNS does an extraordinary job when it comes to logging. You can monitor your server and see how the machine is doing by using the log files and a simple built-in web server. Using a browser, you can see different types of statistics from the machine, like CPU usage and the DNS queries received. This is very valuable—for example, we were able to detect a few "not-so-healthy" PCs that were sending DNS requests to our server looking for sites that are related to malicious traffic. After digging into the logs, we could see where traffic was coming from and do a clean operation on those PCs.

### Other features

This is only a glimpse of all the things you can do with PowerDNS; there is much more to it. It is a complete nameserver with a lot of features and functionalities that make it worth giving it a try.

At this moment, we are not implementing [DNSSEC][5], but it appears that it can be put into production quickly with just one click. Also, PowerDNS has a nice approach when it comes to separating the recursor service from the nameserver. I read that it also supports [DNS RPZ][6] (Response Policy Zones), and there are also some very nice and well-designed frontends available that let you manage your server using a simple web browser, like the one in the image below.

![PowerDNS frontend][7]

([PowerDNS documentation][4], MIT License)

Believe it or not, you can boost your knowledge about DNS and IT ops a lot just by expending a few hours "playing" with PDNS.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/powerdns

作者：[Jonathan Garrido][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jgarrido
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://en.wikipedia.org/wiki/Domain_Name_System
[3]: https://www.powerdns.com/opensource.html
[4]: https://doc.powerdns.com/
[5]: https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions
[6]: https://dnsrpz.info/
[7]: https://opensource.com/sites/default/files/uploads/pdns.jpg (PowerDNS frontend)
