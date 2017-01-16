
translating by ypingcn

How to choose your first programming language
============================================================[

][1]
 ![How to choose your first programming language](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDU_OSDC_IntroOS_520x292_FINAL.png?itok=va-tdc8j "How to choose your first programming language") 
Image by : 

opensource.com

The reasons for learning to program are as a varied as the people who want to learn. You might have a program you want to make, or maybe you just want to jump in. So, before choosing your first programming language, ask yourself: Where do you want that program to run? What do you want that program to do?

Your reasons for learning to code should inform your choice of a first language.

_In this article, I use "code," "program," and "develop" interchangeably as verbs, while "code," "program," "application," and "app" interchangeably as nouns. This is to reflect language usage you may hear._

### Know your device

Where your programs will run is a defining factor in your choice of language.

Desktop applications are the traditional software programs that run on a desktop or laptop computer. For these you'll be writing code that only runs on a single computer at a time. Mobile applications, known as apps, run on portable communications devices using iOS, Android, or other operating systems. Web applications are websites that function like applications.

Web development is often broken into two subcategories, based on the web's client-server architecture:

*   Front-end programming, which is writing code that runs in the web browser itself. This is the part that faces the user, or the "front end" of the program. It's sometimes called "client-side" programming, because the web browser is the client half of the web's client-server architecture. The web browser runs on your local computer or device.

*   Back-end programming, which is also known as "server-side" programming, the code written runs on a server, which is a computer you don't have physical access to.

### What to create

Programming is a broad discipline and can be used in a variety of fields. Common examples include:

*   data science,
*   web development,
*   game development, and
*   work automation of various types.

Now that we've looked at why and where you want to  program, let's look at two great languages for beginners.

### Python

[Python][2] is one of the most popular languages for first-time programmers, and that is not by accident. Python is a general-purpose language. This means it can be used for a wide range of programming tasks. There's almost _nothing_ you can't do with Python. This lets a wide range of beginners make practical use of the language. Additionally, Python has two key design features that make it great for new programmers: a clear, English-like [syntax][3] and an emphasis on code [readability][4].

A language's syntax is essentially what you type to make the language perform. This can include words, special characters (like `;`, `$`, `%`, or `{}`), white space, or any combination. Python uses English for as much of this as possible, unlike other languages, which often use punctuation or special characters. As a result, Python reads much more like a natural, human language. This helps new programmers focus on solving problems, and they spend less time struggling with the specifics of the language itself.

Combined with that clear syntax is a focus on readability. When writing code, you'll create logical "blocks" of code, sections of code that work together for some related purpose. In many languages, those blocks are marked (or delimited) by special characters. They may be enclosed in `{}` or some other character. The combination of block-delimiting characters and your ability to write your code in almost any fashion can decrease readability. Let's look at an example.

Here's a small function, called "fun," which takes a number, `x` as its input. If `x`equals **0**, it runs another function called `no_fun` (which does something that's no fun). That function takes no input. Otherwise, it runs the function `big_fun`, using the same input, `x`.

This function defined in the ["C" language][5] could be written like this:

```
void fun(int x)
{
    if (x == 0) {
        no_fun();
    } else {
        big_fun(x);
    }
}
```

or, like this:

```
void fun(int x) { if (x == 0) {no_fun(); } else {big_fun(x); }}
```

Both are functionally equivalent and both will run. The `{}` and `;` tell us where different parts of the block are; however, one is _clearly_ more readable to a human. Contrast that with the same function in Python:

```
def fun(x):
    if x == 0:
        no_fun()
    else:
        big_fun(x)
```

In this case, there's only one option. If the code isn't structured this way, it won't work, so if you have code that works, you have code that's readable. Also, notice the difference in syntax. Other than `def`, the words in the Python code are English and would be clear to a broad audience. In the C language example `void` and `int` are less intuitive.

Python also has an excellent ecosystem. This means two things. First, you have a large, active community of people using the language you can turn to when you need help and guidance. Second, it has a large number of preexisiting libraries, which are chunks of code that perform special functions. These range from advanced mathematical processing to graphics to computer vision to almost anything you can imagine.

Python has two drawbacks to it being your first language. The first is that it can sometimes be tricky to install, especially on computers running Windows. (If you have a Mac or a Linux computer, Python is already installed.) Although this issue isn't insurmountable, and the situation is improving all the time, it can be a deterrent for some people. The second drawback is for people who specifically want to build websites. While there are projects written in Python (like [Django][6] and [Flask][7]) that let you build websites, there aren't many options for writing Python that will run in a web browser. It is primarily a back-end or server-side language.

### JavaScript

If you know your primary reason for learning to program is to build websites, [JavaScript][8] may be the best choice for you. JavaScript is _the_ language of the web. Besides being the default language of the web, JavaScript has a few advantages as a beginner language.

First, there's nothing to install. You can open any text editor (like Notepad on Windows, but not a word processor like Microsoft Word) and start typing JavaScript. The code will run in your web browser. Most modern web browsers have a JavaScript engine built in, so your code will run on almost any computer and a lot of mobile devices. The fact that you can run your code immediately in a web browser provides a _very_ fast feedback loop, which is good for new coders. You can try something and see the results very quickly.

While JavaScript started life as a front-end language, an environment called [Node.js][9] lets you write code that runs in a web browser or on a server. Now JavaScript can be used as a front-end or back-end language. This has led to an increase in its popularity. JavaScript also has a huge number of packages that provide added functionality to the core language, allowing it to be used as a general-purpose language, and not just as the language of web development. Like Python, JavaScript has a vibrant, active ecosystem.

Despite these strengths, JavaScript is not without its drawbacks for new programmers. The [syntax of JavaScript][10] is not as clear or English-like as Python. It's much more like the C example above. It also doesn't have readability as a key design principle.

### Making a choice

It's hard to go wrong with either Python or JavaScript as your first language. The key factor is what you intend to do. Why are you learning to code? Your answer should influence your decision most heavily. If you're looking to make contributions to open source, you will find a _huge_ number of projects written in both languages. In addition, many projects that aren't primarily written in JavaScript still make use of it for their front-end component. As you're making a choice, don't forget about your local community. Do you have friends or co-workers who use either of these languages? For a new coder, having live support is very important.

Good luck and happy coding.

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/kojo_headshot_pro_square.jpg?itok=jv1kT8T0)

Kojo Idrissa - I'm a new software developer (1 year) who changed careers from accounting and university teaching. I've been a fan of Open Source software since around the time the term was coined, but I didn't have a NEED to do much coding in my prior careers. Tech-wise, I focus on Python, automated testing, and learning Django. I hope to learn more JavaScript soon. Topic-wise, I like to focus on helping new people get started with programing or getting involved in contributing to Open Source projects. I also focus on inclusive culture in tech environments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/choosing-your-first-programming-language

作者：[Kojo Idrissa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/transitionkojo
[1]:https://opensource.com/article/17/1/choosing-your-first-programming-language?rate=fWoYXudAZ59IkAKZ8n5lQpsa4bErlSzDEo512Al6Onk
[2]:https://www.python.org/about/
[3]:https://en.wikipedia.org/wiki/Python_syntax_and_semantics
[4]:https://en.wikipedia.org/wiki/Python_syntax_and_semantics#Indentation
[5]:https://en.wikipedia.org/wiki/C_(programming_language
[6]:https://www.djangoproject.com/
[7]:http://flask.pocoo.org/
[8]:https://en.wikipedia.org/wiki/JavaScript
[9]:https://nodejs.org/en/
[10]:https://en.wikipedia.org/wiki/JavaScript_syntax#Basics
