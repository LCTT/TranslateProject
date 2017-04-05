From Node to Go: A High-Level Comparison
============================================================

At XO Group, we primarily work with Node and Ruby to build out our system of interconnected services. We get the implicit performance benefits of Node mixed with the access to a large, established repository of packages. We also have the ability to easily break out plugins and modules that can be published and reused across the company. This greatly increases developer efficiency and allows us to make scalable and reliable applications in a short amount of time. Furthermore, the large Node community makes it easy for our engineers to contribute open source software (see [BunnyBus][9] or [Felicity][10]).

Although a good portion of my college days and early career was spent using strict compiled languages, like C++ and C#, I eventually shifted to using Javascript. While I love the freedom and flexibility, I recently found myself nostalgic for static and structured languages. That’s when a coworker turned my attention to Go.

Coming from Javascript, there are some similarities between the two languages. Both are very fast, fairly easy to learn, have an expressive syntax, and a niche in the development community. There isn’t a perfect programming language and you should always choose a language that fits the project at hand; In this post, I will attempt to illustrate some of the key differences between the two languages at a high level and hopefully encourage anyone new to Go to give it a ̶g̶o̶ chance.


* * *

### General Differences

Before we dive into specifics, we should understand some important distinctions between the two languages.

Go, or Golang, is a free, open-source programming language created by Google in 2007\. It was designed to be fast and simple. Go is compiled down into machine code, which is where its speed is derived from. Debugging is fairly easy with a compiled language because you are able to catch a large chunk of errors early on. It is also a strongly typed language which helps with data integrity and finding type errors at compile time.

Javascript, on the other hand, is a loosely-typed language. Aside from the added burden of data validation and “truthy” evaluation pitfalls, using a loosely-typed language can can have its own benefits. There is no need for interfaces or generics and currying/flexible arity make functions extremely versatile. Javascript is interpreted at runtime, which can lead to issues with error handling and debugging. Node is a Javascript runtime built on Google’s V8 virtual machine making it a lightweight and fast platform for web development.

* * *

### Syntax

Coming from Javascript, Go’s simple and intuitive syntax was very inviting. Since both languages’ syntaxes are said to have evolved from C, there is quite a bit of overlap. Go is commonly referred to as an ‘easy language to learn.’ This is due to the developer-friendly tools, pared-down syntax, and opinionated conventions.

Go has a number of built-in features that make development a bit easier. The standard Go build tool lets you compile your code down into a binary file or executable with the go build command. Running tests with the built-in test suite are as simple as calling go test. Things like natively-supported concurrency are even available at the language level.

According to the [Go developers at Google][11], programming today is too complicated with too much “book keeping, repetition, and clerical work.” This is why the Go’s syntax was designed to be clean and simple in order to reduce clutter, increase efficiency, and improve readability. It also encourages developers to write explicit, easy to understand code. As a result, Go only has [25 unique keywords][12] and one type of loop (for-loop) as opposed to [~84 keywords][13] (reserved words, objects, properties, and methods) in Javascript.

In order to illustrate some syntactical differences and similarities, let’s look at a couple of examples:

*   Punctuation: Go strips out any superfluous punctuation in order to increase efficiency and readability. Although Javascript’s use of punctuation is somewhat minimal (see: [Lisp][1]) and often optional, I definitely enjoy the simplicity with Go.

```
// Javascript with parentheses and semicolons
for (var i = 0; i < 10; i++) {
    console.log(i);
}
```

Punctuation in Javascript

```
// Go uses minimal punctuation
for i := 0; i < 10; i++ {
    fmt.Println(i)
}
```
Punctuation in Go

*   Assignment: Since Go is strongly typed, you have access type inference on initialization with the := operator to reduce [stuttering][2], whereas Javascript declares types on runtime.


```
// Javascript assignment
var foo = "bar";
```

Assignment in Javascript

```
// Go assignment
var foo string //without type derivation
foo = "bar"

foo := "bar" //with type derivation
```

Assignment in Go</figcaption>

