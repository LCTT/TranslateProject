[#]: collector: (lujun9972)
[#]: translator: (qfzy1233 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn C by writing a simple game)
[#]: via: (https://opensource.com/article/21/1/learn-c)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

通过编写一个简单的游戏学习C语言
======
当你学习一门新的编程语言时，这个“猜数字”游戏是一个很好的入门程序。下面是如何用C语言来编写它。
![Business woman on laptop sitting in front of window][1]

我在小学时就开始 [自学编程][2] 。 我的第一个程序是在Apple II上编写的，但最终，我通过阅读和编程练习来学习C语言。练习编程的最佳方法是编写示例程序，他能帮助你练习新知识。

在我学习一种新的编程语言时，我喜欢编写一个简单的“猜数字”游戏来练习。电脑从1到100中随机挑选一个数字，你必须通过猜测来算出来。在另一篇文章中，我展示了如何用 Bash 语言编写这个[“猜数字”游戏][3]，我的 Opensource.com 的同伴同事也写了一些文章，介绍如何用[Java][4]、[Julia][5]和其他计算机语言编写它。

“猜数字”游戏的伟大之处在于它践行了几个编程概念:如何使用变量、如何比较值、如何打印输出以及如何读取输入。

整个夏天，我录制了[一个系列视频][6]，教人们如何用[C语言][7]编写程序。从那以后，我收到了许多通过学习C语言的订阅观众的来信。所以，我想接着用 C 语言写一个“猜数字”的游戏。

### 去取一个随机数

从写一个函数来选择一个随机数字来开始“猜数字”游戏。在编写函数时，优秀的程序员会尽量使它们具有灵活性，这样他们就可以重用它们来解决略有不同的问题。因此，与其硬编码函数来选择1到100之间的一个随机数，不如编写函数来选择1到某个整数' maxval '之间的一个随机数:开始“猜数字”游戏，写一个函数来选择一个随机数字。在编写函数时，优秀的程序员会尽量使它们具有灵活性，这样他们就可以重用它们来解决略有不同的问题。因此，与其硬编码函数来选择1到100之间的一个随机数，不如编写函数来选择1到某个整数' maxval '之间的一个随机数:


```
#include &lt;stdio.h&gt;
#include &lt;sys/random.h&gt;

int
randnum(int maxval)
{
  /* 从 1 到 maxval 之前取一个随机数 */

  int randval;

  getrandom(&amp;randval, sizeof(int), GRND_NONBLOCK);

  /* 可能是负值，所以要确保改数值为正值 */

  if (randval &lt; 0) {
    return (-1 * randval % maxval + 1);
  }
  else {
    return (randval % maxval + 1);
  }
}
```

该函数使用 Linux 系统调用 `getrandom` 来生成一系列随机数。你可以在 man 中了解关于这个系统调用的更多信息，但请注意，`getrandom` 将用随机的0和1填充变量。这意味着最终值可以是正的，也可以是负的，因此您需要在之后进行测试，以确保 `randnum` 函数的结果是正值。

### 编写程序

你可以用这个函数来写你的“猜数字”程序:


```
#include &lt;stdio.h&gt;
#include &lt;sys/random.h&gt;
 
int
randnum(int maxval)
{
  ...
}

int
main(void)
{
  int number;
  int guess;

  number = randnum(100);

  [puts][8]("Guess a number between 1 and 100");

  do {
    [scanf][9]("%d", &amp;guess);

    if (guess &lt; number) {
      [puts][8]("Too low");
    }
    else if (guess &gt; number) {
      [puts][8]("Too high");
    }
  } while (guess != number);

  [puts][8]("That's right!");

  return 0;
}
```

程序首先使用 `randnum` 函数从1到100之间选择一个随机数。在向用户输出一个提示后，程序进入一个 `do-while` 循环，以便用户可以猜测数字。

在循环的每次迭代中，程序测试用户的猜测的数值。如果用户的猜测小于随机数，程序将输出“太低”，如果猜测大于随机数，程序将输出“太高”。循环继续，直到用户的猜测与随机数相同。

当循环退出时，程序输出“That's right!”，然后立即结束。


```
$ gcc -o guess -Wall guess.c

$ ./guess
Guess a number between 1 and 100
50
Too high
30
Too low
40
Too low
45
Too high
42
Too low
43
Too low
44
That's right!
```

### 尝试动手

在学习一门新的编程语言时，这个“猜数字”游戏是一个很好的入门程序，因为它以一种非常直接的方式练习了几个常见的编程概念。通过用不同的编程语言实现这个简单的游戏，您可以演示一些核心概念，并比较每种语言的细节。

你有最喜欢的编程语言吗?你怎么用该语言编写“猜数字”游戏?跟随本系列文章，查看您可能感兴趣的其他编程语言的示例。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/learn-c

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/8/learn-open-source
[3]: https://opensource.com/article/20/12/learn-bash
[4]: https://opensource.com/article/20/12/learn-java
[5]: https://opensource.com/article/20/12/julia
[6]: https://opensource.com/article/20/8/teaching-c
[7]: https://opensource.com/article/20/8/c-programming-cheat-sheet
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/scanf.html
