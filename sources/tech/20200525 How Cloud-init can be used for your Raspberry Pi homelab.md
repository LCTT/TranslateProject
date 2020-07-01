[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Cloud-init can be used for your Raspberry Pi homelab)
[#]: via: (https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

How Cloud-init can be used for your Raspberry Pi homelab
======
Automate adding new devices and users to your homelab while getting to
know a cloud-industry standard.
![gears and lightbulb to represent innovation][1]

[Cloud-init][2] is a standard—it would not be a stretch to say it is _the_ standard—that cloud providers use to provide initialization and configuration data to cloud instances. It is used most often on the first boot of a new instance to automate network setup, account creation, and SSH (secure shell) key installation—anything required to bring a new system online so that it is accessible by the user.

In a previous article, [_Modify a disk image to create a Raspberry Pi-based homelab_][3], I showed how to customize the operating system image for single-board computers like the Raspberry Pi to accomplish a similar goal. With Cloud-init, there is no need to add custom data to the image. Once it is enabled in your images, your virtual machines, physical servers, even tiny Raspberry Pis can behave like cloud instances in your own "private cloud at home." New machines can just be plugged in, turned on, and automatically become part of your [homelab][4].

To be honest, Cloud-init is not designed with homelabs in mind. As I mentioned, you can easily modify the disk image for a given set of systems to enable SSH access and configure them after the first boot. Cloud-init is designed for large-scale cloud providers that need to accommodate many customers, maintain a small set of images, and provide a mechanism for those customers to access instances without customizing an image for each of them. A homelab with a single administrator does not face the same challenges.

Cloud-init is not without merit in the homelab, though. Education is one of my goals for the private cloud at home project, and setting up Cloud-init for your homelab is a great way to gain experience with a technology used heavily by cloud providers, large and small. Cloud-init is also an alternative to other initial-configuration options. Rather than customizing each image, ISO, etc. for every device in your homelab and face tedious updates when you want to make changes, you can just enable Cloud-init. This reduces technical debt—and is there anything worse than _personal_ technical debt? Finally, using Cloud-init in your homelab allows your private cloud instances to behave the same as any public cloud instances you have or may have in the future—a true [hybrid cloud][5].

### About Cloud-init

When an instance configured for Cloud-init boots up and the service (actually, four services in systemd implementations to handle dependencies during the boot process) starts, it checks its configuration for a [datasource][6] to determine what type of cloud it is running in. Each major cloud provider has a datasource configuration that tells the instance where and how to retrieve configuration information. The instance then uses the datasource information to retrieve configuration information provided by the cloud provider, such as networking information and instance-identification information, and configuration data provided by the customer, such as authorized keys to be copied, user accounts to be created, and many other possible tasks.

After retrieving the data, Cloud-init then configures the instance: setting up networking, copying the authorized keys, etc., and finally completing the boot process. Then it is accessible to the remote user, ready for further configuration with tools like [Ansible][7] or [Puppet][8] or prepared to receive a workload and begin its assigned tasks.

### Configuration data

As mentioned above, the configuration data used by Cloud-init comes from two potential sources: the cloud provider and the instance user. In a homelab, you fill both roles: providing networking and instance information as the cloud provider and providing configuration information as the user.

#### The cloud provider metadata file

In your cloud provider role, your homelab datasource will offer your private cloud instances a metadata file. The [metadata][9] file contains information such as the instance ID, cloud type, Python version (Cloud-init is written in and uses Python), or a public SSH key to be assigned to the host. The metadata file may also contain networking information if you're not using DHCP (or the other mechanisms Cloud-init supports, such as a config file in the image or kernel parameters).

#### The user-provided user-data file

The real meat of Cloud-init's value is in the user-data file. Provided by the user to the cloud provider and included in the datasource, the [user-data][10] file is what turns an instance from a generic machine into a member of the user's fleet. The user-data file can come in the form of an executable script, working the same as the script would in normal circumstances, or as a cloud-config YAML file, which makes use of [Cloud-init's modules][11] to perform configuration tasks.

### Datasource

The datasource is a service provided by the cloud provider that offers the metadata and user-data files to the instances. Instance images or ISOs are configured to tell the instance what datasource is being used.

For example, Amazon AWS provides a [link-local][12] file that will respond to HTTP requests from an instance with the instance's custom data. Other cloud providers have their own mechanisms, as well. Luckily for the private cloud at home project, there are also NoCloud data sources.

[NoCloud][13] datasources allow configuration information to be provided via the kernel command as key-value pairs or as user-data and metadata files provided as mounted ISO filesystems. These are useful for virtual machines, especially paired with automation to create the virtual machines.

There is also a NoCloudNet datasource that behaves similarly to the AWS EC2 datasource, providing an IP address or DNS name from which to retrieve user data and metadata via HTTP. This is most helpful for the physical machines in your homelab, such as Raspberry Pis, [NUCs][14], or surplus server equipment. While NoCloud could work, it requires more manual attention—an anti-pattern for cloud instances.

### Cloud-init for the homelab

I hope this gives you an idea of what Cloud-init is and how it may be helpful in your homelab. It is an incredible tool that is embraced by major cloud providers, and using it at home can be educational and fun and help you automate adding new physical or virtual servers to your lab. Future articles will detail how to create both simple static and more complex dynamic Cloud-init services and guide you in incorporating them into your private cloud at home.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://cloudinit.readthedocs.io/
[3]: https://opensource.com/article/20/5/disk-image-raspberry-pi
[4]: https://opensource.com/article/19/3/home-lab
[5]: https://www.redhat.com/en/topics/cloud-computing/what-is-hybrid-cloud
[6]: https://cloudinit.readthedocs.io/en/latest/topics/datasources.html
[7]: https://www.ansible.com/
[8]: https://puppet.com/
[9]: https://cloudinit.readthedocs.io/en/latest/topics/instancedata.html#
[10]: https://cloudinit.readthedocs.io/en/latest/topics/format.html
[11]: https://cloudinit.readthedocs.io/en/latest/topics/modules.html
[12]: https://en.wikipedia.org/wiki/Link-local_address
[13]: https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html
[14]: https://en.wikipedia.org/wiki/Next_Unit_of_Computing
