How to Use Compound Expressions with Awk in Linux
====================================================

![](http://www.tecmint.com/wp-content/uploads/2016/05/Use-Compound-Expressions-with-Awk.png)

All along, we have been looking at simple expressions when checking whether a condition has been meet or not. What if you want to use more then one expression to check for a particular condition in?

In this article, we shall take a look at the how you can combine multiple expressions referred to as compound expressions to check for a condition when filtering text or strings.

In Awk, compound expressions are built using the `&&` referred to as `(and)` and the `||` referred to as `(or)` compound operators.

The general syntax for compound expressions is:

```
( first_expression ) && ( second_expression )
```

Here, `first_expression` and `second_expression` must be true to make the whole expression true.

```
( first_expression ) || ( second_expression) 
```

Here, one of the expressions either `first_expression` or `second_expression` must be true for the whole expression to be true.

**Caution**: Remember to always include the parenthesis.

The expressions can be built using the comparison operators that we looked at in Part 4 of the awk series.

Let us now get a clear understanding using an example below:

In this example, a have a text file named `tecmint_deals.txt`, which contains a list of some amazing random Tecmint deals, it includes the name of the deal, the price and type.

```
TecMint Deal List
No      Name                                    Price           Type
1       Mac_OS_X_Cleanup_Suite                  $9.99           Software
2       Basics_Notebook                         $14.99          Lifestyle
3       Tactical_Pen                            $25.99          Lifestyle
4       Scapple                                 $19.00          Unknown
5       Nano_Tool_Pack                          $11.99          Unknown
6       Ditto_Bluetooth_Altering_Device         $33.00          Tech
7       Nano_Prowler_Mini_Drone                 $36.99          Tech 
```

Say that we want only print and flag deals that are above $20 and of type “Tech” using the (**) sign at the end of each line.

We shall need to run the command below.

```
# awk '($3 ~ /^\$[2-9][0-9]*\.[0-9][0-9]$/) && ($4=="Tech") { printf "%s\t%s\n",$0,"*"; } ' tecmint_deals.txt 

6	Ditto_Bluetooth_Altering_Device		$33.00		Tech	*
7	Nano_Prowler_Mini_Drone			$36.99          Tech	 *
```

In this example, we have used two expressions in a compound expression:

- First expression, `($3 ~ /^\$[2-9][0-9]*\.[0-9][0-9]$/)` ; checks the for lines with deals with price above `$20`, and it is only true if the value of $3 which is the price matches the pattern `/^\$[2-9][0-9]*\.[0-9][0-9]$/`
- And the second expression, `($4 == “Tech”)` ; checks whether the deal is of type “`Tech`” and it is only true if the value of `$4` equals to “`Tech`”.
Remember, a line will only be flagged with the `(**)`, if first expression and second expression are true as states the principle of the `&&` operator.

### Summary

Some conditions always require building compound expressions for you to match exactly what you want. When you understand the use of comparison and compound expression operators then, filtering text or strings based on some difficult conditions will become easy.

Hope you find this guide useful and for any questions or additions, always remember to leave a comment and your concern will be solved accordingly.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/combine-multiple-expressions-in-awk/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
