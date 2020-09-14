[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Python to solve a charity's business problem)
[#]: via: (https://opensource.com/article/20/9/solve-problem-python)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Use Python to solve a charity's business problem
======
Comparing how different programming languages solve the same problem is
fun and instructive. Next up, Python.
![Python programming language logo with question marks][1]

In my [first article][2] in this series, I described a problem of dividing bulk supplies into hampers of similar value to distribute to struggling neighbors in your community. I also wrote about how I enjoy solving small problems like this with small programs in various languages and comparing how they do it.

In the first article, I solved this problem with the [Groovy][3] programming language. Groovy is like [Python][4] in many ways, but syntactically it's more like C and Java. Therefore, it should be interesting and instructive to create the same solution in Python.

### The Python solution

In Java, I declare utility classes to hold tuples of data (the new record feature is going to be great for that). In Groovy, I use the language support for maps, and I follow the same approach in Python.

Use a list of dictionaries to hold the bulk items picked up from the wholesaler:


```
packs = [
        {'item':'Rice','brand':'Best Family','units':10,'price':5650,'quantity':1},
        {'item':'Spaghetti','brand':'Best Family','units':1,'price':327,'quantity':10},
        {'item':'Sardines','brand':'Fresh Caught','units':3,'price':2727,'quantity':3},
        {'item':'Chickpeas','brand':'Southern Style','units':2,'price':2600,'quantity':5},
        {'item':'Lentils','brand':'Southern Style','units':2,'price':2378,'quantity':5},
        {'item':'Vegetable oil','brand':'Crafco','units':12,'price':10020,'quantity':1},
        {'item':'UHT milk','brand':'Atlantic','units':6,'price':4560,'quantity':2},
        {'item':'Flour','brand':'Neighbor Mills','units':10,'price':5200,'quantity':1},
        {'item':'Tomato sauce','brand':'Best Family','units':1,'price':190,'quantity':10},
        {'item':'Sugar','brand':'Good Price','units':1,'price':565,'quantity':10},
        {'item':'Tea','brand':'Superior','units':5,'price':2720,'quantity':2},
        {'item':'Coffee','brand':'Colombia Select','units':2,'price':4180,'quantity':5},
        {'item':'Tofu','brand':'Gourmet Choice','units':1,'price':1580,'quantity':10},
        {'item':'Bleach','brand':'Blanchite','units':5,'price':3550,'quantity':2},
        {'item':'Soap','brand':'Sunny Day','units':6,'price':1794,'quantity':2}]
```

There is one bulk pack of 10 bags of rice and 10 bulk packs with one bag each of spaghetti. In the above, the variable `packs` is set to a Python list of dictionaries. This turns out to be very similar to the Groovy approach. A few points worth noting about the difference between Groovy and Python:

  1. In Python, there is no keyword used to define the variable `packs`; Python expects the first use to set a value.
  2. Python dictionary keys (e.g., `item`, `brand`, `units`, `price`, `quantity`) require quotes to indicate they are strings; Groovy assumes these are strings, but accepts quotes as well.
  3. In Python, the notation `{ … }` indicates a dictionary declaration; Groovy uses the same square brackets as a list, but the structure in both cases must have key-value pairs.



And, yes, those prices aren't in US dollars.

Next, unpack the bulk packages. Unpacking the single bulk package of rice, for example, will yield 10 units of rice; that is, the total number of units yielded is `units * quantity`. The Groovy script uses a handy function called `collectMany` that can be used to flatten out lists of lists. As far as I know, Python doesn't have anything similar, so use two list comprehensions to produce the same result:


```
units = [[{'item':pack['item'],'brand':pack['brand'],
        'price':(pack['price'] / pack['units'])}] *
        (pack['units'] * pack['quantity']) for pack in packs]
units = [x for sublist in units for x in sublist]
```

The first list comprehension (assignment to units) builds the list of lists of dictionaries. The second "flattens" that into just a list of dictionaries. Note that both Python and Groovy provide an `*` operator that takes a list on the left and a number `N` on the right and replicates the list `N` times.

The final step is to repack the units into the hampers for distribution. As in the Groovy version, you need to get a bit more specific about the ideal hamper value, and you might as well not be overly restrictive when you get down to just a few units left:


```
valueIdeal = 5000
valueMax = valueIdeal * 1.1
```

OK! Repack the hampers:


```
import random
hamperNumber = 0           # [1]
while len(units) &gt; 0:      # [2]
    hamperNumber += 1
    hamper = []
    value = 0
    canAdd = True              # [2.1]
    while canAdd:              # [2.2]
        u = random.randint(0,len(units)-1)  # [2.2.1]
        canAdd = False                      # [2.2.2]
        o = 0                               # [2.2.3]
        while o &lt; len(units):               # [2.2.4]
            uo = (u + o) % len(units)
            unit = units[uo]
            unitPrice = unit['price']          # [2.2.4.1]
            if len(units) &lt; 3 or not (unit in hamper) and (value + unitPrice) &lt; valueMax:
                                               # [2.2.4.2]
                hamper.append(unit)
                value += unitPrice
                units.pop(u)                   # [2.2.4.3]
                canAdd = len(units) &gt; 0
                break                          # [2.2.4.4]
            o += 1                             # [2.2.4.5]
                                            # [2.2.5]
    print('')
    print('Hamper',hamperNumber,'value',value)
    for item in hamper:
        print('%-25s%-25s%7.2f' % (item['item'],item['brand'],item['price'])) # [2.3]
    print('Remaining units',len(units))                                       # [2.4]
```

Some clarification, with numbers in brackets in the comments above (e.g., _[1]_) corresponding to the clarifications below:

  * 1\. Import Python's random number generator facilities and initialize the hamper number.
  * 2\. This `while` loop will redistribute units into hampers as long as there are more available:
    * 2.1 Increment the hamper number, get a new empty hamper (a list of units), and set its value to 0; start off assuming you can add more items to the hamper.
    * 2.2 This `while` loop will add as many units to the hamper as possible (the Groovy code used a `for` loop, but Python's `for` loops expect to iterate over something, while Groovy has the more traditional C form of `for` loop):
      * 2.2.1 Get a random number between zero and the number of remaining units minus 1.
      * 2.2.2 Assume you can't find more units to add.
      * 2.2.3 Create a variable to be used for the offset from the starting point where you're looking for items to put in the hamper.
      * 2.2.4 Starting at the randomly chosen index, this `while` loop will try to find a unit that can be added to the hamper (once again, note that the Python `for` loop probably isn't suitable here since the length of the list will change during processing).
        * 2.2.4.1. Figure out which unit to look at (random starting point + offset) and get its price.
        * 2.2.4.2 You can add this unit to the hamper if there are only a few left or if the value of the hamper isn't too high once the unit is added.
        * 2.2.4.3 Add the unit to the hamper, increment the hamper value by the unit price, remove the unit from the available units list.
        * 2.2.4.4 As long as there are units left, you can add more, so break out of this loop to keep looking.
        * 2.2.4.5 Increment the offset.
      * 2.2.5 On exit from this `while` loop, if you inspected every remaining unit and could not find one to add to the hamper, the hamper is complete; otherwise, you found one and can continue looking for more.
    * 2.3 Print out the contents of the hamper.
    * 2.4 Print out the remaining units info.



When you run this code, the output looks quite similar to the output from the Groovy program:


```
Hamper 1 value 5304.0
UHT milk                 Atlantic                  760.00
Tomato sauce             Best Family               190.00
Rice                     Best Family               565.00
Coffee                   Colombia Select          2090.00
Sugar                    Good Price                565.00
Vegetable oil            Crafco                    835.00
Soap                     Sunny Day                 299.00
Remaining units 148

Hamper 2 value 5428.0
Tea                      Superior                  544.00
Lentils                  Southern Style           1189.00
Flour                    Neighbor Mills            520.00
Tofu                     Gourmet Choice           1580.00
Vegetable oil            Crafco                    835.00
UHT milk                 Atlantic                  760.00
Remaining units 142

Hamper 3 value 5424.0
Soap                     Sunny Day                 299.00
Chickpeas                Southern Style           1300.00
Sardines                 Fresh Caught              909.00
Rice                     Best Family               565.00
Vegetable oil            Crafco                    835.00
Spaghetti                Best Family               327.00
Lentils                  Southern Style           1189.00
Remaining units 135

…

Hamper 21 value 5145.0
Tomato sauce             Best Family               190.00
Tea                      Superior                  544.00
Chickpeas                Southern Style           1300.00
Spaghetti                Best Family               327.00
UHT milk                 Atlantic                  760.00
Vegetable oil            Crafco                    835.00
Lentils                  Southern Style           1189.00
Remaining units 4

Hamper 22 value 2874.0
Sardines                 Fresh Caught              909.00
Vegetable oil            Crafco                    835.00
Rice                     Best Family               565.00
Rice                     Best Family               565.00
Remaining units 0
```

The last hamper is abbreviated in contents and value.

### Closing thoughts

At a glance, there isn't a whole lot of difference between the Python and Groovy versions of this program. Both have a similar set of constructs that make handling lists and dictionaries very straightforward. Neither requires a lot of "boilerplate code" or other "ceremonial" actions.

Also, as in the Groovy example, there is some fiddly business about being able to add units to the hamper. Basically, you pick a random position in the list of units and, starting at that position, iterate through the list until you either find a unit whose price allows it to be included or until you exhaust the list. Also, when there are only a few items left, you just toss them into the last hamper.

Another issue worth mentioning: This isn't a particularly efficient approach. Removing elements from lists, being careless about repeated expressions, and a few other things make this less suitable for a huge redistribution problem. Still, it runs in a blink on my old machine.

If you are shuddering at my use of `while` loops and mutating the data in this code, you probably wish I made it more functional. I couldn't think of a way to use map and reduce features in Python in conjunction with a random selection of units for repackaging. Can you?

In the next article, I'll re-do this in Java just to see how much less effort Groovy and Python are, and future articles will cover Julia and Go.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/solve-problem-python

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://opensource.com/article/20/8/solving-problem-groovy
[3]: https://groovy-lang.org/
[4]: https://www.python.org/
