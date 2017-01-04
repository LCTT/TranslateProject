Living (Android) without Kotlin
============================================================

![](https://cdn-images-1.medium.com/max/2000/1*Fd349rzh3XWwSbCP2IV7zA.jpeg)

> It is easier to get into something than to get out of it. — Donald Rumsfeld

Living without Kotlin is like playing Warcraft III on the touchpad. Buying a mouse is simple but what can you do if your new employer does not want to let you use Kotlin in production?

There are a few options.

*   Fight with your product owner to obtain the rights to use Kotlin.
*   Use Kotlin and do not tell anyone about it because you know best what is best for you.
*   Wipe away your tears and use Java in all its glory.

Imagine that you lost the battle with your product owner and as a professional engineer, you will not lie and use hipster technology without anyone’s permission. I know that it sounds pretty scary especially when you have already tasted Kotlin but do not lose your hope.

In further parts of this article, I want to shortly describe some Kotlin features that you can apply to your Android Java code through some well-known tools and libraries. A rudimentary understanding of Kotlin and Java is required.

### Data classes

You really do love Kotlin’s data classes, don't you? It is so easy to get `equals()`, `hashCode()`, `toString()` and `copy()` generated for you. To be specific `data` keyword also generates `componentN()` functions corresponding to the properties in their order of declaration. They are used in destructuring declarations.

```
data class Person(val name: String)
val (riddle) = Person("Peter")
println(riddle)
```

Do you know what will be printed? For sure it will not be the value returned from the `toString()` of the `Person` class. Here is where the destructuring declaration comes to play and assigns a value from `name` to `riddle`. Using parenthesis for `(riddle)` compiler knows that it has to use destructuring declaration mechanism.


```
val (riddle): String = Person("Peter").component1()
println(riddle) // prints Peter
view raw
```

>The code does not compile. It is just to show how does the destructuring declaration work.

As you can see `data` keyword is a super useful language feature so what can you do to bring it to your Java world? Use annotation processor and modify the Abstract Syntax Tree. If you want to go deeper please read the article listed at the end(Project Lombok — Trick Explained).

Using project Lombok you can achieve almost the same functionality that `data` keyword provides. Unfortunately, there is no way to have destructuring declarations.

```
import lombok.Data;

@Data class Person {
    final String name;
}
```


`@Data` annotation generates `equals()`, `hashCode()` and `toString()`. Additionally, it creates getters for all fields, setters for all non-final fields and constructor with all required fields(finals). It is worth to be aware of that Lombok is used just for compilation so the library code will not be added to your final `.apk`.

### Lambda expressions

Android engineers have a pretty tough life because of lack of Java 8 features and one of them are lambda expressions. Lambdas are great as they cut down tons of boilerplate for you. You can use them in your callbacks and streams. In Kotlin lambda expressions are built-in and they look way much better than they look in Java. Moreover, the bytecode of the lambda can be inserted directly into the bytecode of the calling method, so the method count does not increase. It can be done using inline functions.

```
button.setOnClickListener { println("Hello World") }
```

Lately Google announced support for Java 8 features in Android and thanks to Jack compiler you can use lambdas in your code. It is also good to mention that they are available on API level 23 and lower.

```
button.setOnClickListener(view -> System.out.println("Hello World!"));
```

How to enable them? Just add those several lines to your `build.gradle` file.

```
defaultConfig {
    jackOptions {
        enabled true
    }
}

compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
}
```

If you are not a fan of Jack compiler or for some reasons you cannot use it, there is a different solution for you. Project Retrolambda lets you run Java 8 code with lambda expressions and method references on Java 7, 6 or 5 and here is the setup.

```
dependencies {
    classpath 'me.tatarka:gradle-retrolambda:3.4.0'
}

apply plugin: 'me.tatarka.retrolambda'

compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
}
```

As I mentioned before inline functions in lambdas in Kotlin do not increase method count but what about using them with Jack or Retrolambda? Obviously, they do not come for free and the hidden costs are listed below.


 ![](https://cdn-images-1.medium.com/max/800/1*H7h2MB2auMslMkdaDtqAfg.png) 

### Data manipulations

Kotlin introduces higher-order functions as a replacement for streams. They are extremely useful when you have to transform one set of data to another or filter the collection.

```
fun foo(persons: MutableList<Person>) {
    persons.filter { it.age >= 21 }
           .filter { it.name.startsWith("P") }
           .map { it.name }
           .sorted()
           .forEach(::println)
}

data class Person(val name: String, val age: Int)
```

Streams are also provided by Google using Jack compiler. Unfortunately, Jack does not work with Lombok because it skips generating intermediate `.class` files when compiling the code and Lombok depends on these files.

```
void foo(List<Person> persons) {
    persons.stream()
           .filter(it -> it.getAge() >= 21)
           .filter(it -> it.getName().startsWith("P"))
           .map(Person::getName)
           .sorted()
           .forEach(System.out::println);
}

class Person {
    final private String name;
    final private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    String getName() { return name; }
    int getAge() { return age; }
}
```

That is too good to be true so where is the catch? Sadly, streams are available from API 24\. Good job Google but in what universe apps have `minSdkVersion = 24`?

Fortunately Android platform has an awesome open source community which produces a lot of great libraries. Lightweight-Stream-API is one of them and it contains streams implementation based on iterators for Java 7 and below.

```
import lombok.Data;
import com.annimon.stream.Stream;

void foo(List<Person> persons) {
    Stream.of(persons)
          .filter(it -> it.getAge() >= 21)
          .filter(it -> it.getName().startsWith("P"))
          .map(Person::getName)
          .sorted()
          .forEach(System.out::println);
}

@Data class Person {
    final String name;
    final int age;
}
```

The sample above combines Lombok, Retrolambda, and Lightweight-Stream-API and it looks almost as good as Kotlin, doesn’t it. Using static factory method allows you to transform any Iterable into a stream and apply lambdas on it as on Java 8 streams. It would be perfect to wrap the static invocation `Stream.of(persons)` into extension function of Iterable type but Java does not support it.

### Extension functions

Extension mechanism provides an ability to add functionality to a class without having to inherit from it. This well-known concept fits great in the Android world and that is why Kotlin is so popular in the community.

Is there any technique or magic trick that brings extension functions to your Java toolbox? Thanks to Lombok you can use them as an experimental feature. According to what Lombok documentation says they want to move it out of experimental status with no or minor changes soon. Let’s refactor last sample and wrap `Stream.of(persons)` into extension function.

```
import lombok.Data;
import lombok.experimental.ExtensionMethod;

@ExtensionMethod(Streams.class)
public class Foo {
    void foo(List<Person> persons) {
        persons.toStream()
               .filter(it -> it.getAge() >= 21)
               .filter(it -> it.getName().startsWith("P"))
               .map(Person::getName)
               .sorted()
               .forEach(System.out::println);
    }
}

@Data class Person {
    final String name;
    final int age;
}

class Streams {
    static <T> Stream<T> toStream(List<T> list) {
        return Stream.of(list);
    }
}
```

All methods that are `public`, `static`, and have at least one argument whose type is not primitive, are considered extension methods. `@ExtensionMethod` annotation allows you to specify a class that contains your extension functions. Instead of using one `.class` object you can also pass an array.

* * *

I am fully aware that some of my thoughts are pretty controversial especially Lombok ones and I also know that there are a lot of other libraries that can make your life easier. Please do not hesitate to share your experience in comments. Cheers!

 ![](https://cdn-images-1.medium.com/max/800/1*peB9mmElOn6xwR3eH0HXXA.png) 



---------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/1*l7_L6VCKzkOm0gq4Kplnkw.jpeg)

Coder and professional dreamer @ Grid Dynamics

--------------------------------------------------------------------------------

via: https://hackernoon.com/living-android-without-kotlin-db7391a2b170#.q95i5232f

作者：[Piotr Ślesarew][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@piotr.slesarew?source=post_header_lockup
[1]:http://jakewharton.com/exploring-java-hidden-costs/
[2]:https://medium.com/u/8ddd94878165
[3]:https://projectlombok.org/index.html
[4]:https://github.com/aNNiMON/Lightweight-Stream-API
[5]:https://github.com/orfjackal/retrolambda
[6]:http://notatube.blogspot.com/2010/11/project-lombok-trick-explained.html
[7]:http://notatube.blogspot.com/2010/11/project-lombok-trick-explained.html
[8]:https://twitter.com/SliskiCode
