How learning data structures and algorithms make you a better developer
================================================================================

> "I'm a huge proponent of designing your code around the data, rather than the other way around, and I think it's one of the reasons git has been fairly successful […] I will, in fact, claim that the difference between a bad programmer and a good one is whether he considers his code or his data structures more important." 
-- Linus Torvalds

---

> "Smart data structures and dumb code works a lot better than the    other way around." 
-- Eric S. Raymond, The Cathedral and The Bazaar

Learning about data structures and algorithms makes you a stonking good programmer.

**Data structures and algorithms are patterns for solving problems.** The more of them you have in your utility belt, the greater variety of problems you'll be able to solve. You'll also be able to come up with more elegant solutions to new problems than you would otherwise be able to.

You'll understand, ***in depth***, how your computer gets things done. This informs any technical decisions you make, regardless of whether or not you're using a given algorithm directly. Everything from memory allocation in the depths of your operating system, to the inner workings of your RDBMS to how your networking stack manages to send data from one corner of Earth to another. All computers rely on fundamental data structures and algorithms, so understanding them better makes you understand the computer better.

Cultivate a broad and deep knowledge of algorithms and you'll have stock solutions to large classes of problems. Problem spaces that you had difficulty modelling before often slot neatly into well-worn data structures that elegantly handle the known use-cases. Dive deep into the implementation of even the most basic data structures and you'll start seeing applications for them in your day-to-day programming tasks.

You'll also be able to come up with novel solutions to the somewhat fruitier problems you're faced with. Data structures and algorithms have the habit of proving themselves useful in situations that they weren't originally intended for, and the only way you'll discover these on your own is by having a deep and intuitive knowledge of at least the basics.

But enough with the theory, have a look at some examples

###Figuring out the fastest way to get somewhere###
Let's say we're creating software to figure out the shortest distance from one international airport to another. Assume we're constrained to following routes:

![](http://www.happybearsoftware.com/assets/posts/how-learning-data-structures-and-algorithms-makes-you-a-better-developer/airport-graph-d2e32b3344b708383e405d67a80c29ea.svg)

graph of destinations and the distances between them, how can we find the shortest distance say, from Helsinki to London? **Dijkstra's algorithm** is the algorithm that will definitely get us the right answer in the shortest time.

In all likelihood, if you ever came across this problem and knew that Dijkstra's algorithm was the solution, you'd probably never have to implement it from scratch. Just ***knowing*** about it would point you to a library implementation that solves the problem for you.

If you did dive deep into the implementation, you'd be working through one of the most important graph algorithms we know of. You'd know that in practice it's a little resource intensive so an extension called A* is often used in it's place. It gets used everywhere from robot guidance to routing TCP packets to GPS pathfinding.

###Figuring out the order to do things in###
Let's say you're trying to model courses on a new Massive Open Online Courses platform (like Udemy or Khan Academy). Some of the courses depend on each other. For example, a user has to have taken Calculus before she's eligible for the course on Newtonian Mechanics. Courses can have multiple dependencies. Here's are some examples of what that might look like written out in YAML:

    # Mapping from course name to requirements
    #
    # If you're a physcist or a mathematicisn and you're reading this, sincere
    # apologies for the completely made-up dependency tree :)
    courses:
      arithmetic:         []
      algebra:            [arithmetic]
      trigonometry:       [algebra]
      calculus:           [algebra, trigonometry]
      geometry:           [algebra]
      mechanics:          [calculus, trigonometry]
      atomic_physics:     [mechanics, calculus]
      electromagnetism:   [calculus, atomic_physics]
      radioactivity:      [algebra, atomic_physics]
      astrophysics:       [radioactivity, calculus]
      quantumn_mechanics: [atomic_physics, radioactivity, calculus]

Given those dependencies, as a user, I want to be able to pick any course and have the system give me an ordered list of courses that I would have to take to be eligible. So if I picked `calculus`, I'd want the system to return the list:

    arithmetic -> algebra -> trigonometry -> calculus

Two important constraints on this that may not be self-evident:

 - At every stage in the course list, the dependencies of the next course must be met.
 - We don't want any duplicate courses in the list.

This is an example of resolving dependencies and the algorithm we're looking for to solve this problem is called topological sort (tsort). Tsort works on a dependency graph like we've outlined in the YAML above. Here's what that would look like in a graph (where each arrow means `requires`):

![](http://www.happybearsoftware.com/assets/posts/how-learning-data-structures-and-algorithms-makes-you-a-better-developer/course-graph-2f60f42bb0dc95319954ce34c02705a2.svg)

topological sort does is take a graph like the one above and find an ordering in which all the dependencies are met at each stage. So if we took a sub-graph that only contained `radioactivity` and it's dependencies, then ran tsort on it, we might get the following ordering:

    arithmetic
    algebra
    trigonometry
    calculus
    mechanics
    atomic_physics
    radioactivity
    
This meets the requirements set out by the use case we described above. A user just has to pick `radioactivity` and they'll get an ordered list of all the courses they have to work through before they're allowed to.

We don't even need to go into the details of how topological sort works before we put it to good use. In all likelihood, your programming language of choice probably has an implementation of it in the standard library. In the worst case scenario, your Unix probably has the `tsort` utility installed by default, run man `tsort` and have a play with it.

###Other places tsort get's used###

 - **Tools like** `make` allow you to declare task dependencies. Topological sort is used under the hood to figure out what order the tasks should be executed in.
 - **Any programming language that has a `require` directive**, indicating that the current file requires the code in a different file to be run first. Here topological sort can be used to figure out what order the files should be loaded in so that each is only loaded once and all dependencies are met.
 - **Project management tools with Gantt charts**. A Gantt chart is a graph that outlines all the dependencies of a given task and gives you an estimate of when it will be complete based on those dependencies. I'm not a fan of Gantt charts, but it's highly likely that tsort will be used to draw them.

###Squeezing data with Huffman coding###
[Huffman coding](http://en.wikipedia.org/wiki/Huffman_coding) is an algorithm used for lossless data compression. It works by analyzing the data you want to compress and creating a binary code for each character. More frequently occurring characters get smaller codes, so `e` might be encoded as `111` while `x` might be `10010`. The codes are created so that they can be concatenated without a delimeter and still be decoded accurately.

Huffman coding is used along with LZ77 in the DEFLATE algorithm which is used by gzip to compress things. gzip is used all over the place, in particular for compressing files (typically anything with a `.gz` extension) and for http requests/responses in transit.

Knowing how to implement and use Huffman coding has a number of benefits:

 - You'll know why a larger compression context results in better compression overall (e.g. the more you compress, the better the compression ratio). This is one of the proposed benefits of SPDY: that you get better compression on multiple HTTP requests/responses.
 - You'll know that if you're compressing your javascript/css in transit anyway, it's completely pointless to run a minifier on them. Sames goes for PNG files, which use DEFLATE internally for compression already.
 - If you ever find yourself trying to forcibly decipher encrypted information , you may realize that since repeating data compresses better, the compression ratio of a given bit of ciphertext will help you determine it's [block cipher mode of operation](http://en.wikipedia.org/wiki/Block_cipher_mode_of_operation).

###Picking what to learn next is hard###
Being a programmer involves learning constantly. To operate as a web developer you need to know markup languages, high level languages like ruby/python, regular expressions, SQL and JavaScript. You need to know the fine details of HTTP, how to drive a unix terminal and the subtle art of object oriented programming. It's difficult to navigate that landscape effectively and choose what to learn next.

I'm not a fast learner so I have to choose what to spend time on very carefully. As much as possible, I want to learn skills and techniques that are evergreen, that is, won't be rendered obsolete in a few years time. That means I'm hesitant to learn the javascript framework of the week or untested programming languages and environments.

As long as our dominant model of computation stays the same, data structures and algorithms that we use today will be used in some form or another in the future. You can safely spend time on gaining a deep and thorough knowledge of them and know that they will pay dividends for your entire career as a programmer.

###Sign up to the Happy Bear Software List###
Find this article useful? For a regular dose of freshly squeezed technical content delivered straight to your inbox, **click on the big green button below to sign up to the Happy Bear Software mailing list.**

We'll only be in touch a few times per month and you can unsubscribe at any time.

--------------------------------------------------------------------------------

via: http://www.happybearsoftware.com/how-learning-data-structures-and-algorithms-makes-you-a-better-developer

作者：[Happy Bear][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.happybearsoftware.com/
[1]:http://en.wikipedia.org/wiki/Huffman_coding
[2]:http://en.wikipedia.org/wiki/Block_cipher_mode_of_operation



