[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Solve a real-world problem using Java)
[#]: via: (https://opensource.com/article/20/9/problem-solving-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Solve a real-world problem using Java
======
See how Java differs from Python and Groovy as it's used to solve a
charity's real-world problem.
![Coffee beans and a cup of coffee][1]

As I wrote in the first two articles in this series, I enjoy solving small problems by writing small programs in different languages, so I can compare the different ways they approach the solution. The example I'm using in this series is dividing bulk supplies into hampers of similar value to distribute to struggling neighbors in your community, which you can [read about][2] in the first article in this series.

In the first article, I solved this problem [using the Groovy programming language][2], which is like Python in many ways, but syntactically it's more like C and Java. In the second article, I [solved it in Python][3] with a very similar design and effort, which demonstrates the resemblance between the languages.

Now I'll try it in [Java][4].

### The Java solution

When working in Java, I find myself declaring utility classes to hold tuples of data (the new record feature is going to be great for that), rather than using the language support for maps offered in Groovy and Python. This is because Java encourages creating maps that map one specific type to another specific type, but in Groovy or Python, it's cool to have a map with mixed-type keys and mixed-type values.

The first task is to define these utility classes, and the first is the `Unit` class:


```
class Unit {
    private [String][5] item, brand;
    private int price;

    public Unit([String][5] item, [String][5] brand, int price) {
        this.item = item;
        this.brand = brand;
        this.price = price;
    }
    public [String][5] getItem() { return this.item; }
    public [String][5] getBrand() { return this.brand; }
    public int getPrice() { return this.price; }

    @Override
    public [String][5] toString() { return [String][5].format("item: %s brand: %s price: %d",item,brand,price); }
}
```

There's nothing too startling here. I effectively created a class whose instances are immutable since there are no setters for fields `item`, `brand`, or `price` and they are declared `private`. As a general rule, I don't see value in creating a mutable data structure unless I'm going to mutate it; and in this application, I don't see any value in mutating the `Unit` class.

While more effort is required to create these utility classes, creating them encourages a bit more design effort than just using a map, which can be a good thing. In this case, I realized that a bulk package is composed of a number of individual units, so I created the `Pack` class:


```
class Pack {
    private Unit unit;
    private int count;

    public Pack([String][5] item, [String][5] brand, int unitCount, int packPrice) {
        this.unit = new Unit(item, brand, unitCount &gt; 0 ? packPrice / unitCount : 0);
        this.count = unitCount;
    }

    public [String][5] getItem() { return unit.getItem(); }
    public [String][5] getBrand() { return unit.getBrand(); }
    public int getUnitPrice() { return unit.getPrice(); }
    public int getUnitCount() { return count; }
    public List&lt;Unit&gt; unpack() { return [Collections][6].nCopies(count, unit); }

    @Override
    public [String][5] toString() { return [String][5].format("item: %s brand: %s unitCount: %d unitPrice: %d",unit.getItem(),unit.getBrand(),count,unit.getPrice()); }
}
```

Similar to the `Unit` class, the `Pack` class is immutable. A couple of things worth mentioning here:

  1. I could have passed a `Unit` instance into the `Pack` constructor. I chose not to because the bundled, physical nature of a bulk package encouraged me to think of the "unit-ness" as an internal thing not visible from the outside but that requires unpacking to expose the units. Is this an important decision in this case? Probably not, but to me, at least, it's always good to think through this kind of consideration.
  2. Which leads to the `unpack()` method. The `Pack` class creates the list of `Unit` instances only when you call this method—that is, the class is _lazy_. As a general design principle, I've found it's worthwhile to decide whether a class' behavior should be eager or lazy, and when it doesn't seem to matter, I go with lazy. Is this an important decision in this case? Maybe—this lazy design enables a new list of `Unit` instances to be generated on every call of `unpack()`, which could prove to be a good thing down the road. In any case, getting in the habit of always thinking about eager vs. lazy behavior is a good habit.



The sharp-eyed reader will note that, unlike in the Groovy and Python examples where I was mostly focused on compact code and spent way less time thinking about design decisions, here, I separated the definition of a `Pack` from the number of `Pack` instances purchased. Again, from a design perspective, this seemed like a good idea as the `Pack` is conceptually quite independent of the number of `Pack` instances acquired.

Given this, I need one more utility class: the `Bought` class:


```
class Bought {
    private Pack pack;
    private int count;

    public Bought(Pack pack, int packCount) {
        this.pack = pack;
        this.count = packCount;
    }

    public [String][5] getItem() { return pack.getItem(); }
    public [String][5] getBrand() { return pack.getBrand(); }
    public int getUnitPrice() { return pack.getUnitPrice(); }
    public int getUnitCount() { return pack.getUnitCount() * count; }
    public List&lt;Unit&gt; unpack() { return [Collections][6].nCopies(count, pack.unpack()).stream().flatMap([List][7]::stream).collect(Collectors.toList()); }

    @Override
    public [String][5] toString() { return [String][5].format("item: %s brand: %s bought: %d pack(s) totalUnitCount: %d unitPrice: %d",pack.getItem(),pack.getBrand(),count,pack.getUnitCount() * count,pack.getUnitPrice()); }
}
```

Notably:

  1. I decided to pass a `Pack` into the constructor. Why? Because to my way of thinking, the physical structure of the purchased bulk packages is external, not internal, as in the case of the individual bulk packages. Once again, it may not be important in this application, but I believe it's always good to think about these things. If nothing else, note that I am not married to symmetry!
  2. Once again the `unpack()` method demonstrates the lazy design principle. This goes to more effort to generate a list of `Unit` instances (rather than a _list of lists_ of `Unit` instances, which would be easier but require flattening further out in the code).



OK! Time to move on and solve the problem. First, declare the purchased packs:


```
        var packs = new Bought[] {
            new Bought(new Pack("Rice","Best Family",10,5650),1),
            new Bought(new Pack("Spaghetti","Best Family",1,327),10),
            new Bought(new Pack("Sardines","Fresh Caught",3,2727),3),
            new Bought(new Pack("Chickpeas","Southern Style",2,2600),5),
            new Bought(new Pack("Lentils","Southern Style",2,2378),5),
            new Bought(new Pack("Vegetable oil","Crafco",12,10020),1),
            new Bought(new Pack("UHT milk","Atlantic",6,4560),2),
            new Bought(new Pack("Flour","Neighbor Mills",10,5200),1),
            new Bought(new Pack("Tomato sauce","Best Family",1,190),10),
            new Bought(new Pack("Sugar","Good Price",1,565),10),
            new Bought(new Pack("Tea","Superior",5,2720),2),
            new Bought(new Pack("Coffee","Colombia Select",2,4180),5),
            new Bought(new Pack("Tofu","Gourmet Choice",1,1580),10),
            new Bought(new Pack("Bleach","Blanchite",5,3550),2),
            new Bought(new Pack("Soap","Sunny Day",6,1794),2)
        };
```

This is pretty nice from a readability perspective: there is one pack of Best Family Rice containing 10 units that cost 5,650 (using those crazy monetary units, like in the other examples). It's straightforward to see that in addition to the one bulk pack of 10 bags of rice, the organization acquired 10 bulk packs of one bag each of spaghetti. The utility classes are doing some work under the covers, but that's not important at this point because of the great design job!

Note the `var` keyword is used here; it's one of the nice features in recent versions of Java that help make the language a bit less verbose (the principle is called _DRY_—don't repeat yourself) by letting the compiler infer the variable's data type from the right-side expression's type. This looks kind of similar to the Groovy `def` keyword, but since Groovy by default is dynamically typed and Java is statically typed, the typing information inferred in Java by `var` persists throughout the lifetime of that variable.

