[#]: subject: "Shell Scripting is Still Going Strong"
[#]: via: "https://www.opensourceforu.com/2022/05/shell-scripting-is-still-going-strong/"
[#]: author: "Bipin Patwardhan https://www.opensourceforu.com/author/bipin-patwardhan/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Shell Scripting is Still Going Strong
======
This article introduces you to the basics of shell scripting and its importance in day-to-day life. A shell script is a command-line interpreter that runs on a UNIX/Linux shell.

![Penguin-with-linux-command][1]

The first thing we notice when we log into a UNIX/Linux system is the blinking cursor next to the $ sign. This is the shell. It has been – for many decades – the ubiquitous (and many times the only) interface to interact with a computer. Before the advent and popularity of graphical user interfaces (GUIs), the terminal and the shell were the only mechanism to make the computer do what we wanted it to do. At first glance, one may wonder what the shell does – other than passing commands to the underlying operating system for execution. Most of us are familiar with commands like ‘ls’ (for listing contents of a directory), ‘cd’ (for changing the current directory), and so on. It is through the shell that we can execute these commands. The shell understands the text we type — converts it into tokens — and then executes them on the operating system.

### Flavours

Initially, the terminal started with the humble Bourne shell or ‘sh’. Over the years, many shell variants were developed and used. Some of the popular ones are ‘C Shell’ / ‘csh’ and ‘Korn Shell’ / ‘ksh’. ‘sh’ fell out of favour for a few years, but has gained popularity once again through its recent avatar, namely ‘bash’ / ‘Bourne Again Shell’.

### What does the shell actually do?

The shell is the immediate interface between the operating system (OS) and the user. We make the computer do what we want, by using commands and applications supported by the tools installed on the computer we are using. Some commands are applications installed on the operating system, while some are built into the shell itself. Some of the commands built into bash are ‘clear’, ‘cd’, ‘eval’, and ‘exec’, to name a few, while commands like ‘ls’, and ‘mkdir’ are applications. The commands built into the shell vary as per the shell.

In this article, we cover a few aspects related to ‘bash’.

### More about the shell

Most of us have used commands like ‘ls’, ‘cd’, and ‘mkdir’. When we run the ‘ls -l’ command on a directory, all the directories and files in that directory are listed on the screen. If the number is large, the screen scrolls. If the terminal does not support scroll bars (as was the case for many years), there is no way to look at the entries that have scrolled past. To help overcome this, we use commands like ‘more’ and ‘less’. These allow us to view the output on a page-by-page basis. The command typically used is:

```
ls -l | less
```

What is the shell doing here? What looks like a single command is actually two commands executing one after the other, ls and less. The pipe (‘|’) connects the two programs, but the connection is managed by the shell. Because of the pipe character, the shell connects the two programs – it connects the standard output of the ls command and connects it to the standard input or standard in or stdin of less. The pipe feature allows us to take the output of any program and provide it as the input to another program – without us having to do any changes to the programs. This is the philosophy of many UNIX/Linux applications — keep the applications simple and then combine many applications together to achieve the end result, rather than having one program do many things.

If needed, we can redirect the output of ls to a file and then view it using ‘vi’. For this, we use the command:

```
ls -l > /tmp/my_file.txt
vi /tmp/my_file.txt
```

In this case, the output of ls is being redirected to a file. This is managed by the shell, which understands the ‘>’ symbol to mean redirection. It treats the token that follows as a file.

### Automation using shell

This ability to combine commands is one of the key elements for the creation of automation scripts using shell commands. In my most recent project, we were executing Python/Spark (PySpark) applications using cluster mode. Each application executed many structured query language (SQL) statements – SparkSQL. To keep track of application progress, we were printing details about the SQL being executed. This allowed us to maintain a log of what was happening in the application. As the applications were executed in cluster mode, to view the log, we had to use the yarn command as follows:

```
yarn log –applicationId [application_id]
```

In most cases, the log produced by an application was very large. So we typically piped the log to ‘less’ or redirected it to a file. The command we used was:

```
yarn log –aplicationId [application_id] | less
```

Our development team had a strength of 40 people. Each one had to remember this command. To make it simpler, I converted this command into a bash script. For this, I created a file with a ‘.sh’ extension. On UNIX and Linux systems, file extension does not matter. As long as the file is an executable, it will work. Extensions have significance on MS Windows.

### Important thing to remember

The shell is an interpreter. This means that it will read the program line by line and execute it. The limitation of this approach is that errors (if any) are not identified upfront. Errors are not identified till they are read and executed by the interpreter. In short, we can have a shell program that will execute perfectly for the first 20 lines and then fail due to a syntax error on line 21. When the script fails at line 21, the shell does not unroll/undo the previous steps. When such a thing occurs, we have to correct the script and start execution from the first line. Thus, as an example, if we have deleted a few files before encountering an error, execution of the shell script will stop, but the files are gone forever.

The script I created was:

```
#!/bin/bash
yarn log –applicationId 123 | less
```

…where 123 was the application ID.

The first two characters of the first line are magic characters. They tell the script that this is an executable file and the line contains the name of the program to be used for execution. The remaining lines of the script are passed to the program mentioned. In this case, we are going to execute bash. Even after including the first line, we have to apply execute permissions to the file using:

```
chmod +x my_file.sh
```

After giving execute permissions to the file, we can execute it as:

```
./my_file.sh
```

If we do not give execute permissions to the file, we can execute the script as:

```
sh ./my_file.sh
```

### Passing parameters

You will realise quickly that such a script is handy, but becomes useless immediately. Each time we execute the Python/Spark application, a new ID is generated. Hence, for each run, we have to edit the file and add the new application ID. This definitely reduces the usability of the script. To be useful, we should be passing the application ID as a parameter:

```
#!/bin/bash
yarn –log -applicationId ${1} | less
```

We need to execute the script as:

```
./show_log.sh 123
```

The script will execute the yarn command, fetch the log for the application and allow us to view it.

What if we want to redirect the output to a file? Not a problem. Instead of sending the output to less, we can redirect it to a file:

```
#!/bin/bash
ls –l ${1} > ${2}
view ${2}
```

To run the script, we have to provide two parameters, and the command becomes:

```
./my_file.sh /tmp /tmp/listing.txt
```

When executed, $1 will bind to /tmp and $2 will bind to /tmp/listing.txt. For the shell, the parameters are named from one to nine. This does not mean we cannot pass more than nine parameters to a script. We can, but that is the topic of another article. You will note that I have mentioned the parameters as ${1} and ${2} instead of $1 and $2. It is a good practice to enclose the name of the parameter in curly brackets as it allows us to unambiguously combine the parameters as part of a longer variable. For example, we can ask the user to provide file name as a parameter and then use that to form a larger file name. As an example, we can take $1 as the parameter and create a new file name as ${1}_student_names.txt.

### Making the script robust

What if the user forgets to provide parameters? The shell allows us to check for such conditions. We modify the script as below:

```
#!/bin/bash
if [ -z “${2}” ]; then
echo “file name not provided”
exit 1
fi
if [ -z “${1}” ]; then
echo “directory name not provided”
exit 1
fi
DIR_NAME=${1}
FILE_NAME=${2}
ls -l ${DIR_NAME} > /tmp/${FILE_NAME}
view /tmp/${FILE_NAME}
```

In this program, we check if the proper parameters are passed. We exit the script if parameters are not passed. You will note that I am checking the parameters in reverse order. If we check for the presence of the first parameter before checking the presence of the second parameter, the script will pass to the next step if only one parameter is passed. While the presence of parameters can be checked in ascending order, I recently realised that it might be better to check from nine to one, as we can provide proper error messages. You will also note that the parameters have been assigned to variables. The parameters one to nine are positional parameters. Assigning positional parameters to named parameters makes it easy to debug the script in case of issues.

### Automating backup

Another task that I automated was that of taking a backup. During development, in the initial days, we did not have a version control system in place. But we needed to have a mechanism to take regular backups. So the best method was to write a shell script that, when executed, copied all the code files into a separate directory, zipped them and then uploaded them to HDFS, using the date and time as the suffix. I know that this method is not as clean as having a version control system, as we store complete files and finding differences still needs the use of a program like diff; however, it is better than nothing. While we did not end up deleting the code files, the team did end up deleting the bin directory where the helper scripts were stored!!! And for this directory I did not have a backup. I had no choice but to re-create all the scripts.

Once the source code control system was in place, I easily extended the backup script to upload the files to the version control system in addition to the previous method uploading to HDFS.

### Summing up

These days, programming languages like Python, Spark, Scala, and Java are in vogue as they are used to develop applications related to artificial intelligence and machine learning. While these languages are far more powerful when compared to shells, the ‘humble’ shell provides a ready platform that allows us to create helper scripts that ease our day-to-day tasks. The shell is quite powerful, more so because we can combine the powers of all the applications installed on the OS. As I found out in my project, even after many decades, shell scripting is still going strong. I hope I have convinced you to give it a try.

### One for the road

Shell scripts can be very handy. Consider the following command:

```
spark3-submit --queue pyspark --conf “spark.yarn.principal= abcd@abcd.com --conf “spark.yarn.keytab=/keytabs/abcd.keytab --jars /opt/custom_jars/abcd_1.jar --deploy-mode cluster --master yarn $*
```

We were expected to use this command while executing a Python/Spark application. Now imagine this command has to be used multiple times a day, by a team of 40 people. Most of us will copy this command in Notepad++, and each time we need to use it, we will copy it from Notepad++ and paste it on the terminal. What if there is an error during copy paste? What if someone uses the parameters incorrectly? How do we debug which command was used? Looking at history does not help much.
To make it simple for the team to get on with the task of Python/Spark application execution, we can create a bash shell script as follows:

```
#!/bin/bash
SERVICE_PRINCIPAL=abcd@abcd.com
KEYTAB_PATH=/keytabs/abcd.keytab
MY_JARS=/opt/custom_jars/abcd_1.jar
MAX_RETRIES=128
QUEUE=pyspark
MASTER=yarn
MODE=cluster

spark3-submit --queue ${QUEUE} --conf “spark.yarn.principal=${SERVICE_PRINCIPAL} --conf “spark.yarn.keytab=${KEYTAB_PATH} --jars ${MY_JARS} --deploy-mode ${MODE} --master ${MASTER} $*
```

This demonstrates how powerful a shell script can be and make our life easy. You can try more commands and scripts as per your requirement and explore further.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/shell-scripting-is-still-going-strong/

作者：[Bipin Patwardhan][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/bipin-patwardhan/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Penguin-with-linux-command.jpg
