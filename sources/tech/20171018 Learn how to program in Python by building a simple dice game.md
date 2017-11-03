Learn how to program in Python by building a simple dice game
============================================================

### Python is a good language for young and old, with or without any programming experience.

![Learn how to program in Python by building a simple dice game](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A "Learn how to program in Python by building a simple dice game")
Image by : opensource.com

[Python][9] is an all-purpose programming language that can be used to create desktop applications, 3D graphics, video games, and even websites. It's a great first programming language because it can be easy to learn and it's simpler than complex languages like C, C++, or Java. Even so, Python is powerful and robust enough to create advanced applications, and it's used in just about every industry that uses computers. This makes Python a good language for young and old, with or without any programming experience.

### Installing Python

Before learning Python, you may need to install it.

**Linux: **If you use Linux, Python is already included, but make sure that you have Python 3 specifically. To check which version is installed, open a terminal window and type:

```
    python3 -V
```

If that command is not found, you'll need to install Python 3 from your package manager.

**MacOS:** If you're on a Mac, follow the instructions for Linux above to see if you have Python 3 installed. MacOS does not have a built-in package manager, so if Python 3 is not found, install it from [python.org/downloads/mac-osx][10]. Although macOS does have Python 2 installed, you should learn Python 3.

**Windows:** Microsoft Windows doesn't currently ship with Python. Install it from [python.org/downloads/windows][11]. Be sure to select **Add Python to PATH** in the install wizard.

### Running an IDE

To write programs in Python, all you really need is a text editor, but it's convenient to have an integrated development environment (IDE). An IDE integrates a text editor with some friendly and helpful Python features. IDLE 3 and NINJA-IDE are two options to consider.

### IDLE 3

Python comes with a basic IDE called IDLE.

### [idle3.png][2]

