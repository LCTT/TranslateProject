trnhoe translating~
Introduction to functional programming
============================================================

> We explain what functional programming is, explore its benefits, and look at resources for learning functional programming.


 ![Introduction to functional programming ](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/lightbulb_computer_person_general_.png?itok=ZY3UuQQa "Introduction to functional programming ") 
Image by : 

opensource.com

Depending on whom you ask,  _functional programming_  (FP) is either an enlightened approach to programming that should be spread far and wide, or an overly academic approach to programming with few real-world benefits. In this article, I will explain what functional programming is, explore its benefits, and recommend resources for learning functional programming.

### Syntax primer

Code examples in this article are in the [Haskell][40] programming language. All that you need to understand for this article is the basic function syntax:

```
  even :: Int -> Bool
  even = ...    -- implementation goes here
```

This defines a one-argument function named **even**. The first line is the  _type declaration_ , which says that **even** takes an **Int** and returns a **Bool**. The implementation follows and consists of one or more  _equations_ . We'll ignore the implementation (the name and type tell us enough):

```
  map :: (a -> b) -> [a] -> [b]
  map = ...
```

In this example, **map** is a function that takes two arguments:

1.  **(a -> b)**: a functions that turns an **a** into a **b**
2.  **[a]**: a list of **a**

and returns a list of **b**. Again, we don't care about the definition—the type is more interesting! **a** and **b** are  _type variables_  that could stand for any type. In the expression below, **a** is **Int** and **b** is **Bool**:

```
  map even [1,2,3]
```

It evaluates to a **[Bool]**:

```
  [False,True,False]
```

If you see other syntax that you do not understand, don't panic; full comprehension of the syntax is not essential.

### Myths about functional programming

Programming and development

*   [Our latest JavaScript articles][1]
*   [Recent Perl posts][2]
*   [New Python content][3]
*   [Red Hat Developers Blog][4]
*   [Tools for Red Hat Developers][5]

Let's begin by dispelling common misconceptions:

*   Functional programming is not the rival or antithesis of imperative or object-oriented programming. This is a false dichotomy.
*   Functional programming is not just the domain of academics. It is true that the history of functional programming is steeped in academia, and languages such as like Haskell and OCaml are popular research languages. But today many companies use functional programming for large-scale systems, small specialized programs, and everything in between. There's even an annual conference for [Commercial Users of Functional Programming][33]; past programs give an insight into how functional programming is being used in industry, and by whom.
*   Functional programming has nothing to do with [monads][34], nor any other particular abstraction. For all the hand-wringing around this topic, monad is just an abstraction with laws. Some things are monads, others are not.
*   Functional programming is not especially hard to learn. Some languages may have different syntax or evaluation semantics from those you already know, but these differences are superficial. There are dense concepts in functional programming, but this is also true of other approaches.

### What is functional programming?

At its core, functional programming is just programming with functions— _pure_  mathematical functions. The result of a function depends only on the arguments, and there are no side effects, such as I/O or mutation of state. Programs are built by combining functions together. One way of combining functions is  _function composition_ :

```
  (.) :: (b -> c) -> (a -> b) -> (a -> c)
  (g . f) x = g (f x)
```

This  _infix_  function combines two functions into one, applying **g** to the output of **f**. We'll see it used in an upcoming example. For comparison, the same function in Python looks like:

```
  def compose(g, f):
    return lambda x: g(f(x))
```

The beauty of functional programming is that because functions are deterministic and have no side effects, you can always replace a function application with the result of the application. This substitution of equals for equals enables  _equational reasoning_ . Every programmer has to reason about their code and others', and equational reasoning is a great tool for doing that. Let's look at an example. You encounter the expression:

```
  map even . map (+1)
```

What does this program do? Can it be simplified? Equational reasoning lets you analyze the code through a series of substitutions:

```
  map even . map (+1)
  map (even . (+1))         -- from definition of 'map'
  map (\x -> even (x + 1))  -- lambda abstraction
  map odd                   -- from definition of 'even'
```

We can use equational reasoning to understand programs and optimize for readability. The Haskell compiler uses equational reasoning to perform many kinds of program optimizations. Without pure functions, equational reasoning either isn't possible, or requires an inordinate effort from the programmer.

