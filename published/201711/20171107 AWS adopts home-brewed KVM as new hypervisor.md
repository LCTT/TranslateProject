AWS 采用自制的 KVM 作为新的管理程序
============================================================

> 摆脱了 Xen，新的 C5 实例和未来的虚拟机将采用“核心  KVM 技术”

AWS 透露说它已经创建了一个基于 KVM 的新的<ruby>管理程序<rt>hypervisor</rt></ruby>，而不是多年来依赖的 Xen 管理程序。

新的虚拟机管理程序披露在 EC2 新实例类型的[新闻][3]脚注里，新实例类型被称为 “C5”，由英特尔的 Skylake Xeon 提供支持。AWS 关于新实例的 [FAQ][4] 提及“C5 实例使用新的基于核心 KVM 技术的 EC2 虚拟机管理程序”。

这是爆炸性的新闻，因为 AWS 长期以来一直支持 Xen 管理程序。Xen 项目从最强大的公共云使用其开源软件的这个事实中吸取了力量。Citrix 将其大部分 Xen 服务器运行了 AWS 的管理程序的闭源版本。

更有趣的是，AWS 新闻中说：“未来，我们将使用这个虚拟机管理程序为其他实例类型提供动力。” 这个互联网巨头的文章中计划在“一系列 AWS re:Invent 会议中分享更多的技术细节”。

这听上去和很像 AWS 要放弃 Xen。

新的管理程序还有很长的路要走，这解释了为什么 AWS 是[最后一个运行 Intel 新的 Skylake Xeon CPU 的大型云服务商][5]，因为 AWS 还透露了新的 C5 实例运行在它所描述的“定制处理器上，针对 EC2 进行了优化。”

Intel 和 AWS 都表示这是一款定制的 3.0 GHz Xeon Platinum 8000 系列处理器。Chipzilla 提供了一些该 CPU 的[新闻发布级别的细节][6]，称它与 AWS 合作开发了“使用最新版本的 Intel 数学核心库优化的 AI/深度学习引擎”，以及“ MXNet 和其他深度学习框架为在 Amazon EC2 C5 实例上运行进行了高度优化。”

Intel 之前定制了 Xeons，将其提供给 [Oracle][7] 等等。AWS 大量购买 CPU，所以英特尔再次这样做并不意外。

迁移到 KVM 更令人惊讶，但是 AWS 可以根据需要来调整云服务以获得最佳性能。如果这意味着构建一个虚拟机管理程序，并确保它使用自定义的 Xeon，那就这样吧。

不管它在三周内发布了什么，AWS 现在都在说 C5 实例和它们的新虚拟机管理程序有更高的吞吐量，新的虚拟机在连接到弹性块存储 （EBS） 的网络和带宽都超过了之前的最佳记录。

以下是 AWS 在 FAQ 中的说明：

> 随着 C5 实例的推出，Amazon EC2 的新管理程序是一个主要为 C5 实例提供 CPU 和内存隔离的组件。VPC 网络和 EBS 存储资源是由所有当前 EC2 实例家族的一部分的专用硬件组件实现的。

> 它基于核心的 Linux 内核虚拟机（KVM）技术，但不包括通用的操作系统组件。

换句话说，网络和存储在其他地方完成，而不是集中在隔离 CPU 和内存资源的管理程序上：

> 新的 EC2 虚拟机管理程序通过删除主机系统软件组件，为 EC2 虚拟化实例提供一致的性能和增长的计算和内存资源。该硬件使新的虚拟机管理程序非常小，并且对用于网络和存储的数据处理任务没有影响。

> 最终，所有新实例都将使用新的 EC2 虚拟机管理程序，但是在近期内，根据平台的需求，一些新的实例类型将使用 Xen。

> 运行在新 EC2 虚拟机管理程序上的实例最多支持 27 个用于 EBS 卷和 VPC ENI 的附加 PCI 设备。每个 EBS 卷或 VPC ENI 使用一个 PCI 设备。例如，如果将 3 个附加网络接口连接到使用新 EC2 虚拟机管理程序的实例，则最多可以为该实例连接 24 个 EBS 卷。

> 所有面向公众的与运行新的 EC2 管理程序的 EC2 交互 API 都保持不变。例如，DescribeInstances 响应的 “hypervisor” 字段将继续为所有 EC2 实例报告 “xen”，即使是在新的管理程序下运行的实例也是如此。这个字段可能会在未来版本的 EC2 API 中删除。

你应该查看 FAQ 以了解 AWS 转移到其新虚拟机管理程序的全部影响。以下是新的基于 KVM 的 C5 实例的统计数据：


| 实例名 | vCPU | RAM（GiB） | EBS*带宽 | 网络带宽 |
|:--|:--|:--|:--|:--|
| c5.large | 2 | 4 | 最高 2.25 Gbps | 最高 10 Gbps |
| c5.xlarge | 4 | 8 | 最高 2.25 Gbps | 最高 10 Gbps |
| c5.2xlarge | 8 | 16 | 最高 2.25 Gbps | 最高 10 Gbps |
| c5.4xlarge | 16 | 32 | 2.25 Gbps | 最高 10 Gbps |
| c5.9xlarge | 36 | 72 | 4.5 Gbps | 10 Gbps |
| c5.18xlarge | 72 | 144 | 9 Gbps | 25 Gbps |

每个 vCPU 都是 Amazon 购买的物理 CPU 上的一个线程。

现在，在 AWS 的美国东部、美国西部（俄勒冈州）和欧盟地区，可以使用 C5 实例作为按需或点播服务器。该公司承诺其他地区将尽快提供。

--------------------------------------------------------------------------------

via: https://www.theregister.co.uk/2017/11/07/aws_writes_new_kvm_based_hypervisor_to_make_its_cloud_go_faster/

作者：[Simon Sharwood][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.theregister.co.uk/Author/Simon-Sharwood
[1]:https://www.theregister.co.uk/Author/Simon-Sharwood
[2]:https://forums.theregister.co.uk/forum/1/2017/11/07/aws_writes_new_kvm_based_hypervisor_to_make_its_cloud_go_faster/
[3]:https://aws.amazon.com/blogs/aws/now-available-compute-intensive-c5-instances-for-amazon-ec2/
[4]:https://aws.amazon.com/ec2/faqs/#compute-optimized
[5]:https://www.theregister.co.uk/2017/10/24/azure_adds_skylakes_in_fv2_instances/
[6]:https://newsroom.intel.com/news/intel-xeon-scalable-processors-supercharge-amazon-web-services/
[7]:https://www.theregister.co.uk/2015/06/04/oracle_intel_team_on_server_with_a_dimmer_switch/
