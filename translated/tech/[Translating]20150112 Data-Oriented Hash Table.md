Translating by sanfusu
<!--[Data-Oriented Hash Table][1]-->
[面向数据的哈希表][1]
============================================================

<!--In recent years, there’s been a lot of discussion and interest in “data-oriented design”—a programming style that emphasizes thinking about how your data is laid out in memory, how you access it and how many cache misses it’s going to incur. -->
最近几年中，面向数据的设计已经受到了很多的关注 —— 一种强调内存中数据布局的编程风格，包括如何访问以及将会引发多少的 cache 缺失。
<!--With memory reads taking orders of magnitude longer for cache misses than hits, the number of misses is often the key metric to optimize.-->
由于在内存读取操作中缺失所占的数量级要大于命中的数量级，所以缺失的数量通常是优化的关键标准。
  <!--It’s not just about performance-sensitive code—data structures designed without sufficient attention to memory effects may be a big contributor to the general slowness and bloatiness of software.
  -->
 这不仅仅关乎那些对性能有要求的 code-data 结构设计的软件，由于缺乏对内存效益的重视而成为软件运行缓慢、膨胀的一个很大因素。

<!--The central tenet of cache-efficient data structures is to keep things flat and linear. For example, under most circumstances, to store a sequence of items you should prefer a flat array over a linked list—every pointer you have to chase to find your data adds a likely cache miss, while flat arrays can be prefetched and enable the memory system to operate at peak efficiency.
-->

高效缓存数据结构的中心原则是将事情变得平滑和线性。
比如，在大部分情况下，存储一个序列元素更倾向于使用平滑的数组而不是链表 —— 每一次通过指针来查找数据都会为 cache 缺失增加一份风险；而平滑的数组可以预先获取，并使得内存系统以最大的效率运行

<!--This is pretty obvious if you know a little about how the memory hierarchy works—but it’s still a good idea to test things sometimes, even if they’re “obvious”! [Baptiste Wicht tested `std::vector` vs `std::list` vs `std::deque`][4] (the latter of which is commonly implemented as a chunked array, i.e. an array of arrays) a couple of years ago. The results are mostly in line with what you’d expect, but there are a few counterintuitive findings. For instance, inserting or removing values in the middle of the sequence—something lists are supposed to be good at—is actually faster with an array, if the elements are a POD type and no bigger than 64 bytes (i.e. one cache line) or so! It turns out to actually be faster to shift around the array elements on insertion/removal than to first traverse the list to find the right position and then patch a few pointers to insert/remove one element. That’s because of the many cache misses in the list traversal, compared to relatively few for the array shift. (For larger element sizes, non-POD types, or if you already have a pointer into the list, the list wins, as you’d expect.)
-->

如果你知道一点内存层级如何运作的知识，下面的内容会是想当然的结果——但是有时候即便他们相当明显，测试一下任不失为一个好主意。
[Baptiste Wicht 测试过了 `std::vector` vs `std::list` vs `std::deque`][4]
（几年前，后者通常使用分块数组来实现，比如：一个数组的数组）
结果大部分会和你预期的保持一致，但是会存在一些违反直觉的东西。
作为实例：在序列链表的中间位置做插入或者移除操作被认为会比数组快
但如果该元素是一个 POD 类型，并且不大于 64 字节或者在 64 字节左右（在一个 cache 流水线内），
通过对要操作的元素周围的数组元素进行移位操作要比从头遍历链表来的快。
这是由于在遍历链表以及通过指针插入/删除元素的时候可能会导致不少的 cache 缺失，相对而言，数组移位则很少会发生。
（对于更大的元素，非 POD 类型，或者你你已经有了指向链表元素的指针，此时和预期的一样，链表胜出）



