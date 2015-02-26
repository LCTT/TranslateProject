那些算法在哪里？
================================================================================

本文来源于一篇stackexchange的[问题][101]回答。提问者问到，我们在计算机科学和数学课程里面学习到的那些算法，到底在什么地方用到了？结果[Vijay D][103]给出一个洋洋洒洒的[深入回答][102]，得到了提问者和众多围观。我们将这篇回答翻译过来以飨读者。

[Vijay D][103]写到：

在我看来，一个系统背后主要发挥作用的算法更容易在非算法课程上找到，这和应用数学中的成果比理论数学中更容易出现在应用中是一个道理。在讲座中，很少有实际问题能够精确匹配到一个抽象问题。归根结底，我认为没有理由让流行的算法课程，诸如Strassen乘法，AKS素性测试、或者Moser-Tardos算法与底层实际问题，如实现视频数据库、优化的编译器、操作系统、网络拥堵控制系统或者其他系统相关。这些课程的价值是学习利用错综复杂的方法发现问题的脉络而找出有效的解决方案。高级算法和简单算法的分析都不简单。正是由于这个原因，我不会忽略简单随机算法或者PageRank。

我想你可以选择任何一个大型软件，并在内部找到它所采用的基础和高级的算法。作为一个研究案例，我选择了Linux内核，并会示例一些Chromium里面的例子。

### Linux内核中的基本数据结构和算法 ###

Linux内核([源代码的链接在github][1])。

1.[链表][2]、[双向链表][3]、[无锁链表][4]。

2.[B+ 树][5]，这是一些你无法在教科书上找到的说明。

> 一个相对简单的B+树的实现。我把它作为一个学习练习来帮助理解B+树是如何工作的。这同样也被证明是有用的。 

> ...

> 一个在教科书中并不常见的技巧。最小的值在右侧而不是在左侧。所有在一个节点里用到的槽都在左侧，所有没有用到的槽包含了空值(NUL)。大多数操作只简单地遍历所有的槽一次并在第一个空值时(NUL)终止。

3.[优先排序列表][6] 用于 [互斥量][7]、[驱动][8]等等。

4.[红黑树][9][用于][10]调度、虚拟内存管理、追踪文件描述符和目录项等。

5.[区间树][11]

6.[根树][12]用于[内存管理][13]，NFS相关查询和网络相关功能。

> 根树的一个通用的用处是存储指针到结构页中。

7.[优先级堆][14]，如其名称的教科书实现，用于[cgroup][15]。

> 《简单的基于CLR的只插入的，含有指针的定长优先级堆》第七章

8.[哈希函数][16]，参考了Knuth和一篇论文。

