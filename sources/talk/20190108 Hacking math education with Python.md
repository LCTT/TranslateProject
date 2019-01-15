[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hacking math education with Python)
[#]: via: (https://opensource.com/article/19/1/hacking-math)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Hacking math education with Python
======
Teacher, programmer, and author Peter Farrell explains why teaching math with Python works better than the traditional approach.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl)

Mathematics instruction has a bad reputation, especially with people (like me) who've had trouble with the traditional approach, which emphasizes rote memorization and theory that seems far removed from students' real world.

While teaching a student who was baffled by his math lessons, [Peter Farrell][1], a Python developer and mathematics teacher, decided to try using Python to teach the boy the math concepts he was having trouble learning.

Peter was inspired by the work of [Seymour Papert][2], the father of the Logo programming language, which lives on in Python's [Turtle module][3]. The Turtle metaphor hooked Peter on Python and using it to teach math, much like [I was drawn to Python][4].

Peter shares his approach in his new book, [Math Adventures with Python][5]: An Illustrated Guide to Exploring Math with Code. And, I recently interviewed him to learn more about it.

**Don Watkins:** What is your background?

**Peter Farrell:** I was a math teacher for eight years, and I tutored math for 10 years after that. When I was a teacher, I read Papert's [Mindstorms][6] and was inspired to introduce all my math classes to Logo and Turtles.

**DW:** Why did you start using Python?

**PF:** I was working with a homeschooled boy on a very dry, textbook-driven math curriculum, which at the time seemed like a curse to me. But I found ways to sneak in the Logo Turtles, and he was a programming fan, so he liked that. Once we got into functions and real programming, he asked if we could continue in Python. I didn't know any Python but it didn't seem that different from Logo, so I agreed. And I never looked back!

I was also looking for a 3D graphics package I could use to model a solar system and lead students through making planets move and get pulled by the force of attraction between the bodies, according to Newton's formula. Many graphics packages required programming in C or something hard, but I found an excellent package called Visual Python that was very easy to use. I used [VPython][7] for years after that.

So, I was introduced to Python in the context of working with a student on math. For some time after that, he was my programming tutor while I was his math tutor!

**DW:** What got you interested in math?

**PF:** I learned it the old-fashioned way: by hand, on paper and blackboards. I was good at manipulating symbols, so algebra was never a problem, and I liked drawing and graphing, so geometry and trig could be fun, too. I did some programming in BASIC and Fortran in college, but it never inspired me. Later on, programming inspired me greatly! I'm still tickled by the way programming makes easy work of the laborious stuff you have to do in math class, freeing you up to do the more fun of exploring, graphing, tweaking, and discovering.

**DW:** What inspired you to consider your Python approach to math?

**PF:** When I was teaching the homeschooled student, I was amazed at what we could do by writing a simple function and then calling it a bunch of times with different values using a loop. That would take a half an hour by hand, but the computer spit it out instantly! Then we could look for patterns (which is what a math student should be doing), express the pattern as a function, and extend it further.

**DW:** How does your approach to teaching help students—especially those who struggle with math? How does it make math more relevant?

**PF:** Students, especially high-schoolers, question the need to be doing all this calculating, graphing, and solving by hand in the 21st century, and I don't disagree with them. Learning to use Excel, for example, to crunch numbers should be seen as a basic necessity to work in an office. Learning to code, in any language, is becoming a very valuable skill to companies. So, there's a real-world appeal to me.

But the idea of making art with code can revolutionize math class. Just putting a shape on a screen requires math—the position (x-y coordinates), the dimensions, and even the color are all numbers. If you want something to move or change, you'll need to use variables, and not the "guess what x equals" kind of variable. You'll vary the position using a variable or, more efficiently, using a vector. [This makes] math topics like vectors and matrices seen as helpful tools you can use, rather than required information you'll never use.

Students who struggle with math might just be turned off to "school math," which is heavy on memorization and following rules and light on creativity and real applications. They might find they're actually good at math, just not the way it was taught in school. I've had parents see the cool graphics their kids have created with code and say, "I never knew that's what sines and cosines were used for!"

**DW:** How do you see your approach to math and programming encouraging STEM in schools?

**PF:** I love the idea of combining previously separated topics into an idea like STEM or STEAM! Unfortunately for us math folks, the "M" is very often neglected. I see lots of fun projects being done in STEM labs, even by very young children, and they're obviously getting an education in technology, engineering, and science. But I see precious little math material in the projects. STEM/[mechatronics][8] teacher extraordinaire Ken Hawthorn and I are creating projects to try to remedy that.

Hopefully, my book helps encourage students, girls and boys, to get creative with technology, real and virtual. There are a lot of beautiful graphics in the book, which I hope will inspire people to go through the coding adventure and make them. All the software I use ([Python Processing][9]) is available for free and can be easily installed, or is already installed, on the Raspberry Pi. Entry into the STEM world should not be cost-prohibitive to schools or individuals.

**DW:** What would you like to share with other math teachers?

**PF:** If the math establishment is really serious about teaching students the standards they have agreed upon, like numerical reasoning, logic, analysis, modeling, geometry, interpreting data, and so on, they're going to have to admit that coding can help with every single one of those goals. My approach was born, as I said before, from just trying to enrich a dry, traditional approach, and I think any teacher can do that. They just need somebody who can show them how to do everything they're already doing, just using code to automate the laborious stuff.

My graphics-heavy approach is made possible by the availability of free graphics software. Folks might need to be shown where to find these packages and how to get started. But a math teacher can soon be leading students through solving problems using 21st-century technology and visualizing progress or results and finding more patterns to pursue.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/hacking-math

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://twitter.com/hackingmath
[2]: https://en.wikipedia.org/wiki/Seymour_Papert
[3]: https://en.wikipedia.org/wiki/Turtle_graphics
[4]: https://opensource.com/life/15/8/python-turtle-graphics
[5]: https://nostarch.com/mathadventures
[6]: https://en.wikipedia.org/wiki/Mindstorms_(book)
[7]: http://vpython.org/
[8]: https://en.wikipedia.org/wiki/Mechatronics
[9]: https://processing.org/