<!--Thanks to data like Baptiste’s, we know a good deal about how memory layout affects sequence containers.-->
多亏了 Baptiste 的数据，我们知道了内存布局如何影响序列容器。
<!--But what about associative containers, i.e. hash tables?-->
但是关联容器，比如 hash 表会怎么样呢？
<!--There have been some expert recommendations: -->
已经有了些权威推荐：
<!--[Chandler Carruth tells us to use open addressing with local probing][5] -->
[Chandler Carruth 推荐的带局部探测的开放寻址][5]
<!--so that we don’t have to chase pointers,-->
（此时，我们没必要追踪指针）
<!--and [Mike Acton suggests segregating keys from values][6]
in memory so that we get more keys per cache line,
improving locality when we have to look at multiple keys. -->
以及[Mike Acton 推荐的在内存中将 value 和 key 隔离][6]（这种情况下，我们可以在每一个 cache 流水线中得到更多的 key）， 这可以在我们不得查找多个 key 时提高局部性能。
<!-- These ideas make good sense, but again, it’s a good idea to test things, -->
<!-- and I couldn’t find any data. So I had to collect some of my own! -->
这些想法很有意义，但再一次的说明：测试永远是好习惯，但由于我找不到任何数据，所以只好自己收集了。

<!--### [][7]The Tests-->
### [][7]测试

<!--
I tested four different quick-and-dirty hash table implementations, as well as `std::unordered_map`. All five used the same hash function, Bob Jenkins’ [SpookyHash][8] with 64-bit hash values. (I didn’t test different hash functions, as that wasn’t the point here; I’m also not looking at total memory consumption in my analysis.) The implementations are identified by short codes in the results tables:
-->
我测试了四个不同的 quick-and-dirty 哈希表实现，另外还包括 `std::unordered_map` 。
这五个哈希表都使用了同一个哈希函数 —— Bob Jenkins' [SpookyHash][8]（64 位哈希值）。
（由于哈希函数在这里不是重点，所以我没有测试不同的哈希函数；我同样也没有检测我的分析中的总内存消耗。）
实现会通过短代码在测试结果表中标注出来。

*   **UM**: `std::unordered_map` 。<!--In both VS2012 and libstdc++-v3 (used by both gcc and clang), UM is implemented as a linked list containing all the elements, and an array of buckets that store iterators into the list. In VS2012, it’s a doubly-linked list and each bucket stores both begin and end iterators; in libstdc++, it’s a singly-linked list and each bucket stores just a begin iterator. In both cases, the list nodes are individually allocated and freed. Max load factor is 1.-->
在 VS2012 和 libstdc++-v3 （libstdc++-v3: gcc 和 clang 都会用到这东西）中，
UM 是以链接表的形式实现，所有的元素都在链表中，buckets 数组中存储了链表的迭代器。
VS2012 中，则是一个双链表，每一个 bucket 存储了起始迭代器和结束迭代器；
libstdc++ 中，是一个单链表，每一个 bucket 只存储了一个起始迭代器。
这两种情况里，链表节点是独立申请和释放的。最大负载因子是 1 。

*   **Ch**: <!--separate chaining—each bucket points to a singly-linked list of element nodes. The element nodes are stored in a flat array pool, to avoid allocating each node individually. Unused nodes are kept on a free list. Max load factor is 1.-->
分离的、链状 buket 指向一个元素节点的单链表。
为了避免分开申请每一个节点，元素节点存储在平滑的数组池中。
未使用的节点保存在一个空闲链表中。
最大负载因子是 1。

*   **OL**:<!--open addressing with linear probing—each bucket stores a 62-bit hash,
a 2-bit state (empty, filled, or removed), key, and value. Max load factor is 2/3.-->
开地址线性探测 —— 每一个 bucket 存储一个 62 bit 的 hash 值，一个 2 bit 的状态值（包括 empty，filled，removed 三个状态），key 和 vale 。最大负载因子是 2/3。
*   **DO1**:<!--“data-oriented 1”—like OL, but the hashes and states are segregated from the keys and values, in two separate flat arrays.-->
data-oriented 1 —— 和 OL 相似，但是哈希值、状态值和 key、values 分离在两个隔离的平滑数组中。

*   **DO2**:<!--“data-oriented 2”—like OL, but the hashes/states, keys, and values are segregated in three separate flat arrays.-->
"data-oriented 2" —— 与 OL 类似，但是哈希/状态，keys 和 values 被分离在 3 个相隔离的平滑数组中。

<!--All my implementations, as well as VS2012’s UM, use power-of-2 sizes by default, growing by 2x upon exceeding their max load factor. -->
在我的所有实现中，包括 VS2012 的 UM 实现，默认使用尺寸为 2 的 n 次方。如果超出了最大负载因子，则扩展两倍。
<!--In libstdc++, UM uses prime-number sizes by default and grows to the next prime upon exceeding its max load factor.-->
在 libstdc++ 中，UM 默认尺寸是一个素数。如果超出了最大负载因子，则扩展为下一个素数大小。
<!--However, I don’t think these details are very important for performance.-->
但是我不认为这些细节对性能很重要。
<!--The prime-number thing is a hedge against poor hash functions that don’t have enough entropy in their lower bits, but we’re using a good hash function.-->
素数是一种对低 bit 位上没有足够熵的低劣 hash 函数的挽救手段，但是我们正在用的是一个很好的 hash 函数。

<!--The OL, DO1 and DO2 implementations will collectively be referred to as OA (open addressing), since we’ll find later that their performance characteristics are often pretty similar.-->
OL，DO1 和 DO2 的实现将共同的被称为 OA（open addressing）——稍后我们将发现他们在性能特性上非常相似。
<!--For each of these implementations, I timed several different operations, at element counts from 100K to 1M and for payload sizes (i.e. total key+value size) from 8 to 4K bytes.-->
在每一个实现中，单元数从 100 K 到 1 M，有效负载（比如：总的 key + value 大小）从 8 到 4 k 字节
我为几个不同的操作记了时间。
<!--For my purposes, keys and values were always POD types and keys were always 8 bytes (except for the 8-byte payload, in which key and value were 4 bytes each).-->
 keys 和 values 永远是 POD 类型，keys 永远是 8 个字节（除了 8 字节的有效负载，此时 key 和 value 都是 4 字节）
<!-- I kept the keys to a consistent size because my purpose here was to test memory effects, not hash function performance. Each test was repeated 5 times and the minimum timing was taken. -->
因为我的目的是为了测试内存影响而不是哈希函数性能，所以我将 key 放在连续的尺寸空间中。
每一个测试都会重复 5 遍，然后记录最小的耗时。

<!-- The operations tested were: -->
测试的操作在这里：

*   **Fill**:<!-- insert a randomly shuffled sequence of unique keys into the table. -->
将一个随机的 key 序列插入到表中（key 在序列中是唯一的）。
*   **Presized fill**:<!-- like Fill, but first reserve enough memory for all the keys we’ll insert, to prevent rehashing and reallocing during the fill process. -->
和 Fill 相似，但是在插入之间我们先为所有的 key 保留足够的内存空间，以防止在 fill 过程中 rehash 或者重申请。
*   **Lookup**: <!-- perform 100K lookups of random keys, all of which are in the table. -->
执行 100 k 随机 key 查找，所有的 key 都在 table 中。
*   **Failed lookup**: <!-- perform 100K lookups of random keys, none of which are in the table. -->
执行 100 k 随机 key 查找，所有的 key 都不在 table 中。
*   **Remove**:<!-- remove a randomly chosen half of the elements from a table. -->
从 table 中移除随机选择的半数元素。
*   **Destruct**:<!-- destroy a table and free its memory. -->
销毁 table 并释放内存.

<!-- You can [download my test code here][9].  -->
你可以[在这里下载我的测试代码][9]。
<!-- It builds for Windows or Linux, in 64-bit only. -->
这些代码只能在 64 机器上编译（包括Windows和Linux）。
<!-- There are some flags near the top of `main()` that you can toggle to turn on or off different tests—with all of them on, it will likely take an hour or two to run.  -->
在 `main()` 函数附件有一些标记，你可把他们打开或者关掉——如果全开，可能会需要一两个小时才能结束运行。
<!-- The results I gathered are also included, in an Excel spreadsheet in that archive.  -->
我搜集的结果也放在了那个打包文件里的 Excel 表中。
<!-- (Beware that the Windows and Linux results are run on different CPUs, so timings aren’t directly comparable.) -->
(注意： Windows 和 Linux 在不同的 CPU 上跑的，所以时间不具备可比较性）
<!-- The code also runs unit tests to verify that all the hash table implementations are behaving correctly. -->
代码也跑了一些单元测试，用来验证所有的 hash 表实现都能运行正确。

<!-- Incidentally, I also tried two additional implementations: -->
我还顺带尝试了附加的两个实现：
<!-- separate chaining with the first node stored in the bucket instead of the pool, and open addressing with quadratic probing. -->
Ch 中第一个节点存放在 bucket 中而不是 pool 里，二次探测的开放寻址。
<!-- Neither of these was good enough to include in the final data, but the code for them is still there. -->
这两个都不足以好到可以放在最终的数据里，但是他们的代码仍放在了打包文件里面。
<!-- ### [][10]The Results -->
### [][10]结果

<!-- There’s a ton of data here. -->
这里有成吨的数据!!
<!-- In this section I’ll discuss the results in some detail, but if your eyes are glazing over in this part, feel free to skip down to the conclusions in the next section. -->
这一节我将详细的讨论一下结果，但是如果你对此不感兴趣，可以直接跳到下一节的总结。

### [][11]Windows

<!-- Here are the graphed results of all the tests, compiled with Visual Studio 2012, and run on Windows 8.1 on a Core i7-4710HQ machine. (Click to zoom.) -->
这是所有的测试的图表结果，使用 Visual Studio 2012 编译，运行于 Windows8.1 和 Core i7-4710HQ 机器上。（点击可以放大。）

[
 ![Results for VS 2012, Windows 8.1, Core i7-4710HQ](http://reedbeta.com/blog/data-oriented-hash-table/results-vs2012.png "Results for VS 2012, Windows 8.1, Core i7-4710HQ")
][12]

<!-- From left to right are different payload sizes, from top to bottom are the various operations, and each graph plots time in milliseconds versus hash table element count for each of the five implementations.  -->
从左至右是不同的有效负载大小，从上往下是不同的操作
<!-- (Note that not all the Y-axes have the same scale!) I’ll summarize the main trends for each operation. -->
（注意：不是所有的Y轴都是相同的比例！）我将为每一个操作总结一下主要趋向。

**Fill**:
<!-- Among my hash tables, chaining is a bit better than any of the OA variants, with the gap widening at larger payloads and table sizes. -->
在我的 hash 表中，Ch 稍比任何的 OA 变种要好。随着哈希表大小和有效负载的加大，差距也随之变大。
<!-- I guess this is because chaining only has to pull an element off the free list and stick it on the front of its bucket, while OA may have to search a few buckets to find an empty one. -->
我猜测这是由于 Ch 只需要从一个空闲链表中拉取一个元素，然后把他放在 bucket 前面，而 OA 不得不搜索一部分 buckets 来找到一个空位置。
<!-- The OA variants perform very similarly to each other, but DO1 appears to have a slight advantage. -->
所有的 OA 变种的性能表现基本都很相似，当然 DO1 稍微有点优势。

<!-- All of my hash tables beat UM by quite a bit at small payloads, where UM pays a heavy price for doing a memory allocation on every insert. -->
在小负载的情况，UM 几乎是所有 hash 表中表现最差的 —— 因为 UM 为每一次的插入申请（内存）付出了沉重的代价。
<!-- But they’re about equal at 128 bytes, and UM wins by quite a bit at large payloads: -->
但是在 128 字节的时候，这些 hash 表基本相当，大负载的时候 UM 还赢了点。
<!-- there, all of my implementations are hamstrung by the need to resize their element pool and spend a lot of time moving the large elements into the new pool, while UM never needs to move elements once they’re allocated. -->
因为，我所有的实现都需要重新调整元素池的大小，并需要移动大量的元素到新池里面，这一点我几乎无能为力；而 UM 一旦为元素申请了内存后便不需要移动了。
<!-- Notice the extreme “steppy” look of the graphs for my implementations at large payloads, -->
注意大负载中图表上夸张的跳步！
<!-- which confirms that the problem comes when resizing. -->
这更确认了重新调整大小带来的问题。
<!-- In contrast, UM is quite linear—it only has to resize its bucket array, which is cheap enough not to make much of a bump. -->
相反，UM 只是线性上升 —— 只需要重新调整 bucket 数组大小。由于没有太多隆起的地方，所以相对有效率。

**Presized fill**:
<!-- Generally similar to Fill, but the graphs are more linear, not steppy (since there’s no rehashing), and there’s less difference between all the implementations. -->
大致和 Fill 相似，但是图示结果更加的线性光滑，没有太大的跳步（因为不需要 rehash ），所有的实现差距在这一测试中要缩小了些。
<!-- UM is still slightly faster than chaining at large payloads, but only slightly—again confirming that the problem with Fill was the resizing. -->
大负载时 UM 依然稍快于 Ch，问题还是在于重新调整大小上。
<!-- Chaining is still consistently faster than the OA variants, but DO1 has a slight advantage over the other OAs. -->
Ch 仍是稳步少快于 OA 变种，但是 DO1 比其他的 OA 稍有优势。

**Lookup**:
<!-- All the implementations are closely clustered, with UM and DO2 the front-runners, except at the smallest payload, where it seems like DO1 and OL may be faster. -->
所有的实现都相当的集中。除了最小负载时，DO1 和 OL 稍快，其余情况下 UM 和 DO2 都跑在了前面。<!--Note: 你确定？-->
<!-- It’s impressive how well UM is doing here, actually; -->
真的，我无法描述 UM 在这一步做的多么好。
<!-- it’s holding its own against the data-oriented variants despite needing to traverse a linked list. -->
尽管需要遍历链表，但是 UM 还是坚守了面向数据的本性。

<!-- Incidentally, it’s interesting to see that the lookup time weakly depends on table size. -->
顺带一提，查找时间和 hash 表的大小有着很弱的关联，这真的很有意思。
<!-- Hash table lookup is expected constant-time, so from the asymptotic view it shouldn’t depend on table size at all. But that’s ignoring cache effects! -->
哈希表查找时间期望上是一个常量时间，所以在的渐进视图中，性能不应该依赖于表的大小。但是那是在忽视了 cache 影响的情况下！
<!-- When we do 100K lookups on a 10K-entry table, for instance, we’ll get a speedup because most of the table will be in L3 after the first 10K–20K lookups. -->
作为具体的例子，当我们在具有 10 k 条目的表中做 100 k 查找时，速度会便变快，因为在第一次 10 k - 20 k 查找后，大部分的表会处在 L3 中。

**Failed lookup**:
<!-- There’s a bit more spread here than the successful lookups.  -->
相对于成功查找，这里就有点更分散一些。
<!-- DO1 and DO2 are the front-runners, with UM not far behind, and OL a good deal worse than the rest. -->
DO1 和 DO2 跑在了前面，但 UM 并没有落下，OL 则是捉襟见肘啊。
<!-- My guess is this is probably a case of OL having longer searches on average, especially in the case of a failed lookup; -->
我猜测，这可能是因为 OL 整体上具有更长的搜索路径，尤其是在失败查询时；
<!-- with the hash values spaced out in memory between keys and values, that hurts. -->
内存中，hash 值在 key 和 value 之飘来荡去的找不着出路，我也很受伤啊。
<!-- DO1 and DO2 have equally-long searches, but they have all the hash values packed together in memory, and that turns things around. -->
DO1 和 DO2 具有相同的搜索长度，但是他们将所有的 hash 值打包在内存中，这使得问题有所缓解。

**Remove**:
<!-- DO2 is the clear winner, with DO1 not far behind, chaining further behind, and UM in a distant last place due to the need to free memory on every remove; -->
DO2 很显然是赢家,但 DO1 也未落下。Ch 则落后，UM 则是差的不是一丁半点（主要是因为每次移除都要释放内存）；
<!-- the gap widens at larger payloads. -->
差距随着负载的增加而拉大。
<!-- The remove operation is the only one that doesn’t touch the value data, only the hashes and keys, which explains why DO1 and DO2 are differentiated from each other here but pretty much equal in all the other tests. -->
移除操作是唯一不需要接触数据的操作，只需要 hash 值和 key 的帮助，这也是为什么 DO1 和 DO2 在移除操作中的表现大相径庭，而其他测试中却保持一致。
<!-- (If your value type was non-POD and needed to run a destructor, that difference would presumably disappear.) -->
（如果你的值不是 POD 类型的，并需要析构，这种差异应该是会消失的。）

**Destruct**:
<!-- Chaining is the fastest except at the smallest payload, where it’s about equal to the OA variants. -->
Ch 除了最小负载，其他的情况都是最快的（最小负载时，约等于 OA 变种）。
<!-- All the OA variants are essentially equal. -->
所有的 OA 变种基本都是相等的。
<!-- Note that for my hash tables, all they’re doing on destruction is freeing a handful of memory buffers, -->
注意，在我的 hash 表中所做的所有析构操作都是释放少量的内存 buffer 。
<!-- but [on Windows, freeing memory has a cost proportional to the amount allocated][13]. -->
但是 [在Windows中，释放内存的消耗和大小成比例关系][13]。
<!-- (And it’s a significant cost—an allocation of ~1 GB is taking ~100 ms to free!) -->
（而且，这是一个很显著的开支 —— 申请 ～1 GB 的内存需要 ～100 ms 的时间去释放！）

<!-- UM is the slowest to destruct—by an order of magnitude at small payloads, and only slightly slower at large payloads. -->
UM 在析构时是最慢的一个（小负载时，慢的程度可以用数量级来衡量），大负载时依旧是稍慢些。
<!-- The need to free each individual element instead of just freeing a couple of arrays really hurts here. -->
对于 UM 来讲，释放每一个元素而不是释放一组数组真的是一个硬伤。

### [][14]Linux

<!-- I also ran tests with gcc 4.8 and clang 3.5, on Linux Mint 17.1 on a Core i5-4570S machine. The gcc and clang results were very similar, so I’ll only show the gcc ones; the full set of results are in the code download archive, linked above. (Click to zoom.) -->
我还在装有 Linux Mint 17.1 的 Core i5-4570S 机器上使用 gcc 4.8 和 clang 3.5 来运行了测试。gcc 和 clang 的结果很相像，因此我只展示了 gcc 的；完整的结果集合包含在了代码下载打包文件中，链接在上面。（点击来缩放）
[
 ![Results for g++ 4.8, Linux Mint 17.1, Core i5-4570S](http://reedbeta.com/blog/data-oriented-hash-table/results-g++4.8.png "Results for g++ 4.8, Linux Mint 17.1, Core i5-4570S")
][15]

<!-- Most of the results are quite similar to those in Windows, so I’ll just highlight a few interesting differences. -->
大部分结果和 Windows 很相似，因此我只高亮了一些有趣的不同点。

**Lookup**:
<!-- Here, DO1 is the front-runner, where DO2 was a bit faster on Windows. -->
这里 DO1 跑在前头，而在 Windows 中 DO2 更快些。
<!-- Also, UM and chaining are way behind all the other implementations, which is actually what I expected to see in Windows as well, given that they have to do a lot of pointer chasing while the OA variants just stride linearly through memory. --><!-- @error这里原文写错了吧-->
同样，UM 和 Ch 落后于其他所有的实现——过多的指针追踪，然而 OA 只需要在内存中线性的移动即可。
<!-- It’s not clear to me why the Windows and Linux results are so different here. UM is also a good deal slower than chaining, especially at large payloads, which is odd; I’d expect the two of them to be about equal. -->
至于 Windows 和 Linux 结果为何不同，则不是很清楚。UM 同样比 Ch 慢了不少，特别是大负载时，这很奇怪；我期望的是他们可以基本相同。

**Failed lookup**:
<!-- Again, UM is way behind all the others, even slower than OL. -->
UM 再一次落后于其他实现，甚至比 OL 还要慢。
<!-- Again, it’s puzzling to me why this is so much slower than chaining, and why the results differ so much between Linux and Windows. -->
我再一次无法理解为何 UM 比 Ch 慢这么多，Linux 和 Windows 的结果为何有着如此大的差距。


**Destruct**:
<!-- For my implementations, the destruct cost was too small to measure at small payloads; -->
在我的实现中，小负载的时候，析构的消耗太少了，以至于无法测量；
<!-- at large payloads, it grows quite linearly with table size—perhaps proportional to the number of virtual memory pages touched, rather than the number allocated? -->
在大负载中，线性增加的比例和创建的虚拟内存页数量相关，而不是申请到的数量？
<!-- It’s also orders of magnitude faster than the destruct cost on Windows. -->
同样，要比 Windows 中的析构快上几个数量级。
<!-- However, this isn’t anything to do with hash tables, really; -->
但是并不是所有的都和 hash 表有关；
<!-- we’re seeing the behavior of the respective OSes’ and runtimes’ memory systems here. -->
我们在这里可以看出不同系统和运行时内存系统的表现。
<!-- It seems that Linux frees large blocks memory a lot faster than Windows (or it hides the cost better, perhaps deferring work to process exit, or pushing things off to another thread or process). -->
貌似，Linux 释放大内存块是要比 Windows 快上不少（或者 Linux 很好的隐藏了开支，或许将释放工作推迟到了进程退出，又或者将工作推给了其他线程或者进程）。

<!-- UM with its per-element frees is now orders of magnitude slower than all the others, across all payload sizes. -->
UM 由于要释放每一个元素，所以在所有的负载中都比其他慢上几个数量级。
<!-- In fact, I cut it from the graphs because it was screwing up the Y-axis scale for all the others. -->
事实上，我将图片做了剪裁，因为 UM 太慢了，以至于破坏了 Y 轴的比例。

<!-- ### [][16]Conclusions -->
### [][16]总结

<!-- Well, after staring at all that data and the conflicting results for all the different cases, what can we conclude? -->
好，当我们凝视各种情况下的数据和矛盾的结果时，我们可以得出什么结果呢？
<!-- I’d love to be able to tell you unequivocally that one of these hash table variants beats out the others, but of course it’s not that simple. -->
我想直接了当的告诉你这些 hash 表变种中有一个打败了其他所有的 hash 表，但是这显然不那么简单。
<!-- Still, there is some wisdom we can take away. -->
不过我们仍然可以学到一些东西。

<!-- First, in many cases it’s  _easy_  to do better than `std::unordered_map`. -->
首先，在大多数情况下我们“很容易”做的比 `std::unordered_map` 还要好。
<!-- All of the implementations I built for these tests (and they’re not sophisticated; it only took me a couple hours to write all of them) either matched or improved upon `unordered_map`, -->
我为这些测试所写的所有实现（他们并不复杂；我只花了一两个小时就写完了）要么是符合 `unordered_map` 要么是在其基础上做的提高，
<!-- except for insertion performance at large payload sizes (over 128 bytes), where `unordered_map`‘s separately-allocated per-node storage becomes advantageous. -->
除了大负载（超过128字节）中的插入性能， `unordered_map` 为每一个节点独立申请存储占了优势。
<!-- (Though I didn’t test it, I also expect `unordered_map` to win with non-POD payloads that are expensive to move.) -->
（尽管我没有测试，我同样期望 `unordered_map` 能在非 POD 类型的负载上取得胜利。）
<!-- The moral here is that if you care about performance at all, don’t assume the data structures in your standard library are highly optimized. -->
具有指导意义的是，如果你非常关心性能，不要假设你的标准库中的数据结构是高度优化的。
<!-- They may be optimized for C++ standard conformance, not performance. :P -->
他们可能只是在 C++ 标准的一致性上做了优化，但不是性能。:P

<!-- Second, you could do a lot worse than to just use DO1 (open addressing, linear probing, with the hashes/states segregated from keys/values in separate flat arrays) whenever you have small, inexpensive payloads. -->
其次，如果不管在小负载还是超负载中，若都只用 DO1 （开放寻址，线性探测，hashes/states 和 key/vaules分别处在隔离的平滑数组中），那可能不会有啥好表现。
<!-- It’s not the fastest for insertion, but it’s not bad either (still way better than `unordered_map`), and it’s very fast for lookup, removal, and destruction. -->
这不是最快的插入，但也不坏（还比 `unordered_map` 快），并且在查找，移除，析构中也很快。
<!-- What do you know—“data-oriented design” works! -->
你所知道的 —— “面向数据设计”完成了！

<!-- Note that my test code for these hash tables is far from production-ready—they only support POD types, -->
注意，我的为这些哈希表做的测试代码远未能用于生产环境——他们只支持 POD 类型，
<!-- don’t have copy constructors and such, don’t check for duplicate keys, etc. -->
没有拷贝构造函数以及类似的东西，也未检测重复的 key，等等。
<!-- I’ll probably build some more realistic hash tables for my utility library soon, though. -->
我将可能尽快的构建一些实际的 hash 表，用于我的实用库中。
<!-- To cover the bases, I think I’ll want two variants: one based on DO1, for small, cheap-to-move payloads, and another that uses chaining and avoids ever reallocating and moving elements (like `unordered_map`) for large or expensive-to-move payloads. -->
为了覆盖基础部分，我想我将有两个变种：一个基于 DO1，用于小的，移动时不需要太大开支的负载；另一个用于链接并且避免重新申请和移动元素（就像   `unordered_map`   ),用于大负载或者移动起来需要大开支的负载情况。
<!-- That should give me the best of both worlds. -->
这应该会给我带来最好的两个世界。

<!-- In the meantime, I hope this has been illuminating. -->
与此同时，我希望你们会有所启迪。
<!-- And remember, if Chandler Carruth and Mike Acton give you advice about data structures, listen to them. 😉 -->
最后记住，如果 Chandler Carruth 和 Mike Acton 在数据结构上给你提出些建议，你一定要听 😉

--------------------------------------------------------------------------------


作者简介：

<!-- I’m a graphics programmer, currently freelancing in Seattle. Previously I worked at NVIDIA on the DevTech software team, and at Sucker Punch Productions developing rendering technology for the Infamous series of games for PS3 and PS4. -->
我是一名图形程序员，目前在西雅图做自由职业者。之前我在 NVIDIA 的 DevTech 软件团队中工作，并在美少女特工队工作室中为 PS3 和 PS4 的 Infamous 系列游戏开发渲染技术。

<!-- I’ve been interested in graphics since about 2002 and have worked on a variety of assignments, including fog, atmospheric haze, volumetric lighting, water, visual effects, particle systems, skin and hair shading, postprocessing, specular models, linear-space rendering, and GPU performance measurement and optimization. -->
自 2002 年起，我对图形非常感兴趣，并且已经完成了一系列的工作，包括：雾、大气雾霾、体积照明、水、视觉效果、粒子系统、皮肤和头发阴影、后处理、镜面模型、线性空间渲染、和 GPU 性能测量和优化。

<!-- You can read about what I’m up to on my blog. In addition to graphics, I’m interested in theoretical physics, and in programming language design. -->
你可以在我的博客了解更多和我有关的事，处理图形，我还对理论物理和程序设计感兴趣。

<!-- You can contact me at nathaniel dot reed at gmail dot com, or follow me on Twitter (@Reedbeta) or Google+. I can also often be found answering questions at Computer Graphics StackExchange. -->
你可以在 nathaniel.reed@gmail.com 或者在 Twitter（@Reedbeta)/Google+ 上关注我。我也会经常在 StackExchange 上回答计算机图形的问题。

--------------

via: http://reedbeta.com/blog/data-oriented-hash-table/

作者：[Nathan Reed][a]
译者：[sanfusu](https://github.com/sanfusu)
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
