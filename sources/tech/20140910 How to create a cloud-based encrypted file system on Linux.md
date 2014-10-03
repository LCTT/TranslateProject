如何在 Linux 系统中创建一个云端的加密文件系统
================================================================================
[Amazon S3][1] 和 [Google Cloud Storage][2] 之类的商业云存储服务以能承受的价格提供了高可用性、可扩展、无限容量的对象存储服务。为了加速这些云产品的广泛采用，这些提供商为他们的产品基于明确的 API 和 SDK 培养了一个良好的开发者生态系统。而基于云的文件系统便是这些活跃的开发者社区中的典型产品，已经有了好几个开源的实现。

[S3QL][3] 便是最流行的开源云端文件系统之一。它是一个基于 FUSE 的文件系统，提供了好几个商业或开源的云存储后端，比如 Amazon S3、Google Cloud Storage、Rackspace CloudFiles，还有 OpenStack。作为一个功能完整的文件系统，S3QL 拥有不少强大的功能：最大 2T 的文件大小、压缩、UNIX 属性、加密、基于写入时复制的快照、不可变树、重复数据删除，以及软、硬链接支持等等。写入 S3QL 文件系统任何数据都将首先被本地压缩、加密，之后才会传输到云后端。当你试图从 S3QL 文件系统中取出内容的时候，如果它们不在本地缓存中，相应的对象会从云端下载回来，然后再即时地解密、解压缩。

需要明确的是，S3QL 的确也有它的限制。比如，你不能把同一个 S3FS 文件系统在几个不同的电脑上同时挂载，只能有一台电脑同时访问它。另外，ACL（访问控制列表）也并没有被支持。

在这篇教程中，我将会描述“如何基于 Amazon S3 用 S3QL 配置一个加密文件系统”。作为一个使用范例，我还会说明如何在挂载的 S3QL 文件系统上运行 rsync 备份工具。

### 准备工作 ###

本教程首先需要你创建一个 [Amazon AWS 帐号][4]（注册是免费的，但是需要一张有效的信用卡）。

然后 [创建一个 AWS access key][4]（access key ID 和 secret access key），S3QL 使用这些信息来访问你的 AWS 帐号。

之后通过 AWS 管理面板访问 AWS S3，并为 S3QL 创建一个新的空 bucket。

