[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I still love tcsh after all these years)
[#]: via: (https://opensource.com/article/20/8/tcsh)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why I still love tcsh after all these years
======
Bash may be more popular, but tcsh has advantages that make it more
appealing in certain cases.
![Person programming on a laptop on a building][1]

I consider myself a happy [Bash][2] user. However, when I started exploring Unix, it was on a proprietary Unix system that provided [tcsh][3] by default, so my earliest shell experiences were on a modern version of the C shell (csh). That turned out to be a fortunate accident because tcsh was also the shell of choice at the film studio where I worked later in my career.

To this day, there are several tasks I associate with tcsh, even though there's no logical correlation there. I still use tcsh on at least one system, if only to stay in practice. I also keep it installed on all my systems to maintain compatibility with my own tcsh scripts and to ensure I can launch it when I need to write a script I prefer to have in tcsh.

### The difference between C shell and Bash

Tcsh is the modern continuation of csh. When the C shell was released way back in 1978, users were excited over its C-like syntax. C was a new programming language at the time, and more importantly, it was what Unix was written in, so most Unix users were more comfortable with C than an arbitrary scripting language. For instance, in Bash, this `if` loop makes a "secret" call to the `test` binary to evaluate the conditional statement (the part in brackets):


```
v=1

if [ $v -gt 0 ]
  then
  echo "verbose"
fi
```

Here's the same statement in csh or tcsh, without an external call to `test` because the conditional statement (the code in parentheses) uses csh's built-in evaluation:


```
set v=1

if ($v &gt; 1) then
  echo "verbose"
endif
```

This demonstrates a few things, both good and bad. For instance, it's natural for a C programmer to type a conditional in parentheses, and it's desirable from a programmer's perspective to have math evaluation built into the executable. On the other hand, the `if` loop syntax has more in common with Lua than C, which uses braces as delimiters:


```
// this does not work in Csh
if ( v&gt;1 ) {
        [printf][4]("verbose");
}
```

In a way, this nicely sums up csh: it's clean, efficient, and familiar for some, but quirky and inconsistent.

So why use it?

### Tcsh for precision

I write more C++ and [Java][5] than C code, so my interest in tcsh shares little with its historical claim to fame. However, I enjoy [Lua][6], and in a way, I think of tcsh and other shells like I think of Lua and Python or even Markdown and [Docbook][7]. Both shells have merit, and it's easy to point to the one that's more popular, but there's strict clarity to the other. In fact, I feel tcsh has a precision that many other shells lack.

### Variables

You don't get the luxury of typed variables in shells, but with tcsh, you can at least declare them with a keyword. Strangely, there are several keywords you can use for the task, but the one I settled on was `set`:


```
&gt; set var=foo
&gt; echo $var
foo
```

You can expand variables by typing the name of the variable (`var` in this example) and then pressing **Ctrl+X** followed by the **$** (dollar) key. The example above sets `var` to `foo`.

As with many other shells, you can list all set variables using `set` alone with no arguments:


```
&gt; set
term    xterm
tty     pts/2
uid     1000
user    seth
var     foo
[...]
```

You can unset a variable using the `unset` command:


```
&gt; unset var
&gt; set | grep var
&gt;
```

### Missing features is a feature

Maybe you've seen lines like this in a script:


```
var=GitLab
${var,,}
```

The second line is a built-in function to transform the contents of `var` into lowercase.

While extra functions like these are infinitely useful, I sometimes feel they're an invitation to obfuscation. Shell scripting is like the HTML of programming; it's one of the few serious languages you can teach yourself just by reading other people's code. That's not necessarily a great reason to give up useful functions, but it's the reason I try to avoid some of the cryptic shorthand popular in various languages. When writing in tcsh, I don't have the option to use as much shorthand, so complex string operations must be performed with basic Unix tools rather than by built-in shortcuts. I believe it results in code that's easier to read, and that makes a big difference to future contributors—and to future, forgetful _me_.

### Built-in math

One of the things I love about tcsh is its built-in **@** math shortcut. Like most self-taught Unix users, I stumbled upon [bc][8], and I've regretted it ever since. Through no fault of its own, bc is often taught to users as a command-line calculator when it's actually better suited as a calculation _language_. Workarounds include an amazing 300-line [calculator in pure Bash][9], or the **let** command in Bash, or the **@** command in tcsh.


```
&gt; @ n = ( 1 + 1 / 2 )
&gt; echo $n
1
```

For very complex math, it may be worth [learning bc][10] or a good [Python mathematics library][11].

### All the essentials

For me, tcsh strikes a perfect balance between stark simplicity and essential features. It's not a shell for all users, or even for all purposes, but if you're looking to simplify your view of your text-based world, tcsh might provide an interesting alternative.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/tcsh

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://opensource.com/resources/what-bash
[3]: https://github.com/tcsh-org/tcsh
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[5]: https://opensource.com/resources/java
[6]: https://opensource.com/article/20/2/lua-cheat-sheet
[7]: https://opensource.com/article/17/9/docbook
[8]: https://www.gnu.org/software/bc/
[9]: https://raw.githubusercontent.com/bluebat/.bash/master/bashbc.sh
[10]: https://opensource.com/article/20/7/bc
[11]: https://opensource.com/alternatives/matlab
