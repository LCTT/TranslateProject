translating by lujun9972
Linux Filesystem Events with inotify
======

Triggering scripts with incron and systemd.

It is, at times, important to know when things change in the Linux OS. The uses to which systems are placed often include high-priority data that must be processed as soon as it is seen. The conventional method of finding and processing new file data is to poll for it, usually with cron. This is inefficient, and it can tax performance unreasonably if too many polling events are forked too often.

Linux has an efficient method for alerting user-space processes to changes impacting files of interest. The inotify Linux system calls were first discussed here in Linux Journal in a [2005 article by Robert Love][6] who primarily addressed the behavior of the new features from the perspective of C.

However, there also are stable shell-level utilities and new classes of monitoring dæmons for registering filesystem watches and reporting events. Linux installations using systemd also can access basic inotify functionality with path units. The inotify interface does have limitations—it can't monitor remote, network-mounted filesystems (that is, NFS); it does not report the userid involved in the event; it does not work with /proc or other pseudo-filesystems; and mmap() operations do not trigger it, among other concerns. Even with these limitations, it is a tremendously useful feature.

This article completes the work begun by Love and gives everyone who can write a Bourne shell script or set a crontab the ability to react to filesystem changes.

### The inotifywait Utility

Working under Oracle Linux 7 (or similar versions of Red Hat/CentOS/Scientific Linux), the inotify shell tools are not installed by default, but you can load them with yum:

```

 # yum install inotify-tools
Loaded plugins: langpacks, ulninfo
ol7_UEKR4                                      | 1.2 kB   00:00
ol7_latest                                     | 1.4 kB   00:00
Resolving Dependencies
--> Running transaction check
---> Package inotify-tools.x86_64 0:3.14-8.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

==============================================================
Package         Arch       Version        Repository     Size
==============================================================
Installing:
inotify-tools   x86_64     3.14-8.el7     ol7_latest     50 k

Transaction Summary
==============================================================
Install  1 Package

Total download size: 50 k
Installed size: 111 k
Is this ok [y/d/N]: y
Downloading packages:
inotify-tools-3.14-8.el7.x86_64.rpm               |  50 kB   00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Warning: RPMDB altered outside of yum.
  Installing : inotify-tools-3.14-8.el7.x86_64                 1/1
  Verifying  : inotify-tools-3.14-8.el7.x86_64                 1/1

Installed:
  inotify-tools.x86_64 0:3.14-8.el7

Complete!

```

The package will include two utilities (inotifywait and inotifywatch), documentation and a number of libraries. The inotifywait program is of primary interest.