### Functional programming languages

What do you need from a programming language to be able to do functional programming?

Doing functional programming meaningfully in a language without  _higher-order functions_  (the ability to pass functions as arguments and return functions),  _lambdas_  (anonymous functions), and  _generics_  is difficult. Most modern languages have these, but there are differences in  _how well_  different languages support functional programming. The languages with the best support are called  _functional programming languages_ . These include  _Haskell_ ,  _OCaml_ ,  _F#_ , and  _Scala_ , which are statically typed, and the dynamically typed  _Erlang_  and  _Clojure_ .

Even among functional languages there are big differences in how far you can exploit functional programming. Having a type system helps a lot, especially if it supports  _type inference_  (so you don't always have to type the types). There isn't room in this article to go into detail, but suffice it to say, not all type systems are created equal.

As with all languages, different functional languages emphasize different concepts, techniques, or use cases. When choosing a language, considering how well it supports functional programming and whether it fits your use case is important. If you're stuck using some non-FP language, you will still benefit from applying functional programming to the extent the language supports it.

### Don't open that trap door!

Recall that the result of a function depends only on its inputs. Alas, almost all programming languages have "features" that break this assumption. Null values, type case (**instanceof**), type casting, exceptions, side-effects, and the possibility of infinite recursion are trap doors that break equational reasoning and impair a programmer's ability to reason about the behavior or correctness of a program. ( _Total languages_ , which do not have any trap doors, include Agda, Idris, and Coq.)

Fortunately, as programmers, we can choose to avoid these traps, and if we are disciplined, we can pretend that the trap doors do not exist. This idea is called  _fast and loose reasoning_ . It costs nothing—almost any program can be written without using the trap doors—and by avoiding them you win back equational reasoning, composability and reuse.

Let's discuss exceptions in detail. This trap door breaks equational reasoning because the possibility of abnormal termination is not reflected in the type. (Count yourself lucky if the documentation even mentions the exceptions that could be thrown.) But there is no reason why we can't have a return type that encompasses all the failure modes.

Avoiding trap doors is an area in which language features can make a big difference. For avoiding exceptions,  _algebraic data types_  can be used to model error conditions, like so:

```
  -- new data type for results of computations that can fail
  --
  data Result e a = Error e | Success a

  -- new data type for three kinds of arithmetic errors
  --
  data ArithError = DivByZero | Overflow | Underflow

  -- integer division, accounting for divide-by-zero
  --
  safeDiv :: Int -> Int -> Result ArithError Int
  safeDiv x y =
    if y == 0
      then Error DivByZero
      else Success (div x y)
```

The trade-off in this example is that you must now work with values of type **Result ArithError Int** instead of plain old **Int**, but there are abstractions for dealing with this. You no longer need to handle exceptions and can use fast and loose reasoning, so overall it's a win.

### Theorems for free

Most modern statically typed languages have  _generics_  (also called  _parametric polymorphism_ ), where functions are defined over one or more abstract types. For example, consider a function over lists:

```
  f :: [a] -> [a]
  f = ...
```

The same function in Java looks like:

```
  static <A> List<A> f(List<A> xs) { ... }
```

The compiled program is a proof that this function will work with  _any_  choice for the type **a**. With that in mind, and employing fast and loose reasoning, can you work out what the function does? Does knowing the type help?

In this case, the type doesn't tell us exactly what the function does (it could reverse the list, drop the first element, or many other things), but it does tell us a lot. Just from the type, we can derive theorems about the function:

*   **Theorem 1**: Every element in the output appears in the input; it couldn't possibly add an **a** to the list because it has no knowledge of what **a** is or how to construct one.
*   **Theorem 2**: If you map any function over the list then apply **f**, the result is the same as applying **f** then mapping.

Theorem 1 helps us understand what the code is doing, and Theorem 2 is useful for program optimization. We learned all this just from the type! This result—the ability to derive useful theorems from types—is called  _parametricity_ . It follows that a type is a partial (sometimes complete) specification of a function's behavior, and a kind of machine-checked documentation.

Now it's your turn to exploit parametricity. What can you conclude from the types of **map** and **(.)**, or the following functions?

*   **foo :: a -> (a, a)**
*   **bar :: a -> a -> a**
*   **baz :: b -> a -> a**

### Resources for learning functional programming

Perhaps you have been convinced that functional programming is a better way to write software, and you are wondering how to get started? There are several approaches to learning functional programming; here are some I recommend (with, I admit, a strong bias toward Haskell):

*   UPenn's [CIS 194: Introduction to Haskell][35] is a solid introduction to functional programming concepts and real-world Haskell development. The course material is available, but the lectures are not (you could view Brisbane Functional Programming Group's [series of talks covering CIS 194][36] from a few years ago instead).
*   Good introductory books include  _[Functional Programming in Scala][30]_ ,  _[Thinking Functionally with Haskell][31]_ , and  _[Haskell Programming from first principles][32]_ .
*   The [Data61 FP course][37] (f.k.a.,  _NICTA_  course) teaches foundational abstractions and data structures through  _type-driven development_ . The payoff is huge, but it is  _difficult by design_ , having its origins in training workshops, so only attempt it if you know a functional programmer who is willing to mentor you.
*   Start practicing functional programming in whatever code you're working on. Write pure functions (avoid non-determinism and mutation), use higher-order functions and recursion instead of loops, exploit parametricity for improved readability and reuse. Many people start out in functional programming by experimenting and experiencing the benefits in all kinds of languages.
*   Join a functional programming user group or study group in your area—or start one—and look out for functional programming conferences (new ones are popping up all the time).

