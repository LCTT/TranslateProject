Translating by sanfusu

[Data-Oriented Hash Table][1]
============================================================

In recent years, there’s been a lot of discussion and interest in “data-oriented design”—a programming style that emphasizes thinking about how your data is laid out in memory, how you access it and how many cache misses it’s going to incur. With memory reads taking orders of magnitude longer for cache misses than hits, the number of misses is often the key metric to optimize. It’s not just about performance-sensitive code—data structures designed without sufficient attention to memory effects may be a big contributor to the general slowness and bloatiness of software.

The central tenet of cache-efficient data structures is to keep things flat and linear. For example, under most circumstances, to store a sequence of items you should prefer a flat array over a linked list—every pointer you have to chase to find your data adds a likely cache miss, while flat arrays can be prefetched and enable the memory system to operate at peak efficiency.

This is pretty obvious if you know a little about how the memory hierarchy works—but it’s still a good idea to test things sometimes, even if they’re “obvious”! [Baptiste Wicht tested `std::vector` vs `std::list` vs `std::deque`][4] (the latter of which is commonly implemented as a chunked array, i.e. an array of arrays) a couple of years ago. The results are mostly in line with what you’d expect, but there are a few counterintuitive findings. For instance, inserting or removing values in the middle of the sequence—something lists are supposed to be good at—is actually faster with an array, if the elements are a POD type and no bigger than 64 bytes (i.e. one cache line) or so! It turns out to actually be faster to shift around the array elements on insertion/removal than to first traverse the list to find the right position and then patch a few pointers to insert/remove one element. That’s because of the many cache misses in the list traversal, compared to relatively few for the array shift. (For larger element sizes, non-POD types, or if you already have a pointer into the list, the list wins, as you’d expect.)

Thanks to data like Baptiste’s, we know a good deal about how memory layout affects sequence containers. But what about associative containers, i.e. hash tables? There have been some expert recommendations: [Chandler Carruth tells us to use open addressing with local probing][5] so that we don’t have to chase pointers, and [Mike Acton suggests segregating keys from values][6] in memory so that we get more keys per cache line, improving locality when we have to look at multiple keys. These ideas make good sense, but again, it’s a good idea to test things, and I couldn’t find any data. So I had to collect some of my own!

### [][7]The Tests

I tested four different quick-and-dirty hash table implementations, as well as `std::unordered_map`. All five used the same hash function, Bob Jenkins’ [SpookyHash][8] with 64-bit hash values. (I didn’t test different hash functions, as that wasn’t the point here; I’m also not looking at total memory consumption in my analysis.) The implementations are identified by short codes in the results tables:

*   **UM**: `std::unordered_map`. In both VS2012 and libstdc++-v3 (used by both gcc and clang), UM is implemented as a linked list containing all the elements, and an array of buckets that store iterators into the list. In VS2012, it’s a doubly-linked list and each bucket stores both begin and end iterators; in libstdc++, it’s a singly-linked list and each bucket stores just a begin iterator. In both cases, the list nodes are individually allocated and freed. Max load factor is 1.
*   **Ch**: separate chaining—each bucket points to a singly-linked list of element nodes. The element nodes are stored in a flat array pool, to avoid allocating each node individually. Unused nodes are kept on a free list. Max load factor is 1.
*   **OL**: open addressing with linear probing—each bucket stores a 62-bit hash, a 2-bit state (empty, filled, or removed), key, and value. Max load factor is 2/3.
*   **DO1**: “data-oriented 1”—like OL, but the hashes and states are segregated from the keys and values, in two separate flat arrays.
*   **DO2**: “data-oriented 2”—like OL, but the hashes/states, keys, and values are segregated in three separate flat arrays.

All my implementations, as well as VS2012’s UM, use power-of-2 sizes by default, growing by 2x upon exceeding their max load factor. In libstdc++, UM uses prime-number sizes by default and grows to the next prime upon exceeding its max load factor. However, I don’t think these details are very important for performance. The prime-number thing is a hedge against poor hash functions that don’t have enough entropy in their lower bits, but we’re using a good hash function.

