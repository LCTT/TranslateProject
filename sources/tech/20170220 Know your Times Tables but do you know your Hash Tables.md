ucasFL translating
Know your Times Tables, but... do you know your "Hash Tables"?
============================================================

Diving into the world of Hash Tables and understanding the underlying mechanics is  _extremely_  interesting, and very rewarding. So lets get into it and get started from the beginning.

A Hash Table is a common data structure used in many modern day Software applications. It provides a dictionary-like functionality, giving you the ability to perform opertations such as inserting, removing and deleting items inside it. Let’s just say I want to find what the definition of what “Apple” is, and I know the defintion is stored in my defined Hash Table. I will query my Hash Table to give me a defintion. The  _entry_  inside my Hash Table might look something like this `"Apple" => "A green fruit of fruity goodness"`. So, “Apple” is my  _key_  and “A green fruit of fruity goodness” is my associated  _value_ .

One more example just so we’re clear, take below the contents of a Hash Table:


```
1234
```

```
"bread" => "solid""water" => "liquid""soup" => "liquid""corn chips" => "solid"
```


I want to look up if  _bread_  is a solid or liquid, So I will query the Hash Table to give me the associated value, and the table will return to me with “solid”. Ok so we got the generally gist of how it functions. Another important concept to note with Hash Tables is the fact that every key is unique. Let’s say tomorrow, I feel like having a bread milkshake (which is a  _liquid_ ), we now need to update the Hash Table to reflect its change from solid to liquid! So we add the entry into the dictionary, the key : “bread” and the value : “liquid”. Can you spot what has changed in the table below?


```
1234
```
 
```
"bread" => "liquid""water" => "liquid""soup" => "liquid""corn chips" => "solid"
```
 

That’s right, bread has been updated to have the value “liquid”.

**Keys are unique**, my bread can’t be both a liquid and a solid. But what makes this data structure so special from the rest? Why not just use an [Array][1] instead? It depends on the nature of the problem. You may very well be better off using a Array for a particular problem, and that also brings me to the point, **choose the data structure that is most suited to your problem**. Example, If all you need to do is store a simple grocery list, an Array would do just fine. Consider the two problems below, each problem is very different in nature.

1.  I need a grocery list of fruit

2.  I need a grocery list of fruit and how much each it will cost me (per kilogram).

As you can see below, an Array might be a better choice for storing the fruit for the grocery list. But a Hash Table looks like a better choice for looking up the cost of each item.


```
123456789
```
 
```
//Example Array ["apple, "orange", "pear", "grape"]   //Example Hash Table  { "apple" : 3.05,     "orange" : 5.5,     "pear" : 8.4,     "grape" : 12.4  }
```


There are literally so many oppurtunities to [use][2] Hash Tables.

### Time and what that means to you

[A brush up on time and space complexity][3].

On average it takes a Hash Table O(1) to search, insert and delete entries in the Hash Table. For the unaware, O(1) is spoken as “Big O 1” and represents constant time. Meaning that the running time to perform each operation is not dependent on the amount of data in the dataset. We can also  _promise_  that for searching, inserting and deleting items will take constant time, “IF AND ONLY” IF the implementation of the Hash Table is done right. If it’s not, then it can be really slow  _O(n)_ , especially if everything hashes to the same position/slot in the Hash Table.

### Building a good Hash Table

So far we now understand how to use a Hash Table, but what if we wanted to **build** one? Essentially what we need to do is map a string (eg. “dog”) to a **hash code** (a generated number), which maps to an index of an Array. You might ask, why not just go straight to using indexes? Why bother? Well this way it allows us to find out immediately where “dog” is located by quering directly for “dog”, `String name = Array["dog"] //name is "Lassy"`. But with using an index to look up the name, we could be in the likely situation that we do not know the index where the name is located. For example, `String name = Array[10] // name is now "Bob"` - that’s not my dog’s name! And that is the benefit of mapping the string to a hash code (which corresponds to an index of an Array). We can get the index of the Array by using the modulo operator with the size of the Hash Table, `index = hash_code % table_size`.

Another situation that we want to avoid is having two keys mapping to the same index, this is called a **hash collision** and they’re very likely to happen if the hash function is not properly implemented. But the truth is that every hash function  _with more inputs than outputs_  there is some chance of collision. To demonstrate a simple collision take the following two function outputs below:

`int cat_idx = hashCode("cat") % table_size; //cat_idx is now equal to 1`

`int dog_idx = hashCode("dog") % table_size; //dog_idx is now also equal 1`

