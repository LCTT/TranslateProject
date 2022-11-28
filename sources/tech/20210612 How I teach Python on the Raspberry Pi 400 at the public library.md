[#]: subject: (How I teach Python on the Raspberry Pi 400 at the public library)
[#]: via: (https://opensource.com/article/21/6/teach-python-raspberry-pi)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I teach Python on the Raspberry Pi 400 at the public library
======
After a long year of putting plans on hold, declining COVID case numbers
are bringing back community-based programming courses.
![Women programming][1]

After a long and tough year, I've been looking forward to once again sharing my love of Python and open source software with other people, especially middle and high school students. Before the pandemic, I co-wrote a grant to teach Python programming to middle school students using Raspberry Pi computers. Like many other plans, COVID-19 put mine on hold for over a year. Fortunately, vaccines and the improved health in my state, New York, have changed the dynamic.

A couple of months ago, once I became fully vaccinated, I offered to self-fund a Raspberry Pi and Python programming course in our local public library system. The [Chautauqua-Cattaraugus Library system][2] accepted my proposal, and the co-central library in Olean, N.Y., offered to fund my program. The library purchased five [Raspberry Pi 400][3] units, Micro-HDMI-to-VGA adapters, and inline power adapters, and the library system's IT department loaned us five VGA monitors.

With all our equipment needs met, we invited middle school students to enroll for four afternoons of learning and programming fun.

All the students were socially distanced, each with a new Pi 400 and VGA monitor at their desk. Our class was small, made up of a fourth-grade student and two sixth-grade students. None had a programming background, and their keyboarding skills were rough. However, their innate curiosity and enthusiasm carried the day.

### Learning and iterating

We spent the first afternoon assembling the Pi 400s, connecting them to the library's wireless network, and installing the [Mu Python editor][4], which we used for the class.

![Raspberry Pi 400 equipment][5]

(Don Watkins, [CC BY-SA 4.0][6])

I followed this with a brief introduction to Raspberry Pi OS and how it differs from Windows and macOS computers and offered a brief tutorial on using the Mu editor.

Since we were meeting in a public library, I emphasized that the library has books covering the concepts and Python programming code used in the class, especially [_Teach Your Kids to Code_][7] by Dr. Bryson Payne and [_Python for Kids_][8] by Jason Briggs. I created daily handouts for the students to refer to alongside the instruction. I also used my own Raspberry PI 400 connected to a 32" LCD monitor to illustrate the code and programming results.

![Raspberry Pi 400 setup][9]

(Don Watkins, [CC BY-SA 4.0][6])

I like to use the [turtle module to introduce Python][10] programming. It's always been well received, and the students love the graphics they can create while learning Python basics like variables, [`for` loops][11], lists, and the importance of syntax.

I learn something new every time I teach, and this was no exception. I especially enjoy watching students iterate on my code examples—some are from books, and others are my own creations. The fourth-grader in our class took this example code and added two more colors and corresponding code to create a six-color spiral.


```
# multicolor spiral
import turtle as t
colors = ["red", "yellow", "blue", "green"]
for x in range(100):
    t.pencolor(colors[x%4])
    t.circle(x)
    t.left(91)
```

![Spiral graphic created in Python][12]

(Don Watkins, [CC BY-SA 4.0][6])

At the end of the four-day course, each student received a Raspberry Pi 400 and a book explaining how to program their computer. They also got a list of free and open source software resources, a reading list of recommended books available in the library, and some open educational resources available on the web.

### Open learning

Mark Van Doren said, "the art of teaching is the art of assisting discovery." I saw that play out in this classroom using open source tools. More students need opportunities like this to help them gain a quality education. The Raspberry Pi 400 is a great form factor for teaching and learning.

The [Olean Library][13] plans to offer another similar course later this year. I encourage you to share your love of free and open source software with your own communities.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/teach-python-raspberry-pi

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G (Women programming)
[2]: https://www.cclsny.org/
[3]: https://opensource.com/article/21/3/raspberry-pi-400-review
[4]: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners
[5]: https://opensource.com/sites/default/files/uploads/pi400_library.jpg (Raspberry Pi 400 equipment)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/education/15/9/review-bryson-payne-teach-your-kids-code
[8]: https://nostarch.com/pythonforkids
[9]: https://opensource.com/sites/default/files/uploads/pi400_library-teacher.jpg (Raspberry Pi 400 setup)
[10]: https://opensource.com/article/17/10/python-101#turtle
[11]: https://opensource.com/article/18/3/loop-better-deeper-look-iteration-python
[12]: https://opensource.com/sites/default/files/uploads/pi400-spiral.jpg (Spiral graphic created in Python)
[13]: https://www.oleanlibrary.org/
