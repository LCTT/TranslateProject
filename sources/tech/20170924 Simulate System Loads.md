translating by lujun9972
Simulate System Loads
======
Sysadmins often need to discover how the performance of an application is affected when the system is under certain types of load. This means that an artificial load must be re-created. It is, of course, possible to install dedicated tools to do this but this option isn't always desirable or possible.

Every Linux distribution comes with all the tools needed to create load. They are not as configurable as dedicated tools but they will always be present and you already know how to use them.

### CPU

The following command will generate a CPU load by compressing a stream of random data and then sending it to `/dev/null`:
```
cat /dev/urandom | gzip -9 > /dev/null

```

If you require a greater load or have a multi-core system simply keep compressing and decompressing the data as many times as you need e.g.:
```
cat /dev/urandom | gzip -9 | gzip -d | gzip -9 | gzip -d > /dev/null

```

Use `CTRL+C` to end the process.

### RAM

The following process will reduce the amount of free RAM. It does this by creating a file system in RAM and then writing files to it. You can use up as much RAM as you need to by simply writing more files.

First, create a mount point then mount a `ramfs` filesystem there:
```
mkdir z
mount -t ramfs ramfs z/

```

Then, use `dd` to create a file under that directory. Here a 128MB file is created:
```
dd if=/dev/zero of=z/file bs=1M count=128

```

The size of the file can be set by changing the following operands:

  * **bs=** Block Size. This can be set to any number followed **B** for bytes, **K** for kilobytes, **M** for megabytes or **G** for gigabytes.
  * **count=** The number of blocks to write.



### Disk

We will create disk I/O by firstly creating a file, and then use a for loop to repeatedly copy it.

This command uses `dd` to generate a 1GB file of zeros:
```
dd if=/dev/zero of=loadfile bs=1M count=1024

```

The following command starts a for loop that runs 10 times. Each time it runs it will copy `loadfile` over `loadfile1`:
```
for i in {1..10}; do cp loadfile loadfile1; done

```

If you want it to run for a longer or shorter time change the second number in `{1..10}`.

If you prefer the process to run forever until you kill it with `CTRL+C` use the following command:
```
while true; do cp loadfile loadfile1; done

```
--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/create-system-load/

作者：[Elliot Cooper][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
