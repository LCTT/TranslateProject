如何用sosreport在Linux上创建诊断信息
================================================================================
**Sosreport**是**RHEL / CentOS**上的一个命令，它会收集**系统配置**和你linux机器上的诊断信息，如正在运行的内核版本、加载的模块和系统和服务配置文件之类的信息。这个命令同样可以运行外部的程序来收集更多的信息，并存储这些输出到一个结论文档中。

Sosreport在你需要获得redhat的技术支持时需要它。Redhat的支持工程师会要求你服务器上的sosreport来用于故障排除。

要运行sosreport，需要安装**sos** 包。sos包是大多是linux的默认安装包中的一部分。如果因为某种原因没有安装，那么运行下面的yum命令来安装**sos 包** :

    # yum install sos 

### 生成报告 ###

打开终端输入sosreport命令：

    # sosreport 

这条命令正常情况下会在**几分钟**里完成。根据本地配置，在某些情况下，某些选项可能需要更长的时间才能完成。一旦完成，sosreport将在**/ tmp目录**目录中生成一个压缩文件。不同版本使用不同的压缩方案（** gz，bz2，或xz**）。该文件应提供给红帽的支持代表（在开放的情况下通常作为附件）。

**注意**：sosreport需要root权限才能运行。

### sosreport命令中不同的选项: ###

sosreport命令有一个**模块化结构**，并允许用户启用和禁用模块，并通过在命令行指定模块。要**列出可用的模块**（插件），请使用以下命令：

    # sosreport -l

要禁用一个模块，用逗号隔开的列表传给-n/–skip-plugins选项。比如要kvmand 、amd这两个模块：

    # sosreport -n kvm,amd

各个模块可以通过-k选项提供额外的选项。例如，在Red Hat Enterprise Linux 5中安装的sos rpm模块默认收集“rpm -Va”的输出。因为这是个耗时行为，因此可以通过下面的命令禁用：


    # sosreport -k rpm.rpmva=off 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/how-to-create-sosreport-in-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出