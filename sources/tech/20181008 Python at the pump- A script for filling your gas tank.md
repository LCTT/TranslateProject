Python at the pump: A script for filling your gas tank
======
Here's how I used Python to discover a strategy for cost-effective fill-ups.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bulb-light-energy-power-idea.png?itok=zTEEmTZB)

I recently began driving a car that had traditionally used premium gas (93 octane). According to the maker, though, it requires only 91 octane. The thing is, in the US, you can buy only 87, 89, or 93 octane. Where I live, gas prices jump 30 cents per gallon jump from one grade to the next, so premium costs 60 cents more than regular. So why not try to save some money?

It’s easy enough to wait until the gas gauge shows that the tank is half full and then fill it with 89 octane, and there you have 91 octane. But it gets tricky to know what to do next—half a tank of 91 octane plus half a tank of 93 ends up being 92, and where do you go from there? You can make continuing calculations, but they get increasingly messy. This is where Python came into the picture.

I wanted to come up with a simple scheme in which I could fill the tank at some level with 93 octane, then at the same or some other level with 89 octane, with the primary goal to never get below 91 octane with the final mixture. What I needed to do was create some recurring calculation that uses the previous octane value for the preceding fill-up. I suppose there would be some polynomial equation that would solve this, but in Python, this sounds like a loop.

```
#!/usr/bin/env python
# octane.py

o = 93.0
newgas = 93.0   # this represents the octane of the last fillup
i = 1
while i < 21:                   # 20 iterations (trips to the pump)
    if newgas == 89.0:          # if the last fillup was with 89 octane
                                # switch to 93
        newgas = 93.0
        o = newgas/2 + o/2      # fill when gauge is 1/2 full
    else:                       # if it wasn't 89 octane, switch to that
        newgas = 89.0
        o = newgas/2 + o/2      # fill when gauge says 1/2 full
    print str(i) + ': '+ str(o)
    i += 1
```

As you can see, I am initializing the variable o (the current octane mixture in the tank) and the variable newgas (what I last filled the tank with) at the same value of 93. The loop then will repeat 20 times, for 20 fill-ups, switching from 89 octane and 93 octane for every other trip to the station.

```
1: 91.0
2: 92.0
3: 90.5
4: 91.75
5: 90.375
6: 91.6875
7: 90.34375
8: 91.671875
9: 90.3359375
10: 91.66796875
11: 90.333984375
12: 91.6669921875
13: 90.3334960938
14: 91.6667480469
15: 90.3333740234
16: 91.6666870117
17: 90.3333435059
18: 91.6666717529
19: 90.3333358765
20: 91.6666679382
```

This shows is that I probably need only 10 or 15 loops to see stabilization. It also shows that soon enough, I undershoot my 91 octane target. It’s also interesting to see this stabilization of the alternating mixture values, and it turns out this happens with any scheme where you choose the same amounts each time. In fact, it is true even if the amount of the fill-up is different for 89 and 93 octane.

So at this point, I began playing with fractions, reasoning that I would probably need a bigger 93 octane fill-up than the 89 fill-up. I also didn’t want to make frequent trips to the gas station. What I ended up with (which seemed pretty good to me) was to wait until the tank was about 7⁄12 full and fill it with 89 octane, then wait until it was ¼ full and fill it with 93 octane.

Here is what the changes in the loop look like:

```
    if newgas == 89.0:            
                                 
        newgas = 93.0
        o = 3*newgas/4 + o/4      
    else:                        
        newgas = 89.0
        o = 5*newgas/12 + 7*o/12
```

Here are the numbers, starting with the tenth fill-up:

```
10: 92.5122272978
11: 91.0487992571
12: 92.5121998143
13: 91.048783225
14: 92.5121958062
15: 91.048780887
```

As you can see, this keeps the final octane very slightly above 91 all the time. Of course, my gas gauge isn’t marked in twelfths, but 7⁄12 is slightly less than 5⁄8, and I can handle that.

An alternative simple solution might have been run the tank to empty and fill with 93 octane, then next time only half-fill it for 89—and perhaps this will be my default plan. Personally, I’m not a fan of running the tank all the way down since this isn’t always convenient. On the other hand, it could easily work on a long trip. And sometimes I buy gas because of a sudden drop in prices. So in the end, this scheme is one of a series of options that I can consider.

The most important thing for Python users: Don’t code while driving!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/python-gas-pump

作者：[Greg Pittman][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
