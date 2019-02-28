[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Benchmark Linux Commands And Programs From Commandline)
[#]: via: (https://www.ostechnix.com/how-to-benchmark-linux-commands-and-programs-from-commandline/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Benchmark Linux Commands And Programs From Commandline
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/benchmark-720x340.png)

A while ago, I have written a guide about the [**alternatives to ‘top’, the command line utility**][1]. Some of the users asked me which one among those tools is best and on what basis (like features, contributors, years active, page requests etc.) I compared those tools. They also asked me to share the bench-marking results If I have any. Unfortunately, I didn’t even know how to benchmark programs at that time. While searching for some simple and easy to use bench-marking tools to compare the Linux programs, I stumbled upon two utilities named **‘Bench’** and **‘Hyperfine’**. These are simple and easy-to-use command line tools to benchmark Linux commands and programs on Unix-like systems.

### 1\. Bench Tool

The **‘Bench’** utility benchmarks one or more given commands/programs using **Haskell’s criterion** library and displays the output statistics in an easy-to-understandable format. This tool can be helpful where you need to compare similar programs based on the bench-marking result. We can also export the results to HTML format or CSV or templated output.

#### Installing Bench Utility

The bench utility can be installed in three methods.

**1\. Using Linuxbrew**

We can install Bench utility using Linuxbrew package manager. If you haven’t installed Linuxbrew yet, refer the following link.

After installing Linuxbrew, run the following command to install Bench:

```
$ brew install bench
```

**2\. Using Haskell’s stack tool**

First, install Haskell as described in the following link.

And then, run the following commands to install Bench.

```
$ stack setup

$ stack install bench
```

The ‘stack’ will install bench to **~/.local/bin** or something similar. Make sure that the installation directory is on your executable search path before using bench tool. You will be reminded to do this even if you forgot.

**3\. Using Nix package manager**

Another way to install Bench is using **Nix** package manager. Install Nix as shown in the below link.

After installing Nix, install Bench tool using command:

```
$ nix-env -i bench
```

#### Benchmark Linux Commands And Programs Using Bench

It is time to start benchmarking the programs.

For instance, let me show you the benchmark result of ‘ls -al’ command.

```
$ bench 'ls -al'
```

**Sample output:**

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Benchmark-commands-1.png)

You must quote the commands when you use flags/options with them.

Similarly, you can benchmark any programs installed in your system. The following commands shows the benchmarking result of ‘htop’ and ‘ptop’ programs.

```
$ bench htop

$ bench ptop
```
![](https://www.ostechnix.com/wp-content/uploads/2018/12/Benchmark-commands-2-1.png)
Bench tool can benchmark multiple programs at once as well. Here is the benchmarking result of ls, htop, ptop programs.

```
$ bench ls htop ptop
```

Sample output:
![](https://www.ostechnix.com/wp-content/uploads/2018/12/Benchmark-commands-3.png)

We can also export the benchmark result to a HTML like below.

```
$ bench htop --output example.html
```

To export the result to CSV, just run:

```
$ bench htop --csv FILE
```

View help section:

```
$ bench --help
```

### **2. Hyperfine Benchmark Tool

**

**Hyperfine** is yet another command line benchmarking tool inspired by the ‘Bench’ tool which we just discussed above. It is free, open source, cross-platform benchmarking program and written in **Rust** programming language. It has few additional features compared to the Bench tool as listed below.

  * Statistical analysis across multiple runs.
  * Support for arbitrary shell commands.
  * Constant feedback about the benchmark progress and current estimates.
  * Perform warmup runs before the actual benchmark.
  * Cache-clearing commands can be set up before each timing run.
  * Statistical outlier detection.
  * Export benchmark results to various formats, such as CSV, JSON, Markdown.
  * Parameterized benchmarks.



#### Installing Hyperfine

We can install Hyperfine using any one of the following methods.

**1\. Using Linuxbrew**

```
$ brew install hyperfine
```

**2\. Using Cargo**

Make sure you have installed Rust as described in the following link.

After installing Rust, run the following command to install Hyperfine via Cargo:

```
$ cargo install hyperfine
```

**3\. Using AUR helper programs**

Hyperfine is available in [**AUR**][2]. So, you can install it on Arch-based systems using any helper programs, such as [**YaY**][3], like below.

```
$ yay -S hyperfine
```

**4\. Download and install the binaries**

Hyperfine is available in binaries for Debian-based systems. Download the latest .deb binary file from the [**releases page**][4] and install it using ‘dpkg’ package manager. As of writing this guide, the latest version was **1.4.0**.

```
$ wget https://github.com/sharkdp/hyperfine/releases/download/v1.4.0/hyperfine_1.4.0_amd64.deb

$ sudo dpkg -i hyperfine_1.4.0_amd64.deb

$ sudo apt install -f
```

#### Benchmark Linux Commands And Programs Using Hyperfine

To run a benchmark using Hyperfine, simply run it along with the program/command as shown below.

```
$ hyperfine 'ls -al'
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/hyperfine-1.png)

Benchmark multiple commands/programs:

```
$ hyperfine htop ptop
```

Sample output:

![](https://www.ostechnix.com/wp-content/uploads/2018/12/hyperfine-2.png)

As you can see at the end of the output, Hyperfine mentiones – **‘htop ran 1.96 times faster than ptop’** , so we can immediately conclude htop performs better than Ptop. This will help you to quickly find which program performs better when benchmarking multiple programs. We don’t get this detailed output in Bench utility though.

Hyperfine will automatically determine the number of runs to perform for each command. By default, it will perform at least **10 benchmarking runs**. If you want to set the **minimum number of runs** (E.g 5 runs), use the `-m` **/`--min-runs`** option like below:

```
$ hyperfine --min-runs 5 htop ptop
```

Or,

```
$ hyperfine -m 5 htop ptop
```

Similarly, to perform **maximum number of runs** for each command, the command would be:

```
$ hyperfine --max-runs 5 htop ptop
```

Or,

```
$ hyperfine -M 5 htop ptop
```

We can even perform **exact number of runs** for each command using the following command:

```
$ hyperfine -r 5 htop ptop
```

As you may know, if the program execution time is limited by disk I/O, the benchmarking results can be heavily influenced by disk caches and whether they are cold or warm. Luckily, Hyperfine has the options to perform a certain number of program executions before performing the actual benchmark.

To perform NUM warmup runs (E.g 3) before the actual benchmark, use the **`-w`/**`--warmup` option like below:

```
$ hyperfine --warmup 3 htop
```

Just like Bench utility, Hyperfine also allows us to export the benchmark results to a given file. We can export the results to CSV, JSON, and Markdown formats.

For instance, to export the results in Markdown format, use the following command:

```
$ hyperfine htop ptop --export-markdown <FILE-NAME>
```

For more options and usage details, refer the help secion:

```
$ hyperfine --help
```

And, that’s all for now. If you ever be in a situation where you need to benchmark similar and alternative programs, these tools might help to compare how they performs and share the details with your peers and colleagues.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-benchmark-linux-commands-and-programs-from-commandline/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/
[2]: https://aur.archlinux.org/packages/hyperfine
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://github.com/sharkdp/hyperfine/releases