The OL, DO1 and DO2 implementations will collectively be referred to as OA (open addressing), since we’ll find later that their performance characteristics are often pretty similar.

For each of these implementations, I timed several different operations, at element counts from 100K to 1M and for payload sizes (i.e. total key+value size) from 8 to 4K bytes. For my purposes, keys and values were always POD types and keys were always 8 bytes (except for the 8-byte payload, in which key and value were 4 bytes each). I kept the keys to a consistent size because my purpose here was to test memory effects, not hash function performance. Each test was repeated 5 times and the minimum timing was taken.

The operations tested were:

*   **Fill**: insert a randomly shuffled sequence of unique keys into the table.
*   **Presized fill**: like Fill, but first reserve enough memory for all the keys we’ll insert, to prevent rehashing and reallocing during the fill process.
*   **Lookup**: perform 100K lookups of random keys, all of which are in the table.
*   **Failed lookup**: perform 100K lookups of random keys, none of which are in the table.
*   **Remove**: remove a randomly chosen half of the elements from a table.
*   **Destruct**: destroy a table and free its memory.

You can [download my test code here][9]. It builds for Windows or Linux, in 64-bit only. There are some flags near the top of `main()` that you can toggle to turn on or off different tests—with all of them on, it will likely take an hour or two to run. The results I gathered are also included, in an Excel spreadsheet in that archive. (Beware that the Windows and Linux results are run on different CPUs, so timings aren’t directly comparable.) The code also runs unit tests to verify that all the hash table implementations are behaving correctly.

Incidentally, I also tried two additional implementations: separate chaining with the first node stored in the bucket instead of the pool, and open addressing with quadratic probing. Neither of these was good enough to include in the final data, but the code for them is still there.

### [][10]The Results

There’s a ton of data here. In this section I’ll discuss the results in some detail, but if your eyes are glazing over in this part, feel free to skip down to the conclusions in the next section.

### [][11]Windows

Here are the graphed results of all the tests, compiled with Visual Studio 2012, and run on Windows 8.1 on a Core i7-4710HQ machine. (Click to zoom.)

