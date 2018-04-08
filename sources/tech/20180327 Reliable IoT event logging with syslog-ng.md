Reliable IoT event logging with syslog-ng
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab)
For any device connected to the internet or a network, it's essential that you log events so you know what the device is doing and can address any potential problems. Increasingly those devices include Internet of Things (IoT) devices and embedded systems.

One monitoring tool to consider is the open source [syslog-ng][1] application, an enhanced logging daemon with a focus on portability and central log collection. It collects logs from many different sources, processes and filters them, and stores or routes them for further analysis. Most of syslog-ng is written in efficient and highly portable C code. It's suitable for a wide range of scenarios, whether you need something simple enough to run with a really small footprint on underpowered devices or a solution powerful enough to reside in your data center and collect logs from tens of thousands of devices.

You probably noticed the abundance of buzzwords I wrote in that single paragraph. To clarify what this all means, let's go over them, but this time slower and in more depth.

### Logging

First things first. Logging is the recording of events on a computer. On a typical Linux machine, you can find these log messages in the `/var/log` directory. For example, if you log into your machine through SSH, you will find a message similar to this in one of the files:

`Jan 14 11:38:48 ``linux``-0jbu sshd[7716]: Accepted ``publickey`` for root from 127.0.0.1 port 48806 ssh2`

It could be about your CPU running too hot, a document downloaded through HTTP, or just about anything one of your applications considers important.

### syslog-ng

As I wrote above, the syslog-ng application is an enhanced logging daemon with a focus on portability and central log collection. Daemon means syslog-ng is an application running continuously in the background; in this case, it's collecting log messages.

While Linux testing for many of today's applications is limited to x86_64 machines, syslog-ng also works on many BSD and commercial UNIX variants. What is even more important from the embedded/IoT standpoint is that it runs on many different CPU architectures, including 32- and 64-bit ARM, PowerPC, MIPS, and more. (Sometimes I learn about new architectures just by reading about how syslog-ng is used.)

Why is central collection of logs such a big deal? One reason is ease of use, as it creates a single place to check instead of tens or thousands of devices. Another reason is availability—you can check a device's log messages even if the device is unavailable for any reason. A third reason is security; when your device is hacked, checking the logs can uncover traces of the hack.

### Four roles of syslog-ng

Syslog-ng has four major roles: collecting, processing, filtering, and storing log messages.

**Collecting messages:** syslog-ng can collect from a wide variety of [platform-specific sources][2], like `/dev/log`, `journal`, or `sun-streams`. As a central log collector, it speaks both the legacy (`rfc3164`) and the new (`rfc5424`) syslog protocols and all their variants over User Datagram Protocol (UDP), TCP, and encrypted connections. You can also collect log messages (or any kind of text data) from pipes, sockets, files, and even application output.

**Processing log messages:** The possibilities here are almost endless. You can classify, normalize, and structure log messages with built-in parsers. You can even write your own parser in Python if none of the available parsers suits your needs. You can also enrich messages with geolocation data or additional fields based on the message content. Log messages can be reformatted to suit the requirements of the application processing the logs. You can also rewrite log messages—not to falsify messages, of course—for things such as anonymizing log messages as required by many compliance regulations.

**Filtering logs:** There are two main uses for filtering logs: To discard surplus log messages—like debug-level messages—to save on storage, and for log routing—making sure the right logs reach the right destinations. An example of the latter is forwarding all authentication-related messages to a security information and event management (SIEM) system.

**Storing messages:** Traditionally, files were saved locally or sent to a central syslog server; either way, they'd be sent to [flat files][3]. Over the years, syslog-ng began supporting SQL databases, and in the past few years Big Data destinations, including HDFS, Kafka, MongoDB, and Elasticsearch, were added to syslog-ng.

### Message formats

When you look at your log messages under the `/var/log` directory, you will see (like in the SSH message above) most are in the form:

`date + host name + application name + an almost complete English sentence`

Where each application event is described by a different sentence, creating a report based on this data is quite a painful job.

The solution to this mess is to use structured logging. In this case, events are represented as name-value pairs instead of freeform log messages. For example, an SSH login can be described by the application name, source IP address, username, authentication method, and so on.

You can take a structured approach for your log messages right from the beginning. When working with legacy log messages, you can use the different parsers in syslog-ng to turn unstructured (and some of the structured) message formats into name-value pairs. Once you have your logs available as name-value pairs, reporting, alerting, and simply finding the information you are looking for becomes a lot easier.

### Logging IoT

Let's start with a tricky question: Which version of syslog-ng is the most popular? Before you answer, consider these facts: The project started 20 years ago, Red Hat Enterprise Linux EPEL has version 3.5, and the current version is 3.14. When I ask this question during my presentations, the audience members usually suggest the one in their favorite Linux distribution. Surprisingly, the correct answer is version 1.6, almost 15 years old. That's because it is the version included in the Amazon Kindle e-book readers, so it's running on over 100 million devices worldwide. Another example of a consumer device running syslog-ng is the BMW i3 all-electric car.

The Kindle uses syslog-ng to collect all possible information about what the user is doing on the device. On the BMW, syslog-ng does very complex, content-based filtering of log messages, and most it likely records only the most important logs.

Networking and storage are other categories of devices that often use syslog-ng. Networking and storage are other categories of devices that often use syslog-ng. Some better known examples are the Turris Omnia open source Linux router and Synology NAS devices. In most cases, syslog-ng started out as a logging client on these devices, but in some cases it's evolved into a central logging server with a rich web interface.

You can find syslog-ng in industrial devices, as well. It runs on all real-time Linux devices from National Instruments doing measurements and automation. It is also used to collect logs from customer-developed applications. Configuration is done from the command line, but a nice GUI is available to browse the logs.

Finally, there are some large-scale projects, such as cars and airplanes, where syslog-ng runs on both the client and server side. The common theme here is that syslog-ng collects all log and metrics data, sends it to a central cluster of servers where logs are processed, and saves it to one of the supported Big Data destinations where it waits for further analysis.

### Overall benefits for IoT

There are several benefits of using syslog-ng in an IoT environment. First, it delivers high performance and reliable log collection. It also simplifies the architecture, as system and application logs and metrics data can be collected together. Third, it makes it easier to use data, as data is parsed and presented in a ready-to-use format. Finally, efficient routing and filtering by syslog-ng can significantly decrease processing load.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/logging-iot-events-syslog-ng

作者：[Peter Czanik][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/czanik
[1]:https://syslog-ng.com/open-source-log-management
[2]:https://syslog-ng.com/documents/html/syslog-ng-ose-latest-guides/en/syslog-ng-ose-guide-admin/html/sources.html
[3]:https://en.wikipedia.org/wiki/Flat_file_database
