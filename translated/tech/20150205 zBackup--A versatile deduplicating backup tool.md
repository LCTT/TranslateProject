zBackup——一个通用的重复数据备份工具
================================================================================
zbackup是一个基于rsync思想的全局重复数据备份工具。给它传入一个大的tar文件后，它会存储该文件的重复区域（仅进行一次），然后对结果进行压缩，并根据参数确定是否对其加密。传入另一个tar文件后，它会从之前的已备份文件中复用重复的数据。只有新的改动会被保存，并且只要文件变动不是很大，需要的存储空间非常少。任何时候之前的已备份文件都可以被完整地读出来。

### zBackup特性 ###

- 使用并行的LZMA或者LZO压缩算法压缩已备份数据
- 使用内置的AES加密算法加密已备份数据
- 可以删除旧的已备份数据
- 使用一个64位滚动哈希，保持软碰撞数量为0
- 已备份数据由不可更改的文件组成。任何现有文件都没有被更改过
- 使用C++语言编写，并且只有适量的依赖库
- 可以在生产环境安全使用
- 可以在不同备份库中交换数据而无需重新压缩

### 在ubuntu中安装zBackup ###

打开终端并运行如下命令：

    sudo apt-get install zbackup

### 使用zBackup ###

`zbackup init`命令会初始化一个备份库，用来存放待备份的数据。

    zbackup init [--non-encrypted] [--password-file ~/.my_backup_password ] /my/backup/repo

`zbackup backup`命令备份一个由`tar c`创建的tar文件到刚才使用`zbackup init`初始化的备份库。（译注：实际使用时类似这样，tar c files | zbackup ...）

    zbackup [--password-file ~/.my_backup_password ] [--threads number_of_threads ] backup /my/backup/repo/backups/backup-`date ‘+%Y-%m-%d'`

`zbackup restore`命令从备份库中恢复一个已备份文件到tar文件中。

    zbackup [--password-file ~/.my_backup_password ] [--cache-size cache_size_in_mb ] restore /my/backup/repo/backups/backup-`date ‘+%Y-%m-%d'` > /my/precious/backup-restored.tar

### 可用选项 ###

- -non-encrypted -- 不加密备份库。
- --password-file ~/.my_backup_password -- 使用位于~/.my_backup_password的口令文件来加密备份库和待备份文件，以及解密已备份文件。
- --threads number_of_threads -- 限制并行LZMA压缩的线程数到number_of_threads。建议在32位的系统平台使用。
- --cache-size cache_size_in_mb -- 使用cache_size_in_mb中的缓存大小来加速恢复文件的过程。

### zBackup相关文件 ###

~/.my_backup_password 用来加密备份库和待备份文件，以及解密已备份文件。更多细节见zbackup。

/my/backup/repo 存放备份库的目录。

/my/precious/restored-tar 用来恢复已备份文件的tar文件。

/my/backup/repo/backups/backup-`date ‘+%Y-%m-%d'` 指定的之前已备份文件的文件名。

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/zbackup-a-versatile-deduplicating-backup-tool.html

作者：[ruchi][a]
译者：[goreliu](https://github.com/goreliu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
