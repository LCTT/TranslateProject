[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add Windows and Linux host to Nagios Server for Monitoring)
[#]: via: (https://www.linuxtechi.com/add-windows-linux-host-to-nagios-server/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

How to Add Windows and Linux host to Nagios Server for Monitoring
======

In the previous article, we demonstrated how to install [Nagios Core on CentOS 8 / RHEL 8][1] server. In this guide, we will dive deeper and add Linux and Windows hosts to the Nagios Core server for monitoring.

![Add-Linux-Windows-Host-Nagios-Server][2]

### Adding a Remote Windows Host to Nagios Server

In this section, you will learn how to add a **Windows host** system to the **Nagios server**. For this to be possible, you need to install **NSClient++** agent on the Windows Host system. In this guide, we are going to install the NSClient++ on a Windows Server 2019 Datacenter edition.

On the Windows host system,  head out to the download link as specified <https://sourceforge.net/projects/nscplus/> and download NSClient ++ agent.

Once downloaded, double click on the downloaded installation file to launch the installation wizard.

[![NSClient-installer-Windows][2]][3]

On the first step on the installation procedure click ‘**Next**’

[![click-nex-to-install-NSClient][2]][4]

In the next section, check off the ‘**I accept the terms in the license Agreement**’ checkbox and click ‘**Next**’

[![Accept-terms-conditions-NSClient][2]][5]

Next, click on the ‘**Typical**’ option from the list of options and click ‘**Next**’

[![click-on-Typical-option-NSClient-Installation][2]][6]

In the next step, leave the default settings as they are and click ‘**Next**’.

[![Define-path-NSClient-Windows][2]][7]

On the next page, specify your Nagios Server core’s IP address and tick off all the modules and click ‘**Next**’ as shown below.

[![Specify-Nagios-Server-IP-address-NSClient-Windows][2]][8]

Next, click on the ‘**Install**’ option to commence the installation process.[![Click-install-to-being-the-installation-NSClient][2]][9]

The installation process will start and will take a couple of seconds to complete. On the last step. Click ‘**Finish**’ to complete the installation and exit the Wizard.

[![Click-finish-NSClient-Windows][2]][10]

To start the NSClient service, click on the **Start** menu and click on the ‘**Start NSClient ++**’ option.

[![Click-start-NSClient-service-windows][2]][11]

To confirm that indeed the service is running, press **Windows Key + R**, type services.msc and hit **ENTER**. Scroll and search for the **NSClient** service and ensure it’s running

[![NSClient-running-windows][2]][12]

At this point, we have successfully installed NSClient++ on Windows Server 2019 host and verified that it’s running.

### Configure Nagios Server to monitor Windows host

After the successful installation of the NSClient ++ on the Windows host PC, log in to the Nagios server Core system and configure it to monitor the Windows host system.

Open the windows.cfg file using your favorite text editor

```
# vim /usr/local/nagios/etc/objects/windows.cfg
```

In the configuration file, ensure that the host_name attribute matches the hostname of your Windows client system. In our case, the hostname for the Windows server PC is windows-server. This hostname should apply for all the host_name attributes.

For the address attribute, specify your Windows host IP address. , In our case, this was 10.128.0.52.

![Specify-hostname-IP-Windows][2]

After you are done, save the changes and exit the text editor.

Next, open the Nagios configuration file.

```
# vim /usr/local/nagios/etc/nagios.cfg
```

Uncomment the line below and save the changes.

cfg_file=/usr/local/nagios/etc/objects/windows.cfg

![Uncomment-Windows-cfg-Nagios][2]

Finally, to verify that Nagios configuration is free from any errors, run the command:

```
# /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```

Output

![Verify-configuration-for-errors-Nagios][2]

As you can see from the output, there are no warnings or errors.

Now browse your Nagios Server IP address, log in and click on Hosts. Your Windows hostname, in this case, windows-server will appear on the dashboard.

![Windows-Host-added-Nagios][2]

### Adding a remote Linux Host to Nagios Server

Having added a Windows host to the Nagios server, let’s add a Linux host system. In our case, we are going to add a **Ubuntu 18.04 LTS** to the Nagios monitoring server. To monitor a Linux host, we need to install an agent on the remote Linux system called **NRPE**. NRPE is short for **Nagios Remote Plugin Executor**. This is the plugin that will allow you to monitor Linux host systems. It allows you to monitor resources such as Swap, memory usage, and CPU load to mention a few on remote Linux hosts. So the first step is to install NRPE on Ubuntu 18.04 LTS remote system.

But first, update Ubuntu system

```
# sudo apt update
```

Next,  install Nagios NRPE by running the command as shown:

```
# sudo apt install nagios-nrpe-server nagios-plugins
```

![Install-nrpe-server-nagios-plugins][2]

After the successful installation of  NRPE and Nagios plugins, configure NRPE by opening its configuration file in /etc/nagios/nrpe.cfg

```
# vim /etc/nagios/nrpe.cfg
```

Append the Linux host IP address to the **server_address** attribute. In this case, 10.128.0.53 is the IP address of the Ubuntu 18.04 LTS system.

![Specify-server-address-Nagios][2]

Next, add Nagios server IP address in the ‘allowed_hosts’ attribute, in this case, 10.128.0.50

![Allowed-hosts-Nagios][2]

Save and exit the configuration file.

Next, restart NRPE service and verify its status

```
# systemctl restart nagios-nrpe-server
# systemctl enable nagios-nrpe-server
# systemctl status nagios-nrpe-server
```

![Restart-nrpe-check-status][2]

### Configure Nagios Server to monitor Linux host

Having successfully installed NRPE and nagios plugins on the remote linux server, log in to Nagios Server and install EPEL (Extra packages for Enterprise Linux) package.

```
# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

Next, install NRPE plugin on the server

```
# dnf install nagios-plugins-nrpe -y
```

After the installation of the NRPE plugin, open the Nagios configuration file “/usr/local/nagios/etc/nagios.cfg”

```
# vim /usr/local/nagios/etc/nagios.cfg
```

Next, uncomment the line below in the configuration file

cfg_dir=/usr/local/nagios/etc/servers

![uncomment-servers-line-Nagios-Server-CentOS8][2]

Next, create a configuration directory

```
# mkdir /usr/local/nagios/etc/servers
```

Then create client configuration file

```
# vim /usr/local/nagios/etc/servers/ubuntu-host.cfg
```

Copy and paste the configuration below to the file. This configuration monitors swap space, system load, total processes, logged in users, and disk usage.

```
define host{
            use                     linux-server
            host_name               ubuntu-nagios-client
            alias                   ubuntu-nagios-client
            address                 10.128.0.53

}

define hostgroup{
            hostgroup_name          linux-server
            alias                   Linux Servers
            members                 ubuntu-nagios-client
}

define service{
            use                     local-service
            host_name               ubuntu-nagios-client
            service_description     SWAP Uasge
            check_command           check_nrpe!check_swap

}

define service{
            use                     local-service
            host_name               ubuntu-nagios-client
            service_description     Root / Partition
            check_command           check_nrpe!check_root

}

define service{
            use                     local-service
            host_name               ubuntu-nagios-client
            service_description     Current Users
            check_command           check_nrpe!check_users
}

define service{
            use                     local-service
            host_name               ubuntu-nagios-client
            service_description     Total Processes
            check_command           check_nrpe!check_total_procs
}

define service{
            use                     local-service
            host_name               ubuntu-nagios-client
            service_description     Current Load
            check_command           check_nrpe!check_load
}
```

Save and exit the configuration file.

Next, verify that there are no errors in Nagios configuration

```
# /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```

Now restart Nagios service and ensure that it is up and running.

```
# systemctl restart nagios
```

Remember to open port 5666 which is used by NRPE plugin on the firewall of the Nagios server.

```
# firewall-cmd --permanent --add-port=5666/tcp
# firewall-cmd --reload
```

![Allow-firewall-Nagios-server][2]

Likewise, head out to your Linux host (Ubuntu 18.04 LTS) and allow the port on UFW firewall

```
# ufw allow 5666/tcp
# ufw reload
```

![Allow-NRPE-service][2]

Finally, head out to the Nagios Server’s URL and click on ‘**Hosts**’. Your Ubuntu system will be displayed on the dashboard alongside the Windows host machine we added earlier on.

![Linux-host-added-monitored-Nagios][2]

And this wraps up our 2-part series on Nagios installation and adding remote hosts. Feel free to get back to us with your feedback.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/add-windows-linux-host-to-nagios-server/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/install-nagios-core-rhel-8-centos-8/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/11/NSClient-installer-Windows.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/11/click-nex-to-install-NSClient.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Accept-terms-conditions-NSClient.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/11/click-on-Typical-option-NSClient-Installation.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Define-path-NSClient-Windows.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Specify-Nagios-Server-IP-address-NSClient-Windows.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Click-install-to-being-the-installation-NSClient.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Click-finish-NSClient-Windows.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Click-start-NSClient-service-windows.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/11/NSClient-running-windows.jpg
