[#]: subject: "Create an app with this Arnold Schwarzenegger-themed programming language"
[#]: via: "https://opensource.com/article/22/2/arnoldc-create-app"
[#]: author: "Jessica Cherry https://opensource.com/users/cherrybomb"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create an app with this Arnold Schwarzenegger-themed programming language
======
Build your Java muscle while having some fun with ArnoldC, an open
source programming language.
![gray scale photo of dumbbell weights for strength training][1]

Have you ever wished programming were more like an action movie? If you answered yes, then I have the language for you.

While wandering the internet to find the most obscure and fun open source languages, I came across ArnoldC. ArnoldC is an imperative programming language where the basic keywords are replaced with quotes from various Arnold Schwarzenegger movies.

For this tutorial, I'll be using a Debian-based operating system with Terminator and the Vim editor. While you follow this tutorial, I would highly recommend rewatching some older Schwarzenegger films just for fun!

### Install ArnoldC

ArnoldC is hosted in [GitHub][2]. Before starting, I suggest creating a directory to hold your new project so it won't get lost. Below are my commands to get ArnoldC on your computer.


```


$ mkdir arnoldc
$ cd arnoldc/
/arnoldc$ wget <http://lhartikk.github.io/ArnoldC.jar>
\--2022-01-16 14:11:18--  <http://lhartikk.github.io/ArnoldC.jar>
Resolving lhartikk.github.io (lhartikk.github.io)... \
185.199.108.153, 185.199.109.153, 185.199.110.153, ...
Connecting to lhartikk.github.io (lhartikk.github.io)\
|185.199.108.153|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 12958233 (12M) [application/java-archive]
Saving to: ‘ArnoldC.jar’

ArnoldC.jar                             100%

```

### Short keyword overview

First, I'll explain some of the keywords you'll need to build an app. Keep in mind that all of these keywords need to be in all caps when writing your application.

Printing strings or variables: `TALK TO THE HAND`
Example: `TALK TO THE HAND "hello there"`

Creating a variable: `GET TO THE CHOPPER`
Example: `GET TO THE CHOPPER var1`

Setting the variable: `HERE IS MY INVITATION`
Example (in pattern format):


```


GET TO THE CHOPPER var1
HERE IS MY INVITATION value1

```

Once you've finished with the assigned variable, the next line is `ENOUGH TALK`.

False: `I LIED`
True: `NO PROBLEMO`
Return: `I'LL BE BACK`

These are some of my favorite keywords from the complete list, but you can always consult the ArnoldC wiki for more.

### Hello world

I'll start with a small "hello world" app to show the ArnoldC language in use.

First, use the `echo` command to output the string "hello world" into a hello file:


```


$echo -e "IT'S SHOWTIME\nTALK TO THE HAND \"hello world\
"\nYOU HAVE BEEN TERMINATED" &gt; hello.arnoldc

```

Next, use `java -jar` to create the app using ArnoldC: `$java -jar ArnoldC.jar hello.arnoldc`

Then use the java command to run the program: `$java hello`

Here's the output:


```
hello world
```

If you followed these instructions, congratulations on your first under-3-minute app in a completely frivolous language.

### Let's count

In this next example, I'll have my app count to 20. The odd patterning makes this program pretty interesting.

First, create the file using Vim so you can just start writing the app: `arnoldc$ vi count.arnoldc`

Create the `begin main` with `IT'S SHOWTIME`.

Next, set up the declared variable: `HEY CHRISTMAS TREE isLessThan20`

Then, set the initial value of the variable to true, making that required: `YOU SET US UP @NO PROBLEMO`

Repeat these steps with the variable n and make the first set value 0:


```


HEY CHRISTMAS TREE n
YOU SET US UP 0

```

From here, move into a while loop with the first variable: `STICK AROUND isLessThan20`

Assign the variable to look at: `GET TO THE CHOPPER n`

Then set the value to plus one:


```


HERE IS MY INVITATION n
GET UP 1

```

Moving on to ending the assigned variable: `ENOUGH TALK`

Print the number: `TALK TO THE HAND n`

Look at the assigned variable again, then set the variable to 20:


```


GET TO THE CHOPPER isLessThan20
HERE IS MY INVITATION 20

```

Check to see if the number is less than 20: `LET OFF SOME STEAM BENNET n`

Moving on to ending the assigned variable, end the while loop, then terminate the program:


```


ENOUGH TALK
CHILL
YOU HAVE BEEN TERMINATED

```

In the end, you should have this:


```


IT'S SHOWTIME
HEY CHRISTMAS TREE isLessThan20
YOU SET US UP @NO PROBLEMO
HEY CHRISTMAS TREE n
YOU SET US UP 0
STICK AROUND isLessThan20
GET TO THE CHOPPER n
HERE IS MY INVITATION n
GET UP 1
ENOUGH TALK
TALK TO THE HAND n
GET TO THE CHOPPER isLessThan20
HERE IS MY INVITATION 20
LET OFF SOME STEAM BENNET n
ENOUGH TALK
CHILL
YOU HAVE BEEN TERMINATED

```

Now you just need to set the jar package up to run: `/arnoldc$ java -jar ArnoldC.jar count.arnoldc`

Then run your code:


```


/arnoldc$ java count
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20

```

If you attempted this tutorial, congratulations again! You now have a small counter.

### Afterthoughts

This just-for-fun open source language is great for general hilarity, but it helps if you know a small amount of Java-based languages. I don't, so it took a bit more time for me to figure out how to use the language. At least I learned something while having fun! I hope you enjoy experimenting with ArnoldC and making something that's amusing to you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/arnoldc-create-app

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/luis-reyes-mtorq9gffog-unsplash.jpg?itok=pnfxHBsU (gray scale photo of dumbbell weights for strength training)
[2]: https://github.com/lhartikk/ArnoldC
