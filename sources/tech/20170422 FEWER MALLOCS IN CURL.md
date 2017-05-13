tranlated by mudongliang

FEWER MALLOCS IN CURL
===========================================================

![](https://daniel.haxx.se/blog/wp-content/uploads/2016/09/IMG_20160916_122707-1038x576.jpg)

Today I landed yet [another small change][4] to libcurl internals that further reduces the number of small mallocs we do. This time the generic linked list functions got converted to become malloc-less (the way linked list functions should behave, really).

### Instrument mallocs

I started out my quest a few weeks ago by instrumenting our memory allocations. This is easy since we have our own memory debug and logging system in curl since many years. Using a debug build of curl I run this script in my build dir:

```
#!/bin/sh
export CURL_MEMDEBUG=$HOME/tmp/curlmem.log
./src/curl http://localhost
./tests/memanalyze.pl -v $HOME/tmp/curlmem.log
```

For curl 7.53.1, this counted about 115 memory allocations. Is that many or a few?

The memory log is very basic. To give you an idea what it looks like, here’s an example snippet:

```
MEM getinfo.c:70 free((nil))
MEM getinfo.c:73 free((nil))
MEM url.c:294 free((nil))
MEM url.c:297 strdup(0x559e7150d616) (24) = 0x559e73760f98
MEM url.c:294 free((nil))
MEM url.c:297 strdup(0x559e7150d62e) (22) = 0x559e73760fc8
MEM multi.c:302 calloc(1,480) = 0x559e73760ff8
MEM hash.c:75 malloc(224) = 0x559e737611f8
MEM hash.c:75 malloc(29152) = 0x559e737a2bc8
MEM hash.c:75 malloc(3104) = 0x559e737a9dc8
```

### Check the log

I then studied the log closer and I realized that there were many small memory allocations done from the same code lines. We clearly had some rather silly code patterns where we would allocate a struct and then add that struct to a linked list or a hash and that code would then subsequently add yet another small struct and similar – and then often do that in a loop.  (I say  _we_  here to avoid blaming anyone, but of course I myself am to blame for most of this…)

Those two allocations would always happen in pairs and they would be freed at the same time. I decided to address those. Doing very small (less than say 32 bytes) allocations is also wasteful just due to the very large amount of data in proportion that will be used just to keep track of that tiny little memory area (within the malloc system). Not to mention fragmentation of the heap.

So, fixing the hash code and the linked list code to not use mallocs were immediate and easy ways to remove over 20% of the mallocs for a plain and simple ‘curl http://localhost’ transfer.

At this point I sorted all allocations based on size and checked all the smallest ones. One that stood out was one we made in  _curl_multi_wait(),_  a function that is called over and over in a typical curl transfer main loop. I converted it over to [use the stack][5] for most typical use cases. Avoiding mallocs in very repeatedly called functions is a good thing.

### Recount

Today, the script from above shows that the same “curl localhost” command is down to 80 allocations from the 115 curl 7.53.1 used. Without sacrificing anything really. An easy 26% improvement. Not bad at all!

But okay, since I modified curl_multi_wait() I wanted to also see how it actually improves things for a slightly more advanced transfer. I took the [multi-double.c][6] example code, added the call to initiate the memory logging, made it uses curl_multi_wait() and had it download these two URLs in parallel:

```
http://www.example.com/
http://localhost/512M
```

The second one being just 512 megabytes of zeroes and the first being a 600 bytes something public html page. Here’s the [count-malloc.c code][7].

First, I brought out 7.53.1 and built the example against that and had the memanalyze script check it:

```
Mallocs: 33901
Reallocs: 5
Callocs: 24
Strdups: 31
Wcsdups: 0
Frees: 33956
Allocations: 33961
Maximum allocated: 160385
```

Okay, so it used 160KB of memory totally and it did over 33,900 allocations. But ok, it downloaded over 512 megabytes of data so it makes one malloc per 15KB of data. Good or bad?

Back to git master, the version we call 7.54.1-DEV right now – since we’re not quite sure which version number it’ll become when we release the next release. It can become 7.54.1 or 7.55.0, it has not been determined yet. But I digress, I ran the same modified multi-double.c example again, ran memanalyze on the memory log again and it now reported…

```
Mallocs: 69
Reallocs: 5
Callocs: 24
Strdups: 31
Wcsdups: 0
Frees: 124
Allocations: 129
Maximum allocated: 153247
```

I had to look twice. Did I do something wrong? I better run it again just to double-check. The results are the same no matter how many times I run it…

### 33,961 vs 129

curl_multi_wait() is called a lot of times in a typical transfer, and it had at least one of the memory allocations we normally did during a transfer so removing that single tiny allocation had a pretty dramatic impact on the counter. A normal transfer also moves things in and out of linked lists and hashes a bit, but they too are mostly malloc-less now. Simply put: the remaining allocations are not done in the transfer loop so they’re way less important.

The old curl did 263 times the number of allocations the current does for this example. Or the other way around: the new one does 0.37% the number of allocations the old one did…

As an added bonus, the new one also allocates less memory in total as it decreased that amount by 7KB (4.3%).

### Are mallocs important?

In the day and age with many gigabytes of RAM and all, does a few mallocs in a transfer really make a notable difference for mere mortals? What is the impact of 33,832 extra mallocs done for 512MB of data?

To measure what impact these changes have, I decided to compare HTTP transfers from localhost and see if we can see any speed difference. localhost is fine for this test since there’s no network speed limit, but the faster curl is the faster the download will be. The server side will be equally fast/slow since I’ll use the same set for both tests.

I built curl 7.53.1 and curl 7.54.1-DEV identically and ran this command line:

```
curl http://localhost/80GB -o /dev/null
```

80 gigabytes downloaded as fast as possible written into the void.

The exact numbers I got for this may not be totally interesting, as it will depend on CPU in the machine, which HTTP server that serves the file and optimization level when I build curl etc. But the relative numbers should still be highly relevant. The old code vs the new.

7.54.1-DEV repeatedly performed 30% faster! The 2200MB/sec in my build of the earlier release increased to over 2900 MB/sec with the current version.

The point here is of course not that it easily can transfer HTTP over 20GB/sec using a single core on my machine – since there are very few users who actually do that speedy transfers with curl. The point is rather that curl now uses less CPU per byte transferred, which leaves more CPU over to the rest of the system to perform whatever it needs to do. Or to save battery if the device is a portable one.

On the cost of malloc: The 512MB test I did resulted in 33832 more allocations using the old code. The old code transferred HTTP at a rate of about 2200MB/sec. That equals 145,827 mallocs/second – that are now removed! A 600 MB/sec improvement means that curl managed to transfer 4300 bytes extra for each malloc it didn’t do, each second.

### Was removing these mallocs hard?

Not at all, it was all straight forward. It is however interesting that there’s still room for changes like this in a project this old. I’ve had this idea for some years and I’m glad I finally took the time to make it happen. Thanks to our test suite I could do this level of “drastic” internal change with a fairly high degree of confidence that I don’t introduce too terrible regressions. Thanks to our APIs being good at hiding internals, this change could be done completely without changing anything for old or new applications.

(Yeah I haven’t shipped the entire change in a release yet so there’s of course a risk that I’ll have to regret my “this was easy” statement…)

### Caveats on the numbers

There have been 213 commits in the curl git repo from 7.53.1 till today. There’s a chance one or more other commits than just the pure alloc changes have made a performance impact, even if I can’t think of any.

### More?

Are there more “low hanging fruits” to pick here in the similar vein?

Perhaps. We don’t do a lot of performance measurements or comparisons so who knows, we might do more silly things that we could stop doing and do even better. One thing I’ve always wanted to do, but never got around to, was to add daily “monitoring” of memory/mallocs used and how fast curl performs in order to better track when we unknowingly regress in these areas.

--------------------------------------------------------------------------------

via: https://daniel.haxx.se/blog/2017/04/22/fewer-mallocs-in-curl/

作者：[DANIEL STENBERG ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://daniel.haxx.se/blog/author/daniel/
[1]:https://daniel.haxx.se/blog/author/daniel/
[2]:https://daniel.haxx.se/blog/2017/04/22/fewer-mallocs-in-curl/
[3]:https://daniel.haxx.se/blog/2017/04/22/fewer-mallocs-in-curl/#comments
[4]:https://github.com/curl/curl/commit/cbae73e1dd95946597ea74ccb580c30f78e3fa73
[5]:https://github.com/curl/curl/commit/5f1163517e1597339d
[6]:https://github.com/curl/curl/commit/5f1163517e1597339d
[7]:https://gist.github.com/bagder/dc4a42cb561e791e470362da7ef731d3