We can see that both Array indexes are now 1! And as such the values will overwrite each other because they are being written to the same index. Like if we tried to look up the value for “cat” it would then return “Lassy”. Not what we wanted after all. There are various methods of [resolving hash collisions][4], the more popular one is called **Chaining**. The idea with chaining is that there is a Linked List for each index of an Array. If a collision occurs, the value will be stored inside that Linked List. Thus in the previous example, we would get the value we requested, but it we would need to search a Linked List attached to the index 1 of the Array. Hashing with Chaining achieves O(1 + α) time where α is the load factor which can be represented as n/k, n being the number of entries in the Hash Table and k being the number of slots available in the Hash Table. But remember this only holds true if the keys that you give are particularly random (relying on [SUHA][5])).

This is a big assumption to make, as there is always a possibility that non-equal keys will hash to the same slot. One solution to this is to take the reliance of randomness away from what keys are given to the Hash Table, and put the randomness on how the keys will be hashed to increase the likeliness of  _very few conflicts_  occuring. And this is known as…

### Universal Hashing

The concept is pretty simple, select  _at random_  a hash function h from the set universal hash family to compute the hash code. So in other words, choose any random hash function to hash the key! And by following this method it provides a  _very low_  probability that the hashes of two distinct keys will not be the same. I will keep this one short, but if you don’t trust me then trust [Mathematics][6] instead. Also another thing to watch out for is when implementing this method be careful of having a bad universal hash family. It can blow out the time and space complexity to O(U) where U is the size of the family. And where the challenge lies is finding a Hash family that does not take too much time to compute, and too much space to store.

### A Hash function of the Gods

The search for perfection is inevitable. What if we could construct a  _Perfect hash function_ where we could just map things to a set of integers with absolutely  _no collisions_ . Good news is we can do this, Well kind of.. but our data has to be static (which means no insertions/deletes/updates can assured constant time). One approach to achieve a perfect hash function is to use  _2-Level Hashing_ , it is basically a combination of the last two ideas we previously discussed. It uses  _Universal Hashing_  to select which hash function to use, and then combines it with  _Chaining_ , but this time instead of using a Linked List data structure we use another Hash Table! Let’s see how this looks visually below:

 [![2-Level Hashing](http://www.zeroequalsfalse.press/2017/02/20/hashtables/Diagram.png "2-Level Hashing")][8] 

**But how does this work and how can we ensure no lookup collisions?**

Well it works in reverse to the [Birthday paradox][7]. It states that in a set of N randomly chosen people, some pair will have the same birthday. But if the number of days in a year far outwighs the number of people (squared) then there is a damn good possibility that no pair of people will share the same birthday. So how it relates is, for each chained Hash Table is the size of the first-level Hash Table  _squared_ . That is if 2 elements happen to hash to the same slot, then the size of the chained Hash Table will be of size 4\. Most of the time the chained Tables will be very sparse/empty.

Repeat the following two steps to ensure no look up collisions,

*   Select a hash from the universal hash family

*   If we get a collision, then select another hash from the universal hash family.

Literally that is it, (Well.. for an O(N^2) space solution anyway). If space is a concern, then a different approach is obviously needed. But the great thing is that we will only ever have to do this process on average **twice**.

### Summing up

A Hash Table is only as good as it’s  _Hash function_ . Deriving a  _Perfect hash function_  is much harder to achieve without losing in particular areas such as functionality, time and space. I invite you to always consider Hash Tables when solving a problem as they offer great performance benefits and they can make a noticeable difference in the usability of your application. Hash Tables and Perfect hash functions are often used in Real-time programming applications. And have been widely implemented in algorithms around the world. Hash Tables are here to stay.

--------------------------------------------------------------------------------

via: http://www.zeroequalsfalse.press/2017/02/20/hashtables/

作者：[Marty Jacobs][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zeroequalsfalse.press/about
[1]:https://en.wikipedia.org/wiki/Array_data_type
[2]:https://en.wikipedia.org/wiki/Hash_table#Uses
[3]:https://www.hackerearth.com/practice/basic-programming/complexity-analysis/time-and-space-complexity/tutorial/
[4]:https://en.wikipedia.org/wiki/Hash_table#Collision_resolution
[5]:https://en.wikipedia.org/wiki/SUHA_(computer_science
[6]:https://en.wikipedia.org/wiki/Universal_hashing#Mathematical_guarantees
[7]:https://en.wikipedia.org/wiki/Birthday_problem
[8]:http://www.zeroequalsfalse.press/2017/02/20/hashtables/Diagram.png
