How to Read Awk Input from STDIN in Linux
============================================

![](http://www.tecmint.com/wp-content/uploads/2016/06/Read-Awk-Input-from-STDIN.png)

In the previous parts of the Awk tool series, we looked at reading input mostly from a file(s), but what if you want to read input from STDIN.
In this Part 7 of Awk series, we shall look at few examples where you can filter the output of other commands instead of reading input from a file.

We shall start with the [dir utility][1] that works similar to [ls command][2], in the first example below, we use the output of `dir -l` command as input for Awk to print owner’s username, groupname and the files he/she owns in the current directory:

```
# dir -l | awk '{print $3, $4, $9;}'
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/List-Files-Owned-By-User-in-Directory.png)
>List Files Owned By User in Directory

Take a look at another example where we [employ awk expressions][3], here, we want to print files owned by the root user by using an expression to filter strings as in the awk command below:

```
# dir -l | awk '$3=="root" {print $1,$3,$4, $9;} '
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/List-Files-Owned-by-Root-User.png)
>List Files Owned by Root User

The command above includes the `(==)` comparison operator to help us filter out files in the current directory which are owned by the root user. This is achieved using the expression `$3==”root”`.

Let us look at another example of where we use a [awk comparison operator][4] to match a certain string.

Here, we have used the [cat utility][5] to view the contents of a file named tecmint_deals.txt and we want to view the deals of type Tech only, so we shall run the following commands:

```
# cat tecmint_deals.txt
# cat tecmint_deals.txt | awk '$4 ~ /tech/{print}'
# cat tecmint_deals.txt | awk '$4 ~ /Tech/{print}'
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Use-Comparison-Operator-to-Match-String.png)
>Use Awk Comparison Operator to Match String

In the example above, we have used the value `~ /pattern/` comparison operator, but there are two commands to try and bring out something very important.

When you run the command with pattern tech nothing is printed out because there is no deal of that type, but with Tech, you get deals of type Tech.

So always be careful when using this comparison operator, it is case sensitive as we have seen above.

You can always use the output of another command instead as input for awk instead of reading input from a file, this is very simple as we have looked at in the examples above.

Hope the examples were clear enough for you to understand, if you have any concerns, you can express them through the comment section below and remember to check the next part of the series where we shall look at awk features such as variables, numeric expressions and assignment operators.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/read-awk-input-from-stdin-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/linux-dir-command-usage-with-examples/
[2]: http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[3]: http://www.tecmint.com/combine-multiple-expressions-in-awk
[4]: http://www.tecmint.com/comparison-operators-in-awk
[5]: http://www.tecmint.com/13-basic-cat-command-examples-in-linux/



