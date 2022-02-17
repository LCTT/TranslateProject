[#]: subject: "Integrating fuzzing into your open source project with OSS-Fuzz"
[#]: via: "https://opensource.com/article/22/2/debug-open-source-project-oss-fuzz"
[#]: author: "David Korczynski https://opensource.com/users/davkor"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Integrating fuzzing into your open source project with OSS-Fuzz
======
OSS-Fuzz is a free service that continuously runs fuzzers for open
source projects.
![magnifying glass on computer screen, finding a bug in the code][1]

[OSS-Fuzz][2] is a free service that continuously runs fuzzers for open source projects. This GitHub repository manages the service and enrolling in it is handled by pull requests.

Once a project has integrated with OSS-Fuzz, the fuzzers affiliated with that project run daily—continuously and indefinitely. OSS-Fuzz emails maintainers when a bug is found and also has a dashboard with details about all issues found (stack traces, artifacts for reproducing issues, and so on).

The benefits of integrating with OSS-Fuzz are that most aspects of managing fuzzer execution and analyzing the results are done by OSS-Fuzz itself. This is important in fuzzing because fuzzers build up a historical profile over time, meaning that continuous analysis is essential to maximize the results. On one project, which we detail in a [blog post][3], fuzzing had been run on just an ad hoc basis for months, with no reports of any specific issue. However, after integration with OSS-Fuzz, the service reported an issue within about a week of continuous execution. In this case, a severe security issue was only discovered because of the continuous analysis done by OSS-Fuzz.

### Which projects can integrate into OSS-fuzz?

To qualify for integration, an open source project must serve a critical purpose to global infrastructure. This usually means larger user groups rely on the project or other essential open source projects depend on it. The verdict on whether a project is security-critical is made on a project-by-project basis by the OSS-Fuzz maintainers. To find out whether the maintainers will accept your project, make a pull request to integrate your project, and they will let you know through the PR if the project is accepted or not.

Furthermore, you must write the project in one or more of the supported languages by OSS-Fuzz. At the time of writing, these are C, C++, Go, Rust, Python, Java, and Swift.

OSS-Fuzz manages fuzzing of more than 500 projects at this stage, including Kubernetes, Istio, Envoy, VLC, OpenSSL, Containerd, Binutils, Spidermonkey, and systemd.

### Integrate a project into OSS-Fuzz

The two main ingredients for integrating a project into OSS-Fuzz are a set of fuzzers that can analyze your open source project and the required infrastructure glue to build your fuzzers in the OSS-Fuzz environment.

#### Create a set of fuzzers

Creating a set of fuzzers for a given open source project largely depends on the project itself. Here's a simple example, demonstrating a [self-contained library][4] in a single file called `char_lib.c`, that exposes a single function:


```


// Count the number of lowercase letters
// input must be a null-terminated string.
int count_lowercase_letters(char *input);

```

Write a simple fuzzer for this library:


```


int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  // wrap input in null-terminated string
  char *ns = malloc(size+1);
  memcpy(ns, data, size);
  ns[size] = '\0';
 
  count_lowercase_letters(ns);
 
  free(ns);
}

```

Place this function in a file called `fuzz_char_lib.c` at the root of the Git repository. At this point, you can fuzz your library by compiling `char_lib.c` and `fuzz_char_lib.c`:


```


clang -fsanitize=fuzzer-no-link char_lib.c -c -o char_lib.o
clang -fsanitize=fuzzer-no-link fuzz_char_lib.c -c -o fuzz_char_lib.o
clang -fsanitize=fuzzer fuzz_char_lib.o char_lib.o -o fuzzer

```

Finally, run the fuzzer:


```
`$ ./fuzzer`
```

#### OSS-Fuzz infrastructure setup

To integrate the sample library into OSS-Fuzz, you must create three files: `project.yaml`, `Dockerfile`, and `build.sh`. These are the required components to create a project folder on OSS-Fuzz ([see this Kubernetes integration][5] as a detailed example.)

#### Project.yaml

This [YAML][6] file holds management data about the project. The two most important parts of the file are the list of contacts (**primary_contact** and **auto_ccs**) and the project's programming language. Here is the file:


```


homepage: "<https://github.com/AdaLogics/oss-fuzz-example>"
main_repo: '<https://github.com/AdaLogics/oss-fuzz-example>'
primary_contact: "[adam@example.com][7]"
auto_ccs :
 - "[david@example.com][8]"
language: c

```

#### Dockerfile

The Dockerfile is responsible for building a container that downloads the relevant source repositories and downloads and configures dependencies. OSS-Fuzz performs several builds to accommodate different sanitizers and various fuzz engines, so the container only creates a build script that can build the project but doesn't run the build script itself. Here is a sample Dockerfile:


```


FROM gcr.io/oss-fuzz-base/base-builder

RUN git clone <https://github.com/AdaLogics/oss-fuzz-example>
COPY build.sh $SRC/build.sh
WORKDIR $SRC/oss-fuzz-example

```

#### Build.sh

The `build.sh` script builds the project. It needs to use some specific environment variables for the compiler and compiler flags rather than specifying the compiler because OSS-Fuzz builds each project in many different ways (different fuzzers, different flags, and so on). The most important environment variables are **CC**, **CXX**, **CFLAGS**, **CXXFLAGS**, and **LIB_FUZZING_ENGINE**. The first four of these flags are common compiler variables. However, **LIB_FUZZING_ENGINE** is a flag that must be used in the linking step of a fuzzer build.


```


$CC $CFLAGS char_lib.c -c -o char_lib.o
$CC $CFLAGS fuzz_char_lib.c -c -o fuzz_char_lib.o
$CC $LIB_FUZZING_ENGINE fuzz_char_lib.o char_lib.o -o $OUT/simple-fuzzer

```

The OSS-Fuzz run-time environment doesn't run the fuzzers from within the container, and for this reason, the binaries must be statically linked to most of its dependencies. The build script must place the fuzzing binaries in the directory defined by the **OUT** environment variable.

Place these three scripts in a folder called `oss-fuzz-example` within the `projects` folder in the OSS-Fuzz repository, and then you're ready to test the OSS-Fuzz integration.

#### Testing OSS-Fuzz integration

To test the OSS-Fuzz integration, use the `infra/helper.py` script from the OSS-Fuzz repository. This script accepts various commands. The most important commands for this example are `build_fuzzers`, `run_fuzzer`, and `check_build`. These commands are all you need to test the integration.

These commands do the following:

  * `build_fuzzers` builds the necessary containers for the project and runs the `build.sh` script from within these containers.
  * `run_fuzzer` runs a given fuzzer for a given project. This command must run after `build_fuzzers`.
  * `check_build` performs various checks to ensure the setup works properly. This check must be passed for the CI of OSS-Fuzz to succeed.



The best way to visualize these commands is to run them in series.

First, clone both repositories:


```


$ git clone <https://github.com/AdaLogics/oss-fuzz-example>
$ git clone <https://github.com/google/oss-fuzz>

```

Next, make a project directory in the OSS-Fuzz repo:


```
`$ mkdir oss-fuzz/projects/oss-fuzz-example`
```

Copy over OSS-Fuzz artifacts to the directory:


```


$ cp oss-fuzz-example/oss-fuzz-example/Dockerfile oss-fuzz/projects/oss-fuzz-example/Dockerfile
$ cp oss-fuzz-example/oss-fuzz-example/build.sh oss-fuzz/projects/oss-fuzz-example/build.sh
$ cp oss-fuzz-example/oss-fuzz-example/project.yaml oss-fuzz/projects/oss-fuzz-example/project.yaml

```

Then navigate into OSS-Fuzz and build the fuzzers:


```


$ cd oss-fuzz
$ python3 infra/helper.py build_fuzzers oss-fuzz-example

```

Now run the fuzzer. Use **CTRL+C** to exit this step:


```
`$ python3 infra/helper.py run_fuzzer oss-fuzz-example simple-fuzzer`
```

Check the build:


```


$ python3 infra/helper.py check_build oss-fuzz-example
…
…
INFO:root:Check build passed.

```

### Submit OSS-Fuzz integration

At this stage, you have all the artifacts needed for integration. The remaining step before completing the integration is to make a pull request on the OSS-Fuzz repository with the OSS-Fuzz artifacts; specifically, the `Dockerfile`, `build.sh`, and `project.yaml` files.

If the maintainers approve that pull request, the integration is complete, and OSS-Fuzz starts running fuzzers continuously. It reports the progress on a dashboard. In addition, if OSS-Fuzz finds bugs in your library, it emails a detailed report to the list of maintainers in the **primary_contact** and **auto_ccs** fields of the `project.yaml` file, e.g., stack trace and issues found.

### The importance of fuzzing

The proof-of-concept integration is a minimal example. A more complex project can be difficult to configure for fuzzing, but continuous fuzzing pays dividends over time.

There are many reasons why a project should integrate with OSS-Fuzz. It's a free service with significant support behind it, and many projects have benefited from it tremendously. As of January 2022, OSS-Fuzz has found over [36,000][9] bugs in [550][10] open source projects.

Integrating fuzzing into a project is time-consuming. Be prepared to devote effort to this, and do not expect a mature integration to happen overnight. Many projects have benefited from fuzzing and OSS-Fuzz, but most have invested many hours to ensure the integration and fuzzing setup functions well. It's hard work, but it's well worth it.

Happy OSS-Fuzz integration and happy bug hunting!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/debug-open-source-project-oss-fuzz

作者：[David Korczynski][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/davkor
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://github.com/google/oss-fuzz
[3]: https://adalogics.com/blog/the-importance-of-continuity-in-fuzzing-cve-2020-28362
[4]: https://github.com/AdaLogics/oss-fuzz-example
[5]: https://github.com/google/oss-fuzz/tree/master/projects/kubernetes
[6]: https://opensource.com/article/21/9/yaml-cheat-sheet
[7]: mailto:adam@example.com
[8]: mailto:david@example.com
[9]: https://bugs.chromium.org/p/oss-fuzz/issues/list?q=-status%3AWontFix%2CDuplicate%20-component%3AInfra&can=1
[10]: https://github.com/google/oss-fuzz/tree/master/projects
