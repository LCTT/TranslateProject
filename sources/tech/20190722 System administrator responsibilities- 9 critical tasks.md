[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (System administrator responsibilities: 9 critical tasks)
[#]: via: (https://opensource.com/article/19/7/sysadmin-best-practices)
[#]: author: (Alok Sharma https://opensource.com/users/aloksharma08https://opensource.com/users/vincepowerhttps://opensource.com/users/bcottonhttps://opensource.com/users/penglishhttps://opensource.com/users/bijeshhttps://opensource.com/users/aloksharma08https://opensource.com/users/jamesfhttps://opensource.com/users/aloksharma08)

System administrator responsibilities: 9 critical tasks
======
Sysadmins are responsible for a wide range of duties, but these are the
most essential.
![Tools for the sysadmin][1]

System administrators are critical to the reliable and successful operation of an organization and its network operations center and data center. A sysadmin must have expertise with the system's underlying platform (i.e., Windows, Linux) as well as be familiar with multiple areas including networking, backup, data restoration, IT security, database operations, middleware basics, load balancing, and more. Sysadmin tasks are not limited to server management, maintenance, and repair, but also any functions that support a smoothly running production environment with minimal (or no) complaints from customers and end users.

Although sysadmins have a seemingly endless list of responsibilities, some are more critical than others. If you work in a sysadmin role (or hope to one day), make sure you are ready to follow these best practices.

### Documentation

Documentation is how sysadmins keep records of assets, including hardware and software types, counts, and licenses. Should there be any issues in the production environment, documentation helps identify the hardware, virtual machine, appliance, software, etc., that may be involved.

#### Hardware inventory

Maintain lists of all your physical and virtual servers with the following details:

  * **OS:** Linux or Windows, hypervisor with versions
  * **RAM:** DIMM slots in physical servers
  * **CPU:** Logical and virtual CPUs
  * **HDD:** Type and size of hard disks
  * **External storage (SAN/NAS):** Make and model of storage with management IP address and interface IP address
  * **Open ports:** Ports opened at the server end for incoming traffic
  * **IP address:** Management and interface IP address with VLANs
  * **Engineering appliances:** e.g., Exalogic, PureApp, etc.



#### Software inventory

  * **Configured applications:** e.g., Oracle WebLogic, IBM WebSphere Application Server, Apache Tomcat, Red Hat JBoss, etc.
  * **Third-party software:** Any software not shipped with the installed OS



#### License details

Maintain license counts and details for physical servers and virtual servers (VMs), including licenses for Windows, subscriptions for Linux OS, and the license limit of hypervisor host.

### Server health checkup

  * **Running processes:** Check for processes that are consuming more resources than expected, and take action to fine-tune the applications (with the help of the application team).
  * **CPU utilization:** Consistently monitor and check the CPU utilization of the critical process like "java", "http", "mysql" etc. to ensure that these are not consuming the CPU resources more than expected. If it is so, then coordinate with the application team to check it at application level  and fine tune the same. Parallely analyse the OS parameters like "Ulimits".
  * **Memory utilization:** Check memory utilization and clear the cache, if required.
  * **Zombie processes:** Check for processes where the PID still exists in the process table after it is terminated. Zombie processes degrade server performance, so find and kill any that exist.
  * **Load average:** If you're having performance issues, check the load average and tune the server for performance.
  * **Disk/SAN/NAS utilization:** Check the I/O reports for externally attached storage to track and check the speed of read/write operations. If you find any issues, coordinate with the storage and network teams immediately to correct them.



### Backup and disaster recovery planning

Communicate with the backup team and provide them the data and client priorities for backup. The recommended backup criteria for production servers is:

  * **Incremental backups:** Daily, Monday to Friday
  * **Full backup:** Saturday and Sunday
  * **Disaster recovery drills:** Perform restoration mock drills once a month (preferably, or quarterly if necessary) with the backup team to ensure the data can be restored in case of an issue.



### Patching

Operating system patches for known vulnerabilities must be implemented promptly. There are many types and levels of patches, including:

  * Security 
  * Critical 
  * Moderate



When a patch is released, check the bug or vulnerability details to see how it applies to your system (e.g., does the vulnerability affect the hardware in your system?), and take any necessary actions to apply the patches when required. Make sure to cross-verify applications' compatibility with patches or upgrades.

### Application compatibility

Before going live with any application, check its compatibility with your hardware and operating system, and make sure to do load testing (with the support of application team).

### Server hardening

#### Linux:

  * **Set a BIOS password:** This prevents users from altering BIOS settings.
  * **Set a GRUB password:** This stops users from altering the GRUB bootloader.
  * **Deny root access:** Rejecting root access minimizes the probability of intrusions.
  * **Sudo users:** Make sudo users and assign limited privileges to invoke commands.
  * **TCP wrappers:** This is the weapon to protect a server from hackers. Apply a rule for the SSH daemon to allow only trusted hosts to access the server, and deny all others. Apply similar rules for other services like FTP, SSH File Transfer Protocol, etc.
  * **Firewalld/iptables:** Configure firewalld and iptables rules for incoming traffic to the server. Include the particular port, source IP, and destination IP and allow, reject, deny ICMP requests, etc. for the public zone and private zone.
  * **Antivirus:** Install antivirus software and update virus definitions regularly.
  * **Secure and audit logs:** Check the logs regularly and when required.
  * **Rotate the logs:** Keep the logs for limited period of time like "for 7 days", to keep the sufficient disk space for flawless operation.



#### Windows:

  * **Set a BIOS password:** This prevents users from altering BIOS settings.
  * **Antivirus:** Install antivirus software and update virus definitions regularly.
  * **Configure firewall rules:** Prevent unauthorized parties from accessing your systems.
  * **Deny administrator login:** Limit users' ability to make changes that could increase your systems' vulnerabilities.



### Use a syslog server

By configuring a syslog server in the environment to keep records of system and application logs, in the event of an intrusion or issue, the sysadmin can check previous and real-time logs to diagnose and resolve the problem.

### Automation

Many sysadmin tasks (such as server health checkups, resource utilization, backup triggers, transfer files and logs, etc.) must be done at specific times. Therefore, the sysadmin must write scripts or use external tools and configure them as cron jobs to do the tasks automatically at the proper time.

### Monitoring tools

Install and configure live monitoring tools like Nagios, HP, etc., to monitor your IT infrastructure and issue alerts about potential problems.

### Conclusion

While these are the most important tasks a sysadmin is responsible for, there is much more to the role than the duties on this list.

For example, the sysadmin must coordinate with multiple teams to resolve issues, communicate with and update customers, maintain 100% uptime, hold discussions with the audit team, prepare weekly/monthly/quarterly reports, do continuous monitoring of servers and services using appropriate tools, and maintain the hardware console and respond to any triggered alarms.

The sysadmin is always a single point of content (SPOC) in the data center or network operations center for issues related to web hosting, application and server outages, and other critical IT operations problems.

_What other tasks or best practices do you think are essential for sysadmins? Please share your opinion in the comments._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/sysadmin-best-practices

作者：[Alok Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aloksharma08https://opensource.com/users/vincepowerhttps://opensource.com/users/bcottonhttps://opensource.com/users/penglishhttps://opensource.com/users/bijeshhttps://opensource.com/users/aloksharma08https://opensource.com/users/jamesfhttps://opensource.com/users/aloksharma08
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_sysadmin_cloud.png?itok=sUciG0Cn (Tools for the sysadmin)
