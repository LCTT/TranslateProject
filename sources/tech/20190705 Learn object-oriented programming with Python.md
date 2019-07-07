[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn object-oriented programming with Python)
[#]: via: (https://opensource.com/article/19/7/get-modular-python-classes)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Learn object-oriented programming with Python
======
Make your code more modular with Python classes.
![Developing code.][1]

In my previous article, I explained how to [make Python modular][2] by using functions, creating modules, or both. Functions are invaluable to avoid repeating code you intend to use several times, and modules ensure that you can use your code across different projects. But there's another component to modularity: the class.

If you've heard the term _object-oriented programming_, then you may have some notion of the purpose classes serve. Programmers tend to consider a class as a virtual object, sometimes with a direct correlation to something in the physical world, and other times as a manifestation of some programming concept. Either way, the idea is that you can create a class when you want to create "objects" within a program for you or other parts of the program to interact with.

### Templates without classes

Assume you're writing a game set in a fantasy world, and you need this application to be able to drum up a variety of baddies to bring some excitement into your players' lives. Knowing quite a lot about functions, you might think this sounds like a textbook case for functions: code that needs to be repeated often but is written once with allowance for variations when called.

Here's an example of a purely function-based implementation of an enemy generator:


```
#!/usr/bin/env python3

import random

def enemy(ancestry,gear):
    enemy=ancestry
    weapon=gear
    hp=random.randrange(0,20)
    ac=random.randrange(0,20)
    return [enemy,weapon,hp,ac]

def fight(tgt):
    print("You take a swing at the " + tgt[0] + ".")
    hit=random.randrange(0,20)
    if hit &gt; tgt[3]:
        print("You hit the " + tgt[0] + " for " + str(hit) + " damage!")
        tgt[2] = tgt[2] - hit
    else:
        print("You missed.")

foe=enemy("troll","great axe")
print("You meet a " + foe[0] + " wielding a " + foe[1])
print("Type the a key and then RETURN to attack.")

while True:
    action=input()

    if action.lower() == "a":
        fight(foe)

    if foe[2] &lt; 1:
        print("You killed your foe!")
    else:
        print("The " + foe[0] + " has " + str(foe[2]) + " HP remaining")
```

The **enemy** function creates an enemy with several attributes, such as ancestry, a weapon, health points, and a defense rating. It returns a list of each attribute, representing the sum total of the enemy.

In a sense, this code has created an object, even though it's not using a class yet. Programmers call this "enemy" an _object_ because the result (a list of strings and integers, in this case) of the function represents a singular but complex _thing_ in the game. That is, the strings and integers in the list aren't arbitrary: together, they describe a virtual object.

When writing a collection of descriptors, you use variables so you can use them any time you want to generate an enemy. It's a little like a template.

In the example code, when an attribute of the object is needed, the corresponding list item is retrieved. For instance, to get the ancestry of an enemy, the code looks at **foe[0]**, for health points, it looks at **foe[2]** for health points, and so on.

There's nothing necessarily wrong with this approach. The code runs as expected. You could add more enemies of different types, you could create a list of enemy types and randomly select from the list during enemy creation, and so on. It works well enough, and in fact [Lua][3] uses this principle very effectively to approximate an object-oriented model.

However, there's sometimes more to an object than just a list of attributes.

### The way of the object

In Python, everything is an object. Anything you create in Python is an _instance_ of some predefined template. Even basic strings and integers are derivatives of the Python **type** class. You can witness this for yourself an interactive Python shell:


```
&gt;&gt;&gt; foo=3
&gt;&gt;&gt; type(foo)
&lt;class 'int'&gt;
&gt;&gt;&gt; foo="bar"
&gt;&gt;&gt; type(foo)
&lt;class 'str'&gt;
```

When an object is defined by a class, it is more than just a collection of attributes. Python classes have functions all their own. This is convenient, logically, because actions that pertain only to a certain class of objects are contained within that object's class.

In the example code, the fight code is a function of the main application. That works fine for a simple game, but in a complex one, there would be more than just players and enemies in the game world. There might be townsfolk, livestock, buildings, forests, and so on, and none of them ever need access to a fight function. Placing code for combat in an enemy class means your code is better organized; and in a complex application, that's a significant advantage.

Furthermore, each class has privileged access to its own local variables. An enemy's health points, for instance, isn't data that should ever change except by some function of the enemy class. A random butterfly in the game should not accidentally reduce an enemy's health to 0. Ideally, even without classes, that would never happen, but in a complex application with lots of moving parts, it's a powerful trick of the trade to ensure that parts that don't need to interact with one another never do.

Python classes are also subject to garbage collection. When an instance of a class is no longer used, it is moved out of memory. You may never know when this happens, but you tend to notice when it doesn't happen because your application takes up more memory and runs slower than it should. Isolating data sets into classes helps Python track what is in use and what is no longer needed.

### Classy Python

Here's the same simple combat game using a class for the enemy:


```
#!/usr/bin/env python3

import random

class Enemy():
    def __init__(self,ancestry,gear):
        self.enemy=ancestry
        self.weapon=gear
        self.hp=random.randrange(10,20)
        self.ac=random.randrange(12,20)
        self.alive=True

    def fight(self,tgt):
        print("You take a swing at the " + self.enemy + ".")
        hit=random.randrange(0,20)

        if self.alive and hit &gt; self.ac:
            print("You hit the " + self.enemy + " for " + str(hit) + " damage!")
            self.hp = self.hp - hit
            print("The " + self.enemy + " has " + str(self.hp) + " HP remaining")
        else:
            print("You missed.")

        if self.hp &lt; 1:
            self.alive=False

# game start
foe=Enemy("troll","great axe")
print("You meet a " + foe.enemy + " wielding a " + foe.weapon)

# main loop
while True:
   
    print("Type the a key and then RETURN to attack.")
       
    action=input()

    if action.lower() == "a":
        foe.fight(foe)
               
    if foe.alive == False:
        print("You have won...this time.")
        exit()
```

This version of the game handles the enemy as an object containing the same attributes (ancestry, weapon, health, and defense), plus a new attribute measuring whether the enemy has been vanquished yet, as well as a function for combat.

The first function of a class is a special function called (in Python) an _init_, or initialization, function. This is similar to a [constructor][4] in other languages; it creates an instance of the class, which is identifiable to you by its attributes and to whatever variable you use when invoking the class (**foe** in the example code).

### Self and class instances

The class' functions accept a new form of input you don't see outside of classes: **self**. If you don't include **self**, then Python has no way of knowing _which_ instance of the class to use when you call a class function. It's like challenging a single orc to a duel by saying "I'll fight the orc" in a room full of orcs; nobody knows which one you're referring to, and so bad things happen.

![Image of an Orc, CC-BY-SA by Buch on opengameart.org][5]

CC-BY-SA by Buch on opengameart.org

Each attribute created within a class is prepended with the **self** notation, which identifies that variable as an attribute of the class. Once an instance of a class is spawned, you swap out the **self** prefix with the variable representing that instance. Using this technique, you could challenge just one orc to a duel in a room full of orcs by saying "I'll fight the gorblar.orc"; when Gorblar the Orc hears **gorblar.orc**, he knows which orc you're referring to (him_self_), and so you get a fair fight instead of a brawl. In Python:


```
gorblar=Enemy("orc","sword")
print("The " + gorblar.enemy + " has " + str(gorblar.hp) + " remaining.")
```

Instead of looking to **foe[0]** (as in the functional example) or **gorblar[0]** for the enemy type, you retrieve the class attribute (**gorblar.enemy** or **gorblar.hp** or whatever value for whatever object you need).

### Local variables

If a variable in a class is not prepended with the **self** keyword, then it is a local variable, just as in any function. For instance, no matter what you do, you cannot access the **hit** variable outside the **Enemy.fight** class:


```
&gt;&gt;&gt; print(foe.hit)
Traceback (most recent call last):
  File "./enclass.py", line 38, in &lt;module&gt;
    print(foe.hit)
AttributeError: 'Enemy' object has no attribute 'hit'

&gt;&gt;&gt; print(foe.fight.hit)
Traceback (most recent call last):
  File "./enclass.py", line 38, in &lt;module&gt;
    print(foe.fight.hit)
AttributeError: 'function' object has no attribute 'hit'
```

The **hit** variable is contained within the Enemy class, and only "lives" long enough to serve its purpose in combat.

### More modularity

This example uses a class in the same text document as your main application. In a complex game, it's easier to treat each class almost as if it were its own self-standing application. You see this when multiple developers work on the same application: one developer works on a class, and the other works on the main program, and as long as they communicate with one another about what attributes the class must have, the two code bases can be developed in parallel.

To make this example game modular, split it into two files: one for the main application and one for the class. Were it a more complex application, you might have one file per class, or one file per logical groups of classes (for instance, a file for buildings, a file for natural surroundings, a file for enemies and NPCs, and so on).

Save one file containing just the Enemy class as **enemy.py** and another file containing everything else as **main.py**.

Here's **enemy.py**:


```
import random

class Enemy():
    def __init__(self,ancestry,gear):
        self.enemy=ancestry
        self.weapon=gear
        self.hp=random.randrange(10,20)
        self.stg=random.randrange(0,20)
        self.ac=random.randrange(0,20)
        self.alive=True

    def fight(self,tgt):
        print("You take a swing at the " + self.enemy + ".")
        hit=random.randrange(0,20)

        if self.alive and hit &gt; self.ac:
            print("You hit the " + self.enemy + " for " + str(hit) + " damage!")
            self.hp = self.hp - hit
            print("The " + self.enemy + " has " + str(self.hp) + " HP remaining")
        else:
            print("You missed.")

        if self.hp &lt; 1:
            self.alive=False
```

Here's **main.py**:


```
#!/usr/bin/env python3

import enemy as en

# game start
foe=en.Enemy("troll","great axe")
print("You meet a " + foe.enemy + " wielding a " + foe.weapon)

# main loop
while True:
   
    print("Type the a key and then RETURN to attack.")

    action=input()

    if action.lower() == "a":
        foe.fight(foe)

    if foe.alive == False:
        print("You have won...this time.")
        exit()
```

Importing the module **enemy.py** is done very specifically with a statement that refers to the file of classes as its name without the **.py** extension, followed by a namespace designator of your choosing (for example, **import enemy as en**). This designator is what you use in the code when invoking a class. Instead of just using **Enemy()**, you preface the class with the designator of what you imported, such as **en.Enemy**.

All of these file names are entirely arbitrary, although not uncommon in principle. It's a common convention to name the part of the application that serves as the central hub **main.py**, and a file full of classes is often named in lowercase with the classes inside it, each beginning with a capital letter. Whether you follow these conventions doesn't affect how the application runs, but it does make it easier for experienced Python programmers to quickly decipher how your application works.

There's some flexibility in how you structure your code. For instance, using the code sample, both files must be in the same directory. If you want to package just your classes as a module, then you must create a directory called, for instance, **mybad** and move your classes into it. In **main.py**, your import statement changes a little:


```
`from mybad import enemy as en`
```

Both systems produce the same results, but the latter is best if the classes you have created are generic enough that you think other developers could use them in their projects.

Regardless of which you choose, launch the modular version of the game:


```
$ python3 ./main.py
You meet a troll wielding a great axe
Type the a key and then RETURN to attack.
a
You take a swing at the troll.
You missed.
Type the a key and then RETURN to attack.
a
You take a swing at the troll.
You hit the troll for 8 damage!
The troll has 4 HP remaining
Type the a key and then RETURN to attack.
a
You take a swing at the troll.
You hit the troll for 11 damage!
The troll has -7 HP remaining
You have won...this time.
```

The game works. It's modular. And now you know what it means for an application to be object-oriented. But most importantly, you know to be specific when challenging an orc to a duel.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/get-modular-python-classes

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 (Developing code.)
[2]: https://opensource.com/article/19/6/get-modular-python-functions
[3]: https://opensource.com/article/17/4/how-program-games-raspberry-pi
[4]: https://opensource.com/article/19/6/what-java-constructor
[5]: https://opensource.com/sites/default/files/images/orc-buch-opengameart_cc-by-sa.jpg (CC-BY-SA by Buch on opengameart.org)
