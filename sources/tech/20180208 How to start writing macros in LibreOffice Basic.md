How to start writing macros in LibreOffice Basic
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code1.png?itok=aP7t4ntl)

I have long promised to write about the scripting language [Basic][1] and creating macros in LibreOffice. This article is devoted to the types of data used in LibreOffice Basic, and to a greater extent, descriptions of variables and the rules for using them. I will try to provide enough information for advanced as well as novice users.

(And, I would like to thank everyone who commented on and offered recommendations on the Russian article, especially those who helped answer difficult questions.)

### Variable naming conventions

Variable names cannot contain more than 255 characters. They should start with either upper- or lower-case letters of the Latin alphabet, and they can include underscores ("_") and numerals. Other punctuation or characters from non-Latin alphabets can cause a syntax error or a BASIC runtime error if names are not put within square brackets.

Here are some examples of correct variable names:
```
MyNumber=5

MyNumber5=15

MyNumber_5=20

_MyNumber=96

[My Number]=20.5

[5MyNumber]=12

[Number,Mine]=12

[DéjàVu]="It seems that I have seen it!"

[Моя переменная]="The first has went!"

[Мой % от зделки]=0.0001

```

Note: In examples that contain square brackets, if you remove the brackets, macros will show a window with an error. As you can see, you can use localized variable names. Whether it makes sense to do so is up to you.

### Declaring variables

Strictly speaking, it is not necessary to declare variables in LibreOffice Basic (except for arrays). If you write a macro from a pair of lines to work with small documents, you don't need to declare variables, as the variable will automatically be declared as the variant type. For longer macros or those that will work in large documents, it is strongly recommended that you declare variables. First, it increases the readability of the text. Second, it allows you to control variables that can greatly facilitate the search for errors. Third, the variant type is very resource-intensive, and considerable time is needed for the hidden conversion. In addition, the variant type does not choose the optimal variable type for data, which increases the workload of computer resources.

Basic can automatically assign a variable type by its prefix (the first letter in the name) to simplify the work if you prefer to use the Hungarian notation. For this, the statement **DefXXX** is used; **XXX** is the letter type designation. A statement with a letter will work in the module, and it must be specified before subprograms and functions appear. There are 11 types:
```
DefBool - for boolean variables;
DefInt - for integer variables of type Integer;
DefLng - for integer variables of type Long Integer;
DefSng - for variables with a single-precision floating point;
DefDbl - for variables with double-precision floating-point type Double;
DefCur - for variables with a fixed point of type Currency;
DefStr - for string variables;
DefDate - for date and time variables;
DefVar - for variables of Variant type;
DefObj - for object variables;
DefErr - for object variables containing error information.

```

If you already have an idea of the types of variables in LibreOffice Basic, you probably noticed that there is no **Byte** type in this list, but there is a strange beast with the **Error** type. Unfortunately, you just need to remember this; I have not yet discovered why this is true. This method is convenient because the type is assigned to the variables automatically. But it does not allow you to find errors related to typos in variable names. In addition, it will not be possible to specify non-Latin letters; that is, all names of variables in square brackets that need to be declared must be declared explicitly.

To avoid typos when using declared variables explicitly, you can use the statement **OPTION EXPLICIT**. This statement should be the first line of code in the module. All other commands, except comments, should be placed after it. This statement tells the interpreter that all variables must be declared explicitly; otherwise, it produces an error. Naturally, this statement makes it meaningless to use the **Def** statement in the code.

A variable is declared using the statement **Dim**. You can declare several variables simultaneously, even different types, if you separate their names with commas. To determine the type of a variable with an explicit declaration, you can use either a corresponding keyword or a type-declaration sign after the name. If a type-declaration sign or a keyword is not used after the variable, then the **Variant** type is automatically assigned to it. For example:
```
Dim iMyVar                      'variable of Variant type
Dim iMyVar1 As Integer, iMyVar2 As Integer 'in both cases Integer type
Dim iMyVar3, iMyVar4 As Integer 'in this case the first variable
                                'is Variant, and the second is Integer
```

### Variable types

LibreOffice Basic supports seven classes of variables:

  * Logical variables containing one of the values: **TRUE** or **FALSE**
  * Numeric variables containing numeric values. They can be integer, integer-positive, floating-point, and fixed-point
  * String variables containing character strings
  * Date variables can contain a date and/or time in the internal format
  * Object variables can contain objects of different types and structures
  * Arrays
  * Abstract type **Variant**