Some derivatives of Red Hat 7 may not include inotify in their base repositories. If you find it missing, you can obtain it from [Fedora's EPEL repository][7], either by downloading the inotify RPM for manual installation or adding the EPEL repository to yum.

Any user on the system who can launch a shell may register watches—no special privileges are required to use the interface. This example watches the /tmp directory:

```

$ inotifywait -m /tmp
Setting up watches.
Watches established.

```

If another session on the system performs a few operations on the files in /tmp:

```

$ touch /tmp/hello
$ cp /etc/passwd /tmp
$ rm /tmp/passwd
$ touch /tmp/goodbye
$ rm /tmp/hello /tmp/goodbye

```

those changes are immediately visible to the user running inotifywait:

```

/tmp/ CREATE hello
/tmp/ OPEN hello
/tmp/ ATTRIB hello
/tmp/ CLOSE_WRITE,CLOSE hello
/tmp/ CREATE passwd
/tmp/ OPEN passwd
/tmp/ MODIFY passwd
/tmp/ CLOSE_WRITE,CLOSE passwd
/tmp/ DELETE passwd
/tmp/ CREATE goodbye
/tmp/ OPEN goodbye
/tmp/ ATTRIB goodbye
/tmp/ CLOSE_WRITE,CLOSE goodbye
/tmp/ DELETE hello
/tmp/ DELETE goodbye

```

A few relevant sections of the manual page explain what is happening:

```

$ man inotifywait | col -b | sed -n '/diagnostic/,/helpful/p'
  inotifywait will output diagnostic information on standard error and
  event information on standard output. The event output can be config-
  ured, but by default it consists of lines of the following form:

  watched_filename EVENT_NAMES event_filename

  watched_filename
    is the name of the file on which the event occurred. If the
    file is a directory, a trailing slash is output.

  EVENT_NAMES
    are the names of the inotify events which occurred, separated by
    commas.

  event_filename
    is output only when the event occurred on a directory, and in
    this case the name of the file within the directory which caused
    this event is output.

    By default, any special characters in filenames are not escaped
    in any way. This can make the output of inotifywait difficult
    to parse in awk scripts or similar. The --csv and --format
    options will be helpful in this case.

```

It also is possible to filter the output by registering particular events of interest with the -e option, the list of which is shown here:

| access | create | move_self |
|========|========|===========|
| attrib | delete | moved_to |
| close_write | delete_self | moved_from |
| close_nowrite | modify | open |
| close | move | unmount |

A common application is testing for the arrival of new files. Since inotify must be given the name of an existing filesystem object to watch, the directory containing the new files is provided. A trigger of interest is also easy to provide—new files should be complete and ready for processing when the close_write trigger fires. Below is an example script to watch for these events:

```

#!/bin/sh
unset IFS                                 # default of space, tab and nl
                                          # Wait for filesystem events
inotifywait -m -e close_write \
   /tmp /var/tmp /home/oracle/arch-orcl/ |
while read dir op file
do [[ "${dir}" == '/tmp/' && "${file}" == *.txt ]] &&
      echo "Import job should start on $file ($dir $op)."

   [[ "${dir}" == '/var/tmp/' && "${file}" == CLOSE_WEEK*.txt ]] &&
      echo Weekly backup is ready.

   [[ "${dir}" == '/home/oracle/arch-orcl/' && "${file}" == *.ARC ]]
&&
      su - oracle -c 'ORACLE_SID=orcl ~oracle/bin/log_shipper' &

   [[ "${dir}" == '/tmp/' && "${file}" == SHUT ]] && break

   ((step+=1))
done

echo We processed $step events.

```

There are a few problems with the script as presented—of all the available shells on Linux, only ksh93 (that is, the AT&T Korn shell) will report the "step" variable correctly at the end of the script. All the other shells will report this variable as null.

The reason for this behavior can be found in a brief explanation on the manual page for Bash: "Each command in a pipeline is executed as a separate process (i.e., in a subshell)." The MirBSD clone of the Korn shell has a slightly longer explanation:

```

# man mksh | col -b | sed -n '/The parts/,/do so/p'
  The parts of a pipeline, like below, are executed in subshells. Thus,
  variable assignments inside them fail. Use co-processes instead.

  foo | bar | read baz          # will not change $baz
  foo | bar |& read -p baz      # will, however, do so

```

And, the pdksh documentation in Oracle Linux 5 (from which MirBSD mksh emerged) has several more mentions of the subject:

```

General features of at&t ksh88 that are not (yet) in pdksh:
  - the last command of a pipeline is not run in the parent shell
  - `echo foo | read bar; echo $bar' prints foo in at&t ksh, nothing
    in pdksh (ie, the read is done in a separate process in pdksh).
  - in pdksh, if the last command of a pipeline is a shell builtin, it
    is not executed in the parent shell, so "echo a b | read foo bar"
    does not set foo and bar in the parent shell (at&t ksh will).
    This may get fixed in the future, but it may take a while.

$ man pdksh | col -b | sed -n '/BTW, the/,/aware/p'
  BTW, the most frequently reported bug is
    echo hi | read a; echo $a   # Does not print hi
  I'm aware of this and there is no need to report it.

```

This behavior is easy enough to demonstrate—running the script above with the default bash shell and providing a sequence of example events:

```

$ cp /etc/passwd /tmp/newdata.txt
$ cp /etc/group /var/tmp/CLOSE_WEEK20170407.txt
$ cp /etc/passwd /tmp/SHUT

```

gives the following script output:

```

# ./inotify.sh
Setting up watches.
Watches established.
Import job should start on newdata.txt (/tmp/ CLOSE_WRITE,CLOSE).
Weekly backup is ready.
We processed events.

```

Examining the process list while the script is running, you'll also see two shells, one forked for the control structure:

```

$ function pps { typeset a IFS=\| ; ps ax | while read a
do case $a in *$1*|+([!0-9])) echo $a;; esac; done }

