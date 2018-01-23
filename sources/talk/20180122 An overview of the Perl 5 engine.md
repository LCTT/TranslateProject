An overview of the Perl 5 engine
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/camel-perl-lead.png?itok=VyEv-C5o)

As I described in "[My DeLorean runs Perl][1]," switching to Perl has vastly improved my development speed and possibilities. Here I'll dive deeper into the design of Perl 5 to discuss aspects important to systems programming.

Some years ago, I wrote "OpenGL bindings for Bash" as sort of a joke. The implementation was simply an X11 program written in C that read OpenGL calls on [stdin][2] (yes, as text) and emitted user input on [stdout][3] . Then I had a littlefile that would declare all the OpenGL functions as Bash functions, which echoed the name of the function into a pipe, starting the GL interpreter process if it wasn't already running. The point of the exercise was to show that OpenGL (the 1.4 API, not the newer shader stuff) could render a lot of graphics with just a few calls per frame by using GL display lists. The OpenGL library did all the heavy lifting, and Bash just printed a few dozen lines of text per frame.

In the end though, Bash is a really horrible [glue language][4], both from high overhead and limited available operations and syntax. [Perl][5], on the other hand, is a great glue language.

### Syntax aside...

If you're not a regular Perl user, the first thing you probably notice is the syntax.

Perl 5 is built on a long legacy of awkward syntax, but more recent versions have removed the need for much of the punctuation. The remaining warts can mostly be avoided by choosing modules that give you domain-specific "syntactic sugar," which even alter the Perl syntax as it is parsed. This is in stark contrast to most other languages, where you are stuck with the syntax you're given, and infinitely more flexible than C's macros. Combined with Perl's powerful sparse-syntax operators, like `map`, `grep`, `sort`, and similar user-defined operators, I can almost always write complex algorithms more legibly and with less typing using Perl than with JavaScript, PHP, or any compiled language.

So, because syntax is what you make of it, I think the underlying machine is the most important aspect of the language to consider. Perl 5 has a very capable engine, and it differs in interesting and useful ways from other languages.

### A layer above C

I don't recommend anyone start working with Perl by looking at the interpreter's internal API, but a quick description is useful. One of the main problems we deal with in the world of C is acquiring and releasing memory while also supporting control flow through a chain of function calls. C has a rough ability to throw exceptions using `longjmp`, but it doesn't do any cleanup for you, so it is almost useless without a framework to manage resources. The Perl interpreter is exactly this sort of framework.

Perl provides a stack of variables independent from C's stack of function calls on which you can mark the logical boundaries of a Perl scope. There are also API calls you can use to allocate memory, Perl variables, etc., and tell Perl to automatically free them at the end of the Perl scope. Now you can make whatever C calls you like, "die" out of the middle of them, and let Perl clean everything up for you.

Although this is a really unconventional perspective, I bring it up to emphasize that Perl sits on top of C and allows you to use as much or as little interpreted overhead as you like. Perl's internal API is certainly not as nice as C++ for general programming, but C++ doesn't give you an interpreted language on top of your work when you're done. I've lost track of the number of times that I wanted reflective capability to inspect or alter my C++ objects, and following that rabbit hole has derailed more than one of my personal projects.

### Lisp-like functions

Perl functions take a list of arguments. The downside is that you have to do argument count and type checking at runtime. The upside is you don't end up doing that much, because you can just let the interpreter's own runtime check catch those mistakes. You can also create the effect of C++'s overloaded functions by inspecting the arguments you were given and behaving accordingly.

Because arguments are a list, and return values are a list, this encourages [Lisp-style programming][6], where you use a series of functions to filter a list of data elements. This "piping" or "streaming" effect can result in some really complicated loops turning into a single line of code.

Every function is available to the language as a `coderef` that can be passed around in variables, including anonymous closure functions. Also, I find `sub {}` more convenient to type than JavaScript's `function(){}` or C++11's `[&](){}`.