#### Logical variables – Boolean

Variables of the **Boolean** type can contain only one of two values: **TRUE** or **FALSE**. In the numerical equivalent, the value FALSE corresponds to the number 0, and the value TRUE corresponds to **-1** (minus one). Any value other than zero passed to a variable of the Boolean type will be converted to **TRUE** ; that is, converted to a minus one. You can explicitly declare a variable in the following way:
```
Dim MyBoolVar As Boolean
```

I did not find a special symbol for it. For an implicit declaration, you can use the **DefBool** statement. For example:
```
DefBool b 'variables beginning with b by default are the type Boolean
```

The initial value of the variable is set to **FALSE**. A Boolean variable requires one byte of memory.

#### Integer variables

There are three types of integer variables: **Byte** , **Integer** , and **Long Integer**. These variables can only contain integers. When you transfer numbers with a fraction into such variables, they are rounded according to the rules of classical arithmetic (not to the larger side, as it stated in the help section). The initial value for these variables is 0 (zero).

#### Byte

Variables of the **Byte** type can contain only integer-positive values in the range from 0 to 255. Do not confuse this type with the physical size of information in bytes. Although we can write down a hexadecimal number to a variable, the word  "Byte" indicates only the dimensionality of the number. You can declare a variable of this type as follows:
```
Dim MyByteVar As Byte
```

There is no a type-declaration sign for this type. There is no the statement Def of this type. Because of its small dimension, this type will be most convenient for a loop index, the values of which do not go beyond the range. A **Byte** variable requires one byte of memory.

#### Integer

Variables of the Integer type can contain integer values from -32768 to 32767. They are convenient for fast calculations in integers and are suitable for a loop index. **%** is a type-declaration sign. You can declare a variable of this type in the following ways:
```
Dim MyIntegerVar%
Dim MyIntegerVar As Integer
```

For an implicit declaration, you can use the **DefInt** statement. For example:
```
DefInt i 'variables starting with i by default have type Integer
```

An Integer variable requires two bytes of memory.

#### Long integer

Variables of the Long Integer type can contain integer values from -2147483648 to 2147483647. Long Integer variables are convenient in integer calculations when the range of type Integer is insufficient for the implementation of the algorithm. **&** is a type-declaration sign. You can declare a variable of this type in the following ways:
```
Dim MyLongVar&
Dim MyLongVar As Long

```

For an implicit declaration, you can use the **DefLng** statement. For example:
```
DefLng l 'variables starting with l have Long by default
```

A Long Integer variable requires four bytes of memory.

#### Numbers with a fraction

All variables of these types can take positive or negative values of numbers with a fraction. The initial value for them is 0 (zero). As mentioned above, if a number with a fraction is assigned to a variable capable of containing only integers, LibreOffice Basic rounds the number according to the rules of classical arithmetic.

#### Single

Single variables can take positive or negative values in the range from 3.402823x10E+38 to 1.401293x10E-38. Values of variables of this type are in single-precision floating-point format. In this format, only eight numeric characters are stored, and the rest is stored as a power of ten (the number order). In the Basic IDE debugger, you can see only 6 decimal places, but this is a blatant lie. Computations with variables of the Single type take longer than Integer variables, but they are faster than computations with variables of the Double type. A type-declaration sign is **!**. You can declare a variable of this type in the following ways:
```
Dim MySingleVar!
Dim MySingleVar As Single
```

For an implicit declaration, you can use the **DefSng** statement. For example:
```
DefSng f 'variables starting with f have the Single type by default
```

A single variable requires four bytes of memory.

#### Double

Variables of the Double type can take positive or negative values in the range from 1.79769313486231598x10E308 to 1.0x10E-307. Why such a strange range? Most likely in the interpreter, there are additional checks that lead to this situation. Values of variables of the Double type are in double-precision floating-point format and can have 15 decimal places. In the Basic IDE debugger, you can see only 14 decimal places, but this is also a blatant lie. Variables of the Double type are suitable for precise calculations. Calculations require more time than the Single type. A type-declaration sign is **#**. You can declare a variable of this type in the following ways:
```
Dim MyDoubleVar#
Dim MyDoubleVar As Double
```

For an implicit declaration, you can use the **DefDbl** statement. For example:
```
DefDbl d 'variables beginning with d have the type Double by default
```

A variable of the Double type requires 8 bytes of memory.

