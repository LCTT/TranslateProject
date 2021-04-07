[#]: subject: (Teach anyone how to code with Hedy)
[#]: via: (https://opensource.com/article/21/4/hedy-teach-code)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Teach anyone how to code with Hedy
======
Hedy is a new programming language designed specifically for teaching
people to code.
![Teacher or learner?][1]

Learning to code involves learning both the programming logic and the syntax of a specific programming language. When I took my first programming class in college, the language taught was C++. The first code example, the basic "Hello World" program, looked like the example below.


```
#include &lt;iostream&gt;

int main() {
    std::cout &lt;&lt; "Hello World!";
    return 0;
}
```

The instructor would not explain most of the code until several lessons later. The expectation was that we would just type in the code and eventually learn why things were required and how they worked.

The complex syntax of C++ (and other, similar languages) is why Python is often suggested as an easier language for teaching programming. Here is the same example in Python:


```
`print("Hello World!")`
```

While the basic "Hello World" example in Python is much simpler, it still has complex and precise syntax rules. The `print` function requires parentheses and quotes around the string. This can still confuse those who have no experience with programming. Python has fewer "I'll explain later" syntax issues than C++, but it still has them.

[Hedy][2], a new language designed specifically for teaching coding, addresses the issue of syntax complexity by building multiple levels of complexity into the language. Instead of providing the full features of the language right away, Hedy takes a gradual approach and slowly becomes more complex as students work through Hedy's levels. As the levels progress, the language gains new features and eventually becomes more Python-like. There are currently seven levels available, but more are planned.

At level 1, a Hedy program cannot do anything except print a statement (which does not require quotes or parentheses), ask a question, and echo back an answer. Level 1 has no variables, no loops, and minimal structure. Echo works almost like a variable but only for the last user input. This allows students to become comfortable with basic concepts without having to learn everything all at once.

This is a level 1 Hedy "Hello World" program:


```
`print Hello World`
```

Level 2 introduces variables, but because the `print` function does not use quotes, there can be some interesting outcomes. If the variable used to store a person's name is `name`, it is impossible to print the output "Your name is [name]" because both the first use of name, which is intended to be a string, and the second use, which is a variable, are both interpreted as a variable. If `name` is set to `John Doe`, the output of `print Your name is name.` would be "Your John Doe is John Doe." As odd as this sounds, it is a good way for to introduce the concept of variables, which just happens to be a feature added in Level 3.

Level 3 requires quotation marks around strings, which makes variables function like they do in Python. It is now possible to output strings combined with variables to make complex statements without worrying about conflicts between variable names and words in a string. This level does away with the `echo` function, which does seem like something that might frustrate some learners. They should be using variables, which is better code, but it could be confusing if an `ask`/`echo` block of code becomes invalid syntax.

Level 4 adds basic `if`/`else` functionality. Students can move from simple ask/answer code to complex interactions. For example, a prompt that asks, "What is your favorite color?" can accept different replies depending on what the user enters. If they enter green, the reply can be "Green! That's also my favorite color." If they enter anything else, the reply could be different. The `if`/`else` block is a basic programming concept, which Hedy introduces without having to worry about complex syntax or overly precise formatting.

Level 5 has a `repeat` function, which adds a basic loop to the features available. This loop can only repeat the same command multiple times, so it is not as powerful as loops in Python, but it lets the students get used to the general concept of repeating commands. It's one more programming concept introduced without bogging things down with needless complexity. The students can grasp the basics of the concept before moving on to more powerful, complex versions of the same thing.

At level 6, Hedy can now do basic math calculations. Addition, subtraction, multiplication, and division are supported, but more advanced math features are not. It is not possible to use exponents, modulo, or anything else that Python and other languages handle. As yet, no higher level of Hedy adds more complex math.

Level 7 brings in Python-style indenting, which means `repeat` can work with multiple lines of code. Students worked with code line by line up to this point, but now they can work with blocks of code. This Hedy level still falls way short of what a non-teaching programming language can do, but it can teach students a lot.

The easiest way to get started with Hedy is to access the [lessons][3] on the Hedy website, which is currently available in Dutch, English, French, German, Portuguese, and Spanish. This makes the learning process accessible to anyone with a web browser. It is also possible to download Hedy from [GitHub][4] and run the interpreter from the command line or run a local copy of the Hedy website with its interactive lessons. The web-based version is more approachable, but both the web and command-line versions support running Hedy programs targeted at its various levels of complexity.

Hedy will never compete with Python, C++, or other languages as the language of choice for coding for real-world projects, but it is an excellent way to teach coding. The programs students write as part of the learning process are real and possibly even complex. Hedy can foster learning and creativity without confusing students with too much information too soon in the learning process. Like math classes, which start with counting, adding, etc., long before getting to calculus (a process that takes years), programming does not have to start with "I'll explain later" for programming language syntax issues that must be followed precisely to produce even the most basic program in the language.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/hedy-teach-code

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/5538035618_4e19c9787c_o.png?itok=naiD1z1S (Teacher or learner?)
[2]: https://www.hedycode.com/
[3]: https://www.hedycode.com/hedy?lang=en
[4]: https://github.com/felienne/hedy
