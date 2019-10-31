[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11522-1.html)
[#]: subject: (Fedora 31 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-31/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 31 正式发布
======

![][1]

这里，我们很荣幸地宣布 Fedora 31 的发布。感谢成千上万的 Fedora 社区成员和贡献者的辛勤工作，我们现在正在庆祝又一次的准时发布。这已成为一种惯例！

如果你只想立即获取它，请立即访问 <https://getfedora.org/>。要了解详细信息，请继续阅读！

### 工具箱

如果你还没有使用过 [Fedora 工具箱][2]，那么现在是尝试一下的好时机。这是用于启动和管理个人工作区容器的简单工具，你可以在一个单独的环境中进行开发或试验。它只需要在命令行运行 `toolbox enter` 就行。

这种容器化的工作流程对于基于 ostree 的 Fedora 变体（如 CoreOS、IoT 和 Silverblue）的用户至关重要，但在任何工作站甚至服务器系统上也非常有用。在接下来的几个月中，希望对该工具及其相关的用户体验进行更多增强，非常欢迎你提供反馈。

### Fedora 风味版

Fedora 的“版本”是针对特定的“展示柜”用途输出的。

Fedora 工作站版本专注于台式机，以及希望获得“可以工作的” Linux 操作系统体验的特定软件开发人员。此版本具有 GNOME 3.34，它带来了显著的性能增强，在功耗较低的硬件上尤其明显。

Fedora 服务器版本以易于部署的方式为系统管理员带来了最新的、最先进的开源服务器软件。

而且，我们还有处于预览状态下的 Fedora CoreOS（一个定义了现代容器世界分类的操作系统）和[Fedora IoT][3]（用于“边缘计算”用例）。（敬请期待计划中的给该物联网版本的征集名称的活动！）

当然，我们不仅仅提供的是各种版本。还有面向各种受众和用例的 [Fedora Spins][4] 和 [Labs][5]，包括 [Fedora 天文学][6] 版本，为业余和专业的天文学家带来了完整的开源工具链，以及支持各种桌面环境（例如 [KDE Plasma][7] 和 [Xfce][8]）。

而且，请不要忘记我们的替代架构 [ARM AArch64、Power 和 S390x][9]。特别要注意的是，我们对包括 Rock960、RockPro64 和 Rock64 在内的 Rockchip 片上系统设备的支持得到了改善，并初步支持了 “[panfrost][10]”，这是一种较新的开源 3D 加速图形驱动程序 Arm Mali "midgard" GPU。

不过，如果你使用的是只支持 32 位的 i686 旧系统，那么该找个替代方案了，[我们的基本系统告别了 32 位 Intel 架构][11]。

### 常规改进

无论你使用哪种 Fedora 版本，你都将获得开源世界所提供的最新版本。遵循 “[First][12]” 准则，我们启用了 CgroupsV2（如果你使用的是 Docker，[请确保检查一下][13]）。Glibc 2.30 和 NodeJS 12 是 Fedora 31 中许多更新的软件包之一。而且，我们已经将 `python` 命令切换为 Python 3，请记住，Python 2 在[今年年底][14]生命期就终止了。

我们很高兴你能试用新版本！转到 <https://getfedora.org/> 并立即下载吧。或者，如果你已经在运行 Fedora 操作系统，请遵循简单的[升级说明][15]就行。

### 万一出现问题……

如果遇到问题，请查看 [Fedora 31 常见错误][16]页面，如果有疑问，请访问我们的 [Ask Fedora][17] 用户支持平台。

### 谢谢大家

感谢在此发行周期中成千上万为 Fedora 项目做出贡献的人们，尤其是那些为使该发行版再次按时发行而付出更多努力的人。而且，如果你本周在波特兰参加 [USENIX LISA][18]，请在博览会大厅，在 Red Hat、Fedora 和 CentOS 展位找到我。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-31/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/fedora31-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
[3]: https://iot.fedoraproject.org/
[4]: https://spins.fedoraproject.org/
[5]: https://labs.fedoraproject.org/
[6]: https://labs.fedoraproject.org/en/astronomy/
[7]: https://spins.fedoraproject.org/en/kde/
[8]: https://spins.fedoraproject.org/en/xfce/
[9]: https://alt.fedoraproject.org/alt/
[10]: https://panfrost.freedesktop.org/
[11]: https://fedoramagazine.org/in-fedora-31-32-bit-i686-is-86ed/
[12]: https://docs.fedoraproject.org/en-US/project/#_first
[13]: https://fedoraproject.org/wiki/Common_F31_bugs#Docker_package_no_longer_available_and_will_not_run_by_default_.28due_to_switch_to_cgroups_v2.29
[14]: https://pythonclock.org/
[15]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[16]: https://fedoraproject.org/wiki/Common_F31_bugs
[17]: http://ask.fedoraproject.org
[18]: https://www.usenix.org/conference/lisa19
