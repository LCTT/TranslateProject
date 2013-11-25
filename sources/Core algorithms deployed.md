Core algorithms deployed
================================================================================
Algorithms that are the main driver behind a system are, in my opinion, easier to find in non-algorithms courses for the same reason theorems with immediate applications are easier to find in applied mathematics rather than pure mathematics courses. It is rare for a practical problem to have the exact structure of the abstract problem in a lecture. To be argumentative, I see no reason why fashionable algorithms course material such as Strassen's multiplication, the AKS primality test, or the Moser-Tardos algorithm is relevant for low-level practical problems of implementing a video database, an optimizing compiler, an operating system, a network congestion control system or any other system. The value of these courses is learning that there are intricate ways to exploit the structure of a problem to find efficient solutions. Advanced algorithms is also where one meets simple algorithms whose analysis is non-trivial. For this reason, I would not dismiss simple randomized algorithms or PageRank.

I think you can choose any large piece of software and find basic and advanced algorithms implemented in it. As a case study, I've done this for the Linux kernel, and shown a few examples from Chromium.

### Basic Data Structures and Algorithms in the Linux kernel ###

Links are to the [source code on github][1].

1.[Linked list][2], [doubly linked list][3], [lock-free linked list][4].

2.[B+ Trees][5] with comments telling you what you can't find in the textbooks.

> A relatively simple B+Tree implementation. I have written it as a learning exercise to understand how B+Trees work. Turned out to be useful as well.
> 
> ...
> 
> A tricks was used that is not commonly found in textbooks. The lowest values are to the right, not to the left. All used slots within a node are on the left, all unused slots contain NUL values. Most operations simply loop once over all slots and terminate on the first NUL.

3.[Priority sorted lists][6] used for [mutexes][7], [drivers][8], etc.

4.[Red-Black trees][9] are [used][10] for scheduling, virtual memory management, to track file descriptors and directory entries,etc.

5.[Interval trees][11]

6.[Radix trees][12], are used for [memory management][13], NFS related lookups and networking related functionality.

> A common use of the radix tree is to store pointers to struct pages;

7.[Priority heap][14], which is literally, a textbook implementation, used in the [control group system][15].

> Simple insertion-only static-sized priority heap containing pointers, based on CLR, chapter 7

8.[Hash functions][16], with a reference to Knuth and to a paper.

