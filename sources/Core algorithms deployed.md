已部署的核心算法
================================================================================
在我看来，一个系统背后主要驱动的算法更容易在非算法课程上找到，同理，目前的程序更容易在应用数学而不是理论数学中找到。在讲座中，很少有实际问题有一个抽象问题的精确就够。追根究底地说，我认为没有理由为何流行算法课程资料。诸如Strassen乘法，AKS素性测试、或者Moser-Tardos算法与底层实际问题，如实现视频数据库、优化的编译器、操作系统、网络拥堵控制系统或者其他系统有相关。这些课程的价值是学习利用错综复杂的方法找出问题的结构而找出有效的解决方案。高级算法也满足了一些简单算法，这些分析并不平凡。正是由于这个原因，我不会不理会简单随机算法或者PageRank。

我想你可以选择任何一个大型软件并会内部实现了发现基础和高级的算法。作为一个研究案例，我选择了Linux内核，并会示例一些Chromium里面的例子。

### Linux内核中的基本数据结构和算法 ###

链接在这里([source code on github][1])。

1.[链表][2], [双向链表][3], [无锁链表][4]。

2.[B+ 树][5]的注释会告诉你无法在教科书上找到的东西。

> A relatively simple B+Tree implementation. I have written it as a learning exercise to understand how B+Trees work. Turned out to be useful as well.
> 
> ...
> 
> A tricks was used that is not commonly found in textbooks. The lowest values are to the right, not to the left. All used slots within a node are on the left, all unused slots contain NUL values. Most operations simply loop once over all slots and terminate on the first NUL.

3.[优先排序列表][6] 用于 [互斥量][7]、[驱动][8]等等。

4.[红黑树][9][用于][10]调度、虚拟内存管理、追踪文件描述符和目录项等。

5.[区间树][11]

6.[根树][12]用于[内存管理][13]，NFS相关查询和网络相关功能。

> A common use of the radix tree is to store pointers to struct pages;

7.[优先级堆][14]，是一个字面上的教科书实现，用于[cgroup][15]。

> Simple insertion-only static-sized priority heap containing pointers, based on CLR, chapter 7

8.[哈希函数][16]，参考了Knuth和一篇论文。