Finally, it's worth mentioning that `packs` here is an array and not a `List` instance. If you were reading this data from a separate file, you would probably prefer to create it as a list.

Next, unpack the bulk packages. Because the unpacking of `Pack` instances is delegated into lists of `Unit` instances, you can use that like this:


```
        var units = Stream.of(packs)
            .flatMap(bought -&gt; {
                return bought.unpack().stream(); })
            .collect(Collectors.toList());
```

This uses some of the nice functional programming features introduced in later Java versions. Convert the array `packs` declared previously to a Java stream, use `flatmap()` with a lambda to flatten the sublists of units generated by the `unpack()` method of the `Bought` class, and collect the resulting stream elements back into a list.

As in the Groovy and Java solutions, the final step is repacking the units into the hampers for distribution. Here's the code—it's not much wordier than the Groovy version (tiresome semicolons aside) nor really all that different:


```
        var valueIdeal = 5000;
        var valueMax = [Math][8].round(valueIdeal * 1.1);
        var rnd = new [Random][9]();
        var hamperNumber = 0;                         // [1]

        while (units.size() &gt; 0) {                    // [2]
            hamperNumber++;
            var hamper = new ArrayList&lt;Unit&gt;();
            var value = 0;                            // [2.1]
            for (boolean canAdd = true; canAdd; ) {   // [2.2]
                var u = rnd.nextInt(units.size());            // [2.2.1]
                canAdd = false;                               // [2.2.2]
                for (int o = 0; o &lt; units.size(); o++) {      // [2.2.3]
                    var uo = (u + o) % units.size();
                    var unit = units.get(uo);                      // [2.2.3.1]
                    if (units.size() &lt; 3 ||
                            !hamper.contains(unit) &amp;&amp;
                            (value + unit.getPrice()) &lt; valueMax) { // [2.2.3.2]
                        hamper.add(unit);
                        value += unit.getPrice();
                        units.remove(uo);                           // [2.2.3.3]
                        canAdd = units.size() &gt; 0;
                        break;                                      // [2.2.3.4]
                    }
                }
            }                                                // [2.2.4]
            [System][10].out.println();
            [System][10].out.printf("Hamper %d value %d:\n",hamperNumber,value);
            hamper.forEach(unit -&gt; {
                [System][10].out.printf("%-25s%-25s%7d\n", unit.getItem(), unit.getBrand(),
                       unit.getPrice());
            });                                                      // [2.3]
            [System][10].out.printf("Remaining units %d\n",units.size());  // [2.4]
```

