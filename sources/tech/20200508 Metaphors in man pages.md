[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Metaphors in man pages)
[#]: via: (https://jvns.ca/blog/2020/05/08/metaphors-in-man-pages/)
[#]: author: (Julia Evans https://jvns.ca/)

Metaphors in man pages
======

This morning I was watching a [great talk by Maggie Appleton][1] about metaphors. In the talk, she explains the difference between a “figurative metaphor” and a “cognitive metaphor”, and references this super interesting book called [Metaphors We Live By][2] which I immediately got and started reading.

Here’s an example from “Metaphors We Live By” of a bunch of metaphors we use for ideas:

  * ideas as **food**: “_raw_ facts”, “_half-baked_ ideas”, “_swallow_ that claim”, “_spoon-feed_ our students”, “_meaty_ part of the paper”, “that idea has been _fermenting_ for years”
  * ideas as **people**: “the theory of relativity _gave birth_ to an enormous number of ideas”, “whose _brainchild_ was that”, “those ideas _died off_ in the middle ages”, “cognitive psychology is in its _infancy_“
  * ideas as **products**: “we’ve _generated_ a lot of ideas this week”, “it needs to be _refined_”, “his _intellectual productivity_ has decreased in recent years”
  * ideas as **commodities**: “he won’t _buy_ that”, “that’s a _worthless_ idea”, “she has _valuable_ ideas”
  * ideas as **resources**: “he _ran out_ of ideas”, “let’s _pool_ our ideas”, “that idea will _go a long way_“
  * ideas as **cutting instruments**: “that’s an _incisive_ idea”, “that _cuts right to the heart_ of the matter”, “he’s _sharp_“
  * ideas as **fashions**: “that idea _went out of style_ years ago”, “marxism is _fashionable_ in western europe”, “berkeley is a center of _avant-garde_ thought”, “semiotics has become quite _chic_“



There’s a [long list of more English metaphors here][3], including many metaphors from the book.

I was surprised that there were so many different metaphors for ideas, and that we’re using metaphors like this all the time in normal language.

### let’s look for metaphors in man pages!

Okay, let’s get to the point of this blog post, which is just a small fun exploration – there aren’t going to be any Deep Programming Insights here.

I went through some of the examples of metaphors in Metaphors To Live By and grepped all the man pages on my computer for them.

### processes as people

This is one of the richer categories – a lot of different man pages seem to agree that processes are people, or at least alive in some way.

  * Hangup detected on controlling terminal or **death** of controlling process (`man 7 signal`)
  * can access the local **agent** through the forwarded connection (`man ssh_config`)
  * If the exit of the process causes a process group to become **orphaned** (`man exit`)
  * If a parent process terminates, then its **“zombie” children** (if any) (`man wait`)
  * … send SIGHUP to the **parent** process of the client (`man tmux`)
  * Otherwise, it **“runs” to catch up** or waits (`man mplayer`)
  * However, Git does not (and it should not) change tags **behind users back** (`man git-tag`)
  * will **listen** forever for a connection (`man nc_openbsd`)
  * this monitor scales badly with the number of files being **observed** (`man fswatch`)
  * If you try to use the **birth** time of a reference file (`man file`)
  * a program **died** due to a fatal signal (`man xargs`)
  * protocol version in the TLS **handshake** (`man curl`)
  * it will **look for** a debug object at… (`man valgrind`)



### data as food

  * “Apparently some digital cameras get **indigestion** if you feed them a CF card) (`man mkfs`)
  * “Send packets using **raw** ethernet frames or IP packets” (`man nmap`)
  * “the above example can be thought of as a maximizing repeat that must **swallow** everything it can” (`man pcrepattern`)
  * “This will allow you to **feed** newline-delimited name=value pairs to the script on’ (`man CGI`)



### data as objects

  * Kill the tmux server and clients and **destroy** all sessions (`tmux`)
  * Each command will produce one **block** of output on standard output. (`man tmux`)
  * “HTTPS guarantees that the password will not **travel** in the clear” (`man Net::SSLeay`)
  * “way to **pack** more than one certificate into an ASN.1 structure” (`man gpgsm`)



### processes as machines/objects

  * “This is **fragile**, subject to change, and thus should not be relied upon” (`man ps`)
  * “This is useful if you have to use **broken** DNS” (`man aria2c`)
  * “This provides good safety measures, but **breaks down** when” (`man git-apply`)
  * “debugfs is a debugging tool. It has **rough edges**!” (`man debugfs`)



### containers

There are LOTS of containers: directories, files, strings, caches, queues, buffers, etc.

  * can exploit that to **get out** of the chroot directory (`man chroot`)
  * “The file **containing** the RFC 4648 Section 5 base64url encoded 128-bit secret key”
  * “Keys must start with a lowercase character and **contain** only hyphens”
  * “just specify an **empty** string” (`man valgrind`)
  * “the cache is **full** and a new page that isn’t cached becomes visible” (`man zathurarc`)
  * “Number of table **overflows**” (`man lnstat`)
  * “likely **overflow** the buffer” (`man g++`)



### resources

There are also lots of kinds of resources: bandwidth, TCP sockets, session IDs, stack space, memory, disk space.

  * This is not recommended and **wastes** bitrate (`man bitrate`)
  * corruption or **lost** data if the system crashes (`man btree`)
  * you don’t want Wget to **consume** the entire available bandwidth (`man wget`)
  * Larger values will be slower and cause x264 to **consume** more memory (`man mplayer`)
  * the resulting file can **consume** some disk space (`man socat`)
  * attempting to **reuse** SSL session-ID (`man curl`)
  * This option controls stack space **reuse** (`man gcc`)
  * Keep the TCP socket open between queries and **reuse** it rather than creating a new TCP socket (`man dig`)
  * the maximum value will easily **eat up** three extra gigabytes or so of memory (`man valgrind`)



### orientation (up, down, above, below)

  * Send the escape character to the **frontend** (`man qemu-system`)
  * Note that TLS 1.3 is only supported by a subset of TLS **backends** (`man curl`)
  * This option may be useful if you are **behind** a router (`man mplayer`)
  * When a file that exists on the **lower** layer is renamed (`man rename`)
  * Several of the socket options should be handled at **lower** levels (`man getsockopt`)
  * while still performing such **higher** level functionality (`man nmap`)
  * This is the same string passed **back to** the front end (`man sudo_plugin`)
  * On Linux, `futimens` is a library function implemented **on top** of the `utimensat` system call (`man futimens`)



### buildings

Limits as rooms/buildings (which have floors, and ceilings, which you hit) are kind of fun:

  * the kernel places a **floor** of 32 pages on this size limit (`man execve`)
  * This specifies a **ceiling** to which the process’s nice value can be raised (`man getrlimit`)
  * If this limit is **hit** the search is aborted (`man gcc`)
  * these libraries are used as the **foundation** for many of the libraries (`man Glib`)



### money / wealth

  * This is a very **expensive** operation for large projects, so use it with caution (`man git-log`)
  * Note that since this operation is very I/O **expensive** (`man git-filter-branch`)
  * provides a **rich** interface for scripts to print disk layouts (`man fdisk`)
  * The number of times the softirq handler function terminated per second because its **budget** was consumed (`man sar.sysstat`)
  * the extra **cost** depends a lot on the application at hand (`man valgrind`)



### more miscellaneous metaphors

here are some more I found that didn’t fit into any of those categories yet.

  * when a thread is created under glibc, just one **big** lock is used for all thread setup (`man valgrind`)
  * will likely **drop** the connection (`man x11vnc`)
  * on all **paths** from the load to the function entry (`man gcc`)
  * it is a very good idea to **wipe** filesystem signatures, data, etc. before (`man cryptsetup`)
  * they will be **embedded** into the document
  * the client should automatically **follow** referrals returned
  * even if there exist mappings that **cover** the whole address space requested (`man mremap`)
  * when a network interface **disappears** (`man systemd-resolve`)



### we’re all using metaphors all the time

I found a lot more metaphors than I expected, and most of them are just part of how I’d normally talk about a program. Interesting!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/05/08/metaphors-in-man-pages/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=K8MF3aDg-bM&feature=youtu.be&t=14991
[2]: https://www.goodreads.com/book/show/34459.Metaphors_We_Live_By
[3]: https://metaphor.icsi.berkeley.edu/pub/en/index.php/Category:Metaphor
