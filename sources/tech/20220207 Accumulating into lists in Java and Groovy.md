[#]: subject: "Accumulating into lists in Java and Groovy"
[#]: via: "https://opensource.com/article/22/2/accumulating-lists-groovy-vs-java"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Accumulating into lists in Java and Groovy
======
This article looks at the differences between list handling in Groovy
and Java. I'll explore how to run-length encode a list in both languages
for that purpose.
![Code with green and blue binary background of ones and zeros][1]

In my [last article][2], I reviewed some differences between creating and initializing lists in Groovy and doing the same thing in Java. I showed that Groovy has a straightforward and compact syntax for setting up lists compared to the steps necessary in Java.

This article explores some more differences between list handling in Groovy and Java. I'll explore how to run-length encode a list in both languages for that purpose. Briefly, run-length encoding is a way of compactly representing repeated sequences of the same value in a list.

You'll need to make sure you have both Groovy and Java installed on your computer to follow along.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation as well. Recent and decent versions of Java and Groovy might be in your Linux distribution's repositories. Or you can install Groovy following the instructions on the link mentioned above. A nice alternative for Linux users is [SDKMan][3], which you can use to get multiple versions of Java, Groovy, and many other related tools. For this article, I'm using SDK's releases of:

  * Java: version 11.0.12-open of OpenJDK 11
  * Groovy: version 3.0.8



### Back to the problem

[Run-length encoding][4] replaces sequences of identical elements in a list with "runs" (pairs that indicate the number of elements and element values). For example, if I have the list:


```
`[“a”, ”a”, ”a”, ”b”, ”c”, ”c”]`
```

Then when I run-length encode it, I will have a list of lists:


```
`[[3, ”a”], [1, ”b”], [2, ”c”]]`
```

This type of non-destructive compression is relatively simple to implement and reasonably efficient for lists with many groups of repeated values. An example of this type of list is the hourly temperature in places where the daily swing in temperature is limited—like, for instance, Vancouver, Canada, in the winter.

### Run-length encoding in Java

I am going to look at two approaches to this problem in Java. First, the iterative approach:


```


1       import java.lang.*;
       
2       import java.util.List;
3       import java.util.ArrayList;
4       import java.util.Arrays;
       
5       public class Test11 {
       
6           static public void main([String][5] args[]) {
       
7               // Hourly temperature Monday 17 January 2022 in Vancouver
       
8               var hourlyTemp = [Arrays][6].asList(5, 5, 5, 5, 5, 4, 4, 5, 5, 5, 6, 6, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5);
       
9               // Method 1: using forEach()
       
10              var hourlyTempRLE = new ArrayList&lt;ArrayList&lt;Integer&gt;&gt;();
11              hourlyTempRLE.
12                  add(new ArrayList&lt;Integer&gt;([Arrays][6].asList(1,hourlyTemp.get(0))));
13              hourlyTemp.subList(1,hourlyTemp.size()).forEach(temp -&gt; {
14                  var hourlyTempRLETail = hourlyTempRLE.get(hourlyTempRLE.size() - 1);
15                  if (hourlyTempRLETail.get(1) == temp) {
16                      hourlyTempRLETail.
17                          set(0,hourlyTempRLETail.get(0) + 1);
18                  } else {
19                      hourlyTempRLE.
20                          add(new ArrayList&lt;Integer&gt;([Arrays][6].asList(1,temp)));
21                  }
22              });
       
23              [System][7].out.println("hourlyTempRLE using iterator (method 1): " + hourlyTempRLE);
24          }
25      }

```

In line 8, I define `hourlyTemp` as the list of hourly temperatures observed in Vancouver on 17 January 2022. I use the `asList()` static method of the Java List interface, which creates an unmodifiable list (which, for this application, is OK).

In line 10, I define `hourlyTempRLE` as the "list of lists" that will contain the run-length encoded temperatures. I'm using an `ArrayList` of `ArrayList` of `Integer` here to get the list of lists structure.

In line 11, I add the initial sublist or "run" of encoding, setting its first element to 1 (the count) and its second to the first temperature in `hourlyTemp`.

In lines 12 through 22, I process the remaining values of `hourlyTemp`—the expression `hourlyTemp.subList(1,hourlyTemp.size())` is a sublist of `hourlyTemp` starting at the second element (1) and ending at the last element (`hourlyTemp.size() - 1`). I use the `forEach()` method of `ArrayList` to iterate over the elements of that sublist, which passes each element into its Java lambda argument with the parameter `temp`).

In line 13, I set `hourlyTempRLETail` to the last element currently in `hourlyTempRLE`.

In line 14, I check to see if the temp value passed into the lambda is the same as the value of `hourlyTempRLETail`. If it is, I increment its count in lines 15 through 17. Otherwise, in lines 19 and 20, I add a new "run" whose initial value is the sublist of 1 (the count) and the current value of `temp`.

This is pretty compact. Nice to be able to use `var` rather than declaring the type of the variables. I don't see any more compact way of declaring `hourlyTempRLE` and initializing it in the same statement.

Running this script, I obtain the following results:


```


$ javac Test11.java
$ java Test11
hourlyTempRLE using iterator (method 1): [[5, 5], [2, 4], [3, 5], [2, 6], [2, 7], [4, 6], [6, 5]]
$

```

This is what I would expect from examining the `hourlyTemp` list.

One less-than-optimal aspect of the above code is that `hourlyTempRLE` is mutable. This means that subsequent code that uses it must be careful not to change it. Moreover, any multithreaded or parallel execution code that refers to `hourlyTempRLE` should be designed with this mutability in mind.

An easy way around this is to add a line to create an immutable copy using the `copyOf()` method of the Java List interface. But that still leaves the mutable data structure hanging around.

I can use Java Streams to code this in a more functional way:


```


1       import java.lang.*;
       
2       import java.util.List;
3       import java.util.ArrayList;
4       import java.util.Arrays;
       
5       public class Test12 {
       
6           static public void main([String][5] args[]) {
       
7               // Hourly temperature Monday 17 January 2022 in Vancouver
       
8               var hourlyTemp = [Arrays][6].asList(5, 5, 5, 5, 5, 4, 4, 5, 5, 5, 6, 6, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5);
       
9               // Method 2: using collect()
       
10              var hourlyTempRLE = hourlyTemp.stream()
11                  .collect(RLE::new, RLE::accept, RLE::combine)
12                  .getRLE();
       
13              [System][7].out.println("hourlyTempRLE using collect (method 2): " + hourlyTempRLE);
14          }
15      }
       
16      class RLE implements java.util.function.IntConsumer {
       
17          private ArrayList&lt;ArrayList&lt;Integer&gt;&gt; rle = new ArrayList&lt;ArrayList&lt;Integer&gt;&gt;();
       
18          public void accept(int temp) {
19              if (rle.size() &gt; 0) {
20                  var rleTail = rle.get(rle.size() - 1);
21                  if (rleTail.get(1) == temp)
22                      rleTail.set(0,rleTail.get(0) + 1);
23                  else
24                      rle.add(new ArrayList&lt;Integer&gt;([Arrays][6].asList(1,temp)));
25              } else {
26                  rle.add(new ArrayList&lt;Integer&gt;([Arrays][6].asList(1,temp)));
27              }
28          }
       
29          public void combine(RLE other) {
30              rle.addAll(other.getRLE());
31          }
       
32          public ArrayList&lt;ArrayList&lt;Integer&gt;&gt; getRLE() {
33              return rle;
34          }
35      }

```

What’s different? A lot, it seems.

In lines 10 through 12, I have a nice compact, functional solution to defining and accumulating the elements of `hourlyTemp`. In line 10, I convert `hourlyTemp` to a Java Stream using the `stream()` function. In line 11, I use the Streams `collect()` function in conjunction with a class (`RLE`) that I define below to accumulate and reduce the values. In line 12, I call a method on the `RLE` class, `getRLE()`, to get the list of lists. So that's nice and compact. The cost is that I have to define this helper class, `RLE`, in lines 16 through 35.

The first thing I see in the helper class is the definition of the list of lists data structure `rle`, on line 17. This is initialized to an empty `ArrayList<ArrayList<Integer>>` when created.

Then, in lines 18 through 31, you can see the definition of two methods required by the Streams `collect()` method—`accept()`, used to accumulate incoming values (integers in this case) and `combine()`, used to merge a separate `RLE` instance into this one, which happens with parallel accumulations. The third standard method, `new()`, is provided implicitly through the `RLE` constructor.

The accumulation work is done in lines 18 through 28 in the `accept()` method. This method has similar logic to the previous one except that I start off with an empty list which I must detect and initialize. Combining another `RLE` instance with this one is handled in lines 29 through 31 using the `addAll()` method provided by the `ArrayList` class.

Finally, in lines 32 through 34, I define the method `getRLE()`, which returns the list of lists.

Running this produces:


```


$ javac Test12.java
$ java Test12
hourlyTempRLE using collect (method 2): [[5, 5], [2, 4], [3, 5], [2, 6], [2, 7], [4, 6], [6, 5]]
$

```

This is as I would expect.

### Run-length encoding in Groovy

I will look at the same two approaches to this problem in Groovy. First, the iterative approach:


```


1       // Hourly temperature Monday 17 January 2022 in Vancouver
       
2       def hourlyTemp = [5, 5, 5, 5, 5, 4, 4, 5, 5, 5, 6, 6, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5]
       
3       // Method 1: using each {}
       
4       def hourlyTempRLE = [[1,hourlyTemp[0]]]
5       hourlyTemp[1..-1].each { temp -&gt;
6           if (hourlyTempRLE[-1][1] == temp) {
7               hourlyTempRLE[-1][0]++
8           } else {
9               hourlyTempRLE &lt;&lt; [1,temp]
10          }
11      }
       
12      println "hourlyTempRLE using iterator (method 1): $hourlyTempRLE"

```

In line 2, I define `hourlyTemp` as the list of hourly temperatures observed on 17 January 2022 in Vancouver.

In line 4, I initialize the run-length encoded version, `hourlyTempRLE`, as a list of lists with the initial value set to the first temperature in `hourlyTemp` and a count of 1.

In lines 5 through 11, I process the rest of the `hourlyTemp` values. The expression `hourlyTemp[1..-1]` is a _slice_ of `hourlyTemp` starting at the second element (1) and ending at the last element(-1). To process that slice, I apply the Groovy List method `each()`, which takes a Groovy Closure, here looking quite a bit like a Java lambda, whose parameter is `temp`, and iterates over all the values in the list, calling the Closure for each value.

In lines 6 and 7, if the temperature value in the last "run" (that is, the second element of the last sublist in `hourlyTempRLE`, expressed as `hourlyTempRLE[-1][1]`) is the same as the value of `temp`, the count is incremented.

However, if the temperature is different, then in lines 8 through 10, a new "run" gets appended to the list with the count of 1 and the value set to that of `temp`.

Running this script, I observe:


```


$ groovy test11.groovy
hourlyTempRLE using iterator (method 1): [[5, 5], [2, 4], [3, 5], [2, 6], [2, 7], [4, 6], [6, 5]]
$

```

A nice alternative is to use a functional approach:


```


1       // Hourly temperature Monday 17 January 2022 in Vancouver
       
2       def hourlyTemp = [5, 5, 5, 5, 5, 4, 4, 5, 5, 5, 6, 6, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5]
       
3       // Method 2: using inject {}
       
4       def hourlyTempRLE = hourlyTemp[1..-1].inject([[1,hourlyTemp[0]]]) { rle, temp -&gt;
5           if (rle[-1][1] == temp) {
6               rle[-1][0]++
7           } else {
8               rle &lt;&lt; [1,temp]
9           }
10          rle
11      }
       
12      println "hourlyTempRLE using inject (method 2): $hourlyTempRLE"

```

Here I define the same list of hourly temperatures, `hourlyTemp`, as before. This functional approach uses the _list reduce_ approach to convert `hourlyTemp` to its run-length encoded equivalent. This keeps the list creation data internal to the code that iterates over `hourlyTemp` rather than defining variables outside the list creation code, allowing me to declare `hourlyTempRLE` as immutable should I so desire.

In Groovy, list reduce is implemented by the Groovy List `inject()` method, which takes two arguments: The initial value and a Closure that embodies the reduce code.

In lines 4 through 11 above, you see that I define `hourlyTempRLE` as the result of executing the `inject()` with:

  * An initial value of `[[1,hourlyTemp[0]]]`—that is, the initial value of `hourlyTempRLE` is a list containing one sublist whose elements are 1 (the count) and the first temperature from `hourlyTemp` (the value)
  * The Closure `{ rle, temp -> ... }` defined on lines 4 through 11 that has parameters `rle`, the partial result of the `inject()` operation so far, and `temp`, which `inject()` sets to the successive values of the slice `hourlyTemp[1..-1]`



In lines 5 and 6, if the value of the last "run" is the same as the value of `temp` (again, the second element of the partial result so far accumulated, expressed as `rle[-1][1]`) then the count is incremented.

Otherwise, in lines 7 through 9, a new "run" gets appended to the partial result so far accumulated, containing a count of 1 and the value of `temp`.

In line 10, the (modified) partial result so far accumulated is returned as the value of the Closure, which `inject()` uses to replace the previous partial result. In general, in Groovy methods or Closure definitions, the value of the last statement is returned as the value of the method or Closure definition—it is only necessary to use the Groovy `return` statement when returning a value from midway through a method or Closure definition.

As expected, running this script produces:


```


$ groovy test12.groovy
hourlyTempRLE using inject (method 2): [[5, 5], [2, 4], [3, 5], [2, 6], [2, 7], [4, 6], [6, 5]]
$

```

To get a little more familiar with `inject()` you can calculate the sum of `hourlyTemp` and `hourlyTempRLE` by appending the following lines to each of the two scripts:


```


def hourlyTempSum = hourlyTemp.inject(0) { sum, temp -&gt; sum + temp}
def hourlyTempRLESum = hourlyTempRLE.inject(0) { sum, run -&gt;
    sum + (run[0] * run[1])
}

```

Groovy List defines a `sum()` method that would be a more concise way of achieving the result from the first line above. Still, as this is about the most simple example of the reduce operation possible, it's instructive to present it. And in the second line, you can see that I can easily multiply the temperature value by the count of repeat occurrences to produce the same sum. Note that the initial value passed to `inject()` is zero in both cases.

I can use the Groovy `assert` statement to check that the sums are equal as follows:


```
`assert hourlyTempSum == hourlyTempRLESum`
```

Finally, I can uncompress the run-length encoded list by appending the following lines to the end of each of the two scripts:


```


def hourlyTempRLEU = hourlyTempRLE.inject([]) { uncompressed, run -&gt;
    uncompressed &lt;&lt; [run[1]] * run[0]
}.flatten()

```

Here I'm making use of Groovy's operator overloading, and the Groovy List `multiply()` method. "Multiplying" a list (on the left-hand side) by an integer (on the right-hand side) replicates the list. In this case, `inject()` produces a list of sublists, which I want to flatten out into a list, so I use the Groovy List `flatten()` method on the result of `inject()`.

I can use the Groovy `assert` statement to check that the uncompressed list is the same as the original:


```
`assert hourlyTemp == hourlyTempRLEU`
```

**NOTE:** Groovy equality is different from Java equality! In Groovy, `==` is shorthand for the `.equals()` method of any object instance, and `===` is shorthand for the `.is()` method of any object instance and equivalent to Java’s `==`.

### A brief comparison of the Java and Groovy solutions

Compare the Java:


```


var hourlyTempRLE = new ArrayList&lt;ArrayList&lt;Integer&gt;&gt;();
hourlyTempRLE.
        add(new ArrayList&lt;Integer&gt;([Arrays][6].asList(1,hourlyTemp.get(0))));

```

To the Groovy:


```
`def hourlyTempRLE = [[1,hourlyTemp[0]]]`
```

Here you can see how much more compact Groovy can be. And it's not just compactness for compactness' sake. The Groovy code is clearly more readable through its compactness—you can see that `hourlyTempRLE` is a list of lists because of the nested brackets. This compactness is clearly visible elsewhere. 

Compare the Java:


```


hourlyTempRLE.
        get(le).
        set(0,hourlyTempRLE.get(le).get(0) + 1);

```

To the Groovy:


```
`hourlyTempRLE[-1][0]++`
```

Here you can see the syntactical support of the Groovy language for List structures makes the statement much more readable and understandable.

Readability is really important for code maintenance because readability promotes understanding. A quick search with your favorite search engine for phrases like "reading code vs writing code" will turn up many good arguments for readability, like [this one on Opensource.com][8]. The syntactic support for Collection structures in Groovy contributes hugely to the readability of Groovy code.

Another conclusion from the above is that Groovy has really beefed up what you can do with List structures. While current versions of Groovy also support Java Streams, the additional features added to Groovy Collection structures provide much of the same functionality. In this example, using the extensions to List allows you to avoid the whole business with defining the `RLE` helper class required, in some form or another, by the Java Streams approach. You're down to 12 lines of Groovy code instead of 34 lines of Java code. Maybe I've missed something in my understanding of Streams, but I don't see this getting much smaller.

This is a good moment to suggest a review of [the documentation on Groovy collections][9] to learn more.

### Groovy resources

The [Apache Groovy site][10] has a lot of great documentation. Another great Groovy resource is [Mr. Haki][11]. And a really great reason to learn Groovy is to go on and learn [Grails][12], which is a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/accumulating-lists-groovy-vs-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code1_0.png?itok=SBZxppRz (Code with green and blue binary background of ones and zeros)
[2]: https://opensource.com/article/22/1/creating-lists-groovy-java
[3]: https://sdkman.io/
[4]: https://en.wikipedia.org/wiki/Run-length_encoding
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+arrays
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[8]: https://opensource.com/article/19/12/zen-python-trade-offs
[9]: https://docs.groovy-lang.org/next/html/documentation/working-with-collections.html
[10]: https://groovy-lang.org/
[11]: https://blog.mrhaki.com/
[12]: https://grails.org/
