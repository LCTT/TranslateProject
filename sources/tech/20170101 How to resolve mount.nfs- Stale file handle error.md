How to resolve mount.nfs: Stale file handle error
======
Learn how to resolve mount.nfs: Stale file handle error on Linux platform. This is Network File System error can be resolved from client or server end.

 _![][1]_

When you are using Network File System in your environment, you must have seen`mount.nfs: Stale file handle` error at times. This error denotes that NFS share is unable to mount since something has changed since last good known configuration.

Whenever you reboot NFS server or some of the NFS processes are not running on client or server or share is not properly exported at server; these can be reasons for this error. Moreover its irritating when this error comes to previously mounted NFS share. Because this means configuration part is correct since it was previously mounted. In such case once can try following commands:

Make sure NFS service are running good on client and server.

```
#  service nfs status
rpc.svcgssd is stopped
rpc.mountd (pid 11993) is running...
nfsd (pid 12009 12008 12007 12006 12005 12004 12003 12002) is running...
rpc.rquotad (pid 11988) is running...
```

> Stay connected to your favorite windows applications from anywhere on any device with [ windows 7 cloud desktop ][2] from CloudDesktopOnline.com. Get Office 365 with expert support and free migration from [ Apps4Rent.com ][3].

If NFS share currently mounted on client, then un-mount it forcefully and try to remount it on NFS client. Check if its properly mounted by `df` command and changing directory inside it.

```
# umount -f /mydata_nfs
 
# mount -t nfs server:/nfs_share /mydata_nfs
 
#df -k
------ output clipped -----
server:/nfs_share 41943040  892928  41050112   3% /mydata_nfs
```

In above mount command, server can be IP or [hostname ][4]of NFS server.

If you are getting error while forcefully un-mounting like below :

```
# umount -f /mydata_nfs
umount2: Device or resource busy
umount: /mydata_nfs: device is busy
umount2: Device or resource busy
umount: /mydata_nfs: device is busy
```
Then you can check which all processes or users are using that mount point with `lsof` command like below:

```
# lsof |grep mydata_nfs
lsof: WARNING: can't stat() nfs file system /mydata_nfs
      Output information may be incomplete.
su         3327      root  cwd   unknown                                                   /mydata_nfs/dir (stat: Stale NFS file handle)
bash       3484      grid  cwd   unknown                                                   /mydata_nfs/MYDB (stat: Stale NFS file handle)
bash      20092  oracle11  cwd   unknown                                                   /mydata_nfs/MPRP (stat: Stale NFS file handle)
bash      25040  oracle11  cwd   unknown                                                   /mydata_nfs/MUYR (stat: Stale NFS file handle)
```

If you see in above example that 4 PID are using some files on said mount point. Try killing them off to free mount point. Once done you will be able to un-mount it properly.

Sometimes it still give same error for mount command. Then try mounting after restarting NFS service at client using below command.

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

Also read : [How to restart NFS step by step in HPUX][5]

Even if this didnt solve your issue, final step is to restart services at NFS server. Caution! This will disconnect all NFS shares which are exported from NFS server. All clients will see mount point disconnect. This step is where 99% you will get your issue resolved. If not then [NFS configurations][6] must be checked, provided you have changed configuration and post that you started seeing this error.

Outputs in above post are from RHEL6.3 server. Drop us your comments related to this post.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/troubleshooting/resolve-mount-nfs-stale-file-handle-error/

作者：[KernelTalks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:http://kerneltalks.com/wp-content/uploads/2017/01/nfs_error-2-150x150.png
[2]:https://www.clouddesktoponline.com/
[3]:http://www.apps4rent.com
[4]:https://kerneltalks.com/linux/all-you-need-to-know-about-hostname-in-linux/
[5]:http://kerneltalks.com/hpux/restart-nfs-in-hpux/
[6]:http://kerneltalks.com/linux/nfs-configuration-linux-hpux/
