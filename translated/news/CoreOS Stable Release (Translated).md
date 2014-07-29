Translating by lfzark


CoreOS稳定版发布
================================================================================
首先，祝大家SysAdmin节快乐。随着今日CoreOS稳定版的发布，我们相信我们已经为SysAdmin节准备好了一个不错的惊喜。从今天起，用户可以在产品中

运行CoreOS了。这个版本是用户想要的最经考验，最安全，最可靠的CoresOS版本。这对我们来说，是一个重大的里程碑。自从2013年八月我们第一个alpha版本


发布以来

- 191个发布版本
- 在alpha和beta频道上测试了成千上万的服务器
- 支持10个以上平台，从裸机到Rackspace和Google云平台的主要镜像


对我们来说这是一个极为重要的日子，因为我们为了稳定版的发布付出了努力的工作。当然，如果没有社区的帮助，我们完成不了这些工作，感谢你们所有对项目的支持和贡献。
[CoreOS 367.1.0][2], 我们在稳定channel上的第一个版本, 包括以下支持:

- Linux 3.15.2
- Docker 1.0.1
- 所有主流的云服务商的支持, 包括 Rackspace Cloud, Amazon EC2 (包括 HVM), 和 Google Compute Engine
- 通过 [CoreOS Managed Linux][3] 的商业支持 

如果你还没有阅读我们的[Update Philosophy][4]，我相信这是一个不错的选择。

请注意：稳定发布版本由于稳定性不包括etcd和fleet ，此发布版支持目标在基础OS和Docker1.0。etcd/fleet的稳定版本支持会在随后的发布版本中

如果想开始在产品中运行CoreOS，请确保阅读我们的快速指南  [Switching Release Channels][5]。由于你正在引导新机器，请确保在一开始就把他们建立在你想要的channel上


最后，感谢社区的支持。我们迫不及待地想听到你们得反馈。而这些在运行CoreOS上寻求额外支持的用户，请确保查看我们的[Managed Linux][6] 建议，因为我们已经有了一个完整的支持团队，他们正在准备回答你遇到的任何问题。

SysAdmin节快乐，感谢你们让互联网变得如此令人惊叹。
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
