AWS adopts home-brewed KVM as new hypervisor
============================================================

### Out with Xen, in with 'core KVM technology' for new C5 instances and future VMs too


AWS has revealed it has created a new hypervisor based on KVM, not the Xen hypervisor on which it has relied for years.

The new hypervisor was unveiled as a virtual footnote in [news][3] of new EC2 instance type called the "C5" powered by Intel's Skylake Xeons. AWS's [FAQ][4] about the new instances notes "C5 instances use a new EC2 hypervisor that is based on core KVM technology."

That's explosive news, because AWS has long-championed the Xen hypervisor. The Xen Project has drawn strength from the fact the mightiest public cloud uses its open-source wares. Citrix makes much of its Xen Server running a close cousin of AWS's hypervisor.

More interesting still is AWS's news that “going forward, we’ll use this hypervisor to power other instance types.” The internet giant's post teases us with plans to “share additional technical details in a set of AWS re:Invent sessions.”

Which sounds a lot like AWS is giving Xen the flick.

The new hypervisor goes a long way towards explaining why AWS is [the last of the big clouds][5] to run Intel's new Skylake Xeon CPUs, because AWS has also revealed the new C5 instances run on what it describes as “a custom processor, optimized for EC2.”

Intel and AWS both say this is a custom 3.0 GHz Xeon Platinum 8000-series processor. Chipzilla has offered a few [press-release-grade details][6]of the CPU, saying it worked with AWS on "optimized AI/deep learning engines with the latest version of the Intel Math Kernel Library" and that "MXNet and other deep learning frameworks are highly optimized to run on Amazon EC2 C5 instances."

Intel's done custom Xeons before, offering them to [Oracle][7], among others. AWS buys CPUs by the boatload so it is no surprise Intel's done so again.

The move to KVM is more surprising, but AWS does whatever is needed to tune its cloud for optimal performance. If that means building a hypervisor and making sure it hooks into custom Xeons, so be it.

Whatever it reveals in three weeks, AWS is now saying the C5 instances and their new hypervisor are all about faster throughput, as the new VMs beat its previous best for network and bandwidth connecting to the cloudy concern's elastic block store (EBS).

Here's what AWS has to say in the FAQ:

The new hypervisor for Amazon EC2, introduced with the launch of C5 instances, is a component that primarily provides CPU and memory isolation for C5 instances. VPC networking and EBS storage resources are implemented by dedicated hardware components that are part of all current generation EC2 instance families.

It is built on core Linux Kernel-based Virtual Machine (KVM) technology, but does not include general purpose operating system components.

In other words, network and storage is done elsewhere, rather than in the hypervisor, which concentrates on carving up CPU and memory resources:

The new EC2 hypervisor provides consistent performance and increased compute and memory resources for EC2 virtualized instances by removing host system software components ... This hardware enables the new hypervisor to be very small and uninvolved in data processing tasks for networking and storage.

Eventually all new instance types will use the new EC2 hypervisor, but in the near term, some new instance types will use Xen depending on the requirements of the platform.

Instances running on the new EC2 hypervisor support a maximum of 27 additional PCI devices for EBS volumes and VPC ENIs. Each EBS volume or VPC ENI uses a PCI device. For example, if you attach 3 additional network interfaces to an instance that uses the new EC2 hypervisor, you can attach up to 24 EBS volumes to that instance.

All the public facing APIs for interacting with EC2 instances that run using the new EC2 hypervisor will remain the same. For example, the “hypervisor” field of the DescribeInstances response, which will continue to report “xen” for all EC2 instances, even those running under the new hypervisor. This field may be removed in a future revision of the EC2 API.

You should check the FAQ for the full impact of AWS moving to its new hypervisor. Here's the stats-fest for the new KVM-based C5 instances:


| Instance Name | vCPUs | RAM in GiB | EBS*Bandwidth | Network Bandwidth |
|:--|:--|:--|:--|:--|
| c5.large | 2 | 4 | Up to 2.25 Gbps | Up to 10 Gbps |
| c5.xlarge | 4 | 8 | Up to 2.25 Gbps | Up to 10 Gbps |
| c5.2xlarge | 8 | 16 | Up to 2.25 Gbps | Up to 10 Gbps |
| c5.4xlarge | 16 | 32 | 2.25 Gbps | Up to 10 Gbps |
| c5.9xlarge | 36 | 72 | 4.5 Gbps | 10 Gbps |
| c5.18xlarge | 72 | 144 | 9 Gbps | 25 Gbps |

Each vCPU is a single thread on the physical CPU Amazon's acquired.

C5 instances are available now in AWS's US East, US West (Oregon), and EU regions, as on-demand or spot servers. The biz promises additional regions will offer them soon. ®

--------------------------------------------------------------------------------

via: https://www.theregister.co.uk/2017/11/07/aws_writes_new_kvm_based_hypervisor_to_make_its_cloud_go_faster/

作者：[ Simon Sharwood][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.theregister.co.uk/Author/Simon-Sharwood
[1]:https://www.theregister.co.uk/Author/Simon-Sharwood
[2]:https://forums.theregister.co.uk/forum/1/2017/11/07/aws_writes_new_kvm_based_hypervisor_to_make_its_cloud_go_faster/
[3]:https://aws.amazon.com/blogs/aws/now-available-compute-intensive-c5-instances-for-amazon-ec2/
[4]:https://aws.amazon.com/ec2/faqs/#compute-optimized
[5]:https://www.theregister.co.uk/2017/10/24/azure_adds_skylakes_in_fv2_instances/
[6]:https://newsroom.intel.com/news/intel-xeon-scalable-processors-supercharge-amazon-web-services/
[7]:https://www.theregister.co.uk/2015/06/04/oracle_intel_team_on_server_with_a_dimmer_switch/
