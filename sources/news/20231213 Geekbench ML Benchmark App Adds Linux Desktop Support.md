[#]: subject: "Geekbench ML Benchmark App Adds Linux Desktop Support"
[#]: via: "https://news.itsfoss.com/geekbench-ml-benchmark-app/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Geekbench ML Benchmark App Adds Linux Desktop Support
======
Test your machine for ML workload capabilities!
In a year when we have seen a [new AI alliance][1] being formed, and some questioning the [open-source definition for AI models][2], we are still seeing plenty of new developments.

One such development has been in the field of AI benchmarking, the popular Geekbench ML has done something really cool with its latest release.

**What's Happening:** With a [recent announcement][3], [Primate Labs][4] have announced the release of **Geekbench ML 0.6** , with **an early Christmas gift in the form of support for Linux.**

Released as **a preview version** , this release of Geekbench ML is now available for **Linux** , **Windows** , and **macOS**.

**What to Expect:** Well, for starters, you can **expect the benchmarking experience to be the same** across all the platforms, as they all use the same models and data sets.

Which, by the way, have been improved thanks to the **implementation of new frameworks** that bring in upgrades to Geekbeench's internal version of [TensorFlow Lite][5].

They have also added **three new types of workloads** with the Geekbench ML 0.6 release:

  * **Depth Estimation** , a workload that will help simulate common camera software effects.
  * **Style Transfer** , a workload that will simulate how generative AI functions for common use cases such as copying the style of a photo to create something different.
  * **Image Super-Resolution** , a workload that will simulate AI-powered image upscaling.



But, there is one important thing to note. **For Linux, there is no graphical user interface (GUI) with Geekbench ML 0.6** , users will have to make do with a command-line-tool; more on that later.

So, even though we are still a bit away from the **Geekbench ML 1.0 release, which is planned to be made available sometime in 2024** , this is a decent one that has some niggles here and there. But, I am glad to see that they are providing a port for Linux.

Seeing as we are on the topic; d **o you want to run Geekbench ML on your Linux system?**

## **Here's How to Run a Geekbench ML Benchmark**

Well, firstly, you will have to download the _tar.gz_ archive from the Geekbench site (linked below).

Thereafter, extract it, open a terminal window in the same directory, and run the following command:

```

    ./banff

```

📋

Ensure that you have a working internet connection before running the benchmark.

![][6]

It should then start running the benchmark, you will be shown which model and data sets are being run in real-time.

![][7]

After the benchmarking is done, a confirmation with a prompt will be shown, that guides you to view the benchmarking results online.

![][8]

You can find my benchmarking results on [Geekbench Browser][9], I admit it is not much, but, it is my system's humble score 😄

For running Geekbench ML on Linux, the developers recommend the following **system requirements** :

  * **CPU:** AMD or Intel
  * **RAM:** Minimum 2 GB
  * **OS:** Ubuntu 18.04 LTS (64-bit) or later



You can grab the _tar.gz_ from the [official website][10], just extract it and get started.

[Geekbench ML][10]

_💬 I really hope they add a GUI with the future releases of Geekbench ML for Linux. What do you think?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/geekbench-ml-benchmark-app/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/ai-alliance/
[2]: https://news.itsfoss.com/open-source-definition-ai/
[3]: https://www.geekbench.com/blog/2023/12/geekbench-ml-06/
[4]: https://www.primatelabs.com/
[5]: https://www.tensorflow.org/lite/guide
[6]: https://news.itsfoss.com/content/images/2023/12/Geekbench_ML_0.6.png
[7]: https://news.itsfoss.com/content/images/2023/12/Geekbench_ML_0.6_Output-1.png
[8]: https://news.itsfoss.com/content/images/2023/12/Geekbench_ML_0.6_Output_2.png
[9]: https://browser.geekbench.com/ml/v0/inference/328997
[10]: https://www.geekbench.com/ml/download/
