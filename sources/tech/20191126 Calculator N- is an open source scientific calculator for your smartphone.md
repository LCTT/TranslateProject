[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Calculator N+ is an open source scientific calculator for your smartphone)
[#]: via: (https://opensource.com/article/19/11/calculator-n-mobile)
[#]: author: (Ricardo Berlasso https://opensource.com/users/rgb-es)

Calculator N+ is an open source scientific calculator for your smartphone
======
The Android app does a wide range of advanced mathematical functions in
the palm of your hand.
![scientific calculator][1]

Mobile phones are becoming more powerful every day, so it is no surprise that they can beat most computers from the not-so-distant past. This also means the tools available on them are getting more powerful every day.

Previously, I wrote about [scientific calculators for the Linux desktop][2], and I'm following that up here with information about [Calculator N+][3], an awesome GPL v3.0-licensed computer algebra system (CAS) app for Android devices.

Calculator N+ is presented as a "powerful calculator for Android," but that's a humble statement; the app not only works with arbitrary precision, displaying results with roots and fractions in all their glory, it does a _lot_ more.

Finding polynomial roots? Check. Factorization? Check. Symbolic derivatives, integrals, and limits? Check. Number theory (modular arithmetic, combinatorics, prime factorization)? Check.

You can also solve systems of equations, simplify expressions (including trigonometric ones), convert units… you name it!

![Calculator N+ graphical interface][4]

Results are output in LaTeX. The menu in the top-left provides many powerful functions ready to use with a simple touch. Also in that menu, you'll find Help files for all of the app's functions. At the top-right of the screen, you can toggle between exact and decimal representation. Finally, tapping the blue bar at the bottom of the screen gives you access to the whole library of functions available in the app. But be careful! If you are not a mathematician, physicist, or engineer, such a long list may seem overwhelming.

All of this power comes from the [Symja library][5], another great GPL 3 project.

Both projects are under active development, and they are getting better with each version. In particular, version 3.4.6 of Calculator N+ gets a major leap in user interface (UI) quality. And yes, there are still some rough corners here and there, but taming this much power in the tiny UI of a smartphone is a difficult task, and I think the app developers are solving its remaining issues quite well. Kudos to them!

If you are a teacher, a student, or work on a STEM field, check out Calculator N+. It's free, no ads, open source, and covers all your math needs. (Except, of course, during math exams, where smartphones should never be allowed to prevent cheating.)

Calculator N+ is available in the [Google Play Store][6], or you can [build it from source code][7] using the instructions on the GitHub page.

If you know any other useful open source apps for science or engineering, let us know in the comments.

The app makes use of the sensors on your phone and offers a digital science notebook to record your...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/calculator-n-mobile

作者：[Ricardo Berlasso][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgb-es
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calculator_money_currency_financial_tool.jpg?itok=2QMa1y8c (scientific calculator)
[2]: https://opensource.com/article/18/1/scientific-calculators-linux
[3]: https://github.com/tranleduy2000/ncalc
[4]: https://opensource.com/sites/default/files/uploads/calculatornplus_sqrt-frac.png (Calculator N+ graphical interface)
[5]: https://github.com/axkr/symja_android_library
[6]: https://play.google.com/store/apps/details?id=com.duy.calculator.free
[7]: https://github.com/tranleduy2000/ncalc/blob/master/README.md
