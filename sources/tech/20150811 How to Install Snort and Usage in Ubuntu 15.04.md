How to Install Snort and Usage in Ubuntu 15.04
================================================================================
Intrusion detection in a network is important for IT security. Intrusion Detection System used for the detection  of illegal and malicious attempts in the network. Snort is well-known  open source intrusion detection system. Web interface (Snorby) can be used  for better analysis of alerts.  Snort can be used as an intrusion prevention system with iptables/pf firewall.  In this article, we will install and configure an open source IDS system snort.

### Snort Installation ###

#### Prerequisite ####

Data Acquisition library (DAQ) is used by the snort for abstract calls to packet capture libraries.  It is available on snort website.  Downloading process is shown in the following screenshot.

![downloading_daq](http://blog.linoxide.com/wp-content/uploads/2015/07/downloading_daq.png)

Extract it and run ./configure, make and make install commands for DAQ installation.  However, DAQ required other tools therefore ./configure script will generate following errors .

flex and bison error

![flexandbison_error](http://blog.linoxide.com/wp-content/uploads/2015/07/flexandbison_error.png)

libpcap error.

![libpcap error](http://blog.linoxide.com/wp-content/uploads/2015/07/libpcap-error.png)

Therefore first install flex/bison and libcap before DAQ installation which is shown in the figure.

![install_flex](http://blog.linoxide.com/wp-content/uploads/2015/07/install_flex.png)

Installation of libpcap development library is shown below

![libpcap-dev installation](http://blog.linoxide.com/wp-content/uploads/2015/07/libpcap-dev-installation.png)

After installation of necessary tools, again run ./configure script which will show following output.

![without_error_configure](http://blog.linoxide.com/wp-content/uploads/2015/07/without_error_configure.png)

make and make install commands result is shown in the following screens.

![make install](http://blog.linoxide.com/wp-content/uploads/2015/07/make-install.png)

![make](http://blog.linoxide.com/wp-content/uploads/2015/07/make.png)

After successful installation of DAQ, now we will install snort.   Downloading using wget is shown in the below figure.

![downloading_snort](http://blog.linoxide.com/wp-content/uploads/2015/07/downloading_snort.png)

Extract compressed package using  below given command.

    #tar -xvzf  snort-2.9.7.3.tar.gz

![snort_extraction](http://blog.linoxide.com/wp-content/uploads/2015/07/snort_extraction.png)

Create installation directory and set prefix parameter in the configure script. It is also recommended to enable sourcefire flag for Packet Performance Monitoring (PPM).

    #mkdir /usr/local/snort

    #./configure --prefix=/usr/local/snort/ --enable-sourcefire

![snort_installation](http://blog.linoxide.com/wp-content/uploads/2015/07/snort_installation.png)

Configure script generates error due to missing libpcre-dev , libdumbnet-dev and zlib development libraries.

error due to missing libpcre library.

![pcre-error](http://blog.linoxide.com/wp-content/uploads/2015/07/pcre-error.png)

error due to missing dnet (libdumbnet) library.

![libdnt error](http://blog.linoxide.com/wp-content/uploads/2015/07/libdnt-error.png)

configure script generate error due to missing zlib library.

![zlib error](http://blog.linoxide.com/wp-content/uploads/2015/07/zlib-error.png)

Installation of all required development libraries is shown in the next screenshots.

    # aptitude install libpcre3-dev

![libpcre3-dev install](http://blog.linoxide.com/wp-content/uploads/2015/07/libpcre3-dev-install.png)

    # aptitude install libdumbnet-dev

![libdumnet-dev installation](http://blog.linoxide.com/wp-content/uploads/2015/07/libdumnet-dev-installation.png)

    # aptitude install zlib1g-dev

![zlibg-dev installation](http://blog.linoxide.com/wp-content/uploads/2015/07/zlibg-dev-installation.png)

After installation of above required libraries for snort, again run the configure scripts without any error.

Run make & make install commands for the  compilation and installations of snort in /usr/local/snort directory.

    #make

![make snort](http://blog.linoxide.com/wp-content/uploads/2015/07/make-snort.png)

    #make install

![make install snort](http://blog.linoxide.com/wp-content/uploads/2015/07/make-install-snort.png)

Finally snort running from /usr/local/snort/bin directory.  Currently it is in promisc mode (packet dump mode) of all traffic on eth0 interface.

![snort running](http://blog.linoxide.com/wp-content/uploads/2015/07/snort-running.png)

Traffic  dump by the snort interface is shown  in following figure.

![traffic](http://blog.linoxide.com/wp-content/uploads/2015/07/traffic1.png)

#### Rules and Configuration of Snort ####

Snort installation from source code required rules and configuration setting therefore now we will copy rules and configuration under /etc/snort directory. We have created single bash scripts for rules and configuration setting. It is used for following snort setting.

- Creation of snort user for snort IDS service on linux.
- Creation of directories and files under /etc directory for snort configuration.
- Permission setting and copying data from etc directory of snort source code.
- Remove # (comment sign) from rules path in snort.conf file.

    #!/bin/bash##PATH of source code of snort
    snort_src="/home/test/Downloads/snort-2.9.7.3"
    echo "adding group and user for snort..."
    groupadd snort &> /dev/null
    useradd snort -r -s /sbin/nologin -d /var/log/snort -c snort_idps -g snort &> /dev/null#snort configuration
    echo "Configuring snort..."mkdir -p /etc/snort
    mkdir -p /etc/snort/rules
    touch /etc/snort/rules/black_list.rules
    touch /etc/snort/rules/white_list.rules
    touch /etc/snort/rules/local.rules
    mkdir /etc/snort/preproc_rules
    mkdir /var/log/snort
    mkdir -p /usr/local/lib/snort_dynamicrules
    chmod -R 775 /etc/snort
    chmod -R 775 /var/log/snort
    chmod -R 775 /usr/local/lib/snort_dynamicrules
    chown -R snort:snort /etc/snort
    chown -R snort:snort /var/log/snort
    chown -R snort:snort /usr/local/lib/snort_dynamicrules
    ###copy  configuration and rules from  etc directory under source code of snort
    echo "copying from snort source to /etc/snort ....."
    echo $snort_src
    echo "-------------"
    cp $snort_src/etc/*.conf* /etc/snort
    cp $snort_src/etc/*.map /etc/snort##enable rules
    sed -i 's/include \$RULE\_PATH/#include \$RULE\_PATH/' /etc/snort/snort.conf
    echo "---DONE---"

Change the snort source directory in the script and run it.  Following output appear in case of success.

![running script](http://blog.linoxide.com/wp-content/uploads/2015/08/running_script.png)

Above script copied following files/directories from snort source into /etc/snort configuration file.

![files copied](http://blog.linoxide.com/wp-content/uploads/2015/08/created.png)

Snort configuration file is very complex however following necessary changes are required in snort.conf for IDS proper working.

    ipvar HOME_NET 192.168.1.0/24  # LAN side

----------

    ipvar EXTERNAL_NET !$HOME_NET   # WAN side

![veriable set](http://blog.linoxide.com/wp-content/uploads/2015/08/12.png)

    var RULE_PATH /etc/snort/rules     # snort signature path
    var SO_RULE_PATH /etc/snort/so_rules        #rules in shared libraries
    var PREPROC_RULE_PATH /etc/snort/preproc_rules  # Preproces path
    var WHITE_LIST_PATH /etc/snort/rules        # dont scan
    var BLACK_LIST_PATH /etc/snort/rules        #  Must scan

![main path](http://blog.linoxide.com/wp-content/uploads/2015/08/rule-path.png)

    include $RULE_PATH/local.rules   # file for custom rules

remove comment sign (#) from other rules such as ftp.rules,exploit.rules etc.

![path rules](http://blog.linoxide.com/wp-content/uploads/2015/08/path-rules.png)

Now [Download community][1] rules  and extract under /etc/snort/rules directory. Enable community and emerging threats  rules  in snort.conf file.

![wget_rules](http://blog.linoxide.com/wp-content/uploads/2015/08/wget_rules.png)

![community rules](http://blog.linoxide.com/wp-content/uploads/2015/08/community-rules1.png)

Run following command to test the configuration file after above mentioned changes.

    #snort -T -c /etc/snort/snort.conf

![snort running](http://blog.linoxide.com/wp-content/uploads/2015/08/snort-final.png)

### Conclusion ###

In this article our focus was on the installation and configuration of an open source IDPS system snort on Ubuntu distribution. By default it is used for the monitoring of events however it can con configured inline mode for the protection of network. Snort rules can be tested and analysed in offline mode using pcap capture file.

--------------------------------------------------------------------------------

via: http://linoxide.com/security/install-snort-usage-ubuntu-15-04/

作者：[nido][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:https://www.snort.org/downloads/community/community-rules.tar.gz