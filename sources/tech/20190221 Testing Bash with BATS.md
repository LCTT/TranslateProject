[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Testing Bash with BATS)
[#]: via: (https://opensource.com/article/19/2/testing-bash-bats)
[#]: author: (Darin London https://opensource.com/users/dmlond)

Testing Bash with BATS
======
The Bash Automated Testing System puts Bash code through the same types of testing processes used by Java, Ruby, and Python developers.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf)

Software developers writing applications in languages such as Java, Ruby, and Python have sophisticated libraries to help them maintain their software's integrity over time. They create tests that run applications through a series of executions in structured environments to ensure all of their software's aspects work as expected.

These tests are even more powerful when they're automated in a continuous integration (CI) system, where every push to the source repository causes the tests to run, and developers are immediately notified when tests fail. This fast feedback increases developers' confidence in the functional integrity of their applications.

The Bash Automated Testing System ([BATS][1]) enables developers writing Bash scripts and libraries to apply the same practices used by Java, Ruby, Python, and other developers to their Bash code.

### Installing BATS

The BATS GitHub page includes installation instructions. There are two BATS helper libraries that provide more powerful assertions or allow overrides to the Test Anything Protocol ([TAP][2]) output format used by BATS. These can be installed in a standard location and sourced by all scripts. It may be more convenient to include a complete version of BATS and its helper libraries in the Git repository for each set of scripts or libraries being tested. This can be accomplished using the **[git submodule][3]** system.

The following commands will install BATS and its helper libraries into the **test** directory in a Git repository.

```
git submodule init
git submodule add https://github.com/sstephenson/bats test/libs/bats
git submodule add https://github.com/ztombol/bats-assert test/libs/bats-assert
git submodule add https://github.com/ztombol/bats-support test/libs/bats-support
git add .
git commit -m 'installed bats'
```

To clone a Git repository and install its submodules at the same time, use the
**\--recurse-submodules** flag to **git clone**.

Each BATS test script must be executed by the **bats** executable. If you installed BATS into your source code repo's **test/libs** directory, you can invoke the test with:

```
./test/libs/bats/bin/bats <path to test script>
```

Alternatively, add the following to the beginning of each of your BATS test scripts:

```
#!/usr/bin/env ./test/libs/bats/bin/bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
```

and **chmod +x <path to test script>**. This will a) make them executable with the BATS installed in **./test/libs/bats** and b) include these helper libraries. BATS test scripts are typically stored in the **test** directory and named for the script being tested, but with the **.bats** extension. For example, a BATS script that tests **bin/build** should be called **test/build.bats**.

