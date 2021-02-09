[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (This Python script mimics Babbage's Difference Engine)
[#]: via: (https://opensource.com/article/20/10/babbages-python)
[#]: author: (Greg Pittman https://opensource.com/users/greg-p)

This Python script mimics Babbage's Difference Engine
======
Python once again takes on Charles Babbage's Difference Engine.
![Math formulas in green writing][1]

In [_Use this Python script to simulate Babbage's Difference Engine_][2], Python offered an alternative solution to Babbage's problem of determining the number of marbles in a two-dimensional pyramid. Babbage's [Difference Engine][3] solved this using a table showing the number of marble rows and the total number of marbles.

After some contemplation, [Charles Babbage][4]'s ghost replied, "This is all well and good, but here you only take the number of rows and give the number of marbles. With my table, I can also tell you how large a pyramid you might construct given a certain number of marbles; simply look it up in the table."

Python had to agree that this was indeed the case, yet it knew that surely this must be solvable as well. With little delay, Python came back with another short script. The solution involves thinking through the math in reverse.


```
`MarbNum = (N * (N + 1))/2`
```

Which I can begin to solve with:


```
`N * (N + 1) = MarbNum * 2`
```

From which an approximate solution might be:


```
`N = int(sqrt(MarbNum * 2))`
```

But the integer _N_ that solves this might be too large by one, so I need to test for this. In other words, the correct number of rows will either be _N_ or _N-1_. Here is the final script:


```
#!/usr/bin/env python
# babbage2.py
"""
Using Charles Babbage's conception of a marble-counting operation for a regular
pyramid of marbles, starting with one at the top with each successive row having
one more marble than the row above it.
Will give you the total number of rows possible for a pyramid, given a total number
of marbles available.
As a bonus, you also learn how many are left over.
"""
import math

MarbNum = input("Enter the number of marbles you have:  ")
MarbNum = int(MarbNum)

firstguess = int(math.sqrt(MarbNum*2))

if (firstguess * (firstguess + 1) &gt; MarbNum*2):
    correctNum = firstguess - 1
else:
    correctNum = firstguess

MarbRem = int(MarbNum - (correctNum * (correctNum + 1)/2))
# some grammatical fixes
if MarbRem == 0:
    MarbRem = "no"
 
if MarbRem == 1:
    marbleword = "marble"
else:
    marbleword = "marbles"
   
print ("You can have",correctNum, "rows, with",MarbRem, marbleword, "remaining.")
```

The output will look something like this:


```
Enter the number of marbles you have:  374865
You can have 865 rows, with 320 marbles remaining.
```

And Mr. Babbage's ghost was impressed. "Ah, your Python Engine is impressive indeed! Surely it might rival my [Analytical Engine][5], had I had the time to complete that project."

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/babbages-python

作者：[Greg Pittman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/edu_math_formulas.png?itok=B59mYTG3 (Math formulas in green writing)
[2]: https://opensource.com/article/20/9/babbages-python
[3]: https://en.wikipedia.org/wiki/Difference_engine
[4]: https://en.wikipedia.org/wiki/Charles_Babbage
[5]: https://en.wikipedia.org/wiki/Analytical_Engine