Some clarification, with numbers in brackets in the comments above (e.g., _[1]_) corresponding to the clarifications below:

  * 1\. Set up the ideal and maximum values to be loaded into any given hamper, initialize Java's random number generator and the hamper number.
  * 2\. This `while {}` loop will redistribute units into hampers as long as there are more available:
    * 2.1 Increment the hamper number, get a new empty hamper (a list of `Unit` instances), and set its value to 0.
    * 2.2 This `for {}` loop will add as many units to the hamper as possible:
      * 2.2.1 Get a random number between zero and the number of remaining units minus 1.
      * 2.2.2 Assume you can't find more units to add.
      * 2.2.3 This `for {}` loop, starting at the randomly chosen index, will try to find a unit that can be added to the hamper.
        * 2.2.3.1 Figure out which unit to look at.
        * 2.2.3.2 Add this unit to the hamper if there are only a few left or if the value of the hamper isn't too high once the unit is added _and_ that unit isn't already in the hamper.
        * 2.2.3.3 Add the unit to the hamper, increment the hamper value by the unit price, and remove the unit from the available units list.
        * 2.2.3.4 As long as there are units left, you can add more, so break out of this loop to keep looking.
      * 2.2.4 On exit from this `for {}` loop, if you inspected every remaining unit and could not find one to add to the hamper, the hamper is complete; otherwise, you found one and can continue looking for more.
    * 2.3 Print out the contents of the hamper.
    * 2.4 Print out the remaining units info.



When you run this code, the output looks quite similar to the output from the Groovy and Python programs:


