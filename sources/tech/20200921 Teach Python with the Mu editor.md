[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Teach Python with the Mu editor)
[#]: via: (https://opensource.com/article/20/9/teach-python-mu)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Teach Python with the Mu editor
======
Mu makes it easy to learn how to write Python code.
![Hands on a keyboard with a Python book ][1]

Teaching kids to code is very popular in schools. Many years ago, in the days of the Apple II and [Logo][2] programming, I learned about turtle graphics. I enjoyed learning how to program the virtual turtle and later helping students to do the same.

About five years ago, I learned about [Python's turtle module][3], and it was the segue to my Python journey. Soon, I started using the turtle module to teach students Python programming basics, including using it to create interesting graphics.

### Get started with Python's turtle module

On a Linux or macOS computer, you can just open a terminal, enter the word `python`, and you'll see the Python shell.

If you are using a Windows computer, you will need to install Python first by going to the Python website and [downloading][4] the latest stable version.

Next, import the turtle module into Python with `import turtle `or `import turtle as t`. Then you can start having some fun creating turtle graphics.

### Meet Mu

In the early days of my Python adventure, I used [IDLE][5], Python's integrated development environment. It was much easier than entering commands into the Python shell, plus I could write and save programs for later use. I took some online courses and read many excellent books about Python programming. I taught teachers and students how to create turtle graphics using IDLE.

IDLE was a big improvement, but at PyConUS 2019 in Cleveland, I saw a presentation by [Nicholas Tollervey][6] that changed the way I learned and taught Python. Nick is an educator who created [Mu][7], a Python editor specifically for young programmers (and even older ones like me). Mu can be installed on Linux, macOS, and Windows. It's easy to use and comes with excellent [documentation][8] and [tutorials][9].

On Linux, you can install Mu from the command line.

On Ubuntu or Debian:


```
`$ sudo apt install mu-editor`
```

On Fedora or similar:


```
`$ sudo dnf install mu`
```

Or, you can use Python to do the install. First, ensure you have Python 3 installed:


```
`$ python --version`
```

If that fails, try:


```
`$ python3 --version`
```

Assuming you have Python version 3 or better, install Mu using `pip`, the Python package manager:


```
`$ python -m pip install mu-editor --user`
```

Then you can run Mu from the command line or create a shortcut using:


```
`$ python -m pip install shortcut mu-editor --user`
```

Mu is installed by default on the [Raspberry Pi][10], which is a great plus. In the past couple of years, I have introduced students to the Raspberry Pi and Python programming using the Mu editor.

### How to teach Python with Mu

Mu is a great way to show students how easy it is to get started with Python. Here's how I teach my students to start using it.

  1. Open the Mu editor.

![Mu editor][11]

(Don Watkins, [CC BY-SA 4.0][12])

  2. Enter `import turtle` to import the Turtle module, so you can get the turtle moving. My first lesson is drawing a simple square in Python code.

![Mu editor][13]

(Don Watkins, [CC BY-SA 4.0][12])

  3. Save this program, making sure that the file name ends in .py.

![Saving program in Mu][14]

(Don Watkins, [CC BY-SA 4.0][12])

  4. Run the program. Running even a simple program like this is energizing—it's fun to see the graphical output of a program you wrote.

![Running Python program in Mu][15]

(Don Watkins, [CC BY-SA 4.0][12])




### Beyond the basics

After this simple lesson, I explain that there are some ways to simplify and expand on the basics the students have learned. One is creating a simpler turtle object, `import turtle as t`. Then I introduce a `for` loop as another way to draw a square with the turtle.

![for loops in Python with Mu][16]

(Don Watkins, [CC BY-SA 4.0][12])

Next, I show how to create a `my_square` function as another way to draw a square.

![my_square function][17]

(Don Watkins, [CC BY-SA 4.0][12])

Later, I expand on this concept by introducing other turtle module methods, including `penup`, `pendown`, and `pencolor`. Soon, my students are developing more complex programs and iterating on them.

![Mu editor][18]

(Don Watkins, [CC BY-SA 4.0][12])

I am always eager to learn, and I would love to know how you are teaching Python in school or at home. Please share your experience in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/teach-python-mu

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://en.wikipedia.org/wiki/Logo_(programming_language)
[3]: https://docs.python.org/3/library/turtle.html
[4]: https://www.python.org/downloads/windows/
[5]: https://docs.python.org/3/library/idle.html
[6]: https://ntoll.org/
[7]: https://codewith.mu/en/download
[8]: https://codewith.mu/en/howto/
[9]: https://codewith.mu/en/tutorials/
[10]: https://www.raspberrypi.org/blog/mu-python-ide/
[11]: https://opensource.com/sites/default/files/uploads/mu-1_open.png (Mu editor)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/mu-2_square.png (Mu editor)
[14]: https://opensource.com/sites/default/files/uploads/mu-3_save.png (Saving program in Mu)
[15]: https://opensource.com/sites/default/files/uploads/mu-4_run.png (Running Python program in Mu)
[16]: https://opensource.com/sites/default/files/uploads/mu-5_for-loop.png (for loops in Python with Mu)
[17]: https://opensource.com/sites/default/files/uploads/mu-6_my_square.png (my_square function)
[18]: https://opensource.com/sites/default/files/uploads/mu-7_beyond-basics.png (Mu editor)