#### Currency

Variables of the Currency type are displayed as numbers with a fixed point and have 15 signs in the integral part of a number and 4 signs in fractional. The range of values includes numbers from -922337203685477.6874 to +92337203685477.6874. Variables of the Currency type are intended for exact calculations of monetary values. A type-declaration sign is **@**. You can declare a variable of this type in the following ways:
```
Dim MyCurrencyVar@
Dim MyCurrencyVar As Currency
```

For an implicit declaration, you can use the **DefCur** statement. For example:
```
DefCur c 'variables beginning with c have the type Currency by default
```

A Currency variable requires 8 bytes of memory.

#### String

Variables of the String type can contain strings in which each character is stored as the corresponding Unicode value. They are used to work with textual information, and in addition to printed characters (symbols), they can also contain non-printable characters. I do not know the maximum size of the line. Mike Kaganski experimentally set the value to 2147483638 characters, after which LibreOffice falls. This corresponds to almost 4 gigabytes of characters. A type-declaration sign is **$**. You can declare a variable of this type in the following ways:
```
Dim MyStringVar$
Dim MyStringVar As String
```

For an implicit declaration, you can use the **DefStr** statement. For example:
```
DefStr s 'variables starting with s have the String type by default
```

The initial value of these variables is an empty string (""). The memory required to store string variables depends on the number of characters in the variable.

#### Date

Variables of the Date type can contain only date and time values stored in the internal format. In fact, this internal format is the double-precision floating-point format (Double), where the integer part is the number of days, and the fractional is part of the day (that is, 0.00001157407 is one second). The value 0 is equal to 30.12.1899. The Basic interpreter automatically converts it to a readable version when outputting, but not when loading. You can use the Dateserial, Datevalue, Timeserial, or Timevalue functions to quickly convert to the internal format of the Date type. To extract a certain part from a variable in the Date format, you can use the Day, Month, Year, Hour, Minute, or Second functions. The internal format allows us to compare the date and time values by calculating the difference between two numbers. There is no a type-declaration sing for the Date type, so if you explicitly define it, you need to use the Date keyword.
```
Dim MyDateVar As Date
```

For an implicit declaration, you can use the **DefDate** statement. For example:
```
DefDate y 'variables starting with y have the Date type by default
```

A Date variable requires 8 bytes of memory.

**Types of object variables**

We can take two variables types of LibreOffice Basic to Objects.

#### Objects

Variables of the Object type are variables that store objects. In general, the object is any isolated part of the program that has the structure, properties, and methods of access and data processing. For example, a document, a cell, a paragraph, and dialog boxes are objects. They have a name, size, properties, and methods. In turn, these objects also consist of objects, which in turn can also consist of objects. Such a "pyramid" of objects is often called an object model, and it allows us, when developing small objects, to combine them into larger ones. Through a larger object, we have access to smaller ones. This allows us to operate with our documents, to create and process them while abstracting from a specific document. There is no a type-declaration sing for the Object type, so for an explicit definition, you need to use the Object keyword.
```
Dim MyObjectVar As Object
```

For an implicit declaration, you can use the **DefObj** statement. For example:
```
DefObj o 'variables beginning with o have the type Object by default
```

The variable of type Object does not store in itself an object but is only a reference to it. The initial value for this type of variables is Null.

#### Structures

The structure is essentially an object. If you look in the Basic IDE debugger, most (but not all) are the Object type. Some are not; for example, the structure of the Error has the type Error. But roughly speaking, the structures in LibreOffice Basic are simply grouped into one object variable, without special access methods. Another significant difference is that when declaring a variable of the Structure type, we must specify its name, rather than the Object. For example, if MyNewStructure is the name of a structure, the declaration of its variable will look like this:
```
Dim MyStructureVar As MyNewStructure
```

There are a lot of built-in structures, but the user can create personal ones. Structures can be convenient when we need to operate with sets of heterogeneous information that should be treated as a single whole. For example, to create a tPerson structure:
```
Type tPerson
  Name As String
  Age As Integer
  Weight As Double
End Type

```

The definition of the structure should go before subroutines and functions that use it.

To fill a structure, you can use, for example, the built-in structure com.sun.star.beans.PropertyValue:
```
Dim oProp As New com.sun.star.beans.PropertyValue
OProp.Name = "Age" 'Set the Name
OProp.Value = "Amy Boyer" 'Set the Property
```

