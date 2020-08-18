[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (D Declarations for C and C++ Programmers)
[#]: via: (https://theartofmachinery.com/2020/08/18/d_declarations_for_c_programmers.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

D Declarations for C and C++ Programmers
======

Because D was originally created by a C++ compiler writer, Walter Bright, [it’s an easy language for C and C++ programmers to learn][1], but there are little differences in the way declarations work. I learned them piecemeal in different places, but I’m going to dump a bunch in this one post.

### `char* p`

If you want to declare a pointer in C, both of the following work:

```
char *p;
char* p;
```

Some people prefer the second form because it puts all the type information to one side. At least, that’s what it looks like. Trouble is, you can fall into this trap:

```
char* p, q;  // Gotcha! p is a pointer to a char, and q is a char in C
```

“Type information on the left” isn’t really how C works. D, on the other hand, _does_ put all the type information to the left, so this works the way it appears:

```
char* p, q;  // Both p and q are of type char* in D
```

D also accepts the `char *p` syntax, but the rule I go by is `char *p` when writing C, and `char* p` when writing D, just because that matches how the languages actually work, so no gotchas.

### Digression: how C declarations work

This isn’t about D, but helps to make sense of the subtler differences between C and D declarations.

C declarations are implicit about types. `char *p` doesn’t really say, “`p` is of type `char*`”; it says “the type of `p` is such that `*p` evaluates to a `char`”. Likewise:

```
int a[8];  // a[i] evaluates to an int (=> a is an array of ints)
int (*f)(double);  // (*f)(0.5) evaluates to an int (=> f is a pointer to a function taking a double, returning an int)
```

There’s a kind of theoretical elegance to this implicit approach, but 1) it’s backwards and makes complex types confusing, 2) the theoretical elegance only goes so far because everything’s a special case. For example, `int a[8];` declares an array `a`, but makes the expression `a[8]` undefined. You can only use certain operations, so `int 2*a;` doesn’t work, and neither does `double 1.0 + sin(x);`. The expression `4[a]` is equivalent to `a[4]`, but you can’t declare an array with `int 4[a];`. C++ gave up on the theory when it introduced reference syntax like `int &x;`.

### `function` and `delegate`

D has a special `function` keyword for declaring function pointers using the “type information on the left” approach. It makes the declaration of function pointers use the same syntax as the declaration of a function:

```
int foo();
int[] bar();

int function() foo_p = &foo;
int[] function() bar_p = &bar;
```

Note that the `&` is _required_ to get the address of a function in D (unlike in C and C++). If you want to have an array of pointers, you just add `[]` to the end of the type, just like you do with any other type. Similarly for making pointers to types:

```
int function()[] foo_pa = [&foo];
int function()* foo_pp = &foo_p;
int function()[]* foo_pap = &foo_pa;
```

Here’s the C equivalent for comparison:

```
int (*foo_p)() = &foo;
int (*foo_pa[])() = {&foo};
int (**foo_pp)() = &foo_p;
int (*(*foo_pap)[])() = &foo_pa;
```

It’s rare to need these complicated types, but the logic for the D declarations is much simpler.

There’s also the `delegate` keyword, which works in exactly the same way for [“fat function pointers”][2].

### Arrays

The most obvious difference from C is that D uses the “type information on the left” approach:

```
// int a[8]; is an error in D
int[8] a;
```

Another difference is in the order of indices for multidimensional arrays. E.g., this C code:

```
int a[4][64];
```

translates to this in D:

```
int[64][4] a;
```

Here’s the rule for understanding the D ordering:

```
T[4] a;
static assert (is(typeof(a[0]) == T));
```

If `T` represents a type, then `T[4]` is always an array of 4 `T`s. Sounds obvious, but it means that if `T` is `int[64]`, `int[64][4]` must be an array of 4 `int[64]`s.

### `auto`

C had `auto` as a storage class keyword since the early days, but it got mostly forgotten because it’s only allowed in the one place it’s the default, anyway. (It effectively means “this variable goes on the stack”.) C++ repurposed the keyword to enable automatic type deduction.

You can also use `auto` with automatic type deduction in D, but it’s not actually required. Type deduction is always enabled in D; you just need to make your declaration unambiguously a type declaration. For example, these work in D (but not all in C++):

```
auto x1 = 42;
const x2 = 42;
static x3 = 42;
```

### No need for forward declarations at global scope

This code works:

```
// Legal, but not required in D
// void bar();

void foo()
{
    bar();
}

void bar()
{
    // ...
}
```

Similarly for structs and classes. Order of definition doesn’t matter, and forward declarations aren’t required.

