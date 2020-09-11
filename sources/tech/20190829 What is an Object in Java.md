[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is an Object in Java?)
[#]: via: (https://opensource.com/article/19/8/what-object-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansenhttps://opensource.com/users/mdowdenhttps://opensource.com/users/sethhttps://opensource.com/users/drmjghttps://opensource.com/users/jamesfhttps://opensource.com/users/clhermansen)

What is an Object in Java?
======
Java's approach to object-oriented programming is the basis for almost
everything in the language. Here's what you need to know.
![Coffee beans and a cup of coffee][1]

Java is an object-oriented programming language, which views the world as a collection of objects that have both _properties_ and _behavior_. Java's version of object-orientedness is pretty straightforward, and it's the basis for almost everything in the language. Because it's so essential to Java, I'll explain a bit about what's under the covers to help anyone new to the language.

### Inheritance

In general, all [Cartesian geometric objects][2], like circles, squares, triangles, lines, and points, have basic properties, like location and extension. Objects with zero extension, like points, usually don't have anything more than that. Objects like lines have more—e.g., the start and endpoint of a line segment or two points along a line (if it's a "true line"). Objects like squares or triangles have still more—the corner points, for example—whereas circles may have a center and radius.

We can see there is a simple hierarchy at work here: The general geometric object can be _extended_ into specific geometric objects, like points, lines, squares, etc. Each specific geometric object _inherits_ the basic geometric properties of location and extension and adds its own properties.

This is an example of _single inheritance_. Java's original object-oriented model allowed only single inheritance, where objects cannot belong to more than one inheritance hierarchy. This design decision comes out of the kinds of ambiguities programmers found themselves facing in [complex multiple-inheritance scenarios][3], typically in cases where "interesting design decisions" led to several possible implementations of the function **foo()** as defined (and re-defined) in the hierarchy.

Since Java 8, there has been a limited multiple inheritance structure in place that requires specific actions on behalf of the programmer to ensure there are no ambiguities.

### Strong and static typing

Java is _strongly_ and _statically_ typed. What does this mean?

A _statically_ typed language is one where the type of a variable is known at compile time. In this situation, it is not possible to assign a value of type B to a variable whose declared type is A, unless there is a conversion mechanism to turn a value of type B into a value of type A. An example of this type of conversion is turning an integer value, like 1, 2, or 42, into a floating-point value, like 1.0, 2.0, or 42.0.

A _strongly_ typed language is one where very few (or perhaps no) type conversions are applied automatically. For example, whereas a strongly typed language might permit automatic conversion of _integer_ to _real_, it will never permit automatic conversion of _real_ to _integer_ since that conversion requires either rounding or truncation in the general case.

### Primitive types, classes, and objects

Java provides a number of primitive types: _byte_ (an eight-bit signed integer); _short_ (a 16-bit signed integer); _int_ (a 32-bit signed integer); _long_ (a 64-bit signed integer); _float_ (a single precision 32-bit IEEE floating-point number); _double_ (a double precision 64-bit IEEE floating-point number); _boolean_ (true or false); and _char_ (a 16-bit Unicode character).

Beyond those primitive types, Java allows the programmer to create new types using _class declarations_. Class declarations are used to define object templates, including their properties and behavior. Once a class is declared, _instances_ of that class can generally be created using the **new** keyword. These instances correspond directly to the "objects" we have been discussing. Java comes with a library of useful class definitions, including some simple basic classes such as _String_, which is used to hold a sequence of characters like "Hello, world."

Let's define a simple message class that contains the name of the sender as well as the message text:


```
class Message {
        [String][4] sender;
        [String][4] text;
        public Message([String][4] sender, [String][4] text) {
                this.sender = sender;
                this.text = text;
        }
}
```

There are several important things to note in this class declaration:

  1. The class is (by convention) always declared with a leading capital letter.
  2. The **Message** class contains two properties (or fields):
– a String field called **sender**
– a String field called **text**
Properties or fields are (by convention) always declared with a leading lower-case letter.
  3. There is some kind of thing that starts with **public Message**.
– It is a _method_ (methods define the behavior of an object).
– It is used to _construct_ instances of the class **Message**.
– Constructor methods always take the same name as the class and are understood to return an instance of the class once it's constructed.
– Other methods are (by convention) always declared with a leading lower-case letter.
– This constructor is "public," meaning any caller can access it.
  4. As part of the construction process, some lines start with **this**.
– **this** refers to the present instance of the class.
– Thus **this.sender** refers to the sender property of the object.
– Whereas plain **sender** refers to the parameter of the **Message** constructor method.
– Therefore, these two lines are copying the values provided in the call to the constructor into the fields of the object itself.



So we have the **Method** class definition. How do we use it? The following code excerpt shows one possible way:


```
`Message message = new Message("system", "I/O error");`
```

Here we see:

  1. The declaration of the variable **message** of type **Message**
  2. The creation of a new instance of the **Message** class with **sender** set to "system" and **text** set to "I/O error"
  3. The assignment of that new instance of **Message** to the variable **message**
  4. If later in the code, the variable **message** is assigned a different value (another instance of **Message**) and no other variable was created that referred to this instance of **Message**, then this instance is no longer used by anything and can be garbage-collected.



The key thing happening here is that we are creating an object of type **Message** and keeping a reference to that object in the variable **message**.

