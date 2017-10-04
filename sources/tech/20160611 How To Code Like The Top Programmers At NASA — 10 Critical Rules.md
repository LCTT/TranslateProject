How To Code Like The Top Programmers At NASA — 10 Critical Rules
============================================================

  _**[![rules of coding nasa](http://fossbytes.com/wp-content/uploads/2016/06/rules-of-coding-nasa.jpg)][1] Short Bytes:** Do you know how top programmers write mission-critical code at NASA? To make such code clearer, safer, and easier to understand, NASA’s Jet Propulsion Laboratory has laid 10 rules for developing software._ 

The developers at NASA have one of the most challenging jobs in the programming world. They write code and develop mission-critical applications with safety as their primary concerns.

In such situations, it’s important to follow some serious coding guidelines. These rules cover different aspects of software development like how a software should be written, which language features should be used etc.

Even though it’s difficult to establish a consensus over a good coding standard, NASA’s Jet Propulsion Laboratory (JPL) follows a set of [guidelines of code][2] named “The Power of Ten–Rules for Developing Safety Critical Code”.

This guide focuses mainly on code written in C programming languages due to JPL’s long association with the language. But, these guidelines could be easily applied on other programming languages as well.

Laid by JPL lead scientist Gerard J. Holzmann, these strict coding rules focus on security.

[][3]

NASA’s 10 rules for writing mission-critical code:

1.  _Restrict all code to very simple control flow constructs – do not use goto statements, setjmp or longjmp _ constructs _, and direct or indirect recursion._ 

2.  _All loops must have a fixed_   _upper-bound. It must be trivially possible for a checking tool to prove statically that a preset upper-bound on the number of iterations of a loop cannot be exceeded. If the loop-bound cannot be proven statically, the rule is considered violated._ 

3.  _Do not use dynamic memory allocation after initialization._ 

4.  _No function should be longer than what can be printed on a single sheet of paper in a standard reference format with one line per statement and one line per declaration. Typically, this means no more than about 60 lines of code per function._ 

5.  _The assertion density of the code should average to a minimum of two assertions per function. Assertions are used to check for anomalous conditions that should never happen in real-life executions. Assertions must always be side-effect free and should be defined as Boolean tests. When an assertion fails, an explicit recovery action must be taken, e.g., by returning an error condition to the caller of the function that executes the failing assertion. Any assertion for which a static checking tool can prove that it can never fail or never hold violates this rule (I.e., it is not possible to satisfy the rule by adding unhelpful “assert(true)” statements)._ 

6.  _Data objects must be declared at the smallest possible level of scope._ 

7.  _The return value of non-void functions must be checked by each calling function, and the validity of parameters must be checked inside each function._ 

8.  _The use of the preprocessor must be limited to the inclusion of header files and simple macro definitions. Token pasting, variable argument lists (ellipses), and recursive macro calls are not allowed. All macros must expand into complete syntactic units. The use of conditional compilation directives is often also dubious, but cannot always be avoided. This means that there should rarely be justification for more than one or two conditional compilation directives even in large software development efforts, beyond the standard boilerplate that avoids multiple inclusion of the same header file. Each such use should be flagged by a tool-based checker and justified in the code._ 

9.  _The use of pointers should be restricted. Specifically, no more than one level of dereferencing is allowed. Pointer dereference operations may not be hidden in macro definitions or inside typedef declarations. Function pointers are not permitted._ 

10.  _All code must be compiled, from the first day of development, with all compiler warnings enabled at the compiler’s most pedantic setting. All code must compile with these setting without any warnings. All code must be checked daily with at least one, but preferably more than one, state-of-the-art static source code analyzer and should pass the analyses with zero warnings._ 

About these rules, here’s what NASA has to say:

The rules act like the seatbelt in your car: initially they are perhaps a little uncomfortable, but after a while their use becomes second-nature and not using them becomes unimaginable.

[Source][4]

Did you find this article helpful? Don’t forget to drop your feedback in the comments section below.

--------------------------------------------------------------------------------

作者简介：

Adarsh Verma
Fossbytes co-founder and an aspiring entrepreneur who keeps a close eye on open source, tech giants, and security. Get in touch with him by sending an email — adarsh.verma@fossbytes.com

------------------

via: https://fossbytes.com/nasa-coding-programming-rules-critical/

作者：[Adarsh Verma ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fossbytes.com/author/adarsh/
[1]:http://fossbytes.com/wp-content/uploads/2016/06/rules-of-coding-nasa.jpg
[2]:http://pixelscommander.com/wp-content/uploads/2014/12/P10.pdf
[3]:https://fossbytes.com/wp-content/uploads/2016/12/learn-to-code-banner-ad-content-1.png
[4]:http://pixelscommander.com/wp-content/uploads/2014/12/P10.pdf
