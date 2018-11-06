Introducing pydbgen: A random dataframe/database table generator
======
Simple tool generates large database files with multiple tables to practice SQL commands for data science.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK)

When you start learning data science, often your biggest worry is not the algorithms or techniques but getting access to raw data. While there are many high-quality, real-life datasets available on the web for trying out cool machine learning techniques, I've found that the same is not true when it comes to learning SQL.

For data science, having a basic familiarity with SQL is almost as important as knowing how to write code in Python or R. But it's far easier to find toy datasets on Kaggle than it is to access a large enough database with real data (such as name, age, credit card, social security number, address, birthday, etc.) specifically designed or curated for machine learning tasks.

Wouldn't it be great to have a simple tool or library to generate a large database with multiple tables filled with data of your own choice?

Aside from beginners in data science, even seasoned software testers may find it useful to have a simple tool where, with a few lines of code, they can generate arbitrarily large data sets with random (fake), yet meaningful entries.

For this reason, I am glad to introduce a lightweight Python library called **[pydbgen][1]**. In this article, I'll briefly share some information about the package, and you can learn much more [by reading the docs][2].

### What is pydbgen?

Pydbgen is a lightweight, pure-Python library to generate random useful entries (e.g., name, address, credit card number, date, time, company name, job title, license plate number, etc.) and save them in a Pandas dataframe object, as an SQLite table in a database file, or in a Microsoft Excel file.

### How to install pydbgen

The current version (1.0.5) is hosted on PyPI (the Python Package Index repository). You need to have [Faker][3] installed to make this work. To install Pydbgen, enter:

```
pip install pydbgen
```

It has been tested on Python 3.6 and won't work on Python 2 installations.

### How to use it

To start using Pydbgen, initiate a **pydb** object.

```
import pydbgen
from pydbgen import pydbgen
myDB=pydbgen.pydb()
```

Then you can access the various internal functions exposed by the **pydb** object. For example, to print random US cities, enter:

```
myDB.city_real()
>> 'Otterville'
for _ in range(10):
    print(myDB.license_plate())
>> 8NVX937
   6YZH485
   XBY-564
   SCG-2185
   XMR-158
   6OZZ231
   CJN-850
   SBL-4272
   TPY-658
   SZL-0934
```

By the way, if you enter **city** instead of **city_real** , it will return fictitious city names.

```
print(myDB.gen_data_series(num=8,data_type='city'))
>>
New Michelle
Robinborough
Leebury
Kaylatown
Hamiltonfort
Lake Christopher
Hannahstad
West Adamborough
```

### Generate a Pandas dataframe with random entries

You can choose how many and what data types will be generated. Note that everything returns as string/texts.

```
testdf=myDB.gen_dataframe(5,['name','city','phone','date'])
testdf
```

The resulting dataframe looks like the following image.

![](https://opensource.com/sites/default/files/uploads/pydbgen_pandas-dataframe.png)

### Generate a database table

You can choose how many and what data types will be generated. Everything is returned in the text/VARCHAR data type for the database. You can specify the database filename and the table name.

```
myDB.gen_table(db_file='Testdb.DB',table_name='People',

fields=['name','city','street_address','email'])
```

This generates a .db file which can be used with MySQL or the SQLite database server. The following image shows a database table opened in DB Browser for SQLite.
![](https://opensource.com/sites/default/files/uploads/pydbgen_db-browser-for-sqlite.png)

### Generate an Excel file

Similar to the examples above, the following code will generate an Excel file with random data. Note that **phone_simple** is set to **False** so it can generate complex, long-form phone numbers. This can come in handy when you want to experiment with more involved data extraction codes.

```
myDB.gen_excel(num=20,fields=['name','phone','time','country'],
phone_simple=False,filename='TestExcel.xlsx')
```

The resulting file looks like this image:
![](https://opensource.com/sites/default/files/uploads/pydbgen_excel.png)

### Generate random email IDs for scrap use

A built-in method in pydbgen is **realistic_email** , which generates random email IDs from a seed name. This is helpful when you don't want to use your real email address on the web—but something close.

```
for _ in range(10):
    print(myDB.realistic_email('Tirtha Sarkar'))
>>
Tirtha_Sarkar@gmail.com
Sarkar.Tirtha@outlook.com
Tirtha_S48@verizon.com
Tirtha_Sarkar62@yahoo.com
Tirtha.S46@yandex.com
Tirtha.S@att.com
Sarkar.Tirtha60@gmail.com
TirthaSarkar@zoho.com
Sarkar.Tirtha@protonmail.com
Tirtha.S@comcast.net
```

### Future improvements and user contributions

There may be many bugs in the current version—if you notice any and your program crashes during execution (except for a crash due to your incorrect entry), please let me know. Also, if you have a cool idea to contribute to the source code, the [GitHub repo][1] is open. Some questions readily come to mind:

  * Can we integrate some machine learning/statistical modeling with this random data generator?
  * Should a visualization function be added to the generator?



The possibilities are endless and exciting!

If you have any questions or ideas to share, please contact me at [tirthajyoti[AT]gmail.com][4]. If you are, like me, passionate about machine learning and data science, please [add me on LinkedIn][5] or [follow me on Twitter][6]. Also, check my [GitHub repo][7] for other fun code snippets in Python, R, or MATLAB and some machine learning resources.

Originally published on [Towards Data Science][8]. Licensed under [CC BY-SA 4.0][9].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/pydbgen-random-database-table-generator

作者：[Tirthajyoti Sarkar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tirthajyoti
[b]: https://github.com/lujun9972
[1]: https://github.com/tirthajyoti/pydbgen
[2]: http://pydbgen.readthedocs.io/en/latest/
[3]: https://faker.readthedocs.io/en/latest/index.html
[4]: mailto:tirthajyoti@gmail.com
[5]: https://www.linkedin.com/in/tirthajyoti-sarkar-2127aa7/
[6]: https://twitter.com/tirthajyotiS
[7]: https://github.com/tirthajyoti?tab=repositories
[8]: https://towardsdatascience.com/introducing-pydbgen-a-random-dataframe-database-table-generator-b5c7bdc84be5
[9]: https://creativecommons.org/licenses/by-sa/4.0/
