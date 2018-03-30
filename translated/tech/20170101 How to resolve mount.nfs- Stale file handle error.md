如何解决 mount.nfs：失效的文件句柄错误
======
了解如何解决 mount.nfs：Linux 平台上的失效文件句柄错误。它是可以在客户端或者服务端解决的网络文件系统错误。

 _![][1]_

当你在你的环境中使用网络文件系统时，你一定不时看到 `mount.nfs：Stale file handle` 错误。此错误表示 NFS 共享无法挂载，因为自上次配置后有些东西已经更改。

无论何时你重启 NFS 服务器或某些 NFS 进程未在客户端或服务器上运行，或者共享未在服务器上正确导出，这些都可能是这个错误的原因。此外，当这个错误发生在先前挂载的 NFS 共享上时，它会它令人不快。因为这意味着配置部分是正确的，因为是以前挂载的。在这种情况下，可以尝试下面的命令：

确保 NFS 服务在客户端和服务器上运行良好。

```
#  service nfs status
rpc.svcgssd is stopped
rpc.mountd (pid 11993) is running...
nfsd (pid 12009 12008 12007 12006 12005 12004 12003 12002) is running...
rpc.rquotad (pid 11988) is running...
```

>通过 CloudDesktopOnline.com 上的[ Windows 7 云桌面][2]在任意位置的任何设备上保持与你最喜爱的 Windows 程序的连接。从 [Apps4Rent.com][3] 获得有专家支持的 Office 365 和免费迁移。

如果 NFS 共享目前挂载在客户端上，则强制卸载它并尝试在 NFS 客户端上重新挂载它。通过 `df` 命令检查它是否正确挂载，并更改其中的目录。

```
# umount -f /mydata_nfs
 
# mount -t nfs server:/nfs_share /mydata_nfs
 
#df -k
------ output clipped -----
server:/nfs_share 41943040  892928  41050112   3% /mydata_nfs
```

在上面的挂载命令中，服务器可以是 NFS 服务器的 IP 或[主机名][4]。

如果你在强制取消挂载时遇到像下面错误：

```
# umount -f /mydata_nfs
umount2: Device or resource busy
umount: /mydata_nfs: device is busy
umount2: Device or resource busy
umount: /mydata_nfs: device is busy
```
然后你可以用 `lsof` 命令来检查哪个进程或用户正在使用该挂载点，如下所示：

```
# lsof |grep mydata_nfs
lsof: WARNING: can't stat() nfs file system /mydata_nfs
      Output information may be incomplete.
su         3327      root  cwd   unknown                                                   /mydata_nfs/dir (stat: Stale NFS file handle)
bash       3484      grid  cwd   unknown                                                   /mydata_nfs/MYDB (stat: Stale NFS file handle)
bash      20092  oracle11  cwd   unknown                                                   /mydata_nfs/MPRP (stat: Stale NFS file handle)
bash      25040  oracle11  cwd   unknown                                                   /mydata_nfs/MUYR (stat: Stale NFS file handle)
```

如果你在上面的示例中看到共有 4 个 PID 正在使用该挂载点上的某些文件。尝试杀死它们以释放挂载点。完成后，你将能够正确卸载它。

有时 mount 命令会有相同的错误。接着使用下面的命令在客户端重启 NFS 服务后挂载。

```
#  service nfs restart
Shutting down NFS daemon:                                  [  OK  ]
Shutting down NFS mountd:                                  [  OK  ]
Shutting down NFS quotas:                                  [  OK  ]
Shutting down RPC idmapd:                                  [  OK  ]
Starting NFS services:                                     [  OK  ]
Starting NFS quotas:                                       [  OK  ]
Starting NFS mountd:                                       [  OK  ]
Starting NFS daemon:                                       [  OK  ]
```

另请阅读：[如何在 HPUX 中逐步重启 NFS][5]

即使这没有解决你的问题，最后一步是在 NFS 服务器上重启服务。警告！这将断开从该 NFS 服务器导出的所有 NFS 共享。所有客户端将看到挂载点断开。这一步将 99％ 解决你的问题。如果没有，请务必检查[ NFS 配置][6]，提供你修改的配置并发布你启动时看到的错误。

上面文章中的输出来自 RHEL6.3 服务器。请将你的评论发送给我们。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/troubleshooting/resolve-mount-nfs-stale-file-handle-error/

作者：[KernelTalks][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:http://kerneltalks.com/wp-content/uploads/2017/01/nfs_error-2-150x150.png
[2]:https://www.clouddesktoponline.com/
[3]:http://www.apps4rent.com
[4]:https://kerneltalks.com/linux/all-you-need-to-know-about-hostname-in-linux/
[5]:http://kerneltalks.com/hpux/restart-nfs-in-hpux/
[6]:http://kerneltalks.com/linux/nfs-configuration-linux-hpux/