![IDLE](https://opensource.com/sites/default/files/u128651/idle3.png "IDLE")

IDLE

It has keyword highlighting to help detect typos and a Run button to test code quickly and easily. To use it:

*   On Linux or macOS, launch a terminal window and type **idle3**.

*   On Windows, launch Python 3 from the Start menu.
    *   If you don't see Python in the Start menu, launch the Windows command prompt by typing **cmd** in the Start menu, and type **C:\Windows\py.exe**.

    *   If that doesn't work, try reinstalling Python. Be sure to select **Add Python to PATH** in the install wizard. Refer to [docs.python.org/3/using/windows.html][1] for detailed instructions.

    *   If that still doesn't work, just use Linux. It's free and, as long as you save your Python files to a USB thumb drive, you don't even have to install it to use it.

### Ninja-IDE

[Ninja-IDE][12] is an excellent Python IDE. It has keyword highlighting to help detect typos, quotation and parenthesis completion to avoid syntax errors, line numbers (helpful when debugging), indentation markers, and a Run button to test code quickly and easily.

### [ninja.png][3]

![Ninja-IDE](https://opensource.com/sites/default/files/u128651/ninja.png "Ninja-IDE")

Ninja-IDE

To use it:

1.  Install Ninja-IDE. if you're using Linux, it's easiest to use your package manager; otherwise [download][7] the correct installer version from NINJA-IDE's website.

2.  Launch Ninja-IDE.

3.  Go to the Edit menu and select Preferences.

4.  In the Preferences window, click the Execution tab.

5.  In the Execution tab, change **python** to **python3**.

### [pref.png][4]

![Python3 in Ninja-IDE](https://opensource.com/sites/default/files/u128651/pref.png "Python3 in Ninja-IDE")

Python3 in Ninja-IDE

### Telling Python what to do

Keywords tell Python what you want it to do. In either IDLE or Ninja, go to the File menu and create a new file. Ninja users: Do not create a new project, just a new file.

In your new, empty file, type this into IDLE or Ninja:

```
    print("Hello world.")
```

*   If you are using IDLE, go to the Run menu and select Run module option.

*   If you are using Ninja, click the Run File button in the left button bar.

### [ninja_run.png][5]

![Run file in Ninja](https://opensource.com/sites/default/files/u128651/ninja_run.png "Run file in Ninja")

Run file in Ninja

The keyword **print** tells Python to print out whatever text you give it in parentheses and quotes.

That's not very exciting, though. At its core, Python has access to only basic keywords, like **print**, **help**, basic math functions, and so on.

Use the **import** keyword to load more keywords. Start a new file in IDLE or Ninja and name it **pen.py**.

**Warning**: Do not call your file **turtle.py**, because **turtle.py** is the name of the file that contains the turtle program you are controlling. Naming your file **turtle.py** will confuse Python, because it will think you want to import your own file.

Type this code into your file, and then run it:

```
    import turtle
```

Turtle is a fun module to use. Try this:

```
    turtle.begin_fill()
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(100)
    turtle.end_fill()
```

See what shapes you can draw with the turtle module.

To clear your turtle drawing area, use the **turtle.clear()** keyword. What do you think the keyword **turtle.color("blue")** does?

Try more complex code:

```
    import turtle as t
    import time

    t.color("blue")
    t.begin_fill()

    counter=0

    while counter < 4:
        t.forward(100)
        t.left(90)
        counter = counter+1

    t.end_fill()
    time.sleep(5)
```

Once you have run your script, it's time to explore an even better module.

### Learning Python by making a game

To learn more about how Python works and prepare for more advanced programming with graphics, let's focus on game logic. In this tutorial, we'll also learn a bit about how computer programs are structured by making a text-based game in which the computer and the player roll a virtual die, and the one with the highest roll wins.

### Planning your game

Before writing code, it's important to think about what you intend to write. Many programmers [write simple documentation][13]  _before_  they begin writing code, so they have a goal to program toward. Here's how the dice program might look if you shipped documentation along with the game:

1.  Start the dice game and press Return or Enter to roll.

2.  The results are printed out to your screen.

3.  You are prompted to roll again or to quit.

It's a simple game, but the documentation tells you a lot about what you need to do. For example, it tells you that you need the following components to write this game:

*   Player: You need a human to play the game.

*   AI: The computer must roll a die, too, or else the player has no one to win or lose to.

*   Random number: A common six-sided die renders a random number between 1 and 6.

*   Operator: Simple math can compare one number to another to see which is higher.

*   A win or lose message.

*   A prompt to play again or quit.

### Making dice game alpha

Few programs start with all of their features, so the first version will only implement the basics. First a couple of definitions:

A **variable **is a value that is subject to change, and they are used a lot in Python. Whenever you need your program to "remember" something, you use a variable. In fact, almost all the information that code works with is stored in variables. For example, in the math equation **x + 5 = 20**, the variable is  _x_ , because the letter  _x_  is a placeholder for a value.

An **integer **is a number; it can be positive or negative. For example, 1 and -1 are both integers. So are 14, 21, and even 10,947.

Variables in Python are easy to create and easy to work with. This initial version of the dice game uses two variables: **player** and **ai**.

Type the following code into a new text file called **dice_alpha.py**:

```
    import random

    player = random.randint(1,6)
    ai = random.randint(1,6)

    if player > ai :
        print("You win")  # notice indentation
    else:
        print("You lose")
```

Launch your game to make sure it works.

This basic version of your dice game works pretty well. It accomplishes the basic goals of the game, but it doesn't feel much like a game. The player never knows what they rolled or what the computer rolled, and the game ends even if the player would like to play again.

This is common in the first version of software (called an alpha version). Now that you are confident that you can accomplish the main part (rolling a die), it's time to add to the program.

### Improving the game

In this second version (called a beta) of your game, a few improvements will make it feel more like a game.

#### 1\. Describe the results

Instead of just telling players whether they did or didn't win, it's more interesting if they know what they rolled. Try making these changes to your code:

```
    player = random.randint(1,6)
    print("You rolled " + player)

    ai = random.randint(1,6)
    print("The computer rolled " + ai)
```

If you run the game now, it will crash because Python thinks you're trying to do math. It thinks you're trying to add the letters "You rolled" and whatever number is currently stored in the player variable.

You must tell Python to treat the numbers in the player and ai variables as if they were a word in a sentence (a string) rather than a number in a math equation (an integer).

Make these changes to your code:

```
    player = random.randint(1,6)
    print("You rolled " + str(player) )

    ai = random.randint(1,6)
    print("The computer rolled " + str(ai) )
```

Run your game now to see the result.

#### 2\. Slow it down

Computers are fast. Humans sometimes can be fast, but in games, it's often better to build suspense. You can use Python's **time** function to slow your game down during the suspenseful parts.

```
    import random
    import time

    player = random.randint(1,6)
    print("You rolled " + str(player) )

    ai = random.randint(1,6)
    print("The computer rolls...." )
    time.sleep(2)
    print("The computer has rolled a " + str(player) )

    if player > ai :
        print("You win")  # notice indentation
    else:
        print("You lose")
```

Launch your game to test your changes.

#### 3\. Detect ties

If you play your game enough, you'll discover that even though your game appears to be working correctly, it actually has a bug in it: It doesn't know what to do when the player and the computer roll the same number.

To check whether a value is equal to another value, Python uses **==**. That's  _two_ equal signs, not just one. If you use only one, Python thinks you're trying to create a new variable, but you're actually trying to do math.

When you want to have more than just two options (i.e., win or lose), you can using Python's keyword **elif**, which means  _else if_ . This allows your code to check to see whether any one of  _some _ results are true, rather than just checking whether  _one_  thing is true.

Modify your code like this:

```
    if player > ai :
        print("You win")  # notice indentation
    elif player == ai:
        print("Tie game.")
    else:
        print("You lose")
```

Launch your game a few times to see if you can tie the computer's roll.

### Programming the final release

The beta release of your dice game is functional and feels more like a game than the alpha. For the final release, create your first Python **function**.

A function is a collection of code that you can call upon as a distinct unit. Functions are important because most applications have a lot of code in them, but not all of that code has to run at once. Functions make it possible to start an application and control what happens and when.

Change your code to this:

```
    import random
    import time

    def dice():
        player = random.randint(1,6)
        print("You rolled " + str(player) )

        ai = random.randint(1,6)
        print("The computer rolls...." )
        time.sleep(2)
        print("The computer has rolled a " + str(player) )

        if player > ai :
            print("You win")  # notice indentation
        else:
            print("You lose")

        print("Quit? Y/N")
        cont = input()

        if cont == "Y" or cont == "y":
            exit()
        elif cont == "N" or cont == "n":
            pass
        else:
            print("I did not understand that. Playing again.")
```

This version of the game asks the player whether they want to quit the game after they play. If they respond with a **Y** or **y**, Python's **exit** function is called and the game quits.

More importantly, you've created your own function called **dice**. The dice function doesn't run right away. In fact, if you try your game at this stage, it won't crash, but it doesn't exactly run, either. To make the **dice** function actually do something, you have to **call it** in your code.

Add this loop to the bottom of your existing code. The first two lines are only for context and to emphasize what gets indented and what does not. Pay close attention to indentation.

```
        else:
            print("I did not understand that. Playing again.")

    # main loop
    while True:
        print("Press return to roll your die.")
        roll = input()
        dice()
```

The **while True** code block runs first. Because **True** is always true by definition, this code block always runs until Python tells it to quit.

The **while True** code block is a loop. It first prompts the user to start the game, then it calls your **dice** function. That's how the game starts. When the dice function is over, your loop either runs again or it exits, depending on how the player answered the prompt.

Using a loop to run a program is the most common way to code an application. The loop ensures that the application stays open long enough for the computer user to use functions within the application.

### Next steps

Now you know the basics of Python programming. The next article in this series will describe how to write a video game with [PyGame][14], a module that has more features than turtle, but is also a lot more complex.

--------------------------------------------------------------------------------

作者简介：

Seth Kenlon - Seth Kenlon is an independent multimedia artist, free culture advocate, and UNIX geek. He has worked in the film and computing industry, often at the same time. He is one of the maintainers of the Slackware-based multimedia production project, http://slackermedia.info

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/python-101

作者：[Seth Kenlon ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:https://docs.python.org/3/using/windows.html
[2]:https://opensource.com/file/374606
[3]:https://opensource.com/file/374611
[4]:https://opensource.com/file/374621
[5]:https://opensource.com/file/374616
[6]:https://opensource.com/article/17/10/python-101?rate=XlcW6PAHGbAEBboJ3z6P_4Sx-hyMDMlga9NfoauUA0w
[7]:http://ninja-ide.org/downloads/
[8]:https://opensource.com/user/15261/feed
[9]:https://www.python.org/
[10]:https://www.python.org/downloads/mac-osx/
[11]:https://www.python.org/downloads/windows
[12]:http://ninja-ide.org/
[13]:https://opensource.com/article/17/8/doc-driven-development
[14]:https://www.pygame.org/news
[15]:https://opensource.com/users/seth
[16]:https://opensource.com/users/seth
[17]:https://opensource.com/article/17/10/python-101#comments
