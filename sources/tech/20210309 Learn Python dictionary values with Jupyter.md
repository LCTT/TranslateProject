[#]: subject: (Learn Python dictionary values with Jupyter)
[#]: via: (https://opensource.com/article/21/3/dictionary-values-python)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Learn Python dictionary values with Jupyter
======
Implementing data structures with dictionaries helps you access
information more quickly.
![Hands on a keyboard with a Python book ][1]

Dictionaries are the Python programming language's way of implementing data structures. A Python dictionary consists of several key-value pairs; each pair maps the key to its associated value.

For example, say you're a teacher who wants to match students' names to their grades. You could use a Python dictionary to map the keys (names) to their associated values (grades).

If you need to find a specific student's grade on an exam, you can access it from your dictionary. This lookup shortcut should save you time over parsing an entire list to find the student's grade.

This article shows you how to access dictionary values through each value's key. Before you begin the tutorial, make sure you have the [Anaconda package manager][2] and [Jupyter Notebook][3] installed on your machine.

### 1\. Open a new notebook in Jupyter

Begin by opening Jupyter and running it in a tab in your web browser. Then:

  1. Go to **File** in the top-left corner.
  2. Select **New Notebook**, then **Python 3**.



![Create Jupyter notebook][4]

(Lauren Maffeo, [CC BY-SA 4.0][5])

Your new notebook starts off untitled, but you can rename it anything you'd like. I named mine **OpenSource.com Data Dictionary Tutorial**.

The line number you see in your new Jupyter notebook is where you will write your code. (That is, your input.)

On macOS, you'll hit **Shift** then **Return** to receive your output. Make sure to do this before creating new line numbers; otherwise, any additional code you write might not run.

### 2\. Create a key-value pair

Write the keys and values you wish to access in your dictionary. To start, you'll need to define what they are in the context of your dictionary:


```
empty_dictionary = {}
grades = {
    "Kelsey": 87,
    "Finley": 92
}

one_line = {a: 1, b: 2}
```

![Code for defining key-value pairs in the dictionary][6]

(Lauren Maffeo, [CC BY-SA 4.0][5])

This allows the dictionary to associate specific keys with their respective values. Dictionaries store data by name, which allows faster lookup.

### 3\. Access a dictionary value by its key

Say you want to find a specific dictionary value; in this case, a specific student's grade. To start, hit **Insert** then **Insert Cell Below**.

![Inserting a new cell in Jupyter][7]

(Lauren Maffeo, [CC BY-SA 4.0][5])

In your new cell, define the keys and values in your dictionary.

Then, find the value you need by telling your dictionary to print that value's key. For example, look for a specific student's name—Kelsey:


```
# Access data in a dictionary
grades = {
    "Kelsey": 87,
    "Finley": 92
}

print(grades["Kelsey"])
87
```

![Code to look for a specific value][8]

(Lauren Maffeo, [CC BY-SA 4.0][5])

Once you've asked for Kelsey's grade (that is, the value you're trying to find), hit **Shift** (if you're on macOS), then **Return**.

You see your desired value—Kelsey's grade—as an output below your cell.

### 4\. Update an existing key

What if you realize you added the wrong grade for a student to your dictionary? You can fix it by updating your dictionary to store an additional value.

To start, choose which key you want to update. In this case, say you entered Finley's grade incorrectly. That is the key you'll update in this example.

To update Finley's grade, insert a new cell below, then create a new key-value pair. Tell your cell to print the dictionary, then hit **Shift** and **Return**:


```
grades["Finley"] = 90
print(grades)

{'Kelsey': 87; "Finley": 90}
```

![Code for updating a key][9]

(Lauren Maffeo, [CC BY-SA 4.0][5])

The updated dictionary, with Finley's new grade, appears as your output.

### 5\. Add a new key

Say you get a new student's grade for an exam. You can add that student's name and grade to your dictionary by adding a new key-value pair.

Insert a new cell below, then add the new student's name and grade as a key-value pair. Once you're done, tell your cell to print the dictionary, then hit **Shift** and **Return**:


```
grades["Alex"] = 88
print(grades)

{'Kelsey': 87, 'Finley': 90, 'Alex': 88}
```

![Add a new key][10]

(Lauren Maffeo, [CC BY-SA 4.0][5])

All key-value pairs should appear as output.

### Using dictionaries

Remember that keys and values can be any data type, but it's rare for them to be [non-primitive types][11]. Additionally, dictionaries don't store or structure their content in any specific order. If you need an ordered sequence of items, it's best to create a list in Python, not a dictionary.

If you're thinking of using a dictionary, first confirm if your data is structured the right way, i.e., like a phone book. If not, then using a list, tuple, tree, or other data structure might be the best option.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/dictionary-values-python

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://docs.anaconda.com/anaconda/
[3]: https://opensource.com/article/18/3/getting-started-jupyter-notebooks
[4]: https://opensource.com/sites/default/files/uploads/new-jupyter-notebook.png (Create Jupyter notebook)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/define-keys-values.png (Code for defining key-value pairs in the dictionary)
[7]: https://opensource.com/sites/default/files/uploads/jupyter_insertcell.png (Inserting a new cell in Jupyter)
[8]: https://opensource.com/sites/default/files/uploads/lookforvalue.png (Code to look for a specific value)
[9]: https://opensource.com/sites/default/files/uploads/jupyter_updatekey.png (Code for updating a key)
[10]: https://opensource.com/sites/default/files/uploads/jupyter_addnewkey.png (Add a new key)
[11]: https://www.datacamp.com/community/tutorials/data-structures-python
