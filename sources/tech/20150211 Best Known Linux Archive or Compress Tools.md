Best Known Linux Archive / Compress Tools
================================================================================
Sending and receiving large files and pictures over the internet is a headache many times. Compression and decompression tools are meant to address this problem. Lets take a quick overview of a few open source tools that are available to make our jobs simpler.

Tar
gzip, gunzip
bzip2, bunzip2
7-Zip

### Tar ###

Tar is derived from 'Tape archiver' as this was initially used for archiving and storing files on magnetic tapes. It is a GNU software. It can compress a set of files (archives), extract them and manipulate those which already exist. It is useful for storing, backing up and transporting files.  Tar can preserve file and directory structure while creating the archives. Files archived using tar have '.tar' extensions.

Basic Usage

#### a) Creating an archive (c / --create) ####

    tar --create --verbose --file=archive.tar file1 file2 file3

OR

    tar cvf archive.tar file1 file2 file3

![tar cvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-cvf.png)

creating an archive

#### b) Listing an archive ( t / --list) ####

    tar --list archive.tar

![tar tvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-tvf.png)

Listing the contents

#### c) Extracting an archive (x / --extract) ####

    tar xvf archive.tar

    tar xvf archive.tar --wildcards '*.c'  -  extracts files with only *.c extension from the archive.

![tar xvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-xvf.png)

Extracting files

![tar xvf --wildcards](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-wildcard.png)

Extract only the required files

#### d) Updating an archive ( u / --update) ####

    tar uvf archive.tar newfile.c   -    updates the archive by adding newfile.c  if its version is newer than the existing one.

![tar uvf](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-uvf.png)

Updating an archive

#### e) Delete from an archive (--delete) ####

    tar--delete -f archive.tar file1.c   -     deletes 'file1.c' from the tar ball 'archive.tar'

![tar --delete](http://blog.linoxide.com/wp-content/uploads/2015/01/tar-delete.png)

Deleting files

Refer to [tar home page][1] for its detailed usage

### Gzip / Gunzip ###

Gzip stands for GNU zip. It is a compression utility that is commonly available in Linux operating system. Compressed files have an extension of '*.gz'

**Basic Usage**

#### a) Compressing files ####

    gzip file(s)

Each file gets compressed individually

![gzip](http://blog.linoxide.com/wp-content/uploads/2015/01/gzip.png)

Compress files

This generally deletes the original files after compression. We can keep the original file by using the -c option.

    gzip -c file > file.gz

![gzip-c](http://blog.linoxide.com/wp-content/uploads/2015/01/gzip-c.png)

Keep original files after compressing

We can also compress a group of files into a single file

    cat file1 file2 file3 | gzip > archieve.gz

![gz group](http://blog.linoxide.com/wp-content/uploads/2015/01/gz-group.png)

Compressing a group of files

#### b) Checking compression ratio ####

Compression ratio of the compressed file(s) can be verified using the '-l' option.

    gzip -l archieve.gz

![gzip -l](http://blog.linoxide.com/wp-content/uploads/2015/01/gzip-l.png)

Checking compression ratio

#### c) Unzipping files ####

Gunzip is used for unzipping files. Here also, original files are deleted after decompression. Use the -c option to retain original files.

    gunzip -c archieve.gz

![gunzip -c](http://blog.linoxide.com/wp-content/uploads/2015/01/gunzip-c.png)

Unzipping files

Using '-d' option with gzip command has the same effect of gunzip on compressed files.

More details can be obtained from [gzip home page][2]

### Bzip2 / Bunzip2 ###

[Bzip2][3] is also a compression tool like gzip but can compress files to smaller sizes than that is possible with other traditional tools. But the drawback is that it is slower than gzip.

**Basic Usage**

#### a) File Compression ####

Generally, no options are used for compression and the files to be compressed are passed as arguments. Each file gets compressed individually and compressed files will have the extension 'bz2'.

    bzip2 file1 file2 file3

![bzip2](http://blog.linoxide.com/wp-content/uploads/2015/01/bzip2.png)

File Compression

Use '-k' option to keep the original files after compression / decompression.

![bzip2 -k](http://blog.linoxide.com/wp-content/uploads/2015/01/bzip2-k.png)

Retaining original files after compression

'-d' option is used for forced decompression.

![bzip2 -d](http://blog.linoxide.com/wp-content/uploads/2015/01/bzip2-d.png)

Delete files using -d option

#### b) Decompression ####

    bunzip2 filename

![bunzip2](http://blog.linoxide.com/wp-content/uploads/2015/01/bunzip2.png)

Decompressing files

bunzip2 can decompress files with extensions bz2, bz, tbz2 and tbz. Files with tbz2 and tbz will end up with '.tar' extension after decompression.

    bzip2 -dc performs the function of decompressing files to the stdout

### 7-zip ###

[7-zip][4] is another open source file archiver. It uses 7z format which is a new compression format and provides high-compression ratio. Hence, it is considered to be better than the previously mentioned compression tools. It is available under Linux as p7zip package. The package includes three binaries – 7z, 7za and 7zr. Refer to the [p7zip wiki][5] for differences between these binaries. In this article, we will be using 7zr to explain the usage. Archived files will have '.7z' extension.

**Basic usage**

#### a) Creating an archive ####

    7zr a archive-name.7z file-name(s) / directory-name(s)

![7zr a](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-a.png)

Creating an archive

#### b) Listing an archive ####

    7zr l archive-name.7z

![7zr l](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-l.png)

Listing an archive

#### c) Extracting an archive ####

    7zr e archive-name.7z

![7zr e](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-e.png)

Extracting an archive

#### d) Updating an archive ####

    7zr u archive-name.7z new-file

![7zr u](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-u.png)

Updating an archive

#### e) Deleting files from an archive ####

    7zr d archive-name.7z file-to-be-deleted

![7zr d](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-d.png)

Deleting files

![7zr l](http://blog.linoxide.com/wp-content/uploads/2015/01/7zr-d-l.png)

Verifying file deletion

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/linux-compress-decompress-tools/

作者：[B N Poornima][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:http://www.gnu.org/software/tar/
[2]:http://www.gzip.org/
[3]:http://www.bzip.org/
[4]:http://www.7-zip.org/
[5]:https://wiki.archlinux.org/index.php/p7zip