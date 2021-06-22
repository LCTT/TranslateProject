[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Take control of your data with associative arrays in Bash)
[#]: via: (https://opensource.com/article/20/6/associative-arrays-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Take control of your data with associative arrays in Bash
======
Associative arrays let you create lists of key and value pairs, instead
of just numbered values.
![bash logo on green background][1]

If you've ever written code, whether it's a shell script, a Python script, C++, or even Scratch, then you know that variables are vital. Computers and coders use variables as waystations, where they surreptitiously pass information back and forth. For instance, if you need to process a user's name in a shell script, you might set up a variable, put the username into the variable, and then instruct the computer to do something to the variable (check it against a list of authorized users, for example). Variables are important because they enable code to by dynamic: they're placeholders for information that's expected to change every time you run the code.

But variables, because they're so common, can also become rather unwieldy. Often times, you gather so many variables in a code project that it's next to impossible to keep track of them all. You can use clever conventions, such as prefixing all related variables with a common string (user_name, user_pass, user_time, and so on), or you can create a master list of them somewhere for easy reference, but the overhead of keeping track of it all can becoming taxing.

One answer to this problem has, traditionally, been arrays. These have worked well in most coding languages, including shell scripting languages like Bash.

Most shells offer the ability to create, manipulate, and query indexed arrays. In plain English, an indexed array is a list of things prefixed with a number. This list of things, along with their assigned number, is conveniently wrapped up in a single variable, which makes it easy to "carry" around in your code.

[Bash][2], however, includes the ability to create associative arrays, and it treats these arrays the same as any other array. An associative array lets you create lists of key and value pairs, instead of just numbered values.

You can assign values to arbitrary keys:


```
$ declare -A userdata
$ userdata[name]=seth
$ userdata[pass]=8eab07eb620533b083f241ec4e6b9724
$ userdata[login]=`date --utc +%s`
```

Query any key:


```
$ echo "${userdata[name]}"
seth
$ echo "${userdata[login]}"
1583362192
```

Most of the usual array operations you'd expect from an array are available. For instance, you can list all values:


```
$ echo "${userdata[*]}"
8eab07eb620533b083f241ec4e6b9724 seth 1583362192
```

You can view the entire array:


```
$ typeset -A
declare -A BASH_ALIASES='()'
declare -A BASH_CMDS='()'
declare -A userdata='([pass]="8eab07eb620533b083f241ec4e6b9724"
[name]="seth"
[login]="1583362192" )'
```

You can also remove items from your array using the **unset** command:


```
$ unset userdata[pass]
$ typeset -A
[...]
declare -A userdata='([name]="seth"
[login]="1583362192" )'
```

Finally, you can dismiss the entire array.


```
`$ unset "userdata[*]"`
```

### Arrays for data

Arrays are useful tools for storing related data together. You can use a plain old variable in most cases, but sometimes it's more logical to store attributes of a singular data "object" in an array, to keep the data consolidated and indexed. For example, if you're processing login names and times taken from **utmp**, it would be more useful for you to _associate_ the login time with the user to whom the time referred, rather than just storing the two data objects as separate variables with no obvious connection.

Furthermore, unlike variables, an entry in an array doesn't need to exist before you store data in it. You don't have to know exactly how much data is going to get stored before you store it. That can be a big advantage if you're processing data that you can't control or predict: if you don't know how many users to expect in **utmp** one day to the next, it's hard to build a script to contain all the entries. With an array, though, all you have to do is declare one array and read data into it, creating a new key and value pair until you run out of data to ingest.

Arrays are powerful, and they're common in programming languages beyond Bash. Start using them now!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/associative-arrays-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/resources/what-bash
