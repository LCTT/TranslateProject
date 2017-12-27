How to use/run bash aliases over ssh based session
======

SSH client (ssh) is a Linux/Unix command for logging into a remote server and for executing shell commands on a remote system. It is designed to provide secure encrypted communications between two untrusted machines over an insecure network such as the Internet.

## How to run or execute commands with Linux ssh client

I have [set up a bash alias named file_repl][1] . It works entirely when I log in using ssh command. However, my bash aliases are not running over ssh, for example:How do I run bash shell aliases when I use ssh command?SSH client (ssh) is a Linux/Unix command for logging into a remote server and for executing shell commands on a remote system. It is designed to provide secure encrypted communications between two untrusted machines over an insecure network such as the Internet.

To run a free command or [date command][2] with ssh:
`$ ssh [[email protected]][3] date`
Sample outputs:
```
Tue Dec 26 09:02:50 UTC 2017
```

OR
`$ ssh [[email protected]][3] free -h`
Sample outputs:
```
 
 total used free shared buff/cache available
Mem: 2.0G 428M 138M 145M 1.4G 1.1G
Swap: 0B 0B 0B
```

total used free shared buff/cache available Mem: 2.0G 428M 138M 145M 1.4G 1.1G Swap: 0B 0B 0B

## Understanding bash shall and command types

The [bash shell understands][4] the following types of commands:

  1. Aliases such as ll
  2. Keywords such as if
  3. Functions (user defined functions such as genpasswd)
  4. Built in such as pwd
  5. Files such as /bin/date



The [type command][5] or [command command][6] can be used to find out a command type:
```
$ type -a date
date is /bin/date
$ type -a free
free is /usr/bin/free
$ command -V pwd
pwd is a shell builtin
$ type -a file_repl
is aliased to `sudo -i /shared/takes/master.replication'
```
Both date and free are an external commands and file_repl is aliased to sudo -i /shared/takes/master.replication. One can not simply execute aliased command such as file_repl:

```
$ ssh user@remote file_repl
```

## Bash aliases not running or working over ssh client on Unix based system

To solve this problem run ssh command as follows:
```
$ ssh -t [[email protected]][3] /bin/bash -ic 'your-alias-here'
$ ssh -t [[email protected]][3] /bin/bash -ic 'file_repl'
```
Where ssh command options:

  1.  **-t** :[ Force pseudo-terminal allocation. This can be used to execute arbitrary][7] screen-based programs on a remote machine, which can be very useful. With the -t option you will get an error that read as " bash: cannot set terminal process group (-1): Inappropriate ioctl for device. bash: no job control in this shell. "



Where bash shell options:

  1.  **-i** : Make the shell is interactive so that it can run bash aliases
  2.  **-c** : Commands are read from the first non-option argument command_string. If there are arguments after the command_string, they are assigned to the positional parameters, starting with $0.

In short run the following command to run a bash aliases called ll:
`$ ssh -t [[email protected]][3] -ic 'll'`
Sample session:
[![Running bash aliases over ssh based session when using Unix or Linux ssh cli][8]][8]
Here is my sample shell script:

```
#!/bin/bash
I="tags.deleted.410"
O="/tmp/https.www.cyberciti.biz.410.url.conf"
box="vivek@server1.cyberciti.biz"
[ ! -f "$I" ] && { echo "$I file not found."; exit 10; }
>$O
cat "$I" | sort | uniq | while read -r u
do
	uu="${u##https://www.cyberciti.biz}"
	echo "~^$uu 1;" >>"${O}"
done
echo "Config file created at ${O} and now updating remote nginx config file"
scp "${O}" ${box}:/tmp/
ssh ${box} /usr/bin/lxc file push /tmp/https.www.cyberciti.biz.410.url.conf nginx-container/etc/nginx/
ssh -t ${box} /bin/bash -ic 'push_config_job'
```

## References

For more info see [OpenSSH client][9] and [bash man page][10] by typing the following commands:
```
$ man ssh
$ man bash
$ help type
$ help command
```


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/use-bash-aliases-ssh-based-session/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://bash.cyberciti.biz/guide/Alias_command#How_to_define_alias
[2]:https://www.cyberciti.biz/faq/unix-date-command-howto-see-set-date-time/ (See Linux/Unix date command examples for more info)
[3]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[4]:https://bash.cyberciti.biz/guide/Shell_commands
[5]:https://bash.cyberciti.biz/guide/Type_command
[6]:https://bash.cyberciti.biz/guide/Command
[7]:https://www.cyberciti.biz/faq/linux-unix-bsd-sudo-sorry-you-must-haveattytorun/
[8]:https://www.cyberciti.biz/media/new/faq/2017/12/Bash-shell-aliase-not-found-when-run-over-ssh-on-linux-unix.jpg
[9]:https://man.openbsd.org/ssh
[10]:https://www.gnu.org/software/bash/manual/bash.html
