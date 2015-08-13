How to Install Logwatch on Ubuntu 15.04
================================================================================
Hi, Today we are going to illustrate the setup of Logwatch on Ubuntu 15.04 Operating system where as it can be used for any Linux and UNIX like operating systems. Logwatch is a customizable system log analyzer and reporting log-monitoring system that go through your logs for a given period of time and make a report in the areas that you wish with the details you want. Its an easy tool to install, configure, review and to take actions that will improve security from data it provides. Logwatch scans the log files of major operating system components, like SSH, Web Server and forwards a summary that contains the valuable items in it that needs to be looked at.

### Pre-installation Setup ###

We will be using Ubuntu 15.04 operating system to deploy Logwatch on it so as a perquisite for the installation of Logwatch, make sure that your emails setup is working as it will be used to send email to the administrators for daily reports on the gathered reports.Your system repositories should be enabled as we will be installing it from its available universal repositories.

Then open the terminal of your ubuntu operating system and login with root user to update your system packages before moving to Logwatch installation.

    root@ubuntu-15:~# apt-get update

### Installing Logwatch ###

Once your system is updated and your have fulfilled all its prerequisites then run the following command to start the installation of Logwatch in your server.

    root@ubuntu-15:~# apt-get install logwatch

The logwatch installation process will starts with addition of some extra required packages as shown once you press “Y” to accept the required changes to the system.

During the installation process you will be prompted to configure the Postfix Configurations according to your mail server’s setup. Here we used “Local only” in the tutorial for ease, we can choose from the other available options as per your infrastructure requirements and then press “OK” to proceed.

![Potfix Configurations](http://blog.linoxide.com/wp-content/uploads/2015/08/21.png)

Then you have to choose your mail server’s name that will also be used by other programs, so it should be single fully qualified domain name (FQDN).

![Postfix Setup](http://blog.linoxide.com/wp-content/uploads/2015/08/31.png)

Once you press “OK” after postfix configurations, then it will completes the Logwatch installation process with default configurations of Postfix.

![Logwatch Completion](http://blog.linoxide.com/wp-content/uploads/2015/08/41.png)

You can check the status of Logwatch by issuing the following command in the terminal that should be in active state.

    root@ubuntu-15:~# service postfix status

![Postfix Status](http://blog.linoxide.com/wp-content/uploads/2015/08/51.png)

To confirm the installation of Logwatch with its default configurations, issue the simple “logwatch” command as shown.

    root@ubuntu-15:~# logwatch

The output from the above executed command will results in following compiled report form in the terminal.

![Logwatch Report](http://blog.linoxide.com/wp-content/uploads/2015/08/61.png)

### Logwatch Configurations ###

Now after successful installation of Logwatch, we need to make few configuration changes in its configuration file located under following shown path. So, let’s open it with the file editor to update its configurations as required.

    root@ubuntu-15:~# vim /usr/share/logwatch/default.conf/logwatch.conf

**Output/Format Options**

By default Logwatch will print to stdout in text with no encoding.To make email Default set “Output = mail” and to save to file set “Output = file”. So you can comment out the its default configurations as per your required settings.

    Output = stdout

To make Html the default formatting update the following line if you are using Internet email configurations.

    Format = text

Now add the default person to mail reports should be sent to, it could be a local account or a complete email address that you are free to mention in this line

    MailTo = root
    #MailTo = user@test.com

Default person to mail reports sent from can be a local account or any other you wish to use.

    # complete email address.
    MailFrom = Logwatch

Save the changes made in the configuration file of Logwatch while leaving the other parameter as default.

**Cronjob Configuration**

Now edit the "00logwatch" file in daily crons directory to configure your desired email address to forward reports from logwatch.

    root@ubuntu-15:~# vim /etc/cron.daily/00logwatch

Here you need to use "--mailto" user@test.com instead of --output mail and save the file.

![Logwatch Cronjob](http://blog.linoxide.com/wp-content/uploads/2015/08/71.png)

### Using Logwatch Report ###

Now we generate the test report by executing the "logwatch" command in the terminal to get its result shown in the Text format within the terminal.

    root@ubuntu-15:~#logwatch

The generated report starts with showing its execution time and date, it will be comprising of different sections that starts with its begin status and closed with end status after showing the complete information about its logs of the mentioned sections.

Here is its starting point looks like, where it starts by showing all the installed packages in the system as shown below.

![dpkg status](http://blog.linoxide.com/wp-content/uploads/2015/08/81.png)

The following sections shows the logs informmation about the login sessions, rsyslogs and SSH connections about the current and last sessions enabled on the system.

![logwatch report](http://blog.linoxide.com/wp-content/uploads/2015/08/9.png)

The logwatch report will ends up by showing the secure sudo logs and the disk space usage of the root diretory as shown below.

![Logwatch end report](http://blog.linoxide.com/wp-content/uploads/2015/08/10.png)

You can also check for the generated emails about the logwatch reports by opening the following file.

    root@ubuntu-15:~# vim /var/mail/root

Here you will be able to see all the generated emails to your configured users with their message delivery status.

### More about Logwatch ###

Logwatch is a great tool to lern more about it, so if your more interested to learn more about its logwatch then you can also get much help from the below few commands.

    root@ubuntu-15:~# man logwatch

The above command contains all the users manual about the logwatch, so read it carefully and to exit from the manuals section simply press "q".

To get help about the logwatch commands usage you can run the following help command for further information in details.

    root@ubuntu-15:~# logwatch --help

### Conclusion ###

At the end of this tutorial you learn about the complete setup of Logwatch on Ubuntu 15.04 that includes with its installation and configurations guide. Now you can start monitoring your logs in a customize able form, whether you monitor the logs of all the services rnning on your system or you customize it to send you the reports about the specific services on the scheduled days. So, let's use this tool and feel free to leave us a comment if you face any issue or need to know more about logwatch usage.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-use-logwatch-ubuntu-15-04/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/