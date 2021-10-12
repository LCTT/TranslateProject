[#]: subject: "It's Ada Lovelace Day! Learn the Ada programming language in 2021"
[#]: via: "https://opensource.com/article/21/10/learn-ada-2021"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

It's Ada Lovelace Day! Learn the Ada programming language in 2021
======
For specialized hardware or just for fun, Ada is a highly readable
language worth learning.
![Women programming][1]

In the 1970s, many programming languages were hyperspecific to the hardware they controlled. As a result, developers had to learn to code differently depending on the hardware they were programming. Debugging and maintenance were highly specialized, and code wasn't reusable across machines.

The UK government recognized these problems and moved toward establishing a standardized multipurpose programming language. On December 10, 1980—Ada Lovelace's birthday—they made the Ada programming language an official military standard in the UK.

Ada is similar in some ways to [Algol][2] or Pascal. It was originally designed for program reliability, easy maintenance, and efficiency. Most importantly, however, Ada's creators recognized that coding is a human activity, so a programming language must be something that humans can easily read and interact with.

For Ada, readability is more important than conciseness. Writing code in Ada produces highly readable code, even compared to Python, and although its usage tends to be specialized, Ada is still being developed today.

### Installing Ada

The toolchain for Ada is the GNU Ada Development Environment, better known as GNAT.

You can install GNAT on Linux using your distribution's package manager. On Fedora, CentOS, or similar:


```
`$ sudo dnf install gcc-gnat`
```

On Debian, Linux Mint, and derivatives:


```
$ sudo apt install gnat
```

On macOS and Windows, you can download an installer from the [Adacore website][3] (choose your platform from the drop-down menu).

### Program units

Ada code is made up of _program units_. There are many different types of program units, but the ones you spend the most time with when coding are _subprograms_. A subprogram is an algorithm. In Ada, a subprogram can be a _procedure_ or a _function_. A procedure has no return value, while a function does.

### How to write a procedure in Ada

Create a file in a text editor and enter this simple Ada code:


```
with Ada.Text_IO; use Ada.Text_IO;

procedure hello is
begin
  Put_Line ("Happy Ada Lovelace day.");
end hello;
```

Save the file as `hello.adb.`

The first line uses the keyword `with`, which is similar to the `import` or `include` statement in other languages. This enables the program to use the `test_io` Ada library.

The next line defines a procedure, which is a nicely intuitive Ada term for a self-contained algorithm. A procedure is named and then delimited by the keywords `begin` and `end.`

To run this example program, run `gnatmake.`


```
$ gnatmake hello.adb
gcc -c hello.adb
gnatbind -x hello.ali
gnatlink hello.ali
```

The executable application is placed into your current directory, bearing the name of the procedure. Run it to see the result.


```
$ ./hello
Happy Ada Lovelace day.
```

### Variables

Ada is a strongly typed language, which means that when you create a variable, you must declare what kind of data it can contain. You must declare a variable before you can use it.


```
with ada.Text_IO;
use Ada.Text_IO;

procedure Main is
  myString: String := "Hello world";
begin
  Put_Line ( myString );
end Main;
```

If you don't know the contents of a variable when you declare it, you can declare it and set its contents later.


```
procedure Main is
  myNumber: Integer;
begin
  myNumber := 123;
end Main;
```

If you're used to dynamically typed languages, such as Python, that try to adapt the way it treats data based on what data it finds in a variable, then a strongly typed language like Ada can have some frustrating surprises for you.

For instance, trying to print an integer with `Put_Line` fails because `Put_Line` expects a string. When you have data of one type that you want to treat as a different type, you must perform type conversion. In Ada, conversion from one type to a string type is done with the `'Image` attribute.


```
with ada.Text_IO;
use Ada.Text_IO;

procedure Main is
  myNumber: Integer;
begin
  myNumber := 123;
  Put_Line ( Integer'Image (myNumber) );
end Main;
```

There are several [different kinds of conversions available][4], and what you use depends on what kind of data you need for a given task.

### Loops

All the usual flow control mechanisms are present in Ada. There are if/else statements, case statements, while loops, for loops, and so on.

The while loop is similar to a while loop in other languages, and it can be controlled using the same tricks. For instance, it is common to create a variable set to 0, increment that variable once per iteration of the loop, then run the loop only _while_ that variable is less than a specific value.


```
with ada.Text_IO; use Ada.Text_IO;

procedure Main is
   myString: String := "Hello";
   myCount: Integer := 0;

begin
\-- while loop
   while myCount &lt; 3 loop
      Put_Line ( myString );
      myCount := myCount + 1;
   end loop;
end Main;
```

This outputs:


```
$ ./main
Hello
Hello
Hello
```

A for-loop uses a temporary variable (`I` in this example) to store data from an array or range the loop iterates over. There's no need to increment because that's implicit with a for loop.


```
with ada.Text_IO;
use Ada.Text_IO;

procedure Main is
begin
  for I in 0 .. 3 loop
    Put_Line (Integer'Image (I));
  end loop;
end Main;
```

This outputs:


```
$ ./main
0
1
2
3
```

### How to write a function in Ada

Ada is designed with modularity in mind, so it's easy to write small code fragments and then string them together into a larger application. A function consists of a declaration and a definition.

Open a file in your favorite text editor and add this declaration:


```
function Double_Integer (I : Integer) return Integer is
```

You've declared a function by giving it a name (`Double_Integer`), by specifying an argument (an integer called `I`), and by listing its return type (an integer). Now you must define what the function does. A function definition is a subprogram, just like a procedure, except that it returns a value.

Add this simple code to the file:


```
begin
    return I + I;
end Double_Integer;
```

Save this file as `double_integer.adb.`

To use your function, you must include it in your application using the `with` keyword. Open a new file called `main.adb`, and include your custom function.


```
with ada.Text_IO;
use Ada.Text_IO;
with Double_Integer;
```

In Ada, a function cannot be called as a stand-alone statement. You call a function by assigning its output to a variable.

In this block of code, the `myResult` variable receives the results of the `Double_Integer` function.


```
procedure Main is
   myResult: Integer := 0;
   
begin
   myResult := Double_Integer (9);
   Put_Line (Integer'Image (myResult));
end Main;
```

Save this file, and then compile it.


```
$ gnatmake main.adb
```

GNAT discovers `double_integer.adb` and includes it automatically, and your application is compiled. The value to double is hard-coded into the application, so run it to see the result.


```
$ ./main
 18
```

### Command-line arguments

The GNAT toolchain doesn't just provide a compiler. It also provides some useful libraries you can use in your Ada code. An especially nice library is the `GNAT.Command_Line` function, which allows your Ada programs to accept [options and arguments.][5]

Here's a simple example:


```
with GNAT.Command_Line; use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
  loop
    case Getopt ("a b:") is
      when 'a' =&gt;
        Put_Line ("Got a Boolean");
      when 'b' =&gt;
        Put_Line ("Got an argument: " &amp; Parameter);
      when others =&gt;
        exit;
    end case;
  end loop;
Put_Line ("File argument was " &amp; Get_Argument);
end Main;
```

As you can tell from reading the code, parsing the options is very much a manual process in Ada.

The `Parameter` and `Get_Argument` variables are provided by the `GNAT.Command_Line` function, and the rest is just a matter of using loops to iterate over the command-line arguments passed to the command.

Running the code produces this output:


```
$ ./main -a -b foo file.txt
Got a Boolean
Got an argument: foo
File argument was file.txt
```

### Dice-roller demo

These are just the basics of a complex language, but to demonstrate how it all comes together, here's a simple dice-rolling application.

First, create a function that returns a random number. This uses the `Ada.Numerics.Discrete_Random` library, which has its peculiarities, but Ada's website has a simple demo and explanation. This function is very similar to the basic demonstration of the library on the Ada documentation site, except that it accepts an argument (the integer `I`) as the upper limit of the random range.

Create a file called `random_number.adb` with this code in it:


```
with Ada.Numerics.Discrete_Random;

function Random_Number (I : Integer) return Integer is
  subtype Random_Range is Integer range 1 .. I;

  package R is new Ada.Numerics.Discrete_Random (Random_Range);
  use R;

   G : Generator;
   X : Random_Range;

begin
   Reset (G);
   X := Random (G);
   return X;
end Random_Number;
```

Next, create the application itself, which accepts a number to determine how many sides there are on the virtual dice you want to roll, then calls the random number function, passing along the integer provided by the user.

It prints the results of the roll to the terminal.


```
with GNAT.Command_Line; use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Random_Number;

procedure Main is
   ROLL: Integer;
   
begin
  loop
    case Getopt ("d:") is
       when 'd' =&gt;
          -- random number
          ROLL := Random_Number(Integer'Value(Parameter));
         
          Put_Line ("You roll: " &amp; Integer'Image(ROLL));
      when others =&gt;
        exit;
    end case;
  end loop;
end Main;
```

Compile it,


```
$ gnatmake main.adb
```

and test it out.


```
$ ./main -d 20
14
$ ./main -d 20
3
$ ./main -d 4
2
$ ./main -d 6
5
```

Looks good!

### Learning Ada

Ada is a unique and highly structured language, with a dedicated developer base, especially in the [embedded space.][6]

Whether you can imagine using Ada as a language for specialized hardware, you're interested in languages similar to Algol and Pascal, or you want a fun experiment, you can explore the wild world of this language on the [Awesome Ada][7] Github page.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/learn-ada-2021

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G (Women programming)
[2]: https://opensource.com/article/20/6/algol68
[3]: https://www.adacore.com/download/more
[4]: https://learn.adacore.com/courses/intro-to-ada/chapters/more_about_types.html#
[5]: https://opensource.com/article/21/8/linux-terminal
[6]: https://opensource.com/article/21/3/rtos-embedded-development
[7]: https://github.com/ohenley/awesome-ada
