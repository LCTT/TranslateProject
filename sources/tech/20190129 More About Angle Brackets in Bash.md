[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (More About Angle Brackets in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

More About Angle Brackets in Bash
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/bash-angles.png?itok=mVFnxPzF)

In the previous article, we [introduced the subject of angle brackets][1] (`< >`) and demonstrated some of their uses. Here, we'll look at the topic from a few more angles. Let's dive right in.

You can use `<` to trick a tool into believing the output of a command is data from a file.

Let's say you are not sure your backup is complete, and you want to check that a certain directory contains all the files copied over from the original. You can try this:

```
diff <(ls /original/dir/) <(ls /backup/dir/)
```

[`diff`][2] is a tool that typically compares two text files line by line, looking for differences. Here it gets the output from two `ls` commands and treats them as if coming from a file and compares them as such.

Note that there is no space between the `<` and the `(...)`.

Running that on the original and backup of a directory where I save pretty pictures, I get:

```
diff <(ls /My/Pictures/) <(ls /My/backup/Pictures/) 5d4 < Dv7bIIeUUAAD1Fc.jpg:large.jpg
```

The `<` in the output is telling me that there is file ( _Dv7bIIeUUAAD1Fc.jpg:large.jpg_ ) on the left side of the comparison (in _/My/Pictures_ ) that is not on the right side of the comparison (in _/My/backup/Pictures_ ), which means copying over has failed for some reason. If `diff` didn't cough up any output, it would mean that the list of files were the same.

So, you may be wondering, if you can take the output of a command or command line, make it look like the contents of a file, and feed it to an instruction that is expecting a file, that means that in the _sorting by favorite actor_ example from above, you could've done away with the intermediate file and just piped the output from the loop into `sort`.

In short, yep! The line:

```
sort -r <(while read -r name surname films;do echo $films $name $surname ; done < CBactors)
```

does the trick nicely.

### Here string! Good string!

There is one more case for redirecting data using angle brackets (or arrows, or whatever you want to call them).

You may be familiar with the practice of passing variables to commands using `echo` and a pipe (`|`). Say you want to convert a variable containing a string to uppercase characters because... I don't know... YOU LIKE SHOUTING A LOT. You could do this:

```
myvar="Hello World" echo $myvar | tr '[:lower:]' '[:upper:]' HELLO WORLD
```

The [`tr`][3] command _tr_ anslates strings to different formats. In the example above, you are telling `tr` to change all the lowercase characters that come along in the string to uppercase characters.

It is important to know that you are not passing on the variable, but only its contents, that is, the string " _Hello World_ ". This is called the _here string_ , as in " _it is here, in this context, that we know what string we are dealing with_ ". But there is shorter, clearer, and all round better way of delivering _here strings_ to commands. Using

```
tr '[:lower:]' '[:upper:]' <<< $myvar
```

does the same thing with no need to use echo or a pipe. It also uses angle brackets, which is the whole obsessive point of this article.

### Conclusion

Again, Bash proves to give you lots of options with very little. I mean, who would've thunk that you could do so much with two simple characters like `<` and `>`?

The thing is we aren't done. There are plenty of more characters that bring meaning to chains of Bash instructions. Without some background, they can make shell commands look like gibberish. Hopefully, post by post, we can help you decipher them. Until next time!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash
[2]: https://linux.die.net/man/1/diff
[3]: https://linux.die.net/man/1/tr
