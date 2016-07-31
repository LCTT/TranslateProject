Being translated by ChrisLeeGit

Learn How to Use Awk Special Patterns ‘BEGIN and END’ – Part 9
===============================================================

In Part 8 of this Awk series, we introduced some powerful Awk command features, that is variables, numeric expressions and assignment operators.

As we advance, in this segment, we shall cover more Awk features, and that is the special patterns: `BEGIN` and `END`.

![](http://www.tecmint.com/wp-content/uploads/2016/07/Learn-Awk-Patterns-BEGIN-and-END.png)
>Learn Awk Patterns BEGIN and END

These special features will prove helpful as we try to expand on and explore more methods of building complex Awk operations.

To get started, let us drive our thoughts back to the introduction of the Awk series, remember when we started this series, I pointed out that the general syntax of a running an Awk command is:

```
# awk 'script' filenames  
```

And in the syntax above, the Awk script has the form:

```
/pattern/ { actions } 
```

When you consider the pattern in the script, it is normally a regular expression, additionally, you can also think of pattern as special patterns `BEGIN` and `END`. Therefore, we can also write an Awk command in the form below:

```
awk '
BEGIN { actions } 
/pattern/ { actions }
/pattern/ { actions }
……….
END { actions } 
' filenames  
```

In the event that you use the special patterns: `BEGIN` and `END` in an Awk script, this is what each of them means:

- `BEGIN` pattern: means that Awk will execute the action(s) specified in `BEGIN` once before any input lines are read.
- `END` pattern: means that Awk will execute the action(s) specified in `END` before it actually exits.

And the flow of execution of the an Awk command script which contains these special patterns is as follows:

- When the `BEGIN` pattern is used in a script, all the actions for `BEGIN` are executed once before any input line is read.
- Then an input line is read and parsed into the different fields.
- Next, each of the non-special patterns specified is compared with the input line for a match, when a match is found, the action(s) for that pattern are then executed. This stage will be repeated for all the patterns you have specified.
- Next, stage 2 and 3 are repeated for all input lines.
- When all input lines have been read and dealt with, in case you specify the `END` pattern, the action(s) will be executed.

You should always remember this sequence of execution when working with the special patterns to achieve the best results in an Awk operation.

To understand it all, let us illustrate using the example from part 8, about the list of domains owned by Tecmint, as stored in a file named domains.txt.

```
news.tecmint.com
tecmint.com
linuxsay.com
windows.tecmint.com
tecmint.com
news.tecmint.com
tecmint.com
linuxsay.com
tecmint.com
news.tecmint.com
tecmint.com
linuxsay.com
windows.tecmint.com
tecmint.com
```

```
$ cat ~/domains.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/View-Contents-of-File.png)
>View Contents of File

In this example, we want to count the number of times the domain `tecmint.com` is listed in the file domains.txt. So we wrote a small shell script to help us do that using the idea of variables, numeric expressions and assignment operators which has the following content:

```
#!/bin/bash
for file in $@; do
if [ -f $file ] ; then
#print out filename
echo "File is: $file"
#print a number incrementally for every line containing tecmint.com 
awk '/^tecmint.com/ { counter+=1 ; printf "%s\n", counter ; }' $file
else
#print error info incase input is not a file
echo "$file is not a file, please specify a file." >&2 && exit 1
fi
done
#terminate script with exit code 0 in case of successful execution 
exit 0
```

Let us now employ the two special patterns: `BEGIN` and `END` in the Awk command in the script above as follows:

We shall alter the script:

```
awk '/^tecmint.com/ { counter+=1 ; printf "%s\n", counter ; }' $file
```

To:

```
awk ' BEGIN {  print "The number of times tecmint.com appears in the file is:" ; }
/^tecmint.com/ {  counter+=1  ;  }
END {  printf "%s\n",  counter  ; } 
'  $file
```

After making the changes to the Awk command, the complete shell script now looks like this:

```
#!/bin/bash
for file in $@; do
if [ -f $file ] ; then
#print out filename
echo "File is: $file"
#print the total number of times tecmint.com appears in the file
awk ' BEGIN {  print "The number of times tecmint.com appears in the file is:" ; }
/^tecmint.com/ {  counter+=1  ;  }
END {  printf "%s\n",  counter  ; } 
'  $file
else
#print error info incase input is not a file
echo "$file is not a file, please specify a file." >&2 && exit 1
fi
done
#terminate script with exit code 0 in case of successful execution 
exit 0
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/Awk-BEGIN-and-END-Patterns.png)
>Awk BEGIN and END Patterns

When we run the script above, it will first of all print the location of the file domains.txt, then the Awk command script is executed, where the `BEGIN` special pattern helps us print out the message “`The number of times tecmint.com appears in the file is:`” before any input lines are read from the file.

Then our pattern, `/^tecmint.com/` is compared against every input line and the action, `{ counter+=1 ; }` is executed for each input line, which counts the number of times `tecmint.com` appears in the file.

Finally, the `END` pattern will print the total the number of times the domain `tecmint.com` appears in the file.

```
$ ./script.sh ~/domains.txt 
```
![](http://www.tecmint.com/wp-content/uploads/2016/07/Script-to-Count-Number-of-Times-String-Appears.png)
>Script to Count Number of Times String Appears

To conclude, we walked through more Awk features exploring on the concepts of special pattern: `BEGIN` and `END`.

As I pointed out before, these Awk features will help us build more complex text filtering operations, there is more to cover under Awk features and in part 10, we shall approach the idea of Awk built-in variables, so stay connected.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/learn-use-awk-special-patterns-begin-and-end/

作者：[Aaron Kili][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[校对ID](https://github.com/校对ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