### Generic data structures

The variables in Perl are either "scalars," references, arrays, or "hashes" ... or some other stuff that I'll skip.

Scalars act as a string/integer/float hybrid and are automatically typecast as needed for the purpose you are using them. In other words, instead of determining the operation by the type of variable, the type of operator determines how the variable should be interpreted. This is less efficient than if the language knows the type in advance, but not as inefficient as, for example, shell scripting because Perl caches the type conversions.

Perl scalars may contain null characters, so they are fully usable as buffers for binary data. The scalars are mutable and copied by value, but optimized with copy-on-write, and substring operations are also optimized. Strings support unicode characters but are stored efficiently as normal bytes until you append a codepoint above 255.

References (which are considered scalars as well) hold a reference to any other variable; `hashrefs` and `arrayrefs` are most common, along with the `coderefs` described above.

Arrays are simply a dynamic-length array of scalars (or references).

Hashes (i.e., dictionaries, maps, or whatever you want to call them) are a performance-tuned hash table implementation where every key is a string and every value is a scalar (or reference). Hashes are used in Perl in the same way structs are used in C. Clearly a hash is less efficient than a struct, but it keeps things generic so tasks that require dozens of lines of code in other languages can become one-liners in Perl. For instance, you can dump the contents of a hash into a list of (key, value) pairs or reconstruct a hash from such a list as a natural part of the Perl syntax.

### Object model

Any reference can be "blessed" to make it into an object, granting it a multiple-inheritance method-dispatch table. The blessing is simply the name of a package (namespace), and any function in that namespace becomes an available method of the object. The inheritance tree is defined by variables in the package. As a result, you can make modifications to classes or class hierarchies or create new classes on the fly with simple data edits, rather than special keywords or built-in reflection APIs. By combining this with Perl's `local` keyword (where changes to a global are automatically undone at the end of the current scope), you can even make temporary changes to class methods or inheritance!

Perl objects only have methods, so attributes are accessed via accessors like the canonical Java `get_` and `set_` methods. Perl authors usually combine them into a single method of just the attribute name and differentiate `get` from `set` by whether a parameter was given.

You can also "re-bless" objects from one class to another, which enables interesting tricks not available in most other languages. Consider state machines, where each method would normally start by checking the object's current state; you can avoid that in Perl by swapping the method table to one that matches the object's state.

### Visibility

While other languages spend a bunch of effort on access rules between classes, Perl adopted a simple "if the name begins with underscore, don't touch it unless it's yours" convention. Although I can see how this could be a problem with an undisciplined software team, it has worked great in my experience. The only thing C++'s `private` keyword ever did for me was impair my debugging efforts, yet it felt dirty to make everything `public`. Perl removes my guilt.

Likewise, an object provides methods, but you can ignore them and just access the underlying Perl data structure. This is another huge boost for debugging.

### Garbage collection via reference counting

Although [reference counting][7] is a rather leak-prone form of memory management (it doesn't detect cycles), it has a few upsides. It gives you deterministic destruction of your objects, like in C++, and never interrupts your program with a surprise garbage collection. It strongly encourages module authors to use a tree-of-objects pattern, which I much prefer vs. the tangle-of-objects pattern often seen in Java and JavaScript. (I've found trees to be much more easily tested with unit tests.) But, if you need a tangle of objects, Perl does offer "weak" references, which won't be considered when deciding if it's time to garbage-collect something.

On the whole, the only time this ever bites me is when making heavy use of closures for event-driven callbacks. It's easy to have an object hold a reference to an event handle holding a reference to a callback that references the containing object. Again, weak references solve this, but it's an extra thing to be aware of that JavaScript or Python don't make you worry about.

### Parallelism

The Perl interpreter is a single thread, although modules written in C can use threads of their own internally, and Perl often includes support for multiple interpreters within the same process.

