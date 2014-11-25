Linux FAQs with Answers--How to fix “ImportError: No module named scapy.all”
================================================================================
> **Question**: When I run a Python application, I am getting "ImportError: No module named scapy.all" message. How can I fix this import error? 

[Scapy][1] is a flexible packet generation and sniffer program written in Python. Using Scapy, you can create arbitrary packets, send them to the wire, reading packets from the wire or a dump file, transform packets, etc. Using Scapy's generic packet manipulation capabilities, you can easily do things like SYN scan, TCP traceroute, and OS fingerprinting. You can also integrate Scapy into another tool by importing it.

The import error indicates that you do not have Scapy installed on your Linux system. Here is how to install Scapy on Linux.

### Install Scapy on Debian, Ubuntu or Linux Mint ###

     $ sudo apt-get install python-scapy 

### Install Scapy on Fedora or CentOS/RHEL ###

On CentOS/RHEL, you need to [enable EPEL repository][2] first.

     $ sudo yum install scapy 

### Install Scapy from the Source ###

If your Linux distribution does not offer Scapy package or you want to try the latest Scapy, you can install Scapy manually from the source.

Download the [latest version of Scapy][3], and install it as follows.

    $ unzip scapy-latest.zip
    $ cd scapy-2.*
    $ sudo python setup.py install 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/importerror-no-module-named-scapy-all.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.secdev.org/projects/scapy/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[3]:http://scapy.net/