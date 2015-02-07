translating by KayGuoWhu
How are C data types “supported directly by most computers”?
---------

#Q:

I am reading K&R's *The C Programming Language*” and came across this statement [Introduction, p. 3]:

>Because the data types and control structures provided by C are supported directly by most computers, the run-time library required to implement self-contained programs is tiny.

What does the bolded statement mean? Is there an example of a data type or a control structure that isn't supported directly by a computer?

#A:

Yes, there are data types not directly supported.

On many embedded systems, there is no hardware floating point unit. So, when you write code like this:

```C
float x = 1.0f, y = 2.0f;
return x + y;
```

It gets translated into something like this:

```C
unsigned x = 0x3f800000, y = 0x40000000;
return _float_add(x, y);
```

Then the compiler or standard library has to supply an implementation of `_float_add()`, which takes up memory on your embedded system. If you're counting bytes on a really tiny system, this can add up.

Another common example is 64-bit integers (`long long` in the C standard since 1999), which are not directly supported by 32-bit systems. Old SPARC systems didn't support integer multiplication, so multiplication had to be supplied by the runtime. There are other examples.

##Other languages

By comparison, other languages have more complicated primitives.

For example, a Lisp symbol requires a lot of runtime support, just like tables in Lua, strings in Python, arrays in Fortran, et cetera. The equivalent types in C are usually either not part of the standard library at all (no standard symbols or tables) or they are much simpler and don't require much runtime support (arrays in C are basically just pointers, nul-terminated strings are almost as simple).

##Control structures

A notable control structure missing from C is exception handling. Nonlocal exit is limited to `setjmp()` and `longjmp()`, which just save and restore certain parts of processor state. By comparison, the C++ runtime has to walk the stack and call destructors and exception handlers.

----
via:[stackoverflow](http://stackoverflow.com/questions/27977522/how-are-c-data-types-supported-directly-by-most-computers/27977605#27977605)

作者：[Dietrich Epp][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://stackoverflow.com/users/82294/dietrich-epp