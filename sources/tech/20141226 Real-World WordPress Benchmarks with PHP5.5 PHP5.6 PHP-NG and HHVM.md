Real-World WordPress Benchmarks with PHP5.5 PHP5.6 PHP-NG and HHVM
================================================================================
**TL;DR In a local, Vagrant-based environment HHVM lost, probably due to a bug; it’s still investigated with the help of the HHVM guys! However on a DigitalOcean 4GB box it beat even the latest build of PHP-NG!**

![](https://kinsta.com/wp-content/uploads/2014/07/phphhvm.jpg)

**Update: Please take a look at the results at the end of the article! They reflect the power of HHVM better (after the JIT warmup), for some reason we cannot get these results with all setups though.

The tests below were done in a Vagrant/VVV environment, the results are still interesting, it might be a bug in HHVM or the Vagrant setup that’s preventing it from kicking into high speed, we’re investigating the issue with the HHVM guys.**

If you remember we [wrote an article a good couple of months ago][1] when WordPress 3.9 came out that HHVM was fully supported beginning with that release, and we were all happy about it. The initial benchmark results showed HHVM to be far more superior than the Zend engine that’s currently powering all PHP builds. Then the problems came:

- HHVM can only be run as one user, which means less security (in shared environments)
- HHVM does not restart itself after it crashes, and unfortunately it still does that quite often
- HHVM uses a lot of memory right from the start, and yes, it per-request memory usage will be lower once you scale compared to PHP-FPM

Obviously you have to compromise based on your (or rather your sites’) needs but is it worth it? How much of a performance gain can you expect by switching to HHVM?

At Kinsta we really like to test everything new and generally optimize everything to provide the best environment to our clients. Today I finally took the time to set up a test environment and do some tests to compare a couple of different builds with a fresh out of the box WordPress install and one that has a bunch of content added plus runs WooCommerce! To measure the script running time I simply added the

    <?php timer_stop(1); ?>

line before the /body tag of the footer.php’s.

**Note:
Previously this section contained benchmarks made with Vagrant/Virtualbox/Ubuntu14.04 however for some reason HHVM was really underperforming, probably due to a bug or a limitation of the virtualized environment. We feel that these test results do not reflect the reality so we re-run the tests on a cloud server and consider these valid.**

Here are the exact setup details of the environment:

- DigitalOcean 4GB droplet (2 CPU cores, 4GB RAM)
- Ubuntu 14.04, MariaDB10
- Test site: Munditia Theme with Demo Content Imported, WooCommerce 2.1.12 & WordPress 3.9.1
- PHP 5.5.9, PHP 5.5.15, PHP 5.6.0 RC2, PHP-NG (20140718-git-6cc487d) and HHVM 3.2.0 (version says PHP 5.6.99-hhvm)

**Without further ado, these were my test results, the lower the better, values in seconds:**

### DigitalOcean 4GB droplet ###

Seconds, 10 runs, lower the better.

这里有一个canvas的数据，发布的时候需要截一个图

It looks like that PHP-NG achieves its peak performance after the first run! HHVM needs a couple more reloads, but their performance seems to be almost equal! I can’t wait until PHP-NG is merged into the master! :)

Hits in a minute, higher the better.

这里有一个canvas的数据，发布的时候需要截一个图

**PHP 5.5.15 OpCache Disabled**

- Transactions: **236 hits**
- Availability: 100.00 %
- Elapsed time: 59.03 secs
- Data transferred: 2.40 MB
- Response time: 2.47 secs
- Transaction rate: 4.00 trans/sec
- Throughput: 0.04 MB/sec
- Concurrency: 9.87
- Successful transactions: 236
- Failed transactions: 0
- Longest transaction: 4.44
- Shortest transaction: 0.48

**PHP 5.5.15 OpCache Enabled**

- Transactions: **441 hits**
- Availability: 100.00 %
- Elapsed time: 59.55 secs
- Data transferred: 4.48 MB
- Response time: 1.34 secs
- Transaction rate: 7.41 trans/sec
- Throughput: 0.08 MB/sec
- Concurrency: 9.91
- Successful transactions: 441
- Failed transactions: 0
- Longest transaction: 2.19
- Shortest transaction: 0.64

**PHP 5.6 RC2 OpCache Disabled**

- Transactions: **207 hits**
- Availability: 100.00 %
- Elapsed time: 59.87 secs
- Data transferred: 2.10 MB
- Response time: 2.80 secs
- Transaction rate: 3.46 trans/sec
- Throughput: 0.04 MB/sec
- Concurrency: 9.68
- Successful transactions: 207
- Failed transactions: 0
- Longest transaction: 3.65
- Shortest transaction: 0.54

**PHP 5.6 RC2 OpCache Enabled**

- Transactions: **412 hits**
- Availability: 100.00 %
- Elapsed time: 59.03 secs
- Data transferred: 4.18 MB
- Response time: 1.42 secs
- Transaction rate: 6.98 trans/sec
- Throughput: 0.07 MB/sec
- Concurrency: 9.88
- Successful transactions: 412
- Failed transactions: 0
- Longest transaction: 1.93
- Shortest transaction: 0.34

**HHVM 3.2.0 (version says PHP 5.6.99-hhvm)**

- Transactions: **955 hits**
- Availability: 100.00 %
- Elapsed time: 59.69 secs
- Data transferred: 9.18 MB
- Response time: 0.62 secs
- Transaction rate: 16.00 trans/sec
- Throughput: 0.15 MB/sec
- Concurrency: 9.94
- Successful transactions: 955
- Failed transactions: 0
- Longest transaction: 0.85
- Shortest transaction: 0.23

