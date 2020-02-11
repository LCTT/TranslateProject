[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 ways to use PostgreSQL commands)
[#]: via: (https://opensource.com/article/20/2/postgresql-commands)
[#]: author: (Greg Pittman https://opensource.com/users/greg-p)

3 ways to use PostgreSQL commands
======
Whether you need something simple, like a shopping list, or complex,
like a color swatch generator, PostgreSQL commands make it easy.
![Team checklist and to dos][1]

In _[Getting started with PostgreSQL][2]_, I explained how to install, set up, and begin using the open source database software. But there's a lot more you can do with commands in [PostgreSQL][3].

For example, I use Postgres to keep track of my grocery shopping list. I do most of the grocery shopping in our home, and the bulk of it happens once a week. I go to several places to buy the things on my list because each store offers a particular selection or quality or maybe a better price. Initially, I made an HTML form page to manage my shopping list, but it couldn't save my entries. So, I had to wait to make my list all at once, and by then I usually forgot some items we need or I want.

Instead, with PostgreSQL, I can enter bits when I think of them as the week goes on and print out the whole thing right before I go shopping. Here's how you can do that, too.

### Create a simple shopping list

First, enter the database with the **psql **command, then create a table for your list with:


```
`Create table groc (item varchar(20), comment varchar(10));`
```

Type commands like the following to add items to your list:


```
insert into groc values ('milk', 'K');
insert into groc values ('bananas', 'KW');
```

There are two pieces of information (separated by a comma) inside the parentheses: the item you want to buy and letters indicating where you want to buy it and whether it's something you usually buy every week (W).

Since **psql** has a history, you can press the Up arrow and edit the data between the parentheses instead of having to type the whole line for each item.

After entering a handful of items, check what you've entered with:


```
Select * from groc order by comment;

      item      | comment
\----------------+---------
 ground coffee  | H
 butter         | K
 chips          | K
 steak          | K
 milk           | K
 bananas        | KW
 raisin bran    | KW
 raclette       | L
 goat cheese    | L
 onion          | P
 oranges        | P
 potatoes       | P
 spinach        | PW
 broccoli       | PW
 asparagus      | PW
 cucumber       | PW
 sugarsnap peas | PW
 salmon         | S
(18 rows)
```

This command orders the results by the _comment_ column so that the items are grouped by where you buy them to make it easier to shop.

By using a W to indicate your weekly purchases, you can keep your weekly items on the list when you clear out the table to prepare for the next week's list. To so that, enter:


```
`delete from groc where comment not like '%W';`
```

Notice that in PostgreSQL, **%** is the wildcard character (instead of an asterisk). So, to save typing, you might type:


```
`delete from groc where item like 'goat%';`
```

You can't use **item = 'goat%'**; it won't work.

When you're ready to shop, output your list to print it or send it to your phone with:


```
\o groclist.txt
select * from groc order by comment;
\o
```

The last command, **\o**, with nothing afterward, resets the output to the command line. Otherwise, all output will continue to go to the groc file you created.

### Analyze complex tables

This item-by-item entry may be okay for short tables, but what about really big ones? A couple of years ago, I was helping the team at [FreieFarbe.de][4] to create a swatchbook of the free colors (freieFarbe means "free colors" in German) from its HLC color palette, where virtually any imaginable print color can be specified by its hue, luminosity (brightness), and chroma (saturation). The result was the [HLC Color Atlas][5], and here's how we did it.

The team sent me files with color specifications so I could write Python scripts that would work with Scribus to generate the swatchbooks of color patches easily. One example started like:


```
HLC, C, M, Y, K
H010_L15_C010, 0.5, 49.1, 0.1, 84.5
H010_L15_C020, 0.0, 79.7, 15.1, 78.9
H010_L25_C010, 6.1, 38.3, 0.0, 72.5
H010_L25_C020, 0.0, 61.8, 10.6, 67.9
H010_L25_C030, 0.0, 79.5, 18.5, 62.7
H010_L25_C040, 0.4, 94.2, 17.3, 56.5
H010_L25_C050, 0.0, 100.0, 15.1, 50.6
H010_L35_C010, 6.1, 32.1, 0.0, 61.8
H010_L35_C020, 0.0, 51.7, 8.4, 57.5
H010_L35_C030, 0.0, 68.5, 17.1, 52.5
H010_L35_C040, 0.0, 81.2, 22.0, 46.2
H010_L35_C050, 0.0, 91.9, 20.4, 39.3
H010_L35_C060, 0.1, 100.0, 17.3, 31.5
H010_L45_C010, 4.3, 27.4, 0.1, 51.3
```

This is slightly modified from the original, which separated the data with tabs. I transformed it into a CSV (comma-separated value) file, which I prefer to use with Python. (CSV files are also very useful because they can be imported easily into a spreadsheet program.)

In each line, the first item is the color name, and it's followed by its C, M, Y, and K color values. The file consisted of 1,793 colors, and I wanted a way to analyze the information to get a sense of the range of values. This is where PostgreSQL comes into play. I did not want to enter all of this data manually—I don't think I could without errors (and headaches). Fortunately, PostgreSQL has a command for this.

My first step was to create the database with:


```
`Create table hlc_cmyk (color varchar(40), c decimal, m decimal, y decimal, k decimal);`
```

Then I brought in the data with:


```
`\copy  hlc_cmyk from '/home/gregp/HLC_Atlas_CMYK_SampleData.csv' with (header, format CSV);`
```

The backslash at the beginning is there because using the plain **copy** command is restricted to root and the Postgres superuser. In the parentheses, **header** means the first line contains headings and should be ignored, and **CSV** means the file format is CSV. Note that parentheses are not required around the color name in this method.

If the operation is successful, I see a message that says **COPY NNNN**, where the N's refer to the number of rows inserted into the table.

Finally, I can query the table with:


```
select * from hlc_cmyk;

     color     |   c   |   m   |   y   |  k  
\---------------+-------+-------+-------+------
 H010_L15_C010 |   0.5 |  49.1 |   0.1 | 84.5
 H010_L15_C020 |   0.0 |  79.7 |  15.1 | 78.9
 H010_L25_C010 |   6.1 |  38.3 |   0.0 | 72.5
 H010_L25_C020 |   0.0 |  61.8 |  10.6 | 67.9
 H010_L25_C030 |   0.0 |  79.5 |  18.5 | 62.7
 H010_L25_C040 |   0.4 |  94.2 |  17.3 | 56.5
 H010_L25_C050 |   0.0 | 100.0 |  15.1 | 50.6
 H010_L35_C010 |   6.1 |  32.1 |   0.0 | 61.8
 H010_L35_C020 |   0.0 |  51.7 |   8.4 | 57.5
 H010_L35_C030 |   0.0 |  68.5 |  17.1 | 52.5
```

It goes on like this for all 1,793 rows of data. In retrospect, I can't say that this query was absolutely necessary for the HLC and Scribus task, but it allayed some of my anxieties about the project.

To generate the HLC Color Atlas, I automated creating the color charts with Scribus for the 13,000+ colors in those pages of color swatches.

I could have used the **copy** command to output my data:


```
`\copy hlc_cmyk to '/home/gregp/hlc_cmyk_backup.csv' with (header, format CSV);`
```

I also could restrict the output according to certain values with a **where** clause.

For example, the following command will only send the table values for the hues that begin with H10.


```
`\copy hlc_cmyk to '/home/gregp/hlc_cmyk_backup.csv' with (header, format CSV) where color like 'H10%';`
```

### Back up or transfer a database or table

The final command I will mention here is **pg_dump**, which is used to back up a PostgreSQL database and runs outside of the **psql** console. For example:


```
pg_dump gregp -t hlc_cmyk &gt; hlc.out
pg_dump gregp &gt; dball.out
```

The first line exports the **hlc_cmyk** table along with its structure. The second line dumps all the tables inside the **gregp** database. This is very useful for backing up or transferring a database or tables. 

To transfer a database or table to another computer, first, create a database on the other computer (see my "[getting started][2]" article for details), then do the reverse process:


```
`psql -d gregp -f dball.out`
```

This creates all the tables and enters the data in one step.

### Conclusion

In this article, we have seen how to use the **WHERE** parameter to restrict operations, along with the use of the PostgreSQL wildcard character **%**. We've also seen how to load a large amount of data into a table, then output some or all of the table data to a file, or even your entire database with all its individual tables.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/postgresql-commands

作者：[Greg Pittman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://opensource.com/article/19/11/getting-started-postgresql
[3]: https://www.postgresql.org/
[4]: http://freiefarbe.de
[5]: https://www.freiefarbe.de/en/thema-farbe/hlc-colour-atlas/
