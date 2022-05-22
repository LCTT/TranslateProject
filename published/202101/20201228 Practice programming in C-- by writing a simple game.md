[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12985-1.html)
[#]: subject: (Practice programming in C++ by writing a simple game)
[#]: via: (https://opensource.com/article/20/12/learn-c-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

编写一个简单的游戏来练习用 C++ 编程
======

> C++ 语言很复杂，但它可以教会你很多关于数据类型、内存管理和代码链接的知识。

![](https://img.linux.net.cn/data/attachment/album/202101/05/110821dwzztxchazhto8ko.jpg)

学习一门编程语言有几种方法。如果你是编码新手，你通常会学习一些基本的计算机编码概念，并尝试应用它们。如果你已经知道如何用另一种语言进行编码，你可以重新学习编码概念在新语言中是如何表达的。

不管是哪种情况，学习这些新原理的便捷方法是创建一个简单的猜谜游戏。这会迫使你了解一门语言如何接收输入和发送输出，如何比较数据，如何控制程序的流程，以及如何利用条件来影响结果。它还确保你知道一门语言是如何组织其代码的；例如，Lua 或 [Bash][2] 可以很容易地作为脚本运行，而 [Java][3] 则需要你创建一个类。

在本文中，我将演示如何用 [C++][4] 在终端上实现猜谜游戏。

### 安装依赖关系

要跟上本文的步伐，你需要 C++ 和一个编译器。

在 Linux 上，你可以通过从你的发行版软件仓库中安装 Qt Creator IDE 来获得你所需要的一切。

在 Fedora、CentOS 或 RHEL 上：

```
$ sudo dnf install qt-creator
```

在 Debian、Ubuntu、Chromebook 或类似的系统上：

```
$ sudo apt install qtcreator
```

本文并没有使用 Qt Creator IDE，但它是一个安装你所需要的一切的简单方法，对于复杂的 C++ 项目（包括那些带有 GUI 的项目），它是一个必不可少的工具。在 macOS 或 Windows 上，按照 Qt 网站上的[安装说明][5]进行安装。

### 设置包含和命名空间

C++ 的核心语言是精简的。即使是一个简单的应用程序也需要使用额外的库。这个应用程序使用 [iostream][6] 来获得对 `cout` 和 `cin` 关键字的访问。

另外，确保程序使用 `std` 命名空间：

```
#include <iostream>

using namespace std;
```

这并不是绝对必要，但如果不将命名空间设置为 `std`，所有来自 `iostream` 库的关键字都需要一个命名空间前缀。例如，我不能写作 `cout`，而是要写作 `std::cout`。

C++ 中的语句以分号结束。

### 创建一个函数

每个 C++ 应用程序至少需要一个函数。一个 C++ 应用程序的主函数必须称为 `main`，它必须返回一个整数（`int`），这符合 [POSIX][7] 的期望，即一个进程在成功时返回 0，而在失败时返回其他值。你可以通过为它提供返回类型和名称来创建一个新函数。

```
int main() {
 // code goes here
}
```

### 实现程序逻辑

游戏代码必须首先产生一个随机数供玩家猜测。在 C++ 中，你可以通过建立一个用于生成伪随机数的*种子*来实现。一个简单的种子就是当前的时间。一旦有了种子，你就可以得到一个在 1 和 100 之间的数字。通过调用 `rand` 函数，并设置上限值 100 来产生一个从 0 到 99 的随机数，所以无论选择了什么数字都要加 1，并将结果分配给一个名为 `number` 的变量。你还必须声明一个变量来保存玩家的猜测值。为了清楚起见，我称这个变量为 `guess`。

这个示例代码还包括一个调试语句，告诉你随机数到底是什么。这对于猜测游戏来说不是很好，但它使测试速度快了很多。以后，你可以删除这一行，或者直接在行前面用 `//` 注释出来：

```
 srand (time(NULL));
 int number = rand() % 100+1;
 int guess = 0;

 cout << number << endl; //debug
```

### 增加 do-while 和 if 语句

C++ 中的 `do-while` 语句以关键字 `do` 开头，并将你希望 C++ 做的所有事情用括号括起来。用 `while` 关键字结束语句，后面是必须满足的条件（括号内）：

```
do {
 // code here
} while ( number != guess );
```

游戏代码出现在 `if`、`else if` 和 `else` 语句之间，为玩家提供提示。

首先，用 `cout` 语句提示玩家猜测。`cout` 函数将输出打印到 `stdout` 上。因为 `cout` 语句没有连着 `endl`（endline）函数，所以没有换行。紧接着这个 `cout` 语句，通过使用 `cin` 函数告诉 C++ 等待输入。正如你所猜测的那样，`cin` 等待来自 `stdin` 的输入。

接下来，程序进入 `if` 控制语句。如果玩家的猜测大于 `number` 变量中包含的伪随机数，那么程序就会打印出一个提示，后面是一个换行符。这就中断了 `if` 语句，但 C++ 仍然被困在 `do-while` 循环中，因为它的条件（`number` 变量等于 `guess`）还没有满足。

如果玩家的猜测小于 `number` 变量中包含的伪随机数，那么程序就会打印出一个提示，后面是一个换行符。这再次中断了 `if` 语句，但程序仍然被困在 `do-while` 循环中。

当 `guess` 等于 `number` 时，最终满足关键条件，触发 `else` 语句，`do-while` 循环结束，程序结束：

```
do {
  cout << "Guess a number between 1 and 100: ";
  cin >> guess;

  if ( guess > number) { cout << "Too high.\n" << endl; }
  else if ( guess < number ) { cout << "Too low.\n" << endl; }
  else {
    cout << "That's right!\n" << endl;
    exit(0);
  } // fi
 } while ( number != guess );
return 0;
} // main
```

### 构建代码和玩游戏

你可以用 GCC 构建你的应用程序：

```
$ g++ -o guess.bin guess.cpp
```

运行二进制文件试试：

```
$ ./guess.bin
74
Guess a number between 1 and 100: 76
Too high.

Guess a number between 1 and 100: 1
Too low.

Guess a number between 1 and 100: 74
That's right!
```

成功了！

### 试试 C++ 吧

C++ 语言很复杂。为终端编写 C++ 应用程序可以让你学到很多关于数据类型、内存管理和代码链接的知识。试着用 C++ 编写一个有用的实用程序，看看你能发现什么！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-c-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_question_B.png?itok=f88cyt00 (A bunch of question marks)
[2]: https://opensource.com/article/20/12/learn-bash
[3]: https://opensource.com/article/20/12/learn-java-writing-guess-number-game
[4]: https://www.cplusplus.com/
[5]: https://www.qt.io/product/development-tools
[6]: http://www.cplusplus.com/reference/iostream/
[7]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
