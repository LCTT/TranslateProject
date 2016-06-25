ictlyh Translating
How to Use Awk to Print Fields and Columns in File
===================================================

In this part of our [Linux Awk command series][1], we shall have a look at one of the most important features of Awk, which is field editing.

It is good to know that Awk automatically divides input lines provided to it into fields, and a field can be defined as a set of characters that are separated from other fields by an internal field separator.

![](http://www.tecmint.com/wp-content/uploads/2016/04/Awk-Print-Fields-and-Columns.png)
>Awk Print Fields and Columns

If you are familiar with the Unix/Linux or do [bash shell programming][2], then you should know what internal field separator (IFS) variable is. The default IFS in Awk are tab and space.

This is how the idea of field separation works in Awk: when it encounters an input line, according to the IFS defined, the first set of characters is field one, which is accessed using $1, the second set of characters is field two, which is accessed using $2, the third set of characters is field three, which is accessed using $3 and so forth till the last set of character(s).

To understand this Awk field editing better, let us take a look at the examples below:

**Example 1**: I have created a text file called tecmintinfo.txt.

```
# vi tecmintinfo.txt
# cat tecmintinfo.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Create-File-in-Linux.png)
>Create File in Linux

Then from the command line, I try to print the first, second and third fields from the file tecmintinfo.txt using the command below:

```
$ awk '//{print $1 $2 $3 }' tecmintinfo.txt
TecMint.comisthe
```

From the output above, you can see that the characters from the first three fields are printed based on the IFS defined which is space:

- Field one which is “TecMint.com” is accessed using $1.
- Field two which is “is” is accessed using $2.
- Field three which is “the” is accessed using $3.

If you have noticed in the printed output, the field values are not separated and this is how print behaves by default.

To view the output clearly with space between the field values, you need to add (,) operator as follows:

```
$ awk '//{print $1, $2, $3; }' tecmintinfo.txt

TecMint.com is the
```

One important thing to note and always remember is that the use of ($) in Awk is different from its use in shell scripting.

Under shell scripting ($) is used to access the value of variables while in Awk ($) it is used only when accessing the contents of a field but not for accessing the value of variables.

**Example 2**: Let us take a look at one other example using a file which contains multiple lines called my_shoping.list.

```
No	Item_Name		Unit_Price	Quantity	Price
1	Mouse			#20,000		   1		#20,000
2 	Monitor			#500,000	   1		#500,000
3	RAM_Chips		#150,000	   2		#300,000
4	Ethernet_Cables	        #30,000		   4		#120,000	
```

Say you wanted to only print Unit_Price of each item on the shopping list, you will need to run the command below:

```
$ awk '//{print $2, $3 }' my_shopping.txt 

Item_Name Unit_Price
Mouse #20,000
Monitor #500,000
RAM_Chips #150,000
Ethernet_Cables #30,000
```

Awk also has a printf command that helps you to format your output is a nice way as you can see the above output is not clear enough.

Using printf to format output of the Item_Name and Unit_Price:

```
$ awk '//{printf "%-10s %s\n",$2, $3 }' my_shopping.txt 

Item_Name  Unit_Price
Mouse      #20,000
Monitor    #500,000
RAM_Chips  #150,000
Ethernet_Cables #30,000
```

### Summary

Field editing is very important when using Awk to filter text or strings, it helps you get particular data in columns in a list. And always remember that the use of ($) operator in Awk is different from that in shell scripting.

I hope the article was helpful to you and for any additional information required or questions, you can post a comment in the comment section.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/awk-print-fields-columns-with-space-separator/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/tag/awk-command/
[2]: http://www.tecmint.com/category/bash-shell/
