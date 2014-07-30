How to use variables in shell Scripting
================================================================================
In every **programming** language **variables** plays an important role , in Linux shell scripting we are using two types of variables : **System Defined Variables** & **User Defined Variables**.

A variable in a shell script is a means of **referencing** a **numeric** or **character value**. And unlike formal programming languages, a shell script doesn't require you to **declare a type** for your variables

In this article we will discuss variables, its types and how to set & use variables in shell scripting.

### System Defined Variables : ###

These are the variables which are created and maintained by **Operating System(Linux) itself**. Generally these variables are defined in **CAPITAL LETTERS**. We can see these variables by using the command "**$ set**". Some of the system defined variables are given below : 

<table width="100%" cellspacing="1" cellpadding="1">
  <tbody>
    <tr>
      <td><strong> System Defined Variables </strong></td>
      <td><strong> Meaning </strong></td>
    </tr>
    <tr>
      <td> BASH=/bin/bash </td>
      <td> Shell Name </td>
    </tr>
    <tr>
      <td> BASH_VERSION=4.1.2(1) </td>
      <td> Bash Version </td>
    </tr>
    <tr>
      <td> COLUMNS=80 </td>
      <td> No. of columns for our screen </td>
    </tr>
    <tr>
      <td> HOME=/home/linuxtechi </td>
      <td> Home Directory of the User </td>
    </tr>
    <tr>
      <td> LINES=25 </td>
      <td> No. of columns for our screen </td>
    </tr>
    <tr>
      <td> LOGNAME=LinuxTechi </td>
      <td> LinuxTechi Our logging name </td>
    </tr>
    <tr>
      <td> OSTYPE=Linux </td>
      <td> OS type </td>
    </tr>
    <tr>
      <td> PATH=/usr/bin:/sbin:/bin:/usr/sbin </td>
      <td> Path Settings </td>
    </tr>
    <tr>
      <td> PS1=[\u@\h \W]\$ </td>
      <td> Prompt Settings </td>
    </tr>
    <tr>
      <td> PWD=/home/linuxtechi </td>
      <td> Current Working Directory </td>
    </tr>
    <tr>
      <td> SHELL=/bin/bash </td>
      <td> Shell Name </td>
    </tr>
    <tr>
      <td> USERNAME=linuxtechi </td>
      <td> User name who is currently login to system </td>
    </tr>
  </tbody>
</table>

To Print the value of above variables, use **echo command** as shown below :

    # echo $HOME
    # echo $USERNAME

We can tap into these environment variables from within your scripts by using the environment variable's name preceded by a dollar sign. This is demonstrated in the following script:

    $ cat myscript
    
    #!/bin/bash
    # display user information from the system.
    echo “User info for userid: $USER”
    echo UID: $UID
    echo HOME: $HOME 

Notice that the **environment variables** in the echo commands are replaced by their current values when the script is run. Also notice that we were able to place the **$USER** system variable within the double quotation marks in the first string, and the shell script was still able to figure out what we meant. There is a **drawback** to using this method, however. Look at what happens in this example:

    $ echo “The cost of the item is $15”
    The cost of the item is 5

That is obviously not what was intended. Whenever the script sees a dollar sign within quotes, it assumes you're referencing a variable. In this example the script attempted to display the **variable $1** (which was not defined), and then the number 5. To display an actual dollar sign, you **must precede** it with a **backslash character**:

    $ echo “The cost of the item is \$15”
    The cost of the item is $15

That's better. The backslash allowed the shell script to interpret the **dollar sign** as an actual dollar sign, and not a variable.

### User Defined Variables:  ###

These variables are defined by **users**. A shell script allows us to set and use our **own variables** within the script. Setting variables allows you to **temporarily store data** and use it throughout the script, making the shell script more like a real computer program.

**User variables** can be any text string of up to **20 letters, digits**, or **an underscore character**. User variables are case sensitive, so the variable Var1 is different from the variable var1. This little rule often gets novice script programmers in trouble.

Values are assigned to user variables using an **equal sign**. No spaces can appear between the variable, the equal sign, and the value (another trouble spot for novices). Here are a few examples of assigning values to user variables:

    var1=10
    var2=-57
    var3=testing
    var4=“still more testing”

The shell script **automatically determines the data type** used for the variable value. Variables defined within the shell script maintain their values throughout the life of the shell script but are deleted when the shell script completes.

Just like system variables, user variables can be referenced using the dollar sign: 

    $ cat test3
    #!/bin/bash
    # testing variables
    days=10
    guest="Katie"
    echo "$guest checked in $days days ago"
    days=5
    guest="Jessica"
    echo "$guest checked in $days days ago"
    $

Running the script produces the following output:

    $ chmod u+x test3
    $ ./test3
    Katie checked in 10 days ago
    Jessica checked in 5 days ago
    $

Each time the variable is **referenced**, it produces the value currently assigned to it. It's important to remember that when referencing a variable value you use the **dollar sign**, but when referencing the variable to assign a value to it, you do not use the dollar sign. Here's an example of what I mean:

    $ cat test4
    #!/bin/bash
    # assigning a variable value to another variable
    value1=10
    value2=$value1
    echo The resulting value is $value2
    $

When you use the **value** of the **value1** variable in the assignment statement, you must still use the dollar sign. This code produces the following output:

    $ chmod u+x test4
    $ ./test4
    The resulting value is 10
    $

If you forget the dollar sign, and make the value2 assignment line look like:

value2=value1
you get the following output:

    $ ./test4    
    The resulting value is value1
    $

Without the dollar sign the **shell interprets** the variable name as a **normal text string**, which is most likely not what you wanted.

### Use of Backtick symbol (`) in shell variables : ###

The **backtick allows** you to assign the output of a shell command to a variable. While this doesn't seem like much, it is a major building block in **script programming**.You must surround the entire command line command with backtick characters:

    **testing=`date`**

The shell runs the command within the **backticks** and assigns the output to the variable testing. Here's an example of creating a variable using the output from a normal shell command:

    $ cat test5
    #!/bin/bash
    # using the backtick character
    testing=`date`
    echo "The date and time are: " $testing
    $

The variable testing receives the output from the date command, and it is used in the echo statement to display it. Running the shell script produces the following output:

    $ chmod u+x test5
    $ ./test5
    The date and time are: Mon Jan 31 20:23:25 EDT 2011

**Note** : In bash you can also use the alternative $(…) syntax in place of backtick (`),which has the advantage of being re-entrant.

Example :

    $ echo " Today’s date & time is :" $(date)
    Today’s date & time is : Sun Jul 27 16:26:56 IST 2014 

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/variables-in-shell-scripting/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/