[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 Bash history shortcuts you will actually use)
[#]: via: (https://opensource.com/article/19/10/bash-history-shortcuts)
[#]: author: (Ian Miell https://opensource.com/users/ianmiell)

7 Bash history shortcuts you will actually use
======
Save time on the command line with these essential Bash shortcuts.
![Command line prompt][1]

Most guides to Bash history shortcuts exhaustively list every single one available. The problem with that is I would use a shortcut once, then glaze over as I tried out all the possibilities. Then I'd move onto my working day and completely forget them, retaining only the well-known [**!!** trick][2] I learned when I first started using Bash.

So most of them were never committed to memory.

This article outlines the shortcuts I _actually use_ every day. It is based on some of the contents of my book, [_Learn Bash the hard way_][3]; (you can read a [preview][4] of it to learn more).

When people see me use these shortcuts, they often ask me, "What did you do there!?" There's minimal effort or intelligence required, but to really learn them, I recommend using one each day for a week, then moving to the next one. It's worth taking your time to get them under your fingers, as the time you save will be significant in the long run.

### 1\. The "last argument" one: !$

If you only take one shortcut from this article, make it this one. It substitutes in the last argument of the last command into your line.

Consider this scenario:


```
$ mv /path/to/wrongfile /some/other/place
mv: cannot stat '/path/to/wrongfile': No such file or directory
```

Ach, I put the **wrongfile** filename in my command. I should have put **rightfile** instead.

You might decide to retype the last command and replace wrongfile with rightfile completely. Instead, you can type:


```
$ mv /path/to/rightfile !$
mv /path/to/rightfile /some/other/place
```

and the command will work.

There are other ways to achieve the same thing in Bash with shortcuts, but this trick of reusing the last argument of the last command is one I use the most.

### 2\. The "_n_th argument" one: !:2

Ever done anything like this?


```
$ tar -cvf afolder afolder.tar
tar: failed to open
```

Like many others, I get the arguments to **tar** (and **ln**) wrong more often than I would like to admit.

[![xkcd comic][5]][6]

When you mix up arguments like that, you can run:


```
$ !:0 !:1 !:3 !:2
tar -cvf afolder.tar afolder
```

and your reputation will be saved.

The last command's items are zero-indexed and can be substituted in with the number after the **!:**.

Obviously, you can also use this to reuse specific arguments from the last command rather than all of them.

### 3\. The "all the arguments" one: !:1-$

Imagine I run a command like:


```
`$ grep '(ping|pong)' afile`
```

The arguments are correct; however, I want to match **ping** or **pong** in a file, but I used **grep** rather than **egrep**.

I start typing **egrep**, but I don't want to retype the other arguments. So I can use the **!:1$** shortcut to ask for all the arguments to the previous command from the second one (remember they’re zero-indexed) to the last one (represented by the **$** sign).


```
$ egrep !:1-$
egrep '(ping|pong)' afile
ping
```

You don't need to pick **1-$**; you can pick a subset like **1-2** or **3-9** (if you had that many arguments in the previous command).

### 4\. The "last but _n_" one: !-2:$

The shortcuts above are great when I know immediately how to correct my last command, but often I run commands _after_ the original one, which means that the last command is no longer the one I want to reference.

For example, using the **mv** example from before, if I follow up my mistake with an **ls** check of the folder's contents:


```
$ mv /path/to/wrongfile /some/other/place
mv: cannot stat '/path/to/wrongfile': No such file or directory
$ ls /path/to/
rightfile
```

I can no longer use the **!$** shortcut.

In these cases, I can insert a **-_n_:** (where _**n**_ is the number of commands to go back in the history) after the **!** to grab the last argument from an older command:


```
$ mv /path/to/rightfile !-2:$
mv /path/to/rightfile /some/other/place
```

Again, once you learn it, you may be surprised at how often you need it.

### 5\. The "get me the folder" one: !$:h

This one looks less promising on the face of it, but I use it dozens of times daily.

Imagine I run a command like this:


```
$ tar -cvf system.tar /etc/system
 tar: /etc/system: Cannot stat: No such file or directory
 tar: Error exit delayed from previous errors.
```

The first thing I might want to do is go to the **/etc** folder to see what's in there and work out what I've done wrong.

I can do this at a stroke with:


```
$ cd !$:h
cd /etc
```

This one says: "Get the last argument to the last command (**/etc/system**) and take off its last filename component, leaving only the **/etc**."

### 6\. The "the current line" one: !#:1

For years, I occasionally wondered if I could reference an argument on the current line before finally looking it up and learning it. I wish I'd done so a long time ago. I most commonly use it to make backup files:


```
$ cp /path/to/some/file !#:1.bak
cp /path/to/some/file /path/to/some/file.bak
```

but once under the fingers, it can be a very quick alternative to …

### 7\. The "search and replace" one: !!:gs

This one searches across the referenced command and replaces what's in the first two **/** characters with what's in the second two.

Say I want to tell the world that my **s** key does not work and outputs **f** instead:


```
$ echo my f key doef not work
my f key doef not work
```

Then I realize that I was just hitting the **f** key by accident. To replace all the **f**s with **s**es, I can type:


```
$ !!:gs/f /s /
echo my s key does not work
my s key does not work
```

It doesn't work only on single characters; I can replace words or sentences, too:


```
$ !!:gs/does/did/
echo my s key did not work
my s key did not work
```

### Test them out

Just to show you how these shortcuts can be combined, can you work out what these toenail clippings will output?


```
$ ping !#:0:gs/i/o
$ vi /tmp/!:0.txt
$ ls !$:h
$ cd !-2:h
$ touch !$!-3:$ !! !$.txt
$ cat !:1-$
```

### **Conclusion**

Bash can be an elegant source of shortcuts for the day-to-day command-line user. While there are thousands of tips and tricks to learn, these are my favorites that I frequently put to use.

If you want to dive even deeper into all that Bash can teach you, pick up my book, [_Learn Bash the hard way_][3] or check out my online course, [Master the Bash shell][7].

* * *

_This article was originally posted on Ian's blog, [Zwischenzugs.com][8], and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/bash-history-shortcuts

作者：[Ian Miell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ianmiell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/18/5/bash-tricks
[3]: https://leanpub.com/learnbashthehardway
[4]: https://leanpub.com/learnbashthehardway/read_sample
[5]: https://opensource.com/sites/default/files/uploads/tar_2x.png (xkcd comic)
[6]: https://xkcd.com/1168/
[7]: https://www.educative.io/courses/master-the-bash-shell
[8]: https://zwischenzugs.com/2019/08/25/seven-god-like-bash-history-shortcuts-you-will-actually-use/
