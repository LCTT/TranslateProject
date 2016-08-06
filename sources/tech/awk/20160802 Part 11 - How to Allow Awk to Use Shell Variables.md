Being translated by ChrisLeeGit

How to Allow Awk to Use Shell Variables – Part 11
==================================================

When we write shell scripts, we normally include other smaller programs or commands such as Awk operations in our scripts. In the case of Awk, we have to find ways of passing some values from the shell to Awk operations.

This can be done by using shell variables within Awk commands, and in this part of the series, we shall learn how to allow Awk to use shell variables that may contain values we want to pass to Awk commands.

There possibly two ways you can enable Awk to use shell variables:

### 1. Using Shell Quoting

Let us take a look at an example to illustrate how you can actually use shell quoting to substitute the value of a shell variable in an Awk command. In this example, we want to search for a username in the file /etc/passwd, filter and print the user’s account information.

Therefore, we can write a `test.sh` script with the following content:

```
#!/bin/bash

#read user input
read -p "Please enter username:" username

#search for username in /etc/passwd file and print details on the screen
cat /etc/passwd | awk "/$username/ "' { print $0 }'
```

Thereafter, save the file and exit.

Interpretation of the Awk command in the test.sh script above:

```
cat /etc/passwd | awk "/$username/ "' { print $0 }'
```

`"/$username/ "` – shell quoting used to substitute value of shell variable username in Awk command. The value of username is the pattern to be searched in the file /etc/passwd.

Note that the double quote is outside the Awk script, `‘{ print $0 }’`.

Then make the script executable and run it as follows:

```
$ chmod  +x  test.sh
$ ./text.sh 
```

After running the script, you will be prompted to enter a username, type a valid username and hit Enter. You will view the user’s account details from the /etc/passwd file as below:

![](http://www.tecmint.com/wp-content/uploads/2016/08/Shell-Script-to-Find-Username-in-Passwd-File.png)
>Shell Script to Find Username in Password File

### 2. Using Awk’s Variable Assignment

This method is much simpler and better in comparison to method one above. Considering the example above, we can run a simple command to accomplish the job. Under this method, we use the -v option to assign a shell variable to a Awk variable.

Firstly, create a shell variable, username and assign it the name that we want to search in the /etc/passswd file:

```
username="aaronkilik"
```

Then type the command below and hit Enter:

```
# cat /etc/passwd | awk -v name="$username" ' $0 ~ name {print $0}'
```

![](http://www.tecmint.com/wp-content/uploads/2016/08/Find-Username-in-Password-File-Using-Awk.png)
>Find Username in Password File Using Awk

Explanation of the above command:

- `-v` – Awk option to declare a variable
- `username` – is the shell variable
- `name` – is the Awk variable
Let us take a careful look at `$0 ~ name` inside the Awk script, `' $0 ~ name {print $0}'`. Remember, when we covered Awk comparison operators in Part 4 of this series, one of the comparison operators was value ~ pattern, which means: true if value matches the pattern.

The `output($0)` of cat command piped to Awk matches the pattern `(aaronkilik)` which is the name we are searching for in /etc/passwd, as a result, the comparison operation is true. The line containing the user’s account information is then printed on the screen.

### Conclusion

We have covered an important section of Awk features, that can help us use shell variables within Awk commands. Many times, you will write small Awk programs or commands within shell scripts and therefore, you need to have a clear understanding of how to use shell variables within Awk commands.

In the next part of the Awk series, we shall dive into yet another critical section of Awk features, that is flow control statements. So stay tunned and let’s keep learning and sharing.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-shell-script-variable-in-awk/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[校对ID](https://github.com/校对ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
