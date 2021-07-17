[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13498-1.html)
[#]: subject: (A friendly guide to the syntax of C++ method pointers)
[#]: via: (https://opensource.com/article/21/2/ccc-method-pointers)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)

C++ 类成员函数指针语法的友好指南
======

> 一旦你理解了一般原则，C++ 类成员函数指针不再那么令人生畏。

![](https://img.linux.net.cn/data/attachment/album/202106/18/104200rm48h22eghehg2p3.jpg)

如果你正在寻找性能、复杂性或许多可能的解决方法来解决问题，那么在涉及到极端的情况下，[C++][2] 总是一个很好的选择。当然，功能通常伴随着复杂性，但是一些 C++ 的特性几乎难以分辨。根据我的观点，C++ 的 [类成员函数指针][3] 也许是我接触过的最复杂的表达式，但是我会先从一些较简单的开始。

文章中的例子可以在我的 [Github 仓库][4] 里找到。

### C 语言：函数指针

让我们先从一些基础开始：假设你有一个函数接收两个整数作为参数返回一个整数：

```
int sum(int a, int b) {
    return a+b;
}
```

在纯 C 语言中，你可以创建一个指向这个函数的指针，将其分配给你的 `sum(...)` 函数，通过解引用来调用它。函数的签名（参数、返回类型）必须符合指针的签名。除此之外，一个函数指针表现和普通的指针相同：

```
int (*funcPtrOne)(int, int);

funcPtrOne = &sum;

int resultOne = funcPtrOne(2, 5);
```

如果你使用指针作为参数并返回一个指针，这会显得很丑陋：

```
int *next(int *arrayOfInt){
    return ++arrayOfInt;
}

int *(*funcPtrTwo)(int *intPtr);

funcPtrTwo = &next;

int resultTwo = *funcPtrTwo(&array[0]);
```

C 语言中的函数指针存储着子程序的地址。

### 指向类成员函数的指针

让我们来进入 C++：好消息是你也许不需要使用类成员函数指针，除非在一个特别罕见的情况下，比如说接下来的例子。首先，你已经知道定义一个类和其中一个成员函数：

```
class MyClass
{
public:

    int sum(int a, int b) {
        return a+b;
    }

};
```

#### 1、定义一个指针指向某一个类中一个成员函数

声明一个指针指向 `MyClass` 类成员函数。在此时，你并不知道想调用的具体函数。你仅仅声明了一个指向 `MyClass` 类中任意成员函数的指针。当然，签名（参数、返回值类型）需要匹配你接下想要调用的 `sum(...)` 函数：

```
int (MyClass::*methodPtrOne)(int, int);
```

#### 2、赋值给一个具体的函数

为了和 C 语言（或者 [静态成员函数][5]）对比，类成员函数指针不需要指向绝对地址。在 C++ 中，每一个类中都有一个虚拟函数表（vtable）用来储存每个成员函数的地址偏移量。一个类成员函数指针指向 vtable 中的某个条目，因此它也只存储偏移值。这样的原则使得 [多态][6] 变得可行。

因为 `sum(...)` 函数的签名和你的指针声明匹配，你可以赋值签名给它：

```
methodPtrOne = &MyClass::sum;
```

#### 3、调用成员函数

如果你想使用指针调用一个类成员函，你必须提供一个类的实例：

```
MyClass clsInstance;
int result = (clsInstance.*methodPtrOne)(2,3);
```

你可以使用 `.` 操作符来访问，使用 `*` 对指针解引用，通过提供两个整数作为调用函数时的参数。这是丑陋的，对吧？但是你可以进一步应用。

### 在类内使用类成员函数指针

假设你正在创建一个带有后端和前端的 [客户端/服务器][7] 原理架构的应用程序。你现在并不需要关心后端，相反的，你将基于 C++ 类的前端。前端依赖于后端提供的数据完成初始化，所以你需要一个额外的初始化机制。同时，你希望通用地实现此机制，以便将来可以使用其他初始化函数（可能是动态的）来拓展你的前端。

首先定义一个数据类型用来存储初始化函数（`init`）的指针，同时描述何时应调用此函数的信息（`ticks`）：

```
template<typename T>
struct DynamicInitCommand {
    void (T::*init)();     // 指向额外的初始化函数
    unsigned int ticks;    // 在 init() 调用后 ticks 的数量
};
```

下面一个 `Frontend` 类示例代码：

```
class  Frontend
{
public:

    Frontend(){
        DynamicInitCommand<Frontend> init1, init2, init3;

        init1 = { &Frontend::dynamicInit1, 5};
        init2 = { &Frontend::dynamicInit2, 10};
        init3 = { &Frontend::dynamicInit3, 15};

        m_dynamicInit.push_back(init1);
        m_dynamicInit.push_back(init2);
        m_dynamicInit.push_back(init3);
    }
   
    void  tick(){
        std::cout << "tick: " << ++m_ticks << std::endl;
       
        /* 检查延迟初始化 */
        std::vector<DynamicInitCommand<Frontend>>::iterator  it = m_dynamicInit.begin();

        while (it != m_dynamicInit.end()){
            if (it->ticks < m_ticks){
                 
                if(it->init)
                    ((*this).*(it->init))(); // 这里是具体调用

                it = m_dynamicInit.erase(it);

            } else {
                it++;
            }
        }
    }
   
    unsigned  int  m_ticks{0};
   
private:

    void  dynamicInit1(){
        std::cout << "dynamicInit1 called" << std::endl;
    };

    void  dynamicInit2(){
        std::cout << "dynamicInit2 called" << std::endl;
    }

    void  dynamicInit3(){
        std::cout << "dynamicInit3 called" << std::endl;
    }

    unsigned  int  m_initCnt{0};
    std::vector<DynamicInitCommand<Frontend> > m_dynamicInit;
};
```

在 `Frontend` 完成实例化后，`tick()` 函数会被后端以固定的时间时间调用。例如，你可以每 200 毫秒调用一次：

```
int  main(int  argc, char*  argv[]){
    Frontend frontendInstance;

    while(true){
        frontendInstance.tick(); // 仅用于模拟目的
        std::this_thread::sleep_for(std::chrono::milliseconds(200));
    }
}
```

`Fronted` 有三个额外的初始化函数，它们必须根据 `m_ticks` 的值来选择调用哪个。在 ticks 等于何值调用哪个初始化函数的信息存储在数组 `m_dynamicInit` 中。在构造函数（`Frontend()`）中，将此信息附加到数组中，以便在 5、10 和 15 个 tick 后调用其他初始化函数。当后端调用 `tick()` 函数时，`m_ticks` 值会递增，同时遍历数组 `m_dynamicInit` 以检查是否必须调用初始化函数。

如果是这种情况，则必须通过引用 `this` 指针来取消引用成员函数指针：

```
((*this).*(it->init))()
```

### 总结

如果你并不熟悉类成员函数指针，它们可能会显得有些复杂。我做了很多尝试和经历了很多错误，花了一些时间来找到正确的语法。然而，一旦你理解了一般原理后，方法指针就变得不那么可怕了。

这是迄今为止我在 C++ 中发现的最复杂的语法。 你还知道更糟糕的吗？ 在评论中发布你的观点！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/ccc-method-pointers

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://en.wikipedia.org/wiki/C++
[3]: https://en.wikipedia.org/wiki/Function_pointer#Method_pointers
[4]: https://github.com/hANSIc99/worst_possible_syntax
[5]: https://en.wikipedia.org/wiki/Static_(keyword)#Static_method
[6]: https://en.wikipedia.org/wiki/Dynamic_dispatch
[7]: https://en.wikipedia.org/wiki/Client%E2%80%93server_model
