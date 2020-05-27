[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Execute a Command or Script at Reboot or Startup)
[#]: via: (https://www.2daygeek.com/execute-run-linux-scripts-command-at-reboot-startup/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Execute a Command or Script at Reboot or Startup
======

Well known services on Linux can be added on boot without any problems.

For example, if you want to add Apache Httpd **[service on boot][1]**, you can do this with the help of the chkconfig and systemctl command.

Sometimes you need to add a custom script or command or service on boot, and how to do it?

You can do this using the below three methods.

In this article, we will show you how to use these methods with examples.

### Method-1: How to Run Script or Command at Reboot or Startup Using /etc/rc.d/rc.local File

The **“/etc/rc.local”** file is traditionally executed after all normal computer services have been started at the end of the process of switching to a multiuser runlevel.

This method also works on the systemd system.

You need to add the location of your script to the “/etc/rc.d/rc.local” file to run on boot.

Make sure the file has permission to run.

```
# chmod +x /etc/rc.d/rc.local
```

To demonstrate this, we are going to create a simple sample script. You can create any script as needed.

```
# vi /opt/scripts/run-script-on-boot.sh

#!/bin/bash
date > /root/on-boot-output.txt
hostname > /root/on-boot-output.txt
```

Once the script is ready, set the executable permission.

```
# chmod +x /opt/scripts/run-script-on-boot.sh
```

Finally add the script to the bottom of the file.

```
# vi /etc/rc.d/rc.local

/opt/scripts/run-script-on-boot.sh
```

**[Restart your system][2]** to check this.

```
# reboot
```

### Method-2: How to Execute a Command or Script at Reboot or Startup Using the crontab

cron executes scheduled jobs automatically in the backend at a specific time.

This can be easily accomplished using a special string called **“@reboot”** with **[cron job][3]**.

@reboot is a special string and allows the user to run any command or script at startup (boot time).

This example runs the “/opt/scripts/run-script-on-boot.sh” file on the system restart.

We are going to use the same script as above.

To do so, just add the following entry in the crontab file.

```
# crontab -e

@reboot /opt/scripts/run-script-on-boot.sh
```

Restart your system to check this.

```
# reboot
```

### Method-3: How to Run a Command or Script at Reboot or Startup Using the systemd service unit

This method only works on the systemd system. This method is very straightforward.

We are going to use the same script above to demonstrate this.

To do so, you need to create a systemd startup script and place it in the **“/etc/systemd/system/”** directory.

This is our sample systemd startup unit script.

```
# vi sample-on-boot-script.service

[Unit]
Description=Run a Custom Script at Startup
After=default.target

[Service]
ExecStart=/opt/scripts/run-script-on-boot.sh

[Install]
WantedBy=default.target
```

Once you place the unit script in the systemd location, run the following command to update the systemd configuration files and enable the service.

```
# systemctl daemon-reload
# systemctl enable sample-on-boot-script.service
```

Restart your system to check this.

```
# reboot
```

### Bonus Tips:

If you want to run a script in the background, you need to add the trailing ampersand “&amp;” symbol.

```
/Path/To/My_Script &
```

If you want to run the command as a different user, use the following format.

```
su - $USER -c /Path/To/My_Script
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/execute-run-linux-scripts-command-at-reboot-startup/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/enable-disable-services-on-boot-linux-chkconfig-systemctl-command/
[2]: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/
[3]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
