[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13194-1.html)
[#]: subject: (Testing Bash with BATS)
[#]: via: (https://opensource.com/article/19/2/testing-bash-bats)
[#]: author: (Darin London https://opensource.com/users/dmlond)

利用 BATS 测试 Bash 脚本和库
======

> Bash 自动测试系统可以使 Bash 代码也通过 Java、Ruby 和 Python 开发人员所使用的同类测试过程。

![](https://img.linux.net.cn/data/attachment/album/202103/11/214705wcjm3vjpn9g69gl3.jpg)

用 Java、Ruby 和 Python 等语言编写应用程序的软件开发人员拥有复杂的库，可以帮助他们随着时间的推移保持软件的完整性。他们可以创建测试，以在结构化环境中通过执行一系列动作来运行应用程序，以确保其软件所有的方面均按预期工作。

当这些测试在持续集成（CI）系统中自动进行时，它们的功能就更加强大了，每次推送到源代码库都会触发测试，并且在测试失败时会立即通知开发人员。这种快速反馈提高了开发人员对其应用程序功能完整性的信心。

<ruby>Bash 自动测试系统<rt>Bash Automated Testing System</rt></ruby>（[BATS][1]）使编写 Bash 脚本和库的开发人员能够将 Java、Ruby、Python 和其他开发人员所使用的相同惯例应用于其 Bash 代码中。

### 安装 BATS

BATS GitHub 页面包含了安装指令。有两个 BATS 辅助库提供更强大的断言或允许覆写 BATS 使用的 Test Anything Protocol（[TAP][2]）输出格式。这些库可以安装在一个标准位置，并被所有的脚本引用。更方便的做法是，将 BATS 及其辅助库的完整版本包含在 Git 仓库中，用于要测试的每组脚本或库。这可以通过 [git 子模块][3] 系统来完成。

以下命令会将 BATS 及其辅助库安装到 Git 知识库中的 `test` 目录中。

```
git submodule init
git submodule add https://github.com/sstephenson/bats test/libs/bats
git submodule add https://github.com/ztombol/bats-assert test/libs/bats-assert
git submodule add https://github.com/ztombol/bats-support test/libs/bats-support
git add .
git commit -m 'installed bats'
```

要克隆 Git 仓库并同时安装其子模块，请在 `git clone` 时使用
`--recurse-submodules` 标记。

每个 BATS 测试脚本必须由 `bats` 可执行文件执行。如果你将 BATS 安装到源代码仓库的 `test/libs` 目录中，则可以使用以下命令调用测试：

```
./test/libs/bats/bin/bats <测试脚本的路径>
```

或者，将以下内容添加到每个 BATS 测试脚本的开头：

```
#!/usr/bin/env ./test/libs/bats/bin/bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
```

并且执行命令 `chmod +x <测试脚本的路径>`。 这将 a、使它们可与安装在 `./test/libs/bats` 中的 BATS 一同执行，并且 b、包含这些辅助库。BATS 测试脚本通常存储在 `test` 目录中，并以要测试的脚本命名，扩展名为 `.bats`。例如，一个测试 `bin/build` 的 BATS 脚本应称为 `test/build.bats`。

你还可以通过向 BATS 传递正则表达式来运行一整套 BATS 测试文件，例如 `./test/lib/bats/bin/bats test/*.bats`。

### 为 BATS 覆盖率而组织库和脚本

Bash 脚本和库必须以一种有效地方式将其内部工作原理暴露给 BATS 进行组织。通常，在调用或执行时库函数和运行诸多命令的 Shell 脚本不适合进行有效的 BATS 测试。

例如，[build.sh][4] 是许多人都会编写的典型脚本。本质上是一大堆代码。有些人甚至可能将这堆代码放入库中的函数中。但是，在 BATS 测试中运行一大堆代码，并在单独的测试用例中覆盖它可能遇到的所有故障类型是不可能的。测试这堆代码并有足够的覆盖率的唯一方法就是把它分解成许多小的、可重用的、最重要的是可独立测试的函数。

向库添加更多的函数很简单。额外的好处是其中一些函数本身可以变得出奇的有用。将库函数分解为许多较小的函数后，你可以在 BATS 测试中<ruby>援引<rt>source</er></ruby>这些库，并像测试任何其他命令一样运行这些函数。

Bash 脚本也必须分解为多个函数，执行脚本时，脚本的主要部分应调用这些函数。此外，还有一个非常有用的技巧，可以让你更容易地用 BATS 测试 Bash 脚本：将脚本主要部分中执行的所有代码都移到一个函数中，称为 `run_main`。然后，将以下内容添加到脚本的末尾：

```
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  run_main
fi
```

这段额外的代码做了一些特别的事情。它使脚本在作为脚本执行时与使用<ruby>援引<rt>source</er></ruby>进入环境时的行为有所不同。通过援引并测试单个函数，这个技巧使得脚本的测试方式和库的测试方式变得一样。例如，[这是重构的 build.sh，以获得更好的 BATS 可测试性][5]。

### 编写和运行测试

如上所述，BATS 是一个 TAP 兼容的测试框架，其语法和输出对于使用过其他 TAP 兼容测试套件（例如 JUnit、RSpec 或 Jest）的用户来说将是熟悉的。它的测试被组织成单个测试脚本。测试脚本被组织成一个或多个描述性 `@test` 块中，它们描述了被测试应用程序的单元。每个 `@test` 块将运行一系列命令，这些命令准备测试环境、运行要测试的命令，并对被测试命令的退出和输出进行断言。许多断言函数是通过 `bats`、`bats-assert` 和 `bats-support` 库导入的，这些库在 BATS 测试脚本的开头加载到环境中。下面是一个典型的 BATS 测试块：

```
@test "requires CI_COMMIT_REF_SLUG environment variable" {
  unset CI_COMMIT_REF_SLUG
  assert_empty "${CI_COMMIT_REF_SLUG}"
  run some_command
  assert_failure
  assert_output --partial "CI_COMMIT_REF_SLUG"
}
```

如果 BATS 脚本包含 `setup`（安装）和/或 `teardown`（拆卸） 函数，则 BATS 将在每个测试块运行之前和之后自动执行它们。这样就可以创建环境变量、测试文件以及执行一个或所有测试所需的其他操作，然后在每次测试运行后将其拆卸。[Build.bats][6] 是对我们新格式化的 `build.sh` 脚本的完整 BATS 测试。（此测试中的 `mock_docker` 命令将在以下关于模拟/打标的部分中进行说明。）

当测试脚本运行时，BATS 使用 `exec`（执行）来将每个 `@test` 块作为单独的子进程运行。这样就可以在一个 `@test` 中导出环境变量甚至函数，而不会影响其他 `@test` 或污染你当前的 Shell 会话。测试运行的输出是一种标准格式，可以被人理解，并且可以由 TAP 使用端以编程方式进行解析或操作。下面是 `CI_COMMIT_REF_SLUG` 测试块失败时的输出示例：

```
 ✗ requires CI_COMMIT_REF_SLUG environment variable
   (from function `assert_output' in file test/libs/bats-assert/src/assert.bash, line 231,
    in test file test/ci_deploy.bats, line 26)
     `assert_output --partial "CI_COMMIT_REF_SLUG"' failed

   -- output does not contain substring --
   substring (1 lines):
     CI_COMMIT_REF_SLUG
   output (3 lines):
     ./bin/deploy.sh: join_string_by: command not found
     oc error
     Could not login
   --

   ** Did not delete , as test failed **

1 test, 1 failure
```

下面是成功测试的输出：

```
✓ requires CI_COMMIT_REF_SLUG environment variable
```

### 辅助库

像任何 Shell 脚本或库一样，BATS 测试脚本可以包括辅助库，以在测试之间共享通用代码或增强其性能。这些辅助库，例如 `bats-assert` 和 `bats-support` 甚至可以使用 BATS 进行测试。

库可以和 BATS 脚本放在同一个测试目录下，如果测试目录下的文件数量过多，也可以放在 `test/libs` 目录下。BATS 提供了 `load` 函数，该函数接受一个相对于要测试的脚本的 Bash 文件的路径（例如，在我们的示例中的 `test`），并援引该文件。文件必须以后缀 `.bash` 结尾，但是传递给 `load` 函数的文件路径不能包含后缀。`build.bats` 加载 `bats-assert` 和 `bats-support` 库、一个小型 [helpers.bash][7] 库以及 `docker_mock.bash` 库（如下所述），以下代码位于测试脚本的开头，解释器魔力行下方：

```
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'helpers'
load 'docker_mock'
```

### 打标测试输入和模拟外部调用

大多数 Bash 脚本和库运行时都会执行函数和/或可执行文件。通常，它们被编程为基于这些函数或可执行文件的输出状态或输出（`stdout`、`stderr`）以特定方式运行。为了正确地测试这些脚本，通常需要制作这些命令的伪版本，这些命令被设计成在特定测试过程中以特定方式运行，称为“<ruby>打标<rt>stubbing</rt></ruby>”。可能还需要监视正在测试的程序，以确保其调用了特定命令，或者使用特定参数调用了特定命令，此过程称为“<ruby>模拟<rt>mocking</rt></ruby>”。有关更多信息，请查看在 Ruby RSpec 中 [有关模拟和打标的讨论][8]，它适用于任何测试系统。

Bash shell 提供了一些技巧，可以在你的 BATS 测试脚本中使用这些技巧进行模拟和打标。所有这些都需要使用带有 `-f` 标志的 Bash `export` 命令来导出一个覆盖了原始函数或可执行文件的函数。必须在测试程序执行之前完成此操作。下面是重写可执行命令 `cat` 的简单示例：

```
function cat() { echo "THIS WOULD CAT ${*}" }
export -f cat
```

此方法以相同的方式覆盖了函数。如果一个测试需要覆盖要测试的脚本或库中的函数，则在对函数进行打标或模拟之前，必须先声明已测试脚本或库，这一点很重要。否则，在声明脚本时，打标/模拟将被原函数替代。另外，在运行即将进行的测试命令之前确认打标/模拟。下面是`build.bats` 的示例，该示例模拟 `build.sh` 中描述的`raise` 函数，以确保登录函数会引发特定的错误消息：

```
@test ".login raises on oc error" {
  source ${profile_script}
  function raise() { echo "${1} raised"; }
  export -f raise
  run login
  assert_failure
  assert_output -p "Could not login raised"
}
```

一般情况下，没有必要在测试后复原打标/模拟的函数，因为 `export`（输出）仅在当前 `@test` 块的 `exec`（执行）期间影响当前子进程。但是，可以模拟/打标 BATS `assert` 函数在内部使用的命令（例如 `cat`、`sed` 等）是可能的。在运行这些断言命令之前，必须对这些模拟/打标函数进行 `unset`（复原），否则它们将无法正常工作。下面是 `build.bats` 中的一个示例，该示例模拟 `sed`，运行 `build_deployable` 函数并在运行任何断言之前复原 `sed`：

```
@test ".build_deployable prints information, runs docker build on a modified Dockerfile.production and publish_image when its not a dry_run" {
  local expected_dockerfile='Dockerfile.production'
  local application='application'
  local environment='environment'
  local expected_original_base_image="${application}"
  local expected_candidate_image="${application}-candidate:${environment}"
  local expected_deployable_image="${application}:${environment}"
  source ${profile_script}
  mock_docker build --build-arg OAUTH_CLIENT_ID --build-arg OAUTH_REDIRECT --build-arg DDS_API_BASE_URL -t "${expected_deployable_image}" -
  function publish_image() { echo "publish_image ${*}"; }
  export -f publish_image
  function sed() {
    echo "sed ${*}" >&2;
    echo "FROM application-candidate:environment";
  }
  export -f sed
  run build_deployable "${application}" "${environment}"
  assert_success
  unset sed
  assert_output --regexp "sed.*${expected_dockerfile}"
  assert_output -p "Building ${expected_original_base_image} deployable ${expected_deployable_image} FROM ${expected_candidate_image}"
  assert_output -p "FROM ${expected_candidate_image} piped"
  assert_output -p "build --build-arg OAUTH_CLIENT_ID --build-arg OAUTH_REDIRECT --build-arg DDS_API_BASE_URL -t ${expected_deployable_image} -"
  assert_output -p "publish_image ${expected_deployable_image}"
}
```

有的时候相同的命令，例如 `foo`，将在被测试的同一函数中使用不同的参数多次调用。这些情况需要创建一组函数：

  * `mock_foo`：将期望的参数作为输入，并将其持久化到 TMP 文件中
  * `foo`：命令的模拟版本，该命令使用持久化的预期参数列表处理每个调用。必须使用 `export -f` 将其导出。
  * `cleanup_foo`：删除 TMP 文件，用于拆卸函数。这可以进行测试以确保在删除之前成功完成 `@test` 块。

由于此功能通常在不同的测试中重复使用，因此创建一个可以像其他库一样加载的辅助库会变得有意义。

[docker_mock.bash][9] 是一个很棒的例子。它被加载到 `build.bats` 中，并在任何测试调用 Docker 可执行文件的函数的测试块中使用。使用 `docker_mock` 典型的测试块如下所示：

```
@test ".publish_image fails if docker push fails" {
  setup_publish
  local expected_image="image"
  local expected_publishable_image="${CI_REGISTRY_IMAGE}/${expected_image}"
  source ${profile_script}
  mock_docker tag "${expected_image}" "${expected_publishable_image}"
  mock_docker push "${expected_publishable_image}" and_fail
  run publish_image "${expected_image}"
  assert_failure
  assert_output -p "tagging ${expected_image} as ${expected_publishable_image}"
  assert_output -p "tag ${expected_image} ${expected_publishable_image}"
  assert_output -p "pushing image to gitlab registry"
  assert_output -p "push ${expected_publishable_image}"
}
```

该测试建立了一个使用不同的参数两次调用 Docker 的预期。在对Docker 的第二次调用失败时，它会运行测试命令，然后测试退出状态和对 Docker 调用的预期。

一方面 BATS 利用 `mock_docker.bash` 引入 `${BATS_TMPDIR}` 环境变量，BATS 在测试开始的位置对其进行了设置，以允许测试和辅助程序在标准位置创建和销毁 TMP 文件。如果测试失败，`mock_docker.bash` 库不会删除其持久化的模拟文件，但会打印出其所在位置，以便可以查看和删除它。你可能需要定期从该目录中清除旧的模拟文件。

关于模拟/打标的一个注意事项：`build.bats` 测试有意识地违反了关于测试声明的规定：[不要模拟没有拥有的！][10] 该规定要求调用开发人员没有编写代码的测试命令，例如 `docker`、`cat`、`sed` 等，应封装在自己的库中，应在使用它们脚本的测试中对其进行模拟。然后应该在不模拟外部命令的情况下测试封装库。

这是一个很好的建议，而忽略它是有代价的。如果 Docker CLI API 发生变化，则测试脚本不会检测到此变化，从而导致错误内容直到经过测试的 `build.sh` 脚本在使用新版本 Docker 的生产环境中运行后才显示出来。测试开发人员必须确定要严格遵守此标准的程度，但是他们应该了解其所涉及的权衡。

### 总结

在任何软件开发项目中引入测试制度，都会在以下两方面产生权衡： a、增加开发和维护代码及测试所需的时间和组织，b、增加开发人员在对应用程序整个生命周期中完整性的信心。测试制度可能不适用于所有脚本和库。

通常，满足以下一个或多个条件的脚本和库才可以使用 BATS 测试：

  * 值得存储在源代码管理中
  * 用于关键流程中，并依靠它们长期稳定运行
  * 需要定期对其进行修改以添加/删除/修改其功能
  * 可以被其他人使用

一旦决定将测试规则应用于一个或多个 Bash 脚本或库，BATS 就提供其他软件开发环境中可用的全面测试功能。

致谢：感谢 [Darrin Mann][11] 向我引荐了 BATS 测试。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/testing-bash-bats

作者：[Darin London][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dmlond
[b]: https://github.com/lujun9972
[1]: https://github.com/sstephenson/bats
[2]: http://testanything.org/
[3]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[4]: https://github.com/dmlond/how_to_bats/blob/preBats/build.sh
[5]: https://github.com/dmlond/how_to_bats/blob/master/bin/build.sh
[6]: https://github.com/dmlond/how_to_bats/blob/master/test/build.bats
[7]: https://github.com/dmlond/how_to_bats/blob/master/test/helpers.bash
[8]: https://www.codewithjason.com/rspec-mocks-stubs-plain-english/
[9]: https://github.com/dmlond/how_to_bats/blob/master/test/docker_mock.bash
[10]: https://github.com/testdouble/contributing-tests/wiki/Don't-mock-what-you-don't-own
[11]: https://github.com/dmann
