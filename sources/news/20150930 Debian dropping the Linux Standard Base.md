Debian拋弃Linux标准规范
=======================

Linux标准规范（LSB）是一个意图定义一个Linux发行版提供的第三方程序的服务和应用层ABI的[规范][1]。但Debian项目内的某些人正在质疑维持LSB一致性的价值，他们认为，该项工作的工作量巨大，但好处有限。

LSB于2001年首次公布，建立在[POSIX][2]和[单一UNIX规范][3]的基础之上。目前，LSB由Linux基金会的一个[工作小组][4]维护。最新的版本是于2015年6月发布的[LSB 5.0][5]。它定义了五个LSB模块（核芯、桌面、语言、图形和试用）。

每个模块都包含了一系列所需的库及其强制性版本，外加对每个库的公共函数和数据定义的描述。这些模块还包括命名和组织规范，如[文件系统层次标准（FHS）][6]中的文件系统布局或象Freedesktop的[XDG基础目录][7]规范这样的目录规范。

似乎只是一个巧合，就在 LSB 5.0 发布的那一周，Debian 项目内部针对Debian是否值得追求维持LSB一致性进行了一次讨论。在另一个贴子中，在提及LSB一致性后，Didier Raboud顺势[提议][8]将Debian的一致性工作维持在最低水平。他说，目前的情况是，Debian的“lsb-*”元包要求有该标准中提及的库的正确版本，但事实上却没有人去检查所有的符号和数据定义是否满足要求。

另外，LSB还不断在膨胀；他说，4.1版（Debian “jessie”发布时的最新版本）包含“*1493个组件、1672个库、38491条命令、30176个类和716202个接口*”。似乎没有人有兴趣检查Debian包中的这些细节，他解释道，“*去年在DebConf上我举行过一次LSB BoF，后来又与很多人讨论过src:lsb，我收回自己的‘几乎没有人在意’的说法*”。但，重要的是，兴趣的缺乏似乎并不仅局限于Debian：

	我认为，这个问题的关键在于是否值得去玩这整个游戏：我还没听说有哪个软件通过LSB包来发行。LSB认证的应用清单上只有6个公司的_8_个应用，其中仅有一个 LSB >= 4。

Raboud提议Debian摈弃除了[lsb-base][9]包（目前包括一个用于启动系统所需的小的shell函数集合）和[lsb-release][10]包（提供一个简单工具，用户可用它查询发行版的身份以及该发行版宣称的与哪个LSB级别一致）之外的所有内容。

[后来][11]，他又称，将LSB基本上改变为“*Debian和FLOSS世界中的所有其它演员所实际做的任何事*”可能会使得该标准（以及在Debian为支持它所做的工作）更有价值。但此时他再次质疑是否有人会对推动这个目标有兴趣。

如果说他最初称LSB中缺乏兴趣没有足够的证据，随后整整三个月之内没有任何人对维持LSB-一致性的包提供支持，并进行了两次拋弃它们的投票。最后，9月17日，Raboud[宣布][12]他已经抽掉`src:lsb`包（如前所述，保留了`lsb-base`和`lsb-release`），将将其上载到“unstable”档案中。感兴趣的用户可通过最小限度的工具集来启动下一个Debian版本，并查询它是否符合LSB-一致性：结果将为“否”。

Raboud补充说，即便摈弃了LSB一致性，Debian仍计划保留FHS一致性：

	但Debian并没有放弃所有的LSB：我们仍将严格遵守FHS（Debian Policy中的版本2.3；虽然今年8月已经发布了3.0），而且我们的SysV启动脚本几乎全部遵循VIII.22.{2-8}。但请不要误解我们，此次src:lsb上载明确说明我们将离开LSB。

在该宣告之后，Nikolaus Rath[回应][13]称某些私有应用依赖`/lib`和`/lib64`中的符号链接`ld-lsb.so*`，而这些符号链接由`lsb-*`包提供。Raboud则[建议][14]应改由`libc6`包提供；包维护人员Aurelien Jarno[称][15]，如果提供这样一个补丁，他将会接受它。

似乎唯一的遗留问题只是某些打印机驱动包会依赖LSB一致性。Raboud称，在其首个贴子中已经说明，据他所知，实际发布的唯一一个依赖LSB一致性的包为[OpenPrinting][16]驱动程序。Michael Biebl[称][17]，主档案中有这样一个驱动包；Raboud则[回应][18]说，他相信有问题的包应该被移到非自由仓库，因其包括了一个二进制驱动。

于是，这个问题看上去已经尘埃落定，至于对于目前的Debian开发周期来说是如此的状况。很自然的是，未来让人更感觉兴趣的是，如果该决定存在一些影响的话，那么人们将会看到它对更广泛的LSB接受度有何影响。正如Raboud所说的那样，被认证为LSB-一致性的发行版数量很[小][19]。人们很难不注意到这些发行版很大程度上是“企业”的变种。

也许，对某些商业领域来说，LSB仍很重要，但很难知道有多少那些企业发行版的客户真正关心LSB认证标签。然而，如果Debian按此发展下去，对这种认证的一般兴趣可能会急剧下降。

via：https://lwn.net/Articles/658809/

作者：Nathan Willis
译者：[Yuking](https://github.com/Yuking-net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，
[Linux中国](https://linux.cn/) 荣誉推出


[1]:http://refspecs.linuxfoundation.org/lsb.shtml
[2]:https://en.wikipedia.org/wiki/POSIX
[3]:https://en.wikipedia.org/wiki/Single_UNIX_Specification
[4]:http://www.linuxfoundation.org/collaborate/workgroups/lsb
[5]:http://www.linuxfoundation.org/collaborate/workgroups/lsb/lsb-50
[6]:http://www.linuxfoundation.org/collaborate/workgroups/lsb/fhs
[7]:http://standards.freedesktop.org/basedir-spec/basedir-spec-0.6.html
[8]:https://lwn.net/Articles/658838/
[9]:https://packages.debian.org/sid/lsb-base
[10]:https://packages.debian.org/sid/lsb-release
[11]:https://lwn.net/Articles/658842/
[12]:/Articles/658843/
[13]:/Articles/658846/
[14]:/Articles/658847/
[15]:/Articles/658848/
[16]:http://www.linuxfoundation.org/collaborate/workgroups/openprinting/
[17]:/Articles/658844/
[18]:/Articles/658845/


