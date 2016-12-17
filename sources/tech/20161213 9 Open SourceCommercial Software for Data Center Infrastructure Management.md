9 Open Source/Commercial Software for Data Center Infrastructure Management
============================================================

When a company grows its demand in computing resources grows as well. It works as for regular companies as for providers, including those renting out dedicated servers. When the total number of racks exceed 10 you’ll start facing issues.

How to inventory servers and spares? How to maintain a data center in a good health, locating and fixing potential threats on time. How to find the rack with broken equipment? How to prepare physical machines to work? Carrying out these tasks manually will take too much time otherwise will require having a huge team of administrators in your IT-department.


However there is a better solution – using a special software that automates Data Center management. Let’s have a review of the tools for running a DC that we have on a market today.

### 1\. Opendcim

Currently it’s the one and the only free software in its class. It has an open source-code and designed to be an alternative to commercial DCIM solutions. Allows to keep inventory, draw a DC map and monitor temperature and power consumption.

On the other hand, it doesn’t support remote power-off, server rebooting, and OS installation functionality. Nevertheless, it is widely used in non-commercial organizations all around the globe.

Thanks to its open source code, [Opendcims][2] should work fine for the companies having their own developers.

[
 ![openDCIM](http://www.tecmint.com/wp-content/uploads/2016/12/openDCIM.png) 
][3]

openDCIM

### 2\. NOC-PS

A commercial system, designed for provisioning physical and virtual machines. Has a wide functionality for advance preparation of equipment: OS and other software installation and setting up network configurations, there is WHMCS and Blesta integrations. However, it won’t be your best choice if you need to have a DC map at hand and see the racks location.

[NOC-PS][4] will cost you a 100€ per year for every 100 dedicated servers bundle. Suits for small-to-middle scale companies.

[
 ![NOC-PS](http://www.tecmint.com/wp-content/uploads/2016/12/NOC-PS.png) 
][5]

NOC-PS

### 3\. DCImanager

[DCImanager][6] is a proprietary class solution developed, as announced, considering the needs of DC engineers and hosting providers. Has an integration with popular billing software like WHMCS, Hostbill, BILLmanager.

Main features are: server provisioning, OS installation from templates, sensors monitoring, traffic and power consumption reports, VLAN management. In addition to said above, Enterprise edition allows you to build a DC map and keep servers and spares inventorying.


You can try a free license for up to 5 physical servers while a yearly license costs 120€ for 100 dedicated machines.

Depending on edition, can be a good fit for both SMBs and large-scale enterprises.

[
 ![DCImanager](http://www.tecmint.com/wp-content/uploads/2016/12/DCImanager.png) 
][8]

DCImanager

### 4\. EasyDCIM

[EasyDCIM][9] is a paid software mainly oriented on server provisioning. Brings OS and other software installation features and facilitates DC navigation allowing to draw a scheme of racks.

Meanwhile the product itself doesn’t include IPs and DNS management, control over the switches. These and other features become available after additional modules installation, both free and paid (including WHMCS integration).

100 server license starts from $999 per year. Due to the pricing EasyDCIM may be a bit expensive for small companies, while middle and large companies can give it a try.

[
 ![EasyDCIM](http://www.tecmint.com/wp-content/uploads/2016/12/EasyDCIM.png) 
][10]

EasyDCIM

### 5\. Ansible Tower

[Ansible Tower][11] is a Enterprise level computing infrastructure management tool from RedHat. The main idea of this solution was the possibility of a centralized deployment as for servers as for the different user devices.

Thanks to that Ansible Tower can perform almost any possible program operation with integrated software and has an amazing statistics collecting module. On the dark side we have the lack of integration with popular billing systems and pricing.

$5000 per year for 100 devices. Will work for large and gigantic companies..

[
 ![Ansible Tower](http://www.tecmint.com/wp-content/uploads/2016/12/Ansible_Tower.png) 
][12]

Ansible Tower

### 6\. Puppet Enterprise

Developed on a commercial basis and considered as an accessorial software for IT-departments. Designed for OS and other software installation on servers and user devices both at the initial deployment and a further exploitation stages.

Unfortunately, inventorying and the more advanced interaction schemes between devices (cable connection, protocols and other) is still under development.

[Puppet Enterprise][13] has a free and fully-functional version for 10 computers. A yearly license cost is $120 per device.

Can work for big corporations.

[
 ![Puppet Enterprise](http://www.tecmint.com/wp-content/uploads/2016/12/Puppet-Enterprise.png) 
][14]

Puppet Enterprise

### 7\. Device 42

Mostly designed for a Data Center monitoring. Has a great tools for inventorying, builds hardware/software dependence map automatically. DC map drawn by [Device 42][15] reflects temperature, spare space and other parameters of a rack as in graphics as marking the racks with specific colour. However software installation and billing integration aren’t supported.

100 servers license will cost $1499 per year. Probably can be a good shot for middle-to-large companies.

[
 ![Device42](http://www.tecmint.com/wp-content/uploads/2016/12/Device42.png) 
][16]

Device42

### 8\. CenterOS

It’s an operating system for a Data Center management with a main focus on equipment inventorying. Besides creating a DC map, schemes of racks and connections a well-thought integrated system of server statuses facilitates managing the internal technical works.

Another great feature allows to find and reach out to a right person related with a certain piece of equipment within a few clicks (it may be an owner, technician, or manufacturer), what can be truly handful in case of any emergencies.

**Suggested Read:** [8 Open Source/Commercial Billing Platforms for Hosting Providers][17]

The source code for [Centeros][18] is closed and pricing is available only upon request.

A mystery about the pricing complicates determining a target audience of the product, however it’s possible to make an assumption that Centeros is designed mostly for larger companies.

[
 ![CenterOS](http://www.tecmint.com/wp-content/uploads/2016/12/CenterOS.png) 
][19]

CenterOS

### 9\. LinMin

It’s an instrument for preparing a physical equipment for a further usager. Uses PXE install the chosen OS and deploys the requested set of additional software afterwards.

Unlike most of its analogs, [LinMin][20] has a well-developed backup system for hard drives, that speeds up an after-crush recovery and facilitates the mass deployments of the servers with a same configuration.

Price starts from $1999/year for 100 servers. Middle-to-large companies can keep LinMin in mind.

[
 ![LinMin](http://www.tecmint.com/wp-content/uploads/2016/12/LinMin.jpg) 
][21]

LinMin

Now let’s summarize everything. I would say that most of the products for automating operations with a high volume of infrastructure, that we have on a market today, can be divided in two categories.

The first is mainly designed for preparing an equipment for a further exploitation while the second manages inventorying. It’s not so easy to find a universal solution that will contain all the necessary features so you can give up on the many tools with a narrow functionality provided by an equipment manufacturer.

However now you have a list of such solutions and you are welcome to check it yourself. It’s worth to notice that an open source products is on the list as well, so if you have a good developer, it’s possible to customize it for your specific needs.

I hope that my review will help you to find a right software for your case and make your life easier. Long life to your servers!


-----------------------------------

作者简介：

![](http://1.gravatar.com/avatar/ae5edcc20865ae20859fb566c796b97a?s=128&d=blank&r=g)

I'm a technical evangelist at hosting software developing company from Siberia, Russia. I'm curious and like to expand my knowledge whether from new Linux software tools or to Hosting Industry trends, possibilities, journey and opportunities.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/data-center-server-management-tools/

作者：[ Nikita Nesmiyanov][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/nesmiyanov/
[1]:http://www.tecmint.com/web-control-panels-to-manage-linux-servers/
[2]:http://opendcim.org/
[3]:http://www.tecmint.com/wp-content/uploads/2016/12/openDCIM.png
[4]:http://noc-ps.com/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/NOC-PS.png
[6]:https://www.ispsystem.com/software/dcimanager
[7]:http://www.tecmint.com/opensource-commercial-control-panels-manage-virtual-machines/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/DCImanager.png
[9]:https://www.easydcim.com/
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/EasyDCIM.png
[11]:https://www.ansible.com/
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Ansible_Tower.png
[13]:https://puppet.com/
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Puppet-Enterprise.png
[15]:http://www.device42.com/
[16]:http://www.tecmint.com/wp-content/uploads/2016/12/Device42.png
[17]:http://www.tecmint.com/open-source-commercial-billing-software-system-web-hosting/
[18]:http://www.centeros.com/
[19]:http://www.tecmint.com/wp-content/uploads/2016/12/CenterOS.png
[20]:http://www.linmin.com/
[21]:http://www.tecmint.com/wp-content/uploads/2016/12/LinMin.jpg
