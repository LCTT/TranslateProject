[KayGuoWhu translating]
What Makes a Good Programmer?
================================================================================
What makes a good programmer? It’s an interesting question to ask yourself. It makes you reflect on the craft of software development. It is also a good question to ask your colleagues. It can trigger some interesting discussions on how you work together. Here are five skills I think are crucial to have in order to be a good programmer.

### 1. Problem Decomposition ###

Programming is about solving problems. But before you write any code, you need to be clear on how to solve the problem. One skill good programmers have is the ability to break the problem down in smaller and smaller parts, until each part can be easily solved. But it is not enough simply to find a way to solve the problem. A good programmer finds a way to model the problem in such a way that the resulting program is easy to reason about, easy to implement and easy to test.

Some of the most complicated programs I have worked on were complicated in part because the implementation did not fit the problem very well. This led to code that was hard to understand. When the problem is well modeled, I agree with Bernie Cosell (interviewed in the excellent [Coders at Work][1]):

> “…there are very few inherently hard programs. If you are looking at a piece of code and it looks very hard – if you can’t understand what this thing is supposed to be doing – that’s almost always an indication that it was poorly thought through. At that point you don’t roll up your sleeves and try to fix the code; you take a step back and think it through again. When you’ve thought it through enough, you’ll find out that it’s easy“.

### 2. Scenario Analysis ###

Good developers have the ability to consider many different scenarios for the program. This applies both to the logic in the program, and to the internal and external events that can occur. To consider the different paths in the logic, they ask questions like: What happens if this argument is null? What if none of these conditions are true? Is this method thread-safe? To discover what types of events the software needs to handle, they will ask questions like: What if this queue becomes full? What if there is no response to this request? What if the other server restarts while this server is restarting?

The good programmers ask themselves: How can this break? In other words, they have the ability to think like testers. In contrast, inexperienced programmers mostly only consider the “happy path” – the normal flow of control when everything goes as expected (which it does most of the time). But of course, the unexpected inevitably happens, and the program needs to be able to cope with that.

### 3. Naming ###

Programming consists to a large degree of naming things: classes, methods and variables. When done well, the program becomes largely self-documenting, meaning that the function of the program is quite clear just from reading the source code. One effect of self-documenting code is that it naturally leads to many smaller methods, rather than a few large ones, simply because then you have more places to put meaningful names (there are [other reasons][2] why many small methods are good too).

Coming up with good names is much harder than it sounds. I like this quote (from Phil Karlton): “There are only two hard things in Computer Science: cache invalidation and naming things.”  Partly naming is hard because it needs to be clear in your mind what each name represents. Sometimes that is not immediately clear, but only becomes apparent as the development proceeds. Therefore, renaming is just as important as naming.

Naming things well also includes coming up with concepts to be used, and what these concepts should be called. By having well-thought out, distinctly named concepts that are used consistently (in the program, and when discussing the domain with programmers and non-programmers), writing the program becomes much easier.

### 4. Consistency ###

Perhaps the biggest challenge in programming is managing complexity. Consistency is one way to combat complexity. It reduces some of the complexity by allowing us to see patterns and infer how things are named, used and handled. With consistency, we don’t need to use brain power to remember exceptions and random variations. Instead we can concentrate on [essential complexity, not accidental complexity][3].

Consistency is important across the board. It applies to variable names and grouping, method naming, the division into modules, the directory structure, the GUI, error handling, logging, documentation etc. For example, if some variables are related and appear together (in declarations, method calls or as columns in the database) then always use them in the same order. Then it becomes easier to see if one is missing, or if they have been mixed up. For an operation, if it is called delete in one place, don’t call it remove in another place – stick with the same name. Steve McConnell also has some good advice on using opposites precisely in [Code Complete][4]. For example, begin/end are opposites, as are start/stop. Don’t mix names from different pairs (for example using begin/stop) when dealing with opposites.

Inconsistencies can get introduced when modifying a program. Sloppy programmers don’t pay attention to if what they add is consistent with the existing code or not. Good programmers are relentless in ensuring that seemingly small details are just right. They know how important consistency is in the overall fight against complexity.

### 5. Learning ###

As a software developer, you are constantly learning. Before adding a new feature, you have to understand what it is supposed to do. Before adding code to an existing program, you usually have to learn what the existing code does, in order fit the new functionality in properly. You also have to learn about the surrounding systems, in order to interface with them correctly. The ability to learn fast therefore makes you a much more effective developer.

Furthermore, because the pace of development in the software engineering field is so high, there is a steady stream of new languages, tools, techniques and frameworks to learn about. You can view this as good or bad. Fred Brooks lists learning as [one of the joys of the craft][5], and I agree. Learning new things is satisfying in itself. It also means that life as a developer never is boring.

### Conclusion ###

All of the above skills are generic – none of them are specific to any one language, framework or technology. If you have them, you can quickly learn a new language or tool, and write good software in that environment. Furthermore, because they are general in nature, they will not become obsolete in a couple of years.

These are my answers for what makes a good programmer. What do you think makes a good programmer? Let me know in the comments.

--------------------------------------------------------------------------------

via: http://henrikwarne.com/2014/06/30/what-makes-a-good-programmer/

作者：[Henrik Warne][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://henrikwarne.com/about/
[1]:http://www.amazon.com/review/R2OV0TG7MJGXGL
[2]:http://henrikwarne.com/2013/08/31/7-ways-more-methods-can-improve-your-program/
[3]:http://faculty.salisbury.edu/~xswang/Research/Papers/SERelated/no-silver-bullet.pdf
[4]:http://www.amazon.com/review/R269BBARXH1V6R/
[5]:http://henrikwarne.com/2012/06/02/why-i-love-coding/