For a simpler filling of the structure, you can use the **With** operator.
```
Dim oProp As New com.sun.star.beans.PropertyValue
With oProp
  .Name = "Age" 'Set the Name
  .Value = "Amy Boyer" 'Set the Property
End With
```

The initial value is only for each variable in the structure and corresponds to the type of the variable.

#### Variant

This is a virtual type of variables. The Variant type is automatically selected for the data to be operated on. The only problem is that the interpreter does not need to save our resources, and it does not offer the most optimal variants of variable types. For example, it does not know that 1 can be written in Byte, and 100000 in Long Integer, although it reproduces a type if the value is passed from another variable with the declared type. Also, the transformation itself is quite resource-intensive. Therefore, this type of variable is the slowest of all. If you need to declare this kind of variable, you can use the **Variant** keyword. But you can omit the type description altogether; the Variant type will be assigned automatically. There is no a type-declaration sign for this type.
```
Dim MyVariantVar
Dim MyVariantVar As Variant
```

For an implicit declaration, you can use the **DefVar** statement. For example:
```
DefVar v 'variables starting with v have the Variant type by default
```

This variables type is assigned by default to all undeclared variables.

#### Arrays

Arrays are a special type of variable in the form of a data set, reminiscent of a mathematical matrix, except that the data can be of different types and allow one to access its elements by index (element number). Of course, a one-dimensional array will be similar to a column or row, and a two-dimensional array will be like a table. There is one feature of arrays in LibreOffice Basic that distinguishes it from other programming languages. Since we have an abstract type of variant, then the elements of the array do not need to be homogeneous. That is, if there is an array MyArray and it has three elements numbered from 0 to 2, and we write the name in the first element of MyArray(0), the age in the second MyArray(1), and the weight in the third MyArray(2), we can have, respectively, the following type values: String for MyArray(0), Integer for MyArray(1), and Double for MyArray(2). In this case, the array will resemble a structure with the ability to access the element by its index. Array elements can also be homogeneous: Other arrays, objects, structures, strings, or any other data type can be used in LibreOffice Basic.

Arrays must be declared before they are used. Although the index space can be in the range of type Integer—from -32768 to 32767—by default, the initial index is selected as 0. You can declare an array in several ways:

| Dim MyArrayVar(5) as string       | 	String array with 6 elements from 0 to 5                                                |
| Dim MyArrayVar$(5) 	           | Same as the previous                                                                        |
| Dim MyArrayVar(1 To 5) as string  | 	String array with 5 elements from 1 to 5                                                |
| Dim MyArrayVar(5,5) as string     | 	Two-dimensional array of rows with 36 elements with indexes in each level from 0 to 5   |
| Dim MyArrayVar$(-4 To 5, -4 To 5) | 	Two-dimensional strings array with 100 elements with indexes in each level from -4 to 5 |
| Dim MyArrayVar()                  | 	Empty array of the Variant type                                                         |

You can change the lower bound of an array (the index of the first element of the array) by default using the **Option Base** statement; that must be specified before using subprograms, functions, and defining user structures. Option Base can take only two values, 0 or 1, which must follow immediately after the keywords. The action applies only to the current module.

### Learn more

If you are just starting out in programming, Wikipedia provides general information about the [array][2], structure, and many other topics.

For a more in-depth study of LibreOffice Basic, [Andrew Pitonyak's][3] website is a top resource, as is the [Basic Programmer's guide][4]. You can also use the LibreOffice [online help][1]. Completed popular macros can be found in the [Macros][5] section of The Document Foundation's wiki, where you can also find additional links on the topic.

For more tips, or to ask questions, visit [Ask LibreOffice][6] and [OpenOffice forum][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/variables-data-types-libreoffice-basic

作者：[Lera Goncharuk][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tagezi
[1]:https://helponline.libreoffice.org/latest/en-US/text/sbasic/shared/main0601.html?DbPAR=BASIC
[2]:https://en.wikipedia.org/wiki/Array_data_structure
[3]:http://www.pitonyak.org/book/
[4]:https://wiki.documentfoundation.org/images/d/dd/BasicGuide_OOo3.2.0.odt
[5]:https://wiki.documentfoundation.org/Macros
[6]:https://ask.libreoffice.org/en/questions/scope:all/sort:activity-desc/tags:basic/page:1/
[7]:https://forum.openoffice.org/en/forum/viewforum.php?f=20&sid=74f5894a7d7942953cd99d978d54e75b
