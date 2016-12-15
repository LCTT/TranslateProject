How to Perform Syntax Checking Debugging Mode in Shell Scripts
============================================================

We started the shell script debugging series by explaining the different debugging options and [how to enable shell script debugging modes][1].

After writing your shell scripts, it is recommended that we practically check the syntax in the scripts before running them, as opposed to looking at their output to confirm that they are working correctly.

In this part of the series, we will go through how to use syntax checking debugging mode. Remember we explained the different debugging options in the first part of this series and here, we will use them to perform script debugging.

#### Enabling Verbose Debugging Mode

Before we move to the primary focus of this guide, let us briefly explore the verbose mode. It is enabled by the `-v` debugging option, which tells the shell to display all lines in a script while they are read.

To demonstrate how this works, below is a sample shell script to [batch convert PNG images to JPG format][2].

Type ( or copy and paste) it in a file.

```
#!/bin/bash
#convert
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
done
exit 0
```

Then save the file and make the script executable using the command below:

```
$ chmod +x script.sh
```

We can invoke the script and display all the lines in it as they are read by the shell like so:

```
$ bash -v script.sh
```
[
 ![Display All Lines in Shell Script](http://www.tecmint.com/wp-content/uploads/2016/12/Show-Shell-Script-Lines.png) 
][3]

Display All Lines in Shell Script

#### Enabling Syntax Checking Debugging Mode in Shell Scripts

Coming back to our topic of emphasis, The `-n` activates syntax checking mode. It instructs the shell to basically read all the commands, however doesn’t execute them, it (shell) only examines the syntax used.

In case there are errors in your shell script, the shell will output the errors on the terminal, otherwise, it displays nothing.

The syntax for activating syntax checking is as follows:

```
$ bash -n script.sh
```

Because the syntax in the script is correct, the command above will not display any output. Therefore, let us try to remove the `done` word that closes the for loop and see if it shows an error:

Below is the modified shell script to batch convert png images to jpg format that contains a bug.

```
#!/bin/bash
#script with a bug
#convert
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
exit 0
```

Save the file, then run it while performing syntax checking in it:

```
$ bash -n script.sh
```
[
 ![Check Syntax in Shell Script](http://www.tecmint.com/wp-content/uploads/2016/12/Check-Syntax-in-Shell-Script.png) 
][4]

Check Syntax in Shell Script

From the output above, we can see that there is a syntax problem with our script, the for loop is missing a closing `done` keyword word. And the shell looked for it up to the end of the file and once it did not find it (done), the shell printed a syntax error:

```
script.sh: line 11: syntax error: unexpected end of file
```

We can as well combine the verbose mode and syntax checking mode together:

```
$ bash -vn script.sh
```
[
 ![Enable Verbose and Syntax Checking in Script](http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Verbose-and-Syntax-Checking-in-Script.png) 
][5]

Enable Verbose and Syntax Checking in Script

Alternatively, we can enable syntax checking by modifying the first line of the script above as in the next example.

```
#!/bin/bash -n
#altering the first line of a script to enable syntax checking
#convert
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
exit 0
```

As before, save the file and run it while performing syntax checking:

```
$ ./script.sh
script.sh: line 12: syntax error: unexpected end of file
```

In addition, we can employ the set shell built-in command to enable debugging mode in the script above.

In the example below, we are only checking the syntax of the for loop in our script.

```
#!/bin/bash
#using set shell built-in command to enable debugging
#convert
#enable debugging
set -n
for image in *.png; do
convert  "$image"  "${image%.png}.jpg"
echo "image $image converted to ${image%.png}.jpg"
#disable debugging
set +n
exit 0
```

Once again, save the file and invoke the script:

```
$ ./script.sh 
```

In summary, we should always ensure that we syntactically check our shell scripts to capture any error before executing them.

To send us any questions or feedback concerning this guide, use the response form below. In the third part of this series, we shall move to explaining and using shell tracing debugging mode.


--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-syntax-in-shell-script/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/enable-shell-debug-mode-linux/
[2]:http://www.tecmint.com/linux-image-conversion-tools/
[3]:http://www.tecmint.com/wp-content/uploads/2016/12/Show-Shell-Script-Lines.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/12/Check-Syntax-in-Shell-Script.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Verbose-and-Syntax-Checking-in-Script.png