$ pps inot
  PID TTY      STAT   TIME COMMAND
 3394 pts/1    S+     0:00 /bin/sh ./inotify.sh
 3395 pts/1    S+     0:00 inotifywait -m -e close_write /tmp /var/tmp
 3396 pts/1    S+     0:00 /bin/sh ./inotify.sh

```

As it was manipulated in a subshell, the "step" variable above was null when control flow reached the echo. Switching this from #/bin/sh to #/bin/ksh93 will correct the problem, and only one shell process will be seen:

```

# ./inotify.ksh93
Setting up watches.
Watches established.
Import job should start on newdata.txt (/tmp/ CLOSE_WRITE,CLOSE).
Weekly backup is ready.
We processed 2 events.

$ pps inot
  PID TTY      STAT   TIME COMMAND
 3583 pts/1    S+     0:00 /bin/ksh93 ./inotify.sh
 3584 pts/1    S+     0:00 inotifywait -m -e close_write /tmp /var/tmp

```

Although ksh93 behaves properly and in general handles scripts far more gracefully than all of the other Linux shells, it is rather large:

```

$ ll /bin/[bkm]+([aksh93]) /etc/alternatives/ksh
-rwxr-xr-x. 1 root root  960456 Dec  6 11:11 /bin/bash
lrwxrwxrwx. 1 root root      21 Apr  3 21:01 /bin/ksh ->
                                               /etc/alternatives/ksh
-rwxr-xr-x. 1 root root 1518944 Aug 31  2016 /bin/ksh93
-rwxr-xr-x. 1 root root  296208 May  3  2014 /bin/mksh
lrwxrwxrwx. 1 root root      10 Apr  3 21:01 /etc/alternatives/ksh ->
                                                    /bin/ksh93

```

The mksh binary is the smallest of the Bourne implementations above (some of these shells may be missing on your system, but you can install them with yum). For a long-term monitoring process, mksh is likely the best choice for reducing both processing and memory footprint, and it does not launch multiple copies of itself when idle assuming that a coprocess is used. Converting the script to use a Korn coprocess that is friendly to mksh is not difficult:

```

#!/bin/mksh
unset IFS                              # default of space, tab and nl
                                       # Wait for filesystem events
inotifywait -m -e close_write \
   /tmp/ /var/tmp/ /home/oracle/arch-orcl/ \
   2</dev/null |&                      # Launch as Korn coprocess

while read -p dir op file              # Read from Korn coprocess
do [[ "${dir}" == '/tmp/' && "${file}" == *.txt ]] &&
      print "Import job should start on $file ($dir $op)."

   [[ "${dir}" == '/var/tmp/' && "${file}" == CLOSE_WEEK*.txt ]] &&
      print Weekly backup is ready.

   [[ "${dir}" == '/home/oracle/arch-orcl/' && "${file}" == *.ARC ]]
&&
      su - oracle -c 'ORACLE_SID=orcl ~oracle/bin/log_shipper' &

   [[ "${dir}" == '/tmp/' && "${file}" == SHUT ]] && break

   ((step+=1))
done

