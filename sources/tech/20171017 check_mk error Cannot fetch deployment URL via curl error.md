translating by lujun9972
check_mk error Cannot fetch deployment URL via curl error
======
Article explaining 'ERROR Cannot fetch deployment URL via curl: Couldn't resolve host. The given remote host was not resolved.' and how to resolve it.

![ERROR Cannot fetch deployment URL via curl: Couldn't resolve host. The given remote host was not resolved.][1]

check_mk is a utility which helps you configure your server to be monitored via [nagios monitoring tool][2]. While configuring one of the client I came across below error :

`ERROR Cannot fetch deployment URL via curl: Couldn't resolve host. The given remote host was not resolved.`

This error came after I tried to register client with monitoring server with below command :

```
root@kerneltalks# /usr/bin/cmk-update-agent register -s monitor.kerneltalks.com -i master -H `hostname` -p http -U omdadmin -S ASFKWEFUNSHEFKG -v 
```

Here in this command -

`-s` is monitoring server
`-i` is Name of Check_MK site on that server
`-H` is Host name to fetch agent for
`-p` is protocol Either http or https (default is https)
`-U` User-ID of a user who is allowed to download the agent.
`-S` is secret. Automation secret of that user (in case of automation user)
From error you can figure out that command is not able to resolve monitoring server DNS name `monitor.kerneltalks.com`

### Solution :

Its pretty simple. Check `/etc/resolv.conf` to make sure that you have proper DNS server entry for your environment. If it still dosnt resolve issue then you can add entry in [/etc/hosts][3] for it.

```
root@kerneltalks# cat /etc/hosts
10.0.10.9 monitor.kerneltalks.com
```

Thats it. You would be able to register now successfully.

```
root@kerneltalks # /usr/bin/cmk-update-agent register -s monitor.kerneltalks.com -i master -H `hostname` -p http -U omdadmin -S ASFKWEFUNSHEFKG -v
Going to register agent at deployment server
Successfully registered agent for deployment.
You can now update your agent by running 'cmk-update-agent -v'
Saved your registration settings to /etc/cmk-update-agent.state.
```

By the way you can directly use IP address for `-s` switch and get rid of all above jargon including error itself!

--------------------------------------------------------------------------------

via: https://kerneltalks.com/troubleshooting/check_mk-register-cannot-fetch-deployment-url-via-curl-error/

作者：[kerneltalks][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://c4.kerneltalks.com/wp-content/uploads/2017/10/resolve-check_mk-error.png
[2]:https://www.nagios.org/
[3]:https://kerneltalks.com/linux/understanding-etc-hosts-file/
