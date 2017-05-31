ucasFL translating
5 reasons the D programming language is a great choice for development
============================================================

### D's modeling, productivity, readability, and other features make it a good fit for collaborative software development.


![Why the D programming language is great for open source development](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/code_development_programming.png?itok=eYK4UXiq "Why the D programming language is great for open source development")
>Image by : opensource.com

The [D programming language][8] is a statically typed, general purpose programming language with C-like syntax that compiles to native code. It's a good fit in open source software development for many reasons; here are some of them.

### Modeling power

It's not uncommon to find yourself in a situation where you have an idea and you want to implement it in code exactly the way you are thinking about it in your mind. However, sometimes you have to compromise the idea to fit the code, instead of modeling the code to fit the idea. D supports several [programming paradigms][9], including functional style, imperative, object oriented, metaprogramming, and concurrent (actor model), all harmoniously integrated. You have the option to choose whichever paradigm is convenient for modeling code to fit your idea.

Programming and development

*   [New Python content][1]

*   [Our latest JavaScript articles][2]

*   [Recent Perl posts][3]

*   [Red Hat Developers Blog][4]

By using [templates][10], a feature to generate additional D code and weave it in during compilation, you can describe code as a pattern for the compiler to generate the code. This is especially useful for designing algorithms without tying them to specific types. Platform-agnostic code becomes easy with the generic nature of templates. By combining templates with [conditional compilation][11], cross-platform apps become much easier to implement and are more likely to receive contributions from developers using different operating systems. With this, a single programmer can achieve a lot with less code and limited time.

[Ranges][12], deeply integrated into D, abstract how container elements (e.g., arrays, associative arrays, linked lists, etc.) are accessed as opposed to an actual implementation. This abstraction enables the design and use of a great number of algorithms over a great number of container types without tying them to a specific data structure. D's [array slicing][13] is an implementation of a range. In the end, you write less code in less time and have lower maintenance costs.

### Productivity

Most code contributors to open source software work on a voluntary basis with limited time. D allows you be more productive because you can do more in less time. Templates and ranges in D make programmers more productive as they write generic and reusable code, but those are only a couple of D's strengths in terms of productivity. Another main appeal is that D's compilation speed feels like interpreted languages such as Python, JavaScript, Ruby, and PHP, making D good for quick prototyping.

D can easily interface with legacy code, alleviating the need to port. It was designed to make [interfacing directly with C code][14] natural: After all, C is the master of legacy, well-written and tested code, libraries, and low-level system calls (especially in Linux). C++ code is also [callable in D][15] to a greater extent. In fact, [Python][16], [Objective-C][17], [Lua][18], and [Fortran][19] are some of the languages that are technically usable in D, and there are a number of third-party efforts pushing D in those areas. This makes the huge number of open source libraries usable in D code, which aligns with conventions of open source software development.

### Readable and maintainable

```
import std.stdio; // import standard I/O module
void main()
{
    writeln("Hello, World!");
}
```

HelloWorld demo in D

D code is easy to understand by anyone familiar with C-like programming languages. Moreover, D is very readable, even for sophisticated code, which makes bugs easy to spot. Readability is also critical for engaging contributors, which is key to the growth of open source software.

One simple but very useful [syntactic sugar][20] in D is support for using an underscore to separate numbers, making them more readable. This is especially useful for math:

```
int count = 100_000_000;
double price = 20_220.00 + 10.00;
int number = 0x7FFF_FFFF; // in hexadecimal system
```

[Ddoc][21], a built-in tool, makes it easy to automatically generate documentation out of code comments without the need for an external tool. Documentation becomes less challenging to write, improve, and update as it goes side by side with the code.

[Contracts][22] are checks put in place to ensure D code behaves exactly as expected. Just like legal contracts are signed to ensure each party does their part in an agreement, contract programming in D ensures that the implementation of a function, class, etc. always produces the desired results or behaves as expected. Such a feature is practically useful for bug checks, especially in open source software where several people collaborate on a project. Contracts can be a lifesaver for large projects. D's powerful contract programming features are built-in rather than added as an afterthought. Contracts not only add to the convenience of using D but also make writing correct and maintainable code less of a headache.

### Convenient

Collaborative development can be challenging, as code is frequently changing and has many moving parts. D alleviates some of these issues, with support for importing modules locally within a scope:

```
// returns even numbers
int[] evenNumbers(int[] numbers)
{
    // "filter" and "array" are only accessible locally
    import std.algorithm: filter; 
    import std.array: array;
    return numbers.filter!(n => n%2 == 0).array;
}
```

The "!" operator used with **filter** is the syntax of a [template argument][5].

The function above can be tossed around without breaking code because it does not rely on any globally imported module. Any function implemented like this can be later enhanced without breaking code, which is a good thing for collaborative development.

[Universal Function Call Syntax][23] (UFCS), is a syntactic sugar in D that allows the call of regular functions, like member functions of an object. A function is defined as:

```
void cook(string food, int quantity)
{
    import std.stdio: writeln;
    writeln(food, " in quantity of ", quantity);
}
```

It can be called in the usual way like:

```
string food = "rice";
int quantity = 3;

cook(food, quantity);
```

