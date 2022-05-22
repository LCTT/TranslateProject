[#]: subject: (How different programming languages do the same thing)
[#]: via: (https://opensource.com/article/21/4/compare-programming-languages)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (VeryZZJ)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How different programming languages do the same thing
======
Compare 13 different programming languages by writing a simple game.
![Developing code.][1]

Whenever I start learning a new programming language, I focus on defining variables, writing a statement, and evaluating expressions. Once I have a general understanding of those concepts, I can usually figure out the rest on my own. Most programming languages have some similarities, so once you know one programming language, learning the next one is a matter of figuring out the unique details and recognizing the differences.

To help me practice a new programming language, I like to write a few test programs. One sample program I often write is a simple "guess the number" game, where the computer picks a number between one and 100 and asks me to guess it. The program loops until I guess correctly. This is a very simple program, as you can see using pseudocode like this:

* The computer picks a random number between 1 and 100
* Loop until I guess the random number
    + The computer reads my guess
    + It tells me if my guess is too low or too high

Recently, Opensource.com ran an article series that wrote this program in different languages. This was an interesting opportunity to compare how to do the same thing in each language. I also found that most programming languages do things similarly, so learning the next programming language is mostly about learning its differences.

C is an early general-purpose programming language, created in 1972 at Bell Labs by Dennis Ritchie. C proved popular and quickly became a standard programming language on Unix systems. Because of its popularity, many other programming languages adopted a similar programming syntax. That's why learning C++, Rust, Java, Groovy, JavaScript, awk, or Lua is easier if you already know how to program in C.

For example, look at how these different programming languages implement the major steps in the "guess the number" game. I'll skip some of the surrounding code, such as assigning temporary variables, to focus on how the basics are similar or different.

### The computer picks a random number between one and 100

You can see a lot of similarities here. Most of the programming languages generate a random number with a function like `rand()` that you can put into a range on your own. Other languages use a special function where you can specify the range for the random value.

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

### Loop until I guess the random number

Loops are usually done with a flow-control block such as `while` or `do-while`. The JavaScript implementation doesn't use a loop and instead updates the HTML page "live" until the user guesses the correct number. Awk supports loops, but it doesn't make sense to loop to read input because awk is based around data pipelines, so it reads input from a file instead of directly from the user. 

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

### The computer reads my guess

Different programming languages handle input differently. So there's some variation here. For example, JavaScript reads values directly from an HTML form, and awk reads data from its data pipeline.

C
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

### Tell me if my guess is too low or too high

Comparisons are fairly consistent across these C-like programming languages, usually through an `if` statement. There's some variation in how each programming language prints output, but the print statement remains recognizable across each sample.

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

### What about non-C-based languages?

Programming languages that are not based on C can be quite different and require learning specific syntax to do each step. Racket derives from Lisp and Scheme, so it uses Lisp's prefix notation and lots of parentheses. Python uses whitespace rather than brackets to indicate blocks like loops. Elixir is a functional programming language with its own syntax. Bash is based on the Bourne shell from Unix systems, which itself borrows from Algol68—and supports additional shorthand notation such as `&&` as a variation of "and." Fortran was created when code was entered using punched cards, so it relies on an 80-column layout where some columns are significant.

As an example of how these other programming languages can differ, I'll compare just the "if" statement that sees if one value is less than or greater than another and prints an appropriate message to the user.

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

### Read more

This "guess the number" game is a great introductory program when learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts and compare each language's details.

Learn how to write the "guess the number" game in C and C-like languages:

* [C][2], by Jim Hall
* [C++][3], by Seth Kenlon
* [Rust][4], by Moshe Zadka
* [Java][5], by Seth Kenlon
* [Groovy][6], by Chris Hermansen
* [JavaScript][7], by Mandy Kendall
* [awk][8], by Chris Hermansen
* [Lua][9], by Seth Kenlon

And in non-C-based languages:

* [Racket][10], by Cristiano L. Fontana
* [Python][11], by Moshe Zadka
* [Elixir][12], by Moshe Zadka
* [Bash][13], by Jim Hall
* [Fortran][14], by Jim Hall

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/compare-programming-languages

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 (Developing code.)
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