### Conclusion

In this article, I discussed what functional programming is and is not, and looked at advantages of functional programming, including equational reasoning and parametricity. We learned that you can do  _some_  functional programming in most programming languages, but the choice of language affects how much you can benefit, with  _functional programming languages_ , such as Haskell, having the most to offer. I also recommended resources for learning functional programming.

Functional programming is a rich field and there are many deeper (and denser) topics awaiting exploration. I would be remiss not to mention a few that have practical implications, such as:

*   lenses and prisms (first-class, composable getters and setters; great for working with nested data);
*   theorem proving (why test your code when you could  _prove it correct_  instead?);
*   lazy evaluation (lets you work with potentially infinite data structures);
*   and category theory (the origin of many beautiful and practical abstractions in functional programming).

I hope that you have enjoyed this introduction to functional programming and are inspired to dive into this fun and practical approach to software development.

 _This article is published under the [CC BY 4.0][38] license._

--------------------------------------------------------------------------------

作者简介：

Software Engineer at Red Hat. Interested in functional programming, category theory and other intersections of math and programming. Crazy about jalapeños.

----------------------

via: https://opensource.com/article/17/4/introduction-functional-programming

作者：[Fraser Tweedale ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/frasertweedale
[1]:https://opensource.com/tags/javascript?src=programming_resource_menu
[2]:https://opensource.com/tags/perl?src=programming_resource_menu
[3]:https://opensource.com/tags/python?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:https://developers.redhat.com/products/#developer_tools?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[6]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[7]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[8]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[9]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:div
[10]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[11]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[12]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Bool
[13]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[14]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[15]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[16]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[17]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[18]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[19]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[20]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[21]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[22]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[23]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[24]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[25]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[26]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[27]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[28]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[29]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:odd
[30]:https://www.manning.com/books/functional-programming-in-scala
[31]:http://www.cambridge.org/gb/academic/subjects/computer-science/programming-languages-and-applied-logic/thinking-functionally-haskell
[32]:http://haskellbook.com/
[33]:http://cufp.org/
[34]:https://www.haskell.org/tutorial/monads.html
[35]:https://www.cis.upenn.edu/~cis194/fall16/
[36]:https://github.com/bfpg/cis194-yorgey-lectures
[37]:https://github.com/data61/fp-course
[38]:https://creativecommons.org/licenses/by/4.0/
[39]:https://opensource.com/article/17/4/introduction-functional-programming?rate=_tO5hNzT4hRKNMJtWwQM-K3Jmxm10iPeqoy3bbS12MQ
[40]:https://wiki.haskell.org/Introduction
[41]:https://opensource.com/user/123116/feed
[42]:https://opensource.com/users/frasertweedale
