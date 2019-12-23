What Did Ada Lovelace's Program Actually Do?
======
The story of Microsoft’s founding is one of the most famous episodes in computing history. In 1975, Paul Allen flew out to Albuquerque to demonstrate the BASIC interpreter that he and Bill Gates had written for the Altair microcomputer. Because neither of them had a working Altair, Allen and Gates tested their interpreter using an emulator that they wrote and ran on Harvard’s computer system. The emulator was based on nothing more than the published specifications for the Intel 8080 processor. When Allen finally ran their interpreter on a real Altair—in front of the person he and Gates hoped would buy their software—he had no idea if it would work. But it did. The next month, Allen and Gates officially founded their new company.

Over a century before Allen and Gates wrote their BASIC interpreter, Ada Lovelace wrote and published a computer program. She, too, wrote a program for a computer that had only been described to her. But her program, unlike the Microsoft BASIC interpreter, was never run, because the computer she was targeting was never built.

Lovelace’s program is often called the world’s first computer program. Not everyone agrees that it should be called that. Lovelace’s legacy, it turns out, is one of computing history’s most hotly debated subjects. Walter Isaacson has written that the dispute about the extent and merit of her contributions constitutes a “minor academic specialty.” Inevitably, the fact that Lovelace was a woman has made this dispute a charged one. Historians have cited all kinds of primary evidence to argue that the credit given to Lovelace is either appropriate or undeserved. But they seem to spend less time explaining the technical details of her published writing, which is unfortunate, because the technical details are the most fascinating part of the story. Who wouldn’t want to know exactly how a program written in 1843 was supposed to work?

In fairness, Lovelace’s program is not easy to explain to the layperson without some hand-waving. It’s the intricacies of her program, though, that make it so remarkable. Whether or not she ought to be known as “the first programmer,” her program was specified with a degree of rigor that far surpassed anything that came before. She thought carefully about how operations could be organized into groups that could be repeated, thereby inventing the loop. She realized how important it was to track the state of variables as they changed, introducing a notation to illustrate those changes. As a programmer myself, I’m startled to see how much of what Lovelace was doing resembles the experience of writing software today.

So let’s take a closer look at Lovelace’s program. She designed it to calculate the Bernoulli numbers. To understand what those are, we have to go back a couple millennia to the genesis of one of mathematics’ oldest problems.

### Sums of Powers

The Pythagoreans lived on the shores of the Mediterranean and worshiped numbers. One of their pastimes was making triangles out of pebbles.

![][1]

One pebble followed by a row of two pebbles makes a triangle containing three pebbles. Add another row of three pebbles and you get a triangle containing six pebbles. You can continue like this, each time adding a row with one more pebble in it than the previous row. A triangle with six rows contains 21 pebbles. But how many pebbles does a triangle with 423 rows contain?

What the Pythagoreans were looking for was a way to calculate the following without doing all the addition:

They eventually realized that, if you place two triangles of the same size up against each other so that they form a rectangle, you can find the area of the rectangle and divide by two to get the number of pebbles in each of the triangles:

![][2]

Archimedes later explored a similar problem. He was interested in the following series:

You might visualize this series by imagining a stack of progressively larger squares (made out of tiny cubes), one on top of the other, forming a pyramid. Archimedes wanted to know if there was an easy way to tell how many cubes would be needed to construct a pyramid with, say, 423 levels. He recorded a solution that also permits a geometrical interpretation.

Three pyramids can be fit together to form a rectangular prism with a tiny, one-cube-high extrusion at one end. That little extrusion happens to be a triangle that obeys the same rules that the Pythagoreans used to make their pebble triangles. ([This video][3] might be a more helpful explanation of what I mean.) So the volume of the whole shape is given by the following equation:

By substituting the Pythagorean equation for the sum of the first n integers and doing some algebra, you get this:

In 499, the Indian mathematician and astronomer, Aryabhata, published a work known as the Aryabhatiya, which included a formula for calculating the sum of cubes:

A formula for the sum of the first n positive integers raised to the fourth power wasn’t published for another 500 years.

You might be wondering at this point if there is a general method for finding the sum of the first n integers raised to the kth power. Mathematicians were wondering too. Johann Faulhaber, a German mathematician and slightly kooky numerologist, was able to calculate formulas for sums of integers up to the 17th power, which he published in 1631. But this may have taken him years and he did not state a general solution. Blaise Pascal finally outlined a general method in 1665, though it depended on first knowing how to calculate the sum of integers raised to every lesser power. To calculate the sum of the first n positive integers raised to the sixth power, for example, you would first have to know how to calculate the sum of the first n positive integers raised to the fifth power.

