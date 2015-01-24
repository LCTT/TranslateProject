Why does C++ promote an int to a float when a float cannot represent all int values?
---------

#Q:

Say I have the following:

```C
int i = 23;
float f = 3.14;
if (i == f) // do something
```

The i will be promoted to a float and the two float numbers will be compared, but can a float represent all int values? Why not promote both the int and the float to a double?

#A:

When `int` is promoted to `unsigned` in the integral promotions, negative values are also lost (which leads to such fun as `0u < -1` being true).

Like most mechanisms in C (that are inherited in C++), the usual arithmetic conversions should be understood in terms of hardware operations. The makers of C were very familiar with the assembly language of the machines with which they worked, and they wrote C to make immediate sense to themselves and people like themselves when writing things that would until then have been written in assembly (such as the UNIX kernel).

Now, processors, as a rule, do not have mixed-type instructions (add float to double, compare int to float, etc.) because it would be a huge waste of real estate on the wafer -- you'd have to implement as many times more opcodes as you want to support different types. That you only have instructions for "add int to int," "compare float to float", "multiply unsigned with unsigned" etc. makes the usual arithmetic conversions necessary in the first place -- they are a mapping of two types to the instruction family that makes most sense to use with them.

From the point of view of someone who's used to writing low-level machine code, if you have mixed types, the assembler instructions you're most likely to consider in the general case are those that require the least conversions. This is particularly the case with floating points, where conversions are runtime-expensive, and particularly back in the early 1970s, when C was developed, computers were slow, and when floating point calculations were done in software. This shows in the usual arithmetic conversions -- only one operand is ever converted (with the single exception of `long/unsigned int`, where the `long` may be converted to `unsigned long`, which does not require anything to be done on most machines. Perhaps not on any where the exception applies).

So, the usual arithmetic conversions are written to do what an assembly coder would do most of the time: you have two types that don't fit, convert one to the other so that it does. This is what you'd do in assembler code unless you had a specific reason to do otherwise, and to people who are used to writing assembler code and do have a specific reason to force a different conversion, explicitly requesting that conversion is natural. After all, you can simply write

```C
if((double) i < (double) f)
```

It is interesting to note in this context, by the way, that `unsigned` is higher in the hierarchy than `int`, so that comparing `int` with `unsigned` will end in an unsigned comparison (hence the `0u < -1` bit from the beginning). I suspect this to be an indicator that people in olden times considered `unsigned` less as a restriction on `int` than as an extension of its value range: We don't need the sign right now, so let's use the extra bit for a larger value range. You'd use it if you had reason to expect that an `int` would overflow -- a much bigger worry in a world of 16-bit ints.

----
via:[stackoverflow](http://stackoverflow.com/questions/28010565/why-does-c-promote-an-int-to-a-float-when-a-float-cannot-represent-all-int-val/28011249#28011249)

作者：[wintermute][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://stackoverflow.com/users/4301306/wintermute