Order does matter in local scope, though:

```
void foo()
{
    // Error!
    bar();

    void bar()
    {
        // ...
    }
}
```

Either the definition of `bar()` needs to be put before its usage, or `bar()` needs a forward declaration.

### `const()`

The `const` keyword in C declarations can be confusing. (Think `const int *p` vs `int const *p` vs `const int const *p`.) D supports the same syntax, but also allows `const` with parentheses:

```
// non-constant pointer to constant int
const(int)* p1;
// constant pointer to constant int
const(int*) p2;
```

[`const` is transitive in D][3], anyway, and this syntax makes it much clearer. The same parenthetical syntax works with `immutable`, too. Although C-style syntax is supported by D, I always prefer the parenthetical style for a few more reasons.

### `ref`

`ref` is the D alternative to C++’s references. In D, `ref` doesn’t create a new type, it just controls how the instance of the type is stored in memory (i.e, it’s a storage class). C++ acts as if references are types, but references have so many special restrictions that they’re effectively like a complex version of a storage class (in Walter’s words, C++ references try to be both a floor wax and dessert topping). For example, C++ treats `int&` like a type, but forbids declaring an array of `int&`.

As a former C++ programmer, I used to write D function arguments like this:

```
void foo(const ref S s);
```

Now I write them like this:

```
void foo(ref const(S) s);
```

The difference becomes more obvious with more complex types. Treating `ref` like a storage class ends up being cleaner because that’s the way it actually is in D.

Currently `ref` is only supported with function arguments or `foreach` loop variables, so you can’t declare a regular local variable to be `ref`.

### Function qualifiers

D’s backward-compatible support for the C-style `const` keyword creates an unfortunate gotcha:

```
struct S
{
    // Confusing!
    const int* foo()
    {
        // ...
    }
}
```

`foo()` doesn’t return a `const int*`. The `const` applies to the `foo()` member function itself, meaning that it works on `const` instances of `S` and returns a (non-`const`) `int*`. To avoid that trap, I always use the D-style `const()` syntax, and write member function qualifiers on the right:

```
struct S
{
    const(int)* foo()
    {
        // ...
    }

    int* bar() const
    {
        // ...
    }
}
```

### Syntax ambiguities

C++ allows initialising struct and class instances without an `=` sign:

```
S s(42);
```

This syntax famously leads to ambiguities with function declaration syntax in special cases (Scott Meyers’ “most vexing parse”). [People like Herb Sutter have written enough about it.][4] D only supports initialisation with `=`:

```
S s = S(42);
// Alternatively:
auto s = S(42);
```

C syntax has some weird corners, too. Here’s a simple one:

```
x*y;
```

That looks like a useless multiplication between two variables, but logically it could be a declaration of `y` as a pointer to a type `x`. Expression and declaration are totally different parses that depend on what the symbol `x` means in this scope. (Even worse, if it’s a declaration, then the new `y` could shadow an existing `y`, which could affect later parses.) So C compilers need to track symbols in a symbol table while parsing, which is why C has forward declarations in practice.

D sidesteps the ambiguity by requiring a typecast to `void` if you really want to write an arithmetic expression without assigning it to anything:

```
int x, y;
cast(void)(x*y);
```

I’ve never seen useful code do that, but that rule helps D parse simply without forward declarations.

Here’s another quirk of C syntax. Remember that C declarations work by having a basic type on the left, followed by expressions that evaluate to that type? C allows parentheses in those expressions, and doesn’t care about whitespace as long as symbols don’t run together. That means these two declarations are equivalent:

```
int x;
int(x);
```

But what if, instead of `int`, we use some symbol that might be a typedef?

```
int main()
{
    // Is this a declaration of x, or a function call?
    t(x);
}
```

Just for fun, we can exploit shadowing and C’s archaic type rules:

```
typedef (*x)();
main()
{
    x(x);
    x(x);
}
```

The first line makes `x` a typedef to a function pointer type. The first `x(x);` redeclares `x` to be a function pointer variable, shadowing the typedef. The second `x(x);` is a function call that passes `x` as an argument. Yes, this code actually compiles, but it’s undefined behaviour because the function pointer is dereferenced without being initialised.

D avoids this chaos thanks to its “all type information on the left” rule. There’s no need to put parentheses around symbols in declarations, so `x(y);` is always a function call.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/08/18/d_declarations_for_c_programmers.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://ddili.org/ders/d.en/index.html
[2]: https://tour.dlang.org/tour/en/basics/delegates
[3]: https://dlang.org/articles/const-faq.html#transitive-const
[4]: https://herbsutter.com/2013/05/09/gotw-1-solution/
