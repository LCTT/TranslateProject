在 Kali Linux 的 Wireshark 中过滤数据包
==================

### 介绍

数据包过滤可让你专注于你感兴趣的确定数据集。如你所见，Wireshark 默认会抓取_所有_数据包。这可能会妨碍你寻找具体的数据。 Wireshark 提供了两个功能强大的过滤工​​具，让你简单而无痛地获得精确的数据。

Wireshark 可以通过两种方式过滤数据包。它可以通过只收集某些数据包来过滤，或者在抓取数据包后进行过滤。当然，这些可以彼此结合使用，并且它们各自的用处取决于收集的数据和信息的多少。

### 布尔表达式和比较运算符

Wireshark 有很多很棒的内置过滤器。当开始输入任何一个过滤器字段时，你将看到它们会自动补完。这些过滤器大多数对应于用户对数据包的常见分组方式，比如仅过滤 HTTP 请求就是一个很好的例子。

对于其他的，Wireshark 使用布尔表达式和/或比较运算符。如果你曾经做过任何编程，你应该熟悉布尔表达式。他们是使用 `and`、`or`、`not` 来验证声明或表达式的真假。比较运算符要简单得多，它们只是确定两件或更多件事情是否彼此相等、大于或小于。

### 过滤抓包

在深入自定义抓包过滤器之前，请先查看 Wireshark 已经内置的内容。单击顶部菜单上的 “Capture” 选项卡，然后点击 “Options”。可用接口下面是可以编写抓包过滤器的行。直接移到左边一个标有 “Capture Filter” 的按钮上。点击它，你将看到一个新的对话框，其中包含内置的抓包过滤器列表。看看里面有些什么。

![Wireshark dialog for creating a capture filter](https://linuxconfig.org/images/wireshark-capture-filter.jpg)

在对话框的底部，有一个用于创建并保存抓包过滤器的表单。按左边的 “New” 按钮。它将创建一个填充有默认数据的新的抓包过滤器。要保存新的过滤器，只需将实际需要的名称和表达式替换原来的默认值，然后单击“Ok”。过滤器将被保存并应用。使用此工具，你可以编写并保存多个不同的过滤器，以便它们将来可以再次使用。

抓包有自己的过滤语法。对于比较，它不使用等于号，并使用 `>` 和 `<` 来用于大于或小于。对于布尔值来说，它使用 `and`、`or` 和 `not`。

例如，如果你只想监听 80 端口的流量，你可以使用这样的表达式：`port 80`。如果你只想从特定的 IP 监听端口 80，你可以使用 `port 80 and host 192.168.1.20`。如你所见，抓包过滤器有特定的关键字。这些关键字用于告诉 Wireshark 如何监控数据包以及哪一个数据是要找的。例如，`host` 用于查看来自 IP 的所有流量。`src` 用于查看源自该 IP 的流量。与之相反，`dst` 只监听目标到这个 IP 的流量。要查看一组 IP 或网络上的流量，请使用 `net`。

### 过滤结果

界面的底部菜单栏是专门用于过滤结果的菜单栏。此过滤器不会更改 Wireshark 收集的数据，它只允许你更轻松地对其进行排序。有一个文本字段用于输入新的过滤器表达式，并带有一个下拉箭头以查看以前输入的过滤器。旁边是一个标为 “Expression” 的按钮，另外还有一些用于清除和保存当前表达式的按钮。

点击 “Expression” 按钮。你将看到一个小窗口，其中包含多个选项。左边一栏有大量的条目，每个都有附加的折叠子列表。你可以用这些来过滤所有不同的协议、字段和信息。你不可能看完所有，所以最好是大概看下。你应该注意到了一些熟悉的选项，如 HTTP、SSL 和 TCP。

![Wireshark dailog for creating a results filter](https://linuxconfig.org/images/wireshark-results-filter.jpg)

子列表包含可以过滤的不同部分和请求方法。你可以看到通过 GET 和 POST 请求过滤 HTTP 请求。

你还可以在中间看到运算符列表。通过从每列中选择条目，你可以使用此窗口创建过滤器，而不用记住 Wireshark 可以过滤的每个条目。对于过滤结果，比较运算符使用一组特定的符号。 `==` 用于确定是否相等。`>` 用于确定一件东西是否大于另一个东西，`<` 找出是否小一些。 `>=` 和 `<=` 分别用于大于等于和小于等于。它们可用于确定数据包是否包含正确的值或按大小过滤。使用 `==` 仅过滤 HTTP GET 请求的示例如下：`http.request.method == "GET"`。

布尔运算符基于多个条件将小的表达式串到一起。不像是抓包所使用的单词，它使用三个基本的符号来做到这一点。`&&` 代表 “与”。当使用时，`&&` 两边的两个语句都必须为真值才行，以便 Wireshark 来过滤这些包。`||` 表示 “或”。只要两个表达式任何一个为真值，它就会被过滤。如果你正在查找所有的 GET 和 POST 请求，你可以这样使用 `||`：`(http.request.method == "GET") || (http.request.method == "POST")`。`!` 是 “非” 运算符。它会寻找除了指定的东西之外的所有东西。例如，`!http` 将展示除了 HTTP 请求之外的所有东西。

### 总结思考

过滤 Wireshark 可以让你有效监控网络流量。熟悉可以使用的选项并习惯你可以创建过滤器的强大表达式需要一些时间。然而一旦你学会了，你将能够快速收集和查找你要的网络数据，而无需梳理长长的数据包或进行大量的工作。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux

作者：[Nick Congleton][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux
[1]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h1-introduction
[2]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h2-boolean-expressions-and-comparison-operators
[3]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h3-filtering-capture
[4]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h4-filtering-results
[5]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h5-closing-thoughts
