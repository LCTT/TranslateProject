[#]: subject: "How different programming languages do the same thing"
[#]: via: "https://opensource.com/article/21/4/compare-programming-languages"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "VeryZZJ"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
不同编程语言是如何完成同一件事
======

通过一个简单的小游戏比较13种编程语言
![Developing code.][1]

当我开始学习一种新的编程语言时，会把重点放在定义变量、书写声明以及计算表达式，一旦对这些概念有一个大致的了解，通常就能够自己弄清剩下的部分。大多数编程语言都具有相似性，所以如果你掌握了一种编程语言，学习下一种语言的重点就是弄清楚独有的概念以及区分不同。

我喜欢写一些测试程序来帮助练习新的编程语言。其中我经常写的是一个叫做“猜数字”的小游戏，计算机选出1到100里的任一数字，然后我来猜。程序循环进行，直到猜出正确数字。通过伪代码可以看出，这是个非常简单的程序：

* 计算机在1到100之间选出一个随机数字
* 循环进行直到猜出该随机数字
  + 计算机读取我的猜测
  + 告诉我我的猜测过高还是过低

Opensource.com 最近发表了一篇文章，用不同的语言写这个程序。这是一个比较不同语言做同样事情的有趣机会。大多数编程语言具有相似性，所以当你在学习下一种新的编程语言时，主要是学习它的独特之处。

C 语言由 Dennis Ritchie 于1972年在贝尔实验室创建，是一种早期的通用编程语言。C 语言非常受欢迎，并迅速成为 Unix 系统上的标准编程语言。正是因为它的流行，许多其他编程语言也采用了类似的编程语法。这就是为什么如果你已经知道如何使用 C 语言编程，学习 C++、Rust、Java、Groovy、JavaScript、awk 或 Lua 会更容易。

接下来我们看看这些不同的编程语言是如何实现 "猜数字 "游戏的主要步骤。我将把重点放在基本元素的相似或不同，跳过一些外围代码，如分配临时变量。

### 计算机在1到100之间选出一个随机数字

你可以看到这里有许多相似之处。大多数编程语言使用类似`rand()` 的函数，你可以设定一个范围来生成随机数。而其他一些语言使用一个特殊的函数来设定范围生成随机数。

C

```c
// Using the Linux `getrandom` system call
getrandom(&randval, sizeof(int), GRND_NONBLOCK);
number = randval % maxval + 1;

// Using the standard C library
number = rand() % 100 + 1;
```

C++

```cpp
int number = rand() % 100+1;
```

Rust

```rust
let random = rng.gen_range(1..101);
```

Java

```java
private static final int NUMBER = r.nextInt(100) + 1;
```

Groovy

```groovy
int randomNumber = (new Random()).nextInt(100) + 1
```

JavaScript

```javascript
const randomNumber = Math.floor(Math.random() * 100) + 1
```

awk

```awk
randomNumber = int(rand() * 100) + 1
```

Lua

```lua
number = math.random(1,100)
```

### 循环进行直到我猜出该随机数字

循环通常是用控制流程来实现的，如`while` 或`do-while`。JavaScript 中的实现没有使用循环，而是 "实时 "更新 HTML 页面，直到用户猜出正确的数字。Awk 虽然支持循环，但是通过循环读取输入信息是没有意义的，因为 awk 是基于数据管道的，所以它从文件而不是直接从用户读取输入信息。 

C

```c
do {
    …
} while (guess != number);
```

C++

```cpp
do {
    …
} while ( number != guess );
```

Rust

```rust
for line in std::io::stdin().lock().lines() {
    …
    break;
}
```

Java

```java
while ( guess != NUMBER ) {
    …
}
```

Groovy

```groovy
while ( … ) {
    …
    break;
}
```

Lua

```lua
while ( player.guess ~= number ) do
    …
end
```

### 计算机读取我的猜测

不同编程语言对输入的处理方式不同。例如，JavaScript 直接从 HTML 表单中读取数值，而 awk 则从数据管道中读取数据。

```c
scanf("%d", &guess);
```

C++

```cpp
cin >> guess;
```

Rust

```rust
let parsed = line.ok().as_deref().map(str::parse::<i64>);
if let Some(Ok(guess)) = parsed {
    …
}
```

Java

```java
guess = player.nextInt();
```

Groovy

```groovy
response = reader.readLine()
int guess = response as Integer
```

JavaScript

```javascript
let myGuess = guess.value
```

awk

```awk
guess = int($0)
```

Lua

```lua
player.answer = io.read()
player.guess = tonumber(player.answer)
```

### 告诉我我的猜测过高还是过低

在这些类 C 语言中，通常是通过`if`语句进行比较的。每种编程语言打印输出的方式有一些变化，但打印语句在每个样本中都是可识别的。

C

```c
if (guess < number) {
    puts("Too low");
}
else if (guess > number) {
    puts("Too high");
}
…
puts("That's right!");
```

C++

```cpp
if ( guess > number) { cout << "Too high.\n" << endl; }
else if ( guess < number ) { cout << "Too low.\n" << endl; }
else {
    cout << "That's right!\n" << endl;
    exit(0);
}
```

Rust

```rust
_ if guess < random => println!("Too low"),
_ if guess > random => println!("Too high"),
_ => {
    println!("That's right");
    break;
}
```

Java

```java
if ( guess > NUMBER ) {
    System.out.println("Too high");
} else if ( guess < NUMBER ) {
    System.out.println("Too low");
} else {
    System.out.println("That's right!");
    System.exit(0);
}
```

Groovy

```groovy
if (guess < randomNumber)
    print 'too low, try again: '
else if (guess > randomNumber)
    print 'too high, try again: '
else {
    println "that's right"
    break
}
```

JavaScript

```javascript
if (myGuess === randomNumber) {
    feedback.textContent = "You got it right!"
} else if (myGuess > randomNumber) {
    feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
} else if (myGuess < randomNumber) {
    feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
}
```

awk

```awk
if (guess < randomNumber) {
    printf "too low, try again:"
} else if (guess > randomNumber) {
    printf "too high, try again:"
} else {
    printf "that's right\n"
    exit
}
```

Lua

```lua
if ( player.guess > number ) then
    print("Too high")
elseif ( player.guess < number) then
    print("Too low")
else
    print("That's right!")
    os.exit()
end
```

### 非类 C 编程语言会怎么样呢？

非类 C 编程语言会有很大的不同，需要学习特定的语法来完成每一步。Racket 源于 Lisp 和 Scheme，所以它使用 Lisp 的前缀符和大量括号。Python 使用空格而不是括号来表示循环之类的块。Elixir 是一种函数式编程语言，有自己的语法。Bash 是基于 Unix 系统中的 Bourne shell，它本身借鉴了 Algol68，并支持额外的速记符，如`&&`作为 "and " 的变体。Fortran 是在使用打孔卡片输入代码的时期创建的，所以它依赖于一些重要列的80-列布局。

我将通过比较 "if "语句，举例表现这些编程语言的不同。if 判断一个值是否小于或大于另一个值，并向用户打印适当信息。

Racket

```racket
(cond [(> number guess) (displayln "Too low") (inquire-user number)]
    [(< number guess) (displayln "Too high") (inquire-user number)]
    [else (displayln "Correct!")]))
```

Python

```python
if guess < random:
    print("Too low")
elif guess > random:
    print("Too high")
else:
    print("That's right!")
```

Elixir

```elixir
cond do
    guess < num ->
        IO.puts "Too low!"
        guess_loop(num)
    guess > num ->
        IO.puts "Too high!"
        guess_loop(num)
    true ->
        IO.puts "That's right!"
end
```

Bash

```bash
[ "0$guess" -lt $number ] && echo "Too low"
[ "0$guess" -gt $number ] && echo "Too high" 
```

Fortran

```fortran
IF (GUESS.LT.NUMBER) THEN
    PRINT *, 'TOO LOW'
ELSE IF (GUESS.GT.NUMBER) THEN
    PRINT *, 'TOO HIGH'
ENDIF 
```

### Read more 更多

当你在学习一种新的编程语言时"猜数字 "游戏是一个很友好的入门程序，通过一种简单的方式练习了几个常见的编程概念。通过不同编程语言实现这个简单游戏，你可以理解一些核心概念和每种语言的细节。

学习如何用 C 和类 C 语言编写 "猜数字 "游戏：

* [C][2], by Jim Hall
* [C++][3], by Seth Kenlon
* [Rust][4], by Moshe Zadka
* [Java][5], by Seth Kenlon
* [Groovy][6], by Chris Hermansen
* [JavaScript][7], by Mandy Kendall
* [awk][8], by Chris Hermansen
* [Lua][9], by Seth Kenlon

其他语言：

* [Racket][10], by Cristiano L. Fontana
* [Python][11], by Moshe Zadka
* [Elixir][12], by Moshe Zadka
* [Bash][13], by Jim Hall
* [Fortran][14], by Jim Hall

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/compare-programming-languages

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[VeryZZJ](https://github.com/VeryZZJ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 "Developing code."
[2]: https://opensource.com/article/21/1/learn-c
[3]: https://opensource.com/article/20/12/learn-c-game
[4]: https://opensource.com/article/20/12/learn-rust
[5]: https://opensource.com/article/20/12/learn-java
[6]: https://opensource.com/article/20/12/groovy
[7]: https://opensource.com/article/21/1/learn-javascript
[8]: https://opensource.com/article/21/1/learn-awk
[9]: https://opensource.com/article/20/12/lua-guess-number-game
[10]: https://opensource.com/article/21/1/racket-guess-number
[11]: https://opensource.com/article/20/12/learn-python
[12]: https://opensource.com/article/20/12/elixir
[13]: https://opensource.com/article/20/12/learn-bash
[14]: https://opensource.com/article/21/1/fortran
