[#]: subject: "Tips for formatting when printing to console from C++"
[#]: via: "https://opensource.com/article/21/11/c-stdcout-cheat-sheet"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tips for formatting when printing to console from C++
======
Next time you struggle with console output formatting, refer to this
article or the related cheat sheet.
![Woman sitting in front of her computer][1]

When I started writing, I did it primarily for the purpose of documenting for myself. When it comes to programming, I'm incredibly forgetful, so I began to write down useful code snippets, special characteristics, and common mistakes in the programming languages I use. This article perfectly fits the original idea as it covers common use cases of formatting when printing to console from C++.

**[Download the [C++ std::cout cheat sheet][2]]**

As usual, this article comes with a lot of examples. Unless otherwise stated, all types and classes shown in the code snippets are part of the `std` namespace. So while you are reading this code, you have to put `using namespace std;` in front of types and classes. Of course, the example code is also available on [GitHub][3].

### Object-oriented stream

If you've ever programmed in C++, you've certainly already used [cout][4]. The _cout_ object of type [ostream][5] comes into scope when you include &lt;iostream&gt;. This article focuses on _cout_, which lets you print to the console but the general formatting described here is valid for all stream objects of type [ostream][5]. An _ostream_ object is an instance of basic_ostream with the template parameter of type char. The header &lt;iosfwd&gt;, which is part of the include hierarchy of &lt;iostream&gt;, contains forward declarations for common types.

The class _basic_ostream_ inherits from basic_ios and this type, in turn, inherits from ios_base. On [cppreference.com][6] you find a class diagram that shows the relationship between the different classes.

The class ios_base is the base class for all I/O stream classes. The class basic_ios is a template class that has a specialization for common character types called **ios**. So when you read about _ios_ in the context of standard I/O, it is the char-type specialization of basic_ios.

### Formatting streams

In general, there are three ways of formatting ostream-based streams:

  1. Using the format flags provided by ios_base.
  2. Stream modifying functions defined in the header &lt;iomanip&gt; and &lt;ios&gt;.
  3. By invoking a [specific overload][7] of the _&lt;&lt;_-operator.



All methods have their pros and cons, and it usually depends on the situation when which method is used. The following examples show a mixture of all methods.

#### Right justified

By default, _cout_ occupies as much space as the data to print requires. To allow that right-justified output to take effect, you have to define the maximum width that a line is allowed to occupy. I use the format flags to reach the goal.

The flag for right-justified output and the width adjustment only applies to the subsequent line:


```


cout.setf(ios::right, ios::adjustfield);
cout.width(50);
cout &lt;&lt; "This text is right justified" &lt;&lt; endl;
cout &lt;&lt; "This text is left justified again" &lt;&lt; endl;

```

In the above code, I configure the right-justified output using setf. I recommend you apply the bitmask _ios::adjustfield_ to _setf_, which causes all flags the bitmask specifies to be reset before the actual _ios::right_ flag gets set to prevent colliding combinations.

#### Fill white space

When using right-justified output, the empty space is filled with blanks by default. You can change it by specifying the fill character using setfill:


```


cout &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(30) &lt;&lt; 500 &lt;&lt; " pcs" &lt;&lt; endl;
cout &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(30) &lt;&lt; 3000 &lt;&lt; " pcs" &lt;&lt; endl;
cout &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(30) &lt;&lt; 24500 &lt;&lt; " pcs" &lt;&lt; endl;

```

The code produces the following output:


```


...........................500 pcs
..........................3000 pcs
.........................24500 pcs

```

#### Combine 

Imagine your C++ program keeps track of your pantry inventory. From time to time, you want to print a list of the current stock. To do so, you could use the following formatting.

The following code is a combination of left- and right-justified output using dots as fill characters to get a nice looking list:


```


cout &lt;&lt; left &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; "Flour" &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; 0.7 &lt;&lt; " kg" &lt;&lt; endl;
cout &lt;&lt; left &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; "Honey" &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; 2 &lt;&lt; " Glasses" &lt;&lt; endl;
cout &lt;&lt; left &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; "Noodles" &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; 800 &lt;&lt; " g" &lt;&lt; endl;
cout &lt;&lt; left &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; "Beer" &lt;&lt; right &lt;&lt; setfill('.') &lt;&lt; setw(20) &lt;&lt; 20 &lt;&lt; " Bottles" &lt;&lt; endl;

```

Output:


```


Flour...............................0.70 kg
Honey..................................2 Glasses
Noodles..............................800 g
Beer..................................20 Bottles

```

### Printing values

Of course, stream-based output also offers a multitude of possibilities to output all kinds of variable types.

#### Boolean

The boolalpha switch lets you convert the binary interpretation of a bool to a string:


```


cout &lt;&lt; "Boolean output without using boolalpha: " &lt;&lt; true &lt;&lt; " / " &lt;&lt; false &lt;&lt; endl;
cout &lt;&lt; "Boolean output using boolalpha: " &lt;&lt; boolalpha &lt;&lt; true &lt;&lt; " / " &lt;&lt; false &lt;&lt; endl;

```

The lines above produce the following output:


```


Boolean output without using boolalpha: 1 / 0
Boolean output using boolalpha: true / false

```

#### Addresses

If the value of an integer should be treated as an address, it is sufficient to cast it to _void*_ in order to invoke the correct overload. Here is an example:


```


unsigned long someAddress = 0x0000ABCD;
cout &lt;&lt; "Treat as unsigned long: " &lt;&lt; someAddress &lt;&lt; endl;
cout &lt;&lt; "Treat as address: " &lt;&lt; (void*)someAddress &lt;&lt; endl;

```

The code produces the following output:


```


Treat as unsigned long: 43981
Treat as address: 0000ABCD

```

The code prints the address with the correct length. A 32-bit executable produced the above output.

#### Integers

Printing integers is straightforward. For demonstration purpose I specify the base of the number using setf and setiosflags. Applying the stream modifiers hex/oct would have the same effect:


```


int myInt = 123;

cout &lt;&lt; "Decimal: " &lt;&lt; myInt &lt;&lt; endl;

cout.setf(ios::hex, ios::basefield);
cout &lt;&lt; "Hexadecimal: " &lt;&lt; myInt &lt;&lt; endl;

cout &lt;&lt; "Octal: " &lt;&lt; resetiosflags(ios::basefield) &lt;&lt;  setiosflags(ios::oct) &lt;&lt; myInt &lt;&lt; endl;

```

**Note:** There is no indicator for the used base by default, but you can add one using showbase.


```


Decimal: 123
Hexadecimal: 7b
Octal: 173

```

#### Padding with zeros


```


0000003
0000035
0000357
0003579

```

You can get an output like the above by specifying the width and the fill character:


```


cout &lt;&lt; setfill('0') &lt;&lt; setw(7) &lt;&lt; 3 &lt;&lt; endl;
cout &lt;&lt; setfill('0') &lt;&lt; setw(7) &lt;&lt; 35 &lt;&lt; endl;
cout &lt;&lt; setfill('0') &lt;&lt; setw(7) &lt;&lt; 357 &lt;&lt; endl;
cout &lt;&lt; setfill('0') &lt;&lt; setw(7) &lt;&lt; 3579 &lt;&lt; endl;

```

#### Floating-point values

If I want to print floating-point values, I can choose between the _fixed_\- and _scientific_-format. Additionally, I can specify the precision.


```


double myFloat = 1234.123456789012345;
int defaultPrecision = cout.precision(); // == 2

cout &lt;&lt; "Default precision: " &lt;&lt; myFloat &lt;&lt; endl;
cout.precision(4);
cout &lt;&lt; "Modified precision: " &lt;&lt; myFloat &lt;&lt; endl;
cout.setf(ios::scientific, ios::floatfield);
cout &lt;&lt; "Modified precision &amp; scientific format: " &lt;&lt; myFloat &lt;&lt; endl;
/* back to default */
cout.precision(defaultPrecision);
cout.setf(ios::fixed, ios::floatfield);
cout &lt;&lt; "Default precision &amp; fixed format:  " &lt;&lt; myFloat &lt;&lt; endl;

```

The code above produces the following output:


```


Default precision: 1234.12
Modified precision: 1234.1235
Modified precision &amp; scientific format: 1.2341e+03
Default precision &amp; fixed format:  1234.12

```

#### Time and Money

With put_money, you can print currency units in the correct, locale-dependent formatting. This requires that your console can output UTF-8 charset. Note that the variable _specialOffering_ stores the monetary value in cents:


```


long double specialOffering = 9995;

cout.imbue(locale("en_US.UTF-8"));
cout &lt;&lt; showbase &lt;&lt; put_money(specialOffering) &lt;&lt; endl;
cout.imbue(locale("de_DE.UTF-8"));
cout &lt;&lt; showbase &lt;&lt; put_money(specialOffering) &lt;&lt; endl;
cout.imbue(locale("ru_RU.UTF-8"));
cout  &lt;&lt; showbase &lt;&lt; put_money(specialOffering) &lt;&lt; endl;

```

The imbue-method of _ios_ lets you specify a locale. With the command `locale -a`, you can get a list of all available locale identifiers on your system. 


```


$99.95
99,950€
99,950₽

```

_(For whatever reason, it prints euro and ruble with three decimal places on my system, which looks strange for me, but maybe this is the official formatting.)_

The same principle applies to time output. The function put_time lets you print the time in the corresponding locale format. Additionally, you can specify which parts of a time object get printed.


```


time_t now = time(nullptr);
tm localtm = *localtime(&amp;now);

cout.imbue(locale("en_US.UTF-8"));
cout &lt;&lt; "en_US : " &lt;&lt; put_time(&amp;localtm, "%c") &lt;&lt; endl;
cout.imbue(locale("de_DE.UTF-8"));
cout &lt;&lt; "de_DE : " &lt;&lt; put_time(&amp;localtm, "%c") &lt;&lt; endl;
cout.imbue(locale("ru_RU.UTF-8"));
cout &lt;&lt; "ru_RU : " &lt;&lt; put_time(&amp;localtm, "%c") &lt;&lt; endl;

```

The format specifier _%c_ causes to print a standard date and time string:


```


en_US : Tue 02 Nov 2021 07:36:36 AM CET
de_DE : Di 02 Nov 2021 07:36:36 CET
ru_RU : Вт 02 ноя 2021 07:36:36

```

### Creating custom stream modifiers

You can also create your own stream. The following code inserts a predefined string when applied to an _ostream_ object:


```


ostream&amp; myManipulator(ostream&amp; os) {
    string myStr = "&gt;&gt;&gt;Here I am&lt;&lt;&lt;";
    os &lt;&lt; myStr;
    return os;
}

```

**Another example:** If you have something important to say, like most people on the internet, you could use the following code to insert exclamation marks after your message depending on the level of importance. The level of importance gets passed as an argument:


```


struct T_Importance {
     int levelOfSignificance;
};

T_Importance importance(int lvl){
    T_Importance x = {.levelOfSignificance = lvl };
    return x;
}

ostream&amp; operator&lt;&lt;(ostream&amp; __os, T_Importance t){

    for(int i = 0; i &lt; t.levelOfSignificance; ++i){
        __os.put('!');
    }
    return __os;
}

```

Both modifiers can now be simply passed to _cout_:


```


cout &lt;&lt; "My custom manipulator: " &lt;&lt; myManipulator &lt;&lt; endl;

cout &lt;&lt; "I have something important to say" &lt;&lt; importance(5) &lt;&lt; endl;

```

Producing the following output:


```


My custom manipulator: &gt;&gt;&gt;Here I am&lt;&lt;&lt;

I have something important to say!!!!!

```

### Conclusion

Next time you struggle with console output formatting, I hope you remember this article or the related [cheat sheet][2].

In C++ applications, _cout_ is the new neighbor of [printf][8]. While using _printf_ is still valid, I would probably always prefer using _cout_. Especially the combination with the modifying function defined in _&lt;ios&gt;_ results in nice, readable code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/c-stdcout-cheat-sheet

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_2.png?itok=JPlR5aCA (Woman sitting in front of her computer)
[2]: https://opensource.com/downloads/cout-cheat-sheet
[3]: https://github.com/hANSIc99/cpp_output_formatting
[4]: https://en.cppreference.com/w/cpp/io/cout
[5]: https://en.cppreference.com/w/cpp/io/basic_ostream
[6]: https://en.cppreference.com/w/cpp/io
[7]: https://en.cppreference.com/w/cpp/io/basic_ostream/operator_ltlt
[8]: https://opensource.com/article/20/8/printf
