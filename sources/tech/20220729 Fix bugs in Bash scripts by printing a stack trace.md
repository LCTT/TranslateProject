[#]: subject: "Fix bugs in Bash scripts by printing a stack trace"
[#]: via: "https://opensource.com/article/22/7/print-stack-trace-bash-scripts"
[#]: author: "Evan "Hippy" Slatis https://opensource.com/users/hippyod"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fix bugs in Bash scripts by printing a stack trace
======
Automatically printing a stack trace on unhandled errors in your scripts can make finding and fixing bugs in your code much easier.

![Bug tracking magnifying glass on computer screen][1]

Image by: Pixabay, testbytes, CC0

No one wants to write bad code, but inevitably bugs will be created. Most modern languages like Java, JavaScript, Python, etc., automatically print a stack trace when they encounter an unhandled exception, but not shell scripts. It would make it much easier to find and fix bugs in shell scripts if you could print a stack trace, and, with a little work, you can.

Shell scripts can span multiple files, and well-written code is further broken down into functions. Tracing issues when something goes wrong in a shell script can be difficult when these scripts get large enough. A stack trace that walks the code backward from the error to the beginning can show you where your code failed and give you a better understanding of why so you can fix it properly.

To implement the stack trace, I use the [trap][2] in the following manner at the beginning of my script:

```
set -E

trap 'ERRO_LINENO=$LINENO' ERR
trap '_failure' EXIT
```

This example accomplishes a few things, but I'll address the second one, **trap 'ERRO_LINENO=$LINENO' ERR**, first. This line ensures the script traps all commands that exit with a non-zero exit code (i.e., an error), and saves the line number of the command in the file where the error was signaled. This is not captured on exit.

The first line above (**set -E**) ensures that the error trap is inherited throughout the script. Without this, whenever you drop into an **if** or **until** block, for example, you'd lose track of the correct line number.

The second trap captures the exit signal from the script and sends it to the **_failure** function, which I'll define in a moment. But why on exit and not error if you're trying to debug the script? In bash scripts, command failures are often used in control logic or can be ignored outright as unimportant by design. For example, say at the beginning of your script, you're looking to see if a particular program is already installed before asking the user whether they'd like you to install it for them:

```
if [[ ! -z $(command -v some_command) ]]
then
   # CAPTURE LOCATION OF some_command
   SOME_COMMAND_EXEC=$(which some_command)
else
   # echo $? would give us a non-zero value here; i.e. an error code
   # IGNORE ERR: ASK USER IF THEY WANT TO INSTALL some_command
fi
```

If you were to stop processing on every error and some_command is not installed, this would prematurely end the script, which is obviously not what you want to do here, so in general, you only want to log an error and stack trace when the script has exited unintentionally because of an error.

To force your script to exit whenever there's an unexpected error, use the **set -e** option:

```
set -e
# SCRIPT WILL EXIT IF ANY COMMAND RETURNS A NON-ZERO CODE
# WHILE set -e IS IN FORCE
set +e
# COMMANDS WITH ERRORS WILL NOT CAUSE THE SCRIPT TO EXIT HERE
```

The next question is, what are some examples where you would probably like your script to exit and highlight a failure? Common examples include the following:

1. An unreachable remote system
2. Authentication to a remote system fail
3. Syntax errors in config or script files being sourced
4. Docker image builds
5. Compiler errors

Combing through many pages of logs after a script completes looking for any possible errors that may be hard to spot can be extremely frustrating. It's even more frustrating when you discover something is wrong long past the time you ran the script and now have to comb through multiple sets of logs to find what might have gone wrong and where. Worst is when the error has been around for a while, and you only discover it at the worst possible time. In any case, pinpointing the problem as quickly as possible and fixing it is always the priority.

Look at the sample stack trace code (available for [download here][3]):

```
# Sample code for generating a stack trace on catastrophic failure

set -E

trap 'ERRO_LINENO=$LINENO' ERR
trap '_failure' EXIT

_failure() {
  ERR_CODE=$? # capture last command exit code
  set +xv # turns off debug logging, just in case
  if [[  $- =~ e && ${ERR_CODE} != 0 ]]
  then
      # only log stack trace if requested (set -e)
      # and last command failed
      echo
      echo "========= CATASTROPHIC COMMAND FAIL ========="
      echo
      echo "SCRIPT EXITED ON ERROR CODE: ${ERR_CODE}"
      echo
      LEN=${#BASH_LINENO[@]}
      for (( INDEX=0; INDEX<$LEN-1; INDEX++ ))
      do
          echo '---'
          echo "FILE: $(basename ${BASH_SOURCE[${INDEX}+1]})"
          echo "  FUNCTION: ${FUNCNAME[${INDEX}+1]}"
          if [[ ${INDEX} > 0 ]]
          then
           # commands in stack trace
              echo "  COMMAND: ${FUNCNAME[${INDEX}]}"
              echo "  LINE: ${BASH_LINENO[${INDEX}]}"
          else
              # command that failed
              echo "  COMMAND: ${BASH_COMMAND}"
              echo "  LINE: ${ERRO_LINENO}"
          fi
      done
      echo
      echo "======= END CATASTROPHIC COMMAND FAIL ======="
      echo
  fi
}

# set working directory to this directory for duration of this test
cd "$(dirname ${0})"

echo 'Beginning stacktrace test'

set -e
source ./testfile1.sh
source ./testfile2.sh
set +e

_file1_function1
```

In the `stacktrace.sh` above, the first thing the **_failure** function does is capture the exit code of the last command using the built-in shell value **$?**. It then checks whether the exit was unexpected by checking the output of **$-**, a built-in shell value that holds the current bash shell settings, to see if **set -e** is in force. If the script exited on an error and the error was unexpected, the stack trace is output to the console.

The following built-in shell values are used to build the stack trace:

1. BASH_SOURCE: Array of filenames where each command was called back to the main script.
2. FUNCNAME: Array of line numbers matching each file in BASH_SOURCE.
3. BASH_LINENO: Array of line numbers per file matching BASH_SOURCE.
4. BASH_COMMAND: Last command executed with flags and arguments.

If the script exits with an error in an unexpected manner, it loops over the above variables and outputs each one in order so a stack trace can be built. The line number of the failed command is not held in the above arrays, but that's why you captured the line number each time a command failed with the first trap statement above.

### Putting it all together

Create the following two files to support the test, so you can see how the information is gathered across multiple files. First, `testfile1.sh` :

```
_file1_function1() {
   echo
   echo "executing in _file1_function1"
   echo

   _file2_function1
}

# adsfadfaf

_file1_function2() {
   echo
   echo "executing in _file1_function2"
   echo
  
   set -e
   curl this_curl_will_fail_and_CAUSE_A_STACK_TRACE

   # function never called
   _file2_does_not_exist
}
```

And next, `testfile2.sh` :

```
_file2_function1() {
   echo
   echo "executing in _file2_function1"
   echo

   curl this_curl_will_simply_fail

   _file1_function2
}
```

NOTE: If you create these files yourself, make sure to make the `stacktrace.sh` file executable.

Executing `stacktrace.sh` will output the following:

```
~/shell-stack-trace-example$./stracktrace.sh
Beginning stacktrace test

executing in _file1_function1

executing in _file2_function1
curl: (6) Could not resolve host: this_curl_will_simply_fail

executing in _file1_function2
curl: (6) Could not resolve host: this_curl_will_fail_and_CAUSE_A_STACK_TRACE

========= CATASTROPHIC COMMAND FAIL =========

SCRIPT EXITED ON ERROR CODE: 6

---
FILE: testfile1.sh
  FUNCTION: _file1_function2
  COMMAND: curl this_curl_will_fail_and_CAUSE_A_STACK_TRACE
  LINE: 15
---
FILE: testfile2.sh
  FUNCTION: _file2_function1
  COMMAND: _file1_function2
  LINE: 7
---
FILE: testfile1.sh
  FUNCTION: _file1_function1
  COMMAND: _file2_function1
  LINE: 5
---
FILE: stracktrace.sh
  FUNCTION: main
  COMMAND: _file1_function1
  LINE: 53

======= END CATASTROPHIC COMMAND FAIL =======
```

For extra credit, try uncommenting the line in `testfile1.sh` and executing `stacktrace.sh` again:

```
# adsfadfaf
```

Then re-comment the line, and instead comment out the following line in `testfile1.sh` that caused a stack trace and run `stacktrace.sh` one last time:

```
curl this_curl_will_fail_and_CAUSE_A_STACK_TRACE
```

This exercise should give you an idea of the output and when it occurs if you have typos in your scripts.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/print-stack-trace-bash-scripts

作者：[Evan "Hippy" Slatis][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hippyod
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bug_software_issue_tracking_computer_screen.jpg
[2]: https://man7.org/linux/man-pages/man1/trap.1p.html
[3]: https://github.com/hippyod-labs/shell-stack-trace-example