echo We processed $step events.
```


Note that the Korn and Bolsky reference on the Korn shell outlines the following requirements in a program operating as a coprocess: 

   Caution: The co-process must: 
   + Send each output message to standard output. 
   + Have a Newline at the end of each message. 
   + Flush its standard output whenever it writes a message.

An fflush(NULL) is found in the main processing loop of the inotifywait source, and these requirements appear to be met.

The mksh version of the script is the most reasonable compromise for efficient use and correct behavior, and I have explained it at some length here to save readers trouble and frustration—it is important to avoid control structures executing in subshells in most of the Borne family. However, hopefully all of these ersatz shells someday fix this basic flaw and implement the Korn behavior correctly.

### A Practical Application—Oracle Log Shipping

Oracle databases that are configured for hot backups produce a stream of "archived redo log files" that are used for database recovery. These are the most critical backup files that are produced in an Oracle database.

These files are numbered sequentially and are written to a log directory configured by the DBA. An inotifywatch can trigger activities to compress, encrypt and/or distribute the archived logs to backup and disaster recovery servers for safekeeping. You can configure Oracle RMAN to do most of these functions, but the OS tools are more capable, flexible and simpler to use.

There are a number of important design parameters for a script handling archived logs:

*   A "critical section" must be established that allows only a single process to manipulate the archived log files at a time. Oracle will sometimes write bursts of log files, and inotify might cause the handler script to be spawned repeatedly in a short amount of time. Only one instance of the handler script can be allowed to run—any others spawned during the handler's lifetime must immediately exit. This will be achieved with a textbook application of the flock program from the util-linux package.

*   The optimum compression available for production applications appears to be [lzip][1]. The author claims that the integrity of his archive format is [superior to many more well known utilities][2], both in compression ability and also structural integrity. The lzip binary is not in the standard repository for Oracle Linux—it is available in EPEL and is easily compiled from source.

*   Note that [7-Zip][3] uses the same LZMA algorithm as lzip, and it also will perform AES encryption on the data after compression. Encryption is a desirable feature, as it will exempt a business from [breach disclosure laws][4] in most US states if the backups are lost or stolen and they contain "Protected Personal Information" (PPI), such as birthdays or Social Security Numbers. The author of lzip does have harsh things to say regarding the quality of 7-Zip archives using LZMA2, and the openssl enc program can be used to apply AES encryption after compression to lzip archives or any other type of file, as I discussed in a [previous article][5]. I'm foregoing file encryption in the script below and using lzip for clarity.

*   The current log number will be recorded in a dot file in the Oracle user's home directory. If a log is skipped for some reason (a rare occurrence for an Oracle database), log shipping will stop. A missing log requires an immediate and full database backup (either cold or hot)—successful recoveries of Oracle databases cannot skip logs.

*   The scp program will be used to copy the log to a remote server, and it should be called repeatedly until it returns successfully.

*   I'm calling the genuine '93 Korn shell for this activity, as it is the most capable scripting shell and I don't want any surprises.

Given these design parameters, this is an implementation:

```

# cat ~oracle/archutils/process_logs

#!/bin/ksh93

set -euo pipefail
IFS=$'\n\t'  # http://redsymbol.net/articles/unofficial-bash-strict-mode/

(
 flock -n 9 || exit 1          # Critical section-allow only one process.

 ARCHDIR=~oracle/arch-${ORACLE_SID}

 APREFIX=${ORACLE_SID}_1_

 ASUFFIX=.ARC

 CURLOG=$(<~oracle/.curlog-$ORACLE_SID)

 File="${ARCHDIR}/${APREFIX}${CURLOG}${ASUFFIX}"

 [[ ! -f "$File" ]] && exit

 while [[ -f "$File" ]]
 do ((NEXTCURLOG=CURLOG+1))

    NextFile="${ARCHDIR}/${APREFIX}${NEXTCURLOG}${ASUFFIX}"

    [[ ! -f "$NextFile" ]] && sleep 60  # Ensure ARCH has finished

    nice /usr/local/bin/lzip -9q "$File"

    until scp "${File}.lz" "yourcompany.com:~oracle/arch-$ORACLE_SID"
    do sleep 5
    done

    CURLOG=$NEXTCURLOG

    File="$NextFile"
 done

 echo $CURLOG > ~oracle/.curlog-$ORACLE_SID

) 9>~oracle/.processing_logs-$ORACLE_SID

```

The above script can be executed manually for testing even while the inotify handler is running, as the flock protects it.

A standby server, or a DataGuard server in primitive standby mode, can apply the archived logs at regular intervals. The script below forces a 12-hour delay in log application for the recovery of dropped or damaged objects, so inotify cannot be easily used in this case—cron is a more reasonable approach for delayed file processing, and a run every 20 minutes will keep the standby at the desired recovery point:

```

# cat ~oracle/archutils/delay-lock.sh

#!/bin/ksh93

(
 flock -n 9 || exit 1              # Critical section-only one process.

 WINDOW=43200                      # 12 hours

 LOG_DEST=~oracle/arch-$ORACLE_SID

 OLDLOG_DEST=$LOG_DEST-applied

 function fage { print $(( $(date +%s) - $(stat -c %Y "$1") ))
  } # File age in seconds - Requires GNU extended date & stat

 cd $LOG_DEST

 of=$(ls -t | tail -1)             # Oldest file in directory

 [[ -z "$of" || $(fage "$of") -lt $WINDOW ]] && exit

 for x in $(ls -rt)                    # Order by ascending file mtime
 do if [[ $(fage "$x") -ge $WINDOW ]]
    then y=$(basename $x .lz)          # lzip compression is optional

         [[ "$y" != "$x" ]] && /usr/local/bin/lzip -dkq "$x"

         $ORACLE_HOME/bin/sqlplus '/ as sysdba' > /dev/null 2>&1 <<-EOF
                recover standby database;
                $LOG_DEST/$y
                cancel
                quit
                EOF

         [[ "$y" != "$x" ]] && rm "$y"

         mv "$x" $OLDLOG_DEST
    fi

 done
) 9> ~oracle/.recovering-$ORACLE_SID