> Knuth recommends primes in approximately golden ratio to the maximum integer representable by a machine word for multiplicative hashing. Chuck Lever verified the effectiveness of this technique:
> 
> [http://www.citi.umich.edu/techreports/reports/citi-tr-00-1.pdf][17]
> 
> These primes are chosen to be bit-sparse, that is operations on them can use shifts and additions instead of multiplications for machines where multiplications are slow.

9.一部分代码，比如[这个驱动][18],实现了他们自己的哈希函数。

> hash function using a Rotating Hash algorithm
> 
> Knuth, D. The Art of Computer Programming, Volume 3: Sorting and Searching, Chapter 6.4. Addison Wesley, 1973

10.[哈希表][19]用于实现[inode][20],[文件系统完整性检测][21]等等。

11.[位数组][22]用于处理标志位、中断等等。并在Knuth的卷4中阐述。

12.[信号量][23]和[自旋锁][24]

13.[二分查找][25]用于[中断处理][26],[寄存器缓存查询][27]等等。

14.[B树的二分查找][28]。

15.[深度优先搜索][29]被广泛地用于[目录配置中][30]。

> Performs a modified depth-first walk of the namespace tree, starting (and ending) at the node specified by start_handle. The callback function is called whenever a node that matches the type parameter is found. If the callback function returns a non-zero value, the search is terminated immediately and this value is returned to the caller.

16.[广度有限搜索][31]用于检测运行时锁定的正确性。

17.链表中的[归并排序][32]用于[垃圾收集][33],[文件系统管理][34]等等。

18.[冒泡排序][35]在一个驱动库中也是一个令人惊讶的实现。

19.[Knuth-Morris-Pratt 字符串匹配][36],

> Implements a linear-time string-matching algorithm due to Knuth, Morris, and Pratt [1]. Their algorithm avoids the explicit computation of the transition function DELTA altogether. Its matching time is O(n), for n being length(text), using just an auxiliary function PI[1..m], for m being length(pattern), precomputed from the pattern in time O(m). The array PI allows the transition function DELTA to be computed efficiently "on the fly" as needed. Roughly speaking, for any state "q" = 0,1,...,m and any character "a" in SIGMA, the value PI["q"] contains the information that is independent of "a" and is needed to compute DELTA("q", "a") 2. Since the array PI has only m entries, whereas DELTA has O(m|SIGMA|) entries, we save a factor of |SIGMA| in the preprocessing time by computing PI rather than DELTA.
> 
> [1] Cormen, Leiserson, Rivest, Stein Introdcution to Algorithms, 2nd Edition, MIT Press
> 
> [2] See finite automation theory

20.[Boyer-Moore 模式匹配][37]是在找替代品时的参考和建议。

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

### Chromium 浏览器中的数据结构和算法 ###

链接在这里([source code on Google code][40])。我只会列出一部分。我建议使用搜索来找到你最喜欢的算法或者数据结构。

1.[伸展树][41]。

> The tree is also parameterized by an allocation policy (Allocator). The policy is used for allocating lists in the C free store or the zone; see zone.h.

2.[Voronoi diagrams][42]用于一个示例。

3.[基于Bresenham的标志算法][43]

也有这样的第三方的数据结构和算法包含在Chromium代码中。

1.[二叉树][44]

2.[红黑树][45]

> Conclusion of Julian Walker
> 
> Red black trees are interesting beasts. They're believed to be simpler than AVL trees (their direct competitor), and at first glance this seems to be the case because insertion is a breeze. However, when one begins to play with the deletion algorithm, red black trees become very tricky. However, the counterweight to this added complexity is that both insertion and deletion can be implemented using a single pass, top-down algorithm. Such is not the case with AVL trees, where only the insertion algorithm can be written top-down. Deletion from an AVL tree requires a bottom-up algorithm.
> 
> ...
> 
> Red black trees are popular, as most data structures with a whimsical name. For example, in Java and C++, the library map structures are typically implemented with a red black tree. Red black trees are also comparable in speed to AVL trees. While the balance is not quite as good, the work it takes to maintain balance is usually better in a red black tree. There are a few misconceptions floating around, but for the most part the hype about red black trees is accurate.

3.[AVL 树][46]

4.[Rabin-Karp字符串匹配][47]用于比较。

5.[计算机器人后缀][48]

6.由Apple公司实现的[布隆过滤器][49]

7.[Bresenham 算法][50].

### 编程语言库 ###

我想这个问题值得思考。编程语言设计者们认为这值得花一些工程师时间和精力来实现这些数据结构和算法，这样其他人你不必这么做了。库的存在是我们可以在一些用C写的软件，但比Java少，重新实现了基础数据结构的部分原因。

1.[C++ STL][51]包含了链表、栈、队列、map、向量和对[排序][52]、[搜索和堆操作][53]算法。

2.[Java API][54]是非常广阔的并且覆盖了更多。
3.[Boost C++ 库][55]包含了像 Boyer-Moore以及Knuth-Morris-Pratt字符串匹配算法。

### 分配和调度算法 ###

我发现这些很有趣,因为即使他们被称为启发式,您使用的策略规定了算法类型和需要的数据结构，因此，所以需要人们知道栈和队列。

1.最近最少使用算法可以用不同的方法实现。Linux内核有一种[基于列表的实现][56]。

2.其他的还有先入先出、最常使用、和轮循。

3.FIFO的一个变种用于VAX/VMS系统。

4.[Richard Carr][58]的[时钟算法][57]用于Linux中的页面替换。

5.Intel i860处理器是一种随即替代策略。

6.[自适应置换高速缓存][59]用于一些IBM存储控制器中，也曾经用于PostgreSQL中([虽然仅仅因为一些专利问题][60]）。

7.Knuth在计算机程序设计艺术，卷1中讨论过的[Buddy内存分配算法][61]内用于Linux内核中，jemalloc并发分配器被用于FreeBSD和[facebook][62]中。

### *nix系统核心工具 ###

1.*grep*和*awk*同时实从正则表达式中实现NFA的Thompson-McNaughton-Yamada构造，这显然击败了[Perl的实现][63]。

2.*tsort*实现了拓扑排序。

3.*fgrep*实现了[Aho-Corasick字符串匹配算法][64]。

4.*GNU grep*，根据作者Mike Haertel实现了[Boyer-Mooresuan算法][65]。

5.Unix上的crypt(1)实现了一个在Enigma机器上的不同加密算法。

6.[*Unix diff*][66]由Doug McIllroy实现，基于和James Hunt合作编写的圆形。它比用于计算Levenshtein距离的标准动态规划算法执行地更好。[Linux 版本][67]计算最短编辑距离。

### 加密算法 ###

这可能回事一个非常长的列表。加密算法在所有执行安全通信和交易的程序中都有实现。

1.[Merkle 树][68]，特别是 Tiger Tree Hash变种，被用于点对点应用，比如[GTK Gnutella][69]和[LimeWire][70]。

2.[MD5][71]被用于提供软件包的校验和并被用于在*nix系统上的完整性检测(([Linux 实现][72]))，同样也在Windows和OSX中支持。

3.[OpenSSL][73]实现了很多加密算法包括AES、Blowfish、DES、SHA-1、SHA-2、RSA、DES等等

### 编译器 ###

1.[LALR 解析][74]用yacc和bison实现。

2.支配算法被用于大多数基于SSA形式的编译器优化。

3.lex和flex编译正则表达式成为NFA。

### 压缩和图像处理 ###

1.用于GIF图片格式的[Lempel-Ziv][75]算法用图形操作程序实现，从*unix工具转化到复杂的程序。

2.行程长度编码用于产生PCX文件(用于原始的画笔程序)，是被压缩的BMP和TIFF文件。

3.小波压缩是JPEG2000的基础，所以所有生成JPEG2000文件的数码相机会支持这个算法。

4.Reed-Solomon纠错在[Linux内核][76]、CD驱动器、条形码读取器、结合从Voyager中的卷积图像传输中实现。

### 冲突驱动语句学习算法 (CDCL)###

自2000以来，SAT求解器在工业标准的运行时间(通常是硬件工业，虽然其他地方也被使用)以近乎指数的方式每年下跌。这发展中很重要的一部分是冲突驱动语句学习算法，它结合了Davis Logemann和Loveland在约束规划和人工智能研究中关于语句学习的原始论文中的布尔约束传播算法。特定地，工业造型，SAT被认为是一个简单的问题([见这个讨论][77])。对我而言，这个一个最近最好的成功故事因为它结合了这几年算法的前进推广、聪明的工程理念、实验性的评估、齐心协力地解决一个问题。[Malik and Zhang的CACM文章][78]值得阅读。这个算法在许多大学中教授(我参加了4个地方都是如此)，但是通常在一个逻辑或者形式方法课上。

SAT求解器的应用有很多。IBM，Intel和许多其他公司都有他们的SAT求解器是西安。OpenSuse的[包管理器][78]同样使用了一个SAT求解器。

--------------------------------------------------------------------------------

via: http://cstheory.stackexchange.com/questions/19759/core-algorithms-deployed/19773#19773

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

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