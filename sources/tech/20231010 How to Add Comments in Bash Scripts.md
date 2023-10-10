[#]: subject: "How to Add Comments in Bash Scripts"
[#]: via: "https://itsfoss.com/bash-comments/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Add Comments in Bash Scripts
======

Adding comments in bash scripts is one of the most effective ways to keep your code clean and understandable.

You may ask why.

Let's suppose your script contains a complex regex or multiple complex blocks of codes and in that case, you can add comments so other developers or you can have an idea of what that block of code was meant to be.

Commenting out part of code also helps in debugging scripts.

In this tutorial, I will walk you through three ways to add comments in bash scripts:

  * Single-line comments
  * In line comments
  * Multi-line comments



So let's start with the first one.

### Single-line comments in bash

To add single-line comments, you have to put the hashtag (#) at the beginning of the line and write a comment.

Here's a simple example:

```

    #!/bin/bash
    # This is a comment
    echo "Hello, World!"

```

While executing, the comments will be ignored and when I executed the above command, it looked like this:

![][1]

💡

The only exception to the # for comment rule is the #!/bin/bash line at the beginning of the scripts. It's called [shebang][2] and it used to specify the interpreter to be used while running the script. There are different shells and the syntax may differ. So, a good practice is to specify for which shell the script was written. For example, if it were for ksh, you would use #!/bin/ksh

### Inline comments in bash scripts

Alternatively, you can put the comment inside the code block to document what is the purpose of that specific line.

🚧

Anything after # won't be executed until the line ends, so make sure you add the comment at the end of the code.

Here's a simple example:

```

    #!/bin/bash
    echo "Hello, World!" #Prints hello world

```

![][3]

### Multi-line comments in bash

🚧

There is no in-built multiline commenting feature in Bash. However, there are a few workarounds to achieve the multiline comment effect.

As the name suggests, multi-line comments in bash scripting allow you to write comments in multiple lines or prevent executing block of code by putting them in multiline comment section:

  1. Use # at the begnning of eacj line
  2. [Colon notation][4] (uses colon followed by a single quote)
  3. Here document (uses << followed by delimiter)



So let's start with the first one.

#### 1\. Use # for each line of block comment

This is what I suggest to use if your purpose is to explain part of the script. After all, # is the actual commenting feature.

And this is what many developers use, too.

Suppose you have to explain the purpose of the script, author info or licensing information in the beginning. You can write it like this:

```

    #!/bin/bash

    ######################################
    ## This script is used for scanning ##
    ## local network                    ##
    ## Licensed under GPL 2.0           ##
    ######################################

    rest of the bash script code

```

That's fine when you know how your bash script behaves. If you are debugging a bash script and want to hide part of the script, adding # at the beginning of each line of the required code and then removing them after debugging is a time-consuming task.

The next two sections help you with that.

#### 2\. Colon notation

To use the colon notation, you write block comments between `: '` and the closing `'` as shown here:

```

    #!/bin/bash

    : '
    This is how you can use colon notation
    And this line too will be ignored
    '
    echo "GOODBYE"

```

When you execute the above script, it should only print GOODBYE:

![][5]

#### 2\. Here document

By far, this is the most popular way to write multiline comments in bash which you use `<<` followed by a delimiter (a set of characters to specify the start and the end of the comments).

Here's how you use it:

```

    #!/bin/bash

    <<DELIMITER
    Comment line 1
    Comment line 2
    DELIMITER

    echo "Hello, World!"

```

Still confused? Here's a simple example:

```

    #!/bin/bash

    <<COMMENT
    This is a multi-line comment using a here document.
    You can add as many lines as you want between <<COMMENT and the terminating keyword.
    This block won't be executed by the shell.
    COMMENT

    echo "Hello, World!"

```

In the above example, I have used `COMMENT` as a delimiter but you can use anything but make sure it stands out from the comment or it will create confusion.

When I executed the above script, it gave me the following output:

![][6]

As you can see, it ignored everything inside <<COMMENT

### Learn bash from scratch!!

If you are planning to learn bash from scratch or want to skim through all the basics, we made a detailed guide for you:

![][7]

I hope you will find this guide helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/bash-comments/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/10/Use-single-line-comments-in-bash.png
[2]: https://linuxhandbook.com/shebang/
[3]: https://itsfoss.com/content/images/2023/10/How-to-use-the-single-line-comments-in-bash.png
[4]: https://stackoverflow.com/questions/3224878/what-is-the-purpose-of-the-colon-gnu-bash-builtin
[5]: https://itsfoss.com/content/images/2023/10/Use-multi-line-comments-using-colon-notation-in-bash.png
[6]: https://itsfoss.com/content/images/2023/10/Use-multi-line-comments-in-bash-using----and-delimeter.png
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