```

I've covered these specific examples here because they introduce tools to control concurrency, which is a common issue when using inotify, and they advance a few features that increase reliability and minimize storage requirements. Hopefully enthusiastic readers will introduce many improvements to these approaches.

### The incron System

Lukas Jelinek is the author of the incron package that allows users to specify tables of inotify events that are executed by the master incrond process. Despite the reference to "cron", the package does not schedule events at regular intervals—it is a tool for filesystem events, and the cron reference is slightly misleading.

The incron package is available from EPEL. If you have installed the repository, you can load it with yum:

```

# yum install incron
Loaded plugins: langpacks, ulninfo
Resolving Dependencies
--> Running transaction check
---> Package incron.x86_64 0:0.5.10-8.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================
 Package       Arch       Version           Repository    Size
=================================================================
Installing:
 incron        x86_64     0.5.10-8.el7      epel          92 k

Transaction Summary
==================================================================
Install  1 Package

Total download size: 92 k
Installed size: 249 k
Is this ok [y/d/N]: y
Downloading packages:
incron-0.5.10-8.el7.x86_64.rpm                      |  92 kB   00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : incron-0.5.10-8.el7.x86_64                          1/1
  Verifying  : incron-0.5.10-8.el7.x86_64                          1/1

Installed:
  incron.x86_64 0:0.5.10-8.el7

Complete!

```

On a systemd distribution with the appropriate service units, you can start and enable incron at boot with the following commands:

```

# systemctl start incrond
# systemctl enable incrond
Created symlink from
   /etc/systemd/system/multi-user.target.wants/incrond.service
to /usr/lib/systemd/system/incrond.service.

```

In the default configuration, any user can establish incron schedules. The incrontab format uses three fields:

```
path> <mask> <command> 
```

Below is an example entry that was set with the -e option:

```

$ incrontab -e        #vi session follows

$ incrontab -l
/tmp/ IN_ALL_EVENTS /home/luser/myincron.sh $@ $% $#

```

You can record a simple script and mark it with execute permission:

```

$ cat myincron.sh
#!/bin/sh

echo -e "path: $1 op: $2 \t file: $3" >> ~/op

$ chmod 755 myincron.sh

```

Then, if you repeat the original /tmp file manipulations at the start of this article, the script will record the following output:

```

$ cat ~/op

path: /tmp/ op: IN_ATTRIB        file: hello
path: /tmp/ op: IN_CREATE        file: hello
path: /tmp/ op: IN_OPEN          file: hello
path: /tmp/ op: IN_CLOSE_WRITE   file: hello
path: /tmp/ op: IN_OPEN          file: passwd
path: /tmp/ op: IN_CLOSE_WRITE   file: passwd
path: /tmp/ op: IN_MODIFY        file: passwd
path: /tmp/ op: IN_CREATE        file: passwd
path: /tmp/ op: IN_DELETE        file: passwd
path: /tmp/ op: IN_CREATE        file: goodbye
path: /tmp/ op: IN_ATTRIB        file: goodbye
path: /tmp/ op: IN_OPEN          file: goodbye
path: /tmp/ op: IN_CLOSE_WRITE   file: goodbye
path: /tmp/ op: IN_DELETE        file: hello
path: /tmp/ op: IN_DELETE        file: goodbye

```

While the IN_CLOSE_WRITE event on a directory object is usually of greatest interest, most of the standard inotify events are available within incron, which also offers several unique amalgams:

```

$ man 5 incrontab | col -b | sed -n '/EVENT SYMBOLS/,/child process/p'

EVENT SYMBOLS

These basic event mask symbols are defined:

IN_ACCESS          File was accessed (read) (*)
IN_ATTRIB          Metadata changed (permissions, timestamps, extended
                   attributes, etc.) (*)
