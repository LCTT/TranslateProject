[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Red Hat Enterprise Linux 8.2 Hits the stage)
[#]: via: (https://www.networkworld.com/article/3540189/red-hat-enterprise-linux-82-hits-the-stage.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Red Hat Enterprise Linux 8.2 Hits the stage
======
RHEL 8.2 has new capabilities for management of hybrid-cloud environments and container tools to help fuel cloud-native development.
Stephen Lawson/IDG

Red Hat Enterprise Linux (RHEL) 8.2 brings new features that include expanded monitoring capabilities in Red Hat Insights for and new container tools, including containerized versions of Skopeo and Buildah.

Red Hat says RHEL 8.2 is arriving at a time when, because of the Covid-19 pandemic, a growing percentage of IT staffers are working remotely. Their ability to support the management and monitoring of operations and their ability to detect and address problems has never been more critical, and upgrades to Red Hat Insights are designed to help.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

### Red Hat Insights

[Red Hat Insights][2], is Red Hat’s operations and security-risk-management offering and helps detect, diagnose and remediate potential problems before they affect production systems or end users. It was included in RHEL in May 2019.

The latest updates include:

  * Improved visibility and  security for managing large, complex environments
  * Policy and patch services to help determine which product advisories apply and guidance for problem remediation
  * A "drift service" to make it easier to compare baselines, shape strategies that reduce complexity, and make troubleshooting easier



### Monitoring and performance updates

RHEL 8.2 brings some performance upgrades includeing:

  * Improved resource management with Control Groups (cgroup) v2, which is designed to reserve and set limits on memory usage to help prevent processes from overconsuming memory and causing system failures or slowdowns.
  * Optimizing performance-sensitive workloads via NUMA and sub-NUMA service policies.
  * Performance Co-Pilot (PCP) 5.0.2 which adds collection agents for Microsoft SQL Server 2019 to gather and analyze SQL Server metrics to draw a clearer picture of database and operating-system performance.
  * Red Hat subscription watch,a service for viewing and managing RHEL and Red Hat OpenShift Container Platform subscriptions.



### Evolving container tools

RHEL 8.2 includes new container tools that are supported for 24 months as part of Red Hat's Tech Preview, which provides early access to new products. The tools include Buildah for building and Skopeo for transferring container images.

The new relase also introduces Udica, a policy tool for containerized SELinux that can make it less likely that processes will break out of containers and cause problems to other containers or the host.

[][3]

Red Hat Enterprise Linux 8.2 also introduces enhancements to the Red Hat Universal Base Image, including:

  * OpenJDK and .NET 3.0 for developing  certification-ready cloud-native Red Hat applications
  * **Improved access to source code associated with a given image through a single command**, making it easier for Red Hat partners to meet source code requirements for open source licensing needs.



### Ease of use

Other new features are meant to make it easier to manage RHEL:

  * RHEL subscription registration as part of the installation process, making it easier to on-board new installations.
  * Enabling Red Hat Insights during installation to simplify the launch of Insights for Red Hat Enterprise Linux deployments.
  * Refinement and control of the Red Hat Enterprise Linux life cycle with testing for in-place upgrades, Red Hat Insights rules to help with upgrades, and the [Convert2 RHEL][4] tool that can help shift workloads from unsupported clones like CentOS to RHEL.



Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3540189/red-hat-enterprise-linux-82-hits-the-stage.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.redhat.com/en/blog/expanding-management-operational-and-security-risks-new-red-hat-insights
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.redhat.com/en/blog/convert2rhel-how-update-rhel-systems-place-subscribe-rhel
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