A more practical general solution was stated in the posthumously published work of Swiss mathematician Jakob Bernoulli, who died in 1705. Bernoulli began by deriving the formulas for calculating the sums of the first n positive integers to the first, second, and third powers. These he gave in polynomial form, so they looked like the below:

Using Pascal’s Triangle, Bernoulli realized that these polynomials followed a predictable pattern. Essentially, Bernoulli broke the coefficients of each term down into two factors, one of which he could determine using Pascal’s Triangle and the other which he could derive from the interesting property that all the coefficients in the polynomial seemed to always add to one. Figuring out the exponent that should be attached to each term was no problem, because that also followed a predictable pattern. The factor of each coefficient that had to be calculated using the sums-to-one rule formed a sequence that became known as the Bernoulli numbers.

Bernoulli’s discovery did not mean that it was now trivial to calculate the sum of the first positive n integers to any given power. In order to calculate the sum of the first positive n integers raised to the kth power, you would need to know every Bernoulli number up to the kth Bernoulli number. Each Bernoulli number could only be calculated if the previous Bernoulli numbers were known. But calculating a long series of Bernoulli numbers was significantly easier than deriving each sum of powers formula in turn, so Bernoulli’s discovery was a big advance for mathematics.

### Babbage

Charles Babbage was born in 1791, nearly a century after Bernoulli died. I’ve always had some vague idea that Babbage designed but did not build a mechanical computer. But I’ve never entirely understood how that computer was supposed to work. The basic ideas, as it happens, are not that difficult to grasp, which is good news. Lovelace’s program was designed to run on one of Babbage’s machines, so we need to take another quick detour here to talk about how those machines worked.

Babbage designed two separate mechanical computing machines. His first machine was called the Difference Engine. Before the invention of the pocket calculator, people relied on logarithmic tables to calculate the product of large numbers. (There is a good [Numberphile video][4] on how this was done.) Large logarithmic tables are not difficult to create, at least conceptually, but the sheer number of calculations that need to be done in order to create them meant that in Babbage’s time they often contained errors. Babbage, frustrated by this, sought to create a machine that could tabulate logarithms mechanically and therefore without error.

The Difference Engine was not a computer, because all it did was add and subtract. It took advantage of a method devised by the French mathematician Gaspard de Prony that broke the process of tabulating logarithms down into small steps. These small steps involved only addition and subtraction, meaning that a small army of people without any special mathematical aptitude or training could be employed to produce a table. De Prony’s method, known as the method of divided differences, could be used to tabulate any polynomial. Polynomials, in turn, could be used to approximate logarithmic and trigonometric functions.

To get a sense of how this process worked, consider the following simple polynomial function:

The method of divided differences involves finding the difference between each successive value of y for different values of x. The differences between these differences are then found, and possibly the differences between those next differences themselves, until a constant difference appears. These differences can then be used to get the next value of the polynomial simply by adding.

Because the above polynomial is only a second-degree polynomial, we are able to find the constant difference after only two columns of differences:

x y Diff 1 Diff 2 1 2 2 5 3 3 10 5 2 4 17 7 2 5 ? ? 2 … … … …

Now, since we know that the constant difference is 2, we can find the value of y when x is 5 through addition only. If we add 2 to 7, the last entry in the “Diff 1” column, we get 9. If we add 9 to 17, the last entry in the y column, we get 26, our answer.

Babbage’s Difference Engine had, for each difference column in a table like the one above, a physical column of gears. Each gear was a decimal digit and one whole column was a decimal number. The Difference Engine had eight columns of gears, so it could tabulate a polynomial up to the seventh degree. The columns were initially set with values matching an early row in the difference table, worked out ahead of time. A human operator would then turn a crank shaft, causing the constant difference to propagate through the machine as the value stored on each column was added to the next.

Babbage was able to build a small section of the Difference Engine and use it to demonstrate his ideas at parties. But even after spending an amount of public money equal to the cost of two large warships, he never built the entire machine. Babbage could not find anyone in the early 1800s that could make the number of gears he needed with sufficient accuracy. A working Difference Engine would not be built until the 1990s, after the advent of precision machining. There is [a great video on YouTube][5] demonstrating a working Difference Engine on loan to the Computer History Museum in Mountain View, which is worth watching even just to listen to the marvelous sounds the machine makes while it runs.

Babbage eventually lost interest in the Difference Engine when he realized that a much more powerful and flexible machine could be built. His Analytical Engine was the machine that we know today as Babbage’s mechanical computer. The Analytical Engine was based on the same columns of gears used in the Difference Engine, but whereas the Difference Engine only had eight columns, the Analytical Engine was supposed to have many hundreds more. The Analytical Engine could be programmed using punched cards like a Jacquard Loom and could multiply and divide as well as add and subtract. In order to perform one of these operations, a section of the machine called the “mill” would rearrange itself into the appropriate configuration, read the operands off of other columns used for data storage, and then write the result back to another column.

