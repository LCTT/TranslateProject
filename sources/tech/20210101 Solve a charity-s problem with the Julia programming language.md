[#]: subject: "Solve a charity's problem with the Julia programming language"
[#]: via: "https://opensource.com/article/21/1/solve-problem-julia"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Solve a charity's problem with the Julia programming language
======
See how Julia differs from Java, Python, and Groovy to solve a food bank's real-world problem.

![Puzzle pieces coming together to form a computer screen][1]

Image by: Opensource.com

I have been writing a series of articles about solving a nice, small, and somewhat unusual problem in different programming languages ([Groovy][2], [Python][3], and [Java][4] so far).

Briefly, the problem is how to unpack bulk supplies into their units (for example, dividing a 10 pack of one-pound bags of your favorite coffee) and repackage them into hampers of similar value to distribute to struggling neighbors in the community.

The three solutions I have already explored constructed lists of the number of bulk packages acquired. I accomplished this by using maps in Groovy, dictionaries in Python, and tuples implemented as utility classes in Java. I used list-processing functionality in each language to unpack the bulk packages into a list of their constituents, which I modeled using maps, dictionaries, and tuples, respectively. I needed to take an iterative approach to move units from a list into hampers; this iterative approach was quite similar from one language to the other, with the minor difference that I could use `for {...}` loops in Groovy and Java and needed `while…:` in Python. But all in all, they used very similar solutions with hints of functional programming and behavior encapsulated in objects here and there.

### Meet Julia

In this article, I'll explore the same problem in [Julia][5], which (among other things) means leaving aside the object-oriented and functional programming paradigms I'm used to. I struggle with languages that aren't object-oriented. I've been programming in Java since around 1997 and in Groovy since about 2008, so I'm used to having data and behavior bundled together. Aside from just generally liking the look of code where method calls hang off objects or sometimes classes, I really like the way class documentation packages up what data is handled by the class and how it is handled. This seems so "natural" to me now that learning a language whose documentation describes types and functions separately seems difficult to me.

And speaking of learning a language, I'm a real neophyte when it comes to Julia. I like its orientation toward the kinds of problems I typically need to solve (e.g., data, computations, results). I like the desire for speed. I like the decision to make Julia a language in which complicated problems can be solved using a modular and iterative approach. I like the idea of making great existing analytical libraries available. But, my jury is still out on the non-object-oriented design. I also seem to use functional approaches in my Groovy and Java programming more often, so I think I might miss this in Julia.

But enough speculation, let's code something!

### The Julia solution

My first decision is how to implement the data model. Julia supports *composite types*, seemingly similar to `struct` in C, and Julia even uses the keyword `struct`. Of note is that a `struct` is immutable (unless declared a `mutable struct` ), which is fine for this problem since the data doesn't need to be mutated.

By following the approach I took in the Java solution, the `Unit struct` can be defined as:

```
struct Unit
       item::String
       brand::String
       price::Int
end
```

Similarly, `Pack` is defined as the bulk package of `Unit` instances:

```
struct Pack
      unit::Unit
      count::Int
      Pack(item, brand, unitCount,p ackPrice) =
            new(Unit(item, brand, div(packPrice,unitCount)), unitCount)
end
```

There is an interesting thing here: a Julia "inner constructor." In the Java solution, I decided that the units inside bulk packages are (in my mind, anyway) a part of the bulk package and not something seen externally, so I decided I wanted to pass in the item, brand, number of units, and package price and have the `Pack` object create its unit internally. I'll do the same thing here.

Because Julia isn't object-oriented, I can't add methods to `Pack` to give unit price vs. pack price or to unpack it into a list of `Unit` instances. I can declare "getter" functions that accomplish the same tasks. (I probably don't need these, but I'll do it anyway to see how Julia methods work):

```
item(pack::Pack) = pack.unit.item
brand(pack::Pack) = pack.unit.brand
unitPrice(pack::Pack) = pack.unit.price
unitCount(pack::Pack) = pack.count
packPrice(pack::Pack) = pack.unit.price * pack.count
unpack(pack::Pack) = Iterators.collect(Iterators.repeated(pack.unit,pack.count))
```

The `unpack()` method is quite similar to the method of the same name I declared in the Java class `Pack`. The function `Iterators.repeated(thing,N)` creates an iterator that will deliver `N` copies of `thing`. The `Iterators.collect` (`iterator` ) function processes the `iterator` to yield an array made up of the elements it delivers.

Finally, the `Bought struct` :

```
struct Bought
      pack::Pack
      count::Int
end
unpack(bought::Bought) =         
     Iterators.collect(Iterators.flatten(Iterators.repeated(unpack(bought.pack),
         bought.count)))
```

Once again, I'm creating an array of an array of unpacked `Pack` instances (i.e., units) and using `Iterators.flatten()` to turn that into a simple array.

Now I can construct the list of what I bought:

```
packs = [
        Bought(Pack("Rice","Best Family",10,5650),1),
        Bought(Pack("Spaghetti","Best Family",1,327),10),
        Bought(Pack("Sardines","Fresh Caught",3,2727),3),
        Bought(Pack("Chickpeas","Southern Style",2,2600),5),
        Bought(Pack("Lentils","Southern Style",2,2378),5),
        Bought(Pack("Vegetable oil","Crafco",12,10020),1),
        Bought(Pack("UHT milk","Atlantic",6,4560),2),
        Bought(Pack("Flour","Neighbor Mills",10,5200),1),
        Bought(Pack("Tomato sauce","Best Family",1,190),10),
        Bought(Pack("Sugar","Good Price",1,565),10),
        Bought(Pack("Tea","Superior",5,2720),2),
        Bought(Pack("Coffee","Colombia Select",2,4180),5),
        Bought(Pack("Tofu","Gourmet Choice",1,1580),10),
        Bought(Pack("Bleach","Blanchite",5,3550),2),
        Bought(Pack("Soap","Sunny Day",6,1794),2)]
```

I'm starting to see a pattern here… this looks surprisingly like the Java solution to this problem. As then, this shows that I bought one pack of Best Family Rice containing 10 units that cost 5650 (using those crazy monetary units, like in the other examples). I bought one bulk pack of 10 bags of rice, and I bought 10 bulk packs of one bag each of spaghetti.

With the list packs of what I bought, I can now unpack into the units before working on redistributing them:

```
units = Iterators.collect(Iterators.flatten(unpack.(packs)))
```

What's going on here? Well, a construct like `unpack.(packs)` —that is, the dot between the function name and the argument list—applies the function `unpack()` to each element in the list `packs`. This will generate a list of lists corresponding to the unpacked groups of `Packs` I bought. To turn that into a flat list of units, I apply `Iterators.flatten()`. Because `Iterators.flatten()` is lazy, to make the flatten thing happen, I wrap it in `Iterators.collect()`. This kind of composition of functions adheres to the spirit of functional programming, even though you don't see the functions chained together, as programmers who write functionally in JavaScript, Java, or what-have-you are familiar with.

One observation is that the list of units created here is actually an array whose starting index is 1, not 0.

With units being the list of units purchased and unpacked, I can now take on repacking them into hampers.

Here's the code, which is not exceptionally different than the versions in Groovy, Python, and Java:

```
 1      valueIdeal = 5000
 2      valueMax = round(valueIdeal * 1.1)
 3      hamperNumber = 0
       
 4      while length(units) > 0
 5          global hamperNumber += 1
 6          hamper = Unit[]
 7          value = 0
 8          canAdd = true
 9          while canAdd
10              u = rand(0:(length(units)-1))
11              canAdd = false
12              for o = 0:(length(units)-1)
13                  uo = (u + o) % length(units) + 1
14                  unit = units[uo]
15                  if length(units) < 3 || findfirst(u -> u == unit,hamper) === nothing && (value + unit.price) < valueMax
16                      push!(hamper,unit)
17                      value += unit.price
18                      deleteat!(units,uo)
19                      canAdd = length(units) > 0
20                      break
21                  end
22              end
23          end
24          Printf.@printf("\nHamper %d value %d:\n",hamperNumber,value)
25          for unit in hamper
26              Printf.@printf("%-25s%-25s%7d\n",unit.item,unit.brand,unit.price)
27          end
28          Printf.@printf("Remaining units %d\n",length(units))
29      end
```

Some clarification, by line numbers:

* Lines 1–3: Set up the ideal and maximum values to be loaded into any given hamper and initialize Groovy's random number generator and the hamper number
* Lines 4–29: This `while` loop redistributes units into hampers, as long as there are more available
* Lines 5–7: Increment the (global) hamper number, get a new empty hamper (an array of `Unit` instances), and set its value to 0
* Line 8 and 9–23: As long as I can add units to the hamper…
* Line 10: Gets a random number between zero and the number of remaining units minus 1
* Line 11: Assumes I can't find more units to add
* Lines 12–22: This `for` loop, starting at the randomly chosen index, will try to find a unit that can be added to the hamper
* Lines 13–14: Figure out which unit to look at (remember arrays start at index 1) and get it
* Lines 15–21: I can add this unit to the hamper if there are only a few left or if the value of the hamper isn't too high once the unit is added and if that unit isn't already in the hamper
* Lines 16–18: Add the unit to the hamper, increment the hamper value by the unit price, and remove the unit from the available units list
* Lines 19–20: As long as there are units left, I can add more, so break out of this loop to keep looking
* Line 22: On exit from this `for` loop, if I have inspected every remaining unit and could not find one to add to the hamper, the hamper is complete; otherwise, I found one and can continue looking for more
* Line 23: On exit from this `while` loop, the hamper is as full as I can make it, so…
* Lines 24–28: Print out the contents of the hamper and the remaining units info
* Line 29: When I exit this loop, there are no more units left

The output of running this code looks quite similar to the output from the other programs:

```
Hamper 1 value 5020:
Tea                      Superior                     544
Sugar                    Good Price                   565
Soap                     Sunny Day                    299
Chickpeas                Southern Style              1300
Flour                    Neighbor Mills               520
Rice                     Best Family                  565
Spaghetti                Best Family                  327
Bleach                   Blanchite                    710
Tomato sauce             Best Family                  190
Remaining units 146

Hamper 2 value 5314:
Flour                    Neighbor Mills               520
Sugar                    Good Price                   565
Vegetable oil            Crafco                       835
Coffee                   Colombia Select             2090
UHT milk                 Atlantic                     760
Tea                      Superior                     544
Remaining units 140

Hamper 3 value 5298:
Tomato sauce             Best Family                  190
Tofu                     Gourmet Choice              1580
Sugar                    Good Price                   565
Bleach                   Blanchite                    710
Tea                      Superior                     544
Lentils                  Southern Style              1189
Flour                    Neighbor Mills               520
Remaining units 133

…

Hamper 23 value 4624:
Chickpeas                Southern Style              1300
Vegetable oil            Crafco                       835
Tofu                     Gourmet Choice              1580
Sardines                 Fresh Caught                 909
Remaining units 4

Hamper 24 value 5015:
Tofu                     Gourmet Choice              1580
Chickpeas                Southern Style              1300
Chickpeas                Southern Style              1300
Vegetable oil            Crafco                       835
Remaining units 0
```

The last hamper is abbreviated in contents and value.

### Closing thoughts

Once again, the random-number-driven list manipulation seems to make the "working code" portion of the program pretty similar to the Groovy, Python, and Java versions. To my delight, I found good functional programming support in Julia, at least with respect to the straightforward list processing required for this small problem.

Given that the main effort revolves around `for` and `while` loops, in Julia, I don't see any construct similar to:

```
for (boolean canAdd = true; canAdd; ) { … }
```

This means I have to declare the `canAdd` variable outside the `while` loop. Which is too bad—but not a terrible thing.

I do miss not being able to attach behavior directly to my data, but that's just my appreciation for object-oriented programming showing through. It's certainly not a huge impediment in this program; however, correspondence with a kind author about my Java version made me realize that I should have built a class to fully encapsulate the distribution function into something like a list of hampers, which the main program would just print out. This approach would not be feasible in a non-object-oriented language like Julia.

Good things: low ceremony, check; decent list-handling, check; compact and readable code, check. All in all, a pleasant experience, supporting the idea that Julia can be a decent choice to solve "ordinary problems" and as a scripting language.

Next time, I'll do this exercise in [Go][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/solve-problem-julia

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/puzzle_computer_solve_fix_tool.png
[2]: https://opensource.com/article/20/9/groovy
[3]: https://opensource.com/article/20/9/solve-problem-python
[4]: https://opensource.com/article/20/9/problem-solving-java
[5]: https://julialang.org/
[6]: https://golang.org/
