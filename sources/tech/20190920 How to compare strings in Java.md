[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to compare strings in Java)
[#]: via: (https://opensource.com/article/19/9/compare-strings-java)
[#]: author: (Girish Managoli https://opensource.com/users/gammayhttps://opensource.com/users/sethhttps://opensource.com/users/clhermansenhttps://opensource.com/users/clhermansen)

How to compare strings in Java
======
There are six ways to compare strings in Java.
![Javascript code close-up with neon graphic overlay][1]

String comparison is a fundamental operation in programming and is often quizzed during interviews. These strings are a sequence of characters that are _immutable_ which means unchanging over time or unable to be changed.

Java has a number of methods for comparing strings; this article will teach you the primary operation of how to compare strings in Java.

There are six options:

  1. The == operator
  2. String equals
  3. String equalsIgnoreCase
  4. String compareTo
  5. String compareToIgnoreCase
  6. Objects equals



### The == operator

**==** is an operator that returns **true** if the contents being compared refer to the same memory or **false** if they don't. If two strings compared with **==** refer to the same string memory, the return value is **true**; if not, it is **false**.


```
[String][2] string1 = "MYTEXT";
[String][2] string2 = "YOURTEXT";
               
[System][3].out.println("Output: " + (string1 == string2));

Output: false
```

The return value of **==** above is **false**, as "MYTEXT" and "YOURTEXT" refer to different memory.


```
[String][2] string1 = "MYTEXT";
[String][2] string6 = "MYTEXT";
               
[System][3].out.println("Output: " + (string1 == string6));

Output: true
```

In this case, the return value of **==** is **true**, as the compiler internally creates one memory location for both "MYTEXT" memories, and both variables refer to the same memory location.


```
[String][2] string1 = "MYTEXT";
[String][2] string7 = string1;

[System][3].out.println("Output: " + (string1 == string7));

Output: true
```

If you guessed right, you know string7 is initialized with the same memory location as string1 and therefore **==** is true.


```
[String][2] string1 = "MYTEXT";
[String][2] string4 = new [String][2]("MYTEXT");

[System][3].out.println("Output: " + (string1 == string4));

Output: false
```

In this case, the compiler creates a new memory location, even though the value is the same for string4 and string1.


```
[String][2] string1 = "MYTEXT";
[String][2] string5 = new [String][2](string1);

[System][3].out.println("Output: " + (string1 == string4));

Output: false
```

Here, string5 is a new string object initialized with string1; hence, **string1 == string4** is not true.

### String equals

The string class has a **String equals** method to compare two strings. String comparison with **equals** is case-sensitive. According to the [docs][4]:


```
    /**
     * Compares this string to the specified object.  The result is {@code
     * true} if and only if the argument is not {@code null} and is a {@code
     * String} object that represents the same sequence of characters as this
     * object.
     *
     * @param  anObject
     *         The object to compare this {@code String} against
     *
     * @return  {@code true} if the given object represents a {@code String}
     *          equivalent to this string, {@code false} otherwise
     *
     * @see  #compareTo(String)
     * @see  #equalsIgnoreCase(String)
     */
    public boolean equals(Object anObject) { ... }
```

Let's see a few examples:


```
[String][2] string1 = "MYTEXT";
[String][2] string2 = "YOURTEXT";

[System][3].out.println("Output: " + string1.equals(string2));

Output: false
```

If the strings are not the same, the output of the **equals** method is obviously **false**.


```
[String][2] string1 = "MYTEXT";
[String][2] string3 = "mytext";

[System][3].out.println("Output: " + string1.equals(string3));

Output: false
```

These strings are the same in value but differ in case; hence, the output is **false**.


```
[String][2] string1 = "MYTEXT";
[String][2] string4 = new [String][2]("MYTEXT");

[System][3].out.println("Output: " + string1.equals(string4));

Output: true

[/code] [code]

[String][2] string1 = "MYTEXT";
[String][2] string5 = new [String][2](string1);

[System][3].out.println("Output: " + string1.equals(string5));

Output: true
```

The examples in both these cases are **true**, as the two values are the same. Unlike with **==**, the second example above returns **true**.

The string object on which **equals** is called should obviously be a valid string object and non-null.


```
[String][2] string1 = "MYTEXT";
[String][2] string8 = null;

[System][3].out.println("Output: " + string8.equals(string1));

[Exception][5] in thread _____  java.lang.[NullPointerException][6]
```

The above evidently is not a good code.


```
[System][3].out.println("Output: " + string1.equals(string8));

Output: false
```

This is alright.

### String equalsIgnoreCase

The behavior of **equalsIgnoreCase** is identical to **equals** with one difference—the comparison is not case-sensitive. The [docs][4] say:


```
    /**
     * Compares this {@code String} to another {@code String}, ignoring case
     * considerations.  Two strings are considered equal ignoring case if they
     * are of the same length and corresponding characters in the two strings
     * are equal ignoring case.
     *
     * &lt;p&gt; Two characters {@code c1} and {@code c2} are considered the same
     * ignoring case if at least one of the following is true:
     * &lt;ul&gt;
     *   &lt;li&gt; The two characters are the same (as compared by the
     *        {@code ==} operator)
     *   &lt;li&gt; Applying the method {@link
     *        java.lang.Character#toUpperCase(char)} to each character
     *        produces the same result
     *   &lt;li&gt; Applying the method {@link
     *        java.lang.Character#toLowerCase(char)} to each character
     *        produces the same result
     * &lt;/ul&gt;
     *
     * @param  anotherString
     *         The {@code String} to compare this {@code String} against
     *
     * @return  {@code true} if the argument is not {@code null} and it
     *          represents an equivalent {@code String} ignoring case; {@code
     *          false} otherwise
     *
     * @see  #equals(Object)
     */
    public boolean equalsIgnoreCase(String anotherString) { ... }
```

The second example in **equals** (above) is the only difference from the comparison in **equalsIgnoreCase**.


```
[String][2] string1 = "MYTEXT";
[String][2] string3 = "mytext";

[System][3].out.println("Output: " + string1.equalsIgnoreCase(string3));

Output: true
```

This returns **true** because the comparison is case-independent. All other examples under **equals** remain the same as they are for **equalsIgnoreCase**.

### String compareTo

The **compareTo** method compares two strings lexicographically (i.e., pertaining to alphabetical order) and case-sensitively and returns the lexicographical difference in the two strings. The [docs][4] describe lexicographical order computation as:


```
/**
     * Compares two strings lexicographically.
     * The comparison is based on the Unicode value of each character in
     * the strings. The character sequence represented by this
     * {@code String} object is compared lexicographically to the
     * character sequence represented by the argument string. The result is
     * a negative integer if this {@code String} object
     * lexicographically precedes the argument string. The result is a
     * positive integer if this {@code String} object lexicographically
     * follows the argument string. The result is zero if the strings
     * are equal; {@code compareTo} returns {@code 0} exactly when
     * the {@link #equals(Object)} method would return {@code true}.
     * &lt;p&gt;
     * This is the definition of lexicographic ordering. If two strings are
     * different, then either they have different characters at some index
     * that is a valid index for both strings, or their lengths are different,
     * or both. If they have different characters at one or more index
     * positions, let &lt;i&gt;k&lt;/i&gt; be the smallest such index; then the string
     * whose character at position &lt;i&gt;k&lt;/i&gt; has the smaller value, as
     * determined by using the &amp;lt; operator, lexicographically precedes the
     * other string. In this case, {@code compareTo} returns the
     * difference of the two character values at position {@code k} in
     * the two string -- that is, the value:
     * &lt;blockquote&gt;&lt;pre&gt;
     * this.charAt(k)-anotherString.charAt(k)
     * &lt;/pre&gt;&lt;/blockquote&gt;
     * If there is no index position at which they differ, then the shorter
     * string lexicographically precedes the longer string. In this case,
     * {@code compareTo} returns the difference of the lengths of the
     * strings -- that is, the value:
     * &lt;blockquote&gt;&lt;pre&gt;
     * this.length()-anotherString.length()
     * &lt;/pre&gt;&lt;/blockquote&gt;
     *
     * @param   anotherString   the {@code String} to be compared.
     * @return  the value {@code 0} if the argument string is equal to
     *          this string; a value less than {@code 0} if this string
     *          is lexicographically less than the string argument; and a
     *          value greater than {@code 0} if this string is
     *          lexicographically greater than the string argument.
     */
    public int compareTo(String anotherString) { ... }
```

Let's look at some examples.


```
[String][2] string1 = "A";
[String][2] string2 = "B";

[System][3].out.println("Output: " + string1.compareTo(string2));

Output: -1
[System][3].out.println("Output: " + string2.compareTo(string1));

Output: 1

[/code] [code]

[String][2] string1 = "A";
[String][2] string3 = "a";

[System][3].out.println("Output: " + string1.compareTo(string3));

Output: -32

[System][3].out.println("Output: " + string3.compareTo(string1));

Output: 32

[/code] [code]

[String][2] string1 = "A";
[String][2] string6 = "A";
               
        [System][3].out.println("Output: " + string1.compareTo(string6));

Output: 0

[/code] [code]

String string1 = "A";
String string8 = null;
               
System.out.println("Output: " + string8.compareTo(string1));

Exception in thread ______  java.lang.NullPointerException
at java.lang.String.compareTo(String.java:1155)

String string1 = "A";
String string10 = "";
               
System.out.println("Output: " + string1.compareTo(string10));

Output: 1
```

### String compareToIgnoreCase

The behavior of **compareToIgnoreCase** is identical to **compareTo** with one difference: the strings are compared without case consideration.


```
[String][2] string1 = "A";
[String][2] string3 = "a";

[System][3].out.println("Output: " + string1.compareToIgnoreCase(string3));

Output: 0
```

### Objects equals

The **Objects equals** method invokes the overridden **String equals** method; its behavior is the same as in the **String equals** example above.


```
[String][2] string1 = "MYTEXT";
[String][2] string2 = "YOURTEXT";

[System][3].out.println("Output: " + Objects(string1, string2));

Output: false

[/code] [code]

[String][2] string1 = "MYTEXT";
[String][2] string3 = "mytext";

[System][3].out.println("Output: " + Objects(string1, string3));

Output: false

[/code] [code]

[String][2] string1 = "MYTEXT";
[String][2] string6 = "MYTEXT";

[System][3].out.println("Output: " + Objects(string1, string6));

Output: true

[/code] [code]

[String][2] string1 = "MYTEXT";
[String][2] string8 = null;

[System][3].out.println("Output: " + Objects.equals(string1, string8));

Output: false

[System][3].out.println("Output: " + Objects.equals(string8, string1));

Output: false

[/code] [code]

[String][2] string8 = null;
[String][2] string9 = null;

[System][3].out.println("Output: " + Objects.equals(string8, string9));

Output: true
```

The advantage here is that the **Objects equals** method checks for null values (unlike **String equals**). The implementation of **Object equals** is:


```
public static boolean equals([Object][7] a, [Object][7] b) {
return (a == b) || (a != null &amp;&amp; a.equals(b));
}
```

### Which method to use?

There are many methods to compare two strings. Which one should you use? As a common practice, use **String equals** for case-sensitive strings and **String equalsIgnoreCase** for case-insensitive comparisons. However, one caveat: take care of NPE (**NullPointerException**) if one or both strings are null.

The source code is available on [GitLab][8] and [GitHub][9].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/compare-strings-java

作者：[Girish Managoli][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gammayhttps://opensource.com/users/sethhttps://opensource.com/users/clhermansenhttps://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl (Javascript code close-up with neon graphic overlay)
[2]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[3]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[4]: http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/687fd7c7986d/src/share/classes/java/lang/String.java
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+exception
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+nullpointerexception
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+object
[8]: https://gitlab.com/gammay/stringcomparison
[9]: https://github.com/gammay/stringcompare
