Linux Systemd - Start/Stop/Restart Services in RHEL / CentOS 7
================================================================================
One of the major changes in RHEL  / CentOS 7.0 is the swtich to **systemd**, a system and service manager, that replaces SysV and Upstart used in previous releases of Red Hat Enterprise Linux. systemd is compatible with SysV and Linux Standard Base init scripts.

**Systemd** is a system and service manager for Linux operating systems. It is designed to be backwards compatible with SysV init scripts, and provides a number of features such as parallel startup of system services at boot time, on-demand activation of daemons, support for system state snapshots, or dependency-based service control logic.

Previous versions of Red Hat Enterprise Linux, which were distributed with SysV init or Upstart, used init scripts written in bash located in the /etc/rc.d/init.d/ directory. In RHEL 7 / CentOS 7, these init scripts have been replaced with service units. Service units end with the .service file extension and serve a similar purpose as init scripts. To view, start, stop, restart, enable, or disable system services you will use the systemctl instead of the old service command.

> Note: for backwards compatibility the old service command is still available in CentOS 7 and it will redirect any command to the new systemctl utility.

### Start/Stop/Restart Services with systemctl ###

To start a service with systemctl you will need to use the command like this:

    # systemctl start httpd.service

This will start the httpd service, in our case Apache HTTP Server.

To stop it use this command as root:

    # systemctl stop httpd.service

To restart you can use either the restart options, it will restart the service if it’s running or start it if it’s not running. You can also use the try-restart option that will restart the service only if it’s already running. Also you have the reload option that will reload the configuration files.

    # systemctl restart httpd.service
    # systemctl try-restart httpd.service
    # systemctl reload httpd.service

The commands in our example look like this:

![systemctl start-stop-restart](http://linoxide.com/wp-content/uploads/2014/08/systemctl-start-stop-restart.gif)

### Checking the status of a service ###

To check the status of a service you can use the status option like this:

    # systemctl status httpd.service

And the output should look like this:

![systemctl status](http://linoxide.com/wp-content/uploads/2014/08/systemctl-status.gif)

Informing you of various aspects of the running service.

### Enable / Disable services to run at boot time ###

You can also use the enable / disable options to make a service run at boot time, using the command like this:

    # systemctl enable httpd.service
    # systemctl disable httpd.service

The output looks like this:

![systemctl-enable](http://linoxide.com/wp-content/uploads/2014/08/systemctl-enable.gif)

Although the adoption of systemd has been very controversial in the last few years, slowly most of the major Linux distributions have either adopted or are planning to have it in the next point release, so it’s a useful tool to get used to.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/start-stop-services-systemd/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/