IN_CLOSE_WRITE     File opened for writing was closed (*)
IN_CLOSE_NOWRITE   File not opened for writing was closed (*)
IN_CREATE          File/directory created in watched directory (*)
IN_DELETE          File/directory deleted from watched directory (*)
IN_DELETE_SELF     Watched file/directory was itself deleted
IN_MODIFY          File was modified (*)
IN_MOVE_SELF       Watched file/directory was itself moved
IN_MOVED_FROM      File moved out of watched directory (*)
IN_MOVED_TO        File moved into watched directory (*)
IN_OPEN            File was opened (*)

When monitoring a directory, the events marked with an asterisk (*)
above can occur for files in the directory, in which case the name
field in the returned event data identifies the name of the file within
the directory.

The IN_ALL_EVENTS symbol is defined as a bit mask of all of the above
events. Two additional convenience symbols are IN_MOVE, which is a com-
bination of IN_MOVED_FROM and IN_MOVED_TO, and IN_CLOSE, which combines
IN_CLOSE_WRITE and IN_CLOSE_NOWRITE.

The following further symbols can be specified in the mask:

IN_DONT_FOLLOW     Don't dereference pathname if it is a symbolic link
IN_ONESHOT         Monitor pathname for only one event
IN_ONLYDIR         Only watch pathname if it is a directory

Additionally, there is a symbol which doesn't appear in the inotify sym-
bol set. It is IN_NO_LOOP. This symbol disables monitoring events until
the current one is completely handled (until its child process exits).

```

The incron system likely presents the most comprehensive interface to inotify of all the tools researched and listed here. Additional configuration options can be set in /etc/incron.conf to tweak incron's behavior for those that require a non-standard configuration.

### Path Units under systemd

When your Linux installation is running systemd as PID 1, limited inotify functionality is available through "path units" as is discussed in a lighthearted [article by Paul Brown][8] at OCS-Mag.

The relevant manual page has useful information on the subject:

```

$ man systemd.path | col -b | sed -n '/Internally,/,/systems./p'

Internally, path units use the inotify(7) API to monitor file systems.
Due to that, it suffers by the same limitations as inotify, and for
example cannot be used to monitor files or directories changed by other
machines on remote NFS file systems.

```

Note that when a systemd path unit spawns a shell script, the $HOME and tilde (~) operator for the owner's home directory may not be defined. Using the tilde operator to reference another user's home directory (for example, ~nobody/) does work, even when applied to the self-same user running the script. The Oracle script above was explicit and did not reference ~ without specifying the target user, so I'm using it as an example here.

Using inotify triggers with systemd path units requires two files. The first file specifies the filesystem location of interest:

```

$ cat /etc/systemd/system/oralog.path

[Unit]
Description=Oracle Archivelog Monitoring
Documentation=http://docs.yourserver.com

[Path]
PathChanged=/home/oracle/arch-orcl/

[Install]
WantedBy=multi-user.target

```

The PathChanged parameter above roughly corresponds to the close-write event used in my previous direct inotify calls. The full collection of inotify events is not (currently) supported by systemd—it is limited to PathExists, PathChanged and PathModified, which are described in man systemd.path.

The second file is a service unit describing a program to be executed. It must have the same name, but a different extension, as the path unit:

```

$ cat /etc/systemd/system/oralog.service

[Unit]
Description=Oracle Archivelog Monitoring
Documentation=http://docs.yourserver.com

[Service]
Type=oneshot
Environment=ORACLE_SID=orcl
ExecStart=/bin/sh -c '/root/process_logs >> /tmp/plog.txt 2>&1'