![](https://farm4.staticflickr.com/3841/15170673701_7d0660e11f_c.jpg)

为最佳性能考虑，请选择一个地理上距离你最近的区域。

![](https://farm4.staticflickr.com/3902/15150663516_4928d757fc_b.jpg)

### 在 Linux 上安装 S3QL ###

在大多数 Linux 发行版中都有预先编译好的 S3QL 软件包。

#### 对于 Debian、Ubuntu 或 Linux Mint：####

    $ sudo apt-get install s3ql

#### 对于 Fedora：####

    $ sudo yum install s3ql 

对于 Arch Linux，使用 [AUR][6]。

### Configure S3QL for the First Time ###

Create authinfo2 file in ~/.s3ql directory, which is a default S3QL configuration file. This file contains information about a required AWS access key, S3 bucket name and encryption passphrase. The encryption passphrase is used to encrypt the randomly-generated master encryption key. This master key is then used to encrypt actual S3QL file system data.

    $ mkdir ~/.s3ql
    $ vi ~/.s3ql/authinfo2 

----------

    [s3]
    storage-url: s3://[bucket-name]
    backend-login: [your-access-key-id]
    backend-password: [your-secret-access-key]
    fs-passphrase: [your-encryption-passphrase]

The AWS S3 bucket that you specify should be created via AWS management console beforehand.

Make the authinfo2 file readable to you only for security.

    $ chmod 600 ~/.s3ql/authinfo2 

### Create an S3QL File System ###

You are now ready to create an S3QL file system on top of AWS S3.

Use mkfs.s3ql command to create a new S3QL file system. The bucket name you supply with the command should be matched with the one in authinfo2 file. The "--ssl" option forces you to use SSL to connect to backend storage servers. By default, the mkfs.s3ql command will enable compression and encryption in the S3QL file system.

    $ mkfs.s3ql s3://[bucket-name] --ssl 

You will be asked to enter an encryption passphrase. Type the same passphrase as you defined in ~/.s3ql/autoinfo2 (under "fs-passphrase").

If a new file system was created successfully, you will see the following output.

![](https://farm6.staticflickr.com/5582/14988587230_e182ca3abd_z.jpg)

### Mount an S3QL File System ###

Once you created an S3QL file system, the next step is to mount it.

First, create a local mount point, and then use mount.s3ql command to mount an S3QL file system.

    $ mkdir ~/mnt_s3ql
    $ mount.s3ql s3://[bucket-name] ~/mnt_s3ql 

You do not need privileged access to mount an S3QL file system. Just make sure that you have write access to the local mount point.

Optionally, you can specify a compression algorithm to use (e.g., lzma, bzip2, zlib) with "--compress" option. Without it, lzma algorithm is used by default. Note that when you specify a custom compression algorithm, it will apply to newly created data objects, not existing ones.

    $ mount.s3ql --compress bzip2 s3://[bucket-name] ~/mnt_s3ql 

For performance reason, an S3QL file system maintains a local file cache, which stores recently accessed (partial or full) files. You can customize the file cache size using "--cachesize" and "--max-cache-entries" options.

To allow other users than you to access a mounted S3QL file system, use "--allow-other" option.

If you want to export a mounted S3QL file system to other machines over NFS, use "--nfs" option.

After running mount.s3ql, check if the S3QL file system is successfully mounted:

    $ df ~/mnt_s3ql
    $ mount | grep s3ql 

![](https://farm4.staticflickr.com/3863/15174861482_27a842da3e_z.jpg)

### Unmount an S3QL File System ###

To unmount an S3QL file system (with potentially uncommitted data) safely, use umount.s3ql command. It will wait until all data (including the one in local file system cache) has been successfully transferred and written to backend servers. Depending on the amount of write-pending data, this process can take some time.

    $ umount.s3ql ~/mnt_s3ql 

View S3QL File System Statistics and Repair an S3QL File System

To view S3QL file system statistics, you can use s3qlstat command, which shows information such as total data/metadata size, de-duplication and compression ratio.

    $ s3qlstat ~/mnt_s3ql 

![](https://farm6.staticflickr.com/5559/15184926905_4815e5827a_z.jpg)

You can check and repair an S3QL file system with fsck.s3ql command. Similar to fsck command, the file system being checked needs to be unmounted first.

    $ fsck.s3ql s3://[bucket-name] 

### S3QL Use Case: Rsync Backup ###

Let me conclude this tutorial with one popular use case of S3QL: local file system backup. For this, I recommend using rsync incremental backup tool especially because S3QL comes with a rsync wrapper script (/usr/lib/s3ql/pcp.py). This script allows you to recursively copy a source tree to a S3QL destination using multiple rsync processes.

    $ /usr/lib/s3ql/pcp.py -h 

![](https://farm4.staticflickr.com/3873/14998096829_d3a64749d0_z.jpg)

The following command will back up everything in ~/Documents to an S3QL file system via four concurrent rsync connections.

     $ /usr/lib/s3ql/pcp.py -a --quiet --processes=4 ~/Documents ~/mnt_s3ql 

The files will first be copied to the local file cache, and then gradually flushed to the backend servers over time in the background.

For more information about S3QL such as automatic mounting, snapshotting, immuntable trees, I strongly recommend checking out the [official user's guide][7]. Let me know what you think of S3QL. Share your experience with any other tools.




--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/create-cloud-based-encrypted-file-system-linux.html

作者：[Dan Nanni][a]
译者：[felixonmars](https://github.com/felixonmars)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://aws.amazon.com/s3
[2]:http://code.google.com/apis/storage/
[3]:https://bitbucket.org/nikratio/s3ql/
[4]:http://aws.amazon.com/
[5]:http://ask.xmodulo.com/create-amazon-aws-access-key.html
[6]:https://aur.archlinux.org/packages/s3ql/
[7]:http://www.rath.org/s3ql-docs/
