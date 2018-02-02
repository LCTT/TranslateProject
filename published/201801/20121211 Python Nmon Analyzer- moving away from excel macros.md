Python 版的 Nmon 分析器：让你远离 excel 宏
======

[Nigel's monitor][1]，也叫做 “Nmon”，是一个很好的监控、记录和分析 Linux/*nix 系统性能随时间变化的工具。Nmon 最初由 IBM 开发并于 2009 年夏天开源。时至今日 Nmon 已经在所有 Linux 平台和架构上都可用了。它提供了很棒的当前系统统计信息的基于命令行的实时可视化报告，这些统计信息包括 CPU、RAM、网络和磁盘 I/O。然而，Nmon 最棒的特性是可以随着时间的推移记录系统性能快照。

比如：`nmon -f -s 1`。

![nmon CPU and Disk utilization][2]

会创建一个日志文件，该日志文件最开头是一些系统的元数据（AAA - BBBV 部分），后面是所监控的系统属性的定时快照，比如 CPU 和内存的使用情况。这个输出的文件很难直接由电子表格应用来处理，因此诞生了 [Nmon_Analyzer][3] excel 宏。如果你用的是 Windows/Mac 并安装了 Microsoft Office，那么这个工具非常不错。如果没有这个环境那也可以使用 Nmon2rrd 工具，这个工具能将日志文件转换 RRD 输入文件，进而生成图形。这个过程很死板而且有点麻烦。现在出现了一个更灵活的工具，我向你们介绍一下 pyNmonAnalyzer，它提供了一个可定制化的解决方案来生成结构化的 CSV 文件和带有用 [matplotlib][4] 生成的图片的简单 HTML 报告。

### 入门介绍

系统需求：

从名字中就能看出我们需要有 python。此外 pyNmonAnalyzer 还依赖于 matplotlib 和 numpy。若你使用的是 debian 衍生的系统，则你需要先安装这些包：

```
$ sudo apt-get install python-numpy python-matplotlib
```

#### 获取 pyNmonAnalyzer：

你可以克隆 git 仓库：

```
$ git clone git@github.com:madmaze/pyNmonAnalyzer.git
```

或者，直接从这里下载：[pyNmonAnalyzer-0.1.zip][5] 。

接下来我们需要一个 Nmon 文件，如果没有的话，可以使用发行版中提供的实例或者自己录制一个样本：`nmon -F test.nmon -s 1 -c 120`，会录制 120 个快照，每秒一个，存储到 test.nmon 文件中。

让我们来看看基本的帮助信息：

```
$ ./pyNmonAnalyzer.py -h
usage: pyNmonAnalyzer.py [-h] [-x] [-d] [-o OUTDIR] [-c] [-b] [-r CONFFNAME]
 input_file

nmonParser converts Nmon monitor files into time-sorted
CSV/Spreadsheets for easier analysis, without the use of the
MS Excel Macro. Also included is an option to build an HTML
report with graphs, which is configured through report.config.

positional arguments:
 input_file Input NMON file

optional arguments:
 -h, --help show this help message and exit
 -x, --overwrite overwrite existing results (Default: False)
 -d, --debug debug? (Default: False)
 -o OUTDIR, --output OUTDIR
 Output dir for CSV (Default: ./data/)
 -c, --csv CSV output? (Default: False)
 -b, --buildReport report output? (Default: False)
 -r CONFFNAME, --reportConfig CONFFNAME
 Report config file, if none exists: we will write the
 default config file out (Default: ./report.config)
```

该工具有两个主要的选项

1. 将 nmon 文件传唤成一系列独立的 CSV 文件
2. 使用 matplotlib 生成带图形的 HTML 报告


下面命令既会生成 CSV 文件，也会生成 HTML 报告：

```
$ ./pyNmonAnalyzer.py -c -b test.nmon
```

这会创建一个 `./data` 目录，其中有一个存放 CSV 文件的目录 (`./data/csv/`)，一个存放 PNG 图片的目录 (`./data/img/`) 以及一个 HTML 报告 (`./data/report.html`)。

默认情况下，HTML 报告中会用图片展示 CPU、磁盘繁忙程度、内存使用情况和网络传输情况。所有这些都定义在一个不言自明的配置文件中 (`report.config`)。目前这个工具还不是特别的灵活，因为 CPU 和 MEM 除了 `on` 和 `off` 外，无法做其他的配置。不过下一步将会改进作图的方法并允许用户灵活地指定针对哪些数据使用哪种作图方法。

### 报告的例子

![pyNmonAnalyzer Graph output][6]

[点击查看完整报告][7]

目前这些报告还十分的枯燥而且只能打印出基本的几种标记图表，不过它的功能还在不断的完善中。目前在开发的是一个向导来让配置调整变得更容易。如果有任何建议，找到任何 bug 或者有任何功能需求，欢迎与我交流。

--------------------------------------------------------------------------------

via: https://matthiaslee.com/python-nmon-analyzer-moving-away-from-excel-macros/

作者：[Matthias Lee][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://matthiaslee.com/
[1]:http://nmon.sourceforge.net/
[2]:https://matthiaslee.com//content/images/2015/06/nmon_cpudisk.png
[3]:http://www.ibm.com/developerworks/wikis/display/WikiPtype/nmonanalyser
[4]:http://matplotlib.org/
[5]:https://github.com/madmaze/pyNmonAnalyzer/blob/master/release/pyNmonAnalyzer-0.1.zip?raw=true
[6]:https://matthiaslee.com//content/images/2017/04/teaser-short_0.png (pyNmonAnalyzer Graph output)
[7]:http://matthiaslee.com/pub/pyNmonAnalyzer/data/report.html