```
Hamper 1 value 5465:
Tofu                     Gourmet Choice              1580
Bleach                   Blanchite                    710
Coffee                   Colombia Select             2090
Flour                    Neighbor Mills               520
Sugar                    Good Price                   565
Remaining units 150

Hamper 2 value 5482:
Sardines                 Fresh Caught                 909
Tomato sauce             Best Family                  190
Vegetable oil            Crafco                       835
UHT milk                 Atlantic                     760
Chickpeas                Southern Style              1300
Lentils                  Southern Style              1189
Soap                     Sunny Day                    299
Remaining units 143

Hamper 3 value 5353:
Soap                     Sunny Day                    299
Rice                     Best Family                  565
UHT milk                 Atlantic                     760
Flour                    Neighbor Mills               520
Vegetable oil            Crafco                       835
Bleach                   Blanchite                    710
Tomato sauce             Best Family                  190
Sardines                 Fresh Caught                 909
Sugar                    Good Price                   565
Remaining units 134

…

Hamper 23 value 5125:
Sardines                 Fresh Caught                 909
Rice                     Best Family                  565
Spaghetti                Best Family                  327
Lentils                  Southern Style              1189
Chickpeas                Southern Style              1300
Vegetable oil            Crafco                       835
Remaining units 4

Hamper 24 value 2466:
UHT milk                 Atlantic                     760
Spaghetti                Best Family                  327
Vegetable oil            Crafco                       835
Tea                      Superior                     544
Remaining units 0
```

The last hamper is abbreviated in contents and value.

### Closing thoughts

The similarities in the "working code" with the Groovy original are obvious—the close relationship between Groovy and Java is evident. Groovy and Java diverged in a few ways in things that were added to Java after Groovy was released, such as the `var` vs. `def` keywords and the superficial similarities and differences between Groovy closures and Java lambdas. Moreover, the whole Java streams framework adds a great deal of power and expressiveness to the Java platform (full disclosure, in case it's not obvious—I am but a babe in the Java streams woods).

Java's intent to use maps for mapping instances of a single type to instances of another single type pushes you to use utility classes, or tuples, instead of the more inherently flexible intents in Groovy maps (which are basically just `Map<Object,Object>` plus a lot of syntactic sugar to vanish the kinds of casting and `instanceof` hassles that you would create in Java) or in Python. The bonus from this is the opportunity to apply some real design effort to these utility classes, which pays off at least insofar as it instills good habits in the programmer.

Aside from the utility classes, there isn't a lot of additional ceremony nor boilerplate in the Java code compared to the Groovy code. Well, except that you need to add a bunch of imports and wrap the "working code" in a class definition, which might look like this:


```
import java.lang.*;
import java.util.*;
import java.util.Collections.*;
import java.util.stream.*;
import java.util.stream.Collectors.*;
import java.util.Random.*;

public class Distribute {

    static public void main([String][5][] args) {
        // the working code shown above
    }
}
class Unit { … }
class Pack { … }
class Bought { … }
```

The same fiddly bits are necessary in Java as they are in Groovy and Python when it comes to grabbing stuff out of the list of `Unit` instances for the hampers, involving random numbers, loops through remaining units, etc.

Another issue worth mentioning—this isn't a particularly efficient approach. Removing elements from `ArrayLists`, being careless about repeated expressions, and a few other things make this less suitable for a huge redistribution problem. I've been a bit more careful here to stick with integer data. But at least it's quite quick to execute.

Yes, I'm still using the dreaded `while { … }` and `for { … }`. I still haven't thought of a way to use map and reduce style stream processing in conjunction with a random selection of units for repackaging. Can you?

Stay tuned for the next articles in this series, with versions in [Julia][11] and [Go][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/problem-solving-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/20/8/solving-problem-groovy
[3]: https://opensource.com/article/20/8/solving-problem-python
[4]: https://www.java.com/en/
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+collections
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+list
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+math
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[11]: https://julialang.org/
[12]: https://golang.org/
