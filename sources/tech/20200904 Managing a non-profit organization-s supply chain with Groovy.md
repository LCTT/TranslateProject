[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing a non-profit organization's supply chain with Groovy)
[#]: via: (https://opensource.com/article/20/9/groovy)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Managing a non-profit organization's supply chain with Groovy
======
Let's use Groovy to solve a charity's distribution problem.
![Jars with food inside on a shelf][1]

There are many reasons I'm a big fan of [Java][2], but perhaps most of all, because of the particular combo of static typing and object-orientedness that imbues its design. However, when I need a quick solution, especially to a "solve it and forget it" problem dealing with data, I usually reach for [Groovy][3] (or sometimes [Python][4]) instead, especially if the library that addresses my problem exists and is well-documented. Sometimes even [awk][5] will do. But I keep meaning to start using [Julia][6] more, and then there's [Go][7].

Every so often, I run across a different kind of problem, and when it is sufficiently compact, sometimes I will solve it in a few languages, just to learn more about how each addresses the problem.

Recently, a non-programmer colleague introduced me to just such a problem. It goes like this:

> Many people living in community XYZ struggle to make ends meet on a daily basis. Employment opportunities in the community are limited and tend to be low-paying. The cost of living is comparatively high: water, electricity, and healthcare are expensive. Post-secondary education, whether academic or technical, means moving to the nearest city. On the plus side, the community is small and close-knit. People help each other out as much as their circumstances permit.
>
> COVID-19 has hit this community hard in the economic sense. Although there haven't been any infections yet, the two main employers in the town are facing financial ruin and have laid off almost all of their workers. The government has helped out, but the amount of help is not enough for the families struggling the hardest.
>
> A local branch of a national charity has received some funding to provide support to families in need. Seeking to stretch this funding as much as possible, the charity arranges to buy bulk lots of food and household supplies, then break up the bulk lots into family hampers of approximately equal monetary value. Their question is, how to do so?

My colleague thought that perhaps I could help him with a spreadsheet to handle the distribution. However, to me, this seemed to be the perfect little problem to solve with a small program. What might the steps be?

  1. Unpack the bulk packages into their individual units.
  2. While there are still units left:
    1. Grab a fresh hamper.
    2. Set the hamper value to zero.
    3. While the hamper value is less than the ideal hamper value and there are still units left:
      1. Pick a unit at random.
      2. If that unit isn't in the hamper and if the hamper value wouldn't be too high by adding it:
        1. Move the unit to the hamper.
        2. Increment the hamper value by the unit price.



That seems like a good first approximation. It also seems like the perfect small algorithm to implement in Groovy.

### The Groovy solution

In Java, I find myself declaring utility classes to hold tuples of data (the new record feature is going to be great for that). In Groovy, I tend to use the language support for maps. Let's use a list of maps to hold the bulk items picked up from the wholesaler:


```
def packs = [
    [item:'Rice',brand:'Best Family',units:10,price:5650,quantity:1],
    [item:'Spaghetti',brand:'Best Family',units:1,price:327,quantity:10],
    [item:'Sardines',brand:'Fresh Caught',units:3,price:2727,quantity:3],
    [item:'Chickpeas',brand:'Southern Style',units:2,price:2600,quantity:5],
    [item:'Lentils',brand:'Southern Style',units:2,price:2378,quantity:5],
    [item:'Vegetable oil',brand:'Crafco',units:12,price:10020,quantity:1],
    [item:'UHT milk',brand:'Atlantic',units:6,price:4560,quantity:2],
    [item:'Flour',brand:'Neighbor Mills',units:10,price:5200,quantity:1],
    [item:'Tomato sauce',brand:'Best Family',units:1,price:190,quantity:10],
    [item:'Sugar',brand:'Good Price',units:1,price:565,quantity:10],
    [item:'Tea',brand:'Superior',units:5,price:2720,quantity:2],
    [item:'Coffee',brand:'Colombia Select',units:2,price:4180,quantity:5],
    [item:'Tofu',brand:'Gourmet Choice',units:1,price:1580,quantity:10],
    [item:'Bleach',brand:'Blanchite',units:5,price:3550,quantity:2],
    [item:'Soap',brand:'Sunny Day',units:6,price:1794,quantity:2]]
```

There is one bulk pack of 10 bags of rice and 10 bulk packs with one bag each of spaghetti. In the above, the variable `packs` is set to a list (actually a Java `ArrayList` underneath) of maps (actually a Java `HashMap` underneath). Because Groovy is dynamically typed (by default, anyway), I use `def` to declare the `packs` variable and am happy to have both `String` and `Integer` values in my maps.

And yes, those prices do look a bit strange, but this problem happened in a place with a different currency.

The next step is to unpack these bulk packages. Unpacking the single bulk package of rice yields 10 units of rice; that is, the total number of units yielded is `units * quantity`. Groovy provides a handy function called `collectMany` that can be used to flatten lists of lists, so the code to carry out the unpacking is really straightforward:


```
def units = packs.collectMany { pack -&gt;
    [[item:pack.item, brand:pack.brand, price:(pack.price / pack.units)]] *
                (pack.units * pack.quantity)
}
```

Note that `collectMany` takes a `Closure` as its argument; so this is a kind of locally declared function with a single parameter, `pack`, that returns a list of (`units * quantity`) maps, with each map including the item, brand, and calculated unit price from the corresponding bulk pack. Of note here is that the Groovy multiply operator (`*`) with a list on the left side and a number (`N`) on the right will produce a list with the original items replicated in order `N` times.

The final step is to repack the units into the hampers for distribution. But first, I need to get a bit more specific about the ideal hamper value, and I might as well not be overly restrictive when there are just a few units left:


```
def valueIdeal = 5000
def valueMax = valueIdeal * 1.1
```

OK! Let's repack the hampers:


```
def rnd = new [Random][8]()
def hamperNumber = 0    // [1]

while (units.size()) {  // [2]
    hamperNumber++
    def hamper = []
    def value = 0       // [2.1]
    for (boolean canAdd = true; canAdd; ) {        // [2.2]
        int u = rnd.nextInt(units.size())          // [2.2.1]
        canAdd = false                             // [2.2.2]
        for (int o = 0; o &lt; units.size(); o++) {   // [2.2.3]
            int uo = (u + o) % units.size()
            def unit = units[uo]                   // [2.2.3.1]
            if (units.size() &lt; 3 ||
                        !(unit in hamper) &amp;&amp;
                        (value + unit.price) &lt; valueMax) { // [2.2.3.2]
                hamper.add(unit)
                value += unit.price
                units.remove(uo)                   // [2.2.3.3]
                canAdd = units.size() &gt; 0
                break                              // [2.2.3.4]
            }
        }                                          // [2.2.4]
    }
    println ""
    println "Hamper $hamperNumber value $value:"
    hamper.each { item -&gt;
        printf "%-25s%-25s%7.2f\n",item.item,item.brand,item.price
    }                                                                   // [2.3]
    println "Remaining units ${units.size()} average price = $avgPrice" // [2.4]
}
```

Some clarification, with numbers in brackets in the comments above (e.g., _[1]_) corresponding to the clarifications below:

  * 1\. Initialize Groovy's random number generator and the hamper number.
  * 2\. This `while {}` loop will redistribute units into hampers as long as there are more available:
    * 2.1 Increment the hamper number, get a new empty hamper (a list of units), and set its value to 0.
    * 2.2 This `for {}` loop will add as many units to the hamper as possible:
      * 2.2.1 Get a random number between zero and the number of remaining units minus 1.
      * 2.2.2 Assume you can't find more units to add.
      * 2.2.3 This `for {}` loop, starting at the randomly chosen index, will try to find a unit that can be added to the hamper.
        * 2.2.3.1 Figure out which unit to look at.
        * 2.2.3.2 Add this unit to the hamper if there are only a few left or if the value of the hamper isn't too high once the unit is added.
        * 2.2.3.3 Add the unit to the hamper, increment the hamper value by the unit price, and remove the unit from the available units list.
        * 2.2.3.4 As long as there are units left, you can add more, so break out of this loop to keep looking.
      * 2.2.4 On exit from this `for {}` loop, if you inspected every remaining unit and could not find one to add to the hamper, the hamper is complete; otherwise, you found one and can continue looking for more.
    * 2.3 Print out the contents of the hamper.
    * 2.4 Print out the remaining units info.



When you run this code, the output looks like:


```
Hamper 1 value 5414:
Vegetable oil            Crafco                    835.00
Coffee                   Colombia Select          2090.00
Tofu                     Gourmet Choice           1580.00
Sardines                 Fresh Caught              909.00
Remaing units 151

Hamper 2 value 5309:
Flour                    Neighbor Mills            520.00
Sugar                    Good Price                565.00
Vegetable oil            Crafco                    835.00
Coffee                   Colombia Select          2090.00
Rice                     Best Family               565.00
Tomato sauce             Best Family               190.00
Tea                      Superior                  544.00
Remaing units 144

Hamper 3 value 5395:
Flour                    Neighbor Mills            520.00
UHT milk                 Atlantic                  760.00
Tomato sauce             Best Family               190.00
Tofu                     Gourmet Choice           1580.00
Spaghetti                Best Family               327.00
Sugar                    Good Price                565.00
Sardines                 Fresh Caught              909.00
Tea                      Superior                  544.00
Remaing units 136

…

Hamper 23 value 5148:
Flour                    Neighbor Mills            520.00
Tea                      Superior                  544.00
Chickpeas                Southern Style           1300.00
Lentils                  Southern Style           1189.00
Vegetable oil            Crafco                    835.00
UHT milk                 Atlantic                  760.00
Remaing units 3

Hamper 24 value 3955:
Chickpeas                Southern Style           1300.00
Sugar                    Good Price                565.00
Coffee                   Colombia Select          2090.00
Remaing units 0
```

The last hamper is abbreviated in contents and value.

### Closing thoughts

Note there is some fiddly business about being able to add units to the hamper. Basically, you pick a random position in the list of units and, starting at that position, iterate through the list until you either find a unit whose price allows it to be included or until you exhaust the list. Also, when there are only a few items left, you just toss them into the last hamper.

Another issue worth mentioning: This isn't a particularly efficient approach. Removing elements from `ArrayLists`, letting Groovy use its default `BigDecimal`, and a few other things make this less suitable for a huge redistribution problem. Still, it runs quite rapidly on my aging dual-core machine.

And one final thought—using `while { … }` and `for { … }`? Really? Not some cool functional code? Afraid so. I couldn't think of a way to use map and reduce style closures in Groovy in collaboration with a random selection of units for repackaging. Can you?

In another article article, I'll solve this in Python, and future articles will do it in Java, Julia, and Go.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/groovy

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_secret_ingredient_520x292.png?itok=QbKzJq-N (Jars with food inside on a shelf)
[2]: https://www.java.com/en/
[3]: https://groovy-lang.org/
[4]: https://www.python.org/
[5]: https://www.gnu.org/software/gawk/manual/gawk.html
[6]: https://julialang.org/
[7]: https://golang.org/
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
