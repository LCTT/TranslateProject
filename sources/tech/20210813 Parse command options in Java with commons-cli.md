[#]: subject: "Parse command options in Java with commons-cli"
[#]: via: "https://opensource.com/article/21/8/java-commons-cli"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Parse command options in Java with commons-cli
======
Let your users modify how your Java application runs with command-line
options.
![Learning and studying technology is the key to success][1]

When you enter a command into your terminal, whether it's to launch a GUI app or just a terminal app, there are often [options][2] (sometimes called _switches_ or _flags_) you can use to modify how the application runs. This is a standard set by the [POSIX specification][3], so it's useful for a Java programmer to know how to detect and parse options.

There are several ways to parse options in Java. My favorite is the [Apache Commons CLI][4] library, called **commons-cli** for short.

### Installing commons-cli

If you're using a project management system like [Maven][5] and an IDE, you can install the Apache Commons CLI library in your project properties (such as `pom.xml` or a configuration screen in Eclipse or NetBeans).

If you're managing libraries manually, you can download [the latest release][6] from the Apache website. Several JAR files come bundled together. The only required JAR is the `commons-cli-X.Y.jar` (where X and Y are the latest version numbers.) Add that JAR to your project, either manually or in your IDE, and then you can use it in your code.

### Importing a library into your Java code

To use the **commons-cli** library in your code, you must import it. For this simple option parsing example, you can populate a file called `Main.java` with the standard minimal code:


```
package com.opensource.myoptparser;

import org.apache.commons.cli.*;

public class Main {
    public static void main([String][7][] args) {
    // code 
    }
}
```

Now you're set to parse options in Java.

### Defining Boolean options in Java

The first thing you must do to parse options is to define the valid options your application can accept. Use the `Option` (singular) class to create option objects and the `Options` (plural) class to help keep track of all the options you've created in your project.

First, create a group for your options, and call it `options` according to convention:


```
    //code
    Options options = new Options();
```

Next, define your individual options by listing a short option, a long option, a default Boolean value, and a help message. You then set whether the option is required or not, and finally add the option to the `options` object, which contains all of your options. In this example, I create just one option, arbitrarily called `alpha`:


```
    //define options
    [Option][8] alpha = new [Option][8]("a", "alpha", false, "Activate feature alpha");
    options.addOption(alpha);
```

### Defining options with arguments in Java

Sometimes you want users to provide information other than just **true** or **false** along with an option. You might want to let a user refer to a configuration file, an input file, or any setting like a date or a color. For this, you use the `builder` method, creating attributes for an option based on its short version (for example, `-c` is a short option, `--config` is a long option). Once it's defined, you add the new option to your `options` group:


```
    [Option][8] config = [Option][8].builder("c").longOpt("config")
        .argName("config")
        .hasArg()
        .required(true)
        .desc("set config file").build();
    options.addOption(config);
```

With the `builder` function, you can set the short version, long version, whether it's required (I set this to **true** in this code, so my application can't run unless this option is provided by the user at launch time), the help message, and so on.

### Parsing options with Java

With all possible options defined, you can now iterate over arguments provided by the user, checking to see whether any argument matches your approved list of valid short options. To do this, you create an instance of the **CommandLine** itself, which contains all arguments provided by the user (valid options and otherwise.) You also create a **CommandLineParser** object, which I call `parser` in my code, to facilitate interaction over those arguments. Finally, you can create a **HelpFormatter** object (which I call `helper`) to automatically provide helpful messages to the user when either a required option is missing, or the `--help` or `-h` option is used.


```
    // define parser
    CommandLine cmd;
    CommandLineParser parser = new BasicParser();
    HelpFormatter helper = new HelpFormatter();
```

Finally, add some conditionals to analyze the options provided by the user as command-line input (discovered and stored in the `cmd` variable). This sample application has two different types of options, but in both cases, you can check whether the option exists with the `.hasOption` method plus the short option name. When an option is detected, you can do whatever needs to be done with the data.


```
try {
    cmd = parser.parse(options, args);
    if(cmd.hasOption("a")) {
    [System][9].out.println("Alpha activated");
    }

    if (cmd.hasOption("c")) {
    [String][7] opt_config = cmd.getOptionValue("config");
    [System][9].out.println("Config set to " + opt_config);
    }
} catch ([ParseException][10] e) {
    [System][9].out.println(e.getMessage());
    helper.printHelp("Usage:", options);
    [System][9].exit(0);
}
```

The act of parsing potentially generates an error because sometimes the required `-c` or `--config` option could be missing. In that event, a help message is printed, and the application is immediately ended. Because of this error (an _exception_ in Java terminology), you must amend the start of the main method to declare a possible exception:


```
`public static void main(String[] args) throws ParseException {`
```

The sample application is now complete.

### Test your code

You can test the application in your IDE by adjusting the default parameters passed to your code or just build a JAR file and run it from your terminal. The process for this differs depending on your IDE. Refer to your IDE documentation, read my article on how to LINK-TO-ARTICLE[build a JAR], or see Daniel Oh's article on how to do the same with [Maven][11].

First, confirm the parser exception by omitting the required `-c` or `--config` option:


```
$ java -jar dist/myapp.jar                 
Missing required option: c
usage: Usage:
 -a,--alpha             Activate feature alpha
 -c,--config &lt;config&gt;   Set config file
```

Try it again with the options provided:


```
java -jar dist/myantapp.jar --config foo -a
Alpha activated
Config set to foo
```

### Option parsing

Including options for your users is an important feature for any application. Java and the Apache commons make it easy to do.

Here's the full demonstration code for your reference:


```
package com.opensource.myapp;

import org.apache.commons.cli.*;

public class Main {
    
    /**
     * @param args the command line arguments
     * @throws org.apache.commons.cli.ParseException
     */ 
    public static void main([String][7][] args) throws [ParseException][10] {
        // define options
        Options options = new Options();
        
        [Option][8] alpha = new [Option][8]("a", "alpha", false, "Activate feature alpha");
        options.addOption(alpha);
        
        [Option][8] config = [Option][8].builder("c").longOpt("config")
                .argName("config")
                .hasArg()
                .required(true)
                .desc("Set config file").build();
        options.addOption(config);
     
        // define parser
        CommandLine cmd;
        CommandLineParser parser = new BasicParser();
        HelpFormatter helper = new HelpFormatter();

        try {
            cmd = parser.parse(options, args);
            if(cmd.hasOption("a")) {
                [System][9].out.println("Alpha activated");
            }
          
            if (cmd.hasOption("c")) {
                [String][7] opt_config = cmd.getOptionValue("config");
                [System][9].out.println("Config set to " + opt_config);
            }
        } catch ([ParseException][10] e) {
            [System][9].out.println(e.getMessage());
            helper.printHelp("Usage:", options);
            [System][9].exit(0);
        }
    }
}
```

### Using Java and options

Options allow users to modify how commands work. There are many ways to parse options when using Java, and the `commons-cli` is a robust and flexible open source solution. Give it a try in your next Java project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/java-commons-cli

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/studying-books-java-couch-education.png?itok=C9gasCXr (Learning and studying technology is the key to success)
[2]: https://opensource.com/article/21/8/linux-terminal#options
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://commons.apache.org/proper/commons-cli/usage.html
[5]: https://maven.apache.org/
[6]: https://commons.apache.org/proper/commons-cli/download_cli.cgi
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+option
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+parseexception
[11]: https://developers.redhat.com/blog/2021/04/08/build-even-faster-quarkus-applications-with-fast-jar
