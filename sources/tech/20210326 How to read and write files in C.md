[#]: subject: (How to read and write files in C++)
[#]: via: (https://opensource.com/article/21/3/ccc-input-output)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to read and write files in C++
======
If you know how to use I/O streams in C++, you can (in principle) handle
any kind of I/O device.
![Computer screen with files or windows open][1]

In C++, reading and writing to files can be done by using I/O streams in conjunction with the stream operators `>>` and `<<`. When reading or writing to files, those operators are applied to an instance of a class representing a file on the hard drive. This stream-based approach has a huge advantage: From a C ++ perspective, it doesn't matter what you are reading or writing to, whether it's a file, a database, the console, or another PC you are connected to over the network. Therefore, knowing how to write files using stream operators can be transferred to other areas.

### I/O stream classes

The C++ standard library provides the class [ios_base][2]. This class acts as the base class for all I/O stream-compatible classes, such as [basic_ofstream][3] and [basic_ifstream][4]. This example will use the specialized types for reading/writing characters, `ifstream` and `ofstream`.

  * `ofstream` means _output file stream_, and it can be accessed with the insertion operator, `<<`.
  * `ifstream` means _input file stream_, and it can be accessed with the extraction operator, `>>`.



Both types are defined inside the header `<fstream>`.

A class that inherits from `ios_base` can be thought of as a data sink when writing to it or as a data source when reading from it, completely detached from the data itself. This object-oriented approach makes concepts such as [separation of concerns][5] and [dependency injection][6] easy to implement.

### A simple example

This example program is quite simple: It creates an `ofstream`, writes to it, creates an `ifstream`, and reads from it:


```
#include &lt;iostream&gt; // cout, cin, cerr etc...
#include &lt;fstream&gt; // ifstream, ofstream
#include &lt;string&gt;

int main()
{
    std::string sFilename = "MyFile.txt";    

    /******************************************
     *                                        *
     *                WRITING                 *
     *                                        *
     ******************************************/

    std::ofstream fileSink(sFilename); // Creates an output file stream

    if (!fileSink) {
        std::cerr &lt;&lt; "Canot open " &lt;&lt; sFilename &lt;&lt; std::endl;
        exit(-1);
    }

    /* std::endl will automatically append the correct EOL */
    fileSink &lt;&lt; "Hello Open Source World!" &lt;&lt; std::endl;

    /******************************************
     *                                        *
     *                READING                 *
     *                                        *
     ******************************************/
   
    std::ifstream fileSource(sFilename); // Creates an input file stream

    if (!fileSource) {
        std::cerr &lt;&lt; "Canot open " &lt;&lt; sFilename &lt;&lt; std::endl;
        exit(-1);
    }
    else {
        // Intermediate buffer
        std::string buffer;

        // By default, the &gt;&gt; operator reads word by workd (till whitespace)
        while (fileSource &gt;&gt; buffer)
        {
            std::cout &lt;&lt; buffer &lt;&lt; std::endl;
        }
    }

    exit(0);
}
```

This code is available on [GitHub][7]. When you compile and execute it, you should get the following output:

![Console screenshot][8]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

This is a simplified, beginner-friendly example. If you want to use this code in your own application, please note the following:

  * The file streams are automatically closed at the end of the program. If you want to proceed with the execution, you should close them manually by calling the `close()` method.
  * These file stream classes inherit (over several levels) from [basic_ios][10], which overloads the `!` operator. This lets you implement a simple check if you can access the stream. On [cppreference.com][11], you can find an overview of when this check will (and won't) succeed, and you can implement further error handling.
  * By default, `ifstream` stops at white space and skips it. To read line by line until you reach [EOF][12], use the `getline(...)`-method.
  * For reading and writing binary files, pass the `std::ios::binary` flag to the constructor: This prevents [EOL][13] characters from being appended to each line.



### Writing from the systems perspective

When writing files, the data is written to the system's in-memory write buffer. When the system receives the system call [sync][14], this buffer's contents are written to the hard drive. This mechanism is also the reason you shouldn't remove a USB stick without telling the system. Usually, _sync_ is called on a regular basis by a daemon. If you really want to be on the safe side, you can also call _sync_ manually:


```
#include &lt;unistd.h&gt; // needs to be included

sync();
```

### Summary

Reading and writing to files in C++ is not that complicated. Moreover, if you know how to deal with I/O streams, you also know (in principle) how to deal with any kind of I/O device. Libraries for various kinds of I/O devices let you use stream operators for easy access. This is why it is beneficial to know how I/O steams work.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/ccc-input-output

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://en.cppreference.com/w/cpp/io/ios_base
[3]: https://en.cppreference.com/w/cpp/io/basic_ofstream
[4]: https://en.cppreference.com/w/cpp/io/basic_ifstream
[5]: https://en.wikipedia.org/wiki/Separation_of_concerns
[6]: https://en.wikipedia.org/wiki/Dependency_injection
[7]: https://github.com/hANSIc99/cpp_input_output
[8]: https://opensource.com/sites/default/files/uploads/c_console_screenshot.png (Console screenshot)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://en.cppreference.com/w/cpp/io/basic_ios
[11]: https://en.cppreference.com/w/cpp/io/basic_ios/operator!
[12]: https://en.wikipedia.org/wiki/End-of-file
[13]: https://en.wikipedia.org/wiki/Newline
[14]: https://en.wikipedia.org/wiki/Sync_%28Unix%29
