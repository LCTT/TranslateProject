# [Improve your Bash scripts with Argbash][1]

![](https://fedoramagazine.org/wp-content/uploads/2017/11/argbash-1-945x400.png)

Do you write or maintain non-trivial bash scripts? If so, you probably want them to accept command-line arguments in a standard and robust way. Fedora recently got [a nice addition][2] which can help you produce better scripts. And don’t worry, it won’t cost you much of your time or energy.

### Why Argbash?

Bash is an interpreted command-line language with no standard library. Therefore, if you write bash scripts and want command-line interfaces that conform to [POSIX][3] and [GNU CLI][4] standards, you’re used to only two options:

1.  Write the argument-parsing functionality tailored to your script yourself (possibly using the `getopts` builtin).

2.  Use an external bash module.

The first option looks incredibly silly as implementing the interface properly is not trivial. However, it is suggested as the best choice on various sites ranging from [Stack Overflow][5] to the [Bash Hackers][6] wiki.

The second option looks smarter, but using a module has its issues. The biggest is you have to bundle its code with your script. This may mean either:

*   You distribute the library as a separate file, or

*   You include the library code at the beginning of your script.

Having two files instead of one is awkward. So is polluting your bash scripts with a chunk of complex code over thousand lines long.

This was the main reason why the Argbash [project came to life][7]. Argbash is a code generator, so it generates a tailor-made parsing library for your script. Unlike the generic code of other bash modules, it produces minimal code your script needs. Moreover, you can request even simpler code if you don’t need 100% conformance to these CLI standards.

### Example

### Analysis

Let’s say you want to implement a script that [draws a bar][8] across the terminal window. You do that by repeating a single character of your choice multiple times. This means you need to get the following information from the command-line:

*   _The character which is the element of the line. If not specified, use a dash._  On the command-line, this would be a single-valued positional argument  _character_  with a default value of -.

*   _Length of the line. If not specified, go for 80._  This is a single-valued optional argument  _–length_  with a default of 80.

*   _Verbose mode (for debugging)._  This is a boolean argument  _verbose_ , off by default.

As the body of the script is really simple, this article focuses on getting the input of the user from the command-line to appropriate script variables. Argbash generates code that saves parsing results to shell variables  __arg_character_ ,  __arg_length_  and  __arg_verbose_ .

### Execution

In order to proceed, you need the  _argbash-init_  and  _argbash_  bash scripts that are parts of the  _argbash_  package. Therefore, run this command:

```
sudo dnf install argbash
```

Then, use  _argbash-init_  to generate a template for  _argbash_ , which generates the executable script. You want three arguments: a positional one called  _character_ , an optional  _length_  and an optional boolean  _verbose_ . Tell this to  _argbash-init_ , and then pass the output to  _argbash_ :

```
argbash-init --pos character --opt length --opt-bool verbose script-template.sh
argbash script-template.sh -o script
./script
```

See the help message? Looks like the script doesn’t know about the default option for the character argument. So take a look at the [Argbash API][9], and then fix the issue by editing the template section of the script:

```
# ...
# ARG_OPTIONAL_SINGLE([length],[l],[Length of the line],[80])
# ARG_OPTIONAL_BOOLEAN([verbose],[V],[Debug mode])
# ARG_POSITIONAL_SINGLE([character],[The element of the line],[-])
# ARG_HELP([The line drawer])
# ...
```

Argbash is so smart that it tries to make every generated script a template of itself. This means you don’t have to worry about storing source templates for further use. You just shouldn’t lose your generated bash scripts. Now, try to regenerate the future line drawer to work as expected:

```
argbash script -o script
./script
```

As you can see, everything is working all right. The only thing left to do is fill in the line drawing functionality itself.

### Conclusion

You might find the section containing parsing code quite long, but consider that it allows you to call  _./script.sh x -Vl50_  and it will be understood the same way as  _./script -V -l 50 x. I_ t does require some code to get this right.

However, you can shift the balance between generated code complexity and parsing abilities towards more simple code by calling  _argbash-init_  with argument  _–mode_  set to  _minimal_ . This option reduces the size of the script by about 20 lines, which corresponds to a roughly 25% decrease of the generated parsing code size. On the other hand, the  _full_  mode makes the script even smarter.

If you want to examine the generated code, give  _argbash_  the argument  _–commented_ , which puts comments into the parsing code that reveal the intent behind various sections. Compare that to other argument parsing libraries such as [shflags][10], [argsparse][11] or [bash-modules/arguments][12], and you’ll see the powerful simplicity of Argbash. If something goes horribly wrong and you need to fix a glitch in the parsing functionality quickly, Argbash allows you to do that as well.

As you’re most likely a Fedora user, you can enjoy the luxury of having command-line Argbash installed from the official repositories. However, there is also an [online parsing code generator][13] at your service. Furthermore, if you’re working on a server with Docker, you can appreciate the [Argbash Docker image][14].

So enjoy and make sure that your scripts have a command-line interface that pleases your users. Argbash is here to help, with minimal effort required from your side.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/improve-bash-scripts-argbash/

作者：[Matěj Týč ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/bubla/
[1]:https://fedoramagazine.org/improve-bash-scripts-argbash/
[2]:https://argbash.readthedocs.io/
[3]:http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html
[4]:https://www.gnu.org/prep/standards/html_node/Command_002dLine-Interfaces.html
[5]:https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
[6]:http://wiki.bash-hackers.org/howto/getopts_tutorial
[7]:https://argbash.readthedocs.io/
[8]:http://wiki.bash-hackers.org/snipplets/print_horizontal_line
[9]:http://argbash.readthedocs.io/en/stable/guide.html#argbash-api
[10]:https://raw.githubusercontent.com/Anvil/bash-argsparse/master/argsparse.sh
[11]:https://raw.githubusercontent.com/Anvil/bash-argsparse/master/argsparse.sh
[12]:https://raw.githubusercontent.com/vlisivka/bash-modules/master/main/bash-modules/src/bash-modules/arguments.sh
[13]:https://argbash.io/generate
[14]:https://hub.docker.com/r/matejak/argbash/
