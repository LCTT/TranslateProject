[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 open source speed-reading applications)
[#]: via: (https://opensource.com/article/19/8/speed-reading-open-source)
[#]: author: (Jaouhari Youssef https://opensource.com/users/jaouhari)

5 open source speed-reading applications
======
Train yourself to read text faster with these five apps.
![stack of books][1]

English essayist and politician [Joseph Addison][2] once said, "Reading is to the mind what exercise is to the body." Today, most (if not all) of us are training our brains by reading text on computer monitors, television screens, mobile devices, street signs, newspapers, magazines, and papers at work or school.

Given the large amount of written information we take in each day, it seems advantageous to train our brains to read faster by doing specific exercises that challenge our classical reading habits and teach us to absorb more content and data. The goal of learning these skills is not just to skim text, because reading without comprehension is wasted effort. The goal is to increase your reading speed while still achieving high levels of comprehension.

### Reading and processing input

Before diving into the topic of speed reading, let's examine the reading process. According to French ophthalmologist Louis Emile Javal, reading is a three-step process:

  1. Fixate
  2. Process
  3. [Saccade][3]



In step one, we determine a fixation point in the text, called the optimal recognition point. In the second step, we bring in (process) new information while the eye is fixated. Finally, we change the location of our fixation point, an operation called saccade, a time when no new information is acquired.

In practice, the main differences among faster readers are a shorter-than-average fixation period, a longer-distance saccade, and less re-reading.

### Reading exercise

Reading is not a natural process for human beings, as it is a fairly recent development in the span of human existence. The first writing system was created around 5,000 years ago, not long enough for people to develop into reading machines. Therefore, we have to exercise our reading skills to become more adept and efficient at this basic task of communication.

The first exercise consists of reducing subvocalization, mainly known as silent speech, which is the habit of pronouncing words internally while reading them. It is a natural process that slows down reading, as reading speed is limited to the speed of speech. The key to reducing subvocalization is to say only some of the words that are read. One way to do this is to occupy the internal voice with another task, chewing gum, for example.

A second exercise consists of reducing regression, or re-reading text. Regression is a mechanism of laziness because our brains can re-read any material at any time, thus reducing concentration.

### 5 open source applications to train your brain

There are several interesting open-source applications that you can use to exercise your reading speed.

One is [Gritz][4], an open source file reader that makes words pop up, one at a time, to reduce regression. It works on Linux, Windows, and MacOS and is released under the GPL, so you can play with it however you want.

Other options include [Spray Speed-Reader][5], an open source speed-reading application written in JavaScript, and [Sprits-it!][6], an open source web application that enables speed-reading of web pages.

For Android users, [Comfort Reader][7] is an open source speed-reading app. It is available in the [F-droid][8] and [Google Play][9] app stores.

My favorite application is [Speedread][10], a simple terminal program that shows text files word-by-word at the optimal reading point. To install it, clone the GitHub repository on your device and type in the appropriate command to read a document at your preferred word-per-minute (WPM) rate. The default rate is 250 WPM. For example, to read _your_text_file.txt_ at 400 WPM, you would enter:


```
`cat your_text_file.txt | ./speedread -w 400`
```

Here is the program in action:

![Speedread demo][11]

Since you probably don't read just [plain text][12] files these days, you can use [Pandoc][13] to convert files from markup format to text format. You can also run Speedread on Android devices using [Termux][14], an Android terminal simulator.

### Other solutions

An interesting project for the open source community is to build a solution that is intended only for enhancing reading speed using specific exercises to improve things like subvocalization and regression reduction. I believe this project would be very beneficial, as increasing reading speed is very valuable in today's information-rich environment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/speed-reading-open-source

作者：[Jaouhari Youssef][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jaouhari
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_stack_library_reading.jpg?itok=uulcS8Sw (stack of books)
[2]: https://en.wikipedia.org/wiki/Joseph_Addison
[3]: https://en.wikipedia.org/wiki/Saccade
[4]: https://github.com/jeffkowalski/gritz
[5]: https://github.com/chaimpeck/spray
[6]: https://github.com/the-happy-hippo/sprits-it
[7]: https://github.com/mschlauch/comfortreader
[8]: https://f-droid.org/packages/com.mschlauch.comfortreader/
[9]: https://play.google.com/store/apps/details?id=com.mschlauch.comfortreader
[10]: https://github.com/pasky/speedread
[11]: https://opensource.com/sites/default/files/uploads/speedread_demo.gif (Speedread demo)
[12]: https://plaintextproject.online/
[13]: https://opensource.com/article/18/9/intro-pandoc
[14]: https://termux.com/
