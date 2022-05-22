[#]: subject: "Use this open source tool for automated unit testing"
[#]: via: "https://opensource.com/article/21/8/tackle-test"
[#]: author: "Saurabh Sinha https://opensource.com/users/saurabhsinha"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use this open source tool for automated unit testing
======
Tackle-test is an automatic generator of unit test cases for Java
applications.
![Looking at a map][1]

Modernizing and transforming legacy applications is a challenging activity that involves several tasks. One of the key tasks is validating that the modernized application preserves the functionality of the legacy application. Unfortunately, this can be tedious and hard to perform. Legacy applications often do not have automated test cases, or, if available, test coverage might be inadequate, both in general and specifically for covering modernization-related changes. A poorly maintained test suite might also contain many obsolete tests (accumulated over time as the application evolved). Therefore, validation is mainly done manually in most modernization projects—it is a process that is time-consuming and may not test the application sufficiently. In some reported case studies, testing accounted for approximately 70% to 80% of the time spent on modernization projects [1]. Tackle-test is an automated testing tool designed to address this challenge.

### Overview of Tackle-test

At its core, Tackle-test is an automatic generator of unit test cases for Java applications. It can generate tests with assertions, which makes the tool especially useful in modernization projects, where application transformation is typically functionality-preserving—thus, useful test assertions can be created by observing runtime states of legacy application versions. This can make differential testing between the legacy and modernized application versions much more effective; test cases without assertions would detect only those differences where the modernized version crashes on a test input on which the legacy version executes successfully. The assertions that Tackle-test generates capture created object values after each code statement, as illustrated in the next section.

Tackle-test uses a novel test-generation technique that applies combinatorial test design (CTD)—also called combinatorial testing or combinatorial interaction testing [2]—to method interfaces, with the goal of performing rigorous testing of methods with “complex interfaces,” where interface complexity is characterized over the space of parameter-type combinations that a method can be invoked with. CTD is a well-known, effective, and efficient test-design technique. It typically requires a manual definition of the test space in the form of a CTD model, consisting of a set of parameters, their respective values, and constraints on the value combinations. A valid test in the test space is defined as an assignment of one value to each parameter that satisfies the constraints. A CTD algorithm automatically constructs a subset of the set of valid tests to cover all legitimate value combinations of every _t_ parameters, where *t *is usually a user input.

Although CTD is typically applied to program inputs in a black-box manner and the CTD model is created manually, Tackle-test automatically builds a parameter-type-based white-box CTD model for each method under test. It then generates a test plan consisting of coverage goals from the model and synthesizes test sequences for covering rows of the test plan. The test plan can be generated at different, user-configurable interaction levels, where higher levels result in the generation of more test cases and more thorough testing, but at the cost of increased test-generation time.

Tackle-test also leverages some existing and commonly used test-generation strategies to maximize code coverage. Specifically, the strategies include feedback-driven random test generation (via the [Randoop][2] open source tool) and evolutionary and constraint-based test generation (via the [EvoSuite][3] open source tool). These tools compute coverage goals in code elements, such as methods, statements, and branches.

![tackle-test components][4]

Figure 1: High-level components of Tackle-test.
(Saurabh Sinha and Rachel Tzoref-Brill, [CC BY-SA 4.0][5])

Figure 1 presents a high-level view of the main components of Tackle-test. It consists of a Java-based core test generator that generates CTD-driven tests and a Python-based command-line interface (CLI), which is the primary mechanism for user interaction.

### Getting started with the tool

Tackle-test is released as open source under the Konveyor organization (<https://github.com/konveyor/tackle-test-generator-cli>). To get started, clone the repo, and follow the instructions for installing and running the tool provided in the repo readme. There are two installation options: using docker/docker-compose or a local installation.

The CLI provides two main commands: `generate` for generating JUnit test cases and `execute` for executing them. To verify your installation completed successfully, use the sample `irs` application located in the test/data folder to run these two commands.

The `generate` command is accompanied by a subcommand specifying the test-generation strategy (`ctd-amplified`, `randoop`, or `evosuite`) and creates JUnit test cases. By default, diff assertions are added to the generated test cases. Let’s run the generate command on the `irs` sample, using the CTD-guided strategy.


```
$ tkltest --config-file ./test/data/irs/tkltest_config.toml --verbose generate ctd-amplified
[tkltest|18:00:11.171] Loading config file ./test/data/irs/tkltest_config.toml
[tkltest|18:00:11.175] Computing coverage goals using CTD
* CTD interaction level: 1
* Total number of classes: 5
* Targeting 5 classes
* Created a total of 20 test combinations for 20 target methods of 5 target classes
[tkltest|18:00:12.816] Computing test plans with CTD took 1.64 seconds
[tkltest|18:00:12.816] Generating basic block test sequences using CombinedTestGenerator
[tkltest|18:00:12.816] Test generator output will be written to irs_CombinedTestGenerator_output.log
[tkltest|18:01:02.693] Generating basic block test sequences with CombinedTestGenerator took 49.88 seconds
[tkltest|18:01:02.693] Extending sequences to reach coverage goals and generating junit tests
* === total CTD test-plan coverage rate: 90.00% (18/20)
* Added a total of 64 diff assertions across all sequences
* wrote summary file for generation of CTD-amplified tests (JSON)
* wrote 5 test class files to "irs-ctd-amplified-tests/monolithic" with 18 total test methods
* wrote CTD test-plan coverage report (JSON)
[tkltest|18:01:06.694] JUnit tests are saved in ./irs-ctd-amplified-tests
[tkltest|18:01:06.695] Extending test sequences and writing junit tests took 4.0 seconds
[tkltest|18:01:06.700] CTD coverage report is saved in ./irs-tkltest-reports/ctd report/ctdsummary.html
[tkltest|18:01:06.743] Generated Ant build file ./irs-ctd-amplified-tests/build.xml
[tkltest|18:01:06.743] Generated Maven build file ./irs-ctd-amplified-tests/pom.xml
```

Test generation takes a couple of minutes on the `irs` sample. By default, the tool spends 10 seconds per class on initial test sequence generation. However, the overall runtime can be longer due to additional steps, as explained in the following section. Note that the time limit per class option is configurable and that for large applications, test generation might take several hours. Therefore, it is a good practice to start with a limited scope of a few classes to get a feel for the tool before performing test generation on all application classes.

When test generation completes, the test cases are written to a designated directory named `irs-ctd-amplified-tests` as output by the tool, along with Maven and Ant scripts for compiling and executing them. The test cases are in a subdirectory named `monolith`. A separate test file is created for each application class. Each such file contains multiple test approaches for testing the public methods of the class with different combinations of parameter types, as specified by the CTD test plan. A CTD coverage report is created that summarizes the test plan parts for which unit tests could be generated in a directory named `irs-tkltest-reports`. In the above output, we can see that Tackle-test created test cases for 18 of the 20 test-plan rows, resulting in 90% test-plan coverage.

![amplified tests][6]

(Saurabh Sinha and Rachel Tzoref-Brill, [CC BY-SA 4.0][5])

Now let’s look at one of the generated test methods for the `irs.IRS` class.


```
  @Test    
   public void test1() throws Throwable {
       irs.IRS iRS0 = new irs.IRS();
       java.util.ArrayList&lt;irs.Salary&gt; salaryList1 = new java.util.ArrayList&lt;irs.Salary&gt;();                 
       irs.Salary salary5 = new irs.Salary(0, 0, (double)100);
       assertEquals(0, ((irs.Salary) salary5).getEmployerId());
       assertEquals(0, ((irs.Salary) salary5).getEmployeeId());
       assertEquals(100.0, (double) ((irs.Salary) salary5).getSalary(), 1.0E-4);
       boolean boolean6 = salaryList1.add(salary5);
        assertEquals(true, boolean6);
       iRS0.setSalaryList((java.util.List&lt;irs.Salary&gt;)salaryList1);
    }
```

This test method intends to test the `setSalaryList` method of IRS, which receives a list of `irs.Salary` objects as its input. We can see that statements of the test case are followed by calls to the `assertEquals` method, comparing the values of generated objects to the values recorded during the generation of this test. When the test executes again, e.g., on the modernized version of the application, if any value differs from the recorded one, an assertion failure would occur, potentially indicating broken code that did not preserve the functionality of the legacy application.

Next, we will compile and run the generated test cases using the CLI `execute`command. We note that these are standard JUnit test cases that can be run in an IDE or using any JUnit test runner; they can also be integrated into a CI pipeline. When executed with the CLI, JUnit reports are generated and optionally also code-coverage reports (created using [JaCoCo][7]).


```
$ tkltest --config-file ./test/data/irs/tkltest_config.toml --verbose execute
[tkltest|18:12:46.446] Loading config file ./test/data/irs/tkltest_config.toml
[tkltest|18:12:46.457] Total test classes: 5
[tkltest|18:12:46.457] Compiling and running tests in ./irs-ctd-amplified-tests
Buildfile: ./irs-ctd-amplified-tests/build.xml

delete-classes:

compile-classes_monolithic:
      [javac] Compiling 5 source files

execute-tests_monolithic:
      [mkdir] Created dir: ./irs-tkltest-reports/junit-reports/monolithic
      [mkdir] Created dir: ./irs-tkltest-reports/junit-reports/monolithic/raw
      [mkdir] Created dir: ./irs-tkltest-reports/junit-reports/monolithic/html
[jacoco:coverage] Enhancing junit with coverage

...

BUILD SUCCESSFUL
Total time: 2 seconds
[tkltest|18:12:49.772] JUnit reports are saved in ./irs-tkltest-reports/junit-reports
[tkltest|18:12:49.773] Jacoco code coverage reports are saved in ./irs-tkltest-reports/jacoco-reports
```

The Ant script executes the unit tests by default, but the user can configure the tool to use Maven instead. Gradle will also be supported soon.

Looking at the JUnit report, located in `irs-tkltest-reports`, we can see that all JUnit test methods passed. This is expected because we executed them on the same version of the application on which they were generated.

![junit report][8]

(Saurabh Sinha and Rachel Tzoref-Brill, [CC BY-SA 4.0][5])

From the JaCoCo code-coverage report, also located in `irs-tkltest-reports`, we can see that CTD-guided test generation achieved overall 71% statement coverage and 94% branch coverage on the irs sample. We can also drill down to the class and method levels to see their coverage rates. The missing coverage is the result of test-plan rows for which the test generator was unable to generate a passing sequence. Increasing the test-generation time limit per class can increase the coverage rate.

![jacoco][9]

(Saurabh Sinha and Rachel Tzoref-Brill, [CC BY-SA 4.0][5])

### CTD-guided test generation

Figure 2 illustrates the test-generation flow for CTD-guided test generation, implemented in the core test-generation engine of Tackle-test. The input to the test-generation flow is a specification of (1) the application classes, (2) the library dependencies of the application, and (3) optionally, the set of application classes to target for test generation (if unspecified, all application classes are targeted). This specification is provided via a [TOML][10] configuration file. The output from the flow consists of: (1) JUnit test cases (with or without assertions), (2) Maven and Ant build files, and (3) JSON files containing a summary of test generation and CTD test-plan coverage.

![ctd-guided test generation][11]

Figure 2: The process for CTD-guided test generation.
(Saurabh Sinha and Rachel Tzoref-Brill, [CC BY-SA 4.0][5])

The flow starts with the generation of the CTD test plan. This involves creating a CTD model for each public method of the targeted classes. The CTD model for each method captures all possible concrete types for every formal parameter of the method, including elements that can be added to collection/map/array parameter types. Tackle-test incorporates lightweight static analysis to deduce the feasible concrete types for each parameter of each method.

Next, a CTD test plan is generated automatically from the model at a given (user-configurable) interaction level. Each row in the test plan describes a specific combination of concrete parameter types with which the method should be invoked. By default, the interaction level is set to one, which results in one-way testing: each possible concrete parameter type appears in at least one row of the test plan. Setting the Interaction level to two, a.k.a. pairwise testing, would result in a test plan that includes every pair of concrete types for each pair of method parameters in at least one of its rows.

The CTD test plan provides a set of coverage goals for which test sequences need to be synthesized. Tackle-test does this in two steps. In the first step, it uses Randoop and/or EvoSuite (the user can configure which tools are used) to create base test sequences. The base test sequences are analyzed to generate sequence pools at method and class levels from which the test-generation engine samples sequences to put together a covering sequence for each test-plan row. If a covering sequence is successfully created, the engine executes it to ensure that the sequence is valid in the sense that it does not cause the application to crash. During this execution, runtime states in terms of objects created are also recorded to be used later for assertion generation. Failing sequences are discarded. The engine adds assertions to passing sequences if the user specifies the assertion option. Finally, the engine exports the sequences, grouped by classes, to JUnit class files. The engine also creates Ant `build.xml` and Maven `pom.xml` files, which can be used if needed for running the generated test cases.

### Other tool features

Tackle-test is highly configurable and provides several configuration options using which the user can tailor the behavior of the tool: for example, which classes to generate tests for, which tools to use for test generation, how much time to spend on test generation, whether to add assertions to test cases, what interaction level to use for generating CTD test plans, how many executions to perform for extended test sequences, etc.

### Effectiveness of different test-generation strategies

Tackle-test has been evaluated on several open source Java applications and is currently being applied to enterprise-grade Java applications as well.

![instruction coverage results][12]

Figure 3: Instruction coverage achieved by test cases generated using different strategies and interaction levels for two small open-source Java applications taken from the[ SF110 benchmark][13].
(Saurabh Sinha and Rachel Tzoref-Brill, [CC BY-SA 4.0][5])

Figure 3 presents data about statement coverage achieved by tests generated using different testing strategies on two small open source Java applications. The applications were taken from the [SF110 benchmark][13], a large corpus of open source Java applications created to facilitate empirical studies of automated testing techniques. One of the applications, `jni-inchi`, consists of 24 classes and 74 methods; the other, `gaj`, consists of 14 classes and 17 methods. The box plot shows that targeting CTD test-plan rows by itself can achieve good statement coverage and, compared to test suites of the same size as the CTD-guided test suite sampled out of Randoop- and EvoSuite-generated test cases, the CTD-guided test suite achieves higher statement coverage, making it more efficient.

A large-scale evaluation of Tackle-test, using more applications from the SF110 benchmark and some proprietary enterprise Java applications, is currently being conducted.

If you prefer to see a video demonstration, you can watch it [here][14].

We encourage you to try out the tool and provide feedback to help us improve it by submitting a pull request. We also invite you to help improve the tool by contributing to the project.

#### Migrate to Kubernetes with the Konveyor community

Tackle-test is part of the Konveyor community. This community is helping others modernize and migrate their applications to the hybrid cloud by building tools, identifying patterns, and providing advice on breaking down monoliths, adopting containers, and embracing Kubernetes.

This community includes open source tools that migrate virtual machines to KubeVirt, Cloud Foundry, or Docker containers to Kubernetes, or namespaces between Kubernetes clusters. These are a few of the use cases we solve for.

For updates on these tools and invites to meetups where practitioners show how they moved to Kubernetes, [join the community][15].

#### References

[1] COBOL to Java and Newspapers Still Get Delivered, <https://arxiv.org/pdf/1808.03724.pdf>, 2018.

[2] D. R. Kuhn, R. N. Kacker, and Y. Lei. Introduction to Combinatorial Testing. Chapman &amp; Hall/CRC, 2013.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/tackle-test

作者：[Saurabh Sinha][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/saurabhsinha
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://randoop.github.io/randoop/
[3]: https://www.evosuite.org/
[4]: https://opensource.com/sites/default/files/1tackle-test-components.png
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/2amplified-tests.png (amplified tests)
[7]: https://www.eclemma.org/jacoco/
[8]: https://opensource.com/sites/default/files/3junit-report.png (junit report)
[9]: https://opensource.com/sites/default/files/4jacoco.png (jacoco)
[10]: https://toml.io/en/
[11]: https://opensource.com/sites/default/files/5ctd-guided-test-generation.png (ctd-guided test generation)
[12]: https://opensource.com/sites/default/files/6instructioncoverage.png (instruction coverage results)
[13]: https://www.evosuite.org/experimental-data/sf110/
[14]: https://youtu.be/qThqTFh2PM4
[15]: https://www.konveyor.io/
