free – A Standard Command to Check Memory Usage Statistics (Free & Used) in Linux
============================================================

We all knows, most of the Servers (Including world Top Super Computers are running in Linux) are running in Linux platform on IT infrastructure because Linux is more flexible compare with other operating systems. Other operating systems required reboot for small small changes & patch updates but Linux systems doesn’t required reboot except critical patch updates.

One of the big challenge for Linux administrator to maintain the system up and running without any downtime. To managing memory utilization on Linux is another challenging task for administrator, `free` is one of the standard & widely used command, to analyze Memory Statistics (Free & Used Memory) in Linux. Today we are going to cover free command with useful options.

Suggested Articles :

*   [smem – Linux Memory Reporting/Statistics Tool][1]
*   [vmstat – A Standard Nifty Tool to Report Virtual Memory Statistics][2]

#### What’s Free Command

free displays the total amount of `free` and `used` physical and `swap` memory in the system, as well as the `buffers` and `caches`used by the kernel. The information is gathered by parsing /proc/meminfo.

#### Display System Memory

Run the `free` command without any option to display system memory, including total amount of `free`, `used`, `buffers`, `caches`& `swap`.

```
# free
             total       used       free     shared    buffers     cached
Mem:      32869744   25434276    7435468          0     412032   23361716
-/+ buffers/cache:    1660528   31209216
Swap:      4095992          0    4095992
```

The output has three columns.

*   Column-1 : Indicates Total memory, used memory, free memory, shared memory (mostly used by tmpfs (Shmem in /proc/meminfo)), memory used for buffers, cached contents memory size.

*   Total : Total installed memory (MemTotal in /proc/meminfo)
*   Used : Used memory (calculated as total – free + buffers + cache)
*   Free : Unused memory (MemFree in /proc/meminfo)
*   Shared : Memory used (mostly) by tmpfs (Shmem in /proc/meminfo)
*   Buffers : Memory used by kernel buffers (Buffers in /proc/meminfo)
*   Cached : Memory used by the page cache and slabs (Cached and SReclaimable in /proc/meminfo)

*   Column-2 : Indicates buffers/cache used & free.
*   Column-3 : Indicates Total swap memory (SwapTotal in /proc/meminfo), free (SwapFree in /proc/meminfo)) & used swap memory.

#### Display Memory in MB

By default `free` command output display memory in `KB - Kilobytes` which is bit confusion to most of the administrator (Many of us convert the output to MB, to understand the size, when the system has more memory). To avoid the confusion, add `-m` option with free command to get instant output with `MB - Megabytes`.

```
# free -m
             total       used       free     shared    buffers     cached
Mem:         32099      24838       7261          0        402      22814
-/+ buffers/cache:       1621      30477
Swap:         3999          0       3999
```

How to check, how much free ram I really have From the above output based on `used` & `free` column, you may think, you have very low free memory, when it’s really just `10%`, How ?

Total Actual Available RAM = (Total RAM – column2 used)
Total RAM = 32099
Actual used RAM = -1621

Total actual available RAM = 30477

If you have latest distribution, you have a option to see the actual free memory called `available`, for older distribution, look at the `free` column in the row that says `-/+ buffers/cache`.

How to check, how much RAM actually used From the above output based on `used` & `free` column, you may think, you have utilized morethan `95%` memory.

Total Actual used RAM = column1 used – (column1 buffers + column1 cached)
Used RAM = 24838
Used Buffers = 402
Used Cache = 22814

Total Actual used RAM = 1621

#### Display Memory in GB

By default `free` command output display memory in `KB - Kilobytes` which is bit confusion to most of the administrator, so we can use the above option to get the output in `MB - Megabytes` but when the server has huge memory (morethan 100 GB or 200 GB), the above option also get confuse, so in this situation, we can add `-g` option with free command to get instant output with `GB - Gigabytes`.

```
# free -g
             total       used       free     shared    buffers     cached
Mem:            31         24          7          0          0         22
-/+ buffers/cache:          1         29
Swap:            3          0          3
```

#### Display Total Memory Line

By default `free` command output comes with three columns (Memory, Buffers/Cache & Swap). To display consolidated total in separate line (Total (Mem+Swap), Used (Mem+(Used – Buffers/Cache)+Swap) & Free (Mem+(Used – Buffers/Cache)+Swap), add `-t` option with free command.

```
# free -t
             total       used       free     shared    buffers     cached
Mem:      32869744   25434276    7435468          0     412032   23361716
-/+ buffers/cache:    1660528   31209216
Swap:      4095992          0    4095992
Total: 36965736 27094804 42740676
```

#### Run free with delay for better statistic

By default free command display single statistics output which is not enough to troubleshoot further so, add delay (delay is the delay between updates in seconds) which capture the activity periodically. If you want to run free with 2 second delay, just use the below command (If you want more delay you can change as per your wish).

The following command will run every 2 seconds until you exit.

```
# free -s 2
             total       used       free     shared    buffers     cached
Mem:      32849392   25935844    6913548        188     182424   24632796
-/+ buffers/cache:    1120624   31728768
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25935288    6914104        188     182424   24632796
-/+ buffers/cache:    1120068   31729324
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25934968    6914424        188     182424   24632796
-/+ buffers/cache:    1119748   31729644
Swap:     20970492          0   20970492
```

#### Run free with delay & counts

Alternatively you can run free command with delay and specific counts, once it reach the given counts then exit automatically.

The following command will run every 2 seconds with 5 counts then exit automatically.

```
# free -s 2 -c 5
             total       used       free     shared    buffers     cached
Mem:      32849392   25931052    6918340        188     182424   24632796
-/+ buffers/cache:    1115832   31733560
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931192    6918200        188     182424   24632796
-/+ buffers/cache:    1115972   31733420
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931348    6918044        188     182424   24632796
-/+ buffers/cache:    1116128   31733264
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931316    6918076        188     182424   24632796
-/+ buffers/cache:    1116096   31733296
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931308    6918084        188     182424   24632796
-/+ buffers/cache:    1116088   31733304
Swap:     20970492          0   20970492
```

#### Human readable format

To print the human readable output, add `h` option with `free` command, which will print more detailed output compare with other options like m & g.

```
# free -h
              total        used        free      shared  buff/cache   available
Mem:           2.0G        1.6G        138M         20M        188M        161M
Swap:          2.0G        1.8G        249M
```

#### Split Buffers & Cached memory output

By default `Buffers/Cached` memory output comes together. To split Buffers & Cached memory output, add `-w` option with free command. (This option is available on version 3.3.12).

Note : See the above output, `Buffers/Cached` comes together.

```
# free -wh
              total        used        free      shared     buffers       cache   available
Mem:           2.0G        1.6G        137M         20M        8.1M        183M        163M
Swap:          2.0G        1.8G        249M
```

#### Show Low and High Memory Statistics

By default `free` command output comes without Low and High Memory Statistics. To display Show Low and High Memory Statistics, add `-l` option with free command.

```
# free -l
             total       used       free     shared    buffers     cached
Mem:      32849392   25931336    6918056        188     182424   24632808
Low:      32849392   25931336    6918056
High:            0          0          0
-/+ buffers/cache:    1116104   31733288
Swap:     20970492          0   20970492
```

#### Read more about free

If you want to know more option which is available for free, simply navigate to man page.

```
# free --help
or
# man free
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/smem-linux-memory-usage-statistics-reporting-tool/
[2]:http://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/
[3]:http://www.2daygeek.com/author/magesh/