[
 ![Results for VS 2012, Windows 8.1, Core i7-4710HQ](http://reedbeta.com/blog/data-oriented-hash-table/results-vs2012.png "Results for VS 2012, Windows 8.1, Core i7-4710HQ")
][12]

From left to right are different payload sizes, from top to bottom are the various operations, and each graph plots time in milliseconds versus hash table element count for each of the five implementations. (Note that not all the Y-axes have the same scale!) I’ll summarize the main trends for each operation.

**Fill**: Among my hash tables, chaining is a bit better than any of the OA variants, with the gap widening at larger payloads and table sizes. I guess this is because chaining only has to pull an element off the free list and stick it on the front of its bucket, while OA may have to search a few buckets to find an empty one. The OA variants perform very similarly to each other, but DO1 appears to have a slight advantage.

All of my hash tables beat UM by quite a bit at small payloads, where UM pays a heavy price for doing a memory allocation on every insert. But they’re about equal at 128 bytes, and UM wins by quite a bit at large payloads: there, all of my implementations are hamstrung by the need to resize their element pool and spend a lot of time moving the large elements into the new pool, while UM never needs to move elements once they’re allocated. Notice the extreme “steppy” look of the graphs for my implementations at large payloads, which confirms that the problem comes when resizing. In contrast, UM is quite linear—it only has to resize its bucket array, which is cheap enough not to make much of a bump.

**Presized fill**: Generally similar to Fill, but the graphs are more linear, not steppy (since there’s no rehashing), and there’s less difference between all the implementations. UM is still slightly faster than chaining at large payloads, but only slightly—again confirming that the problem with Fill was the resizing. Chaining is still consistently faster than the OA variants, but DO1 has a slight advantage over the other OAs.

**Lookup**: All the implementations are closely clustered, with UM and DO2 the front-runners, except at the smallest payload, where it seems like DO1 and OL may be faster. It’s impressive how well UM is doing here, actually; it’s holding its own against the data-oriented variants despite needing to traverse a linked list.

Incidentally, it’s interesting to see that the lookup time weakly depends on table size. Hash table lookup is expected constant-time, so from the asymptotic view it shouldn’t depend on table size at all. But that’s ignoring cache effects! When we do 100K lookups on a 10K-entry table, for instance, we’ll get a speedup because most of the table will be in L3 after the first 10K–20K lookups.

**Failed lookup**: There’s a bit more spread here than the successful lookups. DO1 and DO2 are the front-runners, with UM not far behind, and OL a good deal worse than the rest. My guess is this is probably a case of OL having longer searches on average, especially in the case of a failed lookup; with the hash values spaced out in memory between keys and values, that hurts. DO1 and DO2 have equally-long searches, but they have all the hash values packed together in memory, and that turns things around.

**Remove**: DO2 is the clear winner, with DO1 not far behind, chaining further behind, and UM in a distant last place due to the need to free memory on every remove; the gap widens at larger payloads. The remove operation is the only one that doesn’t touch the value data, only the hashes and keys, which explains why DO1 and DO2 are differentiated from each other here but pretty much equal in all the other tests. (If your value type was non-POD and needed to run a destructor, that difference would presumably disappear.)

**Destruct**: Chaining is the fastest except at the smallest payload, where it’s about equal to the OA variants. All the OA variants are essentially equal. Note that for my hash tables, all they’re doing on destruction is freeing a handful of memory buffers, but [on Windows, freeing memory has a cost proportional to the amount allocated][13]. (And it’s a significant cost—an allocation of ~1 GB is taking ~100 ms to free!)

UM is the slowest to destruct—by an order of magnitude at small payloads, and only slightly slower at large payloads. The need to free each individual element instead of just freeing a couple of arrays really hurts here.

### [][14]Linux

I also ran tests with gcc 4.8 and clang 3.5, on Linux Mint 17.1 on a Core i5-4570S machine. The gcc and clang results were very similar, so I’ll only show the gcc ones; the full set of results are in the code download archive, linked above. (Click to zoom.)

[
 ![Results for g++ 4.8, Linux Mint 17.1, Core i5-4570S](http://reedbeta.com/blog/data-oriented-hash-table/results-g++4.8.png "Results for g++ 4.8, Linux Mint 17.1, Core i5-4570S")
][15]

Most of the results are quite similar to those in Windows, so I’ll just highlight a few interesting differences.

**Lookup**: Here, DO1 is the front-runner, where DO2 was a bit faster on Windows. Also, UM and chaining are way behind all the other implementations, which is actually what I expected to see in Windows as well, given that they have to do a lot of pointer chasing while the OA variants just stride linearly through memory. It’s not clear to me why the Windows and Linux results are so different here. UM is also a good deal slower than chaining, especially at large payloads, which is odd; I’d expect the two of them to be about equal.

**Failed lookup**: Again, UM is way behind all the others, even slower than OL. Again, it’s puzzling to me why this is so much slower than chaining, and why the results differ so much between Linux and Windows.

**Destruct**: For my implementations, the destruct cost was too small to measure at small payloads; at large payloads, it grows quite linearly with table size—perhaps proportional to the number of virtual memory pages touched, rather than the number allocated? It’s also orders of magnitude faster than the destruct cost on Windows. However, this isn’t anything to do with hash tables, really; we’re seeing the behavior of the respective OSes’ and runtimes’ memory systems here. It seems that Linux frees large blocks memory a lot faster than Windows (or it hides the cost better, perhaps deferring work to process exit, or pushing things off to another thread or process).

UM with its per-element frees is now orders of magnitude slower than all the others, across all payload sizes. In fact, I cut it from the graphs because it was screwing up the Y-axis scale for all the others.

### [][16]Conclusions

Well, after staring at all that data and the conflicting results for all the different cases, what can we conclude? I’d love to be able to tell you unequivocally that one of these hash table variants beats out the others, but of course it’s not that simple. Still, there is some wisdom we can take away.

First, in many cases it’s  _easy_  to do better than `std::unordered_map`. All of the implementations I built for these tests (and they’re not sophisticated; it only took me a couple hours to write all of them) either matched or improved upon `unordered_map`, except for insertion performance at large payload sizes (over 128 bytes), where `unordered_map`‘s separately-allocated per-node storage becomes advantageous. (Though I didn’t test it, I also expect `unordered_map` to win with non-POD payloads that are expensive to move.) The moral here is that if you care about performance at all, don’t assume the data structures in your standard library are highly optimized. They may be optimized for C++ standard conformance, not performance. :P

Second, you could do a lot worse than to just use DO1 (open addressing, linear probing, with the hashes/states segregated from keys/values in separate flat arrays) whenever you have small, inexpensive payloads. It’s not the fastest for insertion, but it’s not bad either (still way better than `unordered_map`), and it’s very fast for lookup, removal, and destruction. What do you know—“data-oriented design” works!

Note that my test code for these hash tables is far from production-ready—they only support POD types, don’t have copy constructors and such, don’t check for duplicate keys, etc. I’ll probably build some more realistic hash tables for my utility library soon, though. To cover the bases, I think I’ll want two variants: one based on DO1, for small, cheap-to-move payloads, and another that uses chaining and avoids ever reallocating and moving elements (like `unordered_map`) for large or expensive-to-move payloads. That should give me the best of both worlds.

In the meantime, I hope this has been illuminating. And remember, if Chandler Carruth and Mike Acton give you advice about data structures, listen to them. 😉

--------------------------------------------------------------------------------


作者简介：

I’m a graphics programmer, currently freelancing in Seattle. Previously I worked at NVIDIA on the DevTech software team, and at Sucker Punch Productions developing rendering technology for the Infamous series of games for PS3 and PS4.

I’ve been interested in graphics since about 2002 and have worked on a variety of assignments, including fog, atmospheric haze, volumetric lighting, water, visual effects, particle systems, skin and hair shading, postprocessing, specular models, linear-space rendering, and GPU performance measurement and optimization.

You can read about what I’m up to on my blog. In addition to graphics, I’m interested in theoretical physics, and in programming language design.

You can contact me at nathaniel dot reed at gmail dot com, or follow me on Twitter (@Reedbeta) or Google+. I can also often be found answering questions at Computer Graphics StackExchange.

--------------

via: http://reedbeta.com/blog/data-oriented-hash-table/

作者：[Nathan Reed][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://reedbeta.com/about/
[1]:http://reedbeta.com/blog/data-oriented-hash-table/
[2]:http://reedbeta.com/blog/category/coding/
[3]:http://reedbeta.com/blog/data-oriented-hash-table/#comments
[4]:http://baptiste-wicht.com/posts/2012/12/cpp-benchmark-vector-list-deque.html
[5]:https://www.youtube.com/watch?v=fHNmRkzxHWs
[6]:https://www.youtube.com/watch?v=rX0ItVEVjHc
[7]:http://reedbeta.com/blog/data-oriented-hash-table/#the-tests
[8]:http://burtleburtle.net/bob/hash/spooky.html
[9]:http://reedbeta.com/blog/data-oriented-hash-table/hash-table-tests.zip
[10]:http://reedbeta.com/blog/data-oriented-hash-table/#the-results
[11]:http://reedbeta.com/blog/data-oriented-hash-table/#windows
[12]:http://reedbeta.com/blog/data-oriented-hash-table/results-vs2012.png
[13]:https://randomascii.wordpress.com/2014/12/10/hidden-costs-of-memory-allocation/
[14]:http://reedbeta.com/blog/data-oriented-hash-table/#linux
[15]:http://reedbeta.com/blog/data-oriented-hash-table/results-g++4.8.png
[16]:http://reedbeta.com/blog/data-oriented-hash-table/#conclusions
