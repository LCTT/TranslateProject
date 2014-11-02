>>> Translating by ThomazL
Shell Scripting – Checking Conditions with if
================================================================================
In Bourne Shell if statement checks whether a condition is true or not. If so , the shell executes the block of code associated with the if statement. If the statement is not true , the shell jumps beyond the end of the if statement block & Continues on.

### Syntax of if Statement : ###

    if [ condition_command ]
    then
            command1
            command2
            ……..
            last_command
    fi

#### Example: ####

    #!/bin/bash
    number=150
    if [ $number -eq 150 ]
    then
        echo "Number is 150"
    fi

#### if-else Statement : ####

In addition to the normal if statement , we can extend the if statement with an else block. The basic idea is that if the statement is true , then execute the if block. If the statement is false , then execute the else block.

#### Syntax : ####

    if [ condition_command ]
    then
           command1
           command2
           ……..
           last_command
    else
           command1
           command2
           ……..
           last_command
    fi

#### Example: ####

    #!/bin/bash
    number=150
    if [ $number -gt 250 ]
    then
        echo "Number is greater"
    else
        echo "Number is smaller"
    fi

### If..elif..else..fi Statement (Short for else if) ###

The Bourne shell syntax for the if statement allows an else block that gets executed if the test is not true. We can nest if statement , allowing for multiple conditions. As an alternative, we can use the elif construct , shot for else if.

#### Syntax : ####

    if [ condition_command ]
    then
           command1
           command2
           ……..
           last_command
    elif [ condition_command2 ]
    then
            command1
            command2
            ……..
            last_command
    else
    command1
    command2
    ……..
    last_command
    fi

#### Example : ####

    #!/bin/bash
    number=150
    if [ $number -gt 300 ]
    then
        echo "Number is greater"
    elif [ $number -lt 300 ]
    then
        echo "Number is Smaller"
    else
        echo "Number is equal to actual value"
    fi

### Nested if statements : ###

If statement and else statement can be nested in a bash script. The keyword ‘fi’ shows the end of the inner if statement and all if statement should end with the keyword ‘fi’.

Basic **syntax of nested** if is shown below :

    if [ condition_command ]
    then
            command1
            command2
            ……..
            last_command
    else
    if [ condition_command2 ]
    then
            command1
            command2
            ……..
            last_command
    else
            command1
            command2
             ……..
             last_command
          fi
    fi

#### Example: ####

    #!/bin/bash
    number=150
    if [ $number -eq 150 ]
    then
       echo "Number is 150"
    else
    if [ $number -gt 150 ]
    then
        echo "Number is greater"
    else
        echo "'Number is smaller"
       fi
    fi

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/shell-scripting-checking-conditions-with-if/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
