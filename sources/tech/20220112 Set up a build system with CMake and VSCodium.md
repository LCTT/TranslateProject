[#]: subject: "Set up a build system with CMake and VSCodium"
[#]: via: "https://opensource.com/article/22/1/devops-cmake"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "robsesan"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Set up a build system with CMake and VSCodium
======
Providing a proper CMake configuration makes it much easier for others
to build, use and contribute to your project.
![woman on laptop sitting at the window][1]

This article is part of a series about open source DevOps tools for C/C++ development. If you build up your project from the beginning on a powerful toolchain, you will benefit from a faster and safer development. Aside from that, it will be easier for you to get others involved in your project. In this article, I will prepare a C/C++ build system based on [CMake][2] and [VSCodium][3]. As usual, the related example code is available on [GitHub][4].

I've tested the steps described in this article. This is a solution for all platforms.

### Why CMake?

[CMake][5] is a build system generator that creates the Makefile for your project. What sounds simple at first glance can be pretty complex at second glance. At a high altitude, you define the individual parts of your project (executables, libraries), compiling options (C/C++ standard, optimizations, architecture), the dependencies (header, libraries), and the project structure on file level. This information gets made available to CMake in the file `CMakeLists.txt` using a special description language. When CMake processes this file, it automatically detects the installed compilers on your systems and creates a working Makefile.

In addition, the configuration described in the `CMakeLists.txt` can be read by many editors like QtCreator, VSCodium/VSCode, or Visual Studio.

### Sample program

Our sample program is a simple command-line tool: It takes an integer as an argument and outputs numbers randomly shuffled in the range from one to the provided input value.


```


$ ./Producer 10
3 8 2 7 9 1 5 10 6 4 

```

In the `main() `function of our executable, we just process the input parameter and exit the program if no one value (or a value that can't be processed) is provided.

**producer.cpp**


```


int main(int argc, char** argv){

    if (argc != 2) {
        std::cerr &lt;&lt; "Enter the number of elements as argument" &lt;&lt; std::endl;
        return -1;
    }

    int range = 0;
    
    try{
        range = std::stoi(argv[1]);
    }catch (const std::invalid_argument&amp;){
        std::cerr &lt;&lt; "Error: Cannot parse \"" &lt;&lt; argv[1] &lt;&lt; "\" ";
        return -1;
    }

    catch (const std::out_of_range&amp;) {
        std::cerr &lt;&lt; "Error: " &lt;&lt; argv[1] &lt;&lt; " is out of range";
        return -1;
    }

    if (range &lt;= 0) {
        std::cerr &lt;&lt; "Error: Zero or negative number provided: " &lt;&lt; argv[1];
        return -1;
    }

    std::stringstream data;
    std::cout &lt;&lt; Generator::generate(data, range).rdbuf();
}

```

The actual work gets done in the [Generator][6], which is compiled and linked as a static library to our `Producer` executable. 

**Generator.cpp**


```


std::stringstream &amp;Generator::generate(std::stringstream &amp;stream, const int range) {
    std::vector&lt;int&gt; data(range);
    std::iota(data.begin(), data.end(), 1);

    std::random_device rd;
    std::mt19937 g(rd());

    std::shuffle(data.begin(), data.end(), g);

    for (const auto n : data) {

        stream &lt;&lt; std::to_string(n) &lt;&lt; " ";
    }

    return stream;
}

```

The function `generate` takes a reference to a [std::stringstream][7] and an integer as an argument. Based on the value _n_ of the integer `range`, a vector of integers in the range of 1 to _n_ is made and afterward shuffled. The values in the shuffled vector are then converted into a string and pushed into the `stringstream`. The function returns the same `stringstream` reference as passed as argument.

### Top-level CMakeLists.txt

The top-level [CMakeLists.txt][8] is the entry point of our project. There can be several `CMakeLists.txt `files in subdirectories (for example, libraries or other executables associated with the project). We start by going step by step over the top-level `CMakeLists.txt`.

The first lines tell us about the version of CMake, which is required to process the file, the project name, and its versions, as well as the intended C++ standard.


```


cmake_minimum_required(VERSION 3.14)

project(CPP_Testing_Sample VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

```

We tell CMake to look into the subdirectory `Generator` with the following line. This subdirectory includes all information to build the `Generator` library and contains a `CMakeLists.txt` for its own. We'll get to that shortly.


```
`add_subdirectory(Generator)`
```

Now we come to an absolute special feature: [CMake Modules][9]. Loading modules can extend CMake functionality. In our project, we load the module [FetchContent][10], which enables us to download external resources, in our case [GoogleTest][11] when CMake is run.


```


include(FetchContent)

FetchContent_Declare(
  googletest
  URL <https://github.com/google/googletest/archive/bb9216085fbbf193408653ced9e73c61e7766e80.zip>
)
FetchContent_MakeAvailable(googletest)

```

In the next part, we do what we would usually do in an ordinary Makefile: Specify which binary to build, their related source files, libraries which should be linked to, and the directories in which the compiler can find the header files.


```


add_executable(Producer Producer.cpp)

target_link_libraries(Producer PUBLIC Generator)

target_include_directories(Producer PUBLIC "${PROJECT_BINARY_DIR}")

```

With the following statement, we get CMake to create a file in the build folder called `compile_commands.json`. This file exposes the compile options for every single file of the project. Loaded in VSCodium, this file tells the IntelliSense feature where to find the header files (see [documentation][12]).


```
`set(CMAKE_EXPORT_COMPILE_COMMANDS ON)`
```

The last part defines the tests for our project. The project uses the previously loaded  GoogleTest framework. The whole topic of unit tests will be part of a separate article.


```


enable_testing()

add_executable(unit_test unit_test.cpp)

target_link_libraries(unit_test gtest_main)

include(GoogleTest)

gtest_discover_tests(unit_test)

```

### Library level CMakeLists.txt

Now we look at the [CMakeLists.txt][13] file in the subdirectory `Generator` containing the eponymous library. This `CMakeLists.txt` is much shorter, and besides the unit test-related commands, it contains only two statements.


```


add_library(Generator STATIC Generator.cpp Generator.h)

target_include_directories(Generator INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

```

With `add_library(...)` we define a new build target: The static `Generator` library. With the statement `target_include_directories(...)`, we add the current subdirectory to the search path for header files for other build targets. We also specify the scope of this property to be of type `INTERFACE`: This means that the property will only affect build targets that link against this library, not the library itself.

### Get started with VSCodium

With the information available in the `CMakeLists.txt`, IDEs like VSCodium can configure the build system accordingly. If you haven't already experience with VSCodium or VS Code, this example project is a good starting point. First, go to their [website][3] and download the latest installation package for your system. Open VSCodium and navigate to the **Extensions** tab.

To properly build, debug and test the project, search for the following extensions and install them.

![Searching extensions][14]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

If not already done, clone the repository by clicking on **Clone Git Repository** on the start page.

![Clone Git repository][16]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

Or manually by typing:


```
`git clone https://github.com/hANSIc99/cpp_testing_sample.git`
```

Afterward, check out the tag _devops_1_ either by typing:


```
`git checkout tags/devops_1`
```

Or by clicking on the **main** branch button (red box) and selecting the tag from the drop-down menu (yellow box).

![Select devops_1 tag][17]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

Once you open the repository's root folder inside VSCodium, the `CMake Tools` extensions detect the `CMakeLists.txt` file and immediately scan your system for suitable compilers. You can now click on the **Build** button at the bottom of the screen (red box) to start the build process. You can also change the compiler by clicking on the area at the bottom (yellow box) mark, which shows the currently active compiler.

![Build compiler][18]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

To start debugging the `Producer` executable, click on the debugger symbol (yellow box) and choose **Debug Producer** (green box) from the drop-down menu.

![Starting the debugger][19]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

As previously mentioned, the `Producer` executable expects the number of elements as a command-line argument. The command-line argument can be specified in the file `.vscode/launch.json.`

![Command-line arguments][20]

(Stephan Avenwedde, [CC BY-SA 4.0][15])

Alright, you are now able to build and debug the project.

### Conclusion

Thanks to CMake, the above steps should work no matter what OS you're running. Especially with the CMake-related extensions, VSCodium becomes a powerful IDE. I didn't mention the Git integration of VSCodium because you can already find many resources on the web. I hope you see that providing a proper CMake configuration makes it much easier for others to build, use and contribute to your project. In a future article, I will look at unit tests and CMake's testing utility `ctest`.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/devops-cmake

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
