[#]: subject: "Parse command-line options in Groovy"
[#]: via: "https://opensource.com/article/21/8/parsing-command-options-groovy"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Parse command-line options in Groovy
======
Learn to add options to your Groovy applications.
![Woman sitting in front of her computer][1]

A recent article provided an [introduction to parsing command-line options in Java][2]. Because I really like Groovy, and because Groovy is well suited for scripting, and because it's fun to compare Java and Groovy solutions, I decided to paraphrase Seth's article, but using Groovy.

### Install Groovy

Groovy is based on Java, so it requires a Java installation. Both a recent and decent version of Java and Groovy might be in your Linux distribution's repositories. Alternately, you can install Groovy by following the instructions on the [groovy-lang.org][3].

A nice alternative for Linux users is [SDKMan][4], which can be used to get multiple versions of Java, Groovy, and many other related tools. For this article, I'm using my distro's OpenJDK11 release and SDKMan's latest Groovy release.

### Parsing command-line options in Groovy

When we create a script—a kind of short, often informal program—to be run from the command line, we normally follow the practice of passing arguments to the script on the command line. A good example of this is the `ls` command, used to list all the files and subfolders in a given folder, perhaps showing attributes and sorted in reverse order of last modification date, as in:


```
`$ ls -lt /home/me`
```

To show the contents of my home folder like this:


```
total 252
drwxr-xr-x 5 me me 4096 Aug 10 12:23 Downloads
drwx------ 11 me me 4096 Aug 10 08:59 Dropbox
drwxr-xr-x 27 me me 12288 Aug 9 11:58 Pictures
-rw-rw-r-- 1 me me 235 Jul 28 16:22 wb.groovy
drwxr-xr-x 2 me me 4096 Jul 20 22:04 Desktop
drwxrwxr-x 2 me me 4096 Jul 20 15:16 Fixed
drwxr-xr-x 2 me me 16384 Jul 19 08:49 Music
-rw-rw-r-- 1 me me 433 Jul 7 13:24 foo
drwxr-xr-x 6 me me 4096 Jun 29 10:25 Documents
drwxr-xr-x 2 me me 4096 Jun 14 22:15 Templates
-rw-rw-r-- 1 me me 803 Jun 14 11:33 bar
```

Of course, arguments to commands can be handled by inspecting them and deciding what to do in each case; but this ends up being a duplication of effort that can be avoided by using a library designed for that purpose.

Seth's Java article introduces the [Apache Commons CLI library][5], a great API for handling command-line options. In fact, this library is so great that the good people who develop Groovy make it available by default in the Groovy installation. Therefore, once you have Groovy installed, you have access to this library through [**groovy.cli.picocli.CliBuilder**][6], which is already imported for you by default.

Here's a Groovy script that uses this CLI builder to achieve the same results as Seth's Java program:


```
1 def cli = new CliBuilder(usage: 'ho.groovy [-a] -c')
2 cli.with {
3    a longOpt: 'alpha', 'Activate feature alpha'
4    c longOpt: 'config', args:1, argName: 'config', required: true, 'Set config file'
5 }
6 def options = cli.parse(args)
7 if (!options) {
8    return
9 }
10 if (options.a) {
11    println' Alpha activated'
12 }
13 if (options.c) {
14    println "Config set to ${options.c}"
15 }
```

I've included line numbers here to facilitate the discussion. Save this script without the line numbers in a file called **ho.groovy**.

On line 1, we define the variable **cli** and set it to a new instance of **CliBuilder** with a defined **usage** attribute. This is a string that will be printed if the **usage()** method is called.

On lines 2-5, we use [the **with()** method][7] that Groovy adds to objects, together with the DSL defined by **CliBuilder**, to set up the option definitions.

On line 3, we define the option '**a**', setting its **longOpt** field to '**alpha**' and its description to '**Activate feature alpha**'.

Similarly, on line 4, we define the option '**c**', setting its **longOpt** field to '**config**' and specifying that this option takes one argument whose name is '**config**'. Moreover, this is a **required** option (sounds funny, I know), and its description is '**Set config file**'.

Pausing briefly here for a bit of background, you can read all about these various options at the **CliBuilder** link above. More generally, things written in the form **longOpt: 'alpha'** are Groovy notation for key-value entries to be put in a **Map** instance, which you can read about [here][8]. Each key, in this case, corresponds to a method of the same name provided by the CliBuilder. If you're wondering what's going on with a line like:


```
`a longOpt: 'alpha', 'Activate feature alpha'`
```

then it may be useful to mention that Groovy allows us to drop parentheses in certain circumstances; so the above is equivalent to:


```
`a(longOpt: 'alpha', 'Activate feature alpha')`
```

i.e., it's a method call. Moreover, Groovy allows both positional and named parameters, the latter using that key: value syntax.

Onward! On lines 6-9, we call the **parse()** method of the **CliBuilder** instance **cli**, passing the **args—**an array of **String** values created by the Groovy run-time and containing the arguments from the command line. This method returns a **Map** of the options where the keys are the short-form of the predefined options—in this case, '**a**' and '**c**'. If the parsing fails, then **parse()** emits the **usage** message, a reasonable error message, and returns a null value, so we don't have to use a try-catch block (which one doesn't see as often in Groovy). So here—line 8—we just return since all our work is done for us.

On lines 10-12, we check to see if option '_a_' was included on the command line and if it is, print a message saying so.

Similarly, on lines 13-15, we check to see if option '**c**' was included on the command line and if so, print a message showing the argument provided to it.

### Running the command

Let’s run the script a few times; first with no arguments:


```
$ groovy ho.groovy
error: Missing required option: c
usage: ho.groovy [-a] -c
 -a,--alpha Activate feature alpha
 -c,--config &lt;config&gt; [Set][9] config file
$
```

Notice the complaint about missing the required option '**c**'.

Then with the '**c**' option but no argument:


```
$ groovy ho.groovy -c
error: Missing argument for option: c
usage: ho.groovy [-a] -c
 -a,--alpha
Activate feature alpha
 -c,--config &lt;config&gt; [Set][9] config file
$
```

Cool, the **CliBuilder** instance method **parse()** noticed no argument was provided to '**c**'.

Finally, let's try with both options and an argument to '**c**', in their long form:


```
$ groovy ho.groovy --alpha --config bar
Alpha activated
Config set to bar
$
```

Looks good!

Since the idea of the '**c**' option is to provide a config file, we could also tell the **CliBuilder** instance that the type of this argument is File, and it will return that instead of a String. But we'll leave that for another day.

So, there you have it—command-line option parsing in Groovy.

### Groovy resources

The Groovy website has a lot of great documentation. Another great Groovy resource is [Mr. Haki][10], and specifically [this lovely article on CliBuilder][11].

Another great reason to learn Groovy is [Grails][12], a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/parsing-command-options-groovy

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_3.png?itok=qw2A18BM (Woman sitting in front of her computer)
[2]: https://opensource.com/article/21/8/java-commons-cli
[3]: https://groovy-lang.org/
[4]: https://sdkman.io/
[5]: https://commons.apache.org/proper/commons-cli/
[6]: https://docs.groovy-lang.org/latest/html/gapi/groovy/cli/picocli/CliBuilder.html
[7]: https://objectpartners.com/2014/07/09/groovys-with-and-multiple-assignment/
[8]: https://www.baeldung.com/groovy-maps
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+set
[10]: https://blog.mrhaki.com/
[11]: https://blog.mrhaki.com/2009/09/groovy-goodness-parsing-commandline.html
[12]: https://grails.org/
