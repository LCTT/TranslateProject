[#]: subject: "Creating and initializing lists in Java and Groovy"
[#]: via: "https://opensource.com/article/22/1/creating-lists-groovy-java"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Creating and initializing lists in Java and Groovy
======
Create and initialize a list of integers, first in Java and then in
Groovy.
![Developing code.][1]

I like the [Groovy programming language][2] a lot. I like it because, in the end, I like Java, even though Java sometimes feels clumsy. And because I like Java so much, I don't find many other JVM languages especially attractive. Kotlin, Scala, and Clojure, for example, don't feel much like Java, pursuing their own perspectives on what makes a good programming language. Groovy is different; in my view, Groovy is the perfect antidote to those situations when a programmer who likes Java just needs something a bit more flexible, compact, and sometimes even straightforward.

A good example is the List data structure, which is used to hold an ordered list of numbers, strings, or objects, and allows the programmer to iterate through those items in an efficient fashion. Especially for people writing and maintaining scripts, "efficiency" is mostly about clear and brief expressions that don't require a bunch of ceremony that obscures the intent of the code.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation as well. Both a recent and decent version of Java and Groovy might be in your Linux distribution's repositories. Otherwise, you can install Groovy by following [these instructions][3]. A nice alternative for Linux users is SDKMan, which can be used to get multiple versions of Java, Groovy, and many other related tools. For this article, I use SDK's releases of:

  * Java: version 11.0.12-open of OpenJDK 11
  * Groovy: version 3.0.8



### Back to the problem

There have been various ways of instantiating and initializing lists in Java since they were first introduced (I think that was Java 1.5, but please don't quote me). Two current interesting ways involve two different libraries: **java.util.Arrays** and **java.util.List**.

#### Use java.util.Arrays

**java.util.Arrays** defines the static method **asList()**, which can be used to create a list that is backed by an array and is therefore also immutable, though its elements are mutable. Here it is in action:


```


var a1 = [Arrays][4].asList(1,2,3,4,5,6,7,8,9,10); // immutable list of mutable elements

[System][5].out.println("a1 = " + a1);
[System][5].out.println("a1 is an instance of " + a1.getClass());

// output is
// a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a1 is an instance of class java.util.Arrays$ArrayList

a1.set(0,0); // succeeds
[System][5].out.println("a1 = " + a1); // output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a1.add(11); // fails producing
// Exception in thread "main" java.lang.UnsupportedOperationException
[System][5].out.println("a1 = " + a1); // not reached

```

#### Use java.util.List

**java.util.List** defines the static method **of().** This can be used to create an immutable list with elements that may or may not be immutable, depending on whether the items in the list of elements are immutable. Here is this version in action:


```


var a2 = [List][6].of(1,2,3,4,5,6,7,8,9,10);

[System][5].out.println("a2 = " + a2);
[System][5].out.println("a2 is an instance of " + a2.getClass());

// output is
// a2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a2 is an instance of class java.util.ImmutableCollections$ListN

a2.set(0,0); // fails producing
// Exception in thread "main" java.lang.UnsupportedOperationException
[System][5].out.println("a2 = " + a2); // not reached

a2.add(11); // also fails for same reason if above two lines commented out
[System][5].out.println("a2 = " + a2); // not reached

```

So, I can use either **Arrays.asList()** or **List.of()** if I want a list that can't be grown (or shrunk) and may or may not have alterable elements.

If I want an initialized mutable list I would probably resort to using those immutable-ish lists as arguments to a list constructor, for example:


```


var a1 = new ArrayList&lt;Integer&gt;([Arrays][4].asList(1,2,3,4,5,6,7,8,9,10));

[System][5].out.println("a1 = " + a1);
[System][5].out.println("a1 is an instance of " + a1.getClass());

// output is
// a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a1 is an instance of class java.util.ArrayList

a1.set(0,0);
[System][5].out.println("a1 = " + a1);

//output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a1.add(11);
[System][5].out.println("a1 = " + a1);

// output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

```

Note that the **Arrays.AsList()** was used to initialize the new **ArrayList&lt;Integer&gt;()**, which created a mutable copy of the argument.

Now maybe it's just me, but this seems like an awful lot of theory—needing to be situationally aware of the details of **java.util.Arrays** or **java.util.List**—just to create and initialize a mutable list of integers, though the actual statement used is not overly "ceremonial." Here it is again, just for reference:


```
`var a1 = new ArrayList<Integer>(Arrays.asList(1,2,3,4,5,6,7,8,9,10));`
```

### The Groovy approach

Here is the Groovy version of the above:


```


def a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println "a1 = $a1"
println "a1 is an instance of ${a1.getClass()}"

// output is
// a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a1 is an instance of class java.util.ArrayList

a1[0] = 0
println "a1 = $a1"

// output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a1 &lt;&lt; 11
println "a1 = $a1"

// output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

```

At a glance, Groovy uses the **def** keyword rather than **var**. I also know that I can create a list representation by putting a list of things—in this case, integers—between brackets. Moreover, the list instance so created is precisely what I want: a mutable instance of **ArrayList**.

Now maybe it's just me, again, but the above seems to be a whole lot simpler—no remembering the semi-immutable results returned by **.of()** or **.asList()** and compensating for them. It's also nice that I can refer to a specific element of the list using the brackets with an index value between them, rather than the method call **set()**, and that the `<<` operator appends to the end of a list so that I don't have to use the method call **add()**. Also, did you notice the lack of semi-colons? Yep, in Groovy, they're optional. And finally, observe the use of string interpolation, with the **$variable** or **${expression}** inside a double-quoted string providing that capability.

There’s more going on "under the covers" in the Groovy world. That definition is an example of dynamic typing (the default in Groovy) versus the static typing of Java. In the Groovy definition line, the type of **a1** is inferred at runtime from the type of the expression evaluated on the right-hand side. Now we all know that dynamic programming languages give us great power and that with great power comes many good opportunities to mess up. But for programmers who don't like dynamic typing, Groovy offers the option of static typing.

### Groovy resources

The Apache Groovy site I mentioned at the beginning has a lot of great documentation. Another excellent Groovy resource is [Mr. Haki][7]. And a really good reason to learn Groovy is to go on and learn [Grails][8], which is a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

This article is dedicated to my very dear friend Anil Mukhi, who passed away on 3 January 2022. Thank you, Anil, for giving me the opportunity to learn so much about Groovy, Grails, and horse racing data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/creating-lists-groovy-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 (Developing code.)
[2]: http://www.groovy-lang.org/
[3]: http://www.groovy-lang.org/install.html
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+arrays
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+list
[7]: https://www.mrhaki.com/
[8]: https://grails.org/