You can also run an entire set of BATS test files by passing a regular expression to BATS, e.g., **./test/lib/bats/bin/bats test/*.bats**.

### Organizing libraries and scripts for BATS coverage

Bash scripts and libraries must be organized in a way that efficiently exposes their inner workings to BATS. In general, library functions and shell scripts that run many commands when they are called or executed are not amenable to efficient BATS testing.

For example, [build.sh][4] is a typical script that many people write. It is essentially a big pile of code. Some might even put this pile of code in a function in a library. But it's impossible to run a big pile of code in a BATS test and cover all possible types of failures it can encounter in separate test cases. The only way to test this pile of code with sufficient coverage is to break it into many small, reusable, and, most importantly, independently testable functions.

It's straightforward to add more functions to a library. An added benefit is that some of these functions can become surprisingly useful in their own right. Once you have broken your library function into lots of smaller functions, you can **source** the library in your BATS test and run the functions as you would any other command to test them.

Bash scripts must also be broken down into multiple functions, which the main part of the script should call when the script is executed. In addition, there is a very useful trick to make it much easier to test Bash scripts with BATS: Take all the code that is executed in the main part of the script and move it into a function, called something like **run_main**. Then, add the following to the end of the script:

```
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  run_main
fi
```

This bit of extra code does something special. It makes the script behave differently when it is executed as a script than when it is brought into the environment with **source**. This trick enables the script to be tested the same way a library is tested, by sourcing it and testing the individual functions. For example, here is [build.sh refactored for better BATS testability][5].

### Writing and running tests

As mentioned above, BATS is a TAP-compliant testing framework with a syntax and output that will be familiar to those who have used other TAP-compliant testing suites, such as JUnit, RSpec, or Jest. Its tests are organized into individual test scripts. Test scripts are organized into one or more descriptive **@test** blocks that describe the unit of the application being tested. Each **@test** block will run a series of commands that prepares the test environment, runs the command to be tested, and makes assertions about the exit and output of the tested command. Many assertion functions are imported with the **bats** , **bats-assert** , and **bats-support** libraries, which are loaded into the environment at the beginning of the BATS test script. Here is a typical BATS test block:

```
@test "requires CI_COMMIT_REF_SLUG environment variable" {
  unset CI_COMMIT_REF_SLUG
  assert_empty "${CI_COMMIT_REF_SLUG}"
  run some_command
  assert_failure
  assert_output --partial "CI_COMMIT_REF_SLUG"
}
```

If a BATS script includes **setup** and/or **teardown** functions, they are automatically executed by BATS before and after each test block runs. This makes it possible to create environment variables, test files, and do other things needed by one or all tests, then tear them down after each test runs. [**Build.bats**][6] is a full BATS test of our newly formatted **build.sh** script. (The **mock_docker** command in this test will be explained below, in the section on mocking/stubbing.)

When the test script runs, BATS uses **exec** to run each **@test** block as a separate subprocess. This makes it possible to export environment variables and even functions in one **@test** without affecting other **@test** s or polluting your current shell session. The output of a test run is a standard format that can be understood by humans and parsed or manipulated programmatically by TAP consumers. Here is an example of the output for the **CI_COMMIT_REF_SLUG** test block when it fails:

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

Here is the output of a successful test:

```
✓ requires CI_COMMIT_REF_SLUG environment variable
```

### Helpers

Like any shell script or library, BATS test scripts can include helper libraries to share common code across tests or enhance their capabilities. These helper libraries, such as **bats-assert** and **bats-support** , can even be tested with BATS.

Libraries can be placed in the same test directory as the BATS scripts or in the **test/libs** directory if the number of files in the test directory gets unwieldy. BATS provides the **load** function that takes a path to a Bash file relative to the script being tested (e.g., **test** , in our case) and sources that file. Files must end with the prefix **.bash** , but the path to the file passed to the **load** function can't include the prefix. **build.bats** loads the **bats-assert** and **bats-support** libraries, a small **[helpers.bash][7]** library, and a **docker_mock.bash** library (described below) with the following code placed at the beginning of the test script below the interpreter magic line:

```
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'helpers'
load 'docker_mock'
```

### Stubbing test input and mocking external calls

The majority of Bash scripts and libraries execute functions and/or executables when they run. Often they are programmed to behave in specific ways based on the exit status or output ( **stdout** , **stderr** ) of these functions or executables. To properly test these scripts, it is often necessary to make fake versions of these commands that are designed to behave in a specific way during a specific test, a process called "stubbing." It may also be necessary to spy on the program being tested to ensure it calls a specific command, or it calls a specific command with specific arguments, a process called "mocking." For more on this, check out this great [discussion of mocking and stubbing][8] in Ruby RSpec, which applies to any testing system.

The Bash shell provides tricks that can be used in your BATS test scripts to do mocking and stubbing. All require the use of the Bash **export** command with the **-f** flag to export a function that overrides the original function or executable. This must be done before the tested program is executed. Here is a simple example that overrides the **cat** executable:

```
function cat() { echo "THIS WOULD CAT ${*}" }
export -f cat
```

This method overrides a function in the same manner. If a test needs to override a function within the script or library being tested, it is important to source the tested script or library before the function is stubbed or mocked. Otherwise, the stub/mock will be replaced with the actual function when the script is sourced. Also, make sure to stub/mock before you run the command you're testing. Here is an example from **build.bats** that mocks the **raise** function described in **build.sh** to ensure a specific error message is raised by the login fuction:

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

Normally, it is not necessary to unset a stub/mock function after the test, since **export** only affects the current subprocess during the **exec** of the current **@test** block. However, it is possible to mock/stub commands (e.g. **cat** , **sed** , etc.) that the BATS **assert** * functions use internally. These mock/stub functions must be **unset** before these assert commands are run, or they will not work properly. Here is an example from **build.bats** that mocks **sed** , runs the **build_deployable** function, and unsets **sed** before running any assertions:

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

Sometimes the same command, e.g. foo, will be invoked multiple times, with different arguments, in the same function being tested. These situations require the creation of a set of functions:

  * mock_foo: takes expected arguments as input, and persists these to a TMP file
  * foo: the mocked version of the command, which processes each call with the persisted list of expected arguments. This must be exported with export -f.
  * cleanup_foo: removes the TMP file, for use in teardown functions. This can test to ensure that a @test block was successful before removing.



Since this functionality is often reused in different tests, it makes sense to create a helper library that can be loaded like other libraries.

A good example is **[docker_mock.bash][9]**. It is loaded into **build.bats** and used in any test block that tests a function that calls the Docker executable. A typical test block using **docker_mock** looks like:

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

This test sets up an expectation that Docker will be called twice with different arguments. With the second call to Docker failing, it runs the tested command, then tests the exit status and expected calls to Docker.

One aspect of BATS introduced by **mock_docker.bash** is the **${BATS_TMPDIR}** environment variable, which BATS sets at the beginning to allow tests and helpers to create and destroy TMP files in a standard location. The **mock_docker.bash** library will not delete its persisted mocks file if a test fails, but it will print where it is located so it can be viewed and deleted. You may need to periodically clean old mock files out of this directory.

One note of caution regarding mocking/stubbing: The **build.bats** test consciously violates a dictum of testing that states: [Don't mock what you don't own!][10] This dictum demands that calls to commands that the test's developer didn't write, like **docker** , **cat** , **sed** , etc., should be wrapped in their own libraries, which should be mocked in tests of scripts that use them. The wrapper libraries should then be tested without mocking the external commands.

This is good advice and ignoring it comes with a cost. If the Docker CLI API changes, the test scripts will not detect this change, resulting in a false positive that won't manifest until the tested **build.sh** script runs in a production setting with the new version of Docker. Test developers must decide how stringently they want to adhere to this standard, but they should understand the tradeoffs involved with their decision.

### Conclusion

Introducing a testing regime to any software development project creates a tradeoff between a) the increase in time and organization required to develop and maintain code and tests and b) the increased confidence developers have in the integrity of the application over its lifetime. Testing regimes may not be appropriate for all scripts and libraries.

In general, scripts and libraries that meet one or more of the following should be tested with BATS:

  * They are worthy of being stored in source control
  * They are used in critical processes and relied upon to run consistently for a long period of time
  * They need to be modified periodically to add/remove/modify their function
  * They are used by others



Once the decision is made to apply a testing discipline to one or more Bash scripts or libraries, BATS provides the comprehensive testing features that are available in other software development environments.

Acknowledgment: I am indebted to [Darrin Mann][11] for introducing me to BATS testing.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/testing-bash-bats

作者：[Darin London][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
