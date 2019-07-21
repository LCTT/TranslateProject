[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Save and load Python data with JSON)
[#]: via: (https://opensource.com/article/19/7/save-and-load-data-python-json)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Save and load Python data with JSON
======
The JSON format saves you from creating your own data formats, and is
particularly easy to learn if you already know Python. Here's how to use
it with Python.
![Cloud and databsae incons][1]

[JSON][2] stands for JavaScript Object Notation. This format is a popular method of storing data in key-value arrangements so it can be parsed easily later. Don’t let the name fool you, though: You can use JSON in Python—not just JavaScript—as an easy way to store data, and this article demonstrates how to get started.

First, take a look at this simple JSON snippet:


```
{
        "name":"tux",
        "health":"23",
        "level":"4"
}
```

That's pure JSON and has not been altered for Python or any other language. Yet if you’re familiar with Python, you might notice that this example JSON code looks an awful lot like a Python dictionary. In fact, the two are very similar: If you are comfortable with Python lists and dictionaries, then JSON is a natural fit for you.

### Storing data in JSON format

You might consider using JSON if your application needs to store somewhat complex data. While you may have previously resorted to custom text configuration files or data formats, JSON offers you structured, recursive storage, and Python’s JSON module offers all of the parsing libraries necessary for getting this data in and out of your application. So, you don’t have to write parsing code yourself, and other programmers don’t have to decode a new data format when interacting with your application. For this reason, JSON is easy to use, and ubiquitous.

Here is some sample Python code using a dictionary within a dictionary:


```
#!/usr/bin/env python3

import json

# instantiate an empty dict
team = {}

# add a team member
team['tux'] = {'health': 23, 'level': 4}
team['beastie'] = {'health': 13, 'level': 6}
team['konqi'] = {'health': 18, 'level': 7}
```

This code creates a Python dictionary called **team**. It’s empty initially (you can create one that's already populated, but that’s impossible if you don’t have the data to put into the dictionary yet).

To add to the **dict** object, you create a key, such as **tux**, **beastie**, or **konqi** in the example code, and then provide a value. In this case, the value is _another_ dictionary full of player statistics.

Dictionaries are mutable. You can add, remove, and update the data they contain as often as you please. This format is ideal storage for data that your application frequently uses.

### Saving data in JSON format 

If the data you’re storing in your dictionary is user data that needs to persist after the application quits, then you must write the data to a file on disk. This is where the JSON Python module comes in:


```
with open('mydata.json', 'w') as f:
    json.dump(team, f)
```

This code block creates a file called **mydata.json** and opens it in write mode. The file is represented with the variable **f** (a completely arbitrary designation; you can use whatever variable name you like, such as **file**, **FILE**, **output**, or practically anything). Meanwhile, the JSON module’s **dump** function is used to dump the data from the **dict** into the data file.

Saving data from your application is as simple as that, and the best part about this is that the data is structured and predictable. To see, take a look at the resulting file:


```
$ cat mydata.json
{"tux": {"health": 23, "level": 4}, "beastie": {"health": 13, "level": 6}, "konqi": {"health": 18, "level": 7}}
```

### Reading data from a JSON file

If you are saving data to JSON format, you probably want to read the data back into Python eventually. To do this, use the Python JSON module’s **json.load** function:


```
#!/usr/bin/env python3

import json

f = open('mydata.json')
team = json.load(f)

print(team['tux'])
print(team['tux']['health'])
print(team['tux']['level'])

print(team['beastie'])
print(team['beastie']['health'])
print(team['beastie']['level'])

# when finished, close the file
f.close()
```

This function implements the inverse, more or less, of saving the file: an arbitrary variable (**f**) represents the data file, and then the JSON module’s **load** function dumps the data from the file into the arbitrary **team** variable.

The **print** statements in the code sample demonstrate how to use the data. It can be confusing to compound **dict** key upon **dict** key, but as long as you are familiar with your own dataset, or else can read the JSON source to get a mental map of it, the logic makes sense.

Of course, the **print** statements don’t have to be hard-coded. You could rewrite the sample application using a **for** loop:


```
for i in team.values():
    print(i)
```

### Using JSON

As you can see, JSON integrates surprisingly well with Python, so it’s a great format when your data fits in with its model. JSON is flexible and simple to use, and learning one basically means you’re learning the other, so consider it for data storage the next time you’re working on a Python application.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/save-and-load-data-python-json

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg (Cloud and databsae incons)
[2]: https://json.org
