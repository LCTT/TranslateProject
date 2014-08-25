Linux FAQs with Answers--How to enable Nux Dextop repository on CentOS or RHEL
================================================================================
> **Question**: I would like to install a RPM package which is available only in Nux Dextop repository. How can I set up Nux Dextop repository on CentOS or RHEL? 

[Nux Dextop][1] is a third-party RPM repository which contains many popular desktop and multimedia related packages (e.g., Ardour, Shutter, etc) for CentOS, RHEL and ScientificLinux. Currently, Nux Dextop repository is available for CentOS/RHEL 6 and 7.

To enable Nux Dextop repository on CentOS or RHEL, follow the instructions below.

First of all, understand that Nux Dextop is designed to coexist with EPEL repository. So you need to [enable EPEL][2] in order to use Nux Dextop repo.

After enabling EPEL, go ahead and install Nux Dextop repository with rpm command as follows.

On CentOS/RHEL 6.*:

    $ sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm

On CentOS/RHEL 7:

    $ sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm

Now verify that Nux Dextop repository is successfully installed:

    $ yum repolist 

![](https://farm6.staticflickr.com/5574/14790031847_90b4a829d7_z.jpg)

### For Repoforge/RPMforge Users ###

According to the author, Nux Dextop is known to cause conflicts with other third-party RPM repos such as Repoforge and ATrpms. Therefore, if you enabled any third-party repos other than EPEL, it is highly recommend you set Nux Dextop repository to "default off" state. That is, open /etc/yum.repos.d/nux-dextop.repo with a text editor, and change "enabled=1" to "enabled=0" under nux-desktop.

$ sudo vi /etc/yum.repos.d/nux-dextop.repo 

![](https://farm6.staticflickr.com/5560/14789955930_f8711b3581_z.jpg)

Then whenever you want to install a package from Nux Dextop repo, explicitly enable the repo as follows.

     $ sudo yum --enablerepo=nux-dextop install <package-name> 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/enable-nux-dextop-repository-centos-rhel.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://li.nux.ro/download/nux/dextop/
[2]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html