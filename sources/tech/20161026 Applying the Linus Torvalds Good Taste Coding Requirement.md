Translating by cposture 20161228
# Applying the Linus Torvalds “Good Taste” Coding Requirement

In [a recent interview with Linus Torvalds][1], the creator of Linux, at approximately 14:20 in the interview, he made a quick point about coding with “good taste”. Good taste? The interviewer prodded him for details and Linus came prepared with illustrations.

He presented a code snippet. But this wasn’t “good taste” code. This snippet was an example of poor taste in order to provide some initial contrast.

![](https://d262ilb51hltx0.cloudfront.net/max/1200/1*X2VgEA_IkLvsCS-X4iPY7g.png) 

It’s a function, written in C, that removes an object from a linked list. It contains 10 lines of code.

He called attention to the if-statement at the bottom. It was _this_ if-statement that he criticized.

I paused the video and studied the slide. I had recently written code very similar. Linus was effectively saying I had poor taste. I swallowed my pride and continued the video.

Linus explained to the audience, as I already knew, that when removing an object from a linked list, there are two cases to consider. If the object is at the start of the list there is a different process for its removal than if it is in the middle of the list. And this is the reason for the “poor taste” if-statement.

But if he admits it is necessary, then why is it so bad?

Next he revealed a second slide to the audience. This was his example of the same function, but written with “good taste”.

 ![](https://d262ilb51hltx0.cloudfront.net/max/1200/1*GHFLYFB3vDQeakMyUGPglw.png) 

The original 10 lines of code had now been reduced to 4.

But it wasn’t the line count that mattered. It was that if-statement. It’s gone. No longer needed. The code has been refactored so that, regardless of the object’s position in the list, the same process is applied to remove it.

Linus explained the new code, the elimination of the edge case, and that was it. The interview then moved on to the next topic.

I studied the code for a moment. Linus was right. The second slide _was_better. If this was a test to determine good taste from poor taste, I would have failed. The thought that it may be possible to eliminate that conditional statement had never occurred to me. And I had written it more than once, since I commonly work with linked lists.

What’s good about this illustration isn’t just that it teaches you a better way to remove an item from a linked list, but that it makes you consider that the code you’ve written, the little algorithms you’ve sprinkled throughout the program, may have room for improvement in ways you’ve never considered.

So this was my focus as I went back and reviewed the code in my most recent project. Perhaps it was serendipitous that it also happened to be written in C.

To the best of my ability to discern, the crux of the “good taste” requirement is the elimination of edge cases, which tend to reveal themselves as conditional statements. The fewer conditions you test for, the better your code “_tastes”_.

Here is one particular example of an improvement I made that I wanted to share.

Initializing Grid Edges

Below is an algorithm I wrote to initialize the points along the edge of a grid, which is represented as a multidimensional array: grid[rows][cols].

Again, the purpose of this code was to only initialize the values of the points that reside on the edge of the grid — so only the top row, bottom row, left column, and right column.

To accomplish this I initially looped over every point in the grid and used conditionals to test for the edges. This is what it looked like:

```Tr
for (r = 0; r < GRID_SIZE; ++r) {
    for (c = 0; c < GRID_SIZE; ++c) {
```

```
        // Top Edge
        if (r == 0)
            grid[r][c] = 0;
```

```
        // Left Edge
        if (c == 0)
            grid[r][c] = 0;
```

```
        // Right Edge
        if (c == GRID_SIZE - 1)
            grid[r][c] = 0;
```

```
        // Bottom Edge
        if (r == GRID_SIZE - 1)
            grid[r][c] = 0;
    }
}
```

Even though it works, in hindsight, there are some issues with this construct.

1.  Complexity — The use 4 conditional statements inside 2 embedded loops seems overly complex.
2.  Efficiency — Given that GRID_SIZE has a value of 64, this loop performs 4096 iterations in order to set values for only the 256 edge points.

Linus would probably agree, this is not very _tasty_.

So I did some tinkering with it. After a little bit I was able to reduce the complexity to only a single for_-_loop containing four conditionals. It was only a slight improvement in complexity, but a large improvement in performance, because it only performed 256 loop iterations, one for each point along the edge.

```
for (i = 0; i < GRID_SIZE * 4; ++i) {
```

```
    // Top Edge
    if (i < GRID_SIZE)
        grid[0][i] = 0;
```

```
    // Right Edge
    else if (i < GRID_SIZE * 2)
        grid[i - GRID_SIZE][GRID_SIZE - 1] = 0;
```

```
    // Left Edge
    else if (i < GRID_SIZE * 3)
        grid[i - (GRID_SIZE * 2)][0] = 0;
```

```
    // Bottom Edge
    else
        grid[GRID_SIZE - 1][i - (GRID_SIZE * 3)] = 0;
}
```

An improvement, yes. But it looked really ugly. It’s not exactly code that is easy to follow. Based on that alone, I wasn’t satisfied.

I continued to tinker. Could this really be improved further? In fact, the answer was _YES_. And what I eventually came up with was so astoundingly simple and elegant that I honestly couldn’t believe it took me this long to find it.

Below is the final version of the code. It has _one for-loop_ and _no conditionals_. Moreover, the loop only performs 64 iterations. It vastly improves both complexity and efficiency.

```
for (i = 0; i < GRID_SIZE; ++i) {
```

```
    // Top Edge
    grid[0][i] = 0;

    // Bottom Edge
    grid[GRID_SIZE - 1][i] = 0;
```

```
    // Left Edge
    grid[i][0] = 0;
```

```
    // Right Edge
    grid[i][GRID_SIZE - 1] = 0;
}
```

This code initializes four different edge points for each loop iteration. It’s not complex. It’s highly efficient. It’s easy to read. Compared to the original version, and even the second version, they are like night and day.

I was quite satisfied.


--------------------------------------------------------------------------------

via: https://medium.com/@bartobri/applying-the-linus-tarvolds-good-taste-coding-requirement-99749f37684a

作者：[Brian Barto][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@bartobri?source=post_header_lockup
[1]:https://www.ted.com/talks/linus_torvalds_the_mind_behind_linux
