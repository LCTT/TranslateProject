【xllc翻译中】

How I got started with bash scripting
============================================================

### With a few simple Google searches, a programming novice learned to write code that automates a previously tedious and time-consuming task.



![How Google helped me learn bash scripting](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/computer_happy_sad_developer_programming.png?itok=5E3k_t_r "How Google helped me learn bash scripting")
>Image by : opensource.com

I wrote a script the other day. For some of you, that sentence sounds like no big deal. For others, and I know you're out there, that sentence is significant. You see, I'm not a programmer. I'm a writer.

### What I needed to solve

My problem was fairly simple: I had to juggle files from engineering into our documentation. The files were available in a .zip format from a web URL. I was copying them to my desktop manually, then moving them into a different directory structure to match my documentation needs. A fellow writer gave me this advice:  _"Why don't you just write a script to do this for you?"_ 

Programming and development

*   [New Python content][1]

*   [Our latest JavaScript articles][2]

*   [Recent Perl posts][3]

*   [Red Hat Developers Blog][4]

​

I thought  _"just write a script?!?"_ —as if it was the easiest thing in the world to do.

### How Google came to the rescue

My colleague's question got me thinking, and as I thought, I googled.

**What scripting languages are on Linux?**

This was my first Google search criteria, and many of you are probably thinking, "She's pretty clueless." Well, I was, but it did set me on a path to solving my problem. The most common result was Bash. Hmm, I've seen Bash. Heck, one of the files I had to document had Bash in it, that ubiquitous line **#!/bin/bash**. I took another look at that file, and I knew what it was doing because I had to document it.

So that led me to my next Google search request.

**How to download a zip file from a URL?**

That was my basic task really. I had a URL with a .zip file containing all the files I needed to include in my documentation, so I asked the All Powerful Google to help me out. That search gem, and a few more, led me to Curl. But here's the best part: Not only did I find Curl, one of the top search hits showed me a Bash script that used Curl to download a .zip file and extract it. That was more than I asked for, but that's when I realized being specific in my Google search requests could give me the information I needed to write this script. So, momentum in my favor, I wrote the simplest of scripts:

```
#!/bin/sh

curl http://rather.long.url | tar -xz -C my_directory --strip-components=1
```

What a moment to see that thing run! But then I realized one gotcha: The URL can change, depending on which set of files I'm trying to access. I had another problem to solve, which led me to my next search.

**How to pass parameters into a Bash script?**

I needed to be able to run this script with different URLs and different end directories. Google showed me how to put in **$1**, **$2**, etc., to replace what I typed on the command line with my script. For example:

```
bash myscript.sh http://rather.long.url my_directory
```

That was much better. Everything was working as I needed it to, I had flexibility, I had a working script, and most of all, I had a short command to type and save myself 30 minutes of copy-paste grunt work. That was a morning well spent.

Then I realized I had one more problem. You see, my memory is short, and I knew I'd run this script only every couple of months. That left me with two issues:

*   How would I remember what to type for my script (URL first? directory first?)?

*   How would another writer know how to run my script if I got hit by a truck?

I needed a usage message—something the script would display if I didn't use it correctly. For example:

```
usage: bash yaml-fetch.sh <'snapshot_url'> <directory>
```

Otherwise, run the script. My next search was:

**How to write "if/then/else" in a Bash script?**

Fortunately I already knew **if/then/else** existed in programming. I just had to find out how to do that. Along the way, I also learned to print from a Bash script using **echo**. What I ended up with was something like this:

```
#!/bin/sh

URL=$1
DIRECTORY=$2

if [ $# -eq 0 ];
 then
 echo "usage: bash yaml-fetch.sh <'snapshot_url'> <directory>".
 else

     # make the directory if it doesn't already exist
 echo 'create directory'

 mkdir $DIRECTORY

 # fetch and untar the yaml files
 echo 'fetch and untar the yaml files'

 curl $URL | tar -xz -C $DIRECTORY --strip-components=1
fi
```

### How Google and scripting rocked my world

Okay, slight exaggeration there, but this being the 21st century, learning new things (especially somewhat simple things) is a whole lot easier than it used to be. What I learned (besides how to write a short, self-documented Bash script) is that if I have a question, there's a good chance someone else had the same or a similar question before. When I get stumped, I can ask the next question, and the next question. And in the end, not only do I have a script, I have the start of a new skill that I can hold onto and use to simplify other tasks I've been avoiding.

Don't let that first script (or programming step) get the best of you. It's a skill, like any other, and there's a wealth of information out there to help you along the way. You don't need to read a massive book or take a month-long course. You can do it a simpler way with baby steps and baby scripts that get you started, then build on that skill and your confidence. There will always be a need for folks to write those thousands-of-lines-of-code programs with all the branching and merging and bug-fixing.

But there is also a strong need for simple scripts and other ways to automate/simplify tasks. And that's where a little script and a little confidence can give you a kickstart.

--------------------------------------------------------------------------------

作者简介：

Sandra McCann - Sandra McCann is a Linux and open source advocate. She's worked as a software developer, content architect for learning resources, and content creator. Sandra is currently a content creator for Red Hat in Westford, MA focusing on OpenStack and NFV techology. 

----

via: https://opensource.com/article/17/5/how-i-learned-bash-scripting

作者：[ Sandra McCann ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sandra-mccann
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:https://opensource.com/article/17/5/how-i-learned-bash-scripting?rate=s_R-jmOxcMvs9bi41yRwenl7GINDvbIFYrUMIJ8OBYk
[6]:https://opensource.com/user/39771/feed
[7]:https://opensource.com/article/17/5/how-i-learned-bash-scripting#comments
[8]:https://opensource.com/users/sandra-mccann