*   Exporting: In Javascript, you must explicitly export from a module. In Go, any capitalized functions will be exported.


```
const Bar = () => {};

module.exports = {
  Bar
}
```

Exporting in Javascript

```
// Go export
package foo //define package name
func Bar (s string) string {
    //Bar will be exported
}
```

Exporting in Go

*   Importing: The  _required_  library is necessary for importing dependencies/modules in Javascript, whereas Go utilizes the native import keyword with the import path to the package. Another distinction is that, unlike Node’s central NPM repository for packages, Go uses URLs for the import path on non-standard libraries in order to directly clone dependencies from their origin. Although this provides a simple and intuitive dependency management, versioning packages can be a bit more tedious in Go as opposed to updating the  _package.json_  file in Node.
```
// Javascript import
var foo = require('foo');
foo.bar();
```

Importing in Javascript


```
// Go import
import (
    "fmt" // part of Go’s standard library
    "github.com/foo/foo" // imported directly from repository
)
foo.Bar()
```

Importing in Go

*   Returns: Go’s multiple value returns allow for elegantly passing and handling values and errors, as well as reducing the improper passing of values by reference. In Javascript, multiple values must be returned by an array or object.

```
// Javascript - return multiple values
function foo() {
    return {a: 1, b: 2};
}
const { a, b } = foo();
```

Returns in Javascript

```
// Go - return multiple values
func foo() (int, int) {
    return 1, 2
}
a, b := foo()
```

Returns in Go


*   Errors: Go encourages catching errors often and where they occur as opposed to bubbling the error up in a callback in Node.

```
// Node error handling
foo('bar', function(err, data) {
    //handle error
}
```

Errors in Javascript


```
//Go error handling
foo, err := bar()
if err != nil {
    // handle error with defer, panic, recover, or log.fatal, etc...
}
```

Errors in Go

*   Variadic Functions: Both Go and Javascript support functions that accept a fluid number of arguments.

```
function foo (...args) {
    console.log(args.length);
}

foo(); // 0
foo(1, 2, 3); // 3
```

Variadic Function in Javascript

```
func foo (args ...int) {
    fmt.Println(len(args))
}

func main() {
    foo() // 0
    foo(1,2,3) // 3
}
```

Variadic Function in Go


* * *

### Communities