Babbage called his new machine the Analytical Engine because it was powerful enough to do something resembling mathematical analysis. The Difference Engine could tabulate a polynomial, but the Analytical Engine would be able to calculate, for example, the coefficients of the polynomial expansion of another expression. It was an amazing machine, but the British government wisely declined to fund its construction. So Babbage went abroad to Italy to try to drum up support for his idea.

### Notes by The Translator

In Turin, Babbage met Italian engineer and future prime minister Luigi Menabrea. He persuaded Menabrea to write an outline of what the Analytical Engine could accomplish. In 1842, Menabrea published a paper on the topic in French. The following year, Lovelace published a translation of Menabrea’s paper into English.

Lovelace, then known as Ada Byron, first met Babbage at a party in 1833, when she was 17 and he was 41. Lovelace was fascinated with Babbage’s Difference Engine. She could also understand how it worked, because she had been extensively tutored in mathematics throughout her childhood. Her mother, Annabella Milbanke, had decided that a solid grounding in mathematics would ward off the wild, romantic sensibility that possessed Lovelace’s father, Lord Byron, the famous poet. After meeting in 1833, Lovelace and Babbage remained a part of the same social circle and wrote to each other frequently.

Ada Byron married William King in 1835. King later became the Earl of Lovelace, making Ada the Countess of Lovelace. Even after having three children, she continued her education in mathematics, employing Augustus de Morgan, who discovered De Morgan’s laws, as her tutor. Lovelace saw the potential of Babbage’s Analytical Machine immediately and was eager to work with him to promote the idea. A friend suggested that she translate Menabrea’s paper for an English audience.

Menabrea’s paper gave a brief overview of how the Difference Engine worked, then showed how the Analytical Engine would be a far superior machine. The Analytical Engine would be so powerful that it could “form the product of two numbers, each containing twenty figures, in three minutes” (emphasis in the original). Menabrea gave further examples of the machine’s capabilities, demonstrating how it could solve a simple system of linear equations and expand the product of two binomial expressions. In both cases, Menabrea provided what Lovelace called “diagrams of development,” which listed the sequence of operations that would need to be performed to calculate the correct answer. These were programs in the same sense that Lovelace’s own program was a program and they were originally published the year before. But as we will see, Menabrea’s programs were only simple examples of what was possible. All of them were trivial in the sense that they did not require any kind of branching or looping.

Lovelace appended a series of notes to her translation of Menabrea’s paper that together ran much longer than the original work. It was here that she made her major contributions to computing. In Note A, which Lovelace attached to Menabrea’s initial description of the Analytical Engine, Lovelace explained at some length and often in lyrical language the promise of a machine that could perform arbitrary mathematical operations. She foresaw that a machine like the Analytical Engine wasn’t just limited to numbers and could in fact act on any objects “whose mutual fundamental relations could be expressed by those of the abstract science of operations, and which should be also susceptible of adaptations to the action of the operating notation and mechanism of the engine.” She added that the machine might one day, for example, compose music. This insight was all the more remarkable given that Menabrea saw the Analytical Engine primarily as a tool for automating “long and arid computation,” which would free up the intellectual capacities of brilliant scientists for more advanced thinking. The miraculous foresight that Lovelace demonstrated in Note A is one major reason that she is celebrated today.

The other famous note is Note G. Lovelace begins Note G by arguing that, despite its impressive powers, the Analytical Machine cannot really be said to “think.” This part of Note G is what Alan Turing would later refer to as “Lady Lovelace’s Objection.” Nevertheless, Lovelace continues, the machine can do extraordinary things. To illustrate its ability to handle even more complex problems, Lovelace provides her program calculating the Bernoulli numbers.

The full program, in the expanded “diagram of development” format that Lovelace explains in Note D, can be seen [here][6]. The program is essentially a list of operations, specified using the usual mathematical symbols. It doesn’t appear that Babbage or Lovelace got as far as developing anything like a set of op codes for the Analytical Engine.

Though Lovelace was describing a method for computing the entire sequence of Bernoulli numbers up to some limit, the program she provided only illustrated one step of that process. Her program calculated a number that she called B7, which modern mathematicians know as the eighth Bernoulli number. Her program thus sought to solve the following equation:

In the above, each term represents a coefficient in the polynomial formula for the sum of integers to a particular power. Here that power is eight, since the eighth Bernoulli number first appears in the formula for the sum of positive integers to the eighth power. The B and A numbers represent the two kinds of factors that Bernoulli discovered. B1 through B7 are all different Bernoulli numbers, indexed according to Lovelace’s indexing. A0 through A5 represent the factors of the coefficients that Bernoulli could calculate using Pascal’s Triangle. The values of A0, A1, A3, and A5 appear below. Here n represents the index of the Bernoulli number in the sequence of odd-numbered Bernoulli numbers starting with the first. Lovelace’s program used n = 4.

