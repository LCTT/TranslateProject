[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using data from spreadsheets in Fedora with Python)
[#]: via: (https://fedoramagazine.org/using-data-from-spreadsheets-in-fedora-with-python/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Using data from spreadsheets in Fedora with Python
======

![][1]

[Python][2] is one of the most popular and powerful programming languages available. Because it’s free and open source, it’s available to everyone — and most Fedora systems come with the language already installed. Python is useful for a wide variety of tasks, but among them is processing comma-separated value (**CSV**) data. CSV files often start off life as tables or spreadsheets. This article shows how to get started working with CSV data in Python 3.

CSV data is precisely what it sounds like. A CSV file includes one row of data at a time, with data values separated by commas. Each row is defined by the same _fields_. Short CSV files are often easily read and understood. But longer data files, or those with more fields, may be harder to parse with the naked eye, so computers work better in those cases.

Here’s a simple example where the fields are _Name_, _Email_, and _Country_. In this example, the CSV data includes a field definition as the first row, although that is not always the case.

```
Name,Email,Country
John Q. Smith,jqsmith@example.com,USA
Petr Novak,pnovak@example.com,CZ
Bernard Jones,bjones@example.com,UK
```

### Reading CSV from spreadsheets

Python helpfully includes a _csv_ module that has functions for reading and writing CSV data. Most spreadsheet applications, both native like Excel or Numbers, and web-based such as Google Sheets, can export CSV data. In fact, many other services that can publish tabular reports will also export as CSV (PayPal for instance).

The Python _csv_ module has a built in reader method called _DictReader_ that can deal with each data row as an ordered dictionary (OrderedDict). It expects a file object to access the CSV data. So if our file above is called _example.csv_ in the current directory, this code snippet is one way to get at this data:

```
f = open('example.csv', 'r')
from csv import DictReader
d = DictReader(f)
data = []
for row in d:
    data.append(row)
```

Now the _data_ object in memory is a list of OrderedDict objects :

```
[OrderedDict([('Name', 'John Q. Smith'),
               ('Email', 'jqsmith@example.com'),
               ('Country', 'USA')]),
  OrderedDict([('Name', 'Petr Novak'),
               ('Email', 'pnovak@example.com'),
               ('Country', 'CZ')]),
  OrderedDict([('Name', 'Bernard Jones'),
               ('Email', 'bjones@example.com'),
               ('Country', 'UK')])]
```

Referencing each of these objects is easy:

```
>>> print(data[0]['Country'])
USA
>>> print(data[2]['Email'])
bjones@example.com
```

By the way, if you have to deal with a CSV file with no header row of field names, the _DictReader_ class lets you define them. In the example above, add the _fieldnames_ argument and pass a sequence of the names:

```
d = DictReader(f, fieldnames=['Name', 'Email', 'Country'])
```

### A real world example

I recently wanted to pick a random winner from a long list of individuals. The CSV data I pulled from spreadsheets was a simple list of names and email addresses.

Fortunately, Python also has a helpful _random_ module good for generating random values. The _randrange_ function in the _Random_ class from that module was just what I needed. You can give it a regular range of numbers — like integers — and a step value between them. The function then generates a random result, meaning I could get a random integer (or row number!) back within the total number of rows in my data.

So this small program worked well:

```
from csv import DictReader
from random import Random

d = DictReader(open('mydata.csv'))
data = []
for row in d:
    data.append(row)

r = Random()
winner = data[r.randrange(0, len(data), 1)]
print('The winner is:', winner['Name'])
print('Email address:', winner['Email'])
```

Obviously this example is extremely simple. Spreadsheets themselves include sophisticated ways to analyze data. However, if you want to do something outside the realm of your spreadsheet app, Python may be just the trick!

* * *

_Photo by [Isaac Smith][3] on [Unsplash][4]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-data-from-spreadsheets-in-fedora-with-python/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/spreadsheets-python-816x345.jpg
[2]: https://python.org
[3]: https://unsplash.com/@isaacmsmith?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/spreadsheets?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
