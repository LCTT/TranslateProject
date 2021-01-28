[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I use the D programming language for scripting)
[#]: via: (https://opensource.com/article/21/1/d-scripting)
[#]: author: (Lawrence Aberba https://opensource.com/users/aberba)

Why I use the D programming language for scripting
======
The D programming language is best known as a system programming
language, but it's also a great option for scripting.
![Business woman on laptop sitting in front of window][1]

The D programming language is often advertised as a system programming language due to its static typing and metaprogramming capabilities. However, it's also a very productive scripting language.

Python is commonly chosen for scripting due to its flexibility for automating tasks and quickly prototyping ideas. This makes Python very appealing to sysadmins, [managers][2], and developers in general for automating recurring tasks that they might otherwise have to do manually.

It is reasonable to expect any other script-writing language to have these Python traits and capabilities. Here are two reasons why I believe D is a good option.

### 1\. D is easy to read and write

As a C-like language, D should be familiar to most programmers. Anyone who uses JavaScript, Java, PHP, or Python will know their way around D.

If you don't already have D installed, [install a D compiler][3] so that you can [run the D code][4] in this article. You may also use the [online D editor][5].

Here is an example of D code that reads words from a file named `words.txt` and prints them on the command line:


```
open
source
is
cool
```

Write the script in D:


```
// file print_words.d

#!/usr/bin/env rdmd

// import the D standard library
import std;

void main(){
    // open the file
     File("./words.txt")

         //iterate by line
        .byLine

        // print each number
        .each!writeln;
}
```

This code is prefixed with a [shebang][6] that will run the code using [rdmd][7], a tool that comes with the D compiler to compile and run code. Assuming you are running Unix or Linux, before you can run this script, you must make it executable by using the `chmod` command:


```
`chmod u+x print_words.d`
```

Now that the script is executable, you can run it:


```
`./print_words.d`
```

This should print the following on your command line:


```
open
source
is
cool
```

Congratulations! You've written your first D script. You can see how D enables you to chain functions in sequence to make reading the code feel natural, similar to how you think about problems in your mind. This [feature makes D my favorite programming language][8].

Try writing another script: A nonprofit manager has a text file of donations with each amount on separate lines. The manager wants to sum the first 10 donations and print the amounts:


```
// file sum_donations.d

#!/usr/bin/env rdmd

import std;

void main()
{
    double total = 0;

    // open the file
    File("monies.txt")

         // iterate by line
        .byLine

         // pick first 10 lines
        .take(10)

        // remove new line characters (\n)
        .map!(strip)

         // convert each to double
        .map!(to!double)

        // add element to total
        .tee!((x) { total += x; })

        // print each number
        .each!writeln;

    // print total
    writeln("total: ", total);
}
```

The `!` operator used with `each` is the syntax of a [template argument][9].

### 2\. D is great for quick prototyping

D is flexible for hammering code together really quickly and making it work. Its standard library is rich with utility functions for performing common tasks, such as manipulating data (JSON, CSV, text, etc.). It also comes with a rich set of generic algorithms for iterating, searching, comparing, and mutating data. These cleverly crafted algorithms are oriented towards processing sequences by defining generic [range-based interfaces][10].

The script above shows how chaining functions in D provides a gist of sequential processing and manipulating data. Another appeal of D is its growing ecosystem of third-party packages for performing common tasks. An example is how easy it is to build a simple web server using the [Vibe.d][11] web framework. Here's an example:


```
#!/usr/bin/env dub
/+ dub.sdl:
dependency "vibe-d" version="~&gt;0.8.0"
+/
void main()
{
    import vibe.d;
    listenHTTP(":8080", (req, res) {
        res.writeBody("Hello, World: " ~ req.path);
    });
    runApplication();
}
```

This uses the official D package manager, [Dub][12], to fetch the vibe.d web framework from the [D package repository][13]. Dub takes care of downloading the Vibe.d package, then compiling and spinning up a web server on localhost port 8080.

### Give D a try

These are only a couple of reasons why you might want to use D for writing scripts.

D is a great language for development. It's easy to install from the D download page, so download the compiler, take a look at the examples, and experience D for yourself.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/d-scripting

作者：[Lawrence Aberba][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aberba
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/3/automating-community-management-python
[3]: https://tour.dlang.org/tour/en/welcome/install-d-locally
[4]: https://tour.dlang.org/tour/en/welcome/run-d-program-locally
[5]: https://run.dlang.io/
[6]: https://en.wikipedia.org/wiki/Shebang_(Unix)
[7]: https://dlang.org/rdmd.html
[8]: https://opensource.com/article/20/7/d-programming
[9]: http://ddili.org/ders/d.en/templates.html
[10]: http://ddili.org/ders/d.en/ranges.html
[11]: https://vibed.org
[12]: https://dub.pm/getting_started
[13]: https://code.dlang.org
