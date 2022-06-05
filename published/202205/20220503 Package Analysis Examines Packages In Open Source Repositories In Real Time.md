[#]: subject: "Package Analysis Examines Packages In Open Source Repositories In Real Time"
[#]: via: "https://www.opensourceforu.com/2022/05/package-analysis-examines-packages-in-open-source-repositories-in-real-time/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14578-1.html"

软件包分析项目实时检查开源仓库中的包
======

![openssf-logo][1]

开源安全基金会（OpenSSF）发布了一个新工具的测试版，它可以对发布到著名开源仓库的所有软件包进行动态分析。软件包分析项目试图通过识别任何恶意行为并警告用户来保护开源软件包，目的是增强对开源软件的信任并加强软件供应链的安全性。

OpenSSF 说：“软件包分析项目旨在了解开源仓库上可用软件包的行为和功能：它们访问哪些文件，它们连接到哪些地址，以及它们运行哪些命令？”

该基金会的 Caleb Brown 和 David A. Wheeler 补充说：“该项目还跟踪软件包随时间的行为变化，以确定以前安全的软件何时开始出现可疑行为。”

该程序在为期一个月的测试运行中发现了 200 多个发布到 PyPI 和 NPM 的恶意软件包，其中大多数流氓库依赖于依赖混淆和仿冒攻击。谷歌是 OpenSSF 的成员，它支持软件包分析计划，强调“在发布软件包之前审查软件包以确保用户安全”的重要性。

去年，该公司的开源安全团队提出了软件工件的供应链级别（SLSA）架构，以验证软件包的完整性并防止未经授权的更改。这一发展是在开源生态系统越来越多地被武器化，用加密货币矿工和数据窃贼等恶意软件攻击开发者的情况下进行的。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/package-analysis-examines-packages-in-open-source-repositories-in-real-time/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/openssf-logo-696x418.jpg
