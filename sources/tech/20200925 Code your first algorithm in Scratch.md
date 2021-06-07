[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Code your first algorithm in Scratch)
[#]: via: (https://opensource.com/article/20/9/scratch)
[#]: author: (Jess Weichler https://opensource.com/users/cyanide-cupcake)

Code your first algorithm in Scratch
======
Learn how to get started with Scratch in this article in a series about
teaching kids to code.
![The back of a kid head][1]

With more kids learning from home this year, it's important to engage them with unique learning opportunities. The classroom looks very different than it did before, and it's going to continue to evolve. So should the lessons we teach.

In the [first article][2] in this series, I shared how my students taught me to code. Over the next few weeks, I will be exploring how educators and parents can harness the power of coding to teach kids a wide variety of skills.

"But I don't know anything about coding!" you may be shouting at your computer. That's one of the beauties of open source code: everyone is a learner, and everyone is a teacher. Whether you're new to coding or you've been doing it all your life, part of the process is making mistakes. It's all about problem-solving and learning how to find information. The greatest tool an educator has in a coding classroom is the phrase, "I don't know; let's find out together!"

So, let's begin!

### What is code?

Code is how you get a computer to do what you want it to do. Laptops, smartphones, video-game consoles, and even washing machines use code to work. And despite advancements in machine learning and AI, somebody has to write that code.

Coders (also known as programmers) are the people who write code. But what is code, really? What exactly are programmers writing when they create software or fine-tune hardware?

Code is made up of _algorithms_: highly structured and ordered lists of instructions, much like a recipe. Because computers aren't actually smart, these instructions are written in _code_ that must be parsed and compiled and transformed into _machine language_. Only then can computers perform the actions that programmers dictate. The key is to learn the syntax of the code so you can write words in the required order so that computers can decipher and process them.

### What is Scratch?

[Scratch][3] is a great platform for kids learning to code. It is a visual programming language designed for ages 8 and up. It uses drag-and-drop blocks that snap together to create animations, quizzes, and video games. Traditional coding requires a lot of typing without making any spelling errors, and the visual nature of Scratch makes it easy for young writers to learn to code without getting bogged down with spelling errors.

Scratch is not just about coding, though. It also encourages an open online community by empowering users to share and remix projects. There's also an offline version available for classrooms and households with limited internet connectivity.

### Learn the lingo

Even if a child has used Scratch before, this lesson is important for ensuring they understand coding terminology and logic.

![Scratch interface][4]

(Jess Weichler, [CC BY-SA 4.0][5])

Using Scratch, you can create video games using **code blocks** that snap together to form a script. A **script** is an ordered list of instructions, like a recipe. Another word for "script" is **algorithm**.

A **sprite** is a character or object in the game. The **stage** is the background of the game. Scripts can be used to control sprites and the stage.

Every script starts with a special code block called an **event hat**. These blocks have rounded tops. An event hat waits for something to happen before running all the code blocks underneath it.

Scratch follows scripts exactly, so you must be specific when telling it what to do.

### Get coding

Try the following challenges to get started on your coding journey.

#### Challenge #1: Create a simple algorithm to move a sprite right when you press the right arrow key.

Did your algorithm work as you expected? Does your sprite move right when the right arrow is pressed? How did you do it?

When coding, there are often multiple solutions to a problem. Here are two of the most common ways you may have coded the sprite to move when the right arrow is pressed:

![Possibility One: When right arrow pressed, move 10 steps . Possibility Two: When right arrow pressed, change x by 10.][6]

(Jess Weichler, [CC BY-SA 4.0][5])

Let's experiment.

  * What happens if you change the number?
  * What happens when your sprite reaches the edge of the screen?
  * What motion code block could prevent the sprite from disappearing when it reaches the edge?



![Possibility One: When right arrow pressed, move 15 steps, if on edge, bounce. Possibility Two: When right arrow pressed, change x by 15, if on edge, bounce][7]

(Jess Weichler, [CC BY-SA 4.0][5])

Now what happens? How can you solve it?

To stop the sprite from flipping upside-down after hitting an edge: select the sprite and click **Direction**. Select the **Left/Right** icon or the **Do Not Rotate** icon.

![Scratch code][8]

(Jess Weichler, [CC BY-SA 4.0][5])

Errors in code, such as this, are called **bugs**. Bugs are a normal part of coding.

Fixing code is called **debugging**.

Test your game again. Do you notice any more bugs?

  * If your sprite is bouncing off the right side of the screen, you are ready for the next challenge.
  * If, when your sprite touches the right side of the screen, it starts moving left when you press the right arrow, add one more code block to the algorithm.



![Possibility One: When right arrow pressed, point in direction 90, move 15 steps, if on edge, bounce. Possibility Two: No change][9]

(Jess Weichler, [CC BY-SA 4.0][5])

#### Challenge #2: Make the sprite move left when you press the left arrow.

You have all the skills and knowledge you need to ace this challenge! How will you complete it?

[Click here for my solution][10].

If you're using a screen reader, or you prefer text, select this spoiler text to reveal the answer:

**Possibility One:** When right arrow pressed, point in direction 90, move 15 steps, if on edge, bounce
When left arrow pressed, point in direction -90, move 15 steps, if on edge, bounce

**Possibility Two:** When right arrow pressed, change x by 15, if on edge, bounce
When left arrow pressed, change x by -15, if on edge, bounce

When you're happy with what you've made, name and save your project. Do not select "save as" or "save a copy," as this will create a duplicate project. Just click **Save** or **Save Now**.

Congratulations, you've created your first two algorithms!

### Don't stop here

Coding is all about experimenting and iterating until you get the desired result. This is one of many reasons I love it as a teaching tool. And don't stop with just this introductory lesson.

Pose a problem and try to solve it with Scratch. For instance, can you make a game in which the Scratch cat finds an object and "eats" it? Look through the available blocks and formulate a plan, then construct a script.

Most importantly, don't give up, and remember, there's no wrong answer! It's all about creativity, being inventive, and having fun.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/scratch

作者：[Jess Weichler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cyanide-cupcake
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_kid_education.png?itok=3lRp6gFa (The back of a kid head)
[2]: https://opensource.com/article/20/9/how-my-students-taught-me-code
[3]: https://scratch.mit.edu/
[4]: https://opensource.com/sites/default/files/uploads/codekids2_1_interface.png (Scratch interface)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/codekids2_2_code.png (Scratch code)
[7]: https://opensource.com/sites/default/files/uploads/codekids2_3_code.png (Scratch code)
[8]: https://opensource.com/sites/default/files/uploads/codekids2_4_code.png (Scratch code)
[9]: https://opensource.com/sites/default/files/uploads/codekids2_5_code.png (Scratch code)
[10]: https://opensource.com/sites/default/files/scratch3-left-right_answer.png
