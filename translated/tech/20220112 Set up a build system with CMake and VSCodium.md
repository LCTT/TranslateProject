[#]: subject: "Set up a build system with CMake and VSCodium"
[#]: via: "https://opensource.com/article/22/1/devops-cmake"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 CMake 和 VSCodium 设置一个构建系统
======
提供一个适当的 CMake 配置文件来使其他人可以更容易地构建、使用和贡献你的工程。
![woman on laptop sitting at the window][1]

这篇文章是关于 C/C++ 开发系列的开发工具的一部分。如果你从一个功能强大的工具链开始构建你的工程，你将从一个更快和更安全的开发环境中受益。除此之外，它会使别人更容易地参与你的工程。在这篇文章中，我将准备一个基于 [CMake][2] 和 [VSCodium][3] 的 C/C++ 构建系统。像往常一样，相关的示例代码可以在 [GitHub][4] 上找到。

我已经测试了在本文中描述的步骤。这是一种适用于所有平台的解决方案。

### 为什么是 CMake ？

[CMake][5] 是一个构建系统生成器，为你的工程创建 Makefile 。乍一看简单的东西可能乍一看相当地复杂。在较高的层次上，你可以定义你的工程 (可执行文件，库) 的各个部分，编译选项 (C/C++ 标准，优化，架构)，依赖关系项 (头文件，库)，和文件级的工程结构。CMake 使用的这些信息可以在文件 `CMakeLists.txt` 中获取，它使用一种特殊的描述性语言编写。当 CMake 处理这个文件时，它将自动地侦测在你的系统上已安装的编译器，并创建一个用于启动它的 Makefile 文件。

此外，在 `CMakeLists.txt` 中描述的配置，能够被很多编辑器读取，像 QtCreator, VSCodium/VSCode, 或 Visual Studio 。

### 示例程序

我们的示例程序是一个简单的命令行工具：它获取一个整数来作为一个参数，输出一个从 1 到所提供输入值的范围内的随机排列的数字。


```


$ ./Producer 10
3 8 2 7 9 1 5 10 6 4 

```

在我们的可执行文件中的 `main()` 函数，如果没有提供一个值  (或者一个不能被处理的值) 的话，我们只处理输入的参数，并退出程序。

**producer.cpp**


```


int main(int argc, char** argv){

    if (argc != 2) {
        std::cerr << "Enter the number of elements as argument" << std::endl;
        return -1;
    }

    int range = 0;

    try{
        range = std::stoi(argv[1]);
    }catch (const std::invalid_argument&){
        std::cerr << "Error: Cannot parse \"" << argv[1] << "\" ";
        return -1;
    }

    catch (const std::out_of_range&) {
        std::cerr << "Error: " << argv[1] << " is out of range";
        return -1;
    }

    if (range <= 0) {
        std::cerr << "Error: Zero or negative number provided: " << argv[1];
        return -1;
    }

    std::stringstream data;
    std::cout << Generator::generate(data, range).rdbuf();
}

```

实际的工作是在 [Generator][6] 中完成的，它将被编译，并将作为一个静态库来链接到我们的`Producer` 可执行文件。 

**Generator.cpp**


```


std::stringstream &Generator::generate(std::stringstream &astream, const int range) {
    std::vector<int> data(range);
    std::iota(data.begin(), data.end(), 1);

    std::random_device rd;
    std::mt19937 g(rd());

    std::shuffle(data.begin(), data.end(), g);

    for (const auto n : data) {

        stream << std::to_string(n) << " ";
    }

    return stream;
}

```

函数 `generate` 引用一个 [std::stringstream][7] 和一个整数来作为一个参数。 以整数 `range` 的值 _n_ 为基础, 制作一个在 1 到 _n_ 的范围之中的整数向量，并随后排列。接下来排序的向量值转换成一个字符串，并推送到 `stringstream` 之中。该函数返回与作为参数传递的 `stringstream` 引用相同。

### CMakeLists.txt 的顶部层次

[CMakeLists.txt][8] 的顶部层次是我们工程的入口点。在子目录中有几个 `CMakeLists.txt` 文件 (例如，与工程所相关联的库或其它可执行文件)。我们先一步一步地读破 `CMakeLists.txt` 的顶部层次。

第一行告诉我们 CMake 的版本, CMake 需要处理的文件，工程名称，和其版本，以及意欲使用的 C++ 标准。


```


cmake_minimum_required(VERSION 3.14)

project(CPP_Testing_Sample VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

```

我们告诉 CMake 使用下面的代码行来查看子目录 `Generator` 。这个子目录包括构建 `Generator` 库的所有信息，并包含它自身的一个 `CMakeLists.txt` 。我们很快就会谈到这个问题。


```
`add_subdirectory(Generator)`
```

现在，我们将涉及一个绝对特别的功能: [CMake 模块][9] 。加载模块可以扩展 CMake 功能。在我们的工程中，我们将加载模块 [FetchContent][10] ，这能使我们能够在 CMake 运行时下载外部的资源，在我们的示例中是 [GoogleTest][11] 。


```


include(FetchContent)

FetchContent_Declare(
  googletest
  URL <https://github.com/google/googletest/archive/bb9216085fbbf193408653ced9e73c61e7766e80.zip>
)
FetchContent_MakeAvailable(googletest)

```

在接下来的部分中，我们将会做一些我们通常在一个普通的 Makefile 中会做的事: 具体指定哪个库来构建，它们相关的源文件文件，应该链接到的库，和编译器能够在哪些目录中查找头文件。


```


add_executable(Producer Producer.cpp)

target_link_libraries(Producer PUBLIC Generator)

target_include_directories(Producer PUBLIC "${PROJECT_BINARY_DIR}")

```

通过下面的语句，我们使 CMake 来在 build 文件夹中创建一个名称为 `compile_commands.json` 的文件。这个文件为工程的每个文件揭示编译器选项。在 VSCodium 中加载，这个文件告知 IntelliSense 功能在哪里查找头文件 (查看 [文档][12]) 。


```
`set(CMAKE_EXPORT_COMPILE_COMMANDS ON)`
```

最后的部分为我们的工程定义一些测试。工程使用先前加载的 GoogleTest 框架。单元测试的整个话题将会划归到另外一篇文章。


```


enable_testing()

add_executable(unit_test unit_test.cpp)

target_link_libraries(unit_test gtest_main)

include(GoogleTest)

gtest_discover_tests(unit_test)

```

### CMakeLists.txt 的库层次

现在，我们来看看包含同名库的子目录  `Generator` 中的 [CMakeLists.txt][13] 文件。这个 `CMakeLists.txt` 文件的内容更简短一些，除了单元测试相关的命令外，它仅包含 2 条语句。


```


add_library(Generator STATIC Generator.cpp Generator.h)

target_include_directories(Generator INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

```

我们使用 `add_library(...)` 来定义一个新的构建目标：静态的 `Generator` 库。我们使用语句 `target_include_directories(...)` 来把当前子目录添加到其它构建目标的头文件的搜索路径之中。我们也可以具体指定这个属性的范围为类型 `INTERFACE`:这意味着该属性仅影响链接到这个库的构建目标，而不是库本身。

### 开始使用 VSCodium

使用 `CMakeLists.txt` 文件中的可用信息，, IDEs like像 VSCodium 一样的 IDE 可用相应地配置构建系统。如果你还没有体验过 VSCodium 或 VS Code ，这个示例工程会是一个很好的起点。首先，转到它们的 [网站][3] ，然后针对你的系统下载最新的安装软件包。打开 VSCodium 并导航到 **Extensions** 标签页。

为了正确地构建，调试和测试工程，搜索下面的扩展并安装它们。

![Searching extensions][14]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

如果尚未完成，通过单击起始页的 **Clone Git Repository** 来复刻存储库。

![Clone Git repository][16]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

或者手动输入：


```
`git clone https://github.com/hANSIc99/cpp_testing_sample.git`
```

之后，通过输入 tag _devops_1_ 来签出每一个：


```
`git checkout tags/devops_1`
```

或者，通过单击 **main** 分支按钮 (红色框) ，并从下拉菜单 (黄色框) 中选择标签。

![Select devops_1 tag][17]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

在你打开 VSCodium 内部中的存储库的根文件夹后，`CMake Tools` 扩展会侦测 `CMakeLists.txt` 文件并立即扫描适合你的系统的编译器。你现在可以单击屏幕的底部的 **Build** 按钮 (红色框) 来开始构建过程。你也可以通过单击底部区域的按钮 (黄色框) 标记来更改编译器，它显示当前活动的编译器。

![Build compiler][18]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

为开始调试 `Producer` 可执行文件，单击调试器符号 (黄色框) 并从下拉菜单中选择 **Debug Producer** (绿色框)。

![Starting the debugger][19]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

如上所述，`Producer` 可执行文件要求元素的数字作为一个命令行的参数。命令行参数可以在 `.vscode/launch.json.` 中具体指定。

![Command-line arguments][20]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

明白了吗，你现在能够构建和调试工程了。

### 结束语

归功于 CMake ，不管你正在运行哪种操作系统，上述步骤应该都能工作。特别是使用与 CMake 相关的扩展，VSCodium 变成看一个强大的 IDE 。我没有提及 VSCodium 的 Git 集成，是因为你已经能够在网络上查找很多的资源。我希望你可以看到：提供一个适当的 CMake 配置文件可以使其他人更容易地构建，使用和贡献于你的工程。在未来的一篇文字中，我将看看单元测试和 CMake 的测试实用程序 `ctest` 。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/devops-cmake

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://cmake.org/
[3]: https://vscodium.com/
[4]: https://github.com/hANSIc99/cpp_testing_sample
[5]: https://opensource.com/article/21/5/cmake
[6]: https://github.com/hANSIc99/cpp_testing_sample/blob/main/Generator/Generator.cpp
[7]: https://en.cppreference.com/w/cpp/io/basic_stringstream
[8]: https://github.com/hANSIc99/cpp_testing_sample/blob/main/CMakeLists.txt
[9]: https://cmake.org/cmake/help/latest/manual/cmake-modules.7.html
[10]: https://cmake.org/cmake/help/latest/module/FetchContent.html
[11]: https://github.com/google/googletest
[12]: https://code.visualstudio.com/docs/cpp/c-cpp-properties-schema-reference
[13]: https://github.com/hANSIc99/cpp_testing_sample/blob/main/Generator/CMakeLists.txt
[14]: https://opensource.com/sites/default/files/uploads/cpp_unit_test_vscodium_extensions.png (Searching extensions)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/sites/default/files/uploads/cpp_unit_test_vscodium_git_clone.png (Clone Git repository)
[17]: https://opensource.com/sites/default/files/uploads/cpp_unit_test_vscodium_select_tag.png (Select devops_1 tag)
[18]: https://opensource.com/sites/default/files/uploads/cpp_unit_test_vscodium_compiler_2.png (Build compiler)
[19]: https://opensource.com/sites/default/files/uploads/cpp_unit_test_vscodium_start_debugging.png (Starting the debugger)
[20]: https://opensource.com/sites/default/files/uploads/cpp_unit_test_vscodium_arguments.png (Command-line arguments)
