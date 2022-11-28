[#]: subject: "Debugging by starting a REPL at a breakpoint is fun"
[#]: via: "https://jvns.ca/blog/2021/09/16/debugging-in-a-repl-is-fun/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Debugging by starting a REPL at a breakpoint is fun
======

Hello! I was talking to a Python programmer friend yesterday about debugging, and I mentioned that I really like debugging using a REPL. He said he’d never tried it and that it sounded fun, so I thought I’d write a quick post about it.

This debugging method doesn’t work in a lot of languages, but it does work in Python and Ruby and kiiiiiind of in C (via gdb).

### what’s a REPL?

REPL stands for “read eval print loop”. A REPL is a program that:

  1. reads some input from you like `print(f"2 + 2 = {2+2}")` (**read**)
  2. evaluates the input (**eval**)
  3. print out the result (**print**)
  4. and then goes back to step 1 (**loop**)



Here’s an example of me using the IPython REPL to run a print statement. (also it demonstrates f-strings, my favourite Python 3 feature)

```
$ ipython3
Python 3.9.5 (default, May 24 2021, 12:50:35)
Type 'copyright', 'credits' or 'license' for more information
IPython 7.24.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: print(f"2 + 2 = {2+2}")
2 + 2 = 4

In [2]:
```

### you can start a REPL at a breakpoint

There are 2 ways to use a REPL when debugging.

**Way 1**: Open an empty REPL (like IPython, pry, or a browser Javascript console) to test out something.

This is great but it’s not what I’m talking about in this post.

**Way 2**: Set a breakpoint in your program, and start a REPL at that breakpoint.

This is the one we’re going to be talking about. I like doing this because it gives me both:

  1. all the variables in scope at the breakpoint, so I can print them out interactively
  2. easy access to all the functions in my program, so I can call them to try to find issues



### how to get a REPL in Python: `ipdb.set_trace()`

Here’s a program called `test.py` that sets a breakpoint on line 5 using `import ipdb; ipdb.set_trace()`.

```
import requests

def make_request():
    result = requests.get("https://google.com")
    import ipdb; ipdb.set_trace()

make_request()
```

And here’s what it looks like when you run it: you get a REPL where you can inspect the `result` variable or do anything else you want.

```
python3 test.py
--Return--
None
> /home/bork/work/homepage/test.py(5)make_request()
      4     result = requests.get("https://google.com")
----> 5     import ipdb; ipdb.set_trace()
      6

ipdb> result.headers
{'Date': 'Thu, 16 Sep 2021 13:11:19 GMT', 'Expires': '-1', 'Cache-Control': 'private, max-age=0', 'Content-Type': 'text/html; charset=ISO-8859-1', 'P3P': 'CP="This is not a P3P policy! See g.co/p3phelp for more info."', 'Content-Encoding': 'gzip', 'Server': 'gws', 'X-XSS-Protection': '0', 'X-Frame-Options': 'SAMEORIGIN', 'Set-Cookie': '1P_JAR=2021-09-16-13; expires=Sat, 16-Oct-2021 13:11:19 GMT; path=/; domain=.google.com; Secure, NID=223=FXhKNT7mgxX7Fjhh6Z6uej9z13xYKdm9ZuAU540WDoIwYMj9AZzWTgjsVX-KJF6GErxfMijl-uudmjrJH1wgH3c1JjudPcmDMJovNuuAiJqukh1dAao_vUiqL8ge8pSIXRx89vAyYy3BDRrpJHbEF33Hbgt2ce4_yCZPtDyokMk; expires=Fri, 18-Mar-2022 13:11:19 GMT; path=/; domain=.google.com; HttpOnly', 'Alt-Svc': 'h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-T051=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"', 'Transfer-Encoding': 'chunked'}
```

You have to install `ipdb` to make this work, but I think it’s worth it – `import pdb; pdb.set_trace()` will work too (and is built into Python) but `ipdb` is much nicer. I just learned that you can also use `breakpoint()` in Python 3 to get a breakpoint, but that puts you in `pdb` too which I don’t like.

### how to get a REPL in Ruby: `binding.pry`

Here’s the same thing in Ruby – I wrote a `test.rb` program:

```
require 'net/http'
require 'pry'

def make_request()
  result = Net::HTTP.get_response('example.com', '/')
  binding.pry
end

make_request()
```

and here’s what it looks like when I run it:

```
$ ruby test.rb
From: /home/bork/work/homepage/test.rb:6 Object#make_request:

    4: def make_request()
    5:   result = Net::HTTP.get_response('example.com', '/')
 => 6:   binding.pry
    7: end

[1] pry(main)> result.code
=> "200"
```

### you can also do get a REPL in the middle of an HTTP request

Rails also lets you start a REPL in the middle of a HTTP request and poke around and see what’s happening. I assume you can do this in Flask and Django too – I’ve only really done this in Sinatra (in Ruby).

### GDB is sort of like a REPL for C

I was talking to another friend about REPLs, and we agreed that GDB is a little bit like a REPL for C.

Now, obviously this is sort of not true – C is a compiled language, and you can’t just type in arbitrary C expressions in GDB and have them work.

But you can do a surprising number of things like:

  * call functions
  * inspect structs if your program has debugging symbols (`p var->field->subfield`)



This stuff only works in gdb because the gdb developers put in a lot of work doing Very Weird Things to make it easier to get a REPL-like experience. I wrote a blog post a few years called [how does gdb call functions?][1] about how surprising it is that gdb can call functions, and how it does that.

This is the only way I use `gdb` when looking at C programs – I never set watchpoints or do anything fancy, I just set a couple of breakpoints in the program and then poke around at those points.

### where this method works

languages where this works:

  * Python
  * Ruby
  * probably PHP, but I don’t know
  * C, sort of, in a weird way (though you might disagree :))



languages where this doesn’t work:

  * most compiled languages
  * in Javascript, I think even though you can get a REPL with `node inspect` and `debugger`, the REPL doesn’t integrate well with async functions which makes it less useful. I don’t really understand this yet though. (python’s REPL also doesn’t let you use `await`, but it’s not as big of a deal because async programming in Python isn’t as core a part of the language as in JS)



### REPL debugging is easy for me to remember how to do

There are (at least) 4 different ways of debugging:

  1. Lots of print statements
  2. a debugger
  3. getting a REPL at a breakpoint
  4. inspect your program with external tools like strace



I think part of the reason I like this type of REPL debugging more than using a more traditional debugger is – it’s so easy to remember how to do it! I can just set a breakpoint, and then run code to try to figure out what’s wrong.

With debuggers, I always forget how to use the debugger (probably partly because I switch programming languages a lot) and I get confused about what features it has and how they work, so I never use it.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/09/16/debugging-in-a-repl-is-fun/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2018/01/04/how-does-gdb-call-functions/
