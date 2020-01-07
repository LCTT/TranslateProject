[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways to improve your Bash scripts)
[#]: via: (https://opensource.com/article/20/1/improve-bash-scripts)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

5 ways to improve your Bash scripts
======
Find out how Bash can help you tackle the most challenging tasks.
![A person working.][1]

A system admin often writes Bash scripts, some short and some quite lengthy, to accomplish various tasks.

Have you ever looked at an installation script provided by a software vendor? They often add a lot of functions and logic in order to ensure that the installation works properly and doesn’t result in damage to the customer’s system. Over the years, I’ve amassed a collection of various techniques for enhancing my Bash scripts, and I’d like to share some of them in hopes they can help others. Here is a collection of small scripts created to illustrate these simple examples.

### Starting out

When I was starting out, my Bash scripts were nothing more than a series of commands, usually meant to save time with standard shell operations like deploying web content. One such task was extracting static content into the home directory of an Apache web server. My script went something like this:


```
cp january_schedule.tar.gz /usr/apache/home/calendar/
cd /usr/apache/home/calendar/
tar zvxf january_schedule.tar.gz
```

While this saved me some time and typing, it certainly was not a very interesting or useful script in the long term. Over time, I learned other ways to use Bash scripts to accomplish more challenging tasks, such as creating software packages, installing software, or backing up a file server.

### 1\. The conditional statement

Just as with so many other programming languages, the conditional has been a powerful and common feature. A conditional is what enables logic to be performed by a computer program. Most of my examples are based on conditional logic.

The basic conditional uses an "if" statement. This allows us to test for some condition that we can then use to manipulate how a script performs. For instance, we can check for the existence of a Java bin directory, which would indicate that Java is installed. If found, the executable path can be updated with the location to enable calls by Java applications.


```
if [ -d "$JAVA_HOME/bin" ] ; then
    PATH="$JAVA_HOME/bin:$PATH"
```

### 2\. Limit execution

You might want to limit a script to only be run by a specific user. Although Linux has standard permissions for users and groups, as well as SELinux for enabling this type of protection, you could choose to place logic within a script. Perhaps you want to be sure that only the owner of a particular web application can run its startup script. You could even use code to limit a script to the root user. Linux has a couple of environment variables that we can test in this logic. One is **$USER**, which provides the username. Another is **$UID**, which provides the user’s identification number (UID) and, in the case of a script, the UID of the executing user.

#### User

The first example shows how I could limit a script to the user jboss1 in a multi-hosting environment with several application server instances. The conditional "if" statement essentially asks, "Is the executing user not jboss1?" When the condition is found to be true, the first echo statement is called, followed by the **exit 1,** which terminates the script.


```
if [ "$USER" != 'jboss1' ]; then
     echo "Sorry, this script must be run as JBOSS1!"
     exit 1
fi
echo "continue script"
```

#### Root

This next example script ensures that only the root user can execute it. Because the UID for root is 0, we can use the **-gt** option in the conditional if statement to prohibit all UIDs greater than zero.


```
if [ "$UID" -gt 0 ]; then
     echo "Sorry, this script must be run as ROOT!"
     exit 1
fi
echo "continue script"
```

### 3\. Use arguments

Just like any executable program, Bash scripts can take arguments as input. Below are a few examples. But first, you should understand that good programming means that we don’t just write applications that do what we want; we must write applications that _can’t_ do what we _don’t_ want. I like to ensure that a script doesn’t do anything destructive in the case where there is no argument. Therefore, this is the first check that y. The condition checks the number of arguments, **$#**, for a value of zero and terminates the script if true.


```
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi
echo "arguments found: $#"
```

#### Multiple arguments

You can pass more than one argument to a script. The internal variables that the script uses to reference each argument are simply incremented, such as **$1**, **$2**, **$3**, and so on. I’ll just expand my example above with the following line to echo the first three arguments. Obviously, additional logic will be needed for proper argument handling based on the total number. This example is simple for the sake of demonstration.


```
`echo $1 $2 $3`
```

While we’re discussing these argument variables, you might have wondered, "Did he skip zero?"

Well, yes, I did, but I have a great reason! There is indeed a **$0** variable, and it is very useful. Its value is simply the name of the script being executed.


```
`echo $0`
```

An important reason to reference the name of the script during execution is to generate a log file that includes the script’s name in its own name. The simplest form might just be an echo statement.


```
`echo test >> $0.log`
```

However, you will probably want to add a bit more code to ensure that the log is written to a location with the name and information that you find helpful to your use case.

### 4\. User input

Another useful feature to use in a script is its ability to accept input during execution. The simplest is to offer the user some input.


```
echo "enter a word please:"
 read word
 echo $word
```

This also allows you to provide choices to the user.


```
read -p "Install Software ?? [Y/n]: " answ
 if [ "$answ" == 'n' ]; then
   exit 1
 fi
   echo "Installation starting..."
```

### 5\. Exit on failure

Some years ago, I wrote a script for installing the latest version of the Java Development Kit (JDK) on my computer. The script extracts the JDK archive to a specific directory, updates a symbolic link, and uses the alternatives utility to make the system aware of the new version. If the extraction of the JDK archive failed, continuing could break Java system-wide. So, I wanted the script to abort in such a situation. I don’t want the script to make the next set of system changes unless the archive was successfully extracted. The following is an excerpt from that script:


```
tar kxzmf jdk-8u221-linux-x64.tar.gz -C /jdk --checkpoint=.500; ec=$?
if [ $ec -ne 0 ]; then
     echo "Installation failed - exiting."
     exit 1
fi
```

A quick way for you to demonstrate the usage of the **$?** variable is with this short one-liner:


```
`ls T; ec=$?; echo $ec`
```

First, run **touch T** followed by this command. The value of **ec** will be 0. Then, delete **T**, **rm T**, and repeat the command. The value of **ec** will now be 2 because ls reports an error condition since **T** was not found.

You can take advantage of this error reporting to include logic, as I have above, to control the behavior of your scripts.

### Takeaway

We might assume that we need to employ languages, such as Python, C, or Java, for higher functionality, but that’s not necessarily true. The Bash scripting language is very powerful. There is a lot to learn to maximize its usefulness. I hope these few examples will shed some light on the potential of coding with Bash.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/improve-bash-scripts

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl (A person working.)
