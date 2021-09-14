[#]: subject: "How I rediscovered Logo with the Python Turtle module"
[#]: via: "https://opensource.com/article/21/9/logo-python-turtle"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I rediscovered Logo with the Python Turtle module
======
The Logo programming language is available today as a Python package.
![Box turtle][1]

When I was in high school, one of the very first programming languages I was introduced to was Logo. It was interactive and visual. With basic movement commands, you could have your cursor (“turtle”) draw basic shapes and intricate patterns. It was a great way to introduce the compelling concept of an algorithm—a series of instructions for a computer to execute.

Fortunately, the Logo programming language is available today as a Python package. So let’s jump right in, and you can discover the possibilities with Logo as we go along.

### Installing the Turtle module

Logo is available as the [`turtle` package for Python][2]. To use it, you must have Python installed first. Python is already installed on Linux and BSD, and it's easy to install on both [MacOS][3] and [Windows][4].

Once you have Python installed, install the Turtle module:


```
`pip3 install turtle`
```

### Bob draws a square

With the `turtle` package installed, you can draw some basic shapes.

To draw a square, imagine a turtle (call him Bob) in the middle of your screen, holding a pen with his tail. Every time Bob moves, he draws a line behind him. How must Bob move to draw a square?

  1. Move forward 100 steps.
  2. Turn right 90 degrees.
  3. Move forward 100 steps.
  4. Turn right 90 degrees.
  5. Move forward 100 steps.
  6. Turn right 90 degrees.
  7. Move forward 100 steps.



Now write the above algorithm in Python. Create a file called `logo.py` and place the following code in it.


```
import turtle

if __name__ == '__main__':

    turtle.title('Hi! I\'m Bob the turtle!')
    turtle.setup(width=800, height=800)

    bob = turtle.Turtle(shape='turtle')
    bob.color('orange')

    # Drawing a square
    bob.forward(100)
    bob.right(90)
    bob.forward(100)
    bob.right(90)
    bob.forward(100)
    bob.right(90)
    bob.forward(100)

    turtle.exitonclick()
```

Save the above as `logo.py` and run it:


```
`$ python3 logo.py`
```

Bob draws a square on the screen:

![Logo drawn square][5]

Illustration by Ayush Sharma, [CC BY-SA 4.0][6]

### Bob draws a hexagon

To draw a hexagon, Bob must move like this:

  1. Move forward 150 steps.
  2. Turn right 60 degrees.
  3. Move forward 150 steps.
  4. Turn right 60 degrees.
  5. Move forward 150 steps.
  6. Turn right 60 degrees.
  7. Move forward 150 steps.
  8. Turn right 60 degrees.
  9. Move forward 150 steps.
  10. Turn right 60 degrees.
  11. Move forward 150 steps.



In Python, you can use a [`for` loop][7] to move Bob:


```
import turtle

if __name__ == '__main__':

    turtle.title('Hi! I\'m Bob the turtle!')
    turtle.setup(width=800, height=800)

    bob = turtle.Turtle(shape='turtle')
    bob.color('orange')

    # Drawing a hexagon
    for i in range(6):

        bob.forward(150)
        bob.right(60)

    turtle.exitonclick()
```

Run your code again and watch Bob draw a hexagon.

![Logo drawn hexagon][8]

Illustration by Ayush Sharma, [CC BY-SA 4.0][6]

### Bob draws a square spiral

Now try drawing a square spiral, but this time you can speed things up a bit. You can use the `speed` function and set `bob.speed(2000)` so that Bob moves faster.


```
import turtle

if __name__ == '__main__':

    turtle.title('Hi! I\'m Bob the turtle!')
    turtle.setup(width=800, height=800)

    bob = turtle.Turtle(shape='turtle')
    bob.color('orange')

    # Drawing a square spiral
    bob.speed(2000)
    for i in range(500):

        bob.forward(i)
        bob.left(91)

    turtle.exitonclick()
```

![Logo drawn spiral][9]

Illustration by Ayush Sharma, [CC BY-SA 4.0][6]

### Bob and Larry draw a weird snake thing

In the above examples, you initialized `Bob` as an object of the `Turtle` class. You're not limited to just one turtle, though. In the next code block, create a second turtle called `Larry` to draw along with Bob.

The `penup()` function makes the turtles lift their pens, so they don’t draw anything as they move, and the `stamp()` function places a marker whenever it’s called.


```
import turtle

if __name__ == '__main__':

    turtle.title('Hi! We\'re Bob and Larry!')
    turtle.setup(width=800, height=800)

    bob = turtle.Turtle(shape='turtle')
    larry = turtle.Turtle(shape='turtle')
    bob.color('orange')
    larry.color('purple')

    bob.penup()
    larry.penup()
    bob.goto(-180, 200)
    larry.goto(-150, 200)
    for i in range(30, -30, -1):

        bob.stamp()
        larry.stamp()
        bob.right(i)
        larry.right(i)
        bob.forward(20)
        larry.forward(20)

    turtle.exitonclick()
```

![Logo drawn snake][10]

Illustration by Ayush Sharma, [CC BY-SA 4.0][6]

### Bob draws a sunburst

Bob can also draw simple lines and fill them in with color. The functions `begin_fill()` and `end_fill()` allow Bob to fill a shape with the color set with `fillcolor()`.


```
import turtle

if __name__ == '__main__':

    turtle.title('Hi! I\'m Bob the turtle!')
    turtle.setup(width=800, height=800)

    bob = turtle.Turtle(shape='turtle')
    bob.color('orange')

    # Drawing a filled star thingy
    bob.speed(2000)
    bob.fillcolor('yellow')
    bob.pencolor('red')

    for i in range(200):

        bob.begin_fill()
        bob.forward(300 - i)
        bob.left(170)
        bob.forward(300 - i)
        bob.end_fill()

    turtle.exitonclick()
```

![Logo drawn sunburst][11]

Illustration by Ayush Sharma, [CC BY-SA 4.0][6]

### Larry draws a Sierpinski triangle

Bob enjoys drawing simple geometrical shapes holding a pen with his tail as much as the next turtle, but what he enjoys most is drawing fractals.

One such shape is the [Sierpinski triangle][12], which is an equilateral triangle recursively subdivided into smaller equilateral triangles. It looks something like this:

![Logo drawn triangle][13]

Illustration by Ayush Sharma, [CC BY-SA 4.0][6]

To draw the Sierpinski triangle above, Bob has to work a bit harder:


```
import turtle

def get_mid_point(point_1: list, point_2: list):

    return ((point_1[0] + point_2[0]) / 2, (point_1[1] + point_2[1]) / 2)

def triangle(turtle: turtle, points, depth):

    turtle.penup()
    turtle.goto(points[0][0], points[0][1])

    turtle.pendown()
    turtle.goto(points[1][0], points[1][1])
    turtle.goto(points[2][0], points[2][1])
    turtle.goto(points[0][0], points[0][1])

    if depth &gt; 0:

        triangle(turtle, [points[0], get_mid_point(points[0], points[1]), get_mid_point(points[0], points[2])], depth-1)
        triangle(turtle, [points[1], get_mid_point(points[0], points[1]), get_mid_point(points[1], points[2])], depth-1)
        triangle(turtle, [points[2], get_mid_point(points[2], points[1]), get_mid_point(points[0], points[2])], depth-1)

if __name__ == '__main__':

    turtle.title('Hi! I\'m Bob the turtle!')
    turtle.setup(width=800, height=800)

    larry = turtle.Turtle(shape='turtle')
    larry.color('purple')

    points = [[-175, -125], [0, 175], [175, -125]]  # size of triangle

    triangle(larry, points, 5)

    turtle.exitonclick()
```

### Wrap up

The Logo programming language is a great way to teach basic programming concepts, such as how a computer can execute a set of commands. Also, because the library is now available in Python, it can be used to visualize complex ideas and concepts.

I hope Bob and Larry have been enjoyable and instructive.

Have fun, and happy coding.

* * *

_This article was originally published on the [author's personal blog][14] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/logo-python-turtle

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/patti-black-unsplash.jpg?itok=hS8wQNUg (Box turtle)
[2]: https://docs.python.org/3.7/library/turtle.html
[3]: https://opensource.com/article/19/5/python-3-default-mac
[4]: https://opensource.com/article/19/8/how-install-python-windows
[5]: https://opensource.com/sites/default/files/uploads/rediscovering-logo-python-turtle-square.jpg (Logo drawn square)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/18/3/loop-better-deeper-look-iteration-python
[8]: https://opensource.com/sites/default/files/uploads/rediscovering-logo-python-turtle-hexagon.jpg (Logo drawn hexagon)
[9]: https://opensource.com/sites/default/files/uploads/rediscovering-logo-python-turtle-square-spiral.jpg (Logo drawn spiral)
[10]: https://opensource.com/sites/default/files/uploads/rediscovering-logo-python-turtle-stamping-larry.jpg (Logo drawn snake)
[11]: https://opensource.com/sites/default/files/uploads/rediscovering-logo-python-turtle-sunburst.jpg (Logo drawn sunburst)
[12]: https://en.wikipedia.org/wiki/Sierpinski_triangle
[13]: https://opensource.com/sites/default/files/uploads/rediscovering-logo-python-turtle-sierpinski-triangle.jpg (Logo drawn triangle)
[14]: https://notes.ayushsharma.in/2019/06/rediscovering-logo-with-bob-the-turtle