With UFCS, this same function can be called as if **cook** is a member function:

```
string food = "rice";
int quantity = 3;

food.cook(quantity);
```

During compilation, the compiler automatically places **food** as the first argument to the function **cook**. UFCS makes it possible to **chain** regular functions—giving your code the natural feel of functional style programming. UFCS is heavily used in D, as it was in the case of the **filter** and **array** functions used in the **evenNumbers** function above. Combining templates, ranges, conditional compilation, and UFCS gives you massive power without sacrificing convenience.

The **auto** keyword can be used in place of a type. The compiler will statically infer the type during compilation. This saves you from long type names and makes writing D code feel like a dynamically typed language.

```
// Nope. Do you?
VeryLongTypeHere variable = new VeryLongTypeHere(); 

// using auto keyword
auto variable =  new VeryLongTypeHere();
auto name = "John Doe";
auto age = 12;
auto letter  = 'e';
auto anArray = [1, 2.0, 3, 0, 1.5]; // type of double[]
auto dictionary = ["one": 1, "two": 2, "three": 3]; // type of int[string]
auto cook(string food) {...} // auto for a function return type
```

D's [foreach][24] loop allows looping over collections and ranges of varying underlining data types:

```
foreach(name; ["John", "Yaw", "Paul", "Kofi", "Ama"])
{
    writeln(name);
}

foreach(number; [1, 2, 3, 4, 4, 6]) {...}

foreach(number; 0..10) {...} // 0..10 is the syntax for number range

class Student {...}
Student[] students = [new Student(), new Student()];
foreach(student; students) {...}
```

Built-in [unit test][25] support in D not only alleviates the need for an external tool, but also makes it convenient for programmers to implement tests in their code. All test cases go inside the customizable **unittest {}** block:

```
int[] evenNumbers(int[] numbers)
{
    import std.algorithm: filter; 
    import std.array: array;
    return numbers.filter!(n => n%2 == 0).array;
}

unittest
{
    assert( evenNumbers([1, 2, 3, 4]) == [2, 4] );
}
```

Using DMD, D's reference compiler, you can compile all tests into the resulting executable by adding the **-unittest** compiler flag.

[Dub][26], a built-in package manager and build tool for D, makes it easy to use the increasing number of third-party packages (libraries) from the [Dub package registry][27]. Dub takes care of downloading, compiling, and linking those packages during compilation, as well as upgrading to future versions.

### Choice

In addition to providing several programming paradigms and features, D offers other choices. It currently has three compilers, all open source. The reference compiler, DMD, comes with its own backend, while the other two, GDC and LDC, use GCC and LLVM backends, respectively. DMD is noted for its fast compilation speeds, while LDC and GDC are noted for generating fast machine code at the cost of a little compilation time. You are free to choose whichever fits your use case.

Certain parts of D, when used, are [garbage-collected][28] by default. You can also choose manual memory management or even reference counting if you wish. The choice is all yours.

### And much more

There a several sugars in D that I haven't covered in this brief discussion. I highly recommend you check out [D's feature overview][29], the hidden treasures in the [standard library][30], and [areas of D usage][31] to see more of what people are doing with it. Many organizations are already [using D in production][32]. Finally, if you are ready to start learning D, check out the book  _[Programming in D][6]_ .

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/5/d-open-source-software-development

作者：[Lawrence Aberba][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/aberba
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:http://ddili.org/ders/d.en/templates.html
[6]:http://ddili.org/ders/d.en/index.html
[7]:https://opensource.com/article/17/5/d-open-source-software-development?rate=2NrC12X6cAUXB18h8bLBYUkDmF2GR1nuiAdeMCFCvh8
[8]:https://dlang.org/
[9]:https://en.wikipedia.org/wiki/Programming_paradigm
[10]:http://ddili.org/ders/d.en/templates.html
[11]:https://dlang.org/spec/version.html
[12]:http://ddili.org/ders/d.en/ranges.html
[13]:https://dlang.org/spec/arrays.html#slicing
[14]:https://dlang.org/spec/interfaceToC.html
[15]:https://dlang.org/spec/cpp_interface.html
[16]:https://code.dlang.org/packages/pyd
[17]:https://dlang.org/spec/objc_interface.html
[18]:http://beza1e1.tuxen.de/into_luad.html
[19]:http://www.active-analytics.com/blog/interface-d-with-c-fortran/
[20]:https://en.wikipedia.org/wiki/Syntactic_sugar
[21]:https://dlang.org/spec/ddoc.html
[22]:http://ddili.org/ders/d.en/contracts.html
[23]:http://ddili.org/ders/d.en/ufcs.html
[24]:http://ddili.org/ders/d.en/foreach.html
[25]:https://dlang.org/spec/unittest.html
[26]:http://code.dlang.org/getting_started
[27]:https://code.dlang.org/
[28]:https://dlang.org/spec/garbage.html
[29]:https://dlang.org/comparison.html
[30]:https://dlang.org/phobos/index.html
[31]:https://dlang.org/areas-of-d-usage.html
[32]:https://dlang.org/orgs-using-d.html
[33]:https://opensource.com/user/129491/feed
[34]:https://opensource.com/users/aberba