**PHP-NG OpCache Enabled (built: Jul 29 2014 )**

- Transactions: **849 hits**
- Availability: 100.00 %
- Elapsed time: 59.88 secs
- Data transferred: 8.63 MB
- Response time: 0.70 secs
- Transaction rate: 14.18 trans/sec
- Throughput: 0.14 MB/sec
- Concurrency: 9.94
- Successful transactions: 849
- Failed transactions: 0
- Longest transaction: 1.06
- Shortest transaction: 0.13

----------

**Note:
These are the previous test results, they’re faulty. I left them here for future reference but please do NOT consider these values a truthful representation!**

Here are the exact setup details of the environment:

- Apple MacBook Pro mid-2011 (Intel Core i7 2 GHz 4 cores, 4GB RAM, 256GB Ocz Vertex 3 MI)
- Current Varying Vagrant Vagrants build with Ubuntu 14.04, nginx 1.6.x, mysql 5.5.x, etc.
- Test site 1: WordPress 3.9.1 bare minimum
- Test site 2: Munditia Theme with Demo Content Imported, WooCommerce 2.1.12 & WordPress 3.9.1
- PHP 5.5.9, PHP 5.5.15, PHP 5.6.0 RC2, PHP-NG (20140718-git-6cc487d) and HHVM 3.2.0 (version says PHP 5.6.99-hhvm)

**Default Theme, Default WordPress 3.9.1, PHP 5.5.9-1ubuntu4.3 (with OpCache 7.0.3)**

**Faulty results. Please read the note above!** Seconds, 10 runs, lower the better.

这里有一个canvas的数据，发布的时候需要截一个图

### Munditia Theme with Demo Content Imported, WooCommerce 2.1.12 & WordPress 3.9.1 (OpCache Disabled) ###

**Faulty results. Please read the note above**! Seconds, 10 runs, lower the better.

这里有一个canvas的数据，发布的时候需要截一个图

### Munditia Theme with Demo Content Imported, WooCommerce 2.1.12 & WordPress 3.9.1 (OpCache Enabled) ###

**Faulty results. Please read the note above!** Seconds, 10 runs, lower the better.

这里有一个canvas的数据，发布的时候需要截一个图

**Siege
parameters: 10 concurrent users for 1 minute: siege -c 10 -b -t 1M**

**Faulty results. Please read the note above!** Hits in a minute, higher the better.

这里有一个canvas的数据，发布的时候需要截一个图

**PHP5.5 OpCache Disabled (PHP 5.5.15-1+deb.sury.org~trusty+1)Faulty results. Please read the note above!**

- Transactions: 35 hits
- Availability: 100.00 %
- Elapsed time: 59.04 secs
- Data transferred: 2.03 MB
- Response time: 14.56 secs
- Transaction rate: 0.59 trans/sec
- Throughput: 0.03 MB/sec
- Concurrency: 8.63
- Successful transactions: 35
- Failed transactions: 0
- Longest transaction: 18.73
- Shortest transaction: 5.80

**HHVM 3.2.0 (version says PHP 5.6.99-hhvm)Faulty results. Please read the note above!**

- Transactions: 44 hits
- Availability: 100.00 %
- Elapsed time: 59.53 secs
- Data transferred: 0.42 MB
- Response time: 12.00 secs
- Transaction rate: 0.74 trans/sec
- Throughput: 0.01 MB/sec
- Concurrency: 8.87
- Successful transactions: 44
- Failed transactions: 0
- Longest transaction: 13.40
- Shortest transaction: 2.65

**PHP5.5 OpCache Enabled (PHP 5.5.15-1+deb.sury.org~trusty+1 with OpCache 7.0.4-dev)Faulty results. Please read the note above!**

- Transactions: 100 hits
- Availability: 100.00 %
- Elapsed time: 59.30 secs
- Data transferred: 5.81 MB
- Response time: 5.69 secs
- Transaction rate: 1.69 trans/sec
- Throughput: 0.10 MB/sec
- Concurrency: 9.60
- Successful transactions: 100
- Failed transactions: 0
- Longest transaction: 7.25
- Shortest transaction: 2.82

**PHP5.6 OpCache Enabled (PHP 5.6.0RC2 with OpCache 7.0.4-dev)Faulty results. Please read the note above!**

- Transactions: 103 hits
- Availability: 100.00 %
- Elapsed time: 59.99 secs
- Data transferred: 5.98 MB
- Response time: 5.51 secs
- Transaction rate: 1.72 trans/sec
- Throughput: 0.10 MB/sec
- Concurrency: 9.45
- Successful transactions: 103
- Failed transactions: 0
- Longest transaction: 6.87
- Shortest transaction: 2.52

**PHP-NG OpCache Enabled (20140718-git-6cc487d)Faulty results. Please read the note above!**

- Transactions: 124 hits
- Availability: 100.00 %
- Elapsed time: 59.32 secs
- Data transferred: 7.19 MB
- Response time: 4.58 secs
- Transaction rate: 2.09 trans/sec
- Throughput: 0.12 MB/sec
- Concurrency: 9.57
- Successful transactions: 124
- Failed transactions: 0
- Longest transaction: 6.86
- Shortest transaction: 2.24

**What do you think about this test? Did I miss something? What would you like to see in the next benchmarking article? Please leave your comment below!**

--------------------------------------------------------------------------------

via: https://kinsta.com/blog/real-world-wordpress-benchmarks-with-php5-5-php5-6-php-ng-and-hhvm/

作者：[Mark Gavalda][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://kinsta.com/blog/author/kinstadmin/
[1]:https://kinsta.com/blog/hhvm-and-wordpress/