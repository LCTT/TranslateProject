Translating--------geekpi


How to create sosreport in linux (RHEL 5.X / RHEL 6.X)
================================================================================
**Sosreport** is a command in linux (**RHEL / CentOS**) which collects **system configuration** and diagnostic information of your linux box like running kernel version, loaded modules, and system and service configuration files. This command also runs external programs to collect further information, and stores this output in the resulting archive.

Sosreport is required when you have open a case with redhat for technical support. Redhat support Engineers will require sosreport of your server for troubleshooting purpose.

To run sosreport , **sos** package should be installed. Sos package is part of default installation in most of linux. If for any reason this package is no installed , then use below yum command to install **sos package** :

    # yum install sos 

### Generate the report ###

Open the terminal type sosreport command :

    # sosreport 

 This command will normally complete within a **few minutes**. Depending on local configuration and the options specified in some cases the command may take longer to finish. Once completed, sosreport will generate a compressed a file under **/tmp** folder. Different versions use different compression schemes (**gz, bz2, or xz**). The file should be provided to Redhat support representative (normally as an attachment to an open case).

**Note**:  sosreport requires root permissions to run. 

### Different Options used in sosreport command : ###

The sosreport command has a **modular structure** and allows the user to enable and disable modules and specify module options via the command line. To **list available modules** (plug-ins) use the following command:

    # sosreport -l

To turn off a module include it in a comma-separated list of modules passed to the -n/–skip-plugins option. For instance to disable both the kvmand amd modules:

    # sosreport -n kvm,amd

Individual modules may provide additional options that may be specified via the -k option. For example on Red Hat Enterprise Linux 5 installations the sos rpm module collects "rpm -Va" output by default. As this may be time-consuming the behavior may be disabled via:

    # sosreport -k rpm.rpmva=off 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/how-to-create-sosreport-in-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出