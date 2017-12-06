(translating by runningwater)
Why Python and Pygame are a great pair for beginning programmers
============================================================

### We look at three reasons Pygame is a good choice for learning to program.


![What's the best game platform for beginning programmers?](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 "What's the best game platform for beginning programmers?")
Image by : 

opensource.com

Last month, [Scott Nesbitt][10] wrote about [Mozilla awarding $500K to support open source projects][11]. Phaser, a HTML/JavaScript game platform, was [awarded $50,000][12]. I’ve been teaching Phaser to my pre-teen daughter for a year, and it's one of the best and easiest HTML game development platforms to learn. [Pygame][13], however, may be a better choice for beginners. Here's why.

### 1\. One long block of code

Pygame is based on Python, the [most popular language for introductory computer courses][14]. Python is great for writing out ideas in one long block of code. Kids start off with a single file and with a single block of code. Before they can get to functions or classes, they start with code that will soon resemble spaghetti. It’s like finger-painting, as they throw thoughts onto the page.

More Python Resources

*   [What is Python?][1]

*   [Top Python IDEs][2]

*   [Top Python GUI frameworks][3]

*   [Latest Python content][4]

*   [More developer resources][5]

This approach to learning works. Kids will naturally start to break things into functions and classes as their code gets more difficult to manage. By learning the syntax of a language like Python prior to learning about functions, the student will gain basic programming knowledge before using global and local scope.

Most HTML games separate the structure, style, and programming logic into HTML, CSS, and JavaScript to some degree and require knowledge of CSS and HTML. While the separation is better in the long term, it can be a barrier for beginners. Once kids realize that they can quickly build web pages with HTML and CSS, they may get distracted by the visual excitement of colors, fonts, and graphics. Even those who stay focused on JavaScript coding will still need to learn the basic document structure that the JavaScript code sits in.

### 2\. Global variables are more obvious

Both Python and JavaScript use dynamically typed variables, meaning that a variable becomes a string, an integer, or float when it’s assigned; however, making mistakes is easier in JavaScript. Similar to typed variables, both JavaScript and Python have global and local variable scopes. In Python, global variables inside of a function are identified with the global keyword.

Let’s look at the basic [Making your first Phaser game tutorial][15], by Alvin Ourrad and Richard Davey, to understand the challenge of using Phaser to teach programming to beginners. In JavaScript, global variables—variables that can be accessed anywhere in the program—are difficult to keep track of and often are the source of bugs that are challenging to solve. Richard and Alvin are expert programmers and use global variables intentionally to keep things concise.

```
var game = new Phaser.Game(800, 600, Phaser.AUTO, '', { preload: preload, create: create, update: update });

function preload() {

    game.load.image('sky', 'assets/sky.png');

}

var player;
var platforms;

function create() {
    game.physics.startSystem(Phaser.Physics.ARCADE);
…
```

In their Phaser programming book  [_Interphase_ ,][16] Richard Davey and Ilija Melentijevic explain that global variables are commonly used in many Phaser projects because they make it easier to get things done quickly.

> “If you’ve ever worked on a game of any significant size then this approach is probably already making you cringe slightly... So why do we do it? The reason is simply because it’s the most concise and least complicated way to demonstrate what Phaser can do.”

Although structuring a Phaser application to use local variables and split things up nicely into separation of concerns is possible, that’s tough for kids to understand when they’re first learning to program.

If you’re set on teaching your kids to code with JavaScript, or if they already know how to code in another language like Python, a good Phaser course is [The Complete Mobile Game Development Course][17], by [Pablo Farias Navarro][18]. Although the title focuses on mobile games, the actual course focuses on JavaScript and Phaser. The JavaScript and Phaser apps are moved to a mobile phone with [PhoneGap][19].

### 3\. Pygame comes with less assembly required

Thanks to [Python Wheels][20], Pygame is now super [easy to install][21]. You can also install it on Fedora/Red Hat with the **yum** package manager:

```
sudo yum install python3-pygame
```

See the official [Pygame installation documentation][22] for more information.

Although Phaser itself is even easier to install, it does require more knowledge to use. As mentioned previously, the student will need to assemble their JavaScript code within an HTML document with some CSS. In addition to the three languages—HTML, CSS, and JavaScript—Phaser also requires the use of Firefox or Chrome development tools and an editor. The most common editors for JavaScript are Sublime, Atom, VS Code (probably in that order).

Phaser applications will not run if you open the HTML file in a browser directly, due to [same-origin policy][23]. You must run a web server and access the files by connecting to the web server. Fortunately, you don’t need to run Apache on your local computer; you can run something lightweight like [httpster][24] for most projects.

### Advantages of Phaser and JavaScript

With all the challenges of JavaScript and Phaser, why am I teaching them? Honestly, I held off for a long time. I worried about students learning variable hoisting and scope. I developed my own curriculum based on Pygame and Python, then I developed one based on Phaser. Eventually, I decided to use Pablo’s pre-made curriculum as a starting point. 

There are really two reasons that I moved to JavaScript. First, JavaScript has emerged as a serious language used in serious applications. In addition to web applications, it’s used for mobile and server applications. JavaScript is everywhere, and it’s used widely in applications kids see every day. If their friends code in JavaScript, they'll likely want to as well. As I saw the momentum behind JavaScript, I looked into alternatives that could compile into JavaScript, primarily Dart and TypeScript. I didn’t mind the extra conversion step, but I still looked at JavaScript.

In the end, I chose to use Phaser and JavaScript because I realized that the problems could be solved with JavaScript and a bit of work. High-quality debugging tools and the work of some exceptionally smart people have made JavaScript a language that is both accessible and useful for teaching kids to code.

### Final word: Python vs. JavaScript

When people ask me what language to start their kids with, I immediately suggest Python and Pygame. There are tons of great curriculum options, many of which are free. I used ["Making Games with Python & Pygame"][25] by Al Sweigart with my son. I also used  _[Think Python: How to Think Like a Computer Scientist][7]_ by Allen B. Downey. You can get Pygame on your Android phone with [RAPT Pygame][26] by [Tom Rothamel][27].

Despite my recommendation, I always suspect that kids soon move to JavaScript. And that’s okay—JavaScript is a mature language with great tools. They’ll have fun with JavaScript and learn a lot. But after years of helping my daughter’s older brother create cool games in Python, I’ll always have an emotional attachment to Python and Pygame.

### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/craig-head-crop.png?itok=LlMnIq8m)][28]
 
 Craig Oda - First elected president and co-founder of Tokyo Linux Users Group. Co-author of "Linux Japanese Environment" book published by O'Reilly Japan. Part of core team that established first ISP in Asia. Former VP of product management and product marketing for major Linux company. Partner at Oppkey, developer relations consulting firm in Silicon Valley.[More about me][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/pygame

作者：[Craig Oda  ][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/codetricity
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:https://opensource.com/article/17/11/pygame?rate=PV7Af00S0QwicZT2iv8xSjJrmJPdpfK1Kcm7LXxl_Xc
[7]:http://greenteapress.com/thinkpython/html/index.html
[8]:https://opensource.com/users/codetricity
[9]:https://opensource.com/user/46031/feed
[10]:https://opensource.com/users/scottnesbitt
[11]:https://opensource.com/article/17/10/news-october-14
[12]:https://www.patreon.com/photonstorm/posts
[13]:https://www.pygame.org/news
[14]:https://cacm.acm.org/blogs/blog-cacm/176450-python-is-now-the-most-popular-introductory-teaching-language-at-top-u-s-universities/fulltext
[15]:http://phaser.io/tutorials/making-your-first-phaser-game
[16]:https://phaser.io/interphase
[17]:https://academy.zenva.com/product/the-complete-mobile-game-development-course-platinum-edition/
[18]:https://gamedevacademy.org/author/fariazz/
[19]:https://phonegap.com/
[20]:https://pythonwheels.com/
[21]:https://pypi.python.org/pypi/Pygame
[22]:http://www.pygame.org/wiki/GettingStarted#Pygame%20Installation
[23]:https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
[24]:https://simbco.github.io/httpster/
[25]:https://inventwithpython.com/makinggames.pdf
[26]:https://github.com/renpytom/rapt-pygame-example
[27]:https://github.com/renpytom
[28]:https://opensource.com/users/codetricity
[29]:https://opensource.com/users/codetricity
[30]:https://opensource.com/users/codetricity
[31]:https://opensource.com/article/17/11/pygame#comments
[32]:https://opensource.com/tags/python
[33]:https://opensource.com/tags/programming
