[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Looping your way through bash)
[#]: via: (https://www.networkworld.com/article/3449116/looping-your-way-through-bash.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Looping your way through bash
======
There are many ways to loop through data in a bash script and on the command line. Which way is best depends on what you're trying to do.
[Alan Levine / Flickr][1] [(CC BY 2.0)][2]

There are a lot of options for looping in bash whether on the command line or in a script. The choice depends on what you're trying to do.

You may want to loop indefinitely or quickly run through the days of the week. You might want to loop once for every file in a directory or for every account on a server. You might want to loop through every line in a file or have the number of loops be a choice when the script is run. Let's check out some of the options.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

### Simple loops

Probably the simplest loop is a **for** loop like the one below. It loops as many times as there are pieces of text on the line. We could as easily loop through the words **cats are smart** as the numbers 1, 2, 3 and 4.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
#!/bin/bash

for num in 1 2 3 4
do
    echo $num
done
```

And, to prove it, here's a similar loop run on the command line:

```
$ for word in cats are smart
> do
>    echo $word
> done
cats
are
smart
```

### for vs while

Bash provides both a **for** and a **while** looping command. In **while** loops, some condition is tested each time through the loop to determine whether the loop should continue. This example is practically the same as the one before in how it works, but imagine what a difference it would make if we wanted to loop 444 times instead of just 4.

```
#!/bin/bash

n=1

while [ $n -le 4 ]
do
    echo $n
    ((n++))
done
```

### Looping through value ranges

If you want to loop through every letter of the alphabet or some more restricted range of letters, you can use syntax like this:

```
#!/bin/bash

for x in {a..z}
do
    echo $x
done
```

If you used **{d..f}**, you would only loop three times.

### Looping inside loops

There's also nothing stopping you from looping inside a loop. In this example, we're using a **for** loop inside a **while** loop.

```
#!/bin/bash

n=1

while [ $n -lt 6 ]
do
    for l in {a..d}
    do
        echo $n$l
    done
    ((n++))
done
```

The output would in this example include 1a, 1b, 1c, 1d, 2a and so on, ending at 5d. Note that **((n++))** is used to increment the value of $n so that **while** has a stopping point.

### Looping through variable data

If you want to loop through every account on the system, every file in a directory or some other kind of variable data, you can issue a command within your loop to generate the list of values to loop through. In this example, we loop through every account (actually every file) in **/home** – assuming, as we should expect, that there are no other files or directories in **/home**.

```
#!/bin/bash

for user in `ls /home`
do
    echo $user
done
```

If the command were **date** instead of **ls /home**, we'd run through each of the 7 pieces of text in the output of the date command.

```
$ for word in `date`
> do
>     echo $word
> done
Thu
31
Oct
2019
11:59:59
PM
EDT
```

### Looping by request

It's also very easy to allow the person running the script to determine how many times a loop should run. If you want to do this, however, you should test the response provided to be sure that it's numeric. This example shows three ways to do that.

```
#!/bin/bash

echo -n "How many times should I say hello? "
read ans

if [ "$ans" -eq "$ans" ]; then
    echo ok1
fi

if [[ $ans = *[[:digit:]]* ]]; then
    echo ok2
fi

if [[ "$ans" =~ ^[0-9]+$ ]]; then
    echo ok3
fi
```

The first option above shown might look a little odd, but it works because the **-eq** test only works if the values being compared are numeric. If the test came down to asking if **"f" -eq "f"**, it would fail. The second test uses the bash character class for digits. The third tests the variable to ensure that it contains only digits.

Of course, once you've selected how you prefer to test a user response to be sure that it's numeric, you need to follow through on the loop. In this next example, we'll print "hello" as many times as the user wants to see it. The **le** does a "less than or equal" test.

```
#!/bin/bash

echo -n "How many times should I say hello? "
read ans

if [ "$ans" -eq "$ans" ]; then
  n=1
  while [ $n -le $ans ]
  do
    echo hello
    ((n++))
  done
fi
```

### Looping through the lines in a file

If you want to loop through the contents of a file line by line (i.e., NOT word by word), you can use a loop like this one:

```
#!/bin/bash

echo -n "File> "
read file
n=0

while read line; do
  ((n++))
  echo "$n: $line"
done < $file
```

The word "line" used in the above script is for clarity, but you could use any variable name. The **while read** and the redirection of the file content on the last line of the script is what provides the line-by-line reading.

### Looping forever

If you want to loop forever or until, well, someone gets tired of seeing the script's output and decides to kill it, you can simple use the **while true** syntax.

```
#!/bin/bash

while true
do
    echo -n "Still running at "
    date
    sleep 10
done
```

The examples shown above are basically only (excuse the pun) "shells" for the kind of real work that you might need to do and are meant simply to provide the basic syntax for running undoubtedly far more useful commands.

### Now see:

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3449116/looping-your-way-through-bash.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/cogdog/7778741378/in/photolist-cRo5NE-8HFUGG-e1kzG-4TFXrc-D3mM8-Lzx7h-LzGRB-fN3CY-LzwRo-8mWuUB-2jJ2j8-AABU8-eNrDET-eND7Nj-eND6Co-pNq3ZR-3bndB2-dNobDn-3brHfC-eNrSXv-4z4dNn-R1i2P5-eNDvyQ-agaw5-eND55q-4KQnc9-eXg6mo-eNscpF-eNryR6-dTGEqg-8uq9Wm-eND54j-eNrKD2-cynYp-eNrJsk-eNCSSj-e9uAD5-25xTWb-eNrJ3e-eNCW8s-7nKXtJ-5URF1j-8Y253Z-oaNVEQ-4AUK9b-6SJiLP-7GL54w-25yEqLa-fN3gL-dEgidW
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
