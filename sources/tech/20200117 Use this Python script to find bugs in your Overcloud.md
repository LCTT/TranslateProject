[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this Python script to find bugs in your Overcloud)
[#]: via: (https://opensource.com/article/20/1/logtool-root-cause-identification)
[#]: author: (Arkady Shtempler https://opensource.com/users/ashtempl)

Use this Python script to find bugs in your Overcloud
======
LogTool is a set of Python scripts that helps you investigate root
causes for problems in Overcloud nodes.
![Searching for code][1]

OpenStack stores and manages a bunch of log files on its Overcloud nodes and Undercloud host. Therefore, it's not easy to use OSP log files to investigate a problem you're having, especially when you don't even know what could have caused the problem.

If that's your situation, [LogTool][2] makes your life much easier! It saves you the time and work it would otherwise take to investigate the root cause manually. Based on a fuzzy string matching algorithm, LogTool provides all the unique error and warning messages that have occurred in the past. You can export these messages for a particular time period, such as 10 minutes ago, an hour ago, a day ago, and so on, based on timestamp in the log.

LogTool is a set of Python scripts, and its main module, **PyTool.py**, is executed on the Undercloud host. Some operation modes use additional scripts that are executed directly on Overcloud nodes, such as exporting  errors and warnings from Overcloud logs.

LogTool supports Python 2 and 3, and you can change the working directory according to your needs: [LogTool_Python2][3] or [LogTool_Python3][4].

### Operation modes

#### 1\. Export errors and warnings from Overcloud logs

This mode is used to extract all unique **ERROR** and **WARNING** messages from Overcloud nodes that took place in the past. As the user, you're prompted to provide the "since time" and debug level to be used for extraction of errors or warnings. For example, if something went wrong in the last 10 minutes, you're be able to extract error and warning messages for just that time period.

This operation mode generates a directory containing a result file for each Overcloud node. A result file is a simple text file that is compressed (***.gz**) to reduce the time needed to download it from the Overcloud node. To convert a compressed file to a regular text file, you can use [zcat][5] or a similar tool. Also, some versions of Vi and any recent version of Emacs both support reading compressed data. The result file is divided into sections and contains a table of contents at the bottom.

There are two kinds of log files LogTool detects on the fly: _Standard_ and _Not Standard_. In _Standard_, each log line has a known and defined structure: timestamp, debug level, msg, and so on. In _Not Standard_, the log's structure is unknown; it could be a third party's logs, for example. In the table of contents, you find a "Section name --&gt; Line number" per section, for example:

  * **Raw Data - extracted Errors/Warnings from standard OSP logs since:** This section contains all extracted Error/Warning messages as-is without any modifications or changes. These messages are the raw data LogTool uses for fuzzy matching analysis.
  * **Statistics - Number of Errors/Warnings per standard OSP log since:** In this section, you find the amount of Errors and Warnings per Standard log file. This may help you understand potential components used to search for the root cause of your issue.
  * **Statistics - Unique messages, per STANDARD OSP log file since:** This section addresses unique Error and Warning messages since a timestamp you provide. For more details about each unique Error or Warning, search for the same message in the Raw Data section.
  * **Statistics - Unique messages per NON STANDARD log file, since any time:** This section contains the unique messages in nonstandard log files. Unfortunately, LogTool cannot handle these log files in the same manner as Standard Log files; therefore, the "since time" you provide on extraction will be ignored, and you'll see all of the unique Errors/Warnings messages ever created. So first, scroll down to the table of contents at the bottom of the result file and review its sections—use the line indexes in the table of contents to jump to the relevant sections, where numbers 3, 4, and 5 are most important.



#### 2\. Download all logs from Overcloud nodes

Logs from all Overcloud nodes are compressed and downloaded to a local directory on your Undercloud host.

#### 3\. Grep for a string in all Overcloud logs

This mode "greps" (searches) a string provided by the user on all Overcloud logs. For example, you might want to see all logged messages for a specific request ID, such as the request ID for a "Create VM" that has failed.

#### 4\. Check current CPU,RAM and Disk on Overcloud

This mode displays the current CPU, RAM, and disk info on each Overcloud node.

#### 5\. Execute user's script

This enables users to run their own scripts on Overcloud nodes. For instance, say an Overcloud deployment failed, so you need to execute the same procedure on each Controller node to fix that. You can implement a "work around" script and to run it on Controllers using this mode.

#### 6\. Download relevant logs only, by given timestamp

This mode downloads only the Overcloud logs with _"Last Modified" &gt; "given by user timestamp."_ For example, if you got an error 10 minutes ago, old log files won't be relevant, so downloading them is unnecessary. In addition, you can't (or shouldn't)  attach large files in some bug reporting tools, so this mode might help with making bug reports.

#### 7\. Export errors and warnings from Undercloud logs

This is the same as mode #1 above, but for Undercloud logs.

#### 8\. Check Unhealthy dockers on the Overcloud

This mode is used to search for unhealthy Dockers on nodes.

#### 9\. Download OSP logs and run LogTool locally

This mode allows you to download OSP logs from Jenkins or Log Storage (for example, **cougar11.scl.lab.tlv.redhat.com**) and to analyze the downloaded logs locally.

#### 10\. Analyze deployment log on the Undercloud

This mode may help you understand what went wrong during Overcloud or Undercloud deployment. Deployment logs are generated when the **\--log** option is used, for example, inside the **overcloud_deploy.sh** script; the problem is that such logs are not "friendly," and it's hard to understand what went wrong, especially when verbosity is set to **vv** or more, as this makes the log unreadable with a bunch of data inside it. This mode provides some details about all failed tasks.

#### 11\. Analyze Gerrit(Zuul) failed gate logs

This mode is used to analyze Gerrit(Zuul) log files. It automatically downloads all files from a remote Gerrit gate (HTTP download) and analyzes all files locally.

### Installation

LogTool is available on GitHub. Clone it to your Undercloud host with:


```
`git clone https://github.com/zahlabut/LogTool.git`
```

Some external Python modules are also used by the tool:

#### Paramiko

This SSH module is usually installed on Undercloud by default. Use the following command to verify whether it's installed:


```
`ls -a /usr/lib/python2.7/site-packages | grep paramiko`
```

If you need to install the module, on your Undercloud, execute the following commands:


```
sudo easy_install pip
sudo pip install paramiko==2.1.1
```

#### BeautifulSoup

This HTML parser module is used only in modes where log files are downloaded using HTTP. It's used to parse the Artifacts HTML page to get all of the links in it. To install BeautifulSoup, enter this command:


```
`pip install beautifulsoup4`
```

You can also use the [requirements.txt][6] file to install all the required modules by executing:


```
`pip install -r requirements.txt`
```

### Configuration

All required parameters are set directly inside the **PyTool.py** script. The defaults are:


```
overcloud_logs_dir = '/var/log/containers'
overcloud_ssh_user = 'heat-admin'
overcloud_ssh_key = '/home/stack/.ssh/id_rsa'
undercloud_logs_dir ='/var/log/containers'
source_rc_file_path='/home/stack/'
```

### Usage

This tool is interactive, so to start it, just enter:


```
cd LogTool
python PyTool.py
```

### Troubleshooting LogTool

Two log files are created on runtime: Error.log and Runtime.log*.* Please add the contents of both in the description of the issue you'd like to open.

### Limitations

LogTool is hardcoded to handle files up to 500 MB.

### LogTool_Python3 script

Get it at [github.com/zahlabut/LogTool][2]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/logtool-root-cause-identification

作者：[Arkady Shtempler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ashtempl
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://github.com/zahlabut/LogTool
[3]: https://github.com/zahlabut/LogTool/tree/master/LogTool_Python2
[4]: https://github.com/zahlabut/LogTool/tree/master/LogTool_Python3
[5]: https://opensource.com/article/19/2/getting-started-cat-command
[6]: https://github.com/zahlabut/LogTool/blob/master/LogTool_Python3/requirements.txt
