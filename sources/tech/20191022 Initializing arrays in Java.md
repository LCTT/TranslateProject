[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Initializing arrays in Java)
[#]: via: (https://opensource.com/article/19/10/initializing-arrays-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Initializing arrays in Java
======
Arrays are a helpful data type for managing collections elements best
modeled in contiguous memory locations. Here's how to use them
effectively.
![Coffee beans and a cup of coffee][1]

People who have experience programming in languages like C or FORTRAN are familiar with the concept of arrays. They’re basically a contiguous block of memory where each location is a certain type: integers, floating-point numbers, or what-have-you.

The situation in Java is similar, but with a few extra wrinkles.

### An example array

Let’s make an array of 10 integers in Java:


```
int[] ia = new int[10];
```

What’s going on in the above piece of code? From left to right:

  1. The **int[]** to the extreme left declares the _type_ of the variable as an array (denoted by the **[]**) of **int**.

  2. To the right is the _name_ of the variable, which in this case is **ia**.

  3. Next, the **=** tells us that the variable defined on the left side is set to what’s to the right side.

  4. To the right of the **=** we see the word **new**, which in Java indicates that an object is being _initialized_, meaning that storage is allocated and its constructor is called ([see here for more information][2]).

  5. Next, we see **int[10]**, which tells us that the specific object being initialized is an array of 10 integers.




Since Java is strongly-typed, the type of the variable **ia** must be compatible with the type of the expression on the right-hand side of the **=**.

### Initializing the example array

Let’s put this simple array in a piece of code and try it out. Save the following in a file called **Test1.java**, use **javac** to compile it, and use **java** to run it (in the terminal of course):


```
import java.lang.*;

public class Test1 {

    public static void main([String][3][] args) {
        int[] ia = new int[10];                              // See note 1 below
        [System][4].out.println("ia is " + ia.getClass());        // See note 2 below
        for (int i = 0; i &lt; ia.length; i++)                  // See note 3 below
            [System][4].out.println("ia[" + i + "] = " + ia[i]);  // See note 4 below
    }

}
```

Let’s work through the most important bits.

  1. Our declaration and initialization of the array of 10 integers, **ia**, is easy to spot.
  2. In the line just following, we see the expression **ia.getClass()**. That’s right, **ia** is an _object_ belonging to a _class_, and this code will let us know which class that is.
  3. In the next line following that, we see the start of the loop **for (int i = 0; i &lt; ia.length; i++)**, which defines a loop index variable **i** that runs through a sequence from zero to one less than **ia.length**, which is an expression that tells us how many elements are defined in the array **ia**.
  4. Next, the body of the loop prints out the values of each element of **ia**.



When this program is compiled and run, it produces the following results:


```
me@mydesktop:~/Java$ javac Test1.java
me@mydesktop:~/Java$ java Test1
ia is class [I
ia[0] = 0
ia[1] = 0
ia[2] = 0
ia[3] = 0
ia[4] = 0
ia[5] = 0
ia[6] = 0
ia[7] = 0
ia[8] = 0
ia[9] = 0
me@mydesktop:~/Java$
```

The string representation of the output of **ia.getClass()** is **[I**, which is shorthand for "array of integer." Similar to the C programming language, Java arrays begin with element zero and extend up to element **&lt;array size&gt; – 1**. We can see above that each of the elements of **ia** are set to zero (by the array constructor, it seems).

So, is that it? We declare the type, use the appropriate initializer, and we’re done?

Well, no. There are many other ways to initialize an array in Java. 

### Why do I want to initialize an array, anyway?

The answer to this question, like that of all good questions, is "it depends." In this case, the answer depends on what we expect to do with the array once it is initialized.

In some cases, arrays emerge naturally as a type of accumulator. For example, suppose we are writing code for counting the number of calls received and made by a set of telephone extensions in a small office. There are eight extensions, numbered one through eight, plus the operator’s extension, numbered zero. So we might declare two arrays:


```
int[] callsMade;
int[] callsReceived;
```

Then, whenever we start a new period of accumulating call statistics, we initialize each array as:


```
callsMade = new int[9];
callsReceived = new int[9];
```

At the end of each period of accumulating call statistics, we can print out the stats. In very rough terms, we might see:


```
import java.lang.*;
import java.io.*;

public class Test2 {

    public static void main([String][3][] args) {

        int[] callsMade;
        int[] callsReceived;

        // initialize call counters

        callsMade = new int[9];
        callsReceived = new int[9];

        // process calls...
        //   an extension makes a call: callsMade[ext]++
        //   an extension receives a call: callsReceived[ext]++

        // summarize call statistics

        [System][4].out.printf("%3s%25s%25s\n","ext"," calls made",
            "calls received");
        for (int ext = 0; ext &lt; callsMade.length; ext++)
            [System][4].out.printf("%3d%25d%25d\n",ext,
                callsMade[ext],callsReceived[ext]);

    }

}
```

Which would produce output something like this:


```
me@mydesktop:~/Java$ javac Test2.java
me@mydesktop:~/Java$ java Test2
ext               calls made           calls received
  0                        0                        0
  1                        0                        0
  2                        0                        0
  3                        0                        0
  4                        0                        0
  5                        0                        0
  6                        0                        0
  7                        0                        0
  8                        0                        0
me@mydesktop:~/Java$
```

Not a very busy day in the call center.

In the above example of an accumulator, we see that the starting value of zero as set by the array initializer is satisfactory for our needs. But in other cases, this starting value may not be the right choice.

For example, in some kinds of geometric computations, we might need to initialize a two-dimensional array to the identity matrix (all zeros except for the ones along the main diagonal). We might choose to do this as:


```
 double[][] m = new double[3][3];
        for (int d = 0; d &lt; 3; d++)
            m[d][d] = 1.0;
```

In this case, we rely on the array initializer **new double[3][3]** to set the array to zeros, and then use a loop to set the diagonal elements to ones. In this simple case, we might use a shortcut that Java provides:


```
 double[][] m = {
         {1.0, 0.0, 0.0},
         {0.0, 1.0, 0.0},
         {0.0, 0.0, 1.0}};
```

This type of visual structure is particularly appropriate in this sort of application, where it can be a useful double-check to see the actual layout of the array. But in the case where the number of rows and columns is only determined at run time, we might instead see something like this:


```
 int nrc;
 // some code determines the number of rows &amp; columns = nrc
 double[][] m = new double[nrc][nrc];
 for (int d = 0; d &lt; nrc; d++)
     m[d][d] = 1.0;
```

It’s worth mentioning that a two-dimensional array in Java is actually an array of arrays, and there’s nothing stopping the intrepid programmer from having each one of those second-level arrays be a different length. That is, something like this is completely legitimate:


```
int [][] differentLengthRows = {
     { 1, 2, 3, 4, 5},
     { 6, 7, 8, 9},
     {10,11,12},
     {13,14},
     {15}};
```

There are various linear algebra applications that involve irregularly-shaped matrices, where this type of structure could be applied (for more information see [this Wikipedia article][5] as a starting point). Beyond that, now that we understand that a two-dimensional array is actually an array of arrays, it shouldn’t be too much of a surprise that:


```
differentLengthRows.length
```

tells us the number of rows in the two-dimensional array **differentLengthRows**, and:


```
differentLengthRows[i].length
```

tells us the number of columns in row **i** of **differentLengthRows**.

### Taking the array further

Considering this idea of array size that is determined at run time, we see that arrays still require us to know that size before instantiating them. But what if we don’t know the size until we’ve processed all of the data? Does that mean we have to process it once to figure out the size of the array, and then process it again? That could be hard to do, especially if we only get one chance to consume the data.

The [Java Collections Framework][6] solves this problem in a nice way. One of the things provided there is the class **ArrayList**, which is like an array but dynamically extensible. To demonstrate the workings of **ArrayList**, let’s create one and initialize it to the first 20 [Fibonacci numbers][7]:


```
import java.lang.*;
import java.util.*;

public class Test3 {
       
        public static void main([String][3][] args) {

                ArrayList&lt;Integer&gt; fibos = new ArrayList&lt;Integer&gt;();

                fibos.add(0);
                fibos.add(1);
                for (int i = 2; i &lt; 20; i++)
                        fibos.add(fibos.get(i-1) + fibos.get(i-2));

                for (int i = 0; i &lt; fibos.size(); i++)
                        [System][4].out.println("fibonacci " + i +
                       " = " + fibos.get(i));

        }
}
```

Above, we see:

  * The declaration and instantiation of an **ArrayList** that is used to store **Integer**s.
  * The use of **add()** to append to the **ArrayList** instance.
  * The use of **get()** to retrieve an element by index number.
  * The use of **size()** to determine how many elements are already in the **ArrayList** instance.



Not shown is the **put()** method, which places a value at a given index number.

The output of this program is:


```
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci 3 = 2
fibonacci 4 = 3
fibonacci 5 = 5
fibonacci 6 = 8
fibonacci 7 = 13
fibonacci 8 = 21
fibonacci 9 = 34
fibonacci 10 = 55
fibonacci 11 = 89
fibonacci 12 = 144
fibonacci 13 = 233
fibonacci 14 = 377
fibonacci 15 = 610
fibonacci 16 = 987
fibonacci 17 = 1597
fibonacci 18 = 2584
fibonacci 19 = 4181
```

**ArrayList** instances can also be initialized by other techniques. For example, an array can be supplied to the **ArrayList** constructor, or the **List.of()** and **Arrays.asList()** methods can be used when the initial elements are known at compile time. I don’t find myself using these options all that often since my primary use case for an **ArrayList** is when I only want to read the data once.

Moreover, an **ArrayList** instance can be converted to an array using its **toArray()** method, for those who prefer to work with an array once the data is loaded; or, returning to the current topic, once the **ArrayList** instance is initialized.

The Java Collections Framework provides another kind of array-like data structure called a **Map**. What I mean by "array-like" is that a **Map** defines a collection of objects whose values can be set or retrieved by a key, but unlike an array (or an **ArrayList**), this key need not be an integer; it could be a **String** or any other complex object.

For example, we can create a **Map** whose keys are **String**s and whose values are **Integer**s as follows:


```
Map&lt;[String][3],Integer&gt; stoi = new Map&lt;[String][3],Integer&gt;();
```

Then we can initialize this **Map** as follows:


```
stoi.set("one",1);
stoi.set("two",2);
stoi.set("three",3);
```

And so on. Later, when we want to know the numeric value of **"three"**, we can retrieve it as:


```
stoi.get("three");
```

In my world, a **Map** is useful for converting strings occurring in third-party datasets into coherent code values in my datasets. As a part of a [data transformation pipeline][8], I will often build a small standalone program to clean the data before processing it; for this, I will almost always use one or more **Map**s.

Worth mentioning is that it’s quite possible, and sometimes reasonable, to have **ArrayLists** of **ArrayLists** and **Map**s of **Map**s. For example, let’s assume we’re looking at trees, and we’re interested in accumulating the count of the number of trees by tree species and age range. Assuming that the age range definition is a set of string values ("young," "mid," "mature," and "old") and that the species are string values like "Douglas fir," "western red cedar," and so forth, then we might define a **Map** of **Map**s as:


```
Map&lt;[String][3],Map&lt;[String][3],Integer&gt;&gt; counter =
        new Map&lt;[String][3],Map&lt;[String][3],Integer&gt;&gt;();
```

One thing to watch out for here is that the above only creates storage for the _rows_ of **Map**s. So, our accumulation code might look like:


```
// assume at this point we have figured out the species
// and age range
if (!counter.containsKey(species))
        counter.put(species,new Map&lt;[String][3],Integer&gt;());
if (!counter.get(species).containsKey(ageRange))
        counter.get(species).put(ageRange,0);
```

At which point, we can start accumulating as:


```
counter.get(species).put(ageRange,
        counter.get(species).get(ageRange) + 1);
```

Finally, it’s worth mentioning that the (new in Java 8) Streams facility can also be used to initialize arrays, **ArrayList** instances, and **Map** instances. A nice discussion of this feature can be found [here][9] and [here][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/initializing-arrays-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/19/8/what-object-java
[3]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[5]: https://en.wikipedia.org/wiki/Irregular_matrix
[6]: https://en.wikipedia.org/wiki/Java_collections_framework
[7]: https://en.wikipedia.org/wiki/Fibonacci_number
[8]: https://towardsdatascience.com/data-science-for-startups-data-pipelines-786f6746a59a
[9]: https://stackoverflow.com/questions/36885371/lambda-expression-to-initialize-array
[10]: https://stackoverflow.com/questions/32868665/how-to-initialize-a-map-using-a-lambda