> Knuth建议，用乘法哈希的机器字来表示接近黄金比例的素数的最大整数。Chuck Lever验证了该技术的有效性：
> 
> [http://www.citi.umich.edu/techreports/reports/citi-tr-00-1.pdf][17]
> 
> 这些素数的选择是位稀疏的，他们可以通过移位和加法操作，而不必使用乘法器，乘法器是很慢的。

9.有的代码，比如[这个驱动][18]，实现了他们自己的哈希函数。

> 使用了一种旋转哈希算法的哈希函数
> 
> Knuth, D. 《计算机程序设计艺术, 卷 3: 排序与搜索》, 第6、7章. Addison Wesley, 1973

10.[哈希表][19]用于实现[inode][20]、[文件系统完整性检测][21]等等。

11.[位数组][22]用于处理标志位、中断等等。并在Knuth那本书的卷4中阐述。

12.[信号量][23]和[自旋锁][24]

13.[二分查找][25]用于[中断处理][26],[寄存器缓存查询][27]等等。

14.[B树的二分查找][28]。

15.[深度优先搜索][29]被广泛地用于[目录配置中][30]。

> 执行一个修改过的命名空间树的深度优先遍历，以指定的start_handle节点开始（及结束）。回调函数会在任何一个参数匹配的节点被发现时被调用。如果回调函数返回了一个非0值，搜索将会立即终止并且将其返回给调用者。

16.[广度优先搜索][31]用于检测运行时锁定的正确性。

17.链表中的[归并排序][32]用于[垃圾收集][33]、[文件系统管理][34]等等。

18.[冒泡排序][35]在一个驱动库中也有一个令人惊讶的实现。

19.[Knuth-Morris-Pratt 字符串匹配][36],

> 根据Knuth、Morris和Pratt\[1\]实现了一个线性时间的字符串匹配算法。他们的算法避免了转换函数的显式地计算DELTA。对于长度为n的文本，其匹配时间是O(n)，对于长度为m的模式(pattern)，仅使用一个辅助函数PI[1 . .m]，预先计算模式的时间为O(m)。数组PI允许转换函数DELTA被实时有效地计算。粗略地说，对于任何状态"q"= 0,1,…、m和在SIGMA中的任何字符"a",PI["q"]的值包含的信息是独立的"a"并需要计算DELTA("q","a") \[2\]。既然PI只有m个记录，而DELTA有O(m |SIGMA|)个记录，在预处理时间计算PI而不是DELTA的时候，我们可以节省一个因数|SIGMA|
> 
> \[1\] Cormen, Leiserson, Rivest, Stein，算法介绍，第二版，MIT出版社
> 
> \[2\] 见有限自动机原理

20.[Boyer-Moore 模式匹配][37]是在找替代品时的参考和建议。

> 实现了Boyer-Moore字符串匹配算法:
> 
> \[1\] 《一个快速的字符串搜索算法》，R.S. Boyer and Moore.计算机通信协会，20(10), 1977, pp. 762-772. [http://www.cs.utexas.edu/users/moore/publications/fstrpos.pdf][38]
> 
> \[2\] 《准确的字符串匹配算法手册》，Thierry Lecroq, 2004 [http://www-igm.univ-mlv.fr/~lecroq/string/string.pdf][39]
> 
> 注:由于Boyer-Moore(BM)从右到左搜索匹配，仍然有可能匹配分布在多个块，在这种情况下该算法并没有优势。
> 
> 如果你希望确保这样的事情永远不会发生，那使用Knuth-Pratt-Morris(KMP)实现。总之，根据您的设置适当地选择字符串搜索算法。
> 
> 如果你正在用文本搜索器进行过滤，NIDS或任何类似的注重安全的目的，那么使用KMP。否则，如果你真的关心性能，并且你对数据包进行分类以使用服务质量(QoS)政策，当你不介意匹配可能分布分散，那么用BM。

### Chromium 浏览器中的数据结构和算法 ###

Chromium的([源代码在 Google code][40])。我只会列出一部分。我建议使用搜索来找到你最喜欢的算法或者数据结构。

1.[伸展树][41]。

> 这个树通过分配策略（分配器）参数化。这个策略用于C的可用存储区的列表分配，参见zone.h。

2.[Voronoi算法][42]用于一个示例。

3.[基于Bresenham算法的选项卡][43]

在Chromium的第三方代码里面也有如下的数据结构和算法。

1.[二叉树][44]

2.[红黑树][45]

> Julian Walker的总结
> 
> 红黑树是一个有趣的小东西。他们被认为比AVL树(它们的直接竞争对手)简单，乍一看这似乎是由于插入是一项轻松的乐事。然而，当你开始删除时，红黑树变得非常棘手。然而，通过复杂性的平衡，插入和删除可以使用单通道，实现自上而下的算法。这与AVL树情况不一样，插入只能自顶向下，删除则需要自下而上。

> ...
> 
> 红黑树是很流行的，像大多数数据结构一样有一个古怪的名字。比如，在Java和c++库映射结构通常用红黑树实现。红黑树的速度也与AVL树相当。而AVL树平衡性不是很好，需要保持平衡的话红黑树通常更好。有一些流传的误解，但在大多数情况下对红黑树的宣传是准确的。

3.[AVL 树][46]

4.[Rabin-Karp字符串匹配][47]用于比较。

5.[自动机后缀的计算][48]。

6.由Apple公司实现的[bloom过滤器][49]。

7.[Bresenham 算法][50]。

### 编程语言库 ###

我想这个问题值得思考。编程语言设计者们认为值得花一些工程师的时间和精力来实现这些数据结构和算法，这样其他人就不必这么做了。这些库是我们在JAVA里面比C更少的发现需要重新实现基本数据结构的部分原因。

1.[C++ STL][51]包含了链表、栈、队列、映射、向量和[排序][52]、[搜索和堆操作][53]算法。

2.[Java API][54]易于扩展的并且越来越多。

3.[Boost C++ 库][55]包含了像 Boyer-Moore以及Knuth-Morris-Pratt字符串匹配算法。

### 分配和调度算法 ###

我发现这些很有趣，因为即使他们被称为启发式，您使用的策略规定了算法类型和需要的数据结构，因此，所以需要人们知道栈和队列。

1.最近最少使用（LRU）算法可以用不同的方法实现。Linux内核有一种[基于列表的实现][56]。

2.其他的还有先入先出（FIFO）、最常使用和轮询。

3.FIFO的一个变种用于VAX/VMS系统。

4.[Richard Carr][58]的[时钟算法][57]用于Linux中的页面替换。

5.Intel i860处理器是一种随机替代策略。

6.[自适应置换高速缓存][59]用于一些IBM存储控制器中，也曾经用于PostgreSQL中([虽然仅仅因为一些专利问题][60]）。

7.Knuth在《计算机程序设计艺术 卷1》中讨论过的[Buddy内存分配算法][61]内用于Linux内核中，jemalloc并发分配器被用于FreeBSD和[facebook][62]中。

### *nix系统核心工具 ###

1.*grep*和*awk*同时从正则表达式中实现NFA的Thompson-McNaughton-Yamada构造，显然[这甚至击败了Perl的实现][63]。

2.*tsort*实现了拓扑排序。

3.*fgrep*实现了[Aho-Corasick字符串匹配算法][64]。

4.*GNU grep*，根据作者Mike Haertel实现了[Boyer-Mooresuan算法][65]。

5.Unix上的crypt(1)实现了一个在Enigma机器上的不同加密算法。

6.[*Unix diff*][66]由Doug McIllroy实现，基于和James Hunt合作编写的原形。它比用于计算Levenshtein距离的标准动态规划算法执行地更好。[Linux 版本][67]计算最短编辑距离。

### 加密算法 ###

这本是一个非常长的列表。加密算法在所有执行安全通信和交易的程序中都有实现。

1.[Merkle 树][68]，特别是 Tiger Tree Hash变种，被用于点对点应用，比如[GTK Gnutella][69]和[LimeWire][70]。

2.[MD5][71]被用于提供软件包的校验和并被用于在*nix系统上的完整性检测([Linux 实现][72])，同样也支持Windows和OSX。

3.[OpenSSL][73]实现了很多加密算法包括AES、Blowfish、DES、SHA-1、SHA-2、RSA、DES等等。

### 编译器 ###

1.[LALR 解析][74]在yacc和bison实现。

2.支配算法被用于大多数基于SSA形式的编译器优化。

3.lex和flex将正则表达式编译为NFA。

### 压缩和图像处理 ###

1.用于GIF图片格式的[Lempel-Ziv][75]算法在图像处理程序中实现，从*unix工具转化到复杂的程序。

2.行程长度编码用于产生PCX文件(用于原来的画笔程序)，它是被压缩的BMP和TIFF文件。

3.小波压缩是JPEG2000的基础，所以所有生成JPEG2000文件的数码相机会支持这个算法。

4.Reed-Solomon纠错在[Linux内核][76]、CD驱动器、条形码读取器、结合从Voyager中的卷积图像传输中实现。

### 冲突驱动语句学习算法 (CDCL) ###

自2000年以来，SAT求解器在工业标准的运行时间(通常是硬件工业，虽然其他地方也被使用)以近乎指数的方式每年下跌。这发展中很重要的一部分是冲突驱动语句学习算法，它结合了Davis Logemann和Loveland在约束规划和人工智能研究中关于语句学习的原始论文中的布尔约束传播算法。特定地，工业造型，SAT被认为是一个简单的问题([见这个讨论][77])。对我而言，这个一个最近最好的成功故事，因为它结合了这几年算法的不断发展、清晰的工程理念、实验性的评估、齐心协力地解决一个问题。[Malik 和 Zhang的CACM文章][78]值得阅读。这个算法在许多大学中教授(我参加过的4个地方都是如此)，但是通常在一个逻辑或者形式方法课上。

SAT求解器的应用有很多。IBM，Intel和许多其他公司都有他们的SAT求解器实现。OpenSuse的[包管理器][78]同样使用了一个SAT求解器。

--------------------------------------------------------------------------------

via: http://cstheory.stackexchange.com/questions/19759/core-algorithms-deployed/19773#19773

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

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

[101]:http://cstheory.stackexchange.com/questions/19759/core-algorithms-deployed/
[102]:http://cstheory.stackexchange.com/questions/19759/core-algorithms-deployed/19773#19773
[103]:http://cstheory.stackexchange.com/users/4155/vijay-d