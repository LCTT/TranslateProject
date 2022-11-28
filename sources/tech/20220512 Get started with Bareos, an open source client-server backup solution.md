[#]: subject: "Get started with Bareos, an open source client-server backup solution"
[#]: via: "https://opensource.com/article/22/5/bareos-open-source-client-server-backup-solution"
[#]: author: "Heike Jurzik https://opensource.com/users/hej"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get started with Bareos, an open source client-server backup solution
======
Bareos preserves, archives, and recovers data from all major operating systems. Discover how its modular design and key features support flexibility, availability, and performance.

![Puzzle pieces coming together to form a computer screen][1]
Image by: Opensource.com

[Bareos][2] (Backup Archiving Recovery Open Sourced) is a distributed open source backup solution (licensed under AGPLv3) that preserves, archives, and recovers data from all major operating systems.

Bareos has been around since 2010 and is (mainly) developed by the company Bareos GmbH & Co. KG, based in Cologne, Germany. The vendor not only provides further development as open source software but also offers subscriptions, professional support, development, and consulting. This article introduces Bareos, its services, and basic backup concepts. It also describes where to get ready-built packages and how to join the Bareos community.

### Modular design

Bareos consists of several services and applications which communicate securely over the network: the Bareos Director (Dir), one or more Storage Daemons (SD), and File Daemons (FD) installed on the client machines to be backed up. This modular design makes Bareos flexible and scalable—it's up to you whether to install all components on one system or several hundred computers, even in different locations. The client-server software stores backups on all kinds of physical and virtual storage (HDD/SSD/SDS), tape libraries, and in the cloud. Bareos includes several plug-ins to support virtual infrastructures, application servers (like databases, such as PostgreSQL, MySQL, MSSQL, MariaDB, etc.), and LDAP directory services.

Here are the Bareos components, what they do, and how they work together:

![Bareos components][3]
Image by: (Heike Jurzik, CC BY-SA 4.0)

#### Bareos Director

This is the core component and the control center of Bareos, which manages the database (i.e., the Catalog), clients, file sets (defining the data in the backups), the plug-ins' configuration, backup jobs and schedules, storage and media pools, before and after jobs (programs to be executed before or after a backup/restore job), etc.

#### Catalog

The database maintains a record of all backup jobs, saved files, and backup volumes. Bareos uses PostgreSQL as the database backend.

#### File Daemon

The File Daemon (FD) runs on every client machine or the virtual layer to handle backup and restore operations. After the File Daemon has received the director's instructions, it executes them and then transmits the data to (or from) the Storage Daemon. Bareos offers client packages for various operating systems, including Windows, Linux, macOS, FreeBSD, Solaris, and other Unix-based systems on request.

#### Storage Daemon

This Storage Daemon (SD) receives data from one or more FDs and stores data on the configured backup medium. The SD runs on the machine handling the backup devices. Bareos supports backup media like hard disks and flash arrays, tapes and tape libraries, and S3-compatible cloud solutions. If there is a media changer involved, the SD controls that device as well. The SD sends the correct data back to the requesting File Daemon during the restore process. To increase flexibility, availability, and performance, there can be multiple SDs, for example, one per location.

### Jobs and schedules

A backup job in Bareos describes what to back up (in a so-called FileSet directive on the client), when to back up (Schedule directive), and where to back up the data (Pool directive). This modular design lets you define multiple jobs and combine several directives, such as FileSets, Pools, and Schedules. Bareos allows you to have two different job resources managing various servers but using the same Schedule and FileSet, maybe even the same Pool.

The schedule not only sets the backup type (full, incremental, or differential) but also describes when a job is supposed to run, i.e., on different days of the week or month. Because of that, you can plan a detailed schedule and run full backups every Monday, incremental backups the rest of the week, etc. If more than one backup job uses the same schedule, you can set the job priority and thus tell Bareos which job is supposed to run first.

### Encrypted communication

As mentioned, all Bareos services and applications communicate with each other over the network. Bareos provides TLS/SSL with pre-shared keys or certificates to ensure encrypted data transport. On top of that, Bareos can encrypt and sign data on the File Daemons before sending the backups to the Storage Daemon. Encryption and signing on the clients are implemented using RSA private keys combined with X.509 certificates (Public Key Infrastructure). Before the restore process, Bareos validates file signatures and reports any mismatches. Neither the Director nor the Storage Daemon has access to unencrypted content.

As a Bareos administrator, you can communicate with the backup software using a command-line interface (bconsole) or your preferred web browser (Bareos WebUI). The multilingual web interface manages multiple Bareos Directors and their databases. Also, it's possible to configure role-based access and create different profiles with ACLs (Access Control Lists) to control what a user can see and execute in the WebUI.

![Bareos WebUI][4]
Image by: (Heike Jurzik, CC BY-SA 4.0)

The WebUI provides an overview and detailed information about backup jobs, clients, file sets, pools, volumes, and more. It's also possible to start backup and restore jobs via the web interface. Starting with Bareos 21, the WebUI provides a timeline to display selected jobs. This timeline makes it easy to spot running, finished, or even failed jobs. This is a great feature, especially in larger environments, as it lets you detect gaps in the schedule or identify which backup jobs are taking up the most time.

### Packages, support, and training

There are no license fees for using Bareos. In addition to the Bareos source code, which is available on [GitHub][5], the vendor provides Bareos packages in two different repositories:

* The community repository contains packages for all major releases (without support).
* The subscription repository also offers packages for minor releases with updates, bug fixes, etc., for customers with a Bareos subscription.

Customers with a valid subscription can also buy support and consulting from the manufacturer or sponsor the development of new features. Bareos GmbH & Co. KG has a global partner network, offering support and training in multiple languages.

### Join the Bareos community

Bareos is a very [active open source project][6] with a great community. The source code of the software and the [Bareos manual][7] sources are hosted on GitHub, and everyone is welcome to contribute. Bareos also offers two mailing lists, one for users ([bareos-users][8]) and one for developers ([bareos-devel][9]). For news and announcements, technical guides, quick howtos, and more, you can also follow the [Bareos blog][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/bareos-open-source-client-server-backup-solution

作者：[Heike Jurzik][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hej
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/puzzle_computer_solve_fix_tool.png
[2]: https://www.bareos.com/
[3]: https://opensource.com/sites/default/files/2022-05/components.png
[4]: https://opensource.com/sites/default/files/2022-05/webui-restore-single-file.png
[5]: https://www.bareos.com/community/github/
[6]: https://www.openhub.net/p/bareos
[7]: https://docs.bareos.org/
[8]: https://groups.google.com/forum/#!forum/bareos-users
[9]: https://groups.google.com/forum/#!forum/bareos-devel
[10]: https://www.bareos.com/blog/
