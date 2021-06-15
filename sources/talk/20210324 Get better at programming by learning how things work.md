[#]: subject: (Get better at programming by learning how things work)
[#]: via: (https://jvns.ca/blog/learn-how-things-work/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get better at programming by learning how things work
======

When we talk about getting better at programming, we often talk about testing, writing reusable code, design patterns, and readability.

All of those things are important. But in this blog post, I want to talk about a different way to get better at programming: learning how the systems you’re using work! This is the main way I approach getting better at programming.

### examples of “how things work”

To explain what I mean by “how things work”, here are some different types of programming and examples of what you could learn about how they work.

Frontend JS:

  * how the event loop works
  * HTTP methods like GET and POST
  * what the DOM is and what you can do with it
  * the same-origin policy and CORS



CSS:

  * how inline elements are rendered differently from block elements
  * what the “default flow” is
  * how flexbox works
  * how CSS decides which selector to apply to which element (the “cascading” part of the cascading style sheets)



Systems programming:

  * the difference between the stack and the heap
  * how virtual memory works
  * how numbers are represented in binary
  * what a symbol table is
  * how code from external libraries gets loaded (e.g. dynamic/static linking)
  * Atomic instructions and how they’re different from mutexes



### you can use something without understanding how it works (and that can be ok!)

We work with a LOT of different systems, and it’s unreasonable to expect that every single person understands everything about all of them. For example, many people write programs that send email, and most of those people probably don’t understand everything about how email works. Email is really complicated! That’s why we have abstractions.

But if you’re working with something (like CSS, or HTTP, or goroutines, or email) more seriously and you don’t really understand how it works, sometimes you’ll start to run into problems.

### your bugs will tell you when you need to improve your mental model

When I’m programming and I’m missing a key concept about how something works, it doesn’t always show up in an obvious way. What will happen is:

  * I’ll have bugs in my programs because of an incorrect mental model
  * I’ll struggle to fix those bugs quickly and I won’t be able to find the right questions to ask to diagnose them
  * I feel really frustrated



I think it’s actually an important skill **just to be able to recognize that this is happening**: I’ve slowly learned to recognize the feeling of “wait, I’m really confused, I think there’s something I don’t understand about how this system works, what is it?”

Being a senior developer is less about knowing absolutely everything and more about quickly being able to recognize when you **don’t** know something and learn it. Speaking of being a senior developer…

### even senior developers need to learn how their systems work

So far I’ve never stopped learning how things work, because there are so many different types of systems we work with!

For example, I know a lot of the fundamentals of how C programs work and web programming (like the examples at the top of this post), but when it comes to graphics programming/OpenGL/GPUs, I know very few of the fundamental ideas. And sometimes I’ll discover a new fact that I’m missing about a system I thought I knew, like last year I [discovered][1] that I was missing a LOT of information about how CSS works.

It can feel bad to realise that you really don’t understand how a system you’ve been using works when you have 10 years of experience (“ugh, shouldn’t I know this already? I’ve been using this for so long!“), but it’s normal! There’s a lot to know about computers and we are constantly inventing new things to know, so nobody can keep up with every single thing.

### how I go from “I’m confused” to “ok, I get it!”

When I notice I’m confused, I like to approach it like this:

  1. Notice I’m confused about a topic (“hey, when I write `await` in my Javascript program, what is actually happening?“)
  2. Break down my confusion into specific factual questions, like “when there’s an `await` and it’s waiting, how does it decide which part of my code runs next? Where is that information stored?”
  3. Find out the answers to those questions (by writing a program, reading something on the internet, or asking someone)
  4. Test my understanding by writing a program (“hey, that’s why I was having that async bug! And I can fix it like this!“)



The last “test my understanding” step is really important. The whole point of understanding how computers work is to actually write code to make them do things!

I find that if I can use my newfound understanding to do something concrete like implement a new feature or fix a bug or even just write a test program that demonstrates how the thing works, it feels a LOT more real than if I just read about it. And then it’s much more likely that I’ll be able to use it in practice later.

### just learning a few facts can help a lot

Learning how things work doesn’t need to be a big huge thing. For example, I used to not really know how floating point numbers worked, and I felt nervous that something weird would happen that I didn’t understand.

And then one day in 2013 I went to a talk by Stefan Karpinski explaining how floating point numbers worked (containing roughly the information in [this comic][2], but with more weird details). And now I feel totally confident using floating point numbers! I know what their basic limitations are, and when not to use them (to represent integers larger than 2^53). And I know what I _don’t_ know – I know it’s hard to write numerically stable linear algebra algorithms and I have no idea how to do that.

### connect new facts to information you already know

When learning a new fact, it’s easy to be able to recite a sentence like “ok, there are 8 bits in a byte”. That’s true, but so what? What’s harder (and much more useful!) is to be able to connect that information to what you already know about programming.

For example, let’s take this “8 bits in a byte thing”. In your program you probably have strings, like “Hello”. You can already start asking lots of questions about this, like:

  * How many bytes in memory are used to represent the string “Hello”? (it’s 5!)
  * What bits exactly does the letter “H” correspond to? (the encoding for “Hello” is going to be using ASCII, so you can look it up in an ASCII table!)
  * If you have a running program that’s printing out the string “Hello”, can you go look at its memory and find out where those bytes are in its memory? How do you do that?



The important thing here is to ask the questions and explore the connections that **you’re** curious about – maybe you’re not so interested in how the strings are represented in memory, but you really want to know how many bytes a heart emoji is in Unicode! Or maybe you want to learn about how floating point numbers work!

I find that when I connect new facts to things I’m already familiar with (like emoji or floating point numbers or strings), then the information sticks a lot better.

Next up, I want to talk about 2 ways to get information: asking a person yes/no questions, and asking the computer.

### how to get information: ask yes/no questions

When I’m talking to someone who knows more about the concept than me, I find it helps to start by asking really simple questions, where the answer is just “yes” or “no”. I’ve written about yes/no questions before in [how to ask good questions][3], but I love it a lot so let’s talk about it again!

I do this because it forces me to articulate exactly what my current mental model _is_, and because I think yes/no questions are often easier for the person I’m asking to answer.

For example, here are some different types of questions:

  * Check if your current understanding is correct
    * Example: “Is a pixel shader the same thing as a fragment shader?”
  * How concepts you’ve heard of are related to each other
    * Example: “Does shadertoy use OpenGL?”
    * Example: “Do graphics cards know about triangles?”
  * High-level questions about what the main purpose of something is
    * Example: “Does mysql orchestrator proxy database queries?”
    * Example: “Does OpenGL give you more control or less control over the graphics card than Vulkan?”



### yes/no questions put you in control

When I ask very open-ended questions like “how does X work?”, I find that it often goes wrong in one of 2 ways:

  1. The person starts telling me a bunch of things that I already knew
  2. The person starts telling me a bunch of things that I don’t know, but which aren’t really what I was interested in understanding



Both of these are frustrating, but of course neither of these things are their fault! They can’t know exactly what informatoin I wanted about X, because I didn’t tell them. But it still always feels bad to have to interrupt someone with “oh no, sorry, that’s not what I wanted to know at all!”

I love yes/no questions because, even though they’re harder to formulate, I’m WAY more likely to get the exact answers I want and less likely to waste the time of the person I’m asking by having them explain a bunch of things that I’m not interested in.

### asking yes/no questions isn’t always easy

When I’m asking someone questions to try to learn about something new, sometimes this happens:

**me:** so, just to check my understanding, it works like this, right?
**them:** actually, no, it’s &lt;completely different thing&gt;
**me (internally)**: (brief moment of panic)
**me:** ok, let me think for a minute about my next question

It never quite feels _good_ to learn that my mental model was totally wrong, even though it’s incredibly helpful information. Asking this kind of really specific question (even though it’s more effective!) puts you in a more vulnerable position than asking a broader question, because sometimes you have to reveal specific things that you were totally wrong about!

When this happens, I like to just say that I’m going to take a minute to incorporate the new fact into my mental model and think about my next question.

Okay, that’s the end of this digression into my love for yes/no questions :)

### how to get information: ask the computer

Sometimes when I’m trying to answer a question I have, there won’t be anybody to ask, and I’ll Google it or search the documentation and won’t find anything.

But the delightful thing about computers is that you can often get answers to questions about computers by… asking your computer!

Here are a few examples (from past blog posts) of questions I’ve had and computer experiments I ran to answer them for myself:

  * Are atomics faster or slower than mutexes? (blog post: [trying out mutexes and atomics][4])
  * If I add a user to a group, will existing processes running as that user have the new group? (blog post: [How do groups work on Linux?][5])
  * On Linux, if you have a server listening on 0.0.0.0 but you don’t have any network interfaces, can you connect to that server? (blog post: [what’s a network interface?][6])
  * How is the data in a SQLite database actually organized on disk? (blog post: [How does SQLite work? Part 1: pages!][7])



### asking the computer is a skill

It definitely takes time to learn how to turn “I’m confused about X” into specific questions, and then to turn that question into an experiment you can run on your computer to definitively answer it.

But it’s a really powerful tool to have! If you’re not limited to just the things that you can Google / what’s in the documentation / what the people around you know, then you can do a LOT more.

### be aware of what you still don’t understand

Like I said earlier, the point here isn’t to understand every single thing. But especially as you get more senior, it’s important to be aware of what you don’t know! For example, here are five things I don’t know (out of a VERY large list):

  * How database transactions / isolation levels work
  * How vertex shaders work (in graphics)
  * How font rendering works
  * How BGP / peering work
  * How multiple inheritance works in Python



And I don’t really need to know how those things work right now! But one day I’m pretty sure I’m going to need to know how database transactions work, and I know it’s something I can learn when that day comes :)

Someone who read this post asked me “how do you figure out what you don’t know?” and I didn’t have a good answer, so I’d love to hear your thoughts!

Thanks to Haider Al-Mosawi, Ivan Savov, Jake Donham, John Hergenroeder, Kamal Marhubi, Matthew Parker, Matthieu Cneude, Ori Bernstein, Peter Lyons, Sebastian Gutierrez, Shae Matijs Erisson, Vaibhav Sagar, and Zell Liew for reading a draft of this.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/learn-how-things-work/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/debugging-attitude-matters/
[2]: https://wizardzines.com/comics/floating-point/
[3]: https://jvns.ca/blog/good-questions/
[4]: https://jvns.ca/blog/2014/12/14/fun-with-threads/
[5]: https://jvns.ca/blog/2017/11/20/groups/
[6]: https://jvns.ca/blog/2017/09/03/network-interfaces/
[7]: https://jvns.ca/blog/2014/09/27/how-does-sqlite-work-part-1-pages/
