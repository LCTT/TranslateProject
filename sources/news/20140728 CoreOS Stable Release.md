2q1w2007翻译中
CoreOS Stable Release
================================================================================
First off, [Happy SysAdmin Day][1]. We think we have a pretty good SysAdmin surprise in store for you today as we are announcing the CoreOS stable release channel. Starting today, you can begin running CoreOS in production. This version is the most tested, secure and reliable version available for users wanting to run CoreOS. This is a huge milestone for us. Since our first alpha release in August 2013:

- 191 releases have been tagged
- Tested on hundreds of thousands of servers on the alpha and beta channels
- Supported on 10+ platforms, ranging from bare metal to being primary images on Rackspace and Google

It is a big day for us here at CoreOS, as we have been working hard to deliver the stable release. Of course, we couldn’t do this without the community so thank you for all of your support and contributions to the project.

[CoreOS 367.1.0][2], our first version on the stable channel, includes the following:

- Linux 3.15.2
- Docker 1.0.1
- Support on all major cloud providers, including Rackspace Cloud, Amazon EC2 (including HVM), and Google Compute Engine
- Commercial support via [CoreOS Managed Linux][3]

This is a great opportunity to read about our [Update Philosophy][4] if you haven't already done so.

Please note: The stable release is not including etcd and fleet as stable, this release is only targeted at the base OS and Docker 1.0. etcd/fleet stable support will be in subsequent releases.

For those of you who want to start running CoreOS in production be sure to review our quick [Switching Release Channels][5] guide. As you're booting new machines, be sure to base them off your desired channel from the beginning.

Finally, thanks to the community for your support. We can’t wait to hear your feedback. For those looking for additional support of running CoreOS in production, be sure to check out our [Managed Linux][6] offerings, as we have a full support team in place ready to answer any questions you may have.

Happy SysAdmin Day, and thank you for making the web awesome.

--------------------------------------------------------------------------------

via: https://coreos.com/blog/stable-release/

作者：Alex Polvi
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://sysadminday.com/
[2]:https://coreos.com/releases/#367.1.0
[3]:https://coreos.com/products/managed-linux/
[4]:https://coreos.com/using-coreos/updates/
[5]:https://coreos.com/docs/cluster-management/setup/switching-channels/
[6]:https://coreos.com/products/managed-linux/