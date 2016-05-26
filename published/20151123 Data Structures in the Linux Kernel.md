Linux 内核里的数据结构 —— 基数树
================================================================================

基数树 Radix tree
--------------------------------------------------------------------------------
正如你所知道的，Linux内核提供了许多不同的库和函数，它们实现了不同的数据结构和算法。在这部分，我们将研究其中一种数据结构——[基数树 Radix tree](http://en.wikipedia.org/wiki/Radix_tree)。在 Linux 内核中，有两个文件与基数树的实现和API相关：

* [include/linux/radix-tree.h](https://github.com/torvalds/linux/blob/master/include/linux/radix-tree.h)
* [lib/radix-tree.c](https://github.com/torvalds/linux/blob/master/lib/radix-tree.c)

让我们先说说什么是 `基数树` 吧。基数树是一种 `压缩的字典树 (compressed trie)` ，而[字典树](http://en.wikipedia.org/wiki/Trie)是实现了关联数组接口并允许以 `键值对` 方式存储值的一种数据结构。这里的键通常是字符串，但可以使用任意数据类型。字典树因为它的节点而与 `n叉树` 不同。字典树的节点不存储键，而是存储单个字符的标签。与一个给定节点关联的键可以通过从根遍历到该节点获得。举个例子：

```
               +-----------+
               |           |
               |    " "    |
               |           |
        +------+-----------+------+
        |                         |
        |                         |
   +----v------+            +-----v-----+
   |           |            |           |
   |    g      |            |     c     |
   |           |            |           |
   +-----------+            +-----------+
        |                         |
        |                         |
   +----v------+            +-----v-----+
   |           |            |           |
   |    o      |            |     a     |
   |           |            |           |
   +-----------+            +-----------+
                                  |
                                  |
                            +-----v-----+
                            |           |
                            |     t     |
                            |           |
                            +-----------+
```

因此在这个例子中，我们可以看到一个有着两个键 `go` 和 `cat` 的 `字典树` 。压缩的字典树也叫做 `基数树` ，它和 `字典树` 的不同之处在于，所有只有一个子节点的中间节点都被删除。

Linux 内核中的基数树是把值映射到整形键的一种数据结构。[include/linux/radix-tree.h](https://github.com/torvalds/linux/blob/master/include/linux/radix-tree.h)文件中的以下结构体描述了基数树：

```C
struct radix_tree_root {
         unsigned int            height;
         gfp_t                   gfp_mask;
         struct radix_tree_node  __rcu *rnode;
};
```

这个结构体描述了一个基数树的根，它包含了3个域成员：

* `height`   - 树的高度;
* `gfp_mask` - 告知如何执行动态内存分配;
* `rnode`    - 孩子节点指针.

我们第一个要讨论的字段是 `gfp_mask` ：

底层内核的内存动态分配函数以一组标志作为 `gfp_mask` ，用于描述如何执行动态内存分配。这些控制分配进程的 `GFP_` 标志拥有以下值：( `GF_NOIO` 标志)意味着睡眠以及等待内存，( `__GFP_HIGHMEM` 标志)意味着高端内存能够被使用，( `GFP_ATOMIC` 标志)意味着分配进程拥有高优先级并不能睡眠等等。

* `GFP_NOIO` - 睡眠等待内存
* `__GFP_HIGHMEM` - 高端内存能够被使用;
* `GFP_ATOMIC` - 分配进程拥有高优先级并且不能睡眠;

等等。

下一个字段是`rnode`：

```C
struct radix_tree_node {
        unsigned int    path;
        unsigned int    count;
        union {
                struct {
                        struct radix_tree_node *parent;
                        void *private_data;
                };
                struct rcu_head rcu_head;
        };
        /* For tree user */
        struct list_head private_list;
        void __rcu      *slots[RADIX_TREE_MAP_SIZE];
        unsigned long   tags[RADIX_TREE_MAX_TAGS][RADIX_TREE_TAG_LONGS];
};
```
这个结构体包含的信息有父节点中的偏移以及到底端(叶节点)的高度、子节点的个数以及用于访问和释放节点的字段成员。这些字段成员描述如下：

* `path` - 父节点中的偏移和到底端(叶节点)的高度 
* `count` - 子节点的个数;
* `parent` - 父节点指针;
* `private_data` - 由树的用户使用;
* `rcu_head` - 用于释放节点;
* `private_list` - 由树的用户使用;

`radix_tree_node` 的最后两个成员—— `tags` 和 `slots` 非常重要且令人关注。Linux 内核基数树的每个节点都包含了一组指针槽( slots )，槽里存储着指向数据的指针。在Linux内核基数树的实现中，空槽存储的是 `NULL` 。Linux内核中的基数树也支持标签( tags )，它与 `radix_tree_node` 结构体的 `tags` 字段相关联。有了标签，我们就可以对基数树中存储的记录以单个比特位( bit )进行设置。

既然我们了解了基数树的结构，那么该是时候看一下它的API了。

Linux内核基数树API
---------------------------------------------------------------------------------

我们从结构体的初始化开始。有两种方法初始化一个新的基数树。第一种是使用 `RADIX_TREE` 宏：

```C
RADIX_TREE(name, gfp_mask);
````

正如你所看到的，我们传递了 `name` 参数，所以通过 `RADIX_TREE` 宏，我们能够定义和初始化基数树为给定的名字。`RADIX_TREE` 的实现很简单：

```C
#define RADIX_TREE(name, mask) \
         struct radix_tree_root name = RADIX_TREE_INIT(mask)

#define RADIX_TREE_INIT(mask)   { \
        .height = 0,              \
        .gfp_mask = (mask),       \
        .rnode = NULL,            \
}
```

在 `RADIX_TREE` 宏的开始，我们使用给定的名字定义 `radix_tree_root` 结构体实例，并使用给定的 mask 调用 `RADIX_TREE_INIT` 宏。 而 `RADIX_TREE_INIT` 宏则是使用默认值和给定的mask对 `radix_tree_root` 结构体进行了初始化。

第二种方法是手动定义`radix_tree_root`结构体，并且将它和mask传给 `INIT_RADIX_TREE` 宏：

```C
struct radix_tree_root my_radix_tree;
INIT_RADIX_TREE(my_tree, gfp_mask_for_my_radix_tree);
```

`INIT_RADIX_TREE` 宏的定义如下:

```C
#define INIT_RADIX_TREE(root, mask)  \
do {                                 \
        (root)->height = 0;          \
        (root)->gfp_mask = (mask);   \
        (root)->rnode = NULL;        \
} while (0)
```

和`RADIX_TREE_INIT`宏所做的初始化工作一样，`INIT_RADIX_TREE` 宏使用默认值和给定的 mask 完成初始化工作。

接下来是用于向基数树插入和删除数据的两个函数：

* `radix_tree_insert`;
* `radix_tree_delete`;

第一个函数 `radix_tree_insert` 需要3个参数：

* 基数树的根;
* 索引键;
* 插入的数据;

`radix_tree_delete` 函数需要和 `radix_tree_insert` 一样的一组参数，但是不需要传入要删除的数据。

基数树的搜索以两种方法实现：

* `radix_tree_lookup`;
* `radix_tree_gang_lookup`;
* `radix_tree_lookup_slot`.

第一个函数`radix_tree_lookup`需要两个参数：

* 基数树的根;
* 索引键;

这个函数尝试在树中查找给定的键，并返回和该键相关联的记录。第二个函数 `radix_tree_gang_lookup` 有以下的函数签名：

```C
unsigned int radix_tree_gang_lookup(struct radix_tree_root *root,
                                    void **results,
                                    unsigned long first_index,
                                    unsigned int max_items);
```

它返回的是记录的个数。 `results` 中的结果，按键排序，并从第一个索引开始。返回的记录个数将不会超过 `max_items` 的值。

最后一个函数`radix_tree_lookup_slot`将会返回包含数据的指针槽。

链接
---------------------------------------------------------------------------------

* [Radix tree](http://en.wikipedia.org/wiki/Radix_tree)
* [Trie](http://en.wikipedia.org/wiki/Trie)

--------------------------------------------------------------------------------

via: https://github.com/0xAX/linux-insides/blob/master/DataStructures/radix-tree.md

作者：0xAX
译者：[cposture](https://github.com/cposture)
校对：[Mr小眼儿](https://github.com/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

