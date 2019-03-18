[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Parse And Pretty Print JSON With Linux Commandline Tools)
[#]: via: (https://www.ostechnix.com/how-to-parse-and-pretty-print-json-with-linux-commandline-tools/)
[#]: author: (EDITOR https://www.ostechnix.com/author/editor/)

How To Parse And Pretty Print JSON With Linux Commandline Tools
======

**JSON** is a lightweight and language independent data storage format, easy to integrate with most programming languages and also easy to understand by humans, of course when properly formatted. The word JSON stands for **J** ava **S** cript **O** bject **N** otation, though it starts with JavaScript, and primarily used to exchange data between server and browser, but now being used in many fields including embedded systems. Here we’re going to parse and pretty print JSON with command line tools on Linux. It’s extremely useful for handling large JSON data in a shell scripts, or manipulating JSON data in a shell script.

### What is pretty printing?

The JSON data is structured to be somewhat more human readable. However in most cases, JSON data is stored in a single line, even without a line ending character.

Obviously that’s not very convenient for reading and editing manually.

That’s when pretty print is useful. The name is quite self explanatory, re-formatting the JSON text to be more legible by humans. This is known as **JSON pretty printing**.

### Parse And Pretty Print JSON With Linux Commandline Tools

JSON data could be parsed with command line text processors like **awk** , **sed** and **gerp**. In fact JSON.awk is an awk script to do that. However there are some dedicated tools for the same purpose.

  1. **jq** or **jshon** , JSON parser for shell, both of them are quite useful.

  2. Shell scripts like **JSON.sh** or **jsonv.sh** to parse JSON in bash, zsh or dash shell.

  3. **JSON.awk** , JSON parser awk script.

  4. Python modules like **json.tool**.

  5. **underscore-cli** , Node.js and javascript based.




In this tutorial I’m focusing only on **jq** , which is quite powerful JSON parser for shells with advanced filtering and scripting capability.

### JSON pretty printing

JSON data could be in one and nearly illegible for humans, so to make it somewhat readable, JSON pretty printing is here.

**Example:** A data from **jsonip.com** , to get external IP address in JSON format, use **curl** or **wget** tools like below.

```
$ wget -cq http://jsonip.com/ -O -
```

The actual data looks like this:

```
{"ip":"111.222.333.444","about":"/about","Pro!":"http://getjsonip.com"}
```

Now pretty print it with jq:

```
$ wget -cq http://jsonip.com/ -O - | jq '.'
```

This should look like below, after filtering the result with jq.

```
{

 "ip": "111.222.333.444",

 "about": "/about",

 "Pro!": "http://getjsonip.com"

}
```

The Same thing could be done with python **json.tool** module. Here is an example:

```
$ cat anything.json | python -m json.tool
```

This Python based solution should be fine for most users, but it’s not that useful where Python is not pre-installed or could not be installed, like on embedded systems.

However the json.tool python module has a distinct advantage, it’s cross platform. So, you can use it seamlessly on Windows, Linux or mac OS.


### How to parse JSON with jq

First, you need to install jq, it’s already picked up by most GNU/Linux distributions, install it with their respective package installer commands.

On Arch Linux:

```
$ sudo pacman -S jq
```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt-get install jq
```

On Fedora:

```
$ sudo dnf install jq
```

On openSUSE:

```
$ sudo zypper install jq
```

For other OS or platforms, see the [official installation instructions][1].

**Basic filters and identifiers of jq**

jq could read the JSON data either from **stdin** or a **file**. You’ve to use both depending on the situation.

The single symbol of **.** is the most basic filter. These filters are also called as **object identifier-index**. Using a single **.** along with jq basically pretty prints the input JSON file.

**Single quotes** – You don’t have to use the single quote always. But if you’re combining several filters in a single line, then you must use them.

**Double quotes** – You’ve to enclose any special character like **@** , **#** , **$** within two double quotes, like this example, **jq .foo.”@bar”**

**Raw data print** – For any reason, if you need only the final parsed data, not enclosed within a double quote, use the -r flag with the jq command, like this. **– jq -r .foo.bar**.

**Parsing specific data**

To filter out a specific part of JSON, you’ve to look into the pretty printed JSON file’s data hierarchy.

An example of JSON data, from Wikipedia:

```
{

 "firstName": "John",

 "lastName": "Smith",

 "age": 25,

 "address": {

 "streetAddress": "21 2nd Street",

 "city": "New York",

 "state": "NY",

 "postalCode": "10021"

},

 "phoneNumber": [

{

 "type": "home",

 "number": "212 555-1234"

},

{

 "type": "fax",

 "number": "646 555-4567"

}

],

 "gender": {

 "type": "male"

 }

}
```

I’m going to use this JSON data as an example in this tutorial, saved this as **sample.json**.

Let’s say I want to filter out the address from sample.json file. So the command should be like:

```
$ jq .address sample.json
```

**Sample output:**

```
{

 "streetAddress": "21 2nd Street",

 "city": "New York",

 "state": "NY",

 "postalCode": "10021"

}
```

Again let’s say I want the postal code, then I’ve to add another **object identifier-index** , i.e. another filter.

```
$ cat sample.json | jq .address.postalCode
```

Also note that the **filters are case sensitive** and you’ve to use the exact same string to get something meaningful output instead of null.

**Parsing elements from JSON array**

Elements of JSON array are enclosed within square brackets, undoubtedly quite versatile to use.

To parse elements from a array, you’ve to use the **[]identifier** along with other object identifier-index.

In this sample JSON data, the phone numbers are stored inside an array, to get all the contents from this array, you’ve to use only the brackets, like this example.

```
$ jq .phoneNumber[] sample.json
```

Let’s say you just want the first element of the array, then use the array object numbers starting for 0, for the first item, use **[0]** , for the next items, it should be incremented by one each step.

```
$ jq .phoneNumber[0] sample.json
```

**Scripting examples**

Let’s say I want only the the number for home, not entire JSON array data. Here’s when scripting within jq command comes handy.

```
$ cat sample.json | jq -r '.phoneNumber[] | select(.type == "home") | .number'
```

Here first I’m piping the results of one filer to another, then using the select attribute to select a particular type of data, again piping the result to another filter.

Explaining every type of jq filters and scripting is beyond the scope and purpose of this tutorial. It’s highly suggested to read the JQ manual for better understanding given below.



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-parse-and-pretty-print-json-with-linux-commandline-tools/

作者：[EDITOR][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://stedolan.github.io/jq/download/