I’ve created a [translation][7] of Lovelace’s program into C, which may be easier to follow. Lovelace’s program first calculates A0 and the product B1A1. It then enters a loop that repeats twice to calculate B3A3 and B5A5, since those are formed according to an identical pattern. After each product is calculated, it is added with all the previous products, so that by the end of the program the full sum has been obtained.

Obviously the C translation is not an exact recreation of Lovelace’s program. It declares variables on the stack, for example, whereas Lovelace’s variables were more like registers. But it makes obvious the parts of Lovelace’s program that were so prescient. The C program contains two `while` loops, one nested inside the other. Lovelace’s program did not have `while` loops exactly, but she made groups of operations and in the text of her note specified when they should repeat. The variable `v10`, in the original program and in the C translation, functions as a counter variable that decrements with each loop, a construct any programmer would be familiar with. In fact, aside from the profusion of variables with unhelpful names, the C translation of Lovelace’s program doesn’t look that alien at all.

The other thing worth mentioning quickly is that translating Lovelace’s program into C was not that difficult, thanks to the detail present in her diagram. Unlike Menabrea’s tables, her table includes a column labeled “Indication of change in the value on any Variable,” which makes it much easier to follow the mutation of state throughout the program. She adds a superscript index here to each variable to indicate the successive values they hold. A superscript of two, for example, means that the value being used here is the second value that has been assigned to the variable since the beginning of the program.

### The First Programmer?

After I had translated Lovelace’s program into C, I was able to run it on my own computer. To my frustration, I kept getting the wrong result. After some debugging, I finally realized that the problem wasn’t the code that I had written. The bug was in the original!

In her “diagram of development,” Lovelace gives the fourth operation as `v5 / v4`. But the correct ordering here is `v4 / v5`. This may well have been a typesetting error and not an error in the program that Lovelace devised. All the same, this must be the oldest bug in computing. I marveled that, for ten minutes or so, unknowingly, I had wrestled with this first ever bug.

Jim Randall, another blogger that has [translated Lovelace’s program into Python][8], has noted this division bug and two other issues. What does it say about Ada Lovelace that her published program contains minor bugs? Perhaps it shows that she was attempting to write not just a demonstration but a real program. After all, can you really be writing anything more than toy programs if you aren’t also writing lots of bugs?

One Wikipedia article calls Lovelace the first to publish a “complex program.” Maybe that’s the right way to think about Lovelace’ accomplishment. Menabrea published “diagrams of development” in his paper a year before Lovelace published her translation. Babbage also wrote more than twenty programs that he never published. So it’s not quite accurate to say that Lovelace wrote or published the first program, though there’s always room to quibble about what exactly constitutes a “program.” Even so, Lovelace’s program was miles ahead of anything else that had been published before. The longest program that Menabrea presented was 11 operations long and contained no loops or branches; Lovelace’s program contains 25 operations and a nested loop (and thus branching). Menabrea wrote the following toward the end of his paper:

> When once the engine shall have been constructed, the difficulty will be reduced to the making of the cards; but as these are merely the translation of algebraic formulae, it will, by means of some simple notation, be easy to consign the execution of them to a workman.

Neither Babbage nor Menabrea were especially interested in applying the Analytical Engine to problems beyond the immediate mathematical challenges that first drove Babbage to construct calculating machines. Lovelace saw that the Analytical Engine was capable of much more than Babbage or Menabrea could imagine. Lovelace also grasped that “the making of the cards” would not be a mere afterthought and that it could be done well or done poorly. This is hard to appreciate without understanding her program from Note G and seeing for oneself the care she put into designing it. But having done that, you might agree that Lovelace, even if she was not the very first programmer, was the first programmer to deserve the title.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][9] on Twitter or subscribe to the [RSS feed][10] to make sure you know when a new post is out.


--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/08/18/ada-lovelace-note-g.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://twobithistory.org/images/triangular_numbers1.png
[2]: https://twobithistory.org/images/triangular_numbers2.png
[3]: https://www.youtube.com/watch?v=aXbT37IlyZQ
[4]: https://youtu.be/VRzH4xB0GdM
[5]: https://www.youtube.com/watch?v=BlbQsKpq3Ak
[6]: https://upload.wikimedia.org/wikipedia/commons/c/cf/Diagram_for_the_computation_of_Bernoulli_numbers.jpg
[7]: https://gist.github.com/sinclairtarget/ad18ac65d277e453da5f479d6ccfc20e
[8]: https://enigmaticcode.wordpress.com/tag/bernoulli-numbers/
[9]: https://twitter.com/TwoBitHistory
[10]: https://twobithistory.org/feed.xml
