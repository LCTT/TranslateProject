[#]: subject: (How different programming languages read and write data)
[#]: via: (https://opensource.com/article/21/7/programming-read-write)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How different programming languages read and write data
======
Every programming language has a unique way of accomplishing a task;
that's why there are so many languages to choose from.
![Code going into a computer.][1]

In his article _[How different programming languages do the same thing][2]_, Jim Hall demonstrates how 13 different languages accomplish the same exact task with different syntax. The lesson is that programming languages tend to have many similarities, and once you know one programming language, you can learn another by figuring its syntax and structure.

In the same spirit, Jim's article compares how different programming languages read and write data. Whether that data comes from a configuration file or from a file a user creates, processing data on a storage device is a common task for coders. It's not practical to cover all programming languages in this way, but a recent Opensource.com series provides insight into different approaches taken by these coding languages:

  * [C][3]
  * [C++][4]
  * [Java][5]
  * [Groovy][6]
  * [Lua][7]
  * [Bash][8]
  * [Python][9]



### Reading and writing data

The process of reading and writing data with a computer is similar to how you read and write data in real life. To access data in a book, you first open it, then you read words or you write new words into the book, and then you close the book.

When your code needs to read data from a file, you provide your code with a file location, and then the computer brings that data into its RAM and parses it from there. Similarly, when your code needs to write data to a file, the computer places new data into the system's in-memory write buffer and synchronizes it to the file on the storage device.

Here's some pseudo-code for these operations:

  1. Load a file in memory.
  2. Read the file's contents, or write data to the file.
  3. Close the file.



### Reading data from a file

You can see three trends in how the languages in the Opensource.com series read files.

#### C

In C, opening a file can involve retrieving a single character (up to the `EOF` designator, signaling the end of the file) or a block of data, depending on your requirements and approach. It can feel like a mostly manual process, depending on your goal, but the general process is exactly what the other languages mimic.


```
FILE *infile;
int ch;

infile = [fopen][10](argv[1], "r");
 
do {
  ch = [fgetc][11](infile);
  if (ch != EOF) {
    [printf][12]("%c", ch);
  }
 } while (ch != EOF);

[fclose][13](infile);
```

You can also choose to load some portion of a file into the system buffer and then work out of the buffer.


```
FILE *infile;
char buffer[300];
 
infile = [fopen][10](argv[1], "r");

while (![feof][14](infile)) {
  size_t buffer_length;
  buffer_length = [fread][15](buffer, sizeof(char), 300, infile);
}

[printf][12]("%s", buffer);
[fclose][13](infile);
```

#### C++

C++ simplifies a few steps, allowing you to parse data as strings.


```
std::string sFilename = "example.txt";

std::ifstream fileSource(sFilename);
std::string buffer;

while (fileSource &gt;&gt; buffer) {
  std::cout &lt;&lt; buffer &lt;&lt; std::endl;
}
```

#### Java

Java and Groovy are similar to C++. They use a class called `Scanner` to set up a data object or stream containing the contents of the file of your choice. You can "scan" through the file by tokens (byte, line, integer, and many others).


```
[File][16] myFile = new [File][16]("example.txt");

Scanner myScanner = new Scanner(myFile);
  while (myScanner.hasNextLine()) {
    [String][17] line = myScanner.nextLine();
    [System][18].out.println(line);
  }

myScanner.close();
```

#### Groovy


```
def myFile = new [File][16]('example.txt')

def myScanner = new Scanner(myFile)
  while (myScanner.hasNextLine()) {
    def line = myScanner.nextLine()
    println(line)
  }

myScanner.close()
```

#### Lua

Lua and Python abstract the process further. You don't have to consciously create a data stream; you just assign a variable to the results of an `open` function and then parse the contents of the variable. It's quick, minimal, and easy.


```
myFile = io.open('example.txt', 'r')

lines = myFile:read("*all")
print(lines)

myFile:close()
```

#### Python


```
f = open('example.tmp', 'r')

for line in f:
    print(line)

f.close()
```

### Writing data to a file

In terms of code, writing is the inverse of reading. As such, the process for writing data to a file is basically the same as reading data from a file, except using different functions.

#### C

In C, you can write a character to a file with the `fputc` function.


```
`fputc(ch, outfile);`
```

Alternately, you can write data to the buffer with `fwrite`.


```
`fwrite(buffer, sizeof(char), buffer_length, outfile);`
```

#### C++

Because C++ uses the `ifstream` library to open a buffer for data, you can write data to the buffer, as with C (except with C++ libraries).


```
`std::cout << buffer << std::endl;`
```

#### Java

In Java, you can use the `FileWriter` class to create a data object that you can write data to. It works a lot like the `Scanner` class, except going the other way.


```
[FileWriter][19] myFileWriter = new [FileWriter][19]("example.txt", true);
myFileWriter.write("Hello world\n");
myFileWriter.close();
```

#### Groovy

Similarly, Groovy uses `FileWriter` but with a slightly "groovier" syntax.


```
new [FileWriter][19]("example.txt", true).with {
  write("Hello world\n")
  flush()
}
```

#### Lua

Lua and Python are similar, both using functions called `open` to load a file, `write` to put data into it, and `close` to close the file.


```
myFile = io.open('example.txt', 'a')
io.output(myFile)
io.write("hello world\n")
io.close(myFile)
```

#### Python


```
myFile = open('example.txt', 'w')
myFile.write('hello world')
myFile.close()
```

### File modes

Many languages specify a "mode" when opening files. Modes vary, but this is common notation:

  * **w** to write
  * **r** to read
  * **r+** to read and write
  * **a** to append only



Some languages, such as Java and Groovy, let you determine the mode based on which class you use to load the file.

Whichever way your programming language determines a file's mode, it's up to you to ensure that you're _appending_ data—unless you intend to overwrite a file with new data. Programming languages don't have built-in prompts to warn you against data loss, the way file choosers do.

### New language and old tricks

Every programming language has a unique way of accomplishing a task; that's why there are so many languages to choose from. You can and should choose the language that works best for you. But once you understand the basic constructs of programming, you can also feel free to try out different languages, without fear of not knowing how to accomplish basic tasks. More often than not, the pathways to a goal are similar, so they're easy to learn as long as you keep the basic concepts in mind.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/programming-read-write

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: https://opensource.com/article/21/4/compare-programming-languages
[3]: https://opensource.com/article/21/3/file-io-c
[4]: https://opensource.com/article/21/3/ccc-input-output
[5]: https://opensource.com/article/21/3/io-java
[6]: https://opensource.com/article/21/4/groovy-io
[7]: https://opensource.com/article/21/3/lua-files
[8]: https://opensource.com/article/21/3/input-output-bash
[9]: https://opensource.com/article/21/6/reading-and-writing-files-python
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[13]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[14]: http://www.opengroup.org/onlinepubs/009695399/functions/feof.html
[15]: http://www.opengroup.org/onlinepubs/009695399/functions/fread.html
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+file
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filewriter
