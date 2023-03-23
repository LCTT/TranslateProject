[#]: subject: "Please – A Simple Command Line Todo Manager"
[#]: via: "https://ostechnix.com/please-command-line-todo-manager/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Please – A Simple Command Line Todo Manager
======
Manage Tasks And To-do Lists With 'Please' From Command Line In Linux

A while ago, we reviewed **["Taskwarrior"][1]**, a command line task manager to manage your to-do tasks right from the Terminal window. Today I stumbled upon yet another simple **command line Todo manager** called **"Please"**. Yes, the name is Please!.

Please is an opensource, CLI application written in **Python** programming language. Using Please, we can manage our personal tasks and to-do list without leaving the terminal.

Whenever you open a terminal window, Please will show you the current date and time, an inspirational quote and the list of personal to-do tasks in the Terminal.

Please is very lightweight and convenient CLI task manager for those who use terminal extensively in their daily life.

### Install Please In Linux

Since Please is written in Python, you can **install Please** using **PiP** package manager. If you haven't installed PiP on your Linux machine yet, refer to the following link.

* [How To Manage Python Packages Using PIP][2]

To install Please using PiP, simply run:

```
$ pip install please-cli
```

Or,

```
$ pip3 install please-cli
```

To run Please every time you open a new Terminal window, add the line 'please' to your `.bashrc` file.

```
$ echo 'please' >> ~/.bashrc
```

If you use ZSH shell, run:

```
$ echo 'please' >> ~/.zshrc
```

Please note that the above step is optional. You don't have to add it to your shell config file. However If you do the above step, you will immediately see your pending tasks and to-do list whenever you open a Terminal.

If you don't add it, you won't see them and you may forgot them after a while. So make sure you've added it to your `.bashrc` or `.zshrc` file.

Restart the current session to take effect the changes. Alternatively, source the `.bashrc` file to take effect the changes immediately.

```
$ source ~/.bashrc
```

You will be asked to set a name at first launch. It is usually the hostname of your system. You can also use any other name of your choice.

```
Hello! What can I call you?: ostechnix
```

You can change your name later by running the following command:

```
$ please callme <Your Name Goes Here>
```

### Manage Tasks And To-do Lists With Please From Command Line

The **usage of 'Please'** is very simple!

Just run 'please' to show the current date and time, an inspirational quote and the list of tasks if there are any.

```
$ please
```

**Sample Output:**

```
───────  Hello ostechnix! It's 20 Jun | 11:59 AM ───────
                  "Action is eloquence!"                             
                  - William Shakespeare                              
                        
            Looking good, no pending tasks 😁
```

![Run Please Todo Manager][3]

As you can see, there are no todo tasks yet. Let us add some.

#### Adding New Tasks

To add a new task, run:

```
$ please add "<Task Name>"
```

Example:

```
$ please add "Publish a post about Please"
```

Replace the task name within the quotes with your own.

**Sample Output:**

```
Added "Publish a post about Please" to the list 
                     Tasks                      
┏━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┓
┃ Number ┃ Task                        ┃ Status ┃
┡━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━┩
│ 1      │ Publish a post about Please │ ❌     │
└────────┴─────────────────────────────┴────────┘
```

Similarly, you can add any number of tasks. I have added the following 3 tasks for demonstration purpose.

```
Added "Setup Nginx In Ubuntu" to the list    
                     Tasks                      
┏━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┓
┃ Number ┃ Task                        ┃ Status ┃
┡━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━┩
│ 1      │ Publish a post about Please │ ❌     │
│ 2      │ Update Ubuntu VM            │ ❌     │
│ 3      │ Setup Nginx In Ubuntu       │ ❌     │
└────────┴─────────────────────────────┴────────┘
```

![Add Tasks Using Please][4]

#### Show Tasks

To view the list of all tasks, run:

```
$ please showtasks
```

**Sample Output:**

```
                     Tasks                      
┏━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┓
┃ Number ┃ Task                        ┃ Status ┃
┡━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━┩
│ 1      │ Publish a post about Please │ ❌     │
│ 2      │ Update Ubuntu VM            │ ❌     │
│ 3      │ Setup Nginx In Ubuntu       │ ❌     │
└────────┴─────────────────────────────┴────────┘
```

![Show All Tasks][5]

As you see in the above output, I have 3 unfinished tasks.

#### Mark Tasks As Done Or Undone

Once you complete a task, you can **mark it as done** by specifying the task number as show in the command below.

$ please done "<Task Number>"

Example:

```
$ please done 1
```

This command will mark the **Job 1** as completed.

**Sample Output:**

```
Updated Task List                
                     Tasks                      
┏━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┓
┃ Number ┃ Task                        ┃ Status ┃
┡━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━┩
│ 1      │ Publish a post about Please │ ✅     │
│ 2      │ Update Ubuntu VM            │ ❌     │
│ 3      │ Setup Nginx In Ubuntu       │ ❌     │
└────────┴─────────────────────────────┴────────┘
```

![Mark Tasks As Done][6]

As you see in the above output, the completed job is marked with a **green** **tick mark**and the non-completed tasks are marked with **a red cross**.

Similarly, to undo the changes i.e. **mark the jobs as undone**, run:

```
$ please undone 1
```

![Mark Tasks As Undone][7]

#### Remove Tasks

To delete a task from the list, the command would be:

$ please delete "<Task Number>"

Example:

$ please delete 1

This command will **delete the specified task**.

**Sample Output:**

```
Deleted 'Publish a post about Please'      
                     Tasks                      
  ┏━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┓   
  ┃ Number ┃ Task                  ┃ Status ┃   
  ┡━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━┩   
  │ 1      │ Update Ubuntu VM      │ ❌     │   
  │ 2      │ Setup Nginx In Ubuntu │ ❌     │   
  └────────┴───────────────────────┴────────┘
```

![Delete Tasks][8]

Please note that this command will delete the given task whether it is completed or not. It is not even will show you a warning message. So double check if you delete a correct task.

#### Reset

To reset all settings and task, run:

```
$ please setup
```

You will be prompted to set a name.

**Sample Output:**

```
Hello! What can I call you?: ostechnix
                                                
     Thanks for letting me know your name!      
If you wanna change your name later, please use:
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│     please callme <Your Name Goes Here>      │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

![Reset Please][9]

### Uninstall Please

'Please' didn't please you? No problem! You can remove it using command:

```
$ pip uninstall please-cli
```

Or,

```
$ pip3 uninstall please-cli
```

And then edit your `.bashrc` or `.zshrc` file and remove the line that says **please** at the end of the file.

### Conclusion

I briefly tried 'Please' on my Ubuntu VM and I already started liking its simplicity and efficiency. If you're looking for an easy-to-use CLI task manager for managing your tasks, please try "Please". You will be pleased!

**Resource:**

* [Please GitHub Repository][10]

*Featured Image by Pixabay.*

--------------------------------------------------------------------------------

via: https://ostechnix.com/please-command-line-todo-manager/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/taskwarrior-command-line-todo-task-manager-application/
[2]: https://ostechnix.com/manage-python-packages-using-pip/
[3]: https://ostechnix.com/wp-content/uploads/2022/06/Run-Please-Todo-Manager.png
[4]: https://ostechnix.com/wp-content/uploads/2022/06/Add-Tasks-Using-Please.png
[5]: https://ostechnix.com/wp-content/uploads/2022/06/Show-All-Tasks.png
[6]: https://ostechnix.com/wp-content/uploads/2022/06/Mark-Tasks-As-Done.png
[7]: https://ostechnix.com/wp-content/uploads/2022/06/Mark-Tasks-As-Undone.png
[8]: https://ostechnix.com/wp-content/uploads/2022/06/Delete-Tasks.png
[9]: https://ostechnix.com/wp-content/uploads/2022/06/Reset-Please.png
[10]: https://github.com/NayamAmarshe/please