> Knuth recommends primes in approximately golden ratio to the maximum integer representable by a machine word for multiplicative hashing. Chuck Lever verified the effectiveness of this technique:
> 
> [http://www.citi.umich.edu/techreports/reports/citi-tr-00-1.pdf][17]
> 
> These primes are chosen to be bit-sparse, that is operations on them can use shifts and additions instead of multiplications for machines where multiplications are slow.

9.Some parts of the code, such as [this driver][18], implement their own hash function.

> hash function using a Rotating Hash algorithm
> 
> Knuth, D. The Art of Computer Programming, Volume 3: Sorting and Searching, Chapter 6.4. Addison Wesley, 1973

10.[Hash tables][19] used to implement [inodes][20], f[ile system integrity checks][21] etc.

11.[Bit arrays][22], which are used for dealing with flags, interrupts, etc. and are featured in Knuth Vol. 4.

12.[Semaphores][23] and [spin locks][24]

13.[Binary search][25] is used for [interrupt handling][26], [register cache lookup][27], etc.

14.[Binary search with B-trees][28]

15.[Depth first search][29] and variant used in [directory configuration][30].

> Performs a modified depth-first walk of the namespace tree, starting (and ending) at the node specified by start_handle. The callback function is called whenever a node that matches the type parameter is found. If the callback function returns a non-zero value, the search is terminated immediately and this value is returned to the caller.

16.[Breadth first search][31] is used to check correctness of locking at runtime.

17.[Merge sort][32] on linked lists is used for [garbage collection][33], [file system management][34], etc.

18.[Bubble sort][35] is amazingly implemented too, in a driver library.

19.[Knuth-Morris-Pratt string matching][36],

> Implements a linear-time string-matching algorithm due to Knuth, Morris, and Pratt [1]. Their algorithm avoids the explicit computation of the transition function DELTA altogether. Its matching time is O(n), for n being length(text), using just an auxiliary function PI[1..m], for m being length(pattern), precomputed from the pattern in time O(m). The array PI allows the transition function DELTA to be computed efficiently "on the fly" as needed. Roughly speaking, for any state "q" = 0,1,...,m and any character "a" in SIGMA, the value PI["q"] contains the information that is independent of "a" and is needed to compute DELTA("q", "a") 2. Since the array PI has only m entries, whereas DELTA has O(m|SIGMA|) entries, we save a factor of |SIGMA| in the preprocessing time by computing PI rather than DELTA.
> 
> [1] Cormen, Leiserson, Rivest, Stein Introdcution to Algorithms, 2nd Edition, MIT Press
> 
> [2] See finite automation theory

20.[Boyer-Moore pattern matching][37] with references and recommendations for when to prefer the alternative.

> Implements Boyer-Moore string matching algorithm:
> 
> [1] A Fast String Searching Algorithm, R.S. Boyer and Moore. Communications of the Association for Computing Machinery, 20(10), 1977, pp. 762-772. [http://www.cs.utexas.edu/users/moore/publications/fstrpos.pdf][38]
> 
> [2] Handbook of Exact String Matching Algorithms, Thierry Lecroq, 2004 [http://www-igm.univ-mlv.fr/~lecroq/string/string.pdf][39]
> 
> Note: Since Boyer-Moore (BM) performs searches for matchings from right to left, it's still possible that a matching could be spread over multiple blocks, in that case this algorithm won't find any coincidence.
> 
> If you're willing to ensure that such thing won't ever happen, use the Knuth-Pratt-Morris (KMP) implementation instead. In conclusion, choose the proper string search algorithm depending on your setting.
> 
> Say you're using the textsearch infrastructure for filtering, NIDS or
> any similar security focused purpose, then go KMP. Otherwise, if you really care about performance, say you're classifying packets to apply Quality of Service (QoS) policies, and you don't mind about possible matchings spread over multiple fragments, then go BM.

### Data Structures and Algorithms in the Chromium Web Browser ###

Links are to the [source code on Google code][40]. I'm only going to list a few. I would suggest using the search feature to look up your favourite algorithm or data structure.

1.[Splay trees][41].

> The tree is also parameterized by an allocation policy (Allocator). The policy is used for allocating lists in the C free store or the zone; see zone.h.

2.[Voronoi diagrams][42] are used in a demo.

3.[Tabbing based on Bresenham's algorithm][43].

There are also such data structures and algorithms in the third-party code included in the Chromium code.

1.[Binary trees][44]
2.[Red-Black trees][45]

> Conclusion of Julian Walker
> 
> Red black trees are interesting beasts. They're believed to be simpler than AVL trees (their direct competitor), and at first glance this seems to be the case because insertion is a breeze. However, when one begins to play with the deletion algorithm, red black trees become very tricky. However, the counterweight to this added complexity is that both insertion and deletion can be implemented using a single pass, top-down algorithm. Such is not the case with AVL trees, where only the insertion algorithm can be written top-down. Deletion from an AVL tree requires a bottom-up algorithm.
> 
> ...
> 
> Red black trees are popular, as most data structures with a whimsical name. For example, in Java and C++, the library map structures are typically implemented with a red black tree. Red black trees are also comparable in speed to AVL trees. While the balance is not quite as good, the work it takes to maintain balance is usually better in a red black tree. There are a few misconceptions floating around, but for the most part the hype about red black trees is accurate.

3.[AVL trees][46]

4.[Rabin-Karp string matching][47] is used for compression.

5.[Compute the suffixes of an automaton][48].

6.[Bloom filter][49] implemented by Apple Inc.

7.[Bresenham's algorithm][50].

### Programming Language Libraries ###

I think they are worth considering. The programming languages designers thought it was worth the time and effort of some engineers to implement these data structures and algorithms so others would not have to. The existence of libraries is part of the reason we can find basic data structures reimplemented in software that is written in C but less so for Java applications. 

1.The [C++ STL][51] includes lists, stacks, queues, maps, vectors, and algorithms for [sorting][52], [searching and heap manipulation][53]. 

2.[The Java API][54] is very extensive and covers much more.

3.The [Boost C++ library][55] includes algorithms like Boyer-Moore and Knuth-Morris-Pratt string matching algorithms.

### Allocation and Scheduling Algorithms ###

I find these interesting because even though they are called heuristics, the policy you use dictates the type of algorithm and data structure that are required, so one need to know about stacks and queues. 

1.Least Recently Used can be implemented in multiple ways. A [list-based implementation][56] in the Linux kernel.

2.Other possibilities are First In First Out, Least Frequently Used, and Round Robin.

3.A variant of FIFO was used by the VAX/VMS system.

4.[The Clock algorithm][57] by [Richard Carr][58] is used for page frame replacement in Linux.

5.he Intel i860 processor used a random replacement policy.

6.[Adaptive Replacement Cache][59] is used in some IBM storage controllers, and was used in PostgreSQL though [only briefly due to patent concerns][60]. 

7.The [Buddy memory allocation algorithm][61], which is discussed by Knuth in TAOCP Vol. 1 is used in the Linux kernel, and the jemalloc concurrent allocator used by FreeBSD and in [facebook][62].

### Core utils in *nix systems ###

1.*grep* and awk both implement the Thompson-McNaughton-Yamada construction of NFAs from regular expressions, which apparently [even beats the Perl implementation][63]. 

2.*tsort* implements topological sort.

3.*fgrep* implements the [Aho-Corasick string matching algorithm][64].

4.*GNU grep*, [implements the Boyer-Moore algorithm][65] according to the author Mike Haertel. 

5.crypt(1) on Unix implemented a variant of the encryption algorithm in the Enigma machine.

6.[*Unix diff*][66] implemented by Doug McIllroy, based on a prototype co-written with James Hunt, performs better than the standard dynamic programming algorithm used to compute Levenshtein distances. The [Linux version][67] computes the shortest edit distance. 

### Cryptographic Algorithms ###

This could be a very long list. Cryptographic algorithms are implemented in all software that can perform secure communications or transactions.

1.[Merkle trees][68], specifically the Tiger Tree Hash variant, were used in peer-to-peer applications such as [GTK Gnutella][69] and [LimeWire][70].

2.[MD5][71] is used to provide a checksum for software packages and is used for integrity checks on *nix systems ([Linux implementation][72]) and is also supported on Windows and OS X.

3.[OpenSSL][73] implements many cryptographic algorithms including AES, Blowfish, DES, SHA-1, SHA-2, RSA, DES, etc.

### Compilers ###

1.[LALR parsing][74] is implemented by yacc and bison.

2.Dominator algorithms are used in most optimizing compilers based on SSA form.

3.lex and flex compile regular expressions into NFAs.

### Compression and Image Processing  ###

1.[The Lempel-Ziv][75] algorithms for the GIF image format are implemented in image manipulation programs, starting from the *nix utility convert to complex programs.

2.Run length encoding is used to generate PCX files (used by the original Paintbrush program), compressed BMP files and TIFF files.

3.Wavelet compression is the basis for JPEG 2000 so all digital cameras that produce JPEG 2000 files will be implementing this algorithm. 

4.Reed-Solomon error correction is implemented in [the Linux kernel][76], CD drives, barcode readers and was combined with convolution for image transmission from Voyager.

###  ###Conflict Driven Clause Learning

Since the year 2000, the running time of SAT solvers on industrial benchmarks (usually from the hardware industry, though though other sources are used too) has decreased nearly exponentially every year. A very important part of this development is the Conflict Driven Clause Learning algorithm that combines the Boolean Constraint Propagation algorithm in the original paper of Davis Logemann and Loveland with the technique of clause learning that originated in constraint programming and artificial intelligence research. For specific, industrial modelling, SAT is considered an easy problem ([see this discussion][77]). To me, this is one of the greatest success stories in recent times because it combines algorithmic advances spread over several years, clever engineering ideas, experimental evaluation, and a concerted communal effort to solve the problem. The [CACM article by Malik and Zhang][78] is a good read. This algorithm is taught in many universities (I have attended four where it was the case) but typically in a logic or formal methods class.

Applications of SAT solvers are numerous. IBM, Intel and many other companies have their own SAT solver implementations. The [package manager][78] in OpenSUSE also uses a SAT solver.

--------------------------------------------------------------------------------

via: http://cstheory.stackexchange.com/questions/19759/core-algorithms-deployed/19773#19773

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/mirrors/linux-2.6
[2]:https://github.com/mirrors/linux-2.6/blob/master/lib/llist.c
[3]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/list.h
[4]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/llist.h
[5]:https://github.com/mirrors/linux-2.6/blob/39caa0916ef27cf1da5026eb708a2b8413156f75/lib/btree.c
[6]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/plist.h
[7]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/include/linux/rtmutex.h
[8]:https://github.com/mirrors/linux-2.6/blob/f0d55cc1a65852e6647d4f5d707c1c9b5471ce3c/drivers/powercap/intel_rapl.c
[9]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/rbtree.h
[10]:http://lwn.net/Articles/184495/
[11]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/interval_tree.h
[12]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/radix-tree.h
[13]:http://lwn.net/Articles/175432/
[14]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/include/linux/prio_heap.h
[15]:https://github.com/mirrors/linux-2.6/blob/42a2d923cc349583ebf6fdd52a7d35e1c2f7e6bd/include/linux/cgroup.h
[16]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/include/linux/hash.h
[17]:ttp://www.citi.umich.edu/techreports/reports/citi-tr-00-1.pdf
[18]:https://github.com/mirrors/linux-2.6/blob/0b1e73ed225d8f7aeef96b74147215ca8b990dce/drivers/staging/lustre/lustre/lov/lov_pool.c
[19]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/hashtable.h
[20]:https://github.com/mirrors/linux-2.6/blob/42a2d923cc349583ebf6fdd52a7d35e1c2f7e6bd/fs/inode.c
[21]:https://github.com/mirrors/linux-2.6/blob/ff812d724254b95df76b7775d1359d856927a840/fs/btrfs/check-integrity.c
[22]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/bitmap.h
[23]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/semaphore.h
[24]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/spinlock.h
[25]:https://github.com/mirrors/linux-2.6/blob/master/lib/bsearch.c
[26]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/drivers/sh/intc/chip.c
[27]:https://github.com/mirrors/linux-2.6/blob/10d0c9705e80bbd3d587c5fad24599aabaca6688/drivers/base/regmap/regcache.c
[28]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/fs/befs/btree.c
[29]:https://github.com/mirrors/linux-2.6/blob/a9238741987386bb549d61572973c7e62b2a4145/drivers/acpi/acpica/nswalk.c
[30]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/fs/configfs/dir.c
[31]:https://github.com/mirrors/linux-2.6/blob/4fbf888accb39af423f271111d44e8186f053723/kernel/locking/lockdep.c
[32]:https://github.com/mirrors/linux-2.6/blob/master/lib/list_sort.c
[33]:https://github.com/mirrors/linux-2.6/blob/42a2d923cc349583ebf6fdd52a7d35e1c2f7e6bd/fs/ubifs/gc.c
[34]:https://github.com/mirrors/linux-2.6/blob/ff812d724254b95df76b7775d1359d856927a840/fs/btrfs/raid56.c
[35]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/drivers/media/common/saa7146/saa7146_hlp.c
[36]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/lib/ts_kmp.c
[37]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/lib/ts_bm.c
[38]:http://www.cs.utexas.edu/users/moore/publications/fstrpos.pdf
[39]:http://www-igm.univ-mlv.fr/~lecroq/string/string.pdf
[40]:https://code.google.com/p/chromium/
[41]:https://code.google.com/p/chromium/codesearch#chromium/src/v8/src/splay-tree.h
[42]:https://code.google.com/p/chromium/codesearch#chromium/src/native_client_sdk/src/examples/demo/voronoi/index.html
[43]:https://code.google.com/p/chromium/codesearch#chromium/src/chrome/browser/ui/cocoa/tabs/tab_strip_controller.mm
[44]:https://code.google.com/p/chromium/codesearch#chromium/src/third_party/bintrees/bintrees/bintree.py
[45]:https://code.google.com/p/chromium/codesearch#chromium/src/third_party/bintrees/bintrees/rbtree.py
[46]:https://code.google.com/p/chromium/codesearch#chromium/src/third_party/bintrees/bintrees/avltree.py
[47]:https://code.google.com/p/chromium/codesearch#chromium/src/third_party/zlib/deflate.c
[48]:https://code.google.com/p/chromium/codesearch#chromium/src/native_client/src/trusted/validator_ragel/dfa_traversal.py
[49]:https://code.google.com/p/chromium/codesearch#chromium/src/third_party/WebKit/Source/wtf/BloomFilter.h
[50]:https://code.google.com/p/chromium/codesearch#chromium/src/third_party/libvpx/source/libvpx/vp8/common/textblit.c
[51]:http://www.cplusplus.com/reference/stl/
[52]:http://www.cplusplus.com/reference/algorithm/
[53]:http://www.cplusplus.com/reference/algorithm/
[54]:http://docs.oracle.com/javase/7/docs/api/
[55]:http://www.boost.org/doc/libs/1_55_0/libs/algorithm/doc/html/index.html#algorithm.description_and_rationale
[56]:https://github.com/mirrors/linux-2.6/blob/master/include/linux/list_lru.h
[57]:http://en.wikipedia.org/wiki/Page_replacement_algorithm#Clock
[58]:http://dl.acm.org/citation.cfm?id=4750
[59]:http://en.wikipedia.org/wiki/Adaptive_Replacement_Cache
[60]:http://www.varlena.com/GeneralBits/96.php
[61]:http://en.wikipedia.org/wiki/Buddy_memory_allocation
[62]:http://www.facebook.com/notes/facebook-engineering/scalable-memory-allocation-using-jemalloc/480222803919
[63]:http://swtch.com/~rsc/regexp/regexp1.html
[64]:http://en.wikipedia.org/wiki/Aho%E2%80%93Corasick_string_matching_algorithm
[65]:http://lists.freebsd.org/pipermail/freebsd-current/2010-August/019310.html
[66]:http://www.cs.dartmouth.edu/~doug/diff.pdf
[67]:http://linux.die.net/man/3/diff
[68]:http://en.wikipedia.org/wiki/Merkle_tree
[69]:https://github.com/gtk-gnutella/bitter
[70]:http://en.wikibooks.org/wiki/LimeWire
[71]:http://en.wikipedia.org/wiki/MD5
[72]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/crypto/md5.c
[73]:http://www.openssl.org/
[74]:http://en.wikipedia.org/wiki/LALR_parser
[75]:http://en.wikipedia.org/wiki/Lempel_Ziv
[76]:https://github.com/mirrors/linux-2.6/blob/b3a3a9c441e2c8f6b6760de9331023a7906a4ac6/lib/reed_solomon/reed_solomon.c
[77]:http://rjlipton.wordpress.com/2009/07/13/sat-solvers-is-sat-hard-or-easy/
[78]:http://dl.acm.org/citation.cfm?id=1536637
[79]:http://en.opensuse.org/Portal%3aLibzypp