C语言数据类型是如何被大多数计算机系统所支持？
========================

###问题：

在读K&R版的*The C Programming Language*一书时，我在[介绍，第3页]看到这样一条说明：

>**因为C语言提供的数据类型和控制结构可以直接被大部分计算机系统所支持，所以在实现自包含程序时所需要的运行库文件一般很小。**

这段黑体说明了什么？能否找到一个例子来说明C语言中的某种数据类型或控制结构不被某种计算机系统直接支持呢？

###回答:

事实上，C语言中确实有不被直接支持的数据类型。

在许多嵌入式系统中，硬件上并没有浮点运算单元。因此，如果你写出下面的代码：

```C
float x = 1.0f, y = 2.0f;
return x + y;
```

可能会被转化成下面这种形式：

```C
unsigned x = 0x3f800000, y = 0x40000000;
return _float_add(x, y);
```

然后编译器或标准库必须提供'_float_add()'的具体实现，这会占用嵌入式系统的内存空间。依此去计算代码在某个微型系统（译者注：也就是指微型嵌入式系统）的实际字节数，也会发现有所增加。

另一个常见的例子是64位整型数（C语言标准中'long long'类型是1999年之后才出现的），这种类型在32位系统上也不能直接使用。古董级的SPARC系统则不支持整型乘法，所以在运行时必须提供乘法的实现。当然，还有一些其它例子。

####其它语言

相比起来，其它编程语言有更加复杂的基本类型。

比如，Lisp中的symbol需要大量的运行时实现支持，就像Lua中的table、Python中的string、Fortran中的array，等等。在C语言中等价的类型通常要么不属于标准库（C语言没有标准symbol或table），要么更加简单，而且并不需要那么多的运行时支持（C语言中的array基本上就是指针，以NULL结尾的字符串实现起来也很简单）。

####控制结构

异常处理是C语言中没有的一种控制结构。非局部的退出只有'setjmp()'和'longjmp()'两种，只能提供保存和恢复某些部分的处理器状态。相比之下，C++运行时环境必须先遍历函数调用栈，然后调用析构函数和异常处理函数。

----
via:[stackoverflow](http://stackoverflow.com/questions/27977522/how-are-c-data-types-supported-directly-by-most-computers/27977605#27977605)

作者：[Dietrich Epp][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://stackoverflow.com/users/82294/dietrich-epp