[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up a hyperconverged infrastructure with open source tools)
[#]: via: (https://opensource.com/article/20/12/hyperconverged-infrastructure)
[#]: author: (Sahina Bose https://opensource.com/users/sahina)

Set up a hyperconverged infrastructure with open source tools
======
Run a full-featured virtualization environment with oVirt and Gluster
and without burning a hole in your pocket.
![Computer laptop in space][1]

A modern infrastructure's needs are ever-growing. As demand grows for scaling up applications, our existing servers and storage are no longer enough. This is the point when most businesses look at setting up a virtualized environment on-premises or turning to public cloud infrastructure. But the cost of setting up your own environment or running it on the public cloud can be daunting.

Fortunately, it is entirely possible to run a full-featured virtualization environment with completely open source products without burning a hole in your pocket.

A hyperconverged environment is one where compute, storage, and network resources are all on the same servers, managed by a single interface. As I will show in this article, you can run a full-featured virtualized infrastructure with optimal use of servers by using [oVirt][2] and [Gluster][3] to deploy a hyperconverged solution.

### Prerequisites

You will need the following hardware infrastructure:

  * Three servers with:
    * 32GB RAM or more
    * Minimum 256GB storage (for anything more than a proof of concept, you will need more storage, think in terabytes)
    * Dual network interface controller (NIC) and at least one 10GiB port
  * Network switch
  * Configured media access control (MAC) reservation and Domain Name System (DNS) entry



The software components you need for this solution are:

  * [**oVirt**][2], an open source virtualization software management solution with all the enterprise features you need, such as host, virtual machine (VM) and network management, high availability, and live migration
  * [**GlusterFS**][3], an open source scalable distributed storage that can run highly available petabyte-scale storage on commodity hardware.



### How it works

These two open source solutions work together to provide a hyperconverged solution. Each server provides both hypervisor and storage capabilities, with the VM disk images stored on the Gluster volume.

The Gluster volume allows storage from multiple servers to present as a single, unified namespace to the client. In this solution, the Gluster volume is configured from storage on the three servers as a replica-3 volume, which means every bit of data that's written is replicated to two other servers to provide redundancy and resiliency against server outages.

Gluster volumes can also be configured to run as [arbiter volumes][4], which have lower storage requirements than replica-3 volumes, as data is copied to only one other server while metadata is written on a third server. Both of these volume configurations ensure that the VMs continue to run without downtime if one of the servers goes down.

[Libvirt][5] and [qemu-kvm][6] are used to create the VM images and run them on the servers. The oVirt engine manages creating, scheduling, and monitoring of VMs. Since the storage is shared across all three servers, the VMs can run on any of the three servers, allowing for live migration and high availability.

oVirt has two main components:

  * **oVirt Engine** is a Java-based web application that manages the server and virtual machines. The engine can either run on a standalone server or a VM within the same infrastructure that it manages.
  * **Vdsm** is a Python service that runs on every server and interacts with the engine and the subcomponents on the server.



In the hyperconverged deployment, the oVirt engine runs as a VM managing the servers that it runs on. In this mode, it's also known as "Hosted Engine."

![Hosted Engine architecture][7]

(Sahina Bose, [CC BY-SA 4.0][8])

### Putting it all together

With so many components involved, you may find the thought of setting everything up daunting. However, installation is easy with the oVirt Node ISO, which contains all the required packages and a [Cockpit][9]-based installation wizard that guides you through the steps.

  1. Download and install the latest [oVirt Node ISO][10] on all three servers.

  2. Navigate to the Cockpit server administration URL on any of the servers at `https://<server1>:9090`.

  3. Follow the steps for the Hosted Engine installation with Gluster.

![Hosted Engine installation UI][11]

(Sahina Bose, [CC BY-SA 4.0][8])

These steps guide you through:

    * Setting up networks and hosts

![Network and hosts setup][12]

(Sahina Bose, [CC BY-SA 4.0][8])

A minimum of three hosts is required to run a highly available environment. The wizard prompts you to separate the storage network from the management network.

    * Setting up the Gluster volume

![Setting up the Gluster volume][13]

(Sahina Bose, [CC BY-SA 4.0][8])

By default, three Gluster volumes are created to hold the VM disk images. The engine volume is dedicated to holding the Hosted Engine disk image. Separating this helps with easy backup and recovery.

![Engine volume setup][14]

(Sahina Bose, [CC BY-SA 4.0][8])

Most of the configuration is automated, but you need to ensure you provide the underlying disk information to the user interface.

    * Deploying the oVirt engine as Hosted Engine

![Engine volume deployment][15]

(Sahina Bose, [CC BY-SA 4.0][8])

Once the storage has been configured, you must provide the details for the Hosted Engine VM—the fully qualified domain name ([FQDN][16]) and the MAC address reserved for the VM—to complete the deployment.




### Learn more

It's this simple to set up a fully functional hyperconverged environment with a management interface you can use to manage and monitor your virtual machines, storage, and network. For further information, please refer to the [oVirt-Gluster hyperconvergence guide][17].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/hyperconverged-infrastructure

作者：[Sahina Bose][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sahina
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://www.ovirt.org/
[3]: https://www.gluster.org/
[4]: https://docs.gluster.org/en/v3/Administrator%20Guide/arbiter-volumes-and-quorum/
[5]: https://en.wikipedia.org/wiki/Libvirt
[6]: https://en.wikipedia.org/wiki/QEMU
[7]: https://opensource.com/sites/default/files/uploads/ovirt_hostedengine.jpg (Hosted Engine architecture)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/article/20/11/cockpit-server-management
[10]: https://www.ovirt.org/download/node.html
[11]: https://opensource.com/sites/default/files/uploads/ovirt_hostedenginesetup.png (Hosted Engine installation UI)
[12]: https://opensource.com/sites/default/files/uploads/ovirt_networks-hosts-setup.png (Network and hosts setup)
[13]: https://opensource.com/sites/default/files/uploads/ovirt_gluster-setup.png (Setting up the Gluster volume)
[14]: https://opensource.com/sites/default/files/uploads/ovirt_engine-volume.png (Engine volume setup)
[15]: https://opensource.com/sites/default/files/blocks/ovirt_engine-volume-deploy.png (Engine volume deployment)
[16]: https://en.wikipedia.org/wiki/Fully_qualified_domain_name
[17]: https://www.ovirt.org/documentation/gluster-hyperconverged/Gluster_Hyperconverged_Guide.html
