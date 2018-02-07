如何解决 check_mk 出现 “Cannot fetch deployment URL via curl” 的错误
======

本文解释了 “ERROR Cannot fetch deployment URL via curl：Couldn't resolve host。The given remote host was not resolved。” 的原因及其解决方案。

![ERROR Cannot fetch deployment URL via curl：Couldn't resolve host。The given remote host was not resolved。][1]

`check_mk` 是一个帮你配置 [nagios][2] 监控服务器的工具。然后在配置其中一台机器时，我遇到了下面的错误：

```
ERROR Cannot fetch deployment URL via curl：Couldn't resolve host。The given remote host was not resolved。
```

该错误是在我使用下面命令尝试将该机器注册到监控服务器时发生的：

```
root@kerneltalks# /usr/bin/cmk-update-agent register -s monitor.kerneltalks.com -i master -H `hostname` -p http -U omdadmin -S ASFKWEFUNSHEFKG -v 
```

其中：

- `-s` 指明监控服务器
- `-i` 指定服务器上 Check_MK 站点的名称
- `-H` 指定 agent 所在的主机名
- `-p` 为协议，可以是 http 或 https （默认为 https）
- `-U` 允许下载 agent 的用户 ID
- `-S` 为密码。用户的自动操作密码（当是自动用户时）

从错误中可以看出，命令无法解析监控服务器的 DNS 名称 `monitor.kerneltalks.com`。

### 解决方案：

超级简单。检查 `/etc/resolv.conf`，确保你的 DNS 配置正确。如果还解决不了这个问题那么你可以直接在 [/etc/hosts][3] 中指明它的 IP。

```
root@kerneltalks# cat /etc/hosts
10.0.10.9 monitor.kerneltalks.com
```

这就搞定了。你现在可以成功注册了。

```
root@kerneltalks # /usr/bin/cmk-update-agent register -s monitor.kerneltalks.com -i master -H `hostname` -p http -U omdadmin -S ASFKWEFUNSHEFKG -v
Going to register agent at deployment server
Successfully registered agent for deployment.
You can now update your agent by running 'cmk-update-agent -v'
Saved your registration settings to /etc/cmk-update-agent.state.
```

另外，你也可以为 `-s` 直接指定 IP 地址，就没那么多事了！

--------------------------------------------------------------------------------

via: https://kerneltalks.com/troubleshooting/check_mk-register-cannot-fetch-deployment-url-via-curl-error/

作者：[kerneltalks][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a4.kerneltalks.com/wp-content/uploads/2017/10/resolve-check_mk-error.png
[2]:https://www.nagios.org/
[3]:https://kerneltalks.com/linux/understanding-etc-hosts-file/
