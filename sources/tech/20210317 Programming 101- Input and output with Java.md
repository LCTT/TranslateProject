[#]: subject: (Programming 101: Input and output with Java)
[#]: via: (https://opensource.com/article/21/3/io-java)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Programming 101: Input and output with Java
======
Learn how Java handles reading and writing data.
![Coffee beans and a cup of coffee][1]

When you write a program, your application may need to read from and write to files stored on the user's computer. This is common in situations when you want to load or store configuration options, you need to create log files, or your user wants to save work for later. Every language handles this task a little differently. This article demonstrates how to handle data files with Java.

### Installing Java

Regardless of your computer's platform, you can install Java from [AdoptOpenJDK][2]. This site offers safe and open source builds of Java. On Linux, you may also find AdoptOpenJDK builds in your software repository.

I recommend using the latest long-term support (LTS) release. The latest non-LTS release is best for developers looking to try the latest Java features, but it likely outpaces what most users have installed—either by default on their system or installed previously for some other Java application. Using the LTS release ensures you're up-to-date with what most users have installed.

Once you have Java installed, open your favorite text editor and get ready to code. You might also want to investigate an [integrated development environment for Java][3]. BlueJ is ideal for new programmers, while Eclipse and Netbeans are nice for intermediate and experienced coders.

### Reading a file with Java

Java uses the `File` library to load files.

This example creates a class called `Ingest` to read data from a file. When you open a file in Java, you create a `Scanner` object, which scans the file you provide, line by line. In fact, a `Scanner` is the same concept as a cursor in a text editor, and you can control that "cursor" for reading and writing with `Scanner` methods like `nextLine`:


```
import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Ingest {
  public static void main([String][4][] args) {
   
      try {
          [File][5] myFile = new [File][5]("example.txt");
          Scanner myScanner = new Scanner(myFile);
          while (myScanner.hasNextLine()) {
              [String][4] line = myScanner.nextLine();
              [System][6].out.println(line);
          }
          myScanner.close();
      } catch ([FileNotFoundException][7] ex) {
          ex.printStackTrace();  
      } //try
    } //main
} //class
```

This code creates the variable `myfile` under the assumption that a file named `example.txt` exists. If that file does not exist, Java "throws an exception" (this means it found an error in what you attempted to do and says so), which is "caught" by the very specific `FileNotFoundException` library. The fact that there's a library specific to this exact error betrays how common this error is.

Next, it creates a `Scanner` and loads the file into it. I call it `myScanner` to differentiate it from its generic class template. A `while` loop sends `myScanner` over the file, line by line, for as long as there _is_ a next line. That's what the `hasNextLine` method does: it detects whether there's any data after the "cursor." You can simulate this by opening a file in a text editor: Your cursor starts at the very beginning of the file, and you can use the keyboard to scan through the file with the cursor until you run out of lines.

The `while` loop creates a variable `line` and assigns it the data of the current line. Then it prints the contents of `line` just to provide feedback. A more useful program would probably parse each line to extract whatever important data it contains.

At the end of the process, the `myScanner` object closes.

### Running the code

Save your code as `Ingest.java` (it's a Java convention to give classes an initial capital letter and name the file to match). If you try to run this simple application, you will probably receive an error because there is no `example.txt` for the application to load yet:


```
$ java ./Ingest.java
java.io.[FileNotFoundException][7]:
example.txt (No such file or directory)
```

What a perfect opportunity to write a Java application that writes data to a file!

### Writing data to a file with Java

Whether you're storing data that your user creates with your application or just metadata about what a user did in an application (for instance, game saves or recent songs played), there are lots of good reasons to store data for later use. In Java, this is achieved through the `FileWriter` library, this time by opening a file, writing data into it, and then closing the file:


```
import java.io.FileWriter;
import java.io.IOException;

public class Exgest {
  public static void main([String][4][] args) {
    try {
        [FileWriter][8] myFileWriter = new [FileWriter][8]("example.txt", true);
        myFileWriter.write("Hello world\n");
        myFileWriter.close();
    } catch ([IOException][9] ex) {
        [System][6].out.println(ex);
    } // try
  } // main
}
```

The logic and flow of this class are similar to reading a file. Instead of a `Scanner`, it creates a `FileWriter` object with the name of a file. The `true` flag at the end of the `FileWriter` statement tells `FileWriter` to _append_ text to the end of the file. To overwrite a file's contents, remove the `true`:


```
`FileWriter myFileWriter = new FileWriter("example.txt", true);`
```

Because I'm writing plain text into a file, I added my own newline character (`\n`) at the end of the data (`Hello world`) written into the file.

### Trying the code

Save this code as `Exgest.java`, following the Java convention of naming the file to match the class name.

Now that you have the means to create and read data with Java, you can try your new applications, in reverse order:


```
$ java ./Exgest.java
$ java ./Ingest.java
Hello world
$
```

Because it appends data to the end, you can repeat your application to write data as many times as you want to add more data to your file:


```
$ java ./Exgest.java
$ java ./Exgest.java
$ java ./Exgest.java
$ java ./Ingest.java
Hello world
Hello world
Hello world
$
```

### Java and data

You're don't write raw text into a file very often; in the real world, you probably use an additional library to write a specific format instead. For instance, you might use an XML library to write complex data, an INI or YAML library to write configuration files, or any number of specialized libraries to write binary formats like images or audio.

For full information, refer to the [OpenJDK documentation][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/io-java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://adoptopenjdk.net
[3]: https://opensource.com/article/20/7/ide-java
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+file
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filenotfoundexception
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filewriter
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+ioexception
[10]: https://access.redhat.com/documentation/en-us/openjdk/11/
