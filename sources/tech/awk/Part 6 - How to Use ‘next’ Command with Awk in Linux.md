How to Use ‘next’ Command with Awk in Linux
=============================================

![](http://www.tecmint.com/wp-content/uploads/2016/06/Use-next-Command-with-Awk-in-Linux.png)

In this sixth part of Awk series, we shall look at using `next` command, which tells Awk to skip all remaining patterns and expressions that you have provided, but instead read the next input line.

The `next` command helps you to prevent executing what I would refer to as time-wasting steps in a command execution.

To understand how it works, let us consider a file called food_list.txt that looks like this:

```
Food List Items
No      Item_Name               Price           Quantity
1       Mangoes                 $3.45              5
2       Apples                  $2.45              25
3       Pineapples              $4.45              55
4       Tomatoes                $3.45              25
5       Onions                  $1.45              15
6       Bananas                 $3.45              30
```

Consider running the following command that will flag food items whose quantity is less than or equal to 20 with a `(*)` sign at the end of each line:

```
# awk '$4 <= 20 { printf "%s\t%s\n", $0,"*" ; } $4 > 20 { print $0 ;} ' food_list.txt 

No	Item_Name		Price		Quantity
1	  Mangoes			$3.45		   5	*
2	  Apples			$2.45      25
3	  Pineapples	$4.45      55
4	  Tomatoes		$3.45      25 
5	  Onions			$1.45      15	*
6	  Bananas	    $3.45      30
```

The command above actually works as follows:

- First, it checks whether the quantity, fourth field of each input line is less than or equal to 20, if a value meets that condition, it is printed and flagged with the `(*)` sign at the end using expression one: `$4 <= 20`
- Secondly, it checks if the fourth field of each input line is greater than 20, and if a line meets the condition it gets printed using expression two: `$4 > 20`

But there is one problem here, when the first expression is executed, a line that we want to flag is printed using: `{ printf "%s\t%s\n", $0,"**" ; }` and then in the same step, the second expression is also checked which becomes a time wasting factor.

So there is no need to execute the second expression, `$4 > 20` again after printing already flagged lines that have been printed using the first expression.

To deal with this problem, you have to use the `next` command as follows:

```
# awk '$4 <= 20 { printf "%s\t%s\n", $0,"*" ; next; } $4 > 20 { print $0 ;} ' food_list.txt

No	Item_Name		Price		           Quantity
1	  Mangoes			$3.45		           5	*
2	  Apples			$2.45              25
3	  Pineapples	$4.45              55
4	  Tomatoes		$3.45              25 
5	  Onions			$1.45              15	*
6	  Bananas	    $3.45              30
```

After a single input line is printed using `$4 <= 20` `{ printf "%s\t%s\n", $0,"*" ; next ; }`, the `next` command included will help skip the second expression `$4 > 20` `{ print $0 ;}`, so execution goes to the next input line without having to waste time on checking whether the quantity is greater than 20.

The next command is very important is writing efficient commands and where necessary, you can always use to speed up the execution of a script. Prepare for the next part of the series where we shall look at using standard input (STDIN) as input for Awk.

Hope you find this how to guide helpful and you can as always put your thoughts in writing by leaving a comment in the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-next-command-with-awk-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
