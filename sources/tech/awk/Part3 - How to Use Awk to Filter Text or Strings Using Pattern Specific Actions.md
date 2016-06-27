How to Use Awk to Filter Text or Strings Using Pattern Specific Actions
=========================================================================

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-to-Filter-Text-or-Strings-Using-Pattern.png)

In the third part of the Awk command series, we shall take a look at filtering text or strings based on specific patterns that a user can define.

Sometimes, when filtering text, you want to indicate certain lines from an input file or lines of strings based on a given condition or using a specific pattern that can be matched. Doing this with Awk is very easy, it is one of the great features of Awk that you will find helpful.

Let us take a look at an example below, say you have a shopping list for food items that you want to buy, called food_prices.list. It has the following list of food items and their prices.

```
$ cat food_prices.list 
No	Item_Name		Quantity	Price
1	Mangoes			   10		$2.45
2	Apples			   20		$1.50
3	Bananas			   5		$0.90
4	Pineapples		   10		$3.46
5	Oranges			   10		$0.78
6	Tomatoes		   5		$0.55
7	Onions			   5            $0.45
```

And then, you want to indicate a `(*)` sign on food items whose price is greater than $2, this can be done by running the following command:

```
$ awk '/ *\$[2-9]\.[0-9][0-9] */ { print $1, $2, $3, $4, "*" ; } / *\$[0-1]\.[0-9][0-9] */ { print ; }' food_prices.list
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Filter-and-Print-Text-Using-Awk.gif)
>Print Items Whose Price is Greater Than $2

From the output above, you can see that the there is a `(*)` sign at the end of the lines having food items, mangoes and pineapples. If you check their prices, they are above $2.

In this example, we have used used two patterns:

- the first: `/ *\$[2-9]\.[0-9][0-9] */` gets the lines that have food item price greater than $2 and
- the second: `/*\$[0-1]\.[0-9][0-9] */` looks for lines with food item price less than $2.

This is what happens, there are four fields in the file, when pattern one encounters a line with food item price greater than $2, it prints all the four fields and a `(*)` sign at the end of the line as a flag.

The second pattern simply prints the other lines with food price less than $2 as they appear in the input file, food_prices.list.

This way you can use pattern specific actions to filter out food items that are priced above $2, though there is a problem with the output, the lines that have the `(*)` sign are not formatted out like the rest of the lines making the output not clear enough.

We saw the same problem in Part 2 of the awk series, but we can solve it in two ways:

1. Using printf command which is a long and boring way using the command below:

```
$ awk '/ *\$[2-9]\.[0-9][0-9] */ { printf "%-10s %-10s %-10s %-10s\n", $1, $2, $3, $4 "*" ; } / *\$[0-1]\.[0-9][0-9] */ { printf "%-10s %-10s %-10s %-10s\n", $1, $2, $3, $4; }' food_prices.list 
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Filter-and-Print-Items-Using-Awk-and-Printf.gif)
>Filter and Print Items Using Awk and Printf

2. Using $0 field. Awk uses the variable 0 to store the whole input line. This is handy for solving the problem above and it is simple and fast as follows:

```
$ awk '/ *\$[2-9]\.[0-9][0-9] */ { print $0 "*" ; } / *\$[0-1]\.[0-9][0-9] */ { print ; }' food_prices.list 
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Filter-and-Print-Items-Using-Awk-and-Variable.gif)
>Filter and Print Items Using Awk and Variable

Conclusion
That’s it for now and these are simple ways of filtering text using pattern specific action that can help in flagging lines of text or strings in a file using Awk command.

Hope you find this article helpful and remember to read the next part of the series which will focus on using comparison operators using awk tool.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/awk-filter-text-or-string-using-patterns/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/

