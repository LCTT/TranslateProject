How to trigger commands on File/Directory changes with Incron on Debian
======

This guide shows how you can install and use **incron** on a Debian 9 (Stretch) system. Incron is similar to cron, but instead of running commands based on time, it can trigger commands when file or directory events occur (e.g. a file modification, changes of permissions, etc.).

### 1 Prerequisites

  * System administrator permissions (root login). All commands in this tutorial should be run as root user on the shell.
  * I will use the editor "nano" to edit files. You may replace nano with an editor of your choice or install nano with "apt-get install nano" if it is not installed on your server.



### 2 Installing Incron

Incron is available in the Debian repository, so we install incron with the following apt command:

```
apt-get install incron
```

The installation process should be similar to the one in this screenshot.

[![Installing Incron on Debian 9][1]][2]

### 3 Using Incron

Incron usage is very much like cron usage. You have the incrontab command that let's you list (-l), edit (-e), and remove (-r) incrontab entries.

To learn more about it, see:

```
man incrontab
```

There you also find the following section:

```
If /etc/incron.allow exists only users listed here may use incron. Otherwise if /etc/incron.deny exists only users NOT listed here may use incron. If none of these files exists everyone is allowed to use incron. (Important note: This behavior is insecure and will be probably changed to be compatible with the style used by ISC Cron.) Location of these files can be changed in the configuration.
```

This means if we want to use incrontab as root, we must either delete /etc/incron.allow (which is unsafe because then every system user can use incrontab)...

```
rm -f /etc/incron.allow
```

... or add root to that file (recommended). Open the /etc/incron.allow file with nano:

```
nano /etc/incron.allow
```

And add the following line. Then save the file.
```
root
```

Before you do this, you will get error messages like this one when trying to use incrontab:

```
server1:~# incrontab -l
user 'root' is not allowed to use incron
```



Afterwards it works:

```
server1:~# incrontab -l
no table for root
```



We can use the command:

```
incrontab -e
```

To create incron jobs. Before we do this, we take a look at the incron man page:

```
man 5 incrontab
```

The man page explains the format of the crontabs. Basically, the format is as follows...

```
<path> <mask> <command>
```

...where <path> can be a directory (meaning the directory and/or the files directly in that directory (not files in subdirectories of that directory!) are watched) or a file.

<mask> can be one of the following:

IN_ACCESS File was accessed (read) (*)
IN_ATTRIB Metadata changed (permissions, timestamps, extended attributes, etc.) (*)
IN_CLOSE_WRITE File opened for writing was closed (*)
IN_CLOSE_NOWRITE File not opened for writing was closed (*)
IN_CREATE File/directory created in watched directory (*)
IN_DELETE File/directory deleted from watched directory (*)
IN_DELETE_SELF Watched file/directory was itself deleted
IN_MODIFY File was modified (*)
IN_MOVE_SELF Watched file/directory was itself moved
IN_MOVED_FROM File moved out of watched directory (*)
IN_MOVED_TO File moved into watched directory (*)
IN_OPEN File was opened (*)

When monitoring a directory, the events marked with an asterisk (*) above can occur for files in the directory, in which case the name field in the
returned event data identifies the name of the file within the directory.

The IN_ALL_EVENTS symbol is defined as a bit mask of all of the above events. Two additional convenience symbols are IN_MOVE, which is a combination of IN_MOVED_FROM and IN_MOVED_TO, and IN_CLOSE which combines IN_CLOSE_WRITE and IN_CLOSE_NOWRITE.

The following further symbols can be specified in the mask:

IN_DONT_FOLLOW Don't dereference pathname if it is a symbolic link
IN_ONESHOT Monitor pathname for only one event
IN_ONLYDIR Only watch pathname if it is a directory

Additionally, there is a symbol which doesn't appear in the inotify symbol set. It is IN_NO_LOOP. This symbol disables monitoring events until the current one is completely handled (until its child process exits).

<command> is the command that should be run when the event occurs. The following wildcards may be used inside the command specification:

```
$$ dollar sign
#@ watched filesystem path (see above)
$# event-related file name
$% event flags (textually)
$& event flags (numerically)
```

If you watch a directory, then [[email protected]][3] holds the directory path and $# the file that triggered the event. If you watch a file, then [[email protected]][3] holds the complete path to the file and $# is empty.

If you need the wildcards but are not sure what they translate to, you can create an incron job like this. Open the incron incrontab:

```
incrontab -e
```

and add the following line:

```
/tmp/ IN_MODIFY echo "$$ $@ $# $% $&"
```

Then you create or modify a file in the /tmp directory and take a look at /var/log/syslog - this log shows when an incron job was triggered, if it succeeded or if there were errors, and what the actual command was that it executed (i.e., the wildcards are replaced with their real values).

```
tail /var/log/syslog
```

```
...
Jan 10 13:52:35 server1 incrond[1012]: (root) CMD (echo "$ /tmp .hello.txt.swp IN_MODIFY 2")
Jan 10 13:52:36 server1 incrond[1012]: (root) CMD (echo "$ /tmp .hello.txt.swp IN_MODIFY 2")
Jan 10 13:52:39 server1 incrond[1012]: (root) CMD (echo "$ /tmp hello.txt IN_MODIFY 2")
Jan 10 13:52:39 server1 incrond[1012]: (root) CMD (echo "$ /tmp .hello.txt.swp IN_MODIFY 2")
```

In this example I've edited the file /tmp/hello.txt; as you see [[email protected]][3] translates to /tmp, $# to _hello.txt_ , $% to IN_CREATE, and $& to 256. I used an editor that created a temporary .txt.swp file which results in the additional lines in syslog.

Now enough theory. Let's create our first incron jobs. I'd like to monitor the file /etc/apache2/apache2.conf and the directory /etc/apache2/vhosts/, and whenever there are changes, I want incron to restart Apache. This is how we do it:

```
incrontab -e
```
```
/etc/apache2/apache2.conf IN_MODIFY /usr/sbin/service apache2 restart
/etc/apache2/sites-available/ IN_MODIFY /usr/sbin/service apache2 restart
```

That's it. For test purposes, you can modify your Apache configuration and take a look at /var/log/syslog, and you should see that incron restarts Apache.

**NOTE** : Do not do any action from within an incron job in a directory that you monitor to avoid loops. **Example:** When you monitor the /tmp directory for changes and each change triggers a script that writes a log file in /tmp, this will cause a loop and might bring your system to high load or even crash it.

To list all defined incron jobs, you can run:

```
incrontab -l
```

```
server1:~# incrontab -l
/etc/apache2/apache2.conf IN_MODIFY /usr/sbin/service apache2 restart
/etc/apache2/vhosts/ IN_MODIFY /usr/sbin/service apache2 restart
```



To delete all incron jobs of the current user, run:

```
incrontab -r
```

```
server1:~# incrontab -r
removing table for user 'root'
table for user 'root' successfully removed
```

### 4 Links

Debian http://www.debian.org
Incron Software: http://inotify.aiken.cz/?section=incron&page=about&lang=en




--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/trigger-commands-on-file-or-directory-changes-with-incron-on-debian-9/

作者：[Till Brehm][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/trigger-commands-on-file-or-directory-changes-with-incron-on-debian-8/incron-debian-9.png
[2]:https://www.howtoforge.com/images/trigger-commands-on-file-or-directory-changes-with-incron-on-debian-8/big/incron-debian-9.png
