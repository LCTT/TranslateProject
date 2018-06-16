Python Debugging Tips
======
When it comes to debugging, there’s a lot of choices that you can make. It is hard to give generic advice that always works (other than “Have you tried turning it off and back on?”).

Here are a few of my favorite Python Debugging tips.

### Make a branch

Trust me on this. Even if you never intend to commit the changes back upstream, you will be glad your experiments are contained within their own branch.

If nothing else, it makes cleanup a lot easier!

### Install pdb++

Seriously. It makes you life easier if you are on the command line.

All that pdb++ does is replace the standard pdb module with 100% PURE AWESOMENESS. Here’s what you get when you `pip install pdbpp`:

  * A Colorized prompt!
  * tab completion! (perfect for poking around!)
  * It slices! It dices!



Ok, maybe the last one is a little bit much… But in all seriousness, installing pdb++ is well worth your time.

### Poke around

Sometimes the best approach is to just mess around and see what happens. Put a break point in an “obvious” spot and make sure it gets hit. Pepper the code with `print()` and/or `logging.debug()` statements and see where the code execution goes.

Examine the arguments being passed into your functions. Check the versions of the libraries (if things are getting really desperate).

### Only change one thing at a time

Once you are poking around a bit you are going to get ideas on things you could do. But before you start slinging code, take a step back and think about what you could change, and then only change 1 thing.

Once you’ve made the change, then test and see if you are closer to resolving the issue. If not, change the thing back, and try something else.

Changing only one thing allows you to know what does and doesn’t work. Plus once you do get it working, your new commit is going to be much smaller (because there will be less changes).

This is pretty much what one does in the Scientific Process: only change one variable at a time. By allowing yourself to see and measure the results of one change you will save your sanity and arrive at a working solution faster.

### Assume nothing, ask questions

Occasionally a developer (not you of course!) will be in a hurry and whip out some questionable code. When you go through to debug this code you need to stop and make sure you understand what it is trying to accomplish.

Make no assumptions. Just because the code is in the `model.py` file doesn’t mean it won’t try to render some HTML.

Likewise, double check all of your external connections before you do anything destructive! Going to delete some configuration data? MAKE SURE YOU ARE NOT CONNECTED TO YOUR PRODUCTION SYSTEM.

### Be clever, but not too clever

Sometimes we write code that is so amazingly awesome it is not obvious how it does what it does.

While we might feel smart when we publish that code, more often than not we will wind up feeling dumb later on when the code breaks and we have to remember how it works to figure out why it isn’t working.

Keep an eye out for any sections of code that look either overly complicated and long, or extremely short. These could be places where complexity is hiding and causing your bugs.

--------------------------------------------------------------------------------

via: https://pythondebugging.com/articles/python-debugging-tips

作者：[PythonDebugging.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://pythondebugging.com
