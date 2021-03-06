[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A friendly guide to the syntax of C++ method pointers)
[#]: via: (https://opensource.com/article/21/2/ccc-method-pointers)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)

A friendly guide to the syntax of C++ method pointers
======
Once you understand the general principles, C++ method pointers become
less intimidating.
![Person drinking a hot drink at the computer][1]

If you're looking for performance, complexity, or many possible solutions to solve a problem, [C ++][2] is always a good candidate when it comes to extremes. Of course, functionality usually comes with complexity, but some C++ peculiarities are almost illegible. From my point of view, C++ [method pointers][3] may be the most complex expressions I've ever come across, but I'll start with something simpler.

The examples in this article are available in my [GitHub repository][4].

### C: Pointer to functions

Let's begin with some basics: Assume you have a function that takes two integers as arguments and returns an integer:


```
int sum(int a, intb){
    return a+b;
}
```

In plain C, you can create a pointer to this function, assign it to your `sum(...)` function, and call it by dereferencing. The function's signature (arguments, return type) must comply with the pointer's signature. Aside from that, a function pointer behaves like an ordinary pointer:


```
int (*funcPtrOne)(int, int);

funcPtrOne = &amp;sum;

int resultOne = funcPtrOne(2, 5);
```

It gets a bit uglier if you take a pointer as an argument and return a pointer:


```
int *next(int *arrayOfInt){
    return ++arrayOfInt;
}

int *(*funcPtrTwo)(int *intPtr);

funcPtrTwo = &amp;next;

int resultTwo = *funcPtrTwo(&amp;array[0]);
```

Function pointers in C store the address of a subroutine.

### Pointers to methods

Let's step into C++: The good news is that you probably won't need to use pointers to methods, except in a few rare cases, like the following one. First, define a class with member functions you already know:


```
class MyClass
{
public:

    int sum(int a, int b) {
        return a+b;
    }

};
```

#### 1\. Define a pointer to a method of a certain class type

Declare a pointer to a method of the `MyClass` type. At this point, you don't know the exact method you want to call. You've only declared a pointer to some arbitrary `MyClass` method. Of course, the signature (arguments, return type) matches the `sum(…)` method you want to call later:


```
`int (MyClass::*methodPtrOne)(int, int);`
```

#### 2\. Assign a certain method

In contrast to C (or [static member functions][5]), method pointers don't point to absolute addresses. Each class type in C++ has a virtual method table (vtable) that stores the address offset for each method. A method pointer refers to a certain entry in the vtable, so it also stores only the offset value. This principle also enables [dynamic dispatch][6].

Because the signature of the `sum(…)` method matches your pointer's declaration, you can assign the signature to it:


```
`methodPtrOne = &MyClass::sum;`
```

#### 3\. Invoke the method

If you want to invoke the method with the pointer, you have to provide an instance of the class type:


```
MyClass clsInstance;
int result = (clsInstance.*methodPtrOne)(2,3);
```

You can access the instance with the `.` operator, dereference the pointer with a `*`, and thus call the method by providing two integers as arguments. Ugly, right? But you can still go a step further.

### Using method pointers within a class

Assume you are creating an application with a [client/server][7] principle architecture with a backend and a frontend. You don't care about the backend for now; instead, you will focus on the frontend, which is based on a C++ class. The frontend's complete initialization relies on data provided by the backend, so you need an additional initialization mechanism. Also, you want to implement this mechanism generically so that you can extend your frontend with other initialization methods in the future (maybe dynamically).

First, define a data type that can store a method pointer to an initialization method (`init`) and the information describing when this method should be called (`ticks`):


```
template&lt;typename T&gt;
struct DynamicInitCommand {
    void (T::*init)();     // Pointer to additional initialization method
    unsigned int ticks;    // Number of ticks after init() is called
};
```

Here is what the `Frontend` class looks like:


```
class  Frontend
{
public:

    Frontend(){
        DynamicInitCommand&lt;Frontend&gt; init1, init2, init3;

        init1 = { &amp;Frontend::dynamicInit1, 5};
        init2 = { &amp;Frontend::dynamicInit2, 10};
        init3 = { &amp;Frontend::dynamicInit3, 15};

        m_dynamicInit.push_back(init1);
        m_dynamicInit.push_back(init2);
        m_dynamicInit.push_back(init3);
    }
   
   

    void  tick(){
        std::cout &lt;&lt; "tick: " &lt;&lt; ++m_ticks &lt;&lt; std::endl;
       
        /* Check for delayed initializations */
        std::vector&lt;DynamicInitCommand&lt;Frontend&gt;&gt;::iterator  it = m_dynamicInit.begin();

        while (it != m_dynamicInit.end()){
            if (it-&gt;ticks &lt; m_ticks){
                 
                if(it-&gt;init)
                    ((*this).*(it-&gt;init))(); // here it is

                it = m_dynamicInit.erase(it);

            } else {
                it++;
            }
        }
    }
   
    unsigned  int  m_ticks{0};
   
private:

    void  dynamicInit1(){
        std::cout &lt;&lt; "dynamicInit1 called" &lt;&lt; std::endl;
    };

    void  dynamicInit2(){
        std::cout &lt;&lt; "dynamicInit2 called" &lt;&lt; std::endl;
    }

    void  dynamicInit3(){
        std::cout &lt;&lt; "dynamicInit3 called" &lt;&lt; std::endl;
    }

    unsigned  int  m_initCnt{0};
    std::vector&lt;DynamicInitCommand&lt;Frontend&gt; &gt; m_dynamicInit;
};
```

After `Frontend` is instantiated, the `tick()` method is called at fixed intervals by the backend. For example, you can call it every 200ms:


```
int  main(int  argc, char*  argv[]){
    Frontend frontendInstance;

    while(true){
        frontendInstance.tick(); // just for simulation purpose
        std::this_thread::sleep_for(std::chrono::milliseconds(200));
    }
}
```

`Frontend` has three additional initialization methods that must be called based on the value of `m_ticks`. The information about which initialization method to call at which tick is stored in the vector `m_dynamicInit`. In the constructor (`Frontend()`), append this information to the vector so that the additional initialization functions are called after five, 10, and 15 ticks. When the backend calls the `tick()` method, the value `m_ticks` is incremented, and you iterate over the vector `m_dynamicInit` to check whether an initialization method has to be called.

If this is the case, the method pointer must be dereferenced by referring to `this`:


```
`((*this).*(it->init))()`
```

### Summary

Methods pointers can get a bit complicated if you're not familiar with them. I did a lot of trial and error, and it took time to find the correct syntax. However, once you understand the general principle, method pointers become less terrifying.

This is the most complex syntax I have found in C++ so far. Do you know something even worse? Post it in the comments!

The pros and cons of each, and why you should consider Python for embedded programming.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/ccc-method-pointers

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