We can now use that message; for instance, we can print the values in the **sender** and **text** properties, like this:


```
[System][5].out.println("message sender = " + message.sender);
[System][5].out.println("message text = " + message.text);
```

This is a very simple and unsophisticated class definition. We can modify this class definition in a number of ways:

  1. We can make the implementation details of properties invisible to callers by using the keyword **private** in front of the declarations, allowing us to change the implementation without affecting callers.
  2. If we choose to conceal properties in the class, we would then typically define procedures for _getting_ and _setting_ those properties; by convention in Java these would be defined as:
– **public String getSender()**
– **public String getText()**
– **public void setSender(String sender)**
– **public void setText(String text)**
  3. In some cases, we may wish to have "read-only" properties; in those cases, we would not define setters for such properties.
  4. We can make the constructor of the class invisible to callers by using the **private** keyword instead of **public**. We might wish to do this when we have another class whose responsibility is creating and managing a pool of messages (possibly executing in another process or even on another system).



Now, suppose we want a kind of message that records when it was generated. We could declare it this like:


```
class TimedMessage extends Message {
        long creationTime;
        public TimedMessage([String][4] sender, [String][4] text) {
                super(sender, text);
                this.creationTime = [System][5].currentTimeMillis();
        }
}
```

Here we see some new things:

  1. **TimedMessage** is _extending_ the **Message** class—that is, **TimedMessage** is inheriting properties and behavior from **Message**.
  2. The constructor calls the constructor in its parent, or _superclass_, with the values of **sender** and **text** passed in, as **super(sender, text)**, in order to make sure its inherited properties are properly initialized.
  3. **TimedMessage** adds a new property, **creationTime**, and the constructor sets it to be the current system time in milliseconds.
  4. Time in milliseconds in Java is kept as a long (64-bit) value (0 is 1 January, 1970 00:00:00 UTC).
  5. As a bit of an aside, the name **creationTime** suggests it should be a read-only property, which also suggests that the other properties be read-only; that is, **TimedMessage** instances should probably not be reused nor have their properties altered.



### The Object class

"The Object class" sounds like a kind of contradiction in terms, doesn't it? But notice that the first class we defined, **Message**, did not _appear_ to extend anything—but it _actually_ did. All classes that don't specifically extend another class have the class **Object** as their immediate and only parent; therefore, all classes have the **Object** class as their ultimate superclass.

You can [learn more about the **Object** class][6] in Java's docs. Let's (briefly) review some interesting details:

  1. **Object** has the constructor **Object()**, that is, with no parameters.
  2. **Object** provides some useful methods to all of its subclasses, including:
– **clone()**, which creates and returns a copy of the instance at hand
– **equals(Object anotherObject)**, which determines whether **anotherObject** is equal to the instance of **Object** at hand
– **finalize()**, which is used to garbage-collect the instance at hand when it is no longer used (see above)
– **getClass()**, which returns the class used to declare the instance at hand
— The value returned by this is an instance of the [**Class** class][7], which permits learning about the declaring class at runtime—a process referred to _introspection_.
  3. **hashCode()** is an integer value that gives a nearly unique value for the instance at hand.
– If the hash codes of two distinct instances are equal, then they may be equal; a detailed comparison of the properties (and perhaps methods) is necessary to determine complete equality;
– If the hash codes are not equal, then the instances are also not equal.
– Therefore, hash codes can speed up equality tests.
– A hash code can also be used to create a [**HashMap**][8] (a map is an associative array or dictionary that uses the hash code to speed up lookups) and a [**HashSet**][9] (a set is a collection of objects; the programmer can test whether an instance is in a set or not; hash codes are used to speed up the test).
  4. **notify()**, **notifyAll()**, **wait()**, **wait(long timeout)**, and **wait(long timeout, int nanos)** communicate between collaborating instances executing on separate threads.
  5. **toString()** produces a printable version of the instance.



### Concluding thoughts

We've touched on some important aspects of object-oriented programming, Java-style. There are six important, related topics that will be covered in future articles:

  * Namespaces and packages
  * Overriding methods in subclasses—for instance, the String class has its own specific **hashCode()** method that recognizes its meaning as an array of characters; this is accomplished by overriding the **hashCode()** method inherited from Object
  * Interfaces, which permit describing behavior that must be provided by a class that implements the interface; instances of classes that implement a given interface can be referred to by that interface when the only thing of interest is that specific behavior
  * Arrays of primitives or classes and collections of classes (such as lists, maps, and sets)
  * Overloading of methods—where several methods with the same name and similar behavior have different parameters
  * Using libraries that don't come with the Java distribution



Is there anything you would like to read next? Let us know in the comments and stay tuned!

Michael Dowden takes a look at four Java web frameworks built for scalability.

Optimizing your Java code requires an understanding of how the different elements in Java interact...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/what-object-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansenhttps://opensource.com/users/mdowdenhttps://opensource.com/users/sethhttps://opensource.com/users/drmjghttps://opensource.com/users/jamesfhttps://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://en.wikipedia.org/wiki/Analytic_geometry
[3]: https://en.wikipedia.org/wiki/Multiple_inheritance
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[6]: https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html
[7]: https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html
[8]: https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html
[9]: https://docs.oracle.com/javase/8/docs/api/java/util/HashSet.html
