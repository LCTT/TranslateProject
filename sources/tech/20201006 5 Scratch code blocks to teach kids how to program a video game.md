[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Scratch code blocks to teach kids how to program a video game)
[#]: via: (https://opensource.com/article/20/10/advanced-scratch)
[#]: author: (Jess Weichler https://opensource.com/users/cyanide-cupcake)

5 Scratch code blocks to teach kids how to program a video game
======
Advance your Scratch skills with loops, conditional statements,
collision detection, and more in this article in a series about teaching
kids to code.
![Binary code on a computer screen][1]

In the second article in this series, you [created your first few video game scripts in Scratch][2]. This article explores ways to expand programming's possibilities to create more advanced code.

There are multiple ways to introduce these skills to kids, such as:

  1. Introduce a task or challenge that requires children to use the skill. Use inquiry to help them find the solution, then reinforce their discoveries with a formal explanation.
  2. Encourage free experimentation by having children come up with their own projects. As they work through their code, go over skills as needed.
  3. Introduce the skill, then have children experiment with it.



No matter which one you choose, always remember that the most important part of learning coding is making mistakes. Even skilled programmers don't get it right every time or know every possible line of code. It works best when educators, pupils, and peers are all learning to code together as a team.

There are [10 categories][3] of code blocks in Scratch; here is how to use some of the most common.

### Loops

_This is the code that doesn't end; yes, it goes on and on, my friend!_ **Forever loops** and **repeat blocks** in [Scratch][4] are what you need to repeat lines of code automatically. Any code blocks placed inside a loop block continue to run until the game is stopped or, if you're using a repeat block, the number is reached.

![Loops in Scratch][5]

(Jess Weichler, [CC BY-SA 4.0][6])

### Conditional statements

**Conditional statements** run only if certain conditions are met. "If you're cold, then put on a sweater" is a real-world example of a conditional statement: you put a sweater on only if you determine that it's cold.

There are four conditional statement code blocks in Scratch:

  * if ... then 
  * if ... then ... else 
  * wait until... 
  * repeat until... 



Any code blocks placed inside a conditional statement run only if the condition is met.

![Conditional statement blocks in Scratch][7]

(Jess Weichler, [CC BY-SA 4.0][6])

Notice the diamond shapes in each conditional statement code block; can you find any code blocks that might fit inside?

Diamond-shaped code blocks can be used to complete any of the four conditional-statement blocks. You can find diamond-shaped blocks in the [Sensing][8] and [Operators][9] block categories.

![Diamond-shaped blocks in Scratch][10]

(Jess Weichler, [CC BY-SA 4.0][6])

### Collision-detection loop

Sometimes you may want to check to see if your sprite is touching another sprite or a specific color. To do so, use a [**collision-detection loop**][11].

A collision-detection loop combines loops and conditional statements to constantly check whether the sprite is touching another sprite (for example, a coin sprite).

![Collision-detection script in Scratch][12]

(Jess Weichler, [CC BY-SA 4.0][6])

Inside the inner `if ... then` block, place the action you want to happen when the condition is met.

This type of algorithm is a **collision-detection script**. Collision-detection scripts sense when two sprites or objects are touching. A basic collision-detection script uses four main code blocks:

  * Event hat
  * Forever loop
  * If … then
  * Touching



You can place more code blocks inside the `if ... then` block. These blocks will run only if the active sprite is touching the sprite listed in the `touching` block.

Can you figure out how to make an object "hide" when it collides with another sprite? This is a common technique to indicate that, for instance, a sprite has eaten some food or has picked up an item.

### Variables and math

A **variable** is a placeholder for a value, usually a number, that you don't know yet. In math, using a variable might look something like this: `x+12=15`.

![Variables in Scratch][13]

(Jess Weichler, [CC BY-SA 4.0][6])

If that doesn't make sense to you, that's okay. I didn't understand variables until I started coding as an adult.

Here is one example of how you might use a variable in code:

![Variables in Scratch][14]

(Jess Weichler, [CC BY-SA 4.0][6])

### Coordinates

Scratch uses a coordinate graph to measure the screen. The exact middle of the screen has a value of 0,0. The length of the screen (X-axis) is -240 to 240, the height (Y-axis) is -180 to 180.

The X and Y **coordinates** control where each sprite is on the screen, and you can code a sprite's X and Y coordinates to set a specific place using **[motion blocks][15]**.

![Coordinates in Scratch][16]

(Jess Weichler, [CC BY-SA 4.0][6])

### Put it all together

Think about the basics of any game; what are some elements you usually need?

Here are some examples:

  * A goal
  * A way to win
  * A way to lose
  * An obstacle
  * A scoring system



With the techniques above, you have everything you need to create a playable game with these elements and more.

There are still heaps of code blocks in Scratch that I haven't mentioned. Keep exploring the possibilities. If you don't know what a code block does, put it in a script to see what happens!

Coming up with an idea for a game can be difficult. The great thing about the open source community, Scratchers included, is that we love to build upon one another's work. With that in mind, in the next article, I'll look at some of my favorite user-made projects for inspiration.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/advanced-scratch

作者：[Jess Weichler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cyanide-cupcake
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/binary_code_computer_screen.png?itok=7IzHK1nn (Binary code on a computer screen)
[2]: https://opensource.com/article/20/9/scratch
[3]: https://en.scratch-wiki.info/wiki/Categories
[4]: https://scratch.mit.edu/
[5]: https://opensource.com/sites/default/files/uploads/codekids3_1.png (Loops in Scratch)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/codekids3_2.png (Conditional statement blocks in Scratch)
[8]: https://en.scratch-wiki.info/wiki/Blocks#Sensing_blocks
[9]: https://en.scratch-wiki.info/wiki/Blocks#Operators_blocks
[10]: https://opensource.com/sites/default/files/uploads/codekids3_3.png (Diamond-shaped blocks in Scratch)
[11]: https://en.scratch-wiki.info/wiki/Making_Sprites_Detect_and_Sense_Other_Sprites
[12]: https://opensource.com/sites/default/files/uploads/codekids3_4.png (Collision-detection script in Scratch)
[13]: https://opensource.com/sites/default/files/uploads/codekids3_5.png (Variables in Scratch)
[14]: https://opensource.com/sites/default/files/uploads/codekids3_6.png (Variables in Scratch)
[15]: https://en.scratch-wiki.info/wiki/Motion_Blocks
[16]: https://opensource.com/sites/default/files/uploads/codekids3_7.png (Coordinates in Scratch)
