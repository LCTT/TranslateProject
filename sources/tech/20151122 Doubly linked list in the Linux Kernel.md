Data Structures in the Linux Kernel——Doubly linked list
================================================================================

双向链表
--------------------------------------------------------------------------------

Linux kernel provides its own implementation of doubly linked list, which you can find in the [include/linux/list.h](https://github.com/torvalds/linux/blob/master/include/linux/list.h). We will start `Data Structures in the Linux kernel` from the doubly linked list data structure. Why? Because it is very popular in the kernel, just try to [search](http://lxr.free-electrons.com/ident?i=list_head)
Linux 内核自己实现了双向链表，可以在[include/linux/list.h](https://github.com/torvalds/linux/blob/master/include/linux/list.h)找到定义。我们将会从双向链表数据结构开始`内核的数据结构`。为什么？因为它在内核里使用的很广泛，你只需要在[free-electrons.com](http://lxr.free-electrons.com/ident?i=list_head) 检索一下就知道了。

First of all, let's look on the main structure in the [include/linux/types.h](https://github.com/torvalds/linux/blob/master/include/linux/types.h):
首先让我们看一下在[include/linux/types.h](https://github.com/torvalds/linux/blob/master/include/linux/types.h) 里的主结构体：

```C
struct list_head {
	struct list_head *next, *prev;
};
```

You can note that it is different from many implementations of doubly linked list which you have seen. For example, this doubly linked list structure from the [glib](http://www.gnu.org/software/libc/) library looks like :
你可能注意到这和你以前见过的双向链表的实现方法是不同的。举个例子来说，在[glib](http://www.gnu.org/software/libc/)  库里是这样实现的：

```C
struct GList {
  gpointer data;
  GList *next;
  GList *prev;
};
```

Usually a linked list structure contains a pointer to the item. The implementation of linked list in Linux kernel does not. So the main question is - `where does the list store the data?`. The actual implementation of linked list in the kernel is - `Intrusive list`. An intrusive linked list does not contain data in its nodes - A node just contains pointers to the next and previous node and list nodes part of the data that are added to the list. This makes the data structure generic, so it does not care about entry data type anymore.
通常来说一个链表会包含一个指向某个项目的指针。但是内核的实现并没有这样做。所以问题来了：`链表在哪里保存数据呢？`。实际上内核里实现的链表实际上是`侵入式链表`。侵入式链表并不在节点内保存数据-节点仅仅包含指向前后节点的指针，然后把数据是附加到链表的。这就使得这个数据结构是通用的，使用起来就不需要考虑节点数据的类型了。

For example:
比如：

```C
struct nmi_desc {
    spinlock_t lock;
    struct list_head head;
};
```

Let's look at some examples to understand how `list_head` is used in the kernel. As I already wrote about, there are many, really many different places where lists are used in the kernel. Let's look for an example in miscellaneous character drivers. Misc character drivers API from the [drivers/char/misc.c](https://github.com/torvalds/linux/blob/master/drivers/char/misc.c) is used for writing small drivers for handling simple hardware or virtual devices. Those drivers share same major number:
让我们看几个例子来理解一下在内核里是如何使用`list_head` 的。如上所述，在内核里有实在很多不同的地方用到了链表。我们来看一个在杂项字符驱动里面的使用的例子。在 [drivers/char/misc.c](https://github.com/torvalds/linux/blob/master/drivers/char/misc.c) 的杂项字符驱动API 被用来编写处理小型硬件和虚拟设备的小驱动。这些驱动共享相同的主设备号：

```C
#define MISC_MAJOR              10
```

but have their own minor number. For example you can see it with:
但是都有各自不同的次设备号。比如：

```
ls -l /dev |  grep 10
crw-------   1 root root     10, 235 Mar 21 12:01 autofs
drwxr-xr-x  10 root root         200 Mar 21 12:01 cpu
crw-------   1 root root     10,  62 Mar 21 12:01 cpu_dma_latency
crw-------   1 root root     10, 203 Mar 21 12:01 cuse
drwxr-xr-x   2 root root         100 Mar 21 12:01 dri
crw-rw-rw-   1 root root     10, 229 Mar 21 12:01 fuse
crw-------   1 root root     10, 228 Mar 21 12:01 hpet
crw-------   1 root root     10, 183 Mar 21 12:01 hwrng
crw-rw----+  1 root kvm      10, 232 Mar 21 12:01 kvm
crw-rw----   1 root disk     10, 237 Mar 21 12:01 loop-control
crw-------   1 root root     10, 227 Mar 21 12:01 mcelog
crw-------   1 root root     10,  59 Mar 21 12:01 memory_bandwidth
crw-------   1 root root     10,  61 Mar 21 12:01 network_latency
crw-------   1 root root     10,  60 Mar 21 12:01 network_throughput
crw-r-----   1 root kmem     10, 144 Mar 21 12:01 nvram
brw-rw----   1 root disk      1,  10 Mar 21 12:01 ram10
crw--w----   1 root tty       4,  10 Mar 21 12:01 tty10
crw-rw----   1 root dialout   4,  74 Mar 21 12:01 ttyS10
crw-------   1 root root     10,  63 Mar 21 12:01 vga_arbiter
crw-------   1 root root     10, 137 Mar 21 12:01 vhci
```

Now let's have a close look at how lists are used in the misc device drivers. First of all, let's look on `miscdevice` structure:
现在让我们看看它是如何使用链表的。首先看一下结构体`miscdevice`：

```C
struct miscdevice
{
      int minor;
      const char *name;
      const struct file_operations *fops;
      struct list_head list;
      struct device *parent;
      struct device *this_device;
      const char *nodename;
      mode_t mode;
};
```

We can see the fourth field in the `miscdevice` structure - `list` which is a list of registered devices. In the beginning of the source code file we can see the definition of misc_list:
可以看到结构体的第四个变量`list` 是所有注册过的设备的链表。在源代码文件的开始可以看到这个链表的定义：

```C
static LIST_HEAD(misc_list);
```

which expands to the definition of variables with `list_head` type:
它实际上是对用`list_head` 类型定义的变量的扩展。

```C
#define LIST_HEAD(name) \
	struct list_head name = LIST_HEAD_INIT(name)
```

and initializes it with the `LIST_HEAD_INIT` macro, which sets previous and next entries with the address of variable - name:
然后使用宏`LIST_HEAD_INIT` 进行初始化，这会使用变量`name` 的地址来填充`prev`和`next` 结构体的两个变量。

```C
#define LIST_HEAD_INIT(name) { &(name), &(name) }
```

Now let's look on the `misc_register` function which registers a miscellaneous device. At the start it initializes `miscdevice->list` with the `INIT_LIST_HEAD` function:
现在来看看注册杂项设备的函数`misc_register`。它在开始就用 `INIT_LIST_HEAD` 初始化了`miscdevice->list`。

```C
INIT_LIST_HEAD(&misc->list);
```

which does the same as the `LIST_HEAD_INIT` macro:
作用和宏`LIST_HEAD_INIT`一样。

```C
static inline void INIT_LIST_HEAD(struct list_head *list)
{
	list->next = list;
	list->prev = list;
}
```

In the next step after a device is created by the `device_create` function, we add it to the miscellaneous devices list with:
在函数`device_create` 创建了设备后我们就用下面的语句将设备添加到设备链表：

```
list_add(&misc->list, &misc_list);
```

Kernel `list.h` provides this API for the addition of a new entry to the list. Let's look at its implementation:
内核文件`list.h` 提供了项链表添加新项的API 接口。我们来看看它的实现：


```C
static inline void list_add(struct list_head *new, struct list_head *head)
{
	__list_add(new, head, head->next);
}
```

It just calls internal function `__list_add` with the 3 given parameters:
实际上就是使用3个指定的参数来调用了内部函数`__list_add`：

* new  - 新项。
* head - 新项将会被添加到`head`之前.
* head->next - `head` 之后的项。

Implementation of the `__list_add` is pretty simple:
`__list_add`的实现非常简单：

```C
static inline void __list_add(struct list_head *new,
			      struct list_head *prev,
			      struct list_head *next)
{
	next->prev = new;
	new->next = next;
	new->prev = prev;
	prev->next = new;
}
```

Here we add a new item between `prev` and `next`. So `misc` list which we defined at the start with the `LIST_HEAD_INIT` macro will contain previous and next pointers to the `miscdevice->list`.
我们会在`prev`和`next` 之间添加一个新项。所以我们用宏`LIST_HEAD_INIT`定义的`misc` 链表会包含指向`miscdevice->list` 的向前指针和向后指针。

There is still one question: how to get list's entry. There is a special macro:
这里有一个问题：如何得到列表的内容呢？这里有一个特殊的宏：

```C
#define list_entry(ptr, type, member) \
	container_of(ptr, type, member)
```

which gets three parameters:
使用了三个参数：

* ptr - 指向链表头的指针；
* type - 结构体类型;
* member - 在结构体内类型为`list_head` 的变量的名字；

For example:
比如说：

```C
const struct miscdevice *p = list_entry(v, struct miscdevice, list)
```

After this we can access to any `miscdevice` field with `p->minor` or `p->name` and etc... Let's look on the `list_entry` implementation:
然后我们就可以使用`p->minor` 或者 `p->name`来访问`miscdevice`。让我们来看看`list_entry` 的实现：
 
```C
#define list_entry(ptr, type, member) \
	container_of(ptr, type, member)
```

As we can see it just calls `container_of` macro with the same arguments. At first sight, the `container_of` looks strange:
如我们所见，它仅仅使用相同的参数调用了宏`container_of`。初看这个宏挺奇怪的：

```C
#define container_of(ptr, type, member) ({                      \
    const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
    (type *)( (char *)__mptr - offsetof(type,member) );})
```

First of all you can note that it consists of two expressions in curly brackets. The compiler will evaluate the whole block in the curly braces and use the value of the last expression.
首先你可以注意到花括号内包含两个表达式。编译器会执行花括号内的全部语句，然后返回最后的表达式的值。

For example:
举个例子来说：

```
#include <stdio.h>

int main() {
	int i = 0;
	printf("i = %d\n", ({++i; ++i;}));
	return 0;
}
```

will print `2`.
最终会打印`2`

The next point is `typeof`, it's simple. As you can understand from its name, it just returns the type of the given variable. When I first saw the implementation of the `container_of` macro, the strangest thing I found was the zero in the `((type *)0)` expression. Actually this pointer magic calculates the offset of the given field from the address of the structure, but as we have `0` here, it will be just a zero offset along with the field width. Let's look at a simple example:
下一点就是`typeof`,它也很简单。就如你从名字所理解的，它仅仅返回了给定变量的类型。当我第一次看到宏`container_of`的实现时，让我觉得最奇怪的就是`container_of`中的0.实际上这个指针巧妙的计算了从结构体特定变量的偏移，这里的`0`刚好就是位宽里的零偏移。让我们看一个简单的例子：

```C
#include <stdio.h>

struct s {
        int field1;
        char field2;
	 char field3;
};

int main() {
	printf("%p\n", &((struct s*)0)->field3);
	return 0;
}
```

will print `0x5`.
结果显示`0x5`。

The next `offsetof` macro calculates offset from the beginning of the structure to the given structure's field. Its implementation is very similar to the previous code:
下一个宏`offsetof`  会计算从结构体的某个变量的相对于结构体起始地址的偏移。它的实现和上面类似：

```C
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
```

Let's summarize all about `container_of` macro. The `container_of` macro returns the address of the structure by the given address of the structure's field with `list_head` type, the name of the structure field with `list_head` type and type of the container structure. At the first line this macro declares the `__mptr` pointer which points to the field of the structure that `ptr` points to and assigns `ptr` to it. Now `ptr` and `__mptr` point to the same address. Technically we don't need this line but it's useful for type checking. The first line ensures that the given structure (`type` parameter) has a member called `member`. In the second line it calculates offset of the field from the structure with the `offsetof` macro and subtracts it from the structure address. That's all.
现在我们来总结一下宏`container_of`。只需要知道结构体里面类型为`list_head` 的变量的名字和结构体容器的类型，它可以通过结构体的变量`list_head`获得结构体的起始地址。在宏定义的第一行，声明了一个指向结构体成员变量`ptr`的指针`__mptr`，并且把`ptr` 的地址赋给它。现在`ptr` 和`__mptr` 指向了同一个地址。从技术上讲我们并不需要这一行，但是它可以方便的进行类型检查。第一行保证了特定的结构体（参数`type`）包含成员变量`member`。第二行代码会用宏`offsetof`计算成员变量相对于结构体起始地址的偏移，然后从结构体的地址减去这个偏移，最后就得到了结构体。

Of course `list_add` and `list_entry` is not the only functions which `<linux/list.h>` provides. Implementation of the doubly linked list provides the following API:
当然了`list_add` 和 `list_entry`不是`<linux/list.h>`提供的唯一功能。双向链表的实现还提供了如下API：

* list_add
* list_add_tail
* list_del
* list_replace
* list_move
* list_is_last
* list_empty
* list_cut_position
* list_splice
* list_for_each
* list_for_each_entry

and many more.
等等很多。

via: https://github.com/0xAX/linux-insides/edit/master/DataStructures/dlist.md

译者：[Ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
