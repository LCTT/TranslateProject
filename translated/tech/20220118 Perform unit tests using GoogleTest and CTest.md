[#]: subject: "Perform unit tests using GoogleTest and CTest"
[#]: via: "https://opensource.com/article/22/1/unit-testing-googletest-ctest"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 GoogleTest 和 CTest 进行单元测试
======
进行单元测试可以提高代码质量，并且它不会打断你的工作流。
![Team checklist and to dos][1]


本文是 [使用 CMake 和 VSCodium 搭建构建系统][2] 的后续文章。

在上一篇文章中我介绍了基于 [VSCodium][3] 和 [CMake][4] 配置构建系统。本文我将介绍如何通过 [GoogleTest][5] 和 [CTest][6] 将单元测试集成到这个构建系统中。

首先克隆 [这个仓库][7]，用 VSCodium 打开，切换到 `devops_2` 标签。你可以通过点击 `main` 分支（红框处），然后选择 `devops_2` 标签（黄框处）来进行切换：

![VSCodium tag][8]

Stephan Avenwedde (CC BY-SA 4.0)

或者你可以通过命令行来切换：


```
`$ git checkout tags/devops_2`
```

### GoogleTest

GoogleTest 是一个平台无关的开源 C++ 测试框架。单元测试是用来验证单个逻辑单元的行为的。尽管 GoogleTest 并不是专门用于单元测试的，我将用它对 `Generator` 库进行单元测试。

在 GoogleTest 中，测试用例是通过断言宏来定义的。断言可能产生以下结果：

  * _成功_: 测试通过。
  * _非致命失败_: 测试失败，但测试继续。
  * _致命失败_: 测试失败，且测试终止。


致命断言和非致命断言通过不同的宏来区分：

  * `ASSERT_*`： 致命断言，失败时终止。
  * `EXPECT_*`： 非致命断言，失败时不终止。


谷歌推荐使用 `EXPECT_*` 宏，因为当测试中包含多个的断言时，它允许继续执行。断言有两个参数：第一个参数是测试分组的名称，第二个参数是测试自己的名称。`Generator` 只定义了 `generate(...)` 函数，所以本文中所有的测试都属于同一个测试组：`GeneratorTest`。

针对 `generate(...)` 函数的测试可以从 [GeneratorTest.cpp][9] 中找到。

#### 引用一致性检查

[generate(...)][10] 函数有一个 [std::stringstream][11] 的引用作为输入参数，并且它也将这个引用作为返回值。第一个测试就是检查输入的引用和返回的引用是否一致。


```


TEST(GeneratorTest, ReferenceCheck){
    const int NumberOfElements = 10;
    std::stringstream buffer;
    EXPECT_EQ(
        std::addressof(buffer),
        std::addressof(Generator::generate(buffer, NumberOfElements))
    );
}

```

在这个测试中我使用 [std::addressof][12] 来获取对象的地址，并用 `EXPECT_EQ` 来比较输入对象和返回对象是否是同一个。

#### 检查元素个数 

本测试检查作为输入的 `std::stringstream` 引用中的元素个数与输入参数中指定的个数是否相同。


```


TEST(GeneratorTest, NumberOfElements){
    const int NumberOfElements = 50;
    int nCalcNoElements = 0;

    std::stringstream buffer;

    Generator::generate(buffer, NumberOfElements);
    std::string s_no;

    while(std::getline(buffer, s_no, ' ')) {
        nCalcNoElements++;
    }

    EXPECT_EQ(nCalcNoElements, NumberOfElements);
}

```

#### 乱序重排

本测试检查随机化引擎是否工作正常。如果连续调用两次 `generate` 函数，应该得到的是两个不同的结果。


```


TEST(GeneratorTest, Shuffle){

    const int NumberOfElements = 50;

    std::stringstream buffer_A;
    std::stringstream buffer_B;

    Generator::generate(buffer_A, NumberOfElements);
    Generator::generate(buffer_B, NumberOfElements);

    EXPECT_NE(buffer_A.str(), buffer_B.str());
}

```

#### 求和校验

与前面的测试相比，这是一个大体量的测试。它检查 1 到 n 的数值序列的和与乱序重排后的序列的和是否相等。 `generate(...)` 函数应该生成一个 1 到 n 的乱序的序列，这个序列的和应当是不变的。



```


TEST(GeneratorTest, CheckSum){

    const int NumberOfElements = 50;
    int nChecksum_in = 0;
    int nChecksum_out = 0;

    std::vector<int> vNumbersRef(NumberOfElements); // Input vector
    std::iota(vNumbersRef.begin(), vNumbersRef.end(), 1); // Populate vector

    // Calculate reference checksum
    for(const int n : vNumbersRef){
        nChecksum_in += n;
    }

    std::stringstream buffer;
    Generator::generate(buffer, NumberOfElements);

    std::vector<int> vNumbersGen; // Output vector
    std::string s_no;

    // Read the buffer back back to the output vector
    while(std::getline(buffer, s_no, ' ')) {
        vNumbersGen.push_back(std::stoi(s_no));
    }

    // Calculate output checksum
    for(const int n : vNumbersGen){
        nChecksum_out += n;
    }

    EXPECT_EQ(nChecksum_in, nChecksum_out);
}

```

你可以像对一般 C++ 程序一样调试这些测试。

### CTest

除了嵌入到代码中的测试之外，[CTest][6] 提供了可执行程序的测试方式。简而言之就是通过给可执行程序传入特定的参数，然后用 [正则表达式][13] 对它的输出进行匹配检查。通过这种方式可以很容易检查程序对于不正确的命令行参数的反应。这些测试定义在顶层的 [CMakeLists.txt][14] 文件中。下面我详细介绍 3 个测试用例：

#### 参数正常

如果输入参数是一个正整数，程序应该输出应该是一个数列：

```


add_test(NAME RegularUsage COMMAND Producer 10)
set_tests_properties(RegularUsage
    PROPERTIES PASS_REGULAR_EXPRESSION "^[0-9 ]+"
)

```

#### 没有提供参数

如果没有传入参数，程序应该立即退出并提示错误原因：


```


add_test(NAME NoArg COMMAND Producer)
set_tests_properties(NoArg
    PROPERTIES PASS_REGULAR_EXPRESSION "^Enter the number of elements as argument"
)

```

#### 参数错误

当传入的参数不是整数时，程序应该退出并报错。比如给 `Producer` 传入参数 `ABC`：


```


add_test(NAME WrongArg COMMAND Producer ABC)
set_tests_properties(WrongArg
    PROPERTIES PASS_REGULAR_EXPRESSION "^Error: Cannot parse"
)

```

#### 执行测试

可以使用 `ctest -R Usage -VV` 命令来执行测试。这里给 `ctest` 的命令行参数：

  * `-R <测试名称>` : 执行单个测试
  * `-VV`：打印详细输出



测试执行结果如下：

```


$ ctest -R Usage -VV
UpdatecTest Configuration from :/home/stephan/Documents/cpp_testing sample/build/DartConfiguration.tcl
UpdateCTestConfiguration from :/home/stephan/Documents/cpp_testing sample/build/DartConfiguration.tcl
Test project /home/stephan/Documents/cpp_testing sample/build
Constructing a list of tests
Done constructing a list of tests
Updating test list for fixtures
Added 0 tests to meet fixture requirements
Checking test dependency graph...
Checking test dependency graph end

```

在这里我执行了名为 `Usage` 的测试。

它以无参数的方式调用 `Producer`：



```


test 3
    Start 3: Usage
3: Test command: /home/stephan/Documents/cpp testing sample/build/Producer

```

输出不匹配 `[^[0-9]+]` 的正则模式，测试未通过。


```


3: Enter the number of elements as argument
1/1 test #3. Usage ................

Failed Required regular expression not found.
Regex=[^[0-9]+]

0.00 sec round.

0% tests passed, 1 tests failed out of 1
Total Test time (real) =
0.00 sec
The following tests FAILED:
3 - Usage (Failed)
Errors while running CTest
$

```

如果想要执行所有测试（包括那些用 GoogleTest 生成的），切换到 `build` 目录中，然后运行 `ctest` 即可：

![CTest run][15]

Stephan Avenwedde (CC BY-SA 4.0)

在 VSCodium 中可以通过点击信息栏的黄框处来调用 CTest。如果所有测试都通过了，你会看到如下输出：

![VSCodium][16]

Stephan Avenwedde (CC BY-SA 4.0)

### 使用 Git 钩子进行自动化测试

目前为止，运行测试是开发者需要额外执行的步骤，那些不能通过测试的代码仍然可能被提交和推送到代码仓库中。利用  [Git 钩子][17] 可以自动执行测试，从而防止有瑕疵的代码被提交。

切换到 `.git/hooks` 目录，创建 `pre-commit` 文件，复制粘贴下面的代码： 


```


#!/usr/bin/sh

(cd build; ctest --output-on-failure -j6)

```

然后，给文件增加可执行权限：

```
`$ chmod +x pre-commit`
```

这个脚本会在提交之前调用 CTest 进行测试。如果有测试未通过，提交过程就会被终止：

![Commit failed][18]

Stephan Avenwedde (CC BY-SA 4.0)

只有所有测试都通过了，提交过程才会完成：

![Commit succeeded][19]

Stephan Avenwedde (CC BY-SA 4.0)

这个机制也有一个漏洞：可以通过 `git commit --no-verify` 命令绕过测试。解决办法是配置构建服务器，这能保证只有正常工作的代码才能被提交，但这又是另一个话题了。

### 总结

本文提到的技术实施简单，并且能够帮你快速发现代码中的 bug。做单元测试可以提高代码质量，同时也不会打断你的工作流。GoogleTest 框架提供了丰富的特性以应对各种测试场景，文中我所提到的只是一小部分而已。如果你想进一步了解 GoogleTest，我推荐你阅读 [GoogleTest Primer][20]。


--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/unit-testing-googletest-ctest

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://opensource.com/article/22/1/devops-cmake
[3]: https://vscodium.com/
[4]: https://cmake.org/
[5]: https://github.com/google/googletest
[6]: https://cmake.org/cmake/help/latest/manual/ctest.1.html
[7]: https://github.com/hANSIc99/cpp_testing_sample
[8]: https://opensource.com/sites/default/files/cpp_unit_test_vscodium_tag.png (VSCodium tag)
[9]: https://github.com/hANSIc99/cpp_testing_sample/blob/main/Generator/GeneratorTest.cpp
[10]: https://github.com/hANSIc99/cpp_testing_sample/blob/main/Generator/Generator.cpp
[11]: https://en.cppreference.com/w/cpp/io/basic_stringstream
[12]: https://en.cppreference.com/w/cpp/memory/addressof
[13]: https://en.wikipedia.org/wiki/Regular_expression
[14]: https://github.com/hANSIc99/cpp_testing_sample/blob/main/CMakeLists.txt
[15]: https://opensource.com/sites/default/files/cpp_unit_test_ctest_run.png (CTest run)
[16]: https://opensource.com/sites/default/files/cpp_unit_test_ctest_vscodium.png (VSCodium)
[17]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
[18]: https://opensource.com/sites/default/files/cpp_unit_test_git_hook_commit_failed.png (Commit failed)
[19]: https://opensource.com/sites/default/files/cpp_unit_test_git_hook_commit_succeeded.png (Commit succeeded)
[20]: https://google.github.io/googletest/primer.html
