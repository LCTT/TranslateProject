[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Pretty Print JSON File in Linux Terminal)
[#]: via: (https://itsfoss.com/pretty-print-json-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Pretty Print JSON File in Linux Terminal
======

[JSON][1] files are awesome because they store collection of data in a human-readable format. However, reading the JSON file can be a pain if the JSON file is minified.

Take this for an example:

![Minified JSON is difficult to read][2]

A computer can easily read it. Even a human can still read it but if JSON file is properly formatted to display the content, it will be much easier. I mean JSON files are supposed to read like this after all:

![Pretty Printed JSON is easier to read][3]

You can use most text editor with some plugins to display it with proper formatting. However, if you are stuck to a terminal or if you want to do it in your shell script, things will be different.

If you got a minified file, let me show you how to pretty print the JSON file in Linux terminal.

### Pretty print JSON with jq command in Linux

[jq][4] is a command line JSON processor. You can use it to slice, filter, map and transform structured data. I am not going in details about using jq command line tool here.

To use jq, you need to install it first. You can use your [distribution’s package manager][5] to install it. With [universe repository enabled][6], you can install it on Ubuntu using the apt command:

```
sudo apt install jq
```

Once you have it installed, use it in the following manner to pretty print JSON file on the display:

```
jq . sample.json
```

![Pretty printed JSON file][7]

You may also tempt to use cat but I believe it one of the useless use of cat command.

```
cat sample.json | jq
```

Keep in mind that the above command will not impact the original JSON file. No changes will be written to it.

You probably already know [how to redirect the command output to a file in Linux][8]. You probably also know that you cannot redirect to the same file and the tee command is not guaranteed to work all the time.

If you want to modify the original JSON file with pretty print format, you can pipe the parsed output to a new file and then copy it to the original JSON file.

```
jq . sample.json > pretty.json
```

![Pretty printing JSON file in Linux Terminal][9]

#### Bonus: Minify a JSON file with jq command

Let’s take a reverse stance and minify a well formatted JSON file. To minify a JSON file, you can use the compact option -c.

```
jq -c < pretty.json
```

![Minified JSON file display][10]

You can also use cat and redirection if you want:

```
cat pretty.json | jq -c
```

### Using Python to pretty print JSON file in Linux

It’s more likely that you have Python installed on your system. If that’s the case, you can use it pretty print the JSON file in the terminal:

```
python3 -m json.tool sample.json
```

![Pretty printing JSON with Python][11]

I know there are other ways to parse JSON file and print it with proper format. You may explore them on your own but these two are sufficient to do the job which is to pretty print JSON file.

--------------------------------------------------------------------------------

via: https://itsfoss.com/pretty-print-json-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.json.org
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/print-json.png?resize=759%2C253&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-printed-json.png?resize=696%2C538&ssl=1
[4]: https://stedolan.github.io/jq/
[5]: https://itsfoss.com/package-manager/
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-print-json-linux-terminal.png?resize=750%2C557&ssl=1
[8]: https://itsfoss.com/save-command-output-to-file-linux/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-printing-json-linux-terminal.png?resize=750%2C576&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/minify-json-file-linux.png?resize=777%2C253&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/pretty-print-json-with-python.png?resize=777%2C557&ssl=1