Although Go and Node have their differences when it comes to which programming paradigms they enable to be easier, they both have unique and supportive followings. One area where Node outshines Go is in the sheer size of their package library and community. Node package manager (NPM), the largest package registry in the world, has over [410,000 packages growing at an alarming rate of 555 new packages per day][14]. That number may seem staggering (and it is), however, something to keep in mind is that many of these packages are redundant and/or non-production quality. In contrast, Go has about 130,000 packages.

 ![](https://cdn-images-1.medium.com/max/800/0*0oUnVVKxuUrvVG3F.) 

Module Counts for Node and Go

Although Node and Go are around the same age, Javascript is more widely used — boasting a large development and open-source community. This is of course because Node was developed for the general public with a robust package manager from the start while Go was specifically built for Google. [The Spectrum ratings][15] below show the top web development languages based on current trends.

 ![](https://cdn-images-1.medium.com/max/800/0*o2SmnUo67xeaFbYZ.) 

Spectrum Ratings for top 7 web development programming languages

While Javascript’s popularity seems to have stayed relatively static over recent years, [Go has been trending up][16].


 ![](https://cdn-images-1.medium.com/max/800/0*zX5Yg3whLczpSif_.) 

Programming language trends

* * *

### Performance

What if your primary concern is speed? In this day and age, it seems performance optimizations are more important than ever. People don’t like to wait for information. In fact, [40% of users will abandon your site if it takes longer than 3 seconds to load][17].

Node is often touted as a highly performant because of it’s non-blocking asynchronous I/O. Also, as I mentioned before, Node is run on Google’s V8 engine which was optimized for dynamic languages. Go on the other hand was designed with speed in mind. [The developers at Google][18] achieved this by building “an expressive but lightweight type system; concurrency and garbage collection; rigid dependency specification; and so on.”

To compare the performance of Node and Go, I ran a couple of tests. These focus on the rudimentary, low-level abilities of the languages. If I had been testing something like HTTP requests or time-intensive processes, I would have used Go’s language-level concurrency tools (goroutines/channels). Instead, I stuck to basic features of each language (see [Concurrency in Three Flavors][19] for a deeper look into goroutines and channels).

I also included Python in the benchmarks so we feel good about the Node and Go results no matter what.

#### Loop/Arithmetic

Iterating through a billion items and adding them up:

```
var r = 0;
for (var c = 0; c < 1000000000; c++) {
    r += c;
}
```

Node

```
package main
func main() {
    var r int
    for c := 0; c < 1000000000; c++ {
        r += c
    }
}
```

go


```
sum(xrange(1000000000))
```

Python

 ![](https://cdn-images-1.medium.com/max/800/1*5u0Q9nmpkcsp2ltzmLO6CQ.png) 

Results

The clear loser here is Python clocking in at over 7 seconds. On the other hand, both Node and Go were extremely efficient, clocking in at 900 ms and 408 ms, respectively.

 _Edit: As some of the comments suggest, Python’s performance could be improved. The results have been updated to reflect those changes. Also, the use of PyPy greatly improves the performance. When run using Python 3.6.1 and PyPy 3.5.7, the performance improves to 1.234 seconds, but still falls short of Go and Node._ 

#### I/O

Iterating over 1 million numbers and writing them to a file:


```
var fs = require('fs');
var wstream = fs.createWriteStream('node');

for (var c = 0; c < 1000000; ++c) {
  wstream.write(c.toString());
}
wstream.end();
```

Node

```
package main

import (
    "io"
    "os"
    "strconv"
)

func main() {
    file, _ := os.Create("go")
    for c := 0; c < 1000000; c++ {
        num := strconv.Itoa(c)
        io.WriteString(file, num)
    }
    file.Close()
}
```

go

```
with open("python", "a") as text_file:
    for i in range(1000000):
        text_file.write(str(i))
```

Python

 ![](https://cdn-images-1.medium.com/max/800/1*NbASStIZewj4vh1RYxXqEQ.png) 

Results

Once again, Python is third at 7.94 seconds. The gap between Node and Go is small in this test, with Node taking about 1.164 seconds and Go taking 1.477 seconds (although this includes the time it takes for the Go code to compile via go run — the compiled binary shaves off another ~200 ms).

#### Bubble Sort

Iterating 10 million times over a 10-item array and sorting:

```
const toBeSorted = [1, 3, 2, 4, 8, 6, 7, 2, 3, 0];

function bubbleSort(input) {
    var n = input.length;
    var swapped = true;
    while (swapped) {
        swapped = false;
        for (var i = 0; i < n; i++) {
            if (input[i - 1] > input [i]) {
                [input[i], input[i - 1]] = [input[i - 1], input[i]];
                swapped = true;
            }
        }
    }
}

for (var c = 0; c < 10000000; c++) {
    bubbleSort(toBeSorted);
}
```

Node

```
package main

var toBeSorted [10]int = [10]int{1, 3, 2, 4, 8, 6, 7, 2, 3, 0}

func bubbleSort(input [10]int) {
    n := len(input)
    swapped := true
    for swapped {
        swapped = false
        for i := 1; i < n; i++ {
            if input[i-1] > input[i] {
                input[i], input[i-1] = input[i-1], input[i]
                swapped = true
            }
        }
    }
}

func main() {
    for c := 0; c < 10000000; c++ {
        bubbleSort(toBeSorted)
    }
}
```

go


```
toBeSorted = [1, 3, 2, 4, 8, 6, 7, 2, 3, 0]

def bubbleSort(input):
    length = len(input)
    swapped = True

    while swapped:
        swapped = False
        for i in range(1,length):
            if input[i - 1] > input[i]:
                input[i], input[i - 1] = input[i - 1], input[i]
                swapped = True
    
for i in range(10000000):
    bubbleSort(toBeSorted)
```
Python


 ![](https://cdn-images-1.medium.com/max/800/0*k9xE1bfJDWz4P19g.) 

<figcaption class="imageCaption" style="position: relative; left: 0px; width: 700px; top: 0px; margin-top: 10px; color: rgba(0, 0, 0, 0.6); outline: 0px; text-align: center; z-index: 300; --baseline-multiplier:0.157; font-family: medium-content-sans-serif-font, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, &quot;Lucida Sans&quot;, Geneva, Arial, sans-serif; font-feature-settings: 'liga' 1, 'lnum' 1; font-size: 14px; line-height: 1.4; letter-spacing: 0px;">Results</figcaption>

As usual, Python’s performance was the poorest, completing the task at hand in about 13 seconds. Go was able to finish the task over two times faster than Node.

#### Verdict

Go is the clear winner in all three tests, but Node, for the most part, performs admirably. And Python was there, too. To be clear, performance isn’t everything when choosing a programming language. If your application doesn’t need to process high amounts data, then the differences in performance between Node and Go may be negligible. For some additional comparisons on performance, see the following:

*   [Node Vs. Go][3]
*   [Multiple Language Performance Test][4]
*   [Benchmarks Game][5]


* * *

### Conclusion

This post is not to prove that one language is better than another. Every programming language has its place in the software development community for one reason or another. My intentions were to highlight the differences between Go and Node, as well as promote exposure to a new web development language. When choosing a language for a given project, there are a lot of different factors to consider including developer familiarity, cost, and practicality. I encourage a thorough low-level analysis when deciding what language is right for you.

As we have seen, there are several benefits to Go. The raw performance, simple syntax, and relatively shallow learning curve make it ideal for scalable and secure web applications. With it’s fast growth in adoption and community involvement, there is no reason Go can’t become a prominent player in modern web development. That being said, I believe that Node is moving in the right direction to remain a powerful and useful language if implemented correctly. It has a large following and active community that makes it a simple platform for getting a web application up and running in no time.

* * *

### Resources

If you are interested in learning more about Go, consider the following resources:

*   [Golang Website][6]
*   [Golang Wiki][7]
*   [Golang Subreddit][8]



--------------------------------------------------------------------------------

via: https://medium.com/xo-tech/from-node-to-go-a-high-level-comparison-56c8b717324a#.byltlz535

作者：[John Stamatakos][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@johnstamatakos?source=post_header_lockup
[1]:https://en.wikipedia.org/wiki/Lisp_%28programming_language%29
[2]:https://golang.org/doc/faq#principles
[3]:https://jaxbot.me/articles/node-vs-go-2014
[4]:https://hashnode.com/post/comparison-nodejs-php-c-go-python-and-ruby-cio352ydg000ym253frmfnt70
[5]:https://benchmarksgame.alioth.debian.org/u64q/compare.php?lang=go&lang2=node
[6]:https://golang.org/doc/#learning
[7]:https://github.com/golang/go/wiki/Learn
[8]:https://www.reddit.com/r/golang/
[9]:https://medium.com/xo-tech/bunnybus-building-a-data-transit-system-b9647f6283e5#.l64fdvfys
[10]:https://medium.com/xo-tech/introducing-felicity-7b6d0b734ce#.hmloiiyx8
[11]:https://golang.org/doc/faq
[12]:https://golang.org/ref/spec#Keywords
[13]:https://www.w3schools.com/js/js_reserved.asp
[14]:http://www.modulecounts.com/
[15]:http://spectrum.ieee.org/static/interactive-the-top-programming-languages-2016
[16]:http://www.tiobe.com/tiobe-index/
[17]:https://hostingfacts.com/internet-facts-stats-2016/
[18]:https://golang.org/doc/faq
[19]:https://medium.com/xo-tech/concurrency-in-three-flavors-51ed709876fb#.khvqrttxa
