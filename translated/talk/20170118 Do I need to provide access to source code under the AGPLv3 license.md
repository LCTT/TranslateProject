我需要在 AGPLv3 许可证下提供源码么？
============================================================

 ![Do I need to provide access to source code under the AGPLv3 license?](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/LAW_PatentSpotlight_520x292_cm.png.png?itok=bCn-kMx2 "Do I need to provide access to source code under the AGPLv3 license?") 

图片提供：opensource.com

[GNU Affero 通用公共许可证版本 3][1]（AGPLv3）是与 GPLv3 几乎相同的左版（copyleft）许可证。两个许可证具有相同的公共版权范围，但在一个重要方面有重大差异。 AGPLv3 的第 13 节规定了 GPLv2 或 GPLv3 中不存在的附加条件：

> 在本许可证的其它条款之外，如果你修改了程序，你必须把你修改的版本，给你的那些使用计算机网络远程（如果你的版本支持此类交互）与之交互的用户，明确提供一个通过一些标准或者常规的复制手段，从网络服务器上免费获得与你所修改的版本相匹配的源码的机会。

这个“通过计算机网络远程交互”的范围主要被认为是 SaaS 部署的情形，尽管其实际上读起来的意思超乎了惯例的 SaaS 部署情形。其目标是解决在用户在使用像 Web Services 这样的功能时，其代码没有公开的常规 GPL 协议所暴露出的漏洞。因此，该协议的第 13 节，在 GPLv2 第 3 节以及 GPLv3 和 AGPLv3 第 6 节中包含的目标代码分发的触发要求之外，提供了额外的源代码公开的要求。

常常被误解的是，AGPLv3 第 13 节中的源代码分发要求仅在 AGPLv3 软件已被“你”（例如，提供网络服务的实体）修改的地方才触发。我的理解是，只要“你”不修改 AGPLv3 的代码，许可证就不应该被理解为需要按照第 13 节规定的方式访问相应的源码。如我所见，尽管即使公开许可证中不要求公开的源代码也是一个好主意，但在 AGPL 下许多未修改以及标准部署的软件模块根本不会触发第 13 节。

如何解释 AGPL 的条款和条件，包括 AGPL 软件是否已被修改，可能需要根据具体情况的事实和细节进行法律层面的分析。

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/kaufman-picture.jpg?itok=FPIizDR-)

Jeffrey R. Kaufman 是全球领先的开源软件解决方案提供商 Red Hat 公司的开源 IP 律师。Jeffrey 也是托马斯·杰斐逊法学院的兼职教授。在入职 Red Hat 之前，Jeffrey 曾经担任高通公司的专利顾问，向首席科学家办公室提供开源顾问。Jeffrey 在 RFID、条形码、图像处理和打印技术方面拥有多项专利。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/providing-corresponding-source-agplv3-license

作者：[Jeffrey Robert Kaufman][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Bestony](https://github.com/Bestony)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jkaufman
[1]:https://www.gnu.org/licenses/agpl-3.0-standalone.html