Although this is a large limitation, knowing that a data structure will only ever be touched by one thread is nice, and it means you don't need locks when accessing them from C code. Even in Java, where locking is built into the syntax in convenient ways, it can be a real time sink to reason through all the ways that threads can interact (and especially annoying that they force you to deal with that in every GUI program you write).

There are several event libraries available to assist in writing event-driven callback programs in the style of Node.js to avoid the need for threads.

### Access to C libraries

Aside from directly writing your own C extensions via Perl's [XS][8] system, there are already lots of common C libraries wrapped for you and available on Perl's [CPAN][9] repository. There is also a great module, [Inline::C][10], that takes most of the pain out of bridging between Perl and C, to the point where you just paste C code into the middle of a Perl module. (It compiles the first time you run it and caches the .so shared object file for subsequent runs.) You still need to learn some of the Perl interpreter API if you want to manipulate the Perl stack or pack/unpack Perl's variables other than your C function arguments and return value.

### Memory usage

Perl can use a surprising amount of memory, especially if you make use of heavyweight libraries and create thousands of objects, but with the size of today's systems it usually doesn't matter. It also isn't much worse than other interpreted systems. My personal preference is to only use lightweight libraries, which also generally improve performance.

### Startup speed

The Perl interpreter starts in under five milliseconds on modern hardware. If you take care to use only lightweight modules, you can use Perl for anything you might have used Bash for, like `hotplug` scripts.

### Regex implementation

Perl provides the mother of all regex implementations... but you probably already knew that. Regular expressions are built into Perl's syntax rather than being an object-oriented or function-based API; this helps encourage their use for any text processing you might need to do.

### Ubiquity and stability

Perl 5 is installed on just about every modern Unix system, and the CPAN module collection is extensive and easy to install. There's a production-quality module for almost any task, with solid test coverage and good documentation.

Perl 5 has nearly complete backward compatibility across two decades of releases. The community has embraced this as well, so most of CPAN is pretty stable. There's even a crew of testers who run unit tests on all of CPAN on a regular basis to help detect breakage.

The toolchain is also pretty solid. The documentation syntax (POD) is a little more verbose than I'd like, but it yields much more useful results than [doxygen][11] or [Javadoc][12]. You can run `perldoc FILENAME` to instantly see the documentation of the module you're writing. `perldoc Module::Name` shows you the specific documentation for the version of the module that you would load from your `include` path and can likewise show you the source code of that module without needing to browse deep into your filesystem.

The testcase system (the `prove` command and Test Anything Protocol, or TAP) isn't specific to Perl and is extremely simple to work with (as opposed to unit testing based around language-specific object-oriented structure, or XML). Modules like `Test::More` make writing the test cases so easy that you can write a test suite in about the same time it would take to test your module once by hand. The testing effort barrier is so low that I've started using TAP and the POD documentation style for my non-Perl projects as well.

### In summary

Perl 5 still has a lot to offer despite the large number of newer languages competing with it. The frontend syntax hasn't stopped evolving, and you can improve it however you like with custom modules. The Perl 5 engine is capable of handling most programming problems you can throw at it, and it is even suitable for low-level work as a "glue" layer on top of C libraries. Once you get really familiar with it, it can even be an environment for developing C code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/why-i-love-perl-5

作者：[Michael Conrad][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nerdvana
[1]:https://opensource.com/article/17/12/my-delorean-runs-perl
[2]:https://en.wikipedia.org/wiki/Standard_streams#Standard_input_(stdin)
[3]:https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout)
[4]:https://www.techopedia.com/definition/19608/glue-language
[5]:https://www.perl.org/
[6]:https://en.wikipedia.org/wiki/Lisp_(programming_language)
[7]:https://en.wikipedia.org/wiki/Reference_counting
[8]:https://en.wikipedia.org/wiki/XS_(Perl)
[9]:https://www.cpan.org/
[10]:https://metacpan.org/pod/distribution/Inline-C/lib/Inline/C.pod
[11]:http://www.stack.nl/~dimitri/doxygen/
[12]:http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html
