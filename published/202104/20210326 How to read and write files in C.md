[#]: subject: (How to read and write files in C++)
[#]: via: (https://opensource.com/article/21/3/ccc-input-output)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13263-1.html)

如何用 C++ 读写文件
======

> 如果你知道如何在 C++ 中使用输入输出（I/O）流，那么（原则上）你便能够处理任何类型的输入输出设备。

![](https://img.linux.net.cn/data/attachment/album/202104/02/224507a2fq6ofotf4ff4rf.jpg)

在 C++ 中，对文件的读写可以通过使用输入输出流与流运算符 `>>` 和 `<<` 来进行。当读写文件的时候，这些运算符被应用于代表硬盘驱动器上文件类的实例上。这种基于流的方法有个巨大的优势：从 C++ 的角度，无论你要读取或写入的内容是文件、数据库、控制台，亦或是你通过网络连接的另外一台电脑，这都无关紧要。因此，知道如何使用流运算符来写入文件能够被转用到其他领域。

### 输入输出流类

C++ 标准库提供了 [ios_base][2] 类。该类作为所有 I/O 流的基类，例如 [basic_ofstream][3] 和 [basic_ifstream][4]。本例将使用读/写字符的专用类型 `ifstream` 和 `ofstream`。

- `ofstream`：输出文件流，并且其能通过插入运算符 `<<` 来实现。
- `ifstream`：输入文件流，并且其能通过提取运算符 `>>` 来实现。

该两种类型都是在头文件 `<fstream>` 中所定义。

从 `ios_base` 继承的类在写入时可被视为数据接收器，在从其读取时可被视为数据源，与数据本身完全分离。这种面向对象的方法使 <ruby>[关注点分离][5]<rt>separation of concerns</rt></ruby> 和 <ruby>[依赖注入][6]<rt>dependency injection</rt></ruby> 等概念易于实现。

### 一个简单的例子

本例程是非常简单：实例化了一个 `ofstream` 来写入，和实例化一个 `ifstream` 来读取。

```
#include <iostream> // cout, cin, cerr etc...
#include <fstream> // ifstream, ofstream
#include <string>


int main()
{
    std::string sFilename = "MyFile.txt";    

    /******************************************
     *                                        *
     *                WRITING                 *
     *                                        *
     ******************************************/

    std::ofstream fileSink(sFilename); // Creates an output file stream

    if (!fileSink) {
        std::cerr << "Canot open " << sFilename << std::endl;
        exit(-1);
    }

    /* std::endl will automatically append the correct EOL */
    fileSink << "Hello Open Source World!" << std::endl;


    /******************************************
     *                                        *
     *                READING                 *
     *                                        *
     ******************************************/
   
    std::ifstream fileSource(sFilename); // Creates an input file stream

    if (!fileSource) {
        std::cerr << "Canot open " << sFilename << std::endl;
        exit(-1);
    }
    else {
        // Intermediate buffer
        std::string buffer;

        // By default, the >> operator reads word by workd (till whitespace)
        while (fileSource >> buffer)
        {
            std::cout << buffer << std::endl;
        }
    }

    exit(0);
}
```

该代码可以在 [GitHub][7] 上查看。当你编译并且执行它时，你应该能获得以下输出：

![Console screenshot][8]

这是个简化的、适合初学者的例子。如果你想去使用该代码在你自己的应用中，请注意以下几点：

  * 文件流在程序结束的时候自动关闭。如果你想继续执行，那么应该通过调用 `close()` 方法手动关闭。
  * 这些文件流类继承自 [basic_ios][10]（在多个层次上），并且重载了 `!` 运算符。这使你可以进行简单的检查是否可以访问该流。在 [cppreference.com][11] 上，你可以找到该检查何时会（或不会）成功的概述，并且可以进一步实现错误处理。
  * 默认情况下，`ifstream` 停在空白处并跳过它。要逐行读取直到到达 [EOF][13] ，请使用 `getline(...)` 方法。
  * 为了读写二进制文件，请将 `std::ios::binary` 标志传递给构造函数：这样可以防止 [EOL][13] 字符附加到每一行。

### 从系统角度进行写入

写入文件时，数据将写入系统的内存写入缓冲区中。当系统收到系统调用 [sync][14] 时，此缓冲区的内容将被写入硬盘。这也是你在不告知系统的情况下，不要卸下 U 盘的原因。通常，守护进程会定期调用 `sync`。为了安全起见，也可以手动调用 `sync()`：


```
#include <unistd.h> // needs to be included

sync();
```

### 总结

在 C++ 中读写文件并不那么复杂。更何况，如果你知道如何处理输入输出流，（原则上）那么你也知道如何处理任何类型的输入输出设备。对于各种输入输出设备的库能让你更容易地使用流运算符。这就是为什么知道输入输出流的流程会对你有所助益的原因。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/ccc-input-output

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY "Computer screen with files or windows open"
[2]: https://en.cppreference.com/w/cpp/io/ios_base
[3]: https://en.cppreference.com/w/cpp/io/basic_ofstream
[4]: https://en.cppreference.com/w/cpp/io/basic_ifstream
[5]: https://en.wikipedia.org/wiki/Separation_of_concerns
[6]: https://en.wikipedia.org/wiki/Dependency_injection
[7]: https://github.com/hANSIc99/cpp_input_output
[8]: https://opensource.com/sites/default/files/uploads/c_console_screenshot.png "Console screenshot"
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://en.cppreference.com/w/cpp/io/basic_ios
[11]: https://en.cppreference.com/w/cpp/io/basic_ios/operator!
[12]: https://en.wikipedia.org/wiki/End-of-file
[13]: https://en.wikipedia.org/wiki/Newline
[14]: https://en.wikipedia.org/wiki/Sync_%28Unix%29
