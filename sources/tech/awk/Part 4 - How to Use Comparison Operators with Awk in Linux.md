How to Use Comparison Operators with Awk in Linux
===================================================

![](http://www.tecmint.com/wp-content/uploads/2016/05/Use-Comparison-Operators-with-AWK.png)

When dealing with numerical or string values in a line of text, filtering text or strings using comparison operators comes in handy for Awk command users.

In this part of the Awk series, we shall take a look at how you can filter text or strings using comparison operators. If you are a programmer then you must already be familiar with comparison operators but those who are not, let me explain in the section below.

### What are Comparison operators in Awk?

Comparison operators in Awk are used to compare the value of numbers or strings and they include the following:

- `>` – greater than
- `<` – less than
- `>=` – greater than or equal to
- `<=` – less than or equal to
- `==` – equal to
- `!=` – not equal to
- `some_value ~ / pattern/` – true if some_value matches pattern
- `some_value !~ / pattern/` – true if some_value does not match pattern

Now that we have looked at the various comparison operators in Awk, let us understand them better using an example.

In this example, we have a file named food_list.txt which is a shopping list for different food items and I would like to flag food items whose quantity is less than or equal 20 by adding `(**)` at the end of each line.

```
File – food_list.txt
No      Item_Name               Quantity        Price
1       Mangoes                    45           $3.45
2       Apples                     25           $2.45
3       Pineapples                 5            $4.45
4       Tomatoes                   25           $3.45
5       Onions                     15           $1.45
6       Bananas                    30           $3.45
```

The general syntax for using comparison operators in Awk is:

```
# expression { actions; }
```

To achieve the above goal, I will have to run the command below:

```
# awk '$3 <= 30 { printf "%s\t%s\n", $0,"**" ; } $3 > 30 { print $0 ;}' food_list.txt

No	Item_Name`		Quantity	Price
1	Mangoes	      		   45		$3.45
2	Apples			   25		$2.45	**
3	Pineapples		   5		$4.45	**
4	Tomatoes		   25		$3.45	**
5	Onions			   15           $1.45	**
6	Bananas			   30           $3.45	**
```

In the above example, there are two important things that happen:

- The first expression `{ action ; }` combination, `$3 <= 30 { printf “%s\t%s\n”, $0,”**” ; }` prints out lines with quantity less than or equal to 30 and adds a `(**)` at the end of each line. The value of quantity is accessed using `$3` field variable.
- The second expression `{ action ; }` combination, `$3 > 30 { print $0 ;}` prints out lines unchanged since their quantity is greater then `30`.

One more example:

```
# awk '$3 <= 20 { printf "%s\t%s\n", $0,"TRUE" ; } $3 > 20  { print $0 ;} ' food_list.txt 

No	  Item_Name		Quantity	Price
1	    Mangoes			   45		  $3.45
2	    Apples			   25		  $2.45
3	    Pineapples		  5		  $4.45	TRUE
4	    Tomatoes		   25		  $3.45
5	    Onions			   15     $1.45	TRUE
6     Bananas	       30     $3.45
```

In this example, we want to indicate lines with quantity less or equal to 20 with the word (TRUE) at the end.

### Summary

This is an introductory tutorial to comparison operators in Awk, therefore you need to try out many other options and discover more.

In case of any problems you face or any additions that you have in mind, then drop a comment in the comment section below. Remember to read the next part of the Awk series where I will take you through compound expressions.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/comparison-operators-in-awk/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