```

The oneshot parameter above alerts systemd that the program that it forks is expected to exit and should not be respawned automatically—the restarts are limited to triggers from the path unit. The above service configuration will provide the best options for logging—divert them to /dev/null if they are not needed.

Use systemctl start on the path unit to begin monitoring—a common error is using it on the service unit, which will directly run the handler only once. Enable the path unit if the monitoring should survive a reboot.

Although this limited functionality may be enough for some casual uses of inotify, it is a shame that the full functionality of inotifywait and incron are not represented here. Perhaps it will come in time.

### Conclusion

Although the inotify tools are powerful, they do have limitations. To repeat them, inotify cannot monitor remote (NFS) filesystems; it cannot report the userid involved in a triggering event; it does not work with /proc or other pseudo-filesystems; mmap() operations do not trigger it; and the inotify queue can overflow resulting in lost events, among other concerns.

Even with these weaknesses, the efficiency of inotify is superior to most other approaches for immediate notifications of filesystem activity. It also is quite flexible, and although the close-write directory trigger should suffice for most usage, it has ample tools for covering special use cases.

In any event, it is productive to replace polling activity with inotify watches, and system administrators should be liberal in educating the user community that the classic crontab is not an appropriate place to check for new files. Recalcitrant users should be confined to Ultrix on a VAX until they develop sufficient appreciation for modern tools and approaches, which should result in more efficient Linux systems and happier administrators.

### Sidenote: Archiving /etc/passwd

Tracking changes to the password file involves many different types of inotify triggering events. The vipw utility commonly will make changes to a temporary file, then clobber the original with it. This can be seen when the inode number changes:

```

# ll -i /etc/passwd
199720973 -rw-r--r-- 1 root root 3928 Jul  7 12:24 /etc/passwd

# vipw
[ make changes ]
You are using shadow passwords on this system.
Would you like to edit /etc/shadow now [y/n]? n

# ll -i /etc/passwd
203784208 -rw-r--r-- 1 root root 3956 Jul  7 12:24 /etc/passwd

```

The destruction and replacement of /etc/passwd even occurs with setuid binaries called by unprivileged users:

```

$ ll -i /etc/passwd
203784196 -rw-r--r-- 1 root root 3928 Jun 29 14:55 /etc/passwd

$ chsh
Changing shell for fishecj.
Password:
New shell [/bin/bash]: /bin/csh
Shell changed.

$ ll -i /etc/passwd
199720970 -rw-r--r-- 1 root root 3927 Jul  7 12:23 /etc/passwd

```

For this reason, all inotify triggering events should be considered when tracking this file. If there is concern with an inotify queue overflow (in which events are lost), then the OPEN, ACCESS and CLOSE_NOWRITE,CLOSE triggers likely can be immediately ignored.

All other inotify events on /etc/passwd might run the following script to version the changes into an RCS archive and mail them to an administrator:

```

#!/bin/sh

# This script tracks changes to the /etc/passwd file from inotify.
# Uses RCS for archiving. Watch for UID zero.

PWMAILS=Charlie.Root@openbsd.org

TPDIR=~/track_passwd

cd $TPDIR

if diff -q /etc/passwd $TPDIR/passwd
then exit                                         # they are the same
else sleep 5                                      # let passwd settle
     diff /etc/passwd $TPDIR/passwd 2>&1 |        # they are DIFFERENT
     mail -s "/etc/passwd changes $(hostname -s)" "$PWMAILS"
     cp -f /etc/passwd $TPDIR                     # copy for checkin

#    "SCCS, the source motel! Programs check in and never check out!"
#     -- Ken Thompson

     rcs -q -l passwd                            # lock the archive
     ci -q -m_ passwd                            # check in new ver
     co -q passwd                                # drop the new copy
fi > /dev/null 2>&1

```

Here is an example email from the script for the above chfn operation:

```

-----Original Message-----
From: root [mailto:root@myhost.com]
Sent: Thursday, July 06, 2017 2:35 PM
To: Fisher, Charles J. ;
Subject: /etc/passwd changes myhost

57c57
< fishecj:x:123:456:Fisher, Charles J.:/home/fishecj:/bin/bash
---
> fishecj:x:123:456:Fisher, Charles J.:/home/fishecj:/bin/csh

```

Further processing on the third column of /etc/passwd might detect UID zero (a root user) or other important user classes for emergency action. This might include a rollback of the file from RCS to /etc and/or SMS messages to security contacts.


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-filesystem-events-inotify

作者：[Charles Fisher][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:http://www.nongnu.org/lzip
[2]:http://www.nongnu.org/lzip/xz_inadequate.html
[3]:http://www.7-zip.org
[4]:http://www.ncsl.org/research/telecommunications-and-information-technology/security-breach-notification-laws.aspx
[5]:http://www.linuxjournal.com/content/flat-file-encryption-openssl-and-gpg
[6]:http://www.linuxjournal.com/article/8478
[7]:https://fedoraproject.org/wiki/EPEL
[8]:http://www.ocsmag.com/2015/09/02/monitoring-file-access-for-dummies
