[#]: subject: "Why use a Raspberry Pi to power your business"
[#]: via: "https://opensource.com/article/22/1/raspberry-pi-business"
[#]: author: "Giuseppe Cassibba https://opensource.com/users/peppe8o"
[#]: collector: "lujun9972"
[#]: translator: " void-mori"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why use a Raspberry Pi to power your business
======
Why small, single-board computers can be the future for smart working
and small offices.
![A chair in a field.][1]

With the pandemic changing the way we're working, job decentralization is becoming an important challenge for all companies.

### Smart offices

Even if every factory approached smart working only as remoting the employee notebook through a VPN, adding evolution brings some basic office services as nearest as possible to people. This could drastically reduce the datacenter's load and improve people's working experience. An additional effect is removing many single-point-of-failures from information and communications technology (ICT) in this scenario.

Instead of hundreds or thousands of workplaces outside the company, it's like having hundreds or thousands of small offices/branches around the world. It's what one might call **smart offices**.

This statement may frighten many ICT experts because of the culture, which associates a big machine (server) to each office, even if the advantages of spreading computing resources are clear.

### A different perspective

What if you could deliver the services of a big server from a tiny US$ 50 board? What if this tiny board requires only an SD card and an ordinary USB power supply? Here's where the [Raspberry Pi][2] is the most flexible solution.

Raspberry Pi computer boards are very small form factor computers running Linux. They have an OS delivered and maintained from Raspberry Pi Foundation—the Raspberry Pi OS. Based on Debian, it shares many software packages with the most known Linux distributions. Moreover, many Raspberry Pi boards can flawlessly run the most famous Ubuntu server. They include ARM processors, which grant low energy consumption.

**[ Read next: [7 ways to use Raspberry Pi in enterprise IT][3] ]**

But Raspberry Pi computer boards are a great opportunity also for small companies, bringing tons of (open source) services at affordable costs. Here, you have to consider data loss risks, as you have all your services in small consumer-grade hardware. But setting up the right backup/restore procedures can reduce these risks.

### What services can you provide from a Raspberry Pi board?

Most services usually get delivered from more expensive servers. The "most" attribute depends on some restrictions:

  * **ARM processor:** Some packages are available only for X86/X64 processors. This is one of the hardest challenges to overcome. On the other hand, the increasing market share for ARM processors keeps programmers having ARM-compatible versions of their software.
  * **RAM amount:** This is a problem limited to some complex applications running complex calculations in a sophisticated manner. Many times, it's just a matter of revisiting the code, splitting steps, and keeping it simple and efficient. Moreover, if a service requires a lot of RAM/CPU for a few users, this may also mean that the service is not working correctly, and it could be an opportunity for you to remove old problems that are wasting resources. Finally, the latest Raspberry Pi computer boards upgraded the RAM amount up to 8GB, which is a lot.
  * **Users who are inexperienced with servers:** This is another problem you can approach with base images inside the micro-SD cards on which Raspberry Pi stores the OS and running data.



That said, you can do many interesting things with a Raspberry Pi. In [my blog][4], I've tested this by running all kinds of services—from a basic LAMP server to a complex CRM. Passing through some complex systems, all open source, like:

  * Proxy server (also capable to add ad-blocker services)
  * Email server
  * Printing server
  * [Hotel management][5]
  * Contact relations management
  * [Private social network][6]
  * Private forum
  * Private Git web portal
  * Network monitoring server
  * [And many other useful services][7]



Another interesting opportunity for Raspberry Pi in your remote office is to get a WiFi hotspot offering advanced services and control from its Ethernet port. 

Finally, [Raspberry Pi can also run containers][8], an additional tool to get a world of services available from this incredible board.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/raspberry-pi-business

作者：[Giuseppe Cassibba][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/peppe8o
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_WorkInPublic_4618517_1110_CS_A.png?itok=RwVrWArk "A chair in a field."
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://enterprisersproject.com/article/2020/11/raspberry-pi-7-enterprise-it-uses
[4]: https://peppe8o.com
[5]: https://opensource.com/article/20/4/qloapps-raspberry-pi
[6]: https://opensource.com/article/20/3/raspberry-pi-open-source-social
[7]: https://peppe8o.com/category/raspberrypi/
[8]: https://opensource.com/article/20/8/kubernetes-raspberry-pi
