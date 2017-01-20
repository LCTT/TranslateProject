How to Speed up Odoo
============================================================

 ![speed up odoo](https://www.rosehosting.com/blog/wp-content/uploads/2016/12/speed-up-odoo.jpg) 

Odoo is the most popular ERP (Enterprise Resource Planning) software, written in Python and uses PostgreSQL as database back-end. The Odoo community edition is a free and open source software which includes project management, manufacturing, accounting, billing and sales management, warehouse management, human resources and more. There are about 30 core modules and more than 3000 community modules. Odoo is a complex software, and deploying a number of modules, having huge data inside the database etc. could induce a slowdown. The two major Odoo bottlenecks are disk access and database query time.

In order to increase the performance of an Odoo instance, make sure to use:

*   a fast disk drive for storage (preferably SSD)
*   a [Linux VPS with lots of RAM][1].
*   activate multiprocessing mode in Odoo.
*   configure and optimize the PostgreSQL service properly.

### Get an SSD VPS with more RAM

Like we mentioned previously, the random disk access speed is one of the major Odoo bottlenecks, so make sure to host Odoo on an [SSD based VPS][2]. Always install Odoo on a VPS with more RAM because Odoo is known as resource intensive application, and load the entire Odoo instance and its database into RAM if possible. Solid state disk drives excel especially in random access and they can achieve random access IOPS hundreds of times higher than conventional mechanical har disk drives because SSDs do not have any moving parts. No matter how much optimizations and configurations you do on your Odoo, if the server is not fast or powered by SSD, your Odoo will be slow. Getting the right hosting for your Odoo is the most important factor of your Odoo’s performance.

Did we mention that Odoo is a resource-hungry app? It seems so. But fear not, RoseHosting will provide you the ultimate solution – a performance-tailored [Odoo SSD VPS][3] optimized to match your most demanding needs. Get an SSD VPS from us and find out what record-breaking Odoo speed really means.

Other Odoo optimizations include:

### Enable the Multiprocessing option in your Odoo configuration

To do so, locate the openerp-server binary file:

```
#updatedb
#locate openerp-server

/usr/bin/openerp-server
```

Run the following command:

```
#/usr/bin/openerp-server --help
```

The output of this command should be like this:

```
Usage: openerp-server [options]

Options:
  --version             show program's version number and exit

  (...)

  Multiprocessing options:
    --workers=WORKERS   Specify the number of workers, 0 disable prefork mode.
    --limit-memory-soft=LIMIT_MEMORY_SOFT
                        Maximum allowed virtual memory per worker, when
                        reached the worker be reset after the current request
                        (default 671088640 aka 640MB).
    --limit-memory-hard=LIMIT_MEMORY_HARD
                        Maximum allowed virtual memory per worker, when
                        reached, any memory allocation will fail (default
                        805306368 aka 768MB).
    --limit-time-cpu=LIMIT_TIME_CPU
                        Maximum allowed CPU time per request (default 60).
    --limit-time-real=LIMIT_TIME_REAL
                        Maximum allowed Real time per request (default 120).
    --limit-request=LIMIT_REQUEST
                        Maximum number of request to be processed per worker
                        (default 8192).
```

The number of workers should be equal to number of CPU cores allocated to the VPS, or if you want to leave some CPU cores exclusively for the PostgreSQL database, cron jobs or other applications installed on the same VPS where the Odoo instance is installed and running, set the number of workers to a lower value than CPU cores available on the VPS to avoid resources exhaustion.
The limit-memory-soft and limit-memory-hard are self-explanatory, and you should leave them to the default value or modify them depending on the RAM available on the actual VPS.
For example, if you have a VPS with 8 CPU cores and 16 GB of RAM, the number of workers should be 17 (CPU cores * 2 + 1), total limit-memory-soft value will be 640 x 17 = 10880 MB , and total limit-memory-hard 768MB x 17 = 13056 MB, so Odoo will use maximum 12.75 GB of RAM.

For example, on a VPS with 16 GB of RAM and 8 CPU cores, edit the Odoo configuration file (e.g. /etc/odoo-server.conf), and add the following lines to it:

```
vi /etc/odoo-server.conf
```

```
workers = 17

limit_memory_hard = 805306368

limit_memory_soft = 671088640

limit_request = 8192

limit_time_cpu = 60

limit_time_real = 120

max_cron_threads = 2
```

Do not forget to restart Odoo for the changes to take effect.

### Properly configure and optimize PostgreSQL

As for the PostgreSQL optimization, it is a good idea to update to the latest PostgreSQL version whenever a new version comes out. There are two settings in PostgreSQL configuration file (pg_hba.conf) which should be modified: shared_buffers and effective_cache_size. Set shared_buffers to 20% of the available memory, and effective_cache_size to 50% of the available memory.

For example, if Odoo is installed on an SSD VPS with 16 GB of RAM, use the following settings to pg_hba.conf file:

```
vi /var/lib/postgresql/data/pg_hba.conf
```

```
shared_buffers = 3072MB
effective_cache_size = 8192MB
```

Restart the PostgreSQL service for the changes to take effect.

Also, do not forget to run ‘[VACUUM][4]‘ manually periodically. ‘Vacuuming’ cleans up stale or temporary data, but please keep in mind that it is heavy on both CPU and disk usage.


--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-speed-up-odoo/

作者：[rosehosting.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/
[1]:https://www.rosehosting.com/linux-vps-hosting.html
[2]:https://www.rosehosting.com/linux-vps-hosting.html
[3]:https://www.rosehosting.com/odoo-hosting.html
[4]:https://wiki.postgresql.org/wiki/Introduction_to_VACUUM,_ANALYZE,_EXPLAIN,_and_COUNT
