[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sugarizer: The Taste of Sugar on Any Device)
[#]: via: (https://opensourceforu.com/2019/10/sugarizer-the-taste-of-sugar-on-any-device/)
[#]: author: (Dr Anil Seth https://opensourceforu.com/author/anil-seth/)

Sugarizer: The Taste of Sugar on Any Device
======

[![][1]][2]

_Sugar is a learning platform that was initially developed for the OLPC project. The Sugar Learning Environment can be downloaded and installed on any Linux-compatible hardware. Sugarizer mimics the UI of Sugar using HTML5 and CSS3._

The One Laptop Per Child (OLPC) project was launched less than 12 years ago. The goal of bringing down the cost of a laptop to US$ 100 was never really achieved. The project also did not turn out to be as much of a success as anticipated. However, the goal was not really about the laptop, but to educate as many children as possible.
The interactive learning environment of the OLPC project was equally critical. This became a separate project under Sugar Labs, [_https://wiki.sugarlabs.org/_][3], and continues to be active. The Sugar Learning Environment is available as a Fedora spin, and can be downloaded and installed on any Linux-compatible hardware. It would be a good option to install it on an old system, which could then be donated. The US$ 90 Pinebook, [_https://www.pine64.org/,_][4] with Sugar installed on it would also make a memorable and useful gift.
The Sugar Environment can happily coexist with other desktop environments on Linux. So, the computer does not have to be dedicated to Sugar. On Fedora, you may add it to your existing desktop as follows:

```
$ sudo dnf group install ‘Sugar Desktop Environment’
```

I have not tried it on Ubuntu. However, the following command should work:

```
$ sudo apt install sucrose
```

However, Sugar remains, by and large, an unknown entity. This is especially disappointing considering that the need to _learn to learn_ has never been greater.
Hence, the release of Sugarizer is a pleasant surprise. It allows you to use the Sugar environment on any device, with the help of Web technologies. Sugarizer mimics the UI of Sugar using HTML5 and CSS3. It runs activities that have been written in HTML5/JavaScript. The current release includes a number of Sugar activities written initially in Python, which have been ported to HTML5/JavaScript.
You may try the new release at _sugarizer.org_. Better still, install it from Google Play on your Android tablet or from App Store on an Apple device. It works well even on a two-year-old, low-end tablet. Hence, you may easily put your old tablet to good use by gifting it to a child after installing Sugarizer on it. In this way, you could even rationalise your desire to buy the replacement tablet you have been eyeing.

**Does it work?**
My children are too old and grandchildren too young. Reason tells me that it should work. Experience also tells me that it will most likely NOT improve school grades. I did not like school. I was bored most of the time. If I was studying in today’s schools, I would have had ulcers or a nervous breakdown!
When I think of schools, I recall the frustration of a child long ago (just 20 years) who got an answer wrong. The book and the teacher said that a mouse has two buttons. The mouse he used at home had three!
So, can you risk leaving the education of children you care about to the schools? Think about the skills you may be using today. Could these have been taught at schools a mere five years ago?
I never took JavaScript seriously and never made an effort to learn it. Today, I see Sugarizer and Snap! (a clone of Scratch in JavaScript) and am acutely aware of my foolishness. However, having learnt programming outside the classroom, I am confident that I can learn to program in JavaScript, should the need arise.
The intention at the start was to write about the activities in Sugarizer and, maybe, explore the source code. My favourite activities include TamTam, Turtle Blocks, Maze, etc. From the food chain activity, I discovered that some animals that I had believed to be carnivores, were not. I have also seen children get excited by the Speak activity.
However, once I started writing after the heading ‘Does it work?’, my mind took a radical turn. Now, I am convinced that Sugarizer will work only if you try it out.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/sugarizer-the-taste-of-sugar-on-any-device/

作者：[Dr Anil Seth][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/anil-seth/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Technology-Development-in-Computers-Innovation-eLearning-1.jpg?resize=696%2C696&ssl=1 (Technology Development in Computers (Innovation), eLearning)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Technology-Development-in-Computers-Innovation-eLearning-1.jpg?fit=900%2C900&ssl=1
[3]: https://wiki.sugarlabs.org/
[4]: https://www.pine64.org/,
