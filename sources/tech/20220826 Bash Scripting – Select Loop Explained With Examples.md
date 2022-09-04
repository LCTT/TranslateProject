[#]: subject: "Bash Scripting – Select Loop Explained With Examples"
[#]: via: "https://ostechnix.com/bash-select-loop/"
[#]: author: "Karthick https://ostechnix.com/author/karthick/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bash Scripting – Select Loop Explained With Examples
======
Creating Menu Driven Scripts Using Bash Select Loop

We have seen about bash **for loop**, **while loop**, and **until loop** in our previous articles with detailed examples. Bash offers one more type of loop called **select loop**, which will allow you to **create menu-driven scripts**.

Menu-driven scripts are good alternatives to scripts that require users to pass arguments to perform an action. You can add more verbosity in your menus and users have to just select the option for the program to do its job.

Take a look at our comprehensive article on `for loop`, `while loop`, and `until loop`.

* [Bash Scripting – For Loop Explained With Examples][1]
* [Bash Scripting – While And Until Loop Explained With Examples][2]

### Bash Select Loop - Syntax

The `select loop` syntax is a bit similar to the `for loop` syntax. In the `for loop`, every element will be iterated and for each element, you will write the logic to process it. But `select loop` will automatically convert the list of elements into the numbered menu.

```
select fav in ubuntu popos mint kubuntu
do
  echo "My fav distribution = ${fav}"
done
```

**Explanation:**

* The loop should start with the `"select"` keyword.
* After the select keyword comes the variable which will store the value you choose from the menu. In my case, I have given the variable name as "fav".
* After the in keyword, you have to give the list of elements. These elements will be converted into a menu.
* Your logic should be placed within the do and the done block.

Now, go ahead and copy the above snippet and run it in your terminal. It will create a menu and wait for your response.

![Create Menu Driven Scripts Using Bash Select Loop][3]

### Select Loop - Response

Let’s understand the behavior of the select loop when you give the response.

The `select loop` will only accept the menu number as the argument. Depending upon the menu number you choose, the corresponding value will be stored in the variable(fav). The number from the option which you choose will be stored in the **"REPLY"** variable.

Check the following code. I have selected the choice **2**.

```
$ select fav in ubuntu popos mint kubuntu
do
  echo "My fav distribution = ${fav}"
done
1) ubuntu
2) popos
3) mint
4) kubuntu
#? 2
My fav distribution = popos
#?
```

![Bash Select Loop Response][4]

The select loop will not terminate until you cancel it or use the break statement to exit the loop in your script. I have used the break statement after my logic flow so the loop will be terminated with just one selection.

The [break][5] statement exit out of the loop once it is called so any pending operation will be skipped in the loop. The following code explains the use of the break statement.

```
select fav in ubuntu popos mint kubuntu
do
  echo "My fav distribution = ${fav}"
  break
done
```

![Bash Select Loop With Break Statement][6]

The default behavior of the select loop is that when the user is not providing the input it will again prompt for the input without exiting the loop.

![Bash Select Loop Without Input][7]

### Select Loop - Setting Custom Prompt

By default, the select loop will use **"#?"** as the prompt. You can also set a custom prompt as per your wish by setting the **PS3 environmental variable**.

```
PS3="Choose your fav distribution :: "
select fav in ubuntu popos mint kubuntu; do   
  echo "My fav distribution = ${fav}"
  break
done
```

![Set Custom Prompt][8]

### Creating A Simple Menu Driven Backup And Restore Script

Till now all we have seen is about the select loop syntax and its behavior. Let’s create a simple backup and restore script with menu driven approach.

Take a look at the below code. Two functions, **backup()** which will take backup, and **restore()** which will revert the file to the source.

I am just taking backup only for the `.bashrc` file for demonstration but you can tweak this script as per your requirement. Using the **[conditional statements][9]**, I am validating the input and triggering the respective function.

```
#!/usr/bin/env bash

SOURCE="/home/${USER}/.bashrc"
DESTINATION="/home/${USER}/Documents/"

# This function will take backup 
function backup(){
  rsync -a --progress --delete-before --info=progress2 ${SOURCE} ${DESTINATION}
}

# This function will restore the backup
function restore(){
 rsync -a --progress --delete-before --info=progress2 ${DESTINATION} ${SOURCE} 
}

PS3="Choose either BACKUP or RESTORE :: "
select option in backup restore
do
  if [[ ${option} = "backup" ]];then
    backup
  elif [[ ${option} = "restore" ]];then
    restore
  fi  
  break
done
```

Once you run this script, it will just prompt two options as shown in the below image and based upon your selection the action will be performed.

![Menu Driven Backup And Restore Script][10]

### Conclusion

In this article I have shown you what a select statement in bash scripting is and how to use Bash select loop to create a menu-driven scripts.

Let us know if you have implemented any cool scripts with the menu driven approach through the comment section.

--------------------------------------------------------------------------------

via: https://ostechnix.com/bash-select-loop/

作者：[Karthick][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/karthick/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/bash-for-loop-shell-scripting/
[2]: https://ostechnix.com/bash-while-until-loop-shell-scripting/
[3]: https://ostechnix.com/wp-content/uploads/2022/08/Create-Menu-Driven-Scripts-Using-Bash-Select-Loop.png
[4]: https://ostechnix.com/wp-content/uploads/2022/08/Bash-Select-Loop-Response.png
[5]: https://ostechnix.com/bash-for-loop-shell-scripting/#break-continue-statement-usage
[6]: https://ostechnix.com/wp-content/uploads/2022/08/Bash-Select-Loop-With-Break-Statement.png
[7]: https://ostechnix.com/wp-content/uploads/2022/08/Bash-Select-Loop-Without-Input.png
[8]: https://ostechnix.com/wp-content/uploads/2022/08/Set-Custom-Prompt.png
[9]: https://ostechnix.com/bash-conditional-statements/
[10]: https://ostechnix.com/wp-content/uploads/2022/08/Menu-Driven-Backup-And-Restore-Script.png
