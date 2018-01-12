How to use syslog-ng to collect logs from remote Linux machines
======
![linuxhero.jpg][1]

Image: Jack Wallen

Let's say your data center is filled with Linux servers and you need to administer them all. Part of that administration job is viewing log files. But if you're looking at numerous machines, that means logging into each machine individually, reading log files, and then moving onto the next. Depending upon how many machines you have, that can take a large chunk of time from your day.

Or, you could set up a single Linux machine to collect those logs. That would make your day considerably more efficient. To do this, you could opt for a number of different system, one of which is syslog-ng.

The problem with syslog-ng is that the documentation isn't the easiest to comb through. However, I've taken care of that and am going to lay out the installation and configuration in such a way that you can have syslog-ng up and running in no time. I'll be demonstrating on Ubuntu Server 16.04 on a two system setup:

  * UBUNTUSERVERVM at IP address 192.168.1.118 will serve as log collector
  * UBUNTUSERVERVM2 will serve as a client, sending log files to the collector



Let's install and configure.

## Installation

The installation is simple. I'll be installing from the standard repositories, in order to make this as easy as possible. To do this, open up a terminal window and issue the command:
```
sudo apt install syslog-ng
```

You must issue the above command on both collector and client. Once that's installed, you're ready to configure.

## Configuration for the collector

We'll start with the configuration of the log collector. The configuration file is /etc/syslog-ng/syslog-ng.conf. Out of the box, syslog-ng includes a configuration file. We're not going to use that. Let's rename the default config file with the command sudo mv /etc/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf.BAK. Now create a new configuration file with the command sudo nano /etc/syslog/syslog-ng.conf. In that file add the following:
```
@version: 3.5
@include "scl.conf"
@include "`scl-root`/system/tty10.conf"
 options {
 time-reap(30);
 mark-freq(10);
 keep-hostname(yes);
 };
 source s_local { system(); internal(); };
 source s_network {
 syslog(transport(tcp) port(514));
 };
 destination d_local {
 file("/var/log/syslog-ng/messages_${HOST}"); };
 destination d_logs {
 file(
 "/var/log/syslog-ng/logs.txt"
 owner("root")
 group("root")
 perm(0777)
 ); };
 log { source(s_local); source(s_network); destination(d_logs); };
```

Do note that we are working with port 514, so you'll need to make sure it is accessible on your network.

Save and close the file. The above configuration will dump the desired log files (denoted with system() and internal()) into /var/log/syslog-ng/logs.txt. Because of this, you need to create the directory and file with the following commands:
```
sudo mkdir /var/log/syslog-ng
sudo touch /var/log/syslog-ng/logs.txt
```

Start and enable syslog-ng with the commands:
```
sudo systemctl start syslog-ng
sudo systemctl enable syslog-ng
```

## Configuration for the client

We're going to do the very same thing on the client (moving the default configuration file and creating a new configuration file). Copy the following text into the new client configuration file:
```
@version: 3.5
@include "scl.conf"
@include "`scl-root`/system/tty10.conf"
source s_local { system(); internal(); };
destination d_syslog_tcp {
 syslog("192.168.1.118" transport("tcp") port(514)); };
log { source(s_local);destination(d_syslog_tcp); };
```

Note: Change the IP address to match the address of your collector server.

Save and close that file. Start and enable syslog-ng in the same fashion you did on the collector.

## View the log files

Head back to your collector and issue the command sudo tail -f /var/log/syslog-ng/logs.txt. You should see output that includes log entries for both collector and client ( **Figure A** ).

 **Figure A**

![Figure A][3]

Congratulations, syslog-ng is working. You can now log into your collector to view logs from both the local machine and the remote client. If you have more Linux servers in your data center, walk through the process of installing syslog-ng and setting each of them up as a client to send their logs to the collector, so you no longer have to log into individual machines to view logs.


--------------------------------------------------------------------------------

via: https://www.techrepublic.com/article/how-to-use-syslog-ng-to-collect-logs-from-remote-linux-machines/

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://tr1.cbsistatic.com/hub/i/r/2017/01/11/51204409-68e0-49b8-a637-01af26be85f6/resize/770x/688dfedad4ed30ec4baf548c2adb8cd4/linuxhero.jpg
[3]:https://tr4.cbsistatic.com/hub/i/2018/01/09/6a24e5c0-6a29-46d3-8a66-bc72747b5beb/6f94d3e6c6c2121fab6223ed9d8c6aa6/syslognga.jpg
