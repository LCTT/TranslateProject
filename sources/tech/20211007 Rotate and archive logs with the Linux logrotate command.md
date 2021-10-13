[#]: subject: "Rotate and archive logs with the Linux logrotate command"
[#]: via: "https://opensource.com/article/21/10/linux-logrotate"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Rotate and archive logs with the Linux logrotate command
======
Keep log files fresh with this Linux command. Download the new logrotate
cheat sheet.
![Logs stacked up and to the right in front of a green tree forest][1]

Logs are great for finding out what an application is doing or troubleshooting a possible problem. Almost every application we deal with generates logs, and we want the applications we develop ourselves to generate them too. The more verbose the logs, the more information we have. But left to themselves, logs can grow to an unmanageable size, and they can, in turn, become a problem of their own. So it's a good idea to keep them trimmed down, keep the ones we're going to need, and archive the rest.

### Basics

The `logrotate` utility is excellent at managing logs. It can rotate them, compress them, email them, delete them, archive them, and start fresh ones when you need them.

Running `logrotate` is pretty simple—just run `logrotate -vs state-file config-file`. In the above command, the `v` option enables verbose mode, `s` specifies a state file, and the final `config-file` mentions the configuration file, where you specify what you need done.

### Hands-on

Let's check out a `logrotate` configuration that is running silently on our system, managing the wealth of logs we find in the `/var/log` directory. Check out the current files in that directory. Do you see a lot of `*.[number].gz` files? That’s what `logrotate` is doing. You can find the configuration file for this under `/etc/logrotate.d/rsyslog`. Mine looks like this:


```
/var/log/syslog
{
        rotate 7
        daily
        missingok
        notifempty
        delaycompress
        compress
        postrotate
                reload rsyslog &gt;/dev/null 2&gt;&amp;1 || true
        endscript
}

/var/log/mail.info
/var/log/mail.warn
/var/log/mail.err
/var/log/mail.log
/var/log/daemon.log
/var/log/kern.log
/var/log/auth.log
/var/log/user.log
/var/log/lpr.log
/var/log/cron.log
/var/log/debug
/var/log/messages

{
        rotate 4
        weekly
        missingok
        notifempty
        compress
        delaycompress
        sharedscripts
        postrotate
                reload rsyslog &gt;/dev/null 2&gt;&amp;1 || true
        endscript
}
```

The file starts with defining the instructions for rotating the `/var/log/syslog` file and the instructions are contained within the curly braces that follow. Here’s what they mean:

  * `rotate 7`: Keep logs from the last seven rotations. Then start deleting them.
  * `daily`: Rotate the log daily. Along with `rotate 7`, this would mean that logs would be kept for the last seven days. Other options are `weekly`, `monthly`, `yearly`. There is also a `size` parameter that will rotate log files if their size increases beyond a specified limit—for example, `size 10k`, `size 10M`, `size 10G`, etc. If nothing is specified, logs will be rotated whenever `logrotate` runs. You can even run `logrotate` in a `cron` to use it at more specific time intervals.
  * `missingok`: It’s okay if the log file is missing. Don’t Panic.
  * `notifempty`: Don’t rotate if the log file is empty.
  * `delaycompress`: If compression is on, delay compression until the next rotation. This allows at least one rotated but uncompressed file to be present. Useful if you want yesterday’s logs to stay uncompressed for troubleshooting. It is also helpful if some program might still write to the old file until it is restarted/reloaded, like Apache.
  * `compress`: Compression is on. Use `nocompress` to turn it off.
  * `postrotate/endscript`: Run the script within this section after rotation. Helpful in doing cleanup stuff. There is also a `prerotate/endscript` for doing things before rotation begins.



Can you figure out what the next section does for all those files mentioned in the configuration above? The only additional parameter in the second section is `sharedscripts`, which tells `logrotate` to not run the section within `postrotate/endscript` until all log rotation is complete. It prevents the script from being executed for every log rotated and runs once at the end.

### Something New

I’m using the following configuration for dealing with Nginx access and error logs on my system.


```
/var/log/nginx/access.log
/var/log/nginx/error.log  {
        size 1
        missingok
        notifempty
        create 544 www-data adm
        rotate 30
        compress
        delaycompress
        dateext
        dateformat -%Y-%m-%d-%s
        sharedscripts
        extension .log
        postrotate
                service nginx reload
        endscript
}
```

The above script can be run using:


```
logrotate -vs state-file /tmp/logrotate
```

Running the command for the first time gives this output:


```
reading config file /tmp/logrotate
extension is now .log

Handling 1 logs

rotating pattern: /var/log/nginx/access.log
/var/log/nginx/error.log   1 bytes (30 rotations)
empty log files are not rotated, old logs are removed
considering log /var/log/nginx/access.log
  log needs rotating
considering log /var/log/nginx/error.log
  log does not need rotating
rotating log /var/log/nginx/access.log, log-&gt;rotateCount is 30
Converted ' -%Y-%m-%d-%s' -&gt; '-%Y-%m-%d-%s'
dateext suffix '-2021-08-27-1485508250'
glob pattern '-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
glob finding logs to compress failed
glob finding old rotated logs failed
renaming /var/log/nginx/access.log to /var/log/nginx/access-2021-08-27-1485508250.log
creating new /var/log/nginx/access.log mode = 0544 uid = 33 gid = 4
running postrotate script
* Reloading nginx configuration nginx
```

And running it a second time:


```
reading config file /tmp/logrotate
extension is now .log

Handling 1 logs

rotating pattern: /var/log/nginx/access.log
/var/log/nginx/error.log   1 bytes (30 rotations)
empty log files are not rotated, old logs are removed
considering log /var/log/nginx/access.log
  log needs rotating
considering log /var/log/nginx/error.log
  log does not need rotating
rotating log /var/log/nginx/access.log, log-&gt;rotateCount is 30
Converted ' -%Y-%m-%d-%s' -&gt; '-%Y-%m-%d-%s'
dateext suffix '-2021-08-27-1485508280'
glob pattern '-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
compressing log with: /bin/gzip
renaming /var/log/nginx/access.log to /var/log/nginx/access-2021-08-27-1485508280.log
creating new /var/log/nginx/access.log mode = 0544 uid = 33 gid = 4
running postrotate script
* Reloading nginx configuration nginx
```

And running it a third time:


```
reading config file /tmp/logrotate
extension is now .log

Handling 1 logs

rotating pattern: /var/log/nginx/access.log
/var/log/nginx/error.log   1 bytes (30 rotations)
empty log files are not rotated, old logs are removed
considering log /var/log/nginx/access.log
  log needs rotating
considering log /var/log/nginx/error.log
  log does not need rotating
rotating log /var/log/nginx/access.log, log-&gt;rotateCount is 30
Converted ' -%Y-%m-%d-%s' -&gt; '-%Y-%m-%d-%s'
dateext suffix '-2021-08-27-1485508316'
glob pattern '-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
compressing log with: /bin/gzip
renaming /var/log/nginx/access.log to /var/log/nginx/access-2021-08-27-1485508316.log
creating new /var/log/nginx/access.log mode = 0544 uid = 33 gid = 4
running postrotate script
* Reloading nginx configuration nginx
```

The contents of the state file look like this:


```
logrotate state -- version 2
"/var/log/nginx/error.log" 2021-08-27-9:0:0
"/var/log/nginx/access.log" 2021-08-27-9:11:56
```

[**Download the Linux logrotate cheat sheet.**][2]

* * *

_This article was originally published on the [author's personal blog][3] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-logrotate

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/oliver-paaske-unsplash.jpg?itok=bv0sZSSB (Logs stacked up and to the right in front of a green tree forest)
[2]: https://opensource.com/downloads/logrotate-cheat-sheet
[3]: https://notes.ayushsharma.in/2017/01/fiddling-with-logrotate
