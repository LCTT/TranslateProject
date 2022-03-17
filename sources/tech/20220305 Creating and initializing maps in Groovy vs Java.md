[#]: subject: "Creating and initializing maps in Groovy vs Java"
[#]: via: "https://opensource.com/article/22/3/maps-groovy-vs-java"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Creating and initializing maps in Groovy vs Java
======
Java and Groovy maps are nicely general, permitting keys and values to
be any classes that extend the Object class.
![Business woman on laptop sitting in front of window][1]

I’ve recently explored some of the differences between Java and Groovy when [creating and initializing lists][2] and [building lists at runtime][3]. I observed the simple facilities provided by Groovy for these purposes in comparison to the complexity required in Java.

In this article, I examine creating and initializing maps in Java and Groovy. Maps provide the ability to develop structures you can search by _key_. And if the key gets found, that returns the _value_ associated with that key. Today, maps are implemented in many programming languages, including Java and Groovy, but also Python (where they are called dictionaries), Perl, awk, and many others. Another term commonly used to describe maps is _associative arrays_, which you can read about in [this Wikipedia article][4]. Java and Groovy maps are nicely general, permitting keys and values to be any classes that extend the `Object` class.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation as well. Both a recent and decent version of Java and Groovy might be in your Linux distribution’s repositories. Or, you can install Groovy following the instructions on the link mentioned above. A nice alternative for Linux users is [SDKMan][5], which you can use to get multiple versions of Java, Groovy, and many other related tools. For this article, I’m using SDK’s releases of:

  * Java: version 11.0.12-open of OpenJDK 11;
  * Groovy: version 3.0.8.



### Back to the problem

Java offers a number of ways to instantiate and initialize maps, and since Java 9, several new approaches got added. The most obvious candidate is the static method `java.util.Map.of()` which you can use as follows:     


```


var m1 = [Map][6].of(
    "AF", "Afghanistan",
    "AX", "Åland Islands",
    "AL", "Albania",
    "DZ", "Algeria",
    "AS", "American Samoa",
    "AD", "Andorra",
    "AO", "Angola",
    "AI", "Anguilla",
    "AQ", "Antarctica");

[System][7].out.println("m1 = " + m1);
[System][7].out.println("m1 is an instance of " + m1.getClass());

```

It turns out that `Map.of()` used in this fashion bears two important restrictions. First, the map instance you create this way is immutable. Second, this way you can supply at most 20 arguments, representing ten key-value pairs.

Try adding tenth and eleventh pairs, say "AG", "Antigua and Barbuda", and "AR", "Argentina" to see what happens. You’ll see the Java compiler looking for a version of `Map.of()` that accepts 11 pairs and fails.

A quick look at [the documentation for java.util.Map][8] shows the reason for this second limitation, and shows a way out of that conundrum:


```


var m2 = [Map][6].ofEntries(
    [Map][6].entry("AF", "Afghanistan"),
    [Map][6].entry("AX", "Åland Islands"),
    [Map][6].entry("AL", "Albania"),
    [Map][6].entry("DZ", "Algeria"),
    [Map][6].entry("AS", "American Samoa"),
    [Map][6].entry("AD", "Andorra"),
    [Map][6].entry("AO", "Angola"),
    [Map][6].entry("AI", "Anguilla"),
    [Map][6].entry("AQ", "Antarctica"),
    [Map][6].entry("AG", "Antigua and Barbuda"),
    [Map][6].entry("AR", "Argentina"),
    [Map][6].entry("AM", "Armenia"),
    [Map][6].entry("AW", "Aruba"),
    [Map][6].entry("AU", "Australia"),
    [Map][6].entry("AT", "Austria"),
    [Map][6].entry("AZ", "Azerbaijan"),
    [Map][6].entry("BS", "Bahamas"),
    [Map][6].entry("BH", "Bahrain"),
    [Map][6].entry("BD", "Bangladesh"),
    [Map][6].entry("BB", "Barbados")
);
       
[System][7].out.println("m2 = " + m2);
[System][7].out.println("m2 is an instance of " + m2.getClass());

```

As long as I don’t need to subsequently change the contents of the map created and initialized with `Map.ofEntries()`, this is a decent solution. Note above that rather than using `Map.of()` as in the first example, I used `Map.ofEntries()`.

However, supposing I want to create and initialize a map instance with some entries and later add to that map, I need to do something like this:


```


var m3 = new HashMap&lt;[String][9],String&gt;([Map][6].ofEntries(
    [Map][6].entry("AF", "Afghanistan"),
    [Map][6].entry("AX", "Åland Islands"),
    [Map][6].entry("AL", "Albania"),
    [Map][6].entry("DZ", "Algeria"),
    [Map][6].entry("AS", "American Samoa"),
    [Map][6].entry("AD", "Andorra"),
    [Map][6].entry("AO", "Angola"),
    [Map][6].entry("AI", "Anguilla"),
    [Map][6].entry("AQ", "Antarctica"),
    [Map][6].entry("AG", "Antigua and Barbuda"),
    [Map][6].entry("AR", "Argentina"),
    [Map][6].entry("AM", "Armenia"),
    [Map][6].entry("AW", "Aruba"),
    [Map][6].entry("AU", "Australia"),
    [Map][6].entry("AT", "Austria"),
    [Map][6].entry("AZ", "Azerbaijan"),
    [Map][6].entry("BS", "Bahamas"),
    [Map][6].entry("BH", "Bahrain"),
    [Map][6].entry("BD", "Bangladesh"),
    [Map][6].entry("BB", "Barbados")
));

[System][7].out.println("m3 = " + m3);
[System][7].out.println("m3 is an instance of " + m3.getClass());

m3.put("BY", "Belarus");
[System][7].out.println("BY: " + m3.get("BY"));

```

Here, by using the immutable map created by `Map.ofEntries()` as an argument to the `HashMap` constructor, I create a mutable copy of it, which I can then alter—for example, with the `put()` method.

Take a look at the Groovy version of the above:


```


def m1 = [
    "AF": "Afghanistan",
    "AX": "Åland Islands",
    "AL": "Albania",
    "DZ": "Algeria",
    "AS": "American Samoa",
    "AD": "Andorra",
    "AO": "Angola",
    "AI": "Anguilla",
    "AQ": "Antarctica",
    "AG": "Antigua and Barbuda",
    "AR": "Argentina",
    "AM": "Armenia",
    "AW": "Aruba",
    "AU": "Australia",
    "AT": "Austria",
    "AZ": "Azerbaijan",
    "BS": "Bahamas",
    "BH": "Bahrain",
    "BD": "Bangladesh",
    "BB": "Barbados"]

println "m1 = $m1"
println "m1 is an instance of ${m1.getClass()}"

m1["BY"] = "Belarus"
println "m1 = $m1"

```

At a glance, you see Groovy uses the `def` keyword rather than `var`—although in late-model Groovy (version 3+), it’s possible to use `var` instead.

You also see that you can create a map representation by putting a list of key-value pairs between brackets. Moreover, the list instance so created is quite useful for a couple of reasons. First, it’s mutable, and second, it’s an instance of `LinkedHashMap`**,** which preserves the order of insertion. So when you run the Java version and print the variable `m3`, you see:


```
`m3 = {BB=Barbados, BD=Bangladesh, AD=Andorra, AF=Afghanistan, AG=Antigua and Barbuda, BH=Bahrain, AI=Anguilla, AL=Albania, AM=Armenia, AO=Angola, AQ=Antarctica, BS=Bahamas, AR=Argentina, AS=American Samoa, AT=Austria, AU=Australia, DZ=Algeria, AW=Aruba, AX=Åland Islands, AZ=Azerbaijan}`
```

When you run the Groovy version, you see:


```
`m1 = [AF:Afghanistan, AX:Åland Islands, AL:Albania, DZ:Algeria, AS:American Samoa, AD:Andorra, AO:Angola, AI:Anguilla, AQ:Antarctica, AG:Antigua and Barbuda, AR:Argentina, AM:Armenia, AW:Aruba, AU:Australia, AT:Austria, AZ:Azerbaijan, BS:Bahamas, BH:Bahrain, BD:Bangladesh, BB:Barbados]`
```

Once again, you see how Groovy simplifies the situation. The syntax is very straightforward, somewhat reminiscent of Python’s dictionaries, and no need to remember the various contortions necessary if you have an initial list longer than ten pairs. Note that we use the expression:


```
`m1[“BY”] = “Belarus”`
```

Rather than the Java:


```
`m1.put(“BY”, “Belarus”)`
```

Also, the map is by default mutable, which is arguably good or bad, depending on the needs. I think what bothers me about the “immutable default” of the Java situation is that there isn’t something like `Map.mutableOfMutableEntries()`. This forces the programmer, who has just figured out how to declare and initialize a map, to switch gears and think about just how to convert the immutable map they have into something mutable. I also kind of wonder about the business of creating something immutable just to throw it away.

Another thing to think about is the square brackets as key lookup works to replace both `put()` and `get()` in Java, so you can write:


```
`m1[“ZZ”] = m1[“BY”]`
```

Instead of:


```
`m1.put(“ZZ”,m1.get(“BY”))`
```

Sometimes, it’s nice to think of keys and their values in the same way you think of fields in the instance of a class. Imagine you have a bunch of properties you want to set: In Groovy, this could look like:


```


def properties = [
      verbose: true,
      debug: false,
      logging: false]

```

And then later you can change it as:


```
`properties.verbose = false`
```

This works because, as long as the key follows certain rules, you can omit the quotes and use the dot operator instead of square brackets. While this can be quite useful and pleasant, it also means that to use the value of a variable as a key value in a map representation, you must enclose the variable in parentheses, like:


```
`def myMap = [(k1): v1, (k2): v2]`
```

This is a good moment to remind the diligent reader that Groovy is particularly well-suited to scripting. Often, maps are a key element in scripts, providing lookup tables and generally functioning as an in-memory database. The example I’ve used here is a subset of the ISO 3166 two-character country codes and country names. The codes are familiar to anyone who accesses internet hostnames in countries around the world, which could form a useful part of a scripting utility that looks at internet hostnames in log files to learn about the geographic distribution of users.

### Groovy resources

The [Apache Groovy site][10] has a lot of great documentation. Another great Groovy resource is [Mr. Haki][11]. The [Baeldung site][12] provides a lot of useful how-to in Java and Groovy. And a really great reason to learn Groovy is to go on and learn [Grails][13], which is a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/maps-groovy-vs-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/22/1/creating-lists-groovy-java
[3]: https://opensource.com/article/22/2/accumulating-lists-groovy-vs-java
[4]: https://en.wikipedia.org/wiki/Associative_array
[5]: https://sdkman.io/
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+map
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[8]: https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Map.html
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[10]: https://groovy-lang.org/
[11]: https://blog.mrhaki.com/
[12]: https://www.baeldung.com/
[13]: https://grails.org/
