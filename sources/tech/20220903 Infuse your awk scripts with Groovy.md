[#]: subject: "Infuse your awk scripts with Groovy"
[#]: via: "https://opensource.com/article/22/9/awk-groovy"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Infuse your awk scripts with Groovy
======
Awk and Groovy complement each other to create robust, useful scripts.

Recently I wrote a series on using Groovy scripts to clean up the tags in my music files. I developed a [framework][2] that recognized the structure of my music directory and used it to iterate over the content files. In the final article of that series, I separated this framework into a utility class that my scripts could use to process the content files.

This separate framework reminded me a lot of the way awk works. For those of you unfamiliar with awk, you might benefit from Opensource.com's eBook, [A practical guide to learning awk][3].

I have used awk extensively since 1984, when our little company bought its first "real" computer, which ran System V Unix. For me, awk was a revelation: It had associative memory— think arrays indexed by strings instead of numbers. It had regular expressions built in, seemed designed to deal with data, especially in columns, and was compact and easy to learn. Finally, it was designed to work in Unix pipelines, reading its data from standard input or files and writing to output, with no ceremony required to do so—data just appeared in the input stream.

To say that awk has been an essential part of my day-to-day computing toolkit is an understatement. And yet there are a few things about how I use awk that leave me unsatisfied.

Probably the main issue is that awk is good at dealing with data presented in delimited fields but curiously not good at handling comma-separated-value files, which can have field delimiters embedded within a field, provided that the field is quoted. Also, regular expressions have moved on since awk was invented, and needing to remember two sets of regular expression syntax rules is not conducive to bug-free code. [One set of such rules is bad enough][4].

Because awk is a small language, it's missing some things that I sometimes find useful, like a richer assortment of base types, structures, switch statements, and so on.

In contrast, Groovy has all of these good things: access to [the OpenCSV library][5], which facilitates dealing with CSV files, Java regular expressions and great matching operators, a rich assortment of base types, classes, switch statements, and more.

What Groovy lacks is the simple pipeline-oriented view of data as an incoming stream and processed data as an outgoing stream.

But my music directory processing framework made me think, maybe I can create a Groovy version of awk's "engine". That's my objective for this article.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation. Both a recent and decent version of Java and Groovy might be in your Linux distribution's repositories. Groovy can also be installed following the instructions on the [Groovy homepage][6]. A nice alternative for Linux users is [SDKMan][7], which can be used to get multiple versions of Java, Groovy and many other related tools. For this article, I'm using SDK's releases of:

* Java: version 11.0.12-open of OpenJDK 11;
* Groovy: version 3.0.8.

### Creating awk with Groovy

The basic idea here is to encapsulate the complexities of opening a file or files for processing, splitting the line into fields, and providing access to the stream of data in three parts:

* Before any data is processed
* On each line of data
* After all data is processed

I'm not going for the general case of replacing awk with Groovy. Instead, I'm working toward my typical use case, which is:

* Use a script file rather than having the code on the command line
* Process one or more input files
* Set my default field delimiter to `|` and split lines read on that delimiter
* Use OpenCSV to do the splitting (what I can't do in awk)

### The framework class

Here's the "awk engine" in a Groovy class:

```
1 @Grab('com.opencsv:opencsv:5.6')
 2 import com.opencsv.CSVReader
 3 public class AwkEngine {
 4 // With admiration and respect for
 5 //     Alfred Aho
 6 //     Peter Weinberger
 7 //     Brian Kernighan
 8 // Thank you for the enormous value
 9 // brought my job by the awk
10 // programming language
11 Closure onBegin
12 Closure onEachLine
13 Closure onEnd

14 private String fieldSeparator
15 private boolean isFirstLineHeader
16 private ArrayList<String> fileNameList
   
17 public AwkEngine(args) {
18     this.fileNameList = args
19     this.fieldSeparator = "|"
20     this.isFirstLineHeader = false
21 }
   
22 public AwkEngine(args, fieldSeparator) {
23     this.fileNameList = args
24     this.fieldSeparator = fieldSeparator
25     this.isFirstLineHeader = false
26 }
   
27 public AwkEngine(args, fieldSeparator, isFirstLineHeader) {
28     this.fileNameList = args
29     this.fieldSeparator = fieldSeparator
30     this.isFirstLineHeader = isFirstLineHeader
31 }
   
32 public void go() {
33     this.onBegin()
34     int recordNumber = 0
35     fileNameList.each { fileName ->
36         int fileRecordNumber = 0
37         new File(fileName).withReader { reader ->
38             def csvReader = new CSVReader(reader,
39                 this.fieldSeparator.charAt(0))
40             if (isFirstLineHeader) {
41                 def csvFieldNames = csvReader.readNext() as
42                     ArrayList<String>
43                 csvReader.each { fieldsByNumber ->
44                     def fieldsByName = csvFieldNames.
45                         withIndex().
46                         collectEntries { name, index ->
47                             [name, fieldsByNumber[index]]
48                         }
49                     this.onEachLine(fieldsByName,
50                             recordNumber, fileName,
51                             fileRecordNumber)
52                     recordNumber++
53                     fileRecordNumber++
54                 }
55             } else {
56                 csvReader.each { fieldsByNumber ->
57                     this.onEachLine(fieldsByNumber,
58                         recordNumber, fileName,
59                         fileRecordNumber)
60                     recordNumber++
61                     fileRecordNumber++
62                 }
63             }
64         }
65     }
66     this.onEnd()
67 }
68 }
```

While this looks like a fair bit of code, many of the lines are continuations of a split longer lines (for example, normally you would combine lines 38 and 39, lines 41 and 42, and so on). Let's look at this line by line.

Line 1 uses the `@Grab` annotation to fetch the OpenCSV library version 5.6 from [Maven Central][8]. No XML required.

In line 2, I import OpenCSV's `CSVReader` class.

In line 3, just as with Java, I declare a public utility class, `AwkEngine`.

Lines 11-13 define the Groovy Closure instances used by the script as hooks into this class. These are "public by default" as is the case with any Groovy class—but Groovy creates the fields as private and external references to these (using getters and setters provided by Groovy). I'll explain that further in the sample scripts below.

Lines 14-16 declare the private fields—the field separator, a flag to indicate whether the first line of a file is a header, and a list for the file name.

Lines 17-31 define three constructors. The first receives the command line arguments. The second receives the field separator character. The third receives the flag indicating whether the first line is a header or not.

Lines 31-67 define the engine itself, as the `go()` method.

Line 33 calls the `onBegin()` closure (equivalent to the awk `BEGIN {}` statement).

Line 34 initializes the `recordNumber` for the stream (equivalent to the awk `NR` variable) to 0 (note I am doing 0-origin here rather than the awk 1-origin).

Lines 35-65 use each `{}` to loop over the list of files to be processed.

Line 36 initializes the `fileRecordNumber` for the file (equivalent to the awk `FNR` variable) to 0 (0-origin, not 1-origin).

Lines 37-64 get a `Reader` instance for the file and process it.

Lines 38-39 get a `CSVReader` instance.

Line 40 checks to see whether the first line is being treated as a header.

If the first line is being treated as a header, then lines 41-42 get the list of field header names from the first record.

Lines 43-54 process the rest of the records.

Lines 44-48 copy the field values into the map of `name:value`.

Lines 49-51 call the onEachLine`()` closure (equivalent to what appears in an awk program between `BEGIN {}` and `END {}`, though no pattern can be attached to make the execution conditional), passing in the map of `name:value`, the stream record number, the file name and the file record number.

Lines 52-53 increment the stream record number and file record number.

Otherwise:

Lines 56-62 process the records.

Lines 57-59 call the `onEachLine()` closure, passing in the array of field values, the stream record number, the file name and the file record number.

Lines 60-61 increment the stream record number and file record number.

Line 66 calls the `onEnd()` closure (equivalent to the awk `END {}` ).

That's it for the framework. Now you can compile it:

```
$ groovyc AwkEngine.groovy
```

A couple of comments:

If an argument is passed in that is not a file, the code fails with a standard Groovy stack trace, which looks something like this:

```
Caught: java.io.FileNotFoundException: not-a-file (No such file or directory)
java.io.FileNotFoundException: not-a-file (No such file or directory)
at AwkEngine$_go_closure1.doCall(AwkEngine.groovy:46)
```

OpenCSV tends to return `String[]` values, which are not as convenient as `List` values in Groovy (for example there is no `each {}` defined for an array). Lines 41-42 convert the header field value array into a list, so perhaps `fieldsByNumber` in line 57 should also be converted into a list.

### Using the framework in scripts

Here's a very simple script using `AwkEngine` to examine a file like `/etc/group`, which is colon-delimited and has no header:

```
1 def ae = new AwkEngine(args, ‘:')
2 int lineCount = 0

3 ae.onBegin = {
4    println “in begin”
5 }

6 ae.onEachLine = { fields, recordNumber, fileName, fileRecordNumber ->
7    if (lineCount < 10)
8       println “fileName $fileName fields $fields”
9       lineCount++
10 }

11 ae.onEnd = {
12    println “in end”
13    println “$lineCount line(s) read”
14 }

15 ae.go()
```

Line 1 calls the two-argument constructor, passing in the argument list and the colon as delimiter.

Line 2 defines a script top-level variable, `lineCount`, used to record the count of lines read (note that Groovy closures don't require variables defined external to the closure to be final).

Lines 3-5 define the `onBegin()` closure, which just prints the string "in begin" on standard output.

Lines 6-10 define the `onEachLine()` closure, which prints the file name and the fields for the first 10 lines and in any case increments the line count.

Lines 11-14 define the `onEnd()` closure, which prints the string "in end" and the count of the number of lines read.

Line 15 runs the script using the `AwkEngine`.

Run this script as follows:

```
$ groovy Test1Awk.groovy /etc/group
in begin
fileName /etc/group fields [root, x, 0, ]
fileName /etc/group fields [daemon, x, 1, ]
fileName /etc/group fields [bin, x, 2, ]
fileName /etc/group fields [sys, x, 3, ]
fileName /etc/group fields [adm, x, 4, syslog,clh]
fileName /etc/group fields [tty, x, 5, ]
fileName /etc/group fields [disk, x, 6, ]
fileName /etc/group fields [lp, x, 7, ]
fileName /etc/group fields [mail, x, 8, ]
fileName /etc/group fields [news, x, 9, ]
in end
78 line(s) read
$
```

Of course the `.class` files created by compiling the framework class must be on the classpath for this to work. Naturally, you could use `jar` to package up those class files.

I really like Groovy's support for the delegation of behavior, which requires various shenanigans in other languages. For many years Java required anonymous classes and quite a bit of extra code. Lambdas have gone a long way to fixing this, but they still cannot refer to non-final variables outside their scope.

Here's another, more interesting script that is very reminiscent of my typical use of awk:

```
1 def ae = new AwkEngine(args, ‘;', true)
2 ae.onBegin = {
3    // nothing to do here
4 }

5 def regionCount = [:]
6    ae.onEachLine = { fields, recordNumber, fileName, fileRecordNumber ->
7    regionCount[fields.REGION] =
8    (regionCount.containsKey(fields.REGION) ?
9    regionCount[fields.REGION] : 0) +
10   (fields.PERSONAS as Integer)
11 }

12 ae.onEnd = {
13    regionCount.each { region, population ->
14    println “Region $region population $population”
15    }
16 }

17 ae.go()
```

Line 1 calls the three-argument constructor, recognizing that this is a "true CSV" file with the header being on the first line. Because it's a Spanish file, where the comma is used as the decimal "point", the standard delimiter is the semicolon.

Lines 2-4 define the `onBegin()` closure which in this case doesn't do anything.

Line 5 defines an (empty) `LinkedHashMap`, which you will fill with String keys and Integer values. The data file is from Chile's most recent census and you are calculating the number of people in each region of Chile in this script.

Lines 6-11 processes the lines in the file (there are 180,500 including the header)—note that in this case, because you are defining line 1 as the CSV column headers, the fields parameter is going to be an instance of `LinkedHashMap<String,String>`.

Lines 7-10 increment the `regionCount` map, using the value in the field REGION as the key and the value in the field PERSONAS as the value—note that, unlike awk, in Groovy you can't refer to a non-existent map entry on the right-hand side and expect a blank or zero value to materialize.

Lines 12- 16 print out population by region.

Line 17 runs the script on the `AwkEngine` instance.

Run this script as follows:

```
$ groovy Test2Awk.groovy ~/Downloads/Censo2017/ManzanaEntidad_CSV/Censo*csv
Region 1 population 330558
Region 2 population 607534
Region 3 population 286168
Region 4 population 757586
Region 5 population 1815902
Region 6 population 914555
Region 7 population 1044950
Region 8 population 1556805
Region 16 population 480609
Region 9 population 957224
Region 10 population 828708
Region 11 population 103158
Region 12 population 166533
Region 13 population 7112808
Region 14 population 384837
Region 15 population 226068
$
```

That's it. For those of you who love awk and yet would like a little more, I hope you enjoy this Groovy approach.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/awk-groovy

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_screen_windows_files.png
[2]: https://opensource.com/article/22/8/music-tagging-framework-groovy
[3]: https://opensource.com/downloads/awk-ebook
[4]: http://regex.info/blog/2006-09-15/247
[5]: http://opencsv.sourceforge.net/
[6]: https://groovy.apache.org/download.html
[7]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[8]: https://mvnrepository.com/artifact/com.opencsv/opencsv
