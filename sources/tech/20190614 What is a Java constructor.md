[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is a Java constructor?)
[#]: via: (https://opensource.com/article/19/6/what-java-constructor)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/ashleykoree)

What is a Java constructor?
======
Constructors are powerful components of programming. Use them to unlock
the full potential of Java.
![][1]

Java is (disputably) the undisputed heavyweight in open source, cross-platform programming. While there are many [great][2] [cross-platform][2] [frameworks][3], few are as unified and direct as [Java][4].

Of course, Java is also a pretty complex language with subtleties and conventions all its own. One of the most common questions about Java relates to **constructors** : What are they and what are they used for?

Put succinctly: a constructor is an action performed upon the creation of a new **object** in Java. When your Java application creates an instance of a class you have written, it checks for a constructor. If a constructor exists, Java runs the code in the constructor while creating the instance. That's a lot of technical terms crammed into a few sentences, but it becomes clearer when you see it in action, so make sure you have [Java installed][5] and get ready for a demo.

### Life without constructors

If you're writing Java code, you're already using constructors, even though you may not know it. All classes in Java have a constructor because even if you haven't created one, Java does it for you when the code is compiled. For the sake of demonstration, though, ignore the hidden constructor that Java provides (because a default constructor adds no extra features), and take a look at life without an explicit constructor.

Suppose you're writing a simple Java dice-roller application because you want to produce a pseudo-random number for a game.

First, you might create your dice class to represent a physical die. Knowing that you play a lot of [Dungeons and Dragons][6], you decide to create a 20-sided die. In this sample code, the variable **dice** is the integer 20, representing the maximum possible die roll (a 20-sided die cannot roll more than 20). The variable **roll** is a placeholder for what will eventually be a random number, and **rand** serves as the random seed.


```
import java.util.Random;

public class DiceRoller {
private int dice = 20;
private int roll;
private [Random][7] rand = new [Random][7]();
```

Next, create a function in the **DiceRoller** class to execute the steps the computer must take to emulate a die roll: Take an integer from **rand** and assign it to the **roll** variable, add 1 to account for the fact that Java starts counting at 0 but a 20-sided die has no 0 value, then print the results.


```
public void Roller() {
roll = rand.nextInt(dice);
roll += 1;
[System][8].out.println (roll);
}
```

Finally, spawn an instance of the **DiceRoller** class and invoke its primary function, **Roller** :


```
// main loop
public static void main ([String][9][] args) {
[System][8].out.printf("You rolled a ");

DiceRoller App = new DiceRoller();
App.Roller();
}
}
```

As long as you have a Java development environment installed (such as [OpenJDK][10]), you can run your application from a terminal:


```
$ java dice.java
You rolled a 12
```

In this example, there is no explicit constructor. It's a perfectly valid and legal Java application, but it's a little limited. For instance, if you set your game of Dungeons and Dragons aside for the evening to play some Yahtzee, you would need 6-sided dice. In this simple example, it wouldn't be that much trouble to change the code, but that's not a realistic option in complex code. One way you could solve this problem is with a constructor.

### Constructors in action

The **DiceRoller** class in this example project represents a virtual dice factory: When it's called, it creates a virtual die that is then "rolled." However, by writing a custom constructor, you can make your Dice Roller application ask what kind of die you'd like to emulate.

Most of the code is the same, with the exception of a constructor accepting some number of sides. This number doesn't exist yet, but it will be created later.


```
import java.util.Random;

public class DiceRoller {
private int dice;
private int roll;
private [Random][7] rand = new [Random][7]();

// constructor
public DiceRoller(int sides) {
dice = sides;
}
```

The function emulating a roll remains unchanged:


```
public void Roller() {
roll = rand.nextInt(dice);
roll += 1;
[System][8].out.println (roll);
}
```

The main block of code feeds whatever arguments you provide when running the application. Were this a complex application, you would parse the arguments carefully and check for unexpected results, but for this sample, the only precaution taken is converting the argument string to an integer type:


```
public static void main ([String][9][] args) {
[System][8].out.printf("You rolled a ");
DiceRoller App = new DiceRoller( [Integer][11].parseInt(args[0]) );
App.Roller();
}
}
```

Launch the application and provide the number of sides you want your die to have:


```
$ java dice.java 20
You rolled a 10
$ java dice.java 6
You rolled a 2
$ java dice.java 100
You rolled a 44
```

The constructor has accepted your input, so when the class instance is created, it is created with the **sides** variable set to whatever number the user dictates.

Constructors are powerful components of programming. Practice using them to unlock the full potential of Java.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/what-java-constructor

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/ashleykoree
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/17/4/pyqt-versus-wxpython
[4]: https://opensource.com/resources/java
[5]: https://openjdk.java.net/install/index.html
[6]: https://opensource.com/article/19/5/free-rpg-day
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[10]: https://openjdk.java.net/
